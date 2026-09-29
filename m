Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DFE4FD29F
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675726; cv=none; b=oYIB0A6QZMUa38yBZM5WNGhBTAOYVRBvQszh84nBJShcP4Y78Tuf0J49GJbgB252YLBrNlhu8tN3SaT0HQeoJz5fEL6PQerGW3J/zbCpHdPyl2YOFUY8zKPwL7g7kis6GICxpV0WYY6LTc+bMn/xUvCgH0sUZZX76wYIbWtdCTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675726; c=relaxed/simple;
	bh=98UbK4N2251SUFmDgHu33sL9B1Db+PPtpfyBhOYbq2k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Vo5UFJEmQ95sAO91ASE7E3w5o0YTonKP/7oGrPpLiRr1EIEHlQh/nCJCk8lLNj6PKm1iLrLdw3fERtwoBR/dEDgWAPYVTbZyQkQXUtexnGA3XP2rvXUEIwfe8WZl6soderdt9eH6RX0fmyVqmXD87m2X3eunWQDDBHkQZNb1vj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=U5+5neBg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="U5+5neBg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so17465265e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 02:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790675720; x=1791280520; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pmauSvEG/mGV3JuTK5ds225WsQMQmw8wXcrzlAj8aGc=;
        b=U5+5neBgRUq8jrCkt7OUzf7shlk/GW1stpeMYTld/9ibvMfJagXBkyMjfQ+lm/7VPF
         PY6JdX2qUG/1qp2MUsWzh9nYvgQzm7QFifMcAiIyNppK1El7wnjbg5SXBbe6+w/GTt0U
         jnXwbCc+bFGfpdDyR34YFBcMT/RPKpXoiJAV0uSiYYUVr/fi458mypci+xFqD0i/FVki
         xL5+JDYsMgIgcU34m7+6hzw7ruU+wtGViYvkr9Z3Nv3cih8y2nfqYYya+4GLTGUR4EBP
         4dkIdip7Bx7YRlZiwqzL9lMAO9Ez/d6uyzU42bj5jYPzH6rJSkPJ1D3rsx2IHdv7v7M/
         z8xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675720; x=1791280520;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pmauSvEG/mGV3JuTK5ds225WsQMQmw8wXcrzlAj8aGc=;
        b=uJBfwAaBuE2/wAeEq8uxy2sRAAncC8bvKqVlaw2dt5jWGgzvyaCuCXRuZK4Ba2g80y
         R2cOWLDOMZ671hikerTiGee+cQ8K+bT0pgqIAx8UzpLz7NzOWSAITSN/2aTSJFpEAoMi
         VyYbiX4KzwXYgMEGeBSkXoM4wHLw3h7500tuCVgOSHbQ9IYnOCgA5oE8iQHGoN0wr3ir
         mwCTavR0SEcU8tCg7lHSUB2Ir9+XpJZRxJ/U4YutlF2RyW9Ybyet6JzyayFla5QRqdQ+
         DW1fRAnPLMeipsKrAj4tOcZUSEs1GaGC8IYEzuj77vDP2QgCAYO1Q/atKKuvJJRqxVza
         696A==
X-Forwarded-Encrypted: i=1; AKwUvBzUHcYh1Qe6sTwg02aB4fKGV8KRDKNahZxiYnscOamxTBLSK8hMb0oMK1aIELiLEbu8eV6kovKHPZjnopNFKhs=@lists.linux.dev
X-Gm-Message-State: AFuF++kM9tn2GL3ethU9KdjzAdvTJ7bFmgmjqs+EwX2R3CiZU3bTsFt9
	rPMG6X1ShOPp92uA1Gmw4zVKA/rQnsX8q/0Kq/b5FKdgg5PGUxrm7urCltjBrV6cgJo=
