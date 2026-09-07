local cutils = require("common-utils")
local bose_address = "AC:BF:71:86:FD:B0"

local function is_bose(device)
  return device.properties["api.bluez5.address"] == bose_address
end

local function is_a2dp(profile)
  return profile and profile.name and profile.name:match("^a2dp%-") ~= nil
end

SimpleEventHook {
  name = "custom/bose-select-profile",
  after = { "device/find-calling-profile", "device/find-stored-profile",
    "device/find-preferred-profile", "device/find-best-profile" },
  before = "device/apply-profile",
  interests = { EventInterest { Constraint { "event.type", "=", "select-profile" } } },
  execute = function(event)
    local device = event:get_subject()
    if not is_bose(device) then return end

    local selected = event:get_data("selected-profile")
    if is_a2dp(selected) and selected.available ~= "no" then return end
    if selected and selected.name == "off" then return end

    local best, off
    for p in device:iterate_params("EnumProfile") do
      local profile = cutils.parseParam(p, "EnumProfile")
      if profile then
        if profile.name == "off" then off = profile end
        if is_a2dp(profile) and profile.available ~= "no" and
            (not best or (profile.priority or 0) > (best.priority or 0)) then
          best = profile
        end
      end
    end
    event:set_data("selected-profile", best or off or {name = "off", index = 0})
  end,
}:register()

SimpleEventHook {
  name = "custom/bose-restore-a2dp",
  interests = { EventInterest {
    Constraint { "event.type", "=", "device-params-changed" },
    Constraint { "event.subject.param-id", "=", "Profile" },
  } },
  execute = function(event)
    local device = event:get_subject()
    if not is_bose(device) then return end
    for p in device:iterate_params("Profile") do
      local profile = cutils.parseParam(p, "Profile")
      if profile and profile.name ~= "off" and not is_a2dp(profile) then
        event:get_source():call("push-event", "select-profile", device, nil)
        return
      end
    end
  end,
}:register()

SimpleEventHook {
  name = "custom/bose-block-loopback",
  before = "monitor/bluez/create-loopback-node",
  interests = { EventInterest {
    Constraint { "event.type", "=", "create-bluez-device-loopback-node" },
  } },
  execute = function(event)
    if is_bose(event:get_subject()) then event:stop_processing() end
  end,
}:register()

SimpleEventHook {
  name = "custom/bose-block-headset-node",
  before = { "monitor/bluez/create-offload-node", "monitor/bluez/create-set-node",
    "monitor/bluez/create-node" },
  interests = { EventInterest {
    Constraint { "event.type", "=", "create-bluez-device-node" },
  } },
  execute = function(event)
    if not is_bose(event:get_subject()) then return end
    local factory = event:get_data("factory") or ""
    if factory:find(".sco.", 1, true) or factory:find(".source", 1, true) then
      event:stop_processing()
    end
  end,
}:register()
