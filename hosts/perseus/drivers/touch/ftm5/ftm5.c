#include <linux/module.h>
#include <linux/i2c.h>
#include <linux/interrupt.h>
#include <linux/input.h>
#include <linux/input/mt.h>
#include <linux/property.h>
#include <linux/delay.h>

#define FTM5_MAX_SLOTS		10
#define FIFO_CMD_READALL	0x86
#define FIFO_EVENT_SIZE		8
#define FIFO_DEPTH		32
#define FIFO_REMAINING_POS	7
#define FIFO_REMAINING_MASK	0x1F

#define EVT_ID_NOEVENT		0x00
#define EVT_ID_ENTER		0x13
#define EVT_ID_MOTION		0x23
#define EVT_ID_LEAVE		0x33

struct ftm5 {
	struct i2c_client *client;
	struct input_dev *input;
};

/* Read one 8-byte event from the FIFO (1-byte cmd + repeated-start read). */
static int ftm5_read_event(struct i2c_client *c, u8 *ev)
{
	u8 cmd = FIFO_CMD_READALL;
	struct i2c_msg m[2] = {
		{ .addr = c->addr, .flags = 0,        .len = 1,               .buf = &cmd },
		{ .addr = c->addr, .flags = I2C_M_RD, .len = FIFO_EVENT_SIZE, .buf = ev },
	};

	return i2c_transfer(c->adapter, m, 2) == 2 ? 0 : -EIO;
}

static void ftm5_report_event(struct ftm5 *ts, const u8 *e)
{
	struct input_dev *in = ts->input;
	int id = (e[1] & 0xF0) >> 4;
	int x, y;

	if (id >= FTM5_MAX_SLOTS)
		return;

	switch (e[0]) {
	case EVT_ID_ENTER:
	case EVT_ID_MOTION:
		x = ((e[3] & 0x0F) << 8) | e[2];
		y = ((int)e[4] << 4) | ((e[3] & 0xF0) >> 4);
		input_mt_slot(in, id);
		input_mt_report_slot_state(in, MT_TOOL_FINGER, true);
		input_report_abs(in, ABS_MT_POSITION_X, x);
		input_report_abs(in, ABS_MT_POSITION_Y, y);
		break;
	case EVT_ID_LEAVE:
		input_mt_slot(in, id);
		input_mt_report_slot_state(in, MT_TOOL_FINGER, false);
		break;
	default:
		break;	/* controller-ready / gesture / status: ignore */
	}
}

static irqreturn_t ftm5_irq(int irq, void *dev)
{
	struct ftm5 *ts = dev;
	u8 ev[FIFO_EVENT_SIZE];
	int i;

	for (i = 0; i < FIFO_DEPTH; i++) {
		if (ftm5_read_event(ts->client, ev) < 0)
			break;
		if (ev[0] == EVT_ID_NOEVENT)
			break;
		ftm5_report_event(ts, ev);
		if ((ev[FIFO_REMAINING_POS] & FIFO_REMAINING_MASK) == 0)
			break;
	}

	input_mt_sync_frame(ts->input);
	input_sync(ts->input);
	return IRQ_HANDLED;
}

/* SCAN_MODE=0xA0, ACTIVE=0x00, ACTIVE_MULTI_TOUCH=0x01 */
static int ftm5_enter_active(struct i2c_client *c)
{
	u8 cmd[3] = { 0xA0, 0x00, 0x01 };
	struct i2c_msg m = { .addr = c->addr, .flags = 0, .len = 3, .buf = cmd };

	return i2c_transfer(c->adapter, &m, 1) == 1 ? 0 : -EIO;
}

static int ftm5_probe(struct i2c_client *client)
{
	struct device *dev = &client->dev;
	struct ftm5 *ts;
	struct input_dev *in;
	u32 max_x = 1079, max_y = 2339;
	int err;

	ts = devm_kzalloc(dev, sizeof(*ts), GFP_KERNEL);
	if (!ts)
		return -ENOMEM;
	ts->client = client;

	device_property_read_u32(dev, "touchscreen-size-x", &max_x);
	device_property_read_u32(dev, "touchscreen-size-y", &max_y);

	in = devm_input_allocate_device(dev);
	if (!in)
		return -ENOMEM;
	ts->input = in;
	in->name = "ftm5";
	in->id.bustype = BUS_I2C;

	input_set_abs_params(in, ABS_MT_POSITION_X, 0, max_x, 0, 0);
	input_set_abs_params(in, ABS_MT_POSITION_Y, 0, max_y, 0, 0);
	err = input_mt_init_slots(in, FTM5_MAX_SLOTS, INPUT_MT_DIRECT);
	if (err)
		return err;

	err = input_register_device(in);
	if (err)
		return err;

	i2c_set_clientdata(client, ts);

	msleep(20);
	err = ftm5_enter_active(client);
	if (err)
		dev_warn(dev, "ftm5: active-mode command failed: %d\n", err);

	if (!client->irq) {
		dev_err(dev, "ftm5: no IRQ\n");
		return -EINVAL;
	}
	err = devm_request_threaded_irq(dev, client->irq, NULL, ftm5_irq,
					IRQF_ONESHOT, "ftm5", ts);
	if (err) {
		dev_err(dev, "ftm5: request_irq failed: %d\n", err);
		return err;
	}

	dev_info(dev, "ftm5: ready (irq=%d, %ux%u)\n", client->irq, max_x, max_y);
	return 0;
}

static const struct of_device_id ftm5_of_match[] = {
	{ .compatible = "st,fts" },
	{ }
};
MODULE_DEVICE_TABLE(of, ftm5_of_match);

static const struct i2c_device_id ftm5_id[] = {
	{ "ftm5", 0 },
	{ }
};
MODULE_DEVICE_TABLE(i2c, ftm5_id);

static struct i2c_driver ftm5_driver = {
	.driver = {
		.name = "ftm5",
		.of_match_table = ftm5_of_match,
	},
	.probe = ftm5_probe,
	.id_table = ftm5_id,
};
module_i2c_driver(ftm5_driver);

MODULE_DESCRIPTION("Minimal ST FTM5 touchscreen driver (perseus)");
MODULE_LICENSE("GPL");
