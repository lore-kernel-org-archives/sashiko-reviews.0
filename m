Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794156432;
	b=iM58ItWCh7mdtzq5OaypYwE6M1fui6G4fmMViDKrqWlKpoX2nojT5pxMFsG2ixXuZFJX
	 GGicqsCWH00atQPd/XZ72BXk0IJp6ZDLFGNrnSBaxRqGpJMVCkSXVkkjoGwiWsoS70a+H
	 2HJtrKP2LhFxeoZnOsLToxSaWtNnzFf4wQphRVaT9DNd02ItZPjDd7700fR0HC5eK2j8W
	 ROTcE85tblu3S0C6ws5MKKjK+AR0bjyCwweYfRIgzLdKExFPxIocuTXRnT7uj/waKQrAF
	 fZFPLgz6D6Vw7dEW1KnazxXHHrkTsxNkrgKNbqsA+BgVhlYrvEJtSevNaXU82VxZr7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156432;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
	b=r6+S+9IDo1owi150kx0FZ1n8kVwOFU3tYIzPNfdIXLO79eD1LBPojMOt+dxEZ2TJIRds
	 6Oqf/eFhMUhiXpM/DZuTXK0dugcy6Bqq/ujQFdYnH05rZvtmfjf+GyNlwRqpX/GeEqJIJ
	 thaOjqthe4BwfPJrjQayOw0T+gmO8Vn0maZh2ApJNydjW8Ac3ZaLRB33pOccNEG7AjNsn
	 pKZJB2tiUSSTR2kK+BUtara0Nk6t3r2zJRKrU1FOGVA2blt4+ohMZH3iwyPTMTzWY7p9u
	 IeD7vFAApkB3PMnFH+/oyB384hdAZnyRjjJ4nYMkj5/TduL3BqcZ2erWSgGXE4SL63A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kb67dMpz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D2B606A31C
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 16:47:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D2B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kb67dMpz
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso26228a12.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 08:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794156431; cv=none;
        d=google.com; s=arc-20260327;
        b=hAy0kjrPqGuZXOqq8/r2yWE69T2mkc6MfVaPdXXJsaAMUEYzMbhsK58/DFiiVrqpv7
         JyjEvpH+sU7EaRWyobvoQjvwPMiXTOH8ZvjNEw2uSVFljkmzpNRtbinXuI8t2coBMbAS
         dXLbh5wa5iBMHTTSd9cLvAAt19u3VAgogAA8wpaUPb1DH9fK5Zbk8EudSK4KZtxokUFG
         uOgdeWdI4OVJatv84k5I0OXDlNv1D1uxcHAH44DhnkEfELMylQIRfzbsgTpFh5pLN06j
         IwdmbqQFwKiTqC968qfGIt6wKYsMPri1NOI+nEsumAjLdfSi+vG02u7AweV7X5aUHZjR
         GLgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
        fh=uy6xYNC6GDlw5796+26mQ8HGbRrmXzFKeYx3hewT3FM=;
        b=I5FmRBucEFez/85QWRL9+c3vKVB1J8QFQmL/IlwPfk+61gWGGAIf2obJhYoshQ+xaN
         aqL/5gk7oXdSnOqHg4TYiXUhmKH89RVd6bXIOYV5zYAk6BwElhNfCnUCi/h+qfiOGdjA
         xITUUALvEQrJwzwqZOm6x6nIcE/ib1tVdWoZQ5loQLqUr41Uw3xn9s77NDiWwYG0KGy6
         94O2VZvJdMxqW33bosenbgVdKhs9kW0fEWA3DyXgw39NzPWWlaINeGAf5iUu9LZp0HjQ
         kwkt/vkGrynuKGJk/U9WN5C685kORVImpqxwBQ8AjIYDizehOzRtUj8eVMIOXYfcXdSc
         W5Rw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794156431; x=1794761231; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
        b=Kb67dMpzw7wX1mU0TFMVYc4rgKm8N/ALklKXn3pCk6Psfi7vbAmDgNniTuzK3TWxAX
         pIVUHOAgwjpn0o3UqAC4YviEuWd07L0pbSSoEYhF5UrJ5ClWEEzXvqenvwFE6MBeDzw/
         OiGUdoTqmvI8AFrcZlADgZGxN7FHkkiqB1sCl8RVqHckRO+aYi//BOYfjJrGehd8fXPz
         YsyVarTe+evDGFxl1Y/DwxlsKTawADt8VqWmBZ1LONCU7eMO5NsfzXlSKrYFbg6EPSQj
         pX20ZlUmHXJMhsS9wW8RCotIrM+EaXpy+gLl7UU4uJwEBw2kusHky4UQTx3Hvhpx11Uq
         rrKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794156431; x=1794761231;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r7i5HS1agzi9a9cyD3qvLBRlAYW8TYHB/KLXRsgrFvw=;
        b=l3c3QV6yFF2+iIcBZ1ekwseVATAmS9rutfTTG/jAJwg8GD6QlSOLJxdzjaiAHC3a1Z
         pp1Jis808SUsEbHqqytO7lNpRRMVsD7lNV8+M63qxKqW3Fk1zWTYeXaf2DxfifM7xztl
         UM3MrnFIF14B6BnBHrM1DstAVIRNPCwQpHis/WUXF7JQPWoorLmTS1Z5rNEr6CUL7bgA
         3WU+k97cKOzBnnqplTzEd0AIt88h6v4LywiYXdpcxJcb4mADirIzPyXJFvrdpcjIvJ/+
         KxFuYbb+k9NyVGtsXOl15hx4ztagIJFZaZBGoNGc9sXbJRvOMsbyPfVDe/LyWsUHEt6W
         yimg==
