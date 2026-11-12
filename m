Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794459063;
	b=hLIzxNgXucbGplc3OZHr5QOEO4dVHyQDqKf2glqoukfEca0ykZbArYm28uQIDDl1oMrr
	 DXOzMZ2UN7Kb4C2mOFFCz7NHZdFjRhQqzdisbqyfj6Dh49sL44XMQfkGqYEY7yw9UIlXO
	 /8S9vOiZa6VgS4GMhEMXYUUIr/kohsnGjblyW0MkMJxjJY7HSg+24rLf2H2C1c3IB9Uo2
	 Tbv2a8iAheQaoCzzIvW6qBuCWs9nf7zRhHL21xPyuTbZFKeoH11xJU3tTxON/T6t9aFM9
	 Jt5DsHvpLEx7rv9sl9eZdN8zdh1drCx/QagNRNB60RZeAmSs402L6hQhgjel5Kqef+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=aCR4+4F4D0AC9cGsRZ13mMFu9/arHyThIEzuRiyV5r8=;
	b=LnJmFoi3BmjteEILba+O0/Wdc+bShMKkJAFAzlG6K4FmDywD3yjCXXK4VnLrbPy9j19K
	 R7Rh1s3QvEKepkDzSxs1GVoXENWLDJ1dLzfiO2Q5DjZKweaH/Cprjax4gh2vxnRTj9iyI
	 ZEBlIIsYVrCTup/IyjHcUH6x0llWxldOgjWqDpDWqApgyMMf+dtAELBv2n3OlKQcKORWi
	 Ecsn0Mj6WOm+CrpQVq342nSIXna51xK21IjlLfJif08k2NUKvmW0Qktre31inIev5AP4X
	 L83tyloW3Q2EgX6QT1ht/PTXYpCuYg3FOPKxiRbAmZ99JSpQB8XoKS9SJ4WPYKCDZiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fW5esMJC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B765D606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 04:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B765D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fW5esMJC
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so580006166b.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 20:51:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794459061; cv=none;
        d=google.com; s=arc-20260327;
        b=QaqWh7tyHg9WUGHew6csGTLmMU0eoTxFdWWuVuJdnXKs7awQ+l7edVUNqdeEF7mQVH
         68JVSnDQRlvA5bGTkuaXQoPZVa8UXmhhk0lzR9757+2FqGxyBfPib3U1cIuH700worTN
         AtIFHrmu0Go/0jNq0G65fYCVw/hrKmJmmoIAQBFKDAeQpZE2lDnKMib8m+ik1QMpJm+f
         DiJa48zkdsJ3g1dhZL4EhRXBsi2P0qbqsfx23Wh5FOW3O7Jhhws+lPBRC57C4CwuAz43
         Rg8kTTVm81z6VXtDb9Cy1voXDcl57KuJQKHtkfwa6v5HxSvKyeXc/YwR0RqQoOg2nYUF
         kBkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aCR4+4F4D0AC9cGsRZ13mMFu9/arHyThIEzuRiyV5r8=;
        fh=EHxm7QpXaTXPHbUcKm2SQkkoCE9UjyMGkH5PL3cfdQo=;
        b=FTh2gW0YoSMiEYfF/yn9JDvfOTUx+1xou3+ypkQojPsM7Rz/arUDARy5L0GIcxlkBn
         ssAN388OHRi8pIWw4DM2i4cTFZMnSB8r4KewBykNQ1tI4m2dVUkK5c6QnHG7SBec5huk
         rf2+Z5v1r1YBpkoIOFm9UZmpmODy42g7UeKN6xMG3EAhXpPrzs4v7jmfwg5hNRf3H4Vn
         FR5iNXhpehHHLd+I60+hlJqRYWjjItFiX+T1Uoh3jUDgH8KUmaVpdlnUrzv1hghlAuGv
         PlU/k1eT6elyB+0sJ2c83q3q0rAXRWrOE0oIkyACxJknjKbiBsWAe0UiXLaS9ptCEcbk
         RJgA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459061; x=1795063861; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aCR4+4F4D0AC9cGsRZ13mMFu9/arHyThIEzuRiyV5r8=;
        b=fW5esMJCqQAuS0qLdzU4cs3m/WsxcDV/kwl5PSXU8b4bzwHMSMVh0O04s4ygbo3Ius
         KgQrCPvo65FqU0ORCJ3szy6lyhF45waxv8xonIfR/opZdPkTmXfQ+z6r2CgsdEPFR+AN
         HKzST+0psSdWztmjuzwZjOtZIAH5ov3rUFUdgSWyil1KIUlBGd3MdVz6ltvqHb108kiR
         5Ju/Y57v2dm72fMRp6eL36bAKH4jAPSKnJCukE7XDjXjjf3Ey7Dp8v7vQxrxjPgrSFz6
         iXy2zGc+YpmQVeXB4H1j+d7lbxs0iDHlBb9LdfXX8hzMmTQgYDVo1WNNwYbMB28osJ28
         LHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459061; x=1795063861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aCR4+4F4D0AC9cGsRZ13mMFu9/arHyThIEzuRiyV5r8=;
        b=QBJ/sd+ipwMBdBmexlISxi2H/rAQWowc3muHCDrKSK+NCDzwIh4mN1b6+YKixBZ7mt
         ZmVFA7Bn/KSU/SSa+6DSvwmGmjFEmZ9P0g5QqVcpdrpSZxbeql4MhOhNY3YDNPysvjLV
         kjkJcx6MuseY3TzNSCb96ppVA9AOeOu4+055S3MsUv+Jicpb2bdPVc4IRxTEqM4na3JC
         RkUOzOwrt/eTY7hvLmWL4mLKTwM7xgTwgUQ/a0OkHBjuqY00wUitZrIHzwWNjJyPdpvE
         q4mV39YBnN5J0UyCaqKAFVmDILpzP64L9GqngCs0njTNOH2dRxrGz6a+ZsSYMD3FccGt
         CXiw==
