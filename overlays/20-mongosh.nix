self: super: with super; {

  mongosh = let
    version = "1.10.6";
    pname = "mongosh";
  in stdenv.mkDerivation {
    name = "${pname}-${version}";

    src = fetchzip {
      url = "https://downloads.mongodb.com/compass/mongosh-${version}-darwin-arm64.zip";
      sha256 = "sha256-6iQr6kEw3voY42ccea8akFtD6/DyRU9dsPaj/5KUDK4=";
    };

    phases = [ "installPhase" ];

    installPhase = ''
      mkdir -p $out/bin
      cp $src/bin/mongosh $out/bin/
    '';

    meta = with lib; {
      homepage = "https://www.mongodb.com/docs/mongodb-shell/";
      description = "MongoDB Shell";
      license = licenses.asl20;
      platforms = [ "aarch64-darwin" ];
    };
  };
}
