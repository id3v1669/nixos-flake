{ pkgs
, ...
}:
{
  home.packages = with pkgs; [
    wpscan                        # wordpress scanner
    volatility3                   # memory forensics
  ];
}