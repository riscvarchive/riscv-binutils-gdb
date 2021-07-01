target:
	pollentropy    a0
        getnoise    a0
        sm3p0   a0, a0
        sm3p1   a0, a0
        sha512sum0r    a0, a1, a2
        sha512sum1r    a0, a1, a2
        sha512sig0l    a0, a1, a2
        sha512sig0h    a0, a1, a2
        sha512sig1l    a0, a1, a2
        sha512sig1h    a0, a1, a2
        sm4ed   a0, a1, 2
        sm4ks   a0, a1, 2
        aes32esmi   a0, a1, a2, 2
        aes32esi    a0, a1, a2, 2
        aes32dsmi   a0, a1, a2, 2
        aes32dsi    a0, a1, a2, 2
        sha256sum0  a0, a0
        sha256sum1  a0, a0
        sha256sig0  a0, a0
        sha256sig1  a0, a0
