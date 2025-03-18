{
  pkgs,
  stable,
  ...
}: {
  imports = [
    #./security-unfree.nix
  ];
  home.packages = with stable; [
    clamtk # frontend for clamav
    theharvester # emails, subdomains etc
    #autopsy                      # forensic tool                BROKEN
    adalanche # AD visualizer
    chkrootkit # rootkit checker
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
    binwalk
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
    sleuthkit

    gobuster # scanner web
    dirb # scanner web
    gdb # debugger

    retdec # decompiler
    ghidra # decompiler
    snowman # decompiler
    wireguard-tools # wireguard tools for experiments with vpn

    #rainbowcrack                 # rainbow tables gen Propritary and unsupported platform(mistake in nixpkgs)

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
  # declare service for cloudfoxable
  # declare service for metasploitable
  # declare service for faction
  # to check https://github.com/NixOS/nixpkgs/issues/81418
}
