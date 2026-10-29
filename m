Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793238612;
	b=Rr32hVi+4I61Gr43iWhT18bAXGmKpvz/gGgGiRVnDdWB4idVOkN5oR71HyuuB7Bq2sSb
	 izWBMXPw2McikBupUvhetnlh1M6sGrjii4vPTUEpHudBTEttnbFUPL6W9pkjqoDEEzV2Y
	 Xb6Rxktw5mhuCu8Nc1yc2qAcsjJvPt0fzx+5kvMWzvkJYC8T4TFs7NocW4FRO2AKgHRYr
	 EM1rWeZ9+2i5PuvaxVejGhrjQoeR2HG/zmARWMvEExJpPIHSngtv6j6Vjl9QKcJjAr1mE
	 fOFtusR8y3IeQZNblBgK6PBjAm+++tzMmMDhEcIn7rGC03DE21zULtC27qHFU8nlLxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=1IGTvqOaIXaosXRusH+LH79qQVRmzVc9OzbNy7vNHrs=;
	b=jnDrHyGYAlYAF7B+k6K0DZaTz04vkbDfP/d3+huyaAmwWNVWqYt2TgNcSqTpVfGe3py1
	 GPmTFudNYT3qVXIg4E5Nnoc89fEXrrHeZ7wvWAGjVWJONZjM9YRhDR9+ruRjjMdelUC32
	 7YaEPdSh0GtAfybC5bUdVMFdreT32cNvzXnhspJ6ZVOQi6Ue44nMLn6sbZAWKzHJHQ4uq
	 mNVlrLY/gEruYL9mwFdZstV+c5PPCNM1PGe4Q+zcHIr/ljX6vF2gh56v8f62zjsaeDNe+
	 /kWyBYSzh6Qdu2ME8i0WE80OFHRVA54+Jyjmews5bZCxKmjJeh7jF6Ht4cypGnMn/0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="C/7joOSO";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4120F606A330
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 01:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4120F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C/7joOSO
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8ad98c3fb15so14883257b3.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 18:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793238611; cv=none;
        d=google.com; s=arc-20260327;
        b=pxSaZHmLzlP6vIYZhkM3bQsfnqnOFYcE+rQopLxQVgXnUqCi7TPTmM2nHFkZKG8vjC
         HFSneQ44CKxNPo4zOMqidpc0I6b/VTyXxq9BO/PdxgFj5cyv0eUtL/+BWFttgQ13SlaG
         mekXb5l2ZLI5BGt3TWLNsCWRumjstpF8CBFVyeq9OtZ/WkGR8sqE/O8LesDlKVCcOlcL
         semclw78Q9csQ4g/bUBMqAPYlN00iXsoA/pPBZz2YrxVf8ETTmrqCcyOi/lpDmu98nS/
         PODasngSMJCEOltuOINkvr/UiAJ3JiXOCoSvkMaKi04fmBXV3TieSP2mihijUxbBecSo
         dXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1IGTvqOaIXaosXRusH+LH79qQVRmzVc9OzbNy7vNHrs=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=f1ueWlDIIKy6fuk+0GTzmtq9bGbhMaUODvmtiWSNXK5HWqQffu9f0kmtrpmHIIIzgM
         plgEH91M4RNHRhGiS4igi7YWezcBusxmUrVAZair4g8arqR55DhSsodamdllxiInwcwt
         mjK5ujFCOd4/aGXuGwgigK/kUGht4AfWyT0xtFFAgQ4wzF08/Aw9FkYHC2dzYQlBWTn0
         YWuzThKytu747nkEVbHHTmUNLK1pw+ikG4Vz7N3X3JxaaXMknliOVBUddqd9WENtWApe
         vloNpX3zg+1Jo68X+r7t0Vq0dzN8UF+ETq4cyYQ2NtC6Q2gE9Yly1aTvP12TGH+xq5UW
         QEZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793238611; x=1793843411; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1IGTvqOaIXaosXRusH+LH79qQVRmzVc9OzbNy7vNHrs=;
        b=C/7joOSOwTLVoJ1BBV4BeEIGDb0Vzniqij08F7uuJm6P+0lqoDthPLAyoTErRA30mx
         L1Xm3pY2P9gvpB6MHOn1cf/w3oQhYNEt2FwhpYoGqRXJ7Day5gxWAWJIsQdX7i4jIUOf
         D9lBX2EjQlrpQrpAwKJqelBABV7C7ayyZ9pAq5yovoM0iSKBWs1o/8TJQa1AMesu1sU0
         ktt851tL3tFOTcL4n4EeXEsv+tZ66LicSFE0BUTx5cJAVWhmRAtr4BS/mDn0R2YICdl+
         /BjuZrUSJFkP+GC2yqa3NMlpdTv2hltTLMAP/v/FARgPAIu7ecDDZPWM7cqrOFXFormD
         /OzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238611; x=1793843411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IGTvqOaIXaosXRusH+LH79qQVRmzVc9OzbNy7vNHrs=;
        b=NPnsmUuNdUYTEhUSbGRu2elGXR3NKwqKGa9Yivha5l2lNOAcTeDnTI2FU9BAS+duOj
         fJRud4hvGmRdEtolhRaKa7lIAVcQ5gDpSceLgvxJd22EnmvlbGNcAJJQ4JumiFu/FrX8
         AUTf4sAd1L6CJ/zYgHYFqnRh7LxT1hGqHBMbMRIvjf2HkYqEq1USxE/s4XIx2mnMrxzN
         MhuWfLYABVHtWg6XwWd+L6SHrP2Vbj83TFEB/xTUJWQ5B/r2At7Ihh0+jtt3I6J1Zc7G
         SNo8F2ImnRyC6C1JRV+erkvOATwjFpgfvRw8t3Y6Wg6x3kcYk6014HZ5/3huOtz9JuIa
         C/Sg==