X-Gm-Gg: AYBFou1pn6Hh1XHJpO/2QyGZRQg8Fdcaej/x1sF9zrD72GhA+gc1hNMFFhGLmqXSaqZ
	57ktYD3cumSLAxLSAwwxP1KYShZAooZ+oX+Q54hg3bJqsLKlwWd8+V93zhEpo/GXTF2h097uVF1
	EKrOIFqFPUF5kmbJ/WCp+WGPY42CAIjz6sRChTZtsTqByyIEwE0b1QUUYRq+2zIRYre++2Nbvmb
	mBhPiyd9leWw5pj6GsPoLIMsFD2v5Nfy9BRUlyJY+m8jaTlKxsRN3FCQic0Y2fgtjFJHot9R0F4
	IxqVcoH8tssXfOmF9PlGId410epVG12yZDeezq4XFvdU2uNRh9IwTdgIXGWMLdo7YSxY2wFaQNW
	fOmuHaWrBiVfE7UseusVfDYmSCoZrb09zhKIXLcCAZ6peFt1rYCWllKjgHTkXgtQxoutQwvRfzd
	LDp5IEnziyMLNuLyzt6bNgfW5ffAXfKmrzzdS8efCTJnq0NrS83Ps4aKZ2v/r57Ogs
X-Received: by 2002:a05:600c:3550:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-49ffd408357mr138179665e9.34.1790675720029;
        Tue, 29 Sep 2026 02:55:20 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8223:c4e6:4d28:61c:74bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf2d973sm77824505e9.0.2026.09.29.02.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a51f3dada9c225cfc13250421c3f01b3dbfa553491d9b870147849dc99d6;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 29 Sep 2026 11:55:11 +0200
Message-Id: <DLRPK96Q063Q.20AXDX3LTN7R@baylibre.com>
Subject: Re: [PATCH v9 7/9] arm64: dts: ti: k3-am62a: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Nishanth Menon" <nm@ti.com>, <sashiko-reviews@lists.linux.dev>
Cc: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>, <robh@kernel.org>,
 <devicetree@vger.kernel.org>, <conor+dt@kernel.org>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260918-topic-am62a-ioddr-dt-v6-19-v9-0-40972ef1f663@baylibre.com> <20260918-topic-am62a-ioddr-dt-v6-19-v9-7-40972ef1f663@baylibre.com> <20260918094011.99AE01F000FF@smtp.kernel.org> <20260924145525.2g5ymuwsjwf5ecct@twice>
In-Reply-To: <20260924145525.2g5ymuwsjwf5ecct@twice>

--a51f3dada9c225cfc13250421c3f01b3dbfa553491d9b870147849dc99d6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Nishanth,

