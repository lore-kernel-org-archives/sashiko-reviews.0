Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794156474;
	b=MLpTGYH68KvR/DyoT65Y+u6oMPEw13P6s87VZHbos1CM1CL1o58VGC/R0MrcxQcDKuXp
	 lgK6BELz7BJfccbR92E1/xBINE5HKbsDqfN4+D+kQirRUim5aZPsXlbvzsCAJzsr8bUpw
	 7igvAsBQUbtZFpuxH4lj/CtSLOA2e13mR9OOZ9Z1lQ+WZhjaQVtXulLKu10yRvR2PJ+XS
	 GFQQACVnw97TfMzQA4q5n7p3PobT1CnJjy3NzPXUut2az1RVGs7vB2Uapp0jHBuIILIty
	 EqSaGLNYUgKa1J8O+3lZnfVwtQA6qiDM93nDJCkXDp2k76Z5IzIIwFtTr2fwu/maSYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794156474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=evSxEGT7EP5yWt4VQjY1odATlVADyf2LwindW+8Vgkk=;
	b=wQ8ZgFo67BapMbxwFOsZJ+aKlQxbo3sBWr9qUdu/JAqMpxj06+zbPoCVKDbTZ+nPnZzg
	 QXWmsVjPyeczIrSdXNDe/cwXSRXnvCPK80fmea1GqN8LWGwdTOPy+bR8F5xpD3bMCJtiX
	 mdeBp0twMIGXUrhSZUJc/5vSLGoI8hjQG690KJfAmo7FeT7jiUJL1GMywiONGKBaId9dx
	 w4AeZfCnnm9YIrou+zp+s/CMaHpquYkgUfMJe0ZDpChkJBK8uBqJsipB1aMWk60Bjch0W
	 W1sZ4XEH84nveqrHw0TNCYAuMvomExxkUcMMqAM4jSonrEhPMDrDHd9aFIX+KpDqB7A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0GzASbr+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F492606A320
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 16:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F492606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0GzASbr+
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b6b22be970so26565b3a.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 08:47:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794156474; cv=none;
        d=google.com; s=arc-20260327;
        b=e5A07tqrUr2ukhFSbxn7piI32c4TU7Mq9ogd8vhGOuoL7rDWvKoBBC9T+ExBrdFt55
         2lrlEir55l4jfomyIg5UbPK7fZ0uXyD73UBfQ06sUKKI1yPJuEO47LF10boo2HokhRA4
         UGXQM4M5QXWhuFQ4RZBVgOrjk0m/iIk+2XOUqe3MDV+/gF6uD2kvW/kEqUG2K/NXxDk+
         c2EjRVqlBC620tbjuopRI71dVwkLDq5saxMPzDIQCUpb9ATHkwtPhww+AdCMGUPAX3+h
         RE+He+g9nP/GNe3YHFzvmTXyE3ByBo96C9/uHrluctrtNWdfFHHLBzYMfKpbjWyq0eej
         ViBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=evSxEGT7EP5yWt4VQjY1odATlVADyf2LwindW+8Vgkk=;
        fh=2hfhS/TDdw+vB47+SyuDzTOw4Y7UogjPq+LMZLKB1/M=;
        b=hv7ESZTMyZPC3U/AiqeRy/ueM0GlGHRew2VOJH+iExoCebTzXJ6qY359z53ROECO+k
         xJK9Cqb4R6tD3Cz8EeTVMMqkWrQGztsaolWn4LensjXIZ7vEkMmBn1dZ1l6oSf4FTB96
         iPJ+4zWajoNbUMaJfRA39Cm1UrgtVpgR9CeNbpVednrm8F6Xikpqt/4vapiT8fYALtg0
         IH3p1L5GwPka2VR+yNGjqlXI81OXHXcqNlVap5OcTts5tMS6gw8Yq2pMwDh38uc5NY1C
         BR+dOSZ9Tdi18wsqM2KyCxeYmjOjKqU7zllmMbqdhWbqOtSE+gaObygiTJLCb9/uA9KR
         3bUg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794156474; x=1794761274; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=evSxEGT7EP5yWt4VQjY1odATlVADyf2LwindW+8Vgkk=;
        b=0GzASbr+VcbhkpNt32h2JX4jdNkfH+VIOzK2PfLaw56Ty5CDp4gSdOrlFT9EEpJxyF
         bx3poHFyhnmMhHp/zRcjUbdupw3c+MRSv0EQRdc+JMfQ4EqQkQXITH+LTN9Ds9B/OnX6
         BZyDcRjgu79bjqEkyQCv5+ou4ceJ3f22+h2Lmj3VQlHscUh/eA9V9tKgAwqE/EOvwOak
         iT1a0RhFeIs78pm2tKLmpWpsr3eW/cZHHjvicotZ2WlBz41sb/64BCL887x41Ip+PmOU
         HcDerUoDvekHSXPHLdhPWC6iLOIRqsA2zbc3/8RzYzYhLXZ+1I9TrpsCdm6WQrSLyMKD
         kTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794156474; x=1794761274;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=evSxEGT7EP5yWt4VQjY1odATlVADyf2LwindW+8Vgkk=;
        b=dgh9wEo/RgiDjpIKwUCVVDuurqPXG55LbGce0PJ4jxXiCBZncOaC2WKmlB48UABH9c
         +CcnjL4ISE3LZo0/WsSBV44u3Yo6luzmJB6aTpwgYosq+wPCn8UqzSNuH5jOOQfSFm3d
         f31mCUAaJMauqgwdDo6MORCO+dsKojTCbMXBpAo0UGj+s1uxwfiQvmvNixEwKaVlnhou
         s08d2k9teLgc8bXI0yMroHoMe6gxyocZlO89F/EvNCM0ctQqJzqk4D0Y+GHXHrZAwYVu
         2nFE5ZFB4FwRZRtHbkXWVqYlVU1bgepq75kT6U7iirEwBitjKiJp/v+XsTBnseWa6V3s
         cfJg==