X-Gm-Message-State: AFq9FYKlrqCKClVf+2Bu/8p62R6xhOcPEWyjwVv0BxMfpPD+1OvlXXnI
	61/GOw7M4iMnCVdQrWaNV1k1gxdBJYgXB58976FP8XTLjxpJNuck+7xt8+Fa5i0ZHfIRbzJr7Pa
	nPlgSXeIIqr3FXX8ety1tiZDY8xxA2/i3urnl
X-Gm-Gg: AYBFou1frbbnpXB2zp9AqW5BnFPBVqKsiAA10Yn8w7TSD0ucZIznsxWd+aSD5K09oY4
	l/z0BQ58kJGHhFOKrPhcjNyXLL2RetUw8WUQetYOiwD9UEDUvWFVd/F+aJKfcBJfZvyQxItHg0z
	OIqhP9HfqFeExlANueb7uUtwNd9GJE2sVbxcHhSLvnv0sJGMMqz8HjgBFK5MZooFXQ2l2e/IkGB
	AhP4jd3mlKtyas1mhIbgJU11THMuoamc7GnUDI6G41GqPw4TYFQxbaDT38TILnMF1QdCjsewdsQ
	enXpFnzJvT48hsGo14AWmsDF4P6c9UufTHffqwUbZZ0V6zTH+I1UK6ez8jM3M07+ELy3kvb6GSz
	UrxB1l5Ax1vfNWc0+Je56SuaUXjg1GQHnrpE+
X-Received: by 2002:a05:690c:38b:b0:8b0:c71d:2b2b with SMTP id
 00721157ae682-8b1b5d115f8mr38039877b3.45.1793238611233; Wed, 28 Oct 2026
 18:50:11 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
 <20261027034911.99482-3-prasanth.padarthi10@gmail.com> <sashiko-outbox-186061@kernel.org>
In-Reply-To: <sashiko-outbox-186061@kernel.org>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 29 Oct 2026 07:20:00 +0530
X-Gm-Features: AclHuK_4V4-6JjYI5xwd4wQKypfFHekosxQ467fFd16gHBxLUQfaqfsdhwDLghU
Message-ID: <CAMFFDGi-8hzS1xe3EyK2iiyz3VEbcdr-MMCbw5XODPna=OUj1w@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you for pointing this out.

The serial0 override was intentional in the tested local image:
UART5 is exposed as ttyS0, and the image's console/getty configuration
uses ttyS0.

However, the override leaves the inherited serial4 alias pointing
to the same UART. I will review the alias configuration and verify
the console setup before the next revision.

Regards,
Prasanth Kumar Padarthi

On Tue, Oct 27, 2026 at 9:26=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] ARM: dts: aspeed: b650d4u: serial0 alias on uart5 conflicts wi=
th aspeed-g6.dtsi
> --
>
> commit c5dab769447b1fc4b06269064e28141f872a8a59
> Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
>
> This patch adds the device tree for the ASRock Rack B650D4U BMC based on
> the ASPEED AST2600 SoC, configuring memory, SPI flash, UART console, GPIO
> line names, MAC0 with EEPROM NVMEM, and ADC channels via iio-hwmon.
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > new file mode 100644
> > index 0000000000000..630588dcb9f3c
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > @@ -0,0 +1,173 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/dts-v1/;
> > +
> > +#include "aspeed-g6.dtsi"
> > +
> > +/ {
> > +     compatible =3D "asrock,b650d4u-bmc", "aspeed,ast2600";
> > +     model =3D "ASRock Rack B650D4U BMC";
> > +
> > +     aliases {
> > +             serial0 =3D &uart5;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
>
> [Severity: Medium]
> Should the aliases override be dropped here and stdout-path set to
> "serial4:115200n8" (or &uart5) instead?
>
> In arch/arm/boot/dts/aspeed/aspeed-g6.dtsi, the base aliases node already
> maps serial0 to &uart1 and serial4 to &uart5:
>
>         aliases {
>                 ...
>                 serial0 =3D &uart1;
>                 serial1 =3D &uart2;
>                 serial2 =3D &uart3;
>                 serial3 =3D &uart4;
>                 serial4 =3D &uart5;
>         };
>
> Overriding serial0 =3D &uart5 in the board DTS leaves both serial0 and
> serial4 pointing to &uart5 while stripping &uart1 of its alias. During
> serial port probe, uart_read_and_validate_port_properties() ->
> __uart_read_properties() in drivers/tty/serial/serial_port.c resolves the
> port index from the first matching alias:
>
>         /* Get index of serial line, if found in DT aliases */
>         ret =3D of_alias_get_id(dev_of_node(dev), "serial");
>         if (ret >=3D 0)
>                 port->line =3D ret;
>
> Because of_alias_get_id() returns 0 from serial0 instead of 4 from serial=
4,
> uart5 is registered as ttyS0 rather than the standard ASPEED/OpenBMC ttyS=
4,
> which breaks serial console output when booted with standard console=3Dtt=
yS4
> kernel arguments or userspace getty configurations expecting ttyS4.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027034911.99=
482-1-prasanth.padarthi10@gmail.com?part=3D2
