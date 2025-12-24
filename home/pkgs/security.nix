{
  pkgs,
  stable,
  ...
}: {
  imports = [
    ./security-unfree.nix
  ];
  home.packages = with pkgs; [
    clamtk # frontend for clamav
    theharvester # emails, subdomains etc
    autopsy # forensic tool
    sleuthkit
    adalanche # AD visualizer
    dcfldd # dd for forensics
    dc3dd # dd for forensics
    metasploit # tool
    nikto # tool
    john # password cracker
    hashcat # password cracker
    crunch # wordlist generator
    cewl # wordlist generator
    thc-hydra # net login cracker
    medusa # net login cracker
    ophcrack # win pass cracker
    crowbar # brute force tool
    fcrackzip # zip pass cracker
    johnny # tool
    openvas-scanner # tool
    tcpdump # tool
    dhcpdump # tool
    nmap # network scanner
    rustscan # network scanner nmap alternative
    sherlock # find accounts by username
    openssl # cli encryption
    sslscan # scan ssl
    dig # dns tool(ip of domain)
    exploitdb # exploit database
    cvemap #
    sqlmap # sql injection tool
    netcat-gnu # network tool
    pdf-parser
    regripper
    binwalk # analyze binary blobs and executables
    bulk_extractor
    capstone
    stegseek
    steghide

    ent
    truecrack
    pdfcrack
    cryptsetup
    foremost
    scalpel

    gobuster # scanner web
    dirb # scanner web
    gdb # debugger

    stable.retdec # decompiler
    ghidra # decompiler
    stable.snowman # decompiler
    wireguard-tools # wireguard tools for experiments with vpn

    aircrack-ng # wifi tool
    arping # arp tool
    bettercap # mitm tool
    certgraph # ssl certificate graph crawler
    deepsecrets # find secrets in code
    dnsenum # dns enumeration
    enum4linux-ng # enumerate info from windows/samba
    ghorg # mass clone git repos

    hcxtools # wifi capture and convert to hashcat/john
    hcxdumptool # capture packets from wifi
    ldapnomnom # ldap user brute force
    msldapdump # ldap enumeration
    onesixtyone # snmp scanner
    p0f # passive os fingerprinting
    iaito # gui for radare2
    radare2 # reverse engineering framework
    testssl # ssl checker
    wifite2 # wifi network auditor
    zap # web app penetration testing

    evtx # windows event log parser
    jq # useful to parse json
    bc # GNU calculator
    parallel-full # run tasks in parallel for cli

    multipath-tools #Tools for the Linux multipathing storage driver
    ddrescue
    ddrescueview
    extundelete
    ext4magic
    testdisk-qt

    # (pkgs.python312Packages.python.withPackages (python-pkgs: with python-pkgs; [
    #   markdown
    #   setuptools
    #   requests
    #   patator                     # brute force tool
    #   paramiko
    # ]))
  ];
  #TODO:
  # package metagoofil
  # fix rainbowcrack unsupported platform
  # declare service for cloudfoxableе
  # declare service for metasploitable
  # declare service for faction
  # to check https://github.com/NixOS/nixpkgs/issues/81418
}
