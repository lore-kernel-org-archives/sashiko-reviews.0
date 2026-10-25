Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792937944;
	b=u6dHx1ei3qUSv6LTg9UQz3WmKY05qTg3aH3YYXU1L/a7LEkTDpi+wMMy4bgBPmNHW7AR
	 8Gt16xylZirfX4qWrfdg/Gms3O4PFxHOGVkasY58TEBysw1p/vPH8itC0yKEGhyT6r5rG
	 /98mQQ5MX9AUu3WPYLGoimZCIr662DAXTELWapF2tZLKroAoWG5ExRQ6ng0C7vh0kLzJh
	 rxF1xUnKaOx8p6saOxevkjbCjD/GngrrhEDboma057CZAd9nLEaHQj5jyieGyrHg3lkDd
	 jkf8Ag9O/6A1ZOKKygIn7rHBmq/hXR2odF0OSTEGKUOueSAvsySuX2TuHTRsDMRNGqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=TZluPrXQwqjXtBahn5BT9paHFwK9CvKp93YvhUt5EeI=;
	b=LtM4vxPyVglPOgPKhlPY8BgzgPs/TGZp4fkt1SP5j2Ptj/oh9ktmE5tPOQQyBAetVGH3
	 IrJIezbXzZeSNzlDvv84E6nRwrItZhaZASegpN9pr0WMoeFBCXXPhVTYilO5sxlLGMqz/
	 snhNQJzJygRxBsF7IS+DB3VPl7hW5fz146BuKKeXfRkOFtQYQbEXqAksROxEXd4b8zVF6
	 sT08A7BYitEaW15IB+H1YjnHDIr52kVhp03MHPJLw3aZUgbCzGyD3dYB2VRE6k2TnPbO1
	 4i57PWAd7E3gLcyIU7zoIN5V5CGb8TYK+ERbgo8bJuPC5CR72BU1WLmTbS3EV8c5Jig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TRWsl8LM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51FF606A321
	for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 14:19:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C51FF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TRWsl8LM
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9ae391a05so14902095ad.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 07:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792937943; cv=none;
        d=google.com; s=arc-20260327;
        b=lowzjMJ4odk/iVJ7RxL8x8IZf4UkbtT7eXtojI5IycEZS8VPgaVrxAn0eD365305TR
         I1lKgBZun+7AVZ3Nl0Z4KWnXa3lDA6vyvLgK6Xw2Xrm05xNF0vgvQSaeVMkSPbwZID9M
         l90Snpy0vTDnc2WBY8NRG8nHlI0eOWE5UHg/G5kxiRrLaH1+qhHJti+yhcvq5D52YVNg
         v0KdrZGPovIS1cdA3p4JcJHFQPuOx6HUgMVwIzadp6WIIJ91CrS8IAQczfgqWHTr9H2x
         2YU2FG0Qcdlo01jjeJjaScXZ3Xtv3T1TgDcA3cZqzgQEFLiUkDhZTToys6Nc3li0yKE6
         H2cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TZluPrXQwqjXtBahn5BT9paHFwK9CvKp93YvhUt5EeI=;
        fh=tuLHQaXTRDvVtDW54u9vlEPU1dFTJElIgCIgXp/lixY=;
        b=K9SHvtvovZSHp+zK3/qYDFlSgMD3lrSM9SsaTkz0ztajgDtGosHkMqeIL/Ia8qDY1o
         G2kAOKEMR7tKVaJf1LerFRLNqz94lbJTDtoWLQDHwbI6I/20REont7qCAsd0/GuyzfHa
         Cs3FFzoKamVelZ0x6EAi67bhRiAB2I1A5woHHulVDBr3vaKFFRS03zrlIu71iKUYrYUo
         2TzNH1Aex/i8/sIV2EdVVc0CFE4hc3mURMLZvM9jASAuUtaV5rS1rULLl5E0j8t7xyyp
         5eJsqPTF6V30rPh9JS0gNsW27CgwPTY2w3hG3zydCVy7iwki6TKf/wAvu4x/qj32PCCW
         IXpQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792937943; x=1793542743; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TZluPrXQwqjXtBahn5BT9paHFwK9CvKp93YvhUt5EeI=;
        b=TRWsl8LMavinb1cDU5x1ZNgYTLvZfMImbOFH+TY/DCVt97NMfhtbudoJ7+Wwi86KTV
         ebMdsI9sDivoSxC2RlEy87HNPXt+DyerIf17gNO5VgVGkzTeCzdQcfOGMLtDm0TqavU6
         1T+IjkMxflZTD99SyhRTkeYQHg/RkU+7An31aznRbR2JyjMSgOpql1KGVsvf/421NUMc
         VVUmp0TAKWEGSlk52FSstTXF4zJ2Tmb5dlXl+PokuPhxXG6ppudWv8FJ+VRc7rp38qPE
         W9hJEYZKwAg2dEWLFT8fyZUmwgUFPZQt7tvSPOM9809ZmOGnZA1NISP0e4DvgJ0oC2+2
         I3qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792937943; x=1793542743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TZluPrXQwqjXtBahn5BT9paHFwK9CvKp93YvhUt5EeI=;
        b=HbXFYk6u3lE7+m3Yz8BH0wc+y17gPLRzHtxsmK45S5FmHKV0VXuJhXpaWse88JE3y7
         LTxzM3Etxj1MChqL90BEmCviOOakP3iCZxWU5UTE4f0esSvRxmgAIYvPuuFHN7QLMxPl
         nyOGgpChy5/2YTog9QlmXyNEKcsaNwZ8JVWFpBx6FKNCtc0kDxetJNa09JdVHjOXGdyO
         3/5yJo7D42M15LG6H7v6j8HOHk/aBT6UZd4DhY8FASpBfJnrVV2hYysDKk6Xz2Lzgtzp
         jI+TpTJAKuWBellN3cm+gWHAhThZ1LVSosEz0bcrstZkoskFv6PjUDgXWz5vAjczIrJY
         eriQ==