X-Gm-Message-State: APuU4Z8JJZGKxeHIHlQRGXBtxwuv0jHMWUxf1BtpFq0mZCMSg7vatPL/
	iAV5HPijmP8LOh+5Jl2usE2abINMXE7EjumO5rSZUT+3ZTS0x/CdtpFOeq1xiZslSm8ObnEdbGn
	uAWksLiKTNPDjeNF+NHWpzhI5Bh6AE8r9Bv14Adqlb5pn
X-Gm-Gg: AYBFou1z2P80zlwXqiVwvqvQosMXIiwj2su4jl+7ybkPkCixf9Fc5Yifut8u5jdu7fZ
	SHn+T+14AbkMuAp9vBZetYdtPimhF4N1kuCbK4b8Genw1OLCaIuFPqRsnBefmbCRvhHQZpi5Kjc
	l2G6l6aGfXkMLD/9hb8h9quG4YY6qnCkG4Q8lYdbpM2JXrDqBkqJyAip+CTGEkAABd2HBjeZxXH
	dIG0oLzuI7fp6GNzggL8BPIgqB9K6JR/m4nvNrcH8ejcP6CnZdy6qpHBEVSkhojCzVVUDnRBws3
	G7eECMysZFWB1be6GNbyFYpa06z0yXd1Ed/aqAhWfgH3LNW1wUKbzIQWDTahO6bppzU4JPv3Utv
	tKbLvpZeXz0DbndtMk5Zeiopr71tVwO2IP0r09C0S9LL2DAsn7+iS
X-Received: by 2002:a05:6a21:7907:b0:3e1:29b:bb35 with SMTP id
 adf61e73a8af0-3eed59db277mr1575456637.88.1794156430631; Sun, 08 Nov 2026
 08:47:10 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108155702.361022-1-pmazzini@gmail.com> <20261108155702.361022-2-pmazzini@gmail.com>
 <sashiko-outbox-203873@kernel.org>
In-Reply-To: <sashiko-outbox-203873@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 8 Nov 2026 16:46:46 +0000
X-Gm-Features: AclHuK8Aes8U3tn1e6jW8hKMbpOMmvpbiNePg-NqNlB0EoDX7OzrjxLvUYhO9U4
Message-ID: <CAAxh=jt9_hsJkEuaWsdAcLMS6mSS0O7PYQj_p6-oWOsQ5B9Shg@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:11 PM <sashiko-bot@kernel.org> wrote:
> Could these macro names be aligned between the clock and reset headers an=
d
> with existing sunxi-ng CCU bindings before they become ABI?

Yes, I'll use the names the other sunxi-ng bindings use in v2.

