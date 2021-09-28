{
  description = "A very basic rick roll";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";

  outputs = { self, nixpkgs }: {

    defaultPackage.x86_64-linux =
      with import nixpkgs { system = "x86_64-linux"; };

      pkgs.writeScriptBin "pycharm-fix" ''
        ${mpv}/bin/mpv https://youtu.be/dQw4w9WgXcQ --fs 
      '';

    defaultApp.x86_64-linux = {
      type = "app";
      program = "${self.defaultPackage.x86_64-linux}/bin/pycharm-fix";
    };

  };
}
