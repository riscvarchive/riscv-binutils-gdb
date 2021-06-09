#as: -march=rv64i_zkb_zknd_zkne_zknh_zkr_zksed_zksh
#source: k-ext-64.s
#objdump: -d

.*:[ 	]+file format .*


Disassembly of section .text:

0+000 <target>:
[ 	]+.*:[ 	]+.*[ 	]+csrr[ 	]+a0,mentropy
[ 	]+.*:[ 	]+.*[ 	]+csrr[ 	]+a0,mnoise
[ 	]+.*:[ 	]+.*[ 	]+sm3p0[ 	]+a0,a0
[ 	]+.*:[ 	]+.*[ 	]+sm3p1[ 	]+a0,a0
[ 	]+.*:[ 	]+.*[ 	]+sm4ed[ 	]+a0,a1,0x2
[ 	]+.*:[ 	]+.*[ 	]+sm4ks[ 	]+a0,a1,0x2
[ 	]+.*:[ 	]+.*[ 	]+sha256sum0[ 	]+a0,a0
[ 	]+.*:[ 	]+.*[ 	]+sha256sum1[ 	]+a0,a0
[ 	]+.*:[ 	]+.*[ 	]+sha256sig0[ 	]+a0,a0
[ 	]+.*:[ 	]+.*[ 	]+sha256sig1[ 	]+a0,a0
[ 	]+.*:[ 	]+.*[ 	]+aes64ks1i[ 	]+a0,a1,0x4
[ 	]+.*:[ 	]+.*[ 	]+aes64im[ 	]+a0,a0
[ 	]+.*:[ 	]+.*[ 	]+aes64ks2[ 	]+a0,a1,a2
[ 	]+.*:[ 	]+.*[ 	]+aes64esm[ 	]+a0,a1,a2
[ 	]+.*:[ 	]+.*[ 	]+aes64es[ 	]+a0,a1,a2
[ 	]+.*:[ 	]+.*[ 	]+aes64dsm[ 	]+a0,a1,a2
[ 	]+.*:[ 	]+.*[ 	]+aes64ds[ 	]+a0,a1,a2
[ 	]+.*:[ 	]+.*[ 	]+sha512sum0[ 	]+a0,a0
[ 	]+.*:[ 	]+.*[ 	]+sha512sum1[ 	]+a0,a0
[ 	]+.*:[ 	]+.*[ 	]+sha512sig0[ 	]+a0,a0
[ 	]+.*:[ 	]+.*[ 	]+sha512sig1[ 	]+a0,a0