On Sun, Nov 8, 2026 at 4:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: clock: sun8i-b288-ccu: inconsistent clock and reset
>   macro names
> --
>
> commit fb1a7b2f6dc03665d0714b13f4a0587e1bb34467
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
>
> This commit adds the Allwinner B288 CCU compatible string to the
> sun4i-a10-ccu binding schema and introduces the clock and reset DT bindin=
g
> headers for the SoC.
>
> > diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bi=
ndings/clock/sun8i-b288-ccu.h
> > new file mode 100644
> > index 0000000000000..c9b9eaf979ad0
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
> > @@ -0,0 +1,82 @@
>
> [ ... ]
>
> > +#define CLK_NAND     18
> > +#define CLK_MMC0     19
> > +#define CLK_MMC1     20
> > +#define CLK_MMC2     21
> > +#define CLK_MMC3     22
> > +#define CLK_SPI0     23
> > +#define CLK_SPI1     24
> > +#define CLK_SPI2     25
> > +#define CLK_DRAM     26
>
> [ ... ]
>
> > +#define CLK_BUS_THS  32
> > +#define CLK_BUS_NAND 33
> > +#define CLK_BUS_SDMMC0_BUS   34
> > +#define CLK_BUS_SDMMC1_BUS   35
> > +#define CLK_BUS_SDMMC2_BUS   36
> > +#define CLK_BUS_SDMMC3_BUS   37
>
> [ ... ]
>
> > +#define CLK_BUS_USBOHCI0     46
> > +#define CLK_BUS_USBEHCI0     47
> > +#define CLK_BUS_USBOTG       48
> > +#define CLK_BUS_DE   49
> > +#define CLK_BUS_EE   50
> > +#define CLK_BUS_TCON0        51
> > +#define CLK_BUS_CSI  52
> > +#define CLK_BUS_ADDA 53
> > +#define CLK_BUS_SDRAM        54
>
> [ ... ]
>
> > +#define CLK_BUS_TWI0 63
> > +#define CLK_BUS_TWI1 64
> > +#define CLK_BUS_TWI2 65
>
> [ ... ]
>
> > diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bi=
ndings/reset/sun8i-b288-ccu.h
> > new file mode 100644
> > index 0000000000000..6751456545487
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
> > @@ -0,0 +1,45 @@
>
> [ ... ]
>
> > +#define RST_BUS_MMC0 2
> > +#define RST_BUS_MMC1 3
> > +#define RST_BUS_MMC2 4
> > +#define RST_BUS_MMC3 5
>
> [ ... ]
>
> > +#define RST_USBPHY0  14
> > +#define RST_BUS_OHCI0        15
> > +#define RST_BUS_EHCI0        16
> > +#define RST_BUS_OTG  17
>
> [ ... ]
>
> > +#define RST_BUS_DRAM 25
>
> [ ... ]
>
> > +#define RST_BUS_I2C0 34
> > +#define RST_BUS_I2C1 35
> > +#define RST_BUS_I2C2 36
>
> [Severity: Low]
> Could these macro names be aligned between the clock and reset headers an=
d
> with existing sunxi-ng CCU bindings before they become ABI?
>
> Specifically:
> - CLK_BUS_SDMMC0_BUS..CLK_BUS_SDMMC3_BUS vs. CLK_BUS_MMC0..CLK_BUS_MMC3
>   (matching CLK_MMC0..3 and RST_BUS_MMC0..3, without the redundant _BUS
>   suffix)
> - CLK_BUS_USBOHCI0, CLK_BUS_USBEHCI0, and CLK_BUS_USBOTG vs.
>   CLK_BUS_OHCI0, CLK_BUS_EHCI0, and CLK_BUS_OTG (matching RST_BUS_OHCI0,
>   RST_BUS_EHCI0, and RST_BUS_OTG)
> - CLK_BUS_SDRAM vs. CLK_BUS_DRAM (matching CLK_DRAM and RST_BUS_DRAM)
> - CLK_BUS_TWI0..CLK_BUS_TWI2 vs. CLK_BUS_I2C0..CLK_BUS_I2C2 (matching
>   RST_BUS_I2C0..2)
> - RST_USBPHY0 vs. RST_USB_PHY0 (matching other Allwinner CCU reset header=
s)
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108155702.36=
1022-1-pmazzini@gmail.com?part=3D1