X-Gm-Message-State: APuU4Z+WoTSCUirgAiDojsaRMJ45tpkNc+1jMcy8vaQQAFSvtP67LCuk
	djx+9IWpz7h/x7iWGRxME6CAEhdxX2LKQ+MDUHahn6ba1ijxkoKj60Ls42hP0taTlWxLqPqKyrC
	PiQJ5DBEudW8VDr8YtUGOMb83eQl8zSMRSw==
X-Gm-Gg: AYBFou3kQeuYBmOoSzx+V1Rx7czh0H8bZzlJ00DsTCj2eK1Qo0VImwJOxDsmBsN49Do
	8AHnlA65hSWUFohNklA1eAeBdLxjvx7uNnOPvw0I+aaUXTgOC+BQnh1q1OTprx2Q8Vri2l0bsDy
	/qfzvMM8/h4KCMmxaNcwecK3NfoJAF2Hqu91VxhkQzk6Hacs4xhss7c+tY6rqbT8Nd8zQfJbtx7
	Z6PT6SivlOHXrTf5/fmcXUWjOhVVS3ZxppFh6ytUQpteWPoMi9IKH7rqO6NLXjY3IIm6xh5g1Qm
	vK6jSBP1NGZ/6rrIlZ2UA2v+Q/RomKkbFMYjog6V0X5P2F/IGBubkFOHb5H48G8nm+6Vdo5Dtpv
	WNgBlBsjvbbNwzylDUu0USeJouJ+JP/YhiNgXgUgZU974XjCzbMLsDJ6efK0Ycx9XPFaY
X-Received: by 2002:a17:907:6c17:b0:c29:4915:83cb with SMTP id
 a640c23a62f3a-c5066d6947dmr397522366b.39.1794459060886; Wed, 11 Nov 2026
 20:51:00 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110041832.1730924-1-alistair.francis@wdc.com>
 <20261110041832.1730924-18-alistair.francis@wdc.com> <sashiko-outbox-206231@kernel.org>
In-Reply-To: <sashiko-outbox-206231@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 12 Nov 2026 14:50:34 +1000
X-Gm-Features: AclHuK-9VHicJV1Vi_F_TXRxI13n5FCeFli60f1unwNFJ7VY-Njj1MkgHyWgv9E
Message-ID: <CAKmqyKMa7p6hkD1_NrABuaxxv3c=MQ0cDMUcAcYbPjtfOmJ4gQ@mail.gmail.com>
Subject: Re: [PATCH v6 17/25] lib: rspdm: Support SPDM negotiate_algorithms
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org, linux-cxl@vger.kernel.org, ojeda@kernel.org, 
	gary@garyguo.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:42=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] lib: rspdm: build failure in update_response_algs() without
