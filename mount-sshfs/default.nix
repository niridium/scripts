{
  lib,
  stdenv,
  makeWrapper,
  sshfs,
  fuse,
  ...
}:
stdenv.mkDerivation {
  pname = "mount-sshfs";
  version = "0.1.0";
  src = ./src;
  buildInputs = [sshfs fuse];
  nativeBuildInputs = [makeWrapper];
  installPhase = ''
    mkdir -p $out/bin
    install $src/mount-sshfs.sh $out/bin/mount-sshfs
    wrapProgram $out/bin/mount-sshfs \
      --suffix PATH : ${lib.makeBinPath [sshfs fuse]};
  '';
}
