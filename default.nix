{
  buildGoModule,
}:

buildGoModule {
  pname = "lazydocker";
  version = "unversioned";

  src = ./.;

  vendorHash = null;

  postPatch = ''
    rm -f pkg/config/app_config_test.go
  '';
}
