# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    i686-linux = "0qk79yyyyshjamh8vx8s9s81x9b0rn6kmfm8n9flhil32ns3b44l";
    x86_64-linux = "1sfwiax7hx2dag45r9vyki21237yri8ci5q3vsjnlrm0zq0dj217";
    armv6l-linux = "1xab89a6jz8ay23yprc6ga543qcyp1iqk9nkwn17ffxyibq3l094";
    armv7l-linux = "0bcpignz9898wx5mv88ar1xgc85gand16ac47l8yxjay5k450kjg";
    aarch64-linux = "0g5p1j0jqx45gnf5kxyqs0pc4b8iahmhf7drlxjvjk7pph4chd1z";
    x86_64-darwin = "1jixbd3ppv8hyhnw3krfsy0i85si5ic9c3dw29lg8qd5bwx8c7c7";
    aarch64-darwin = "19v8brlwn52z1vrg16c33990c6lgzhscp3n0k1rxazlszivx4v4z";
  };

  urlMap = {
    i686-linux = "https://github.com/nginx/nginx-prometheus-exporter/releases/download/v1.4.1/nginx-prometheus-exporter_1.4.1_linux_386.tar.gz";
    x86_64-linux = "https://github.com/nginx/nginx-prometheus-exporter/releases/download/v1.4.1/nginx-prometheus-exporter_1.4.1_linux_amd64.tar.gz";
    armv6l-linux = "https://github.com/nginx/nginx-prometheus-exporter/releases/download/v1.4.1/nginx-prometheus-exporter_1.4.1_linux_armv6.tar.gz";
    armv7l-linux = "https://github.com/nginx/nginx-prometheus-exporter/releases/download/v1.4.1/nginx-prometheus-exporter_1.4.1_linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/nginx/nginx-prometheus-exporter/releases/download/v1.4.1/nginx-prometheus-exporter_1.4.1_linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/nginx/nginx-prometheus-exporter/releases/download/v1.4.1/nginx-prometheus-exporter_1.4.1_darwin_amd64.tar.gz";
    aarch64-darwin = "https://github.com/nginx/nginx-prometheus-exporter/releases/download/v1.4.1/nginx-prometheus-exporter_1.4.1_darwin_arm64.tar.gz";
  };
in
stdenvNoCC.mkDerivation {
  pname = "nginx-prometheus-exporter";
  version = "1.4.1";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./nginx-prometheus-exporter $out/bin/nginx-prometheus-exporter
    installManPage ./manpages/nginx-prometheus-exporter.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "NGINX Prometheus Exporter for NGINX and NGINX Plus";
    homepage = "https://github.com/nginx/nginx-prometheus-exporter";
    license = lib.licenses.asl20;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv6l-linux"
      "armv7l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
