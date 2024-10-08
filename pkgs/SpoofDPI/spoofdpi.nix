{
  buildGoModule,
  fetchFromGitHub,
  lib,
}:

buildGoModule rec {
  pname = "spoofdpi";
  version = "0.12.0";

  src = fetchFromGitHub {
    owner = "xvzc";
    repo = "SpoofDPI";
    rev = "v${version}";
    hash = "sha256-m4fhFhZLuWT1diDlDTmTsNrckKTjhEZbhciv44FZcro=";
  };

  vendorHash = "sha256-47Gt5SI6VXq4+1T0LxFvQoYNk+JqTt3DonDXLfmFBzw=";

  meta = with lib; {
    description = "A simple and fast anti-censorship tool written in Go.";
    homepage = "https://github.com/xvzc/SpoofDPI";
    license = licenses.asl20;
    platforms = platforms.all;
    # maintainers = [ maintainers.rob ];
  };
}