On Thu Sep 24, 2026 at 4:55 PM CEST, Nishanth Menon wrote:
> On 09:40-20260918, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 3 potential iss=
ue(s) to consider:
>> - [High] remoteproc: ti_k3: k3_rproc_da_to_va() rejects segments spannin=
g split memory regions
>> - [High] arm64: dts: ti: missing bootph-pre-ram breaks SPL DM firmware l=
oading
>> - [Medium] arm64: dts: ti: hardcoding volatile firmware layout into Devi=
ce Tree
>> --
>>=20
>> commit 33643294863f45f1ac37617eafcfc525d230effc
>> Author: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>>=20
>> arm64: dts: ti: k3-am62a: Split r5f memory region
>>=20
>> Split the firmware memory region in more specific parts so it is better
>> described where to find which information. Specifically the LPM metadata
>> region is important as bootloader software like U-Boot has to know where
>> that data is to be able to read that data.
>>=20
>> > diff --git a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi b/ar=
ch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
>> > index 06d4e815b1670..94c1d60d8d7a1 100644
>> > --- a/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
>> > +++ b/arch/arm64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi
>> > @@ -65,8 +65,14 @@ &wkup_r5fss0 {
>> >  &wkup_r5fss0_core0 {
>> >  	mboxes =3D <&mailbox0_cluster0>, <&mbox_r5_0>;
>> >  	memory-region =3D <&wkup_r5fss0_core0_dma_memory_region>,
>> > -			<&wkup_r5fss0_core0_memory_region>;
>> > -	memory-region-names =3D "dma", "firmware";
>> > +			<&wkup_r5fss0_core0_ipc_region>,
>> > +			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
>> > +			<&wkup_r5fss0_core0_lpm_metadata_region>,
>> > +			<&wkup_r5fss0_core0_lpm_rest_region>,
>> > +			<&wkup_r5fss0_core0_dm_region>;
>>=20
>> [Severity: High]
>> Does this multi-region split cause a regression when loading a monolithi=
c
>> firmware ELF whose segments span across the new chunk boundaries?
>>=20
>> Looking at k3_rproc_da_to_va() in drivers/remoteproc/ti_k3_common.c, it
>> evaluates segments against each reserved memory region individually and
>> lacks logic to aggregate sequential chunks:
>>=20
>> drivers/remoteproc/ti_k3_common.c:k3_rproc_da_to_va() {
>>     ...
>>     if (da >=3D dev_addr && ((da + len) <=3D (dev_addr + size))) {
>>         offset =3D da - dev_addr;
>>         va =3D kproc->rmem[i].cpu_addr + offset;
>>         return (__force void *)va;
>>     }
>>     ...
>> }
>>=20
>> Will this bounds check fail and abort the boot sequence for any system u=
sing
>> standard firmware linked under the assumption of a single contiguous mem=
ory
>> block?
>
>
> Do we need to protect with something on the lines of
> https://lore.kernel.org/all/20260921145325.300025-3-richard.genoud@bootli=
n.com/

No, we don't need to protect this here. The devicetree nodes changed
here are only ever loaded with firmware in the bootloader. A monolithic
firmware ELF is never loaded in Linux because the driver code in
k3_r5_rproc_configure_mode() detects that it is already running and puts
it in RPROC_DETACHED for these cores.

> Could you please add in diffstat any comments if the sashiko reviews
> are'nt accurate from previous feedback?

Sure, will do that in the future. Does sashiko pick these up then?

>
>>=20
>> > +	memory-region-names =3D "dma", "ipc", "lpm-stub",
>> > +			      "lpm-metadata", "lpm-context",
>> > +			      "dm-firmware";
>>=20
>> [ ... ]
>>=20
>> > diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boo=
t/dts/ti/k3-am62d2-evm.dts
>> > index a8c794d073431..7cba3ff99e6a3 100644
>> > --- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> > +++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
>> > @@ -65,13 +65,37 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c8000=
00 {
>> [ ... ]
>> > +		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
>> > +			compatible =3D "shared-dma-pool";
>> > +			reg =3D <0x00 0x9ca00000 0x00 0x8000>;
>> > +			no-map;
>> > +		};
>>=20
>> [Severity: Medium]
>> Does this create a regression by hardcoding a software-defined volatile
>> firmware layout directly into the Device Tree?
>>=20
>> If a subsequent firmware build increases the size of lpm_fs_stub beyond =
the
>> 32KB hardcoded here, will this crash or require a lockstep DT update to
>> function properly?
>>=20
>> > +
>> > +		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
>> > +			compatible =3D "shared-dma-pool";
>> > +			reg =3D <0x00 0x9ca08000 0x00 0x1000>;
>> >  			no-map;
>> >  			bootph-pre-ram;
>> >  		};
>> > =20
>> > +		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
>> > +			compatible =3D "shared-dma-pool";
>> > +			reg =3D <0x00 0x9ca09000 0x00 0x97000>;
>> > +			no-map;
>> > +		};
>> > +
>> > +		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
>> > +			compatible =3D "shared-dma-pool";
>> > +			reg =3D <0x00 0x9caa0000 0x00 0x1c60000>;
>> > +			no-map;
>> > +		};
>>=20
>> [Severity: High]
>> Does the omission of the bootph-pre-ram tag on this new DM region create=
 a
>> regression for SPL DM firmware loading?
>>=20
>> Since U-Boot fdtgrep processes the SPL DTB by keeping only nodes tagged
>> with bootph-pre-ram, these split regions will be stripped.
>>=20
>> Will this result in the no-map protections being lost, causing U-Boot's
>> remoteproc driver to error out parsing dangling phandles when attempting
>> to load the Device Manager (DM) firmware?
>
> Is'nt this valid? why would we let R5 SPL or U-boot SPL think it has
> memory access? Adding a comment is probably worth in the code.

These bootph-pre-ram properties did not exist before this patch for
nearly all memory regions. R5 SPL or SPL u-boot does not care about
these memory regions. It is all configured through Kconfig options or
binman. Only the upcoming IO+DDR resume code cares about just a specific
region. I personally would prefer to keep the DT as small as possible
for SPL.

Best
Markus

--a51f3dada9c225cfc13250421c3f01b3dbfa553491d9b870147849dc99d6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaruK/xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPs
KwD+J2JQBCaUypBZe46jJO6/EE5+ULM609YmlMKERfB0TWUA/0xrll/BHTIAPhpr
dU3ZW9kGp9DMDVu0bFD91Jzuo8YD
=0LaM
-----END PGP SIGNATURE-----

--a51f3dada9c225cfc13250421c3f01b3dbfa553491d9b870147849dc99d6--
