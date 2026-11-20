Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795174461;
	b=irUr72jsEvZaQqB3UPlj8bK2NLHIkTDzJT7leoiH8GC66O/JPKQmiIcZuZOmzJpjmtGr
	 gh0skKnlLcm+tFX373p+jQmDMNkaTKqOwvQWbX6SBk8PArtk9t7KF5yP9mDy1sYVHJskx
	 HivhxsTKHYwiNSXEA+F8s97DRP4Xm6F7jqq4J2MMtb106wKFKxtOCGwvc2L7wvykEx60p
	 l0J0t4F2NU6RDB9hmAxDCXr2A9abGAVfoevlicMZpTuZcB5RcYOabEwJPij6ihs3Jv0Bx
	 BMAETvODJrkfvJ6yeXCe86VO+ygRrw7/4Qn+UqbWrjMgZDbSBLGhFhxuvJsF684o7OA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=fRsO3ZDu/cz2F9ezmEnkpxWWVWCZOJbm/Q68ymsx9pA=;
	b=pNKtAAwIu6QaAyyojTVNbppVt4wNtl64J+eEdlJBs4N3u44FTh/XyZ5nah/QpHt7kt1q
	 1lDq5my+/6xbIMoayKd1GgWBG1MZ8Xm9KWqQwvCu4WTSJo8MG3QCD9Ute3JExch4l4Ger
	 2Q9xZx8xnM+KSE2AKfxFR6wjeR2Ss+FS59115LZBz2FIx1O4ghkOnKwX4m/uVh/NMMJQe
	 1BATA0Sw2rEjJolAy+WkeEopXCE/yHorK+YTW9lxgJthxKXDVNZ+esnb96nuHCIfa9Zll
	 1ePRsoRBAriqlsBDXmbrRnDqYk+Z7xFJfViRZMsTS0cZpzK4qhq7J6tdMLrvsntDi7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=IIz7JEmH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B304F606A335
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B304F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=IIz7JEmH
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50ac25cdd4so103966366b.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 03:34:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795174459; cv=none;
        d=google.com; s=arc-20260327;
        b=bR6a6iNvZgltPinUw+h3/qQhQujywE85AZIqYV+wEMfv8uUZRo1Ujs0Ed9YNG0L4OL
         XRh0i8X5D3ahI9Hlz0tkkpg7/jM/0gQJ1rjxDwSNRa8XJgsllwC0SjNTGT3tF2+JW2N6
         IVvRUqX+kyFUfzgofsPyBbnyQOfSRXEkFIfN+KYPsMF8eex3J0URCaB9VMSyZ11MB/iN
         DgZL3RyQ+dDeGATojYfop2MkbPci/pa2+XcX0NulxAqInIK0ZNzt8RGRlMHjB1B3YZbZ
         7Mu81xKxvblKNXMpPQsrOKNYAS8Q6a/uHAdP5hN357oQYo9llMEjlq77R9kZchN1vEYY
         2dng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fRsO3ZDu/cz2F9ezmEnkpxWWVWCZOJbm/Q68ymsx9pA=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=WdRB8fnoBE6+jbFIPc2WKMwexcqs/UKMgeB72B4AxrvBAwKnjIepE180CLh0t4DFhu
         RbqGMiaBdY6cVM7DYH37v9/Wj7+hQwNrO+L0b7ULJlplTlpDCKQJkZ0Vkz3LdLIVZUUH
         VXs5ShFqN+ek3Im3jnqRs3FJVe+AFjU8Y2tdOBLvL47+iJL11kfur6LZJxZn14zHS/gs
         r10mnIDO0C6j7qcBAcJJX0W0118u96VcI9UUGxfFMXSR07dAvPi2T7NG2t9Egxn+Mszt
         IEKBHt+kidBznG4KA10cuyssOdtng30fVA4fYoDsIVlVgrosb1LZao5zYUl+90n9zBHg
         008w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1795174459; x=1795779259; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fRsO3ZDu/cz2F9ezmEnkpxWWVWCZOJbm/Q68ymsx9pA=;
        b=IIz7JEmHfzPXh0l6XT5Rpjt249QEjCrTAQ8YFCfDRzH+beDsQ0f1hU2HjzUr5cHe4n
         Txvp1OIZh1roN0Co27tBGVTD/CxUifJfbqjmvTY3M6mZuZiGhj1rJn8faae2l2GIu6EY
         wfPSGFsjunWHT23HX0rRfPEffJWBFOyqm7EVyH3yVOfrfqOi6IAAyScFWNEHfBkmLT/d
         HHWxQ0XxpBCG4bfPmUwzTARBSyADMNeNADKk7zOrl+KuTHv64c5R74zeUS/DFna3Cwyt
         afGCdFt4bXeurFhZdhF0zgIm+Lq1AfTkHOr7fHyg2tPisEDJsT8FYYIldTQk32vVKSTP
         nH7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174459; x=1795779259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fRsO3ZDu/cz2F9ezmEnkpxWWVWCZOJbm/Q68ymsx9pA=;
        b=1m4f7zcdSEvl02EfUuhHiExbgjR9qZbSO8J0o2nWQI2UgHv9cugPi8V+O71U/Zh+iZ
         8awe3oNRnh/Dfg5Tqry8vqW3uW5q3VQ5TVou/5G9ZwpwwGTdmuZpaGtE12HGfy4tdzLb
         4EU+PoKUJKktLJe1p7t5p542oJ+gnpxdnWFnErx6ikrYHZtdkHdibZfvjik2j8ug13WV
         k/Jfba3PE3MHvf5r2QwZdrn9OopK86/1V1/d7h3rAXFZ1o9pVtrh9RRSCV/Q4Z1nJ85z
         Z4xk5eqwsOHuLK7BqcP90zeYlp1JSqBH85smKBP9e69iqvRik4tvB0JcuTnl123PIzbU
         xJXQ==
