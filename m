Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0121F53FD3B
	for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 15:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905918; cv=pass; b=OnIURl/OCVA34BPfCyhRcJuEo8QSbCm1Z5dXMdEsFbDgDoaYu0kO+rEG+MXPZgFu6GnMq02/vVwY+ixOlFKjP7HmHPJHJ93hXQBVal5vQTlHD04+4uLi66LTwwBlo7S7IPh62668bDeoWbKfkQ1kxPwplxuYcBwjdkW4O/UZTQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905918; c=relaxed/simple;
	bh=MmxvBPYPduVdw8BoM1SgfvslPMhQ/xEwnTrDO4SQWvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OnwLODMikOiiQkTiayUI2HPZsjrhWTMNGtYc82Ph2lm38qedYv1chf8ZpYqiWw3WITBri5Tp8IMOwUt8V+eF7KeV93aVP7mcHoAhDro+KPSVAN5b8OUlcky1b+tC5IKt9nqXEd0xwHZckfWfQCwCoKwOaZGdPwF/Qa4S/Dz3qw8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ARhVQjuk; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ARhVQjuk"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-887beafb714so1561500b3a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 13 Oct 2026 08:38:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791905914; cv=none;
        d=google.com; s=arc-20260327;
        b=f4q2fuETTKTqZOPb9kVZz5CfBSys0quAGYbSMUAX0F8YJYi9QxKo1WZg62GtOpVw8X
         vX/UceGOetM4KNAAINhaPuAft43APbF0j6EndwTAB6DkF6cA0xQHtRj5RDXTj7mfOPPc
         t6Blw9xMUmWbWZ61WE8WA+UxkC+TQjF4q+3b23mpRvDZHOmL15ac7WYAkMGVybZitxw7
         RAM5FA9NDNCeTk66Pp3R6wF5lnEiQdsgvFigwHVm5HEWKFwkvVC6NxjPPGjCqXu2L5Zs
         2GsJrnBFOAFTORwspHRC8ba/D2dforJO0g4bnU9SrQ9+2FDvz7nxbVCqykuks0kg4W0G
         /PvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bNxkY3u/s5WVXvWEK0xK5d2WbLkBdvB2WEBpPBk1aiw=;
        fh=KC96VAKKF9T4FWqzKtg9kMsthPCpSrKJemiA/YIX7uA=;
        b=KS695nqs8aZ0Nmv68uA7nhHBjPO+Bp13d55h2XWNh6U8VkGCpq9jGVGiGL/J+Y1Qxe
         JA69w5o3jV88o+yNMleQCz3gNGTvk11owkuDLvv3LBGBn+IrIJj/aTmrJQZf0JHBDTZH
         SdGnvlwWmI/iw0q6gBx0iou4X4CuoaWHaWR00WKCJR37aJGvWvBldPB3ZaZlofmpbrsx
         jiKT3LLApZPoNR7d8y8LQlxSOZCCOGt2WMfO7z8YAQrh5Yypd/vbO/YP4HAgUQ6w+ib8
         JUiNlWVKwwtE2rJo1Dtgwyjz4XFrUSUoFp967PpQ9EWjZp37qfuVF8buDCFk8NZ+VejQ
         0q1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791905914; x=1792510714; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bNxkY3u/s5WVXvWEK0xK5d2WbLkBdvB2WEBpPBk1aiw=;
        b=ARhVQjukgkNE4c6OX0P1KYq8r8ZL2Of1YYrEkv44XMTXwgiu5dYlw2/nBFyRvgM15Z
         OsfpaDJt2OJAsmisKgIRq00PCTJqWWw3k2Yu4E2MHV19CvQHaPGbZ1OiwK+aPIdAXG0z
         zoFYxSZxiugzGf9pKVzlSL0xHJ9Fse4UbNBqpfGVH9ucx3cqPENtHjgb4dqsZdFq7fJC
         Bj2EtT5m5MaM8nhcStQMobCL5CS4vf3gCzi0iYHM9fo2egdHOWE3htpsyS9+/iKT4Ke/
         yakDt+a2cKRH9sN50nOPrXNQ2SffhTo5AOHK2s2nJ0+sbWZxcbZYvxX38sQttfZeEnS+
         FWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791905914; x=1792510714;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bNxkY3u/s5WVXvWEK0xK5d2WbLkBdvB2WEBpPBk1aiw=;
        b=IA86J8KS8JR453x2KlBQ1jl4LctXVLJG/2Wr/HS0hl8fq6j1aX+GZW6+FFmNgAceAs
         q5UYJD+RSYMzY/Cc7fj52kMH/+17CnAA5bqPdVugj4YDjLQxrUQRGVBhwDqRPRmryzuC
         fw3BsBC7ow+9Vrz6aOWXwx2scT6NoD1fZ7DL043VWRqZsHJL9/SUJcBeZLfHJOnbm6/a
         nbxOcXJE5u7RBhuAEV8LE7Qy+CGf3aWE14i+Rll5t/NOGPbIzuWVb/nlSUL8EnwvgXve
         USPQtA3a1xte/W79YxgzeNBe75B73VdqoXxnl8X95qRsulmG2iZS+X5Iqj9g/6q+ByfC
         1sRw==
