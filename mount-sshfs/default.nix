{
  stdenv,
  makeWrapper,
  sshfs,
  ...
}:
stdenv.mkDerivation {
  pname = "mount-sshfs";
  version = "0.1.0";
  src = ./src;
  buildInputs = [sshfs];
  nativeBuildInputs = [makeWrapper];
  installPhase = ''
    mkdir -p $out/bin
    install $src/mount-sshfs.sh $out/bin/mount-sshfs
    wrapProgram $out/bin/mount-sshfs
  '';
}