X-Gm-Message-State: APuU4Z9w+/VWkD0OYgsZSloY9LRH9h5zPlZ5OMo0nXb4vOam+n15Swuv
	t+PEghbSr7a27MDe/LkGyhQ3jgxjnl+vcb8rwbTc47/DrN6c8qdl2fmTy0uXY7h7/8gyTOqU0e6
	U9/ruok3GRJXTl2LODSiPRyr/zp6sx0mMM4scVWgkx26HcUe8ZexKvuwSDg==
X-Gm-Gg: AYBFou0iz3HRcQaplM75NojYDCeFpkcCcI5D8blIp4waJ1fAbKrG+8C9pnD9mhVoo5C
	W+0KWgTUJzHaAqGV2jYyID5+OWApl4yqTpvzACQ313IF3xcH2GyyolY3EWQKeCxuLd0MLotpv4M
	bfE8Sn3ocEz8k2dWwj73J3dJ/Ln2O6k4zhLfar+IiXfvwOUTsYBV6x0cgp1u3L5323T6tOmQ51N
	2tKp6LMmDiJ6ApW/Qu+j/jVaf6TwNbINwBSW4Mgy3E2FrvHP23BwZ7wNTDdiUS+ljAypNebvise
	aBGWVoZH+VOI9UhXRE74/rms6y2KxQhH9/dr0f6qFdtW0PZeKJ/2X1v3Oy5UkbpJrHPenF64KeT
	XQtmslLvGuQiUc4R5GY7kQBXySa8t1VsG9zcUUwLF7FzbIh3lw0RmG65A1KLnMkE3RssN8Q==
X-Received: by 2002:a17:906:2db1:b0:c51:691:c76e with SMTP id
 a640c23a62f3a-c513a9abeffmr212514466b.36.1795174459002; Fri, 20 Nov 2026
 03:34:19 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120-rk3576-phys-v1-0-6382cd14e3dc@flipper.net>
 <20261120-rk3576-phys-v1-6-6382cd14e3dc@flipper.net> <sashiko-outbox-224978@kernel.org>