X-Gm-Message-State: AFq9FYKK1mxB/i/o8BwR6FzOiM5JtjoWn7R3YvkqpLQ+7Uaa4hl2h6Uj
	C3Dgc92AL455S3uU7LJnbZAY7MY4sVl2Q5A1Pw5xe2kZih/LG5u/ni24AZzqV42tWCCkHpbiQnL
	VSscskTfyS6SFa3GJUz8nU3lbwpwmsdUZEcxRLORXClzP
X-Gm-Gg: AYBFou3jAxq8eVmh2RMh+VdS8j3NfXKazGOHxghOVjtbqV4XKO/CyuOMIiFAPweXb+t
	3PkpJYO1lXyEZVBhINfyoZI0cuth9mBw5ydc6gjkXMZaUxTk4HrarnBdKxfK9QY1r905ZxfDJ4t
	fw/4AC6CtTvJWHK8n7EvQ65cbrhs7ZteWWcjMugW40XnKWM9xd0Wg5RGiugD4WOynWTLpgc20AR
	mLyYr5ABRtpx2iWyQV0Vst4BGky1x9D4dgkWlYm3jQ5cjNTdHjO899+LdKsYcjbOJgdWlH2y8Yf
	x+rQPH8KNLJ6qOxKZeG2LHMqZTFVTeoLA5ms9rsKM/0p3NgFInz2DYdFDKgoD/ieT6S8WmzquPK
	qHMk0jmcpTjhyHgIwr13dqCvO5ilIQJlmndzEYddLLOQ6JfLu7SyH
X-Received: by 2002:a17:902:da83:b0:2e9:5d1f:dfee with SMTP id
 d9443c01a7336-2ea9cc412dfmr26382595ad.25.1792937943129; Sun, 25 Oct 2026
 07:19:03 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261025135745.102970-1-pmazzini@gmail.com> <20261025135745.102970-2-pmazzini@gmail.com>
 <sashiko-outbox-184239@kernel.org>
In-Reply-To: <sashiko-outbox-184239@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Sun, 25 Oct 2026 14:18:52 +0000
X-Gm-Features: AclHuK9uayK1Q4Gg7-cQO0yGAiMLLbnHiMvUXBCuYd6DT54wbPEG5TiYn0ObdR4
Message-ID: <CAAxh=jsrVwRfdUKdGxJ_5riNRiyCmVpTzQkg5W0ALgtPHRNuxg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pinctrl: sunxi: dt: number the IRQ banks from the
 first one that has IRQs
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I'll fix it there in v3.

On Sun, Oct 25, 2026 at 2:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] pinctrl: sunxi: sunxi_irq_base_reg() ignores irq_bank_map on A73=
3
> --
>
> commit 1d99efa95c547fd409284e1974176bcf35345f69
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
>
> This commit updates prepare_function_table() to number logical irq banks
> starting from the first bank that supports interrupts rather than bank 0.=
 It
> also updates the irq_bank_map tables for the a523 and a733 pinctrl driver=
s to
> map logical irq banks 0 through 9 to hardware banks 1 through 10.
>
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinc=
trl/sunxi/pinctrl-sun60i-a733.c
> > index ca82f08a3a65b..3ebe926a1bc6b 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> > @@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MA=
X_BANKS] =3D
> >  /*     PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
> >       {  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
> >
> > +static const unsigned int a733_irq_bank_map[] =3D { 1, 2, 3, 4, 5, 6, =
7, 8, 9, 10 };
> > +
> >  static struct sunxi_pinctrl_desc a733_pinctrl_data =3D {
> > -     .irq_banks =3D 10,
> > +     .irq_banks =3D ARRAY_SIZE(a733_irq_bank_map),
> > +     .irq_bank_map =3D a733_irq_bank_map,
>
> [Severity: High]
> Does sunxi_irq_base_reg() actually consult irq_bank_map on the a733?
>
> With the change in prepare_function_table(), ports b through k on the a73=
3 are
> now assigned logical irqbank values 0 through 9 instead of 1 through 10, =
and
> a733_irq_bank_map is added here to map those logical banks back to hardwa=
re
> banks 1 through 10.
>
> However, a733_pinctrl_probe() sets SUNXI_PINCTRL_NCAT3_REG_LAYOUT, and
> sunxi_irq_base_reg() in drivers/pinctrl/sunxi/pinctrl-sunxi.h handles tha=
t
> layout without calling sunxi_irq_hw_bank_num():
>
> static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u1=
6 bank)
> {
>         if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
>                 return pctl->bank_offset + bank * pctl->bank_mem_size +
>                        A733_IRQ_REGS_OFFSET;
>
>         return IRQ_REGS_OFFSET +
>                sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
> }
>
> Because the SUNXI_PINCTRL_NCAT3_REG_LAYOUT branch multiplies
> pctl->bank_mem_size by the raw logical bank index instead of
> sunxi_irq_hw_bank_num(pctl->desc, bank), won't all gpio interrupt registe=
r
> accesses via sunxi_irq_cfg_reg(), sunxi_irq_ctrl_reg(),
> sunxi_irq_status_reg(), and sunxi_irq_deb_reg() on the a733 ignore
> a733_irq_bank_map and access hardware banks 0 through 9 (ports a through =
j)
> instead of banks 1 through 10 (ports b through k)?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025135745.10=
2970-1-pmazzini@gmail.com?part=3D1