X-Gm-Message-State: APuU4Z+X/haGSgtPjgoAJ++VpUyhwo4opMDfdmRoqOWzqz6V6wwXEV2+
	1ErtJMNtThd6bzme026aBf3nyBIu5wqrgCAgomJx+srVFOs9H2u69++4TknrcpfgaZNAkwHlLlB
	2B/NlPVCTyXRFS6B45nP/yrRv30Oz0u2k2M8IYVcPoKn/
X-Gm-Gg: AYBFou28v3YUuhGAohzfWlwJjwvDYZiEXG8NOw3bsqj1h6G2TkTf7O+X44auNq8vrhE
	boWQz1wjyEydbldvjUkZNxFP89sa5JdACdLMEGdacO4QDC6m9nIGFUlJ1keCRH+6f9ZxWQlBLGb
	bD/+CDKwHG9TNR1/JU+QXeUXktUo3ZhoesULYCCET+QQRFXddjf+nsplmpxwm5gdW8mwCq7Sk/6
	cTI79gbHsqLeTzWP6rEz8GxAOYL83Ifp7+JF6p3rctKv1GSp0yaEc1igcUXuesynqsnIzUKx//J
	E9kZTXZPzcigw+ogsgKJgu2JGJLzk5rvB3enI14ZewF0aRRZ/APWfPvBIi1ZmumWOSSvQX03Gd8
	sWFhBJdY5b4g2hi3oXxh8nw58XGPsSePNWJOsxxly76fa5iE3ujIn
X-Received: by 2002:a05:6a00:4107:b0:8ac:3a71:38a6 with SMTP id
 d2e1a72fcca58-8b66fc970afmr1523563b3a.52.1794156473421; Sun, 08 Nov 2026
 08:47:53 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108155702.361022-1-pmazzini@gmail.com> <20261108155702.361022-4-pmazzini@gmail.com>
 <sashiko-outbox-203874@kernel.org>
In-Reply-To: <sashiko-outbox-203874@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 8 Nov 2026 16:47:28 +0000
X-Gm-Features: AclHuK_4qeDidbx21BSiyl5hMY3CGY3Px979lH25Bd33ehuOp-xo-GZuM04gYbg
Message-ID: <CAAxh=jtSHByK2H1fM=1bBiFJPkunKctR1oKU_anf2zYidXtUBw@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: sunxi-ng: add Allwinner B288 CCU driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:14 PM <sashiko-bot@kernel.org> wrote:
> Should this build sun8i-b288-ccu.o (with sun8i-b288-ccu-y +=3D ccu-sun8i-=
b288.o
> below) like the other drivers in this Makefile?