In-Reply-To: <sashiko-outbox-224978@kernel.org>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 20 Nov 2026 15:34:08 +0400
X-Gm-Features: AclHuK8RoRf7zMIuyYmJlfLbmrB--2dyFTOsmnodC1bQoiDVeS2Y2IYBUY1ezpE
Message-ID: <CAKTNdwH+yKELMRe5RRv7UEuBFytum-k52xJXBPT_p5wC+9heQg@mail.gmail.com>
Subject: Re: [PATCH 6/7] arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY
 reset to datasheet timing
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 3:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: rockchip: RTL8211F reset-deassert-us below 72ms
>   minimum
> --
>
> commit 0900c61dff0b0908a212846ea06a953d5d033faf
> Author: Alexey Charkov <alchark@flipper.net>
>
> arm64: dts: rockchip: Shorten NanoPi M5 Ethernet PHY reset to datasheet t=
iming
>
> This commit reduces reset-assert-us and reset-deassert-us for the two
> RTL8211F Ethernet PHYs on the FriendlyElec NanoPi M5 from 20ms/100ms to
> 10ms/30ms.
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts b/arch/a=
rm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> > index 638e00b6e1658..3444198b6cf66 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
> > @@ -809,8 +809,8 @@ rgmii_phy0: ethernet-phy@1 {
> >               interrupts =3D <RK_PB1 IRQ_TYPE_LEVEL_LOW>;
> >               pinctrl-names =3D "default";
> >               pinctrl-0 =3D <&gmac0_int>, <&gmac0_rst>;
> > -             reset-assert-us =3D <20000>;
> > -             reset-deassert-us =3D <100000>;
> > +             reset-assert-us =3D <10000>;
> > +             reset-deassert-us =3D <30000>;
> >               reset-gpios =3D <&gpio2 RK_PB5 GPIO_ACTIVE_LOW>;
> >               realtek,aldps-enable;
> >       };
> > @@ -824,8 +824,8 @@ rgmii_phy1: ethernet-phy@1 {
> >               interrupts =3D <RK_PA2 IRQ_TYPE_LEVEL_LOW>;
> >               pinctrl-names =3D "default";
> >               pinctrl-0 =3D <&gmac1_int>, <&gmac1_rst>;
> > -             reset-assert-us =3D <20000>;
> > -             reset-deassert-us =3D <100000>;
> > +             reset-assert-us =3D <10000>;
> > +             reset-deassert-us =3D <30000>;
> >               reset-gpios =3D <&gpio3 RK_PA3 GPIO_ACTIVE_LOW>;
> >               realtek,aldps-enable;
> >       };
>
> [Severity: High]
> Is 30000 us for reset-deassert-us on rgmii_phy0 and rgmii_phy1 below the
> minimum post-reset settling time required by newer revisions of the
> RTL8211F datasheet?
>
> Revision 1.9 of the RTL8211F datasheet increased the post-reset wait afte=
r
> PHYRSTB deassertion from 30 ms to at least 72 ms for internal circuit
> settling before accessing PHY registers.  Because phy_init_hw() accesses
> MDIO registers immediately after waiting reset-deassert-us in
> phy_device_reset(phydev, 0), a 30 ms delay can cause PHY initialization o=
r
> stmmac_hw_setup() DMA reset failures during probe or ip link down/up
> cycles, as seen in 1c7412530d5d ("arm64: dts: meson: g12b: odroid-n2: fix
> PHY deassert timing requirements").

Hmm, what a great world we would be living in if parts suppliers could
share UP-TO-DATE datasheet versions with the customers. TIL about
revision 1.9, and it does indeed specify a longer deassertion time.
Will fix in v2.

Best regards,
Alexey
