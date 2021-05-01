#!/bin/sh
# Headless mode - Default config.

../configure \
  --target-list=x86_64-softmmu \
  --static \
  --audio-drv-list="" \
  --enable-virtfs \
  --enable-vhost-vsock \
  --disable-slirp \
  --disable-tcg \
  --disable-tcg-interpreter  \
  --disable-containers --disable-gtk \
  --disable-capstone \
  --disable-avx2 \
  --disable-avx512f \
  --disable-replication \
  --disable-parallels \
  --disable-sheepdog \
  --disable-vvfat \
  --disable-qed \
  --disable-vdi \
  --disable-qcow1 \
  --disable-dmg \
  --disable-cloop \
  --disable-bochs \
  --disable-bzip2 \
  --disable-guest-agent \
  --disable-numa \
  --disable-vnc \
  --disable-live-block-migration \
  --without-default-devices