Yes, I'll fix it in v2.

On Sun, Nov 8, 2026 at 4:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] clk: sunxi-ng: missing CPUX mux and PLL notifiers in
>   sun8i-b288-ccu
> - [Low] clk: sunxi-ng: inconsistent module object name for
>   sun8i-b288-ccu
> --
>
> commit 2d968133b3c297b695cc7e5349c65174d952448b
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> clk: sunxi-ng: add Allwinner B288 CCU driver
>
> This commit adds a table-based sunxi-ng Clock Control Unit driver for the
> Allwinner B288 (sun8iw10p1) SoC.
>
> > diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makef=
ile
> > index 796f443f4d765..debae396555f6 100644
> > --- a/drivers/clk/sunxi-ng/Makefile
> > +++ b/drivers/clk/sunxi-ng/Makefile
> > @@ -41,6 +41,7 @@ obj-$(CONFIG_SUN4I_A10_CCU) +=3D sun4i-a10-ccu.o
> >  obj-$(CONFIG_SUN5I_CCU)              +=3D sun5i-ccu.o
> >  obj-$(CONFIG_SUN6I_A31_CCU)  +=3D sun6i-a31-ccu.o
> >  obj-$(CONFIG_SUN6I_RTC_CCU)  +=3D sun6i-rtc-ccu.o
> > +obj-$(CONFIG_SUN8I_B288_CCU) +=3D ccu-sun8i-b288.o
> >  obj-$(CONFIG_SUN8I_A23_CCU)  +=3D sun8i-a23-ccu.o
> >  obj-$(CONFIG_SUN8I_A33_CCU)  +=3D sun8i-a33-ccu.o
> >  obj-$(CONFIG_SUN8I_A83T_CCU) +=3D sun8i-a83t-ccu.o
>
> [Severity: Low]
> Should this build sun8i-b288-ccu.o (with sun8i-b288-ccu-y +=3D
> ccu-sun8i-b288.o below) like the other drivers in this Makefile?  Adding
> ccu-sun8i-b288.o directly names the module ccu-sun8i-b288.ko instead of
> sun8i-b288-ccu.ko.
>
> > diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-b288.c b/drivers/clk/sunxi-=
ng/ccu-sun8i-b288.c
> > new file mode 100644
> > index 0000000000000..6e12ed8248f20
> > --- /dev/null
> > +++ b/drivers/clk/sunxi-ng/ccu-sun8i-b288.c
>
> [ ... ]
>
> > +static const struct ccu_tbl_clk sun8i_b288_clks[CLK_NUMBER] =3D {
> > +     /*
> > +      * PLL_24M @ 0x034 -- B288 only. It feeds the PLLs 24 MHz whateve=
r
> > +      * the crystal: it converts a 26 MHz one and is bypassed with a
> > +      * 24 MHz one.
> > +      */
> > +     CCU_TBL_FIXED_RATE(CLK_PLL_24M, "pll-24m", CCU_TBL_HOSC, 24000000=
),
> > +
> > +     CCU_TBL_STD1(CLK_PLL_CPUX, "pll-cpux", PLL_CPU, CLK_PLL_24M, UNGA=
TE),
>
> [ ... ]
>
> > +     CCU_TBL_STD(CLK_CPUX, "cpux", CPUX, cpux_parents, CRIT | RATE_PAR=
ENT),
>
> [Severity: High]
> Can changing the rate of CLK_CPUX hang the system because no CPU mux or
> PLL rate-change notifiers are registered?
>
> CLK_CPUX sets CLK_SET_RATE_PARENT, so clk_set_rate() propagates to
> pll-cpux and updates its A31-style NKMP factors in place while the CPU is
> running from it.  Other A31-family CCU drivers that allow rate propagatio=
n
> from cpux to pll-cpux (such as ccu-sun50i-a64.c, ccu-sun8i-a33.c and
> ccu-sun8i-h3.c) register ccu_mux_notifier_register() to temporarily
> reparent cpux to the 24 MHz oscillator during the rate change and
> ccu_pll_notifier_register() to gate and ungate the PLL after updating its
> factors, whereas sunxi_ccu_table_platform_probe() registers neither.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108155702.36=
1022-1-pmazzini@gmail.com?part=3D3
