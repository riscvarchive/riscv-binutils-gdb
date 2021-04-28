target:
        pollentropy    a0
        getnoise    a0
        sm3p0   a0, a0
        sm3p1   a0, a0
        sm4ed   a0, a1, 2
        sm4ks   a0, a1, 2
        sha256sum0  a0, a0
        sha256sum1  a0, a0
        sha256sig0  a0, a0
        sha256sig1  a0, a0
        aes64ks1i   a0, a1, 4
        aes64im     a0, a0
        aes64ks2    a0, a1, a2
        aes64esm    a0, a1, a2
        aes64es     a0, a1, a2
        aes64dsm    a0, a1, a2
        aes64ds     a0, a1, a2
        sha512sum0  a0, a0
        sha512sum1  a0, a0
        sha512sig0  a0, a0
        sha512sig1  a0, a0
