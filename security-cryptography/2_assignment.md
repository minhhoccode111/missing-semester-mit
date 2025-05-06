# Cryptographic hash functions

**Cryptographic hash functions.** Download a Debian image from a
[mirror](https://www.debian.org/CD/http-ftp/) (e.g. [from this Argentinean
mirror](http://debian.xfree.com.ar/debian-cd/current/amd64/iso-cd/)).
Cross-check the hash (e.g. using the `sha256sum` command) with the hash
retrieved from the official Debian site (e.g. [this
file](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/SHA256SUMS)
hosted at `debian.org`, if you've downloaded the linked file from the
Argentinean mirror).

Hash retrieved from the [official Arch site](https://archlinux.org/releng/releases/2025.04.01/)

```bash
SHA256:
1155af9c142387c45eb6fbdbf32f5652fb514ce15a4d17a83e6056a996895026
```

The one I downloaded <https://mirrors.huongnguyen.dev/arch/iso/2025.05.01/> and
check with `sha256sum`

```bash
$ sha256sum archlinux-2025.04.01-x86_64.iso
1155af9c142387c45eb6fbdbf32f5652fb514ce15a4d17a83e6056a996895026  archlinux-2025.04.01-x86_64.iso
```
