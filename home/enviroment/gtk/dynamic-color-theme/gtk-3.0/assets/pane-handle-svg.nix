{ config, lib, pkgs, ... }:
{
  home.file.".themes/dynamic-color-theme/gtk-3.0/assets/pane-handle.svg".text = ''
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="33pt" height="75pt" viewBox="0 0 33 75" version="1.1">
<defs>
<filter id="alpha" filterUnits="objectBoundingBox" x="0%" y="0%" width="100%" height="100%">
  <feColorMatrix type="matrix" in="SourceGraphic" values="0 0 0 0 1 0 0 0 0 1 0 0 0 0 1 0 0 0 1 0"/>
</filter>
<image id="image9" width="33" height="75" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAABLCAYAAAD+i+5TAAAABmJLR0QA/wD/AP+gvaeTAAAATklEQVRoge3OIQ6AMBBE0YXUknIWPKfHcxYabAVqdTF17+lJ5kcAAAAAAAAAAEBExHLVus88OFt7hhFbKcfMiLf3e7RZZwb8JSKJSCLSBwPTCBHQfxYWAAAAAElFTkSuQmCC"/>
<mask id="mask0">
  <g filter="url(#alpha)">
<use xlink:href="#image9"/>
  </g>
</mask>
<clipPath id="clip1">
  <rect width="33" height="75"/>
</clipPath>
<g id="surface11" clip-path="url(#clip1)">
<path style=" stroke:none;fill-rule:nonzero;fill:#1b1c36;fill-opacity:1;" d="M 33.332031 66.667969 L 33.332031 75 L 0 75 L 0 66.667969 Z M 33.332031 66.667969 "/>
</g>
<image id="image17" width="33" height="75" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAABLCAYAAAD+i+5TAAAABmJLR0QA/wD/AP+gvaeTAAAAYUlEQVRoge3OsQmAQBBFwVMPjCzCFizHzmzAcmzBEgyMDi4wMtZkQWQmXva/lAAAAABIzdr3Y+TAXMr+GDHkPEVGnLVuTzdtZMBbIm4ibp+IyEvXHZEDc62R7wEAAAD+4wLtUAvzrnEaRAAAAABJRU5ErkJggg=="/>
<mask id="mask1">
  <g filter="url(#alpha)">
<use xlink:href="#image17"/>
  </g>
</mask>
<clipPath id="clip2">
  <rect width="33" height="75"/>
</clipPath>
<g id="surface19" clip-path="url(#clip2)">
<path style=" stroke:none;fill-rule:nonzero;fill:#1b1c36;fill-opacity:1;" d="M 33.332031 33.332031 L 33.332031 41.667969 L 0 41.667969 L 0 33.332031 Z M 33.332031 33.332031 "/>
</g>
<image id="image25" width="33" height="75" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACEAAABLCAYAAAD+i+5TAAAABmJLR0QA/wD/AP+gvaeTAAAATUlEQVRoge3OIQ6AMBBFQUpqSTkLntPjOQsNtgK1GswaMqM3+19Zat2mRPcY59vNnBnwlYggIogI5WhtzRzYe78y/wMAAAAAAAAA8CcP/2EIET6xKgwAAAAASUVORK5CYII="/>
<mask id="mask2">
  <g filter="url(#alpha)">
<use xlink:href="#image25"/>
  </g>
</mask>
<clipPath id="clip3">
  <rect width="33" height="75"/>
</clipPath>
<g id="surface27" clip-path="url(#clip3)">
<path style=" stroke:none;fill-rule:nonzero;fill:#1b1c36;fill-opacity:1;" d="M 33.332031 0 L 33.332031 8.332031 L 0 8.332031 L 0 0 Z M 33.332031 0 "/>
</g>
</defs>
<g id="surface1">
<use xlink:href="#surface11" mask="url(#mask0)"/>
<use xlink:href="#surface19" mask="url(#mask1)"/>
<use xlink:href="#surface27" mask="url(#mask2)"/>
</g>
</svg>
  '';
}
