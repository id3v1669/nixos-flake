{ lib
, desk
, config
, pkgs
, uservars
, ... 
}:
let
  srv = (desk != "server"); 
in
{
  boot = {
    kernelModules = [ "tcp_bbr" ];
    kernel.sysctl = {
      # Restrict loading TTY line disciplines to the CAP_SYS_MODULE capability
      # to prevent unprivileged attackers from loading vulnerable line 
      # disciplines with the TIOCSETD ioctl
      "dev.tty.ldisc_autoload" = 0;

      ## Kernel hardening
      # Disable it, due to veries security issues and lack of use in my case.
      "kernel.sysrq" = 0;
      # Force kernel pointers printed using %pK to be replaced with 0’s regardless of privileges.
      "kernel.kptr_restrict" = 2;
      # Restrict the kernel log to the CAP_SYSLOG capability
      "kernel.dmesg_restrict" = 1;

      ## User hardening
      # Restrict this syscall to the CAP_SYS_PTRACE capability
      "vm.unprivileged_userfaultfd" = 0;

      ## Network hardening
      # Prevent bogus ICMP errors from filling up logs.
      "net.ipv4.icmp_ignore_bogus_error_responses" = 1;
      # Protects against IP spoofing
      "net.ipv4.conf.default.rp_filter" = 1;
      "net.ipv4.conf.all.rp_filter" = 1;
      # Prevent potential MITM attacks
      "net.ipv4.conf.all.accept_source_route" = 0;
      "net.ipv4.conf.default.accept_source_route" = 0;
      "net.ipv6.conf.all.accept_source_route" = 0;
      "net.ipv6.conf.default.accept_source_route" = 0;
      # Disable ICMP redirect acceptance and sending to prevent MITM attacks
      "net.ipv4.conf.all.send_redirects" = 0;
      "net.ipv4.conf.default.send_redirects" = 0;
      "net.ipv4.conf.all.accept_redirects" = 0;
      "net.ipv4.conf.default.accept_redirects" = 0;
      "net.ipv4.conf.all.secure_redirects" = 0;
      "net.ipv4.conf.default.secure_redirects" = 0;
      "net.ipv6.conf.all.accept_redirects" = 0;
      "net.ipv6.conf.default.accept_redirects" = 0;
      # Protects against SYN flood attacks
      "net.ipv4.tcp_syncookies" = 1;
      # Incomplete protection again TIME-WAIT assassination
      "net.ipv4.tcp_rfc1337" = 1;
      # Ignore all ICMP requests to avoid Smurf attacks
      "net.ipv4.icmp_echo_ignore_all" = 1;
      # IPv6 router advertisements can cause MITM attacks
      "net.ipv6.conf.all.accept_ra" = 0;
      "net.ipv6.conf.default.accept_ra" = 0;
      # Disable TCP SACK due to many exploits and lack of use in my case
      "net.ipv4.tcp_sack" = 0;
      "net.ipv4.tcp_dsack" = 0;
      "net.ipv4.tcp_fack" = 0;

      ## TCP optimization
      # Reduce network latency by packing data in the sender’s initial TCP SYN.
      "net.ipv4.tcp_fastopen" = 3;
      # Bufferbloat mitigations + slight improvement in throughput & latency
      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.core.default_qdisc" = "cake";
    };
  };

  services.clamav = 
  let x = false; in {
    daemon.enable = x;
    fangfrisch.enable = x;
    scanner.enable = x;
    updater.enable = x;
  };
  programs.wireshark = {            # wireshark for network analysis
    enable = !srv;
    package = pkgs.wireshark;
  };
  users.users.${uservars.name}.extraGroups = [
  ] ++ lib.lists.optionals (!srv) [
    "wireshark"
  ];
}