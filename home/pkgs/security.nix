{ pkgs
, stable
, ...
}:
{
  home.packages = with pkgs; [
    clamtk                        # frontend for clamav
    stable.theharvester           # emails, subdomains etc
    #autopsy                      # forensic tool                BROKEN
    adalanche                     # AD visualizer
    chkrootkit                    # rootkit checker
    dcfldd                        # dd for forensics
    dc3dd                         # dd for forensics
    metasploit                    # tool
    nikto                         # tool
    john                          # password cracker
    hashcat                       # password cracker
    crunch                        # wordlist generator
    cewl                          # wordlist generator
    thc-hydra                     # net login cracker
    medusa                        # net login cracker
    #rainbowcrack                  # rainbow table gen
    ophcrack                      # win pass cracker
    crowbar                       # brute force tool
    fcrackzip                     # zip pass cracker
    johnny                        # tool
    openvas-scanner               # tool
    tcpdump                       # tool
    dhcpdump                      # tool
    nmap                          # network scanner
    over-veracrypt                # gui encryption
    sherlock                      # find accounts by username
    openssl                       # cli encryption
    sslscan                       # scan ssl
    dig                           # dns tool(ip of domain)
    exploitdb                     # exploit database
    cvemap                        # 
    sqlmap                        # sql injection tool

    #volatility                    # memory forensics
    pdf-parser
    regripper
    binwalk
    bulk_extractor
    capstone
    stegseek
    steghide

    gnupg
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

    (pkgs.python312Packages.python.withPackages (python-pkgs: with python-pkgs; [
      markdown
      setuptools
      requests
      patator                   # brute force tool
      paramiko
    ]))
  ];
  #TODO: 
  # package metagoofil
  # fix rainbowcrack unsupported platform
  # declare service for cloudfoxable
  # declare service for metasploitable
  # declare service for faction
  # to check https://github.com/NixOS/nixpkgs/issues/81418

}