X-Gm-Message-State: AFq9FYKMkVoRjK53FnL2X7TWTkBZ87Sgx1P69Te3S398AQI18OJAmilG
	gLRnqkfhJa2cydY5raPTaAP6SzvN7DR+3TBR3zZneJ2fP9RkNV/YCTwvA7HLqXoBGdKSESu8cp0
	dmu7grl0ki+jx+w7OX52iu+gjrDK5E/Qca5DsSzrSGg==
X-Gm-Gg: AYBFou0S5eTQrPxkNDTVYeYnaN1gqpAxmm+vJArD2E8l6qYW/AQb7RgPudLk1QxQNF0
	eZi4g9FMOSEwgnawJ5PjHWM8KNlgmtoVdfUHtCCn3QIXTqjhe/B6oDIdPbRlmDXFMHGu9dPMLqf
	t+/n5Xhn5Er05ulCvfkyn+lKwoqebcNghrBRf3yc+SfhG5SSGAM6+yvmAGEbS7F3Cw6wNCO5ueC
	RbSHdAy8VxZ2xkR4uZyTm0tjh2UGMCUP/W1wpt5NUYcuJdY/fJ/Z6ZWa8U+goSmKyizqZy1prIb
	T0cImV97L04B9oP/n5PkWUM0c+XUF2IrbSINHczJ8IYaH0DqLlFSMaJDIaCfB+D3ZAEPeQI=
X-Received: by 2002:a05:6a00:bb8d:b0:878:34d7:6994 with SMTP id
 d2e1a72fcca58-897c73f479amr10672060b3a.36.1791905914108; Tue, 13 Oct 2026
 08:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261012100816.331033-1-pmazzini@gmail.com> <20261012100816.331033-5-pmazzini@gmail.com>
 <sashiko-outbox-167955@kernel.org>
In-Reply-To: <sashiko-outbox-167955@kernel.org>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Tue, 13 Oct 2026 16:38:08 +0100
X-Gm-Features: AclHuK-szTY3pRI5JWHXFDmrUzH8TEpBh3ImxWAXWDJL8aPlx3tl18XJIvM_QJ8
Message-ID: <CAAxh=jthj+HhtfuHpxBiDhG09dTiojg_zcFReczeHojnRzzyQg@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] pinctrl: sunxi: add Allwinner B288 pin
 controller driver
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The first two come from the IRQ bank numbering in
prepare_function_table(), which this patch depends on [1]. Andre plans
to send a fix after -rc1 [2].

The third is fixed by "pinctrl: sunxi: dt: do not accumulate npins
across probe attempts" [3], which Linus has applied.

[1] https://lore.kernel.org/linux-sunxi/20260929203634.32998-1-pmazzini@gma=
il.com/
[2] https://lore.kernel.org/r/20261004225724.0b821e9c@ryzen.lan
[3] https://lore.kernel.org/r/20261007060107.62221-1-pmazzini@gmail.com

On Mon, Oct 12, 2026 at 11:29=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] pinctrl: sunxi: out-of-bounds write in irq_array when Bank 0 has=
 0 pins
> - [High] pinctrl: sunxi: Missing irq_bank_map breaks B288 IRQ offsets and=
 domain size