>   crypto Kconfigs
> - [Low] lib: rspdm: unreachable extended algorithm loops in
>   NegotiateAlgsRsp::validate()
> --
>
> commit 69781025c793b90efaa465da8436c6f48e861229
> Author: Alistair Francis <alistair.francis@wdc.com>
>
> lib: rspdm: Support SPDM negotiate_algorithms
>
> This commit adds support for the SPDM NEGOTIATE_ALGORITHMS command,
> including request construction, response validation, and algorithm state
> selection.
>
> > diff --git a/lib/rspdm/state.rs b/lib/rspdm/state.rs
> > index cb6a351fe6085..169d0d3fee9bd 100644
> > --- a/lib/rspdm/state.rs
> > +++ b/lib/rspdm/state.rs
> [ ... ]
> > @@ -265,4 +323,113 @@ pub(crate) fn get_capabilities(&mut self) -> Resu=
lt<(), Error> {
> >
> >          Ok(())
> >      }
> > +
> > +    fn update_response_algs(&mut self) -> Result<(), Error> {
> > +        match self.base_asym_alg {
> > +            #[cfg(CONFIG_CRYPTO_RSA)]
> > +            SPDM_ASYM_RSASSA_2048 =3D> {
> > +                self.sig_len =3D 256;
> > +                self.base_asym_enc =3D c"pkcs1";
> > +            }
> > +            #[cfg(CONFIG_CRYPTO_RSA)]
> > +            SPDM_ASYM_RSASSA_3072 =3D> {
> > +                self.sig_len =3D 384;
> > +                self.base_asym_enc =3D c"pkcs1";
> > +            }
> > +            #[cfg(CONFIG_CRYPTO_RSA)]
> > +            SPDM_ASYM_RSASSA_4096 =3D> {
> > +                self.sig_len =3D 512;
> > +                self.base_asym_enc =3D c"pkcs1";
> > +            }
> > +            #[cfg(CONFIG_CRYPTO_ECDSA)]
> > +            SPDM_ASYM_ECDSA_ECC_NIST_P256 =3D> {
> > +                self.sig_len =3D 64;
> > +                self.base_asym_enc =3D c"p1363";
> > +            }
> > +            #[cfg(CONFIG_CRYPTO_ECDSA)]
> > +            SPDM_ASYM_ECDSA_ECC_NIST_P384 =3D> {
> > +                self.sig_len =3D 96;
> > +                self.base_asym_enc =3D c"p1363";
> > +            }
> > +            #[cfg(CONFIG_CRYPTO_ECDSA)]
> > +            SPDM_ASYM_ECDSA_ECC_NIST_P521 =3D> {
> > +                self.sig_len =3D 132;
> > +                self.base_asym_enc =3D c"p1363";
> > +            }
> > +            _ =3D> {
> > +                dev_err!(&self.dev, "Unknown asym algorithm\n");
> > +                return Err(EPROTO);
> > +            }
> > +        }
> > +
> > +        let hash_name =3D match self.base_hash_alg {
> > +            #[cfg(CONFIG_CRYPTO_SHA256)]
> > +            SPDM_HASH_SHA_256 =3D> c"sha256",
> > +            #[cfg(CONFIG_CRYPTO_SHA512)]
> > +            SPDM_HASH_SHA_384 =3D> c"sha384",
> > +            #[cfg(CONFIG_CRYPTO_SHA512)]
> > +            SPDM_HASH_SHA_512 =3D> c"sha512",
> > +            _ =3D> {
> > +                dev_err!(&self.dev, "Unknown hash algorithm\n");
> > +                return Err(EPROTO);
> > +            }
> > +        };
> > +
> > +        self.crypto =3D Some(Shash::new(hash_name)?);
> > +
> > +        Ok(())
> > +    }
> > +
> > +    pub(crate) fn negotiate_algs(&mut self) -> Result<(), Error> {
> [ ... ]
> > +        self.base_asym_alg =3D response.base_asym_sel;
> > +        self.base_hash_alg =3D response.base_hash_sel;
> > +        self.meas_hash_alg =3D response.measurement_hash_algo;
> > +
> > +        if self.base_asym_alg & SPDM_ASYM_ALGOS =3D=3D 0 || self.base_=
hash_alg & SPDM_HASH_ALGOS =3D=3D 0 {
> > +            dev_err!(&self.dev, "No common supported algorithms\n");
> > +            return Err(EPROTO);
> > +        }
>
> [Severity: Medium]
> Does this fail to build when CONFIG_RSPDM=3Dy is enabled without any asym=
metric
> crypto option (CONFIG_CRYPTO_RSA and CONFIG_CRYPTO_ECDSA both disabled) o=
r
> without any hash option (CONFIG_CRYPTO_SHA256 and CONFIG_CRYPTO_SHA512 bo=
th
> disabled)?

Probably, but that would be an invalid option and probably should fail to b=
uild

Alistair

>
> When both options in either pair are disabled, the corresponding match in
> update_response_algs() collapses to the diverging wildcard arm alone, whi=
ch
> triggers rustc unreachable_code and unused_variables errors as well as
> clippy::match_single_binding.  In addition, SPDM_ASYM_ALGOS or
> SPDM_HASH_ALGOS evaluates to 0, so the bitmask check in negotiate_algs()
> triggers clippy::bad_bit_mask.
>
> > diff --git a/lib/rspdm/validator.rs b/lib/rspdm/validator.rs
> > index 66212f0faf5f1..335f2f43dc07c 100644
> > --- a/lib/rspdm/validator.rs
> > +++ b/lib/rspdm/validator.rs
> [ ... ]
> > +        // We currently never request extended algorithms or algorithm=
 structures
> > +        if header.param1 !=3D 0 || ext_asym_sel_count !=3D 0 || ext_ha=
sh_sel_count !=3D 0 {
> > +            dev_err!(
> > +                &context.dev,
> > +                "Responder selected unsupported extended algorithms\n"
> > +            );
> > +            return Err(EPROTO);
> > +        }
> > +
> > +        let mut offset =3D NEGOTIATE_ALGS_RSP_SZ;
> > +
> > +        let mut ext_asym =3D KVec::new();
> > +        for _ in 0..ext_asym_sel_count {
> > +            ext_asym.push(read_le32(offset)?, GFP_KERNEL)?;
> > +            offset +=3D mem::size_of::<u32>();
> > +        }
> > +
> > +        let mut ext_hash =3D KVec::new();
> > +        for _ in 0..ext_hash_sel_count {
> > +            ext_hash.push(read_le32(offset)?, GFP_KERNEL)?;
> > +            offset +=3D mem::size_of::<u32>();
> > +        }
> > +
> > +        let mut resp_alg_struct =3D KVec::new();
> > +        for _ in 0..header.param1 {
> > +            let alg_type =3D *unvalidated.get(offset).ok_or(EPROTO)?;
> > +            let alg_count =3D *unvalidated.get(offset + 1).ok_or(EPROT=
O)?;
> > +            let fixed_alg_count =3D (alg_count >> 4) as usize;
> > +            let ext_alg_count =3D (alg_count & 0xf) as usize;
> > +            offset +=3D 2;
> > +
> > +            let mut alg_supported =3D KVec::new();
> > +            alg_supported.extend_from_slice(
> > +                unvalidated
> > +                    .get(offset..offset + fixed_alg_count)
> > +                    .ok_or(EPROTO)?,
> > +                GFP_KERNEL,
> > +            )?;
> > +            offset +=3D fixed_alg_count;
> > +
> > +            let mut alg_external =3D KVec::new();
> > +            for _ in 0..ext_alg_count {
> > +                alg_external.push(read_le32(offset)?, GFP_KERNEL)?;
> > +                offset +=3D mem::size_of::<u32>();
> > +            }
> > +
> > +            resp_alg_struct.push(
> > +                RespAlgStruct {
> > +                    alg_type,
> > +                    alg_count,
> > +                    alg_supported,
> > +                    alg_external,
> > +                },
> > +                GFP_KERNEL,
> > +            )?;
> > +        }
>
> [Severity: Low]
> This isn't a bug, but since NegotiateAlgsRsp::validate() returns Err(EPRO=
TO)
> above whenever header.param1, ext_asym_sel_count, or ext_hash_sel_count i=
s
> non-zero, the three loops that follow can never execute (and duplicate th=
e
> parsing in SupportedAlgorithms::from_bytes()).
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110041832.17=
30924-1-alistair.francis@wdc.com?part=3D17