> - [High] pinctrl: sunxi: probe deferral crash due to npins accumulation
> --
>
> commit 6057aa70ee139132fe0176fd6bf4d482c87bdc64
> Author: Pablo Mazzini <pmazzini@gmail.com>
>
> pinctrl: sunxi: add Allwinner B288 pin controller driver
>
> This commit adds a new pin controller driver for the Allwinner B288 SoC,
> supporting 80 pins across ports B, C, D, F, and G. It uses DT-provided
> mux values and specifies 4 banks of external interrupts.
>
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c b/drivers/pinct=
rl/sunxi/pinctrl-sun8i-b288.c
> > new file mode 100644
> > index 0000000000000..f973c2b3f2eba
> > --- /dev/null
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun8i-b288.c
> > @@ -0,0 +1,49 @@
> [ ... ]
> > +/* PH0 exists only on the BSP's FPGA platform and is omitted. */
> > +static const u8 b288_nr_bank_pins[SUNXI_PINCTRL_MAX_BANKS] =3D
> > +/*     PA  PB  PC  PD  PE  PF  PG */
> > +     {  0, 17, 15, 29,  0,  7, 12 };
>
> [Severity: High]
> Since Bank 0 (PA) has 0 pins, does this cause an out-of-bounds write in
> the core sunxi pinctrl driver?
>
> In drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c:prepare_function_table(),
> last_bank and irq_bank are initialized to 0. When processing PB (bank 1),
> the condition (bank > last_bank) evaluates to true (1 > 0), causing irq_b=
ank
> to erroneously increment to 1.
>
> This shifts the logical IRQ bank indices for PB, PD, PF, and PG to
> 1, 2, 3, and 4 instead of 0, 1, 2, and 3.
>
> Later, sunxi_pinctrl_build_state() configures the interrupts:
>
>     int irqnum =3D func->irqnum + func->irqbank * IRQ_PER_BANK;
>     pctl->irq_array[irqnum] =3D pin->pin.number;
>
> For PG (irqbank 4), irqnum will be between 128 and 139. However, irq_arra=
y
> is allocated for exactly 4 banks (128 elements) in
> sunxi_pinctrl_init_with_flags(), which would result in an out-of-bounds
> write past the end of the array.
>
> > +
> > +static const u8 b288_irq_bank_muxes[SUNXI_PINCTRL_MAX_BANKS] =3D
> > +/*     PA  PB  PC  PD  PE  PF  PG */
> > +     {  0,  6,  0,  6,  0,  6,  6 };
> > +
> > +static struct sunxi_pinctrl_desc b288_pinctrl_data =3D {
> > +     .irq_banks      =3D 4,
> > +};
>
> [Severity: High]
> Does omitting the irq_bank_map array break external interrupts?
>
> Without an irq_bank_map, drivers/pinctrl/sunxi/pinctrl-sunxi.h:
> sunxi_irq_hw_bank_num() returns the sequential logical irqbank indices.
>
> Because the irq_bank offset is already shifted to 1, 2, 3, and 4, these
> logical indices will be used as physical hardware bank offsets.
>
> This incorrectly maps PD, PF, and PG to hardware banks 2, 3, and 4 instea=
d
> of their actual hardware indices 3, 5, and 6.
>
> Additionally, because PG receives irqbank 4, its out_hwirq is calculated
> as 4 * 32 + irqnum (>=3D 128), which exceeds the bounds of the 128-entry
> IRQ domain created during probe.
>
> > +
> > +static int b288_pinctrl_probe(struct platform_device *pdev)
> > +{
> > +     return sunxi_pinctrl_dt_table_init(pdev, b288_nr_bank_pins,
> > +                                        b288_irq_bank_muxes,
> > +                                        &b288_pinctrl_data, 0);
> > +}
>
> [Severity: High]
> Could this lead to a kernel panic during a probe deferral?
>
> The driver passes the static b288_pinctrl_data descriptor to
> sunxi_pinctrl_dt_table_init(), which calls init_pins_table() and
> accumulates the total pin count:
>
>     desc->npins +=3D pins_per_bank[i];
>
> If the driver probe defers, desc->npins will double on the next attempt
> (from 80 to 160) because the static descriptor is reused.
>
> The pins array is then allocated for 160 elements, but only the first 80
> will have their .pin.name populated.
>
> During DT parsing in fill_pin_function(), if an unrecognized pin name is
> encountered, the search loops over the oversized array and evaluates:
>
>     if (!strcmp(pins[pin].pin.name, name))
>         break;
>
> Iterating past index 79 would call strcmp() with a NULL pointer for
> .pin.name, causing a panic.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012100816.33=
1033-1-pmazzini@gmail.com?part=3D4
