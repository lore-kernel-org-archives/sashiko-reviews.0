Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F023624A6
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 14:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779113555; cv=pass; b=QJomShxE7hhxW6PzJZUmZTjmQtzz1VAd77YDWv5o+jx/tNkL1w12pmx4CVB+cBA6+HERzPlAXvHr9fvW79fcFpV/RnQ7Y++LmSWPyuKzLyQfW6w74qzLd7u2xc5qVS4V4tJR2XrGw0t9D3pBzht2sy7sQDTtTwZuGUkP7w9A03s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779113555; c=relaxed/simple;
	bh=F8kioCJJeHQoS+Uj5I60x8KCfwARf1cnVEUEwmaxxoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TcwACYZPrenwyNC8grbNh1uASu4rlOUKLpLfKcVuNb78ZrmAWuLfwnaI2msOtgy8r1MW7AKnvCpdaC1d4nyVyMMn5z5YR7DnjGQQiqcjFmIc23JmPcnsRfpQ12qmWcTx4MAZIkCWdzKgo8tIp6VYYX8VsxaDE373Ij6GxoOb0J8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ii7/t2Ye; arc=pass smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ii7/t2Ye"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-479dd56d016so1924682b6e.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 07:12:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779113552; cv=none;
        d=google.com; s=arc-20240605;
        b=Dl/D/mgWZgrjEXNjbzmQwWyPi6ZR4jY1AgvbKVw4iCWoRIPsAhPz8t8AWMocuVi3JO
         fh/Ev8/zWkoHepU+yrsTqYCVp6frXVywSnHw/0hCVVlSJCA+Q+bpQ6VQwRa9PQYL8npK
         nqQK0JVYoiNCQgQPBMFuSwUxzuMNW2i/Qt3MrE1SCooGkWlQviSdpDTfmuBT7Qao/iVy
         zvSq00BAjPGHmudV5FK4F5ZXL9R8VgcMzoPf9oojh0015Y3tNvJ6Dpe2Pmt/24EUnUN4
         8ijNA8uuqASyccs/qhmf3j0TodUscB4fa9EolpVYP9p/UhIU3P9bF/OySZHCfIg5lBGh
         vCAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dJbLKIvJlNMwOD0e/qYtUjPUXUHLalpry3K4FYi9Z5o=;
        fh=vz3pN3PK/bu+NRXdfIvIk2p5+cHuimYs4qHOOK8kDks=;
        b=Rfijj8ePDamd2/fTNOE3svpn0MEfOjJ8bkv/cW83iZwlWd+p77U0s4PfqOKfkoxBTu
         Vjyv69lj0nnLBvsKnWwX0acVqdHBKn1suQ7UrA6KAj1WY7oOq2xwFulhQdfEsub70ouk
         SgSppjd+05eQaksb5Ne4IMZvkg2E/e88OtsRAZgO/zYza3W7Zr3qPVGkQgiMpb6Yu3oL
         6HG1OjGDJhs6b1yCTT2+OSs4YSyqdu2/ABGUTLa8hBK7X9WZzNsNB+zvPEe5BdIjuiGD
         +JYN+icJjmYiWq7mxUATJgVIQIkw/mlWiDfTF5qp585AUF9nDhKllpMLwXSnxz4dwk7f
         23+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779113552; x=1779718352; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJbLKIvJlNMwOD0e/qYtUjPUXUHLalpry3K4FYi9Z5o=;
        b=ii7/t2YeQ+0/uGd46dScG8DhppFqtha4SgcZA3pahRDBLylTdT+harN5oKE6XkWeHB
         GkgiAI1YHi1iNGfL6Qmozix0ETuxUr5n9P3omEqUCL5eHcso3Y8Oo5PlBvbhmaDq+8eB
         6bTb11BJF9va/apR7u5CvHwDfxLV6jlHqScmH4qDy2/5Th24lr22CP4/V1rzqjal8K90
         hMP1UjYCVJ+JR68pypSmYZjX+o3PlrixgvUgF8XTWiObGsHUHNC57EXfH7f9fyzAJn+4
         vU9yDA34Fb00bf2RdmuurxgknmzuZ5VztkQgr6vqzyVk/xVyYrIbh8G67dvvAxJH6fU+
         wu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779113552; x=1779718352;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dJbLKIvJlNMwOD0e/qYtUjPUXUHLalpry3K4FYi9Z5o=;
        b=W8L/YN3ZlSj8Ol7Em1WonkTSx/JrBW4Tfiz55kZ6YkqAYRJex10KOohySq8hDaH7/8
         mp4zog92qu+4ftPB6gF+LIhdsmny+mFpzeLQ3MlnAnFzj7K01iBotpaP/6kxkpgUk4B/
         ZYNG0KK9N5146/VZ8w9oR1pt8E/XmzEbqs9qEm16GnLQsGy1ojAJDMxZRO9NXZUNBolt
         3Dkbcnfh1aGFRjsJvDZS03y1NdtjzRySFkM6tq6VL3+VT6n7E626QozDJhN4ZFA0nCUk
         BOkylU5JH3cBmaObMRoS/1A3Wcb0PiU350L4H6Uot/LTCrzRAZJNbwXLhOqHqIJvThfw
         mmhw==
X-Gm-Message-State: AOJu0YygV1tC/oqUfwsW2uKM1juKsM38oaIfEAzEYvpkI76RQvbqxIHz
	fHZm5TI/R+Z6ftksUNl8OTVNMzNqoP76NjSn/zNv9vHqETJhkbSOOJ1hq5C0fDMsFErwQYfPkj1
	ethEg0IawWaoCwiU8bvSp9SBf8UPvZeStr5am5dI=
X-Gm-Gg: Acq92OGRqLYTE7HUE25GYhsFWXDtg1I1pG4AvM51lcPy9ew6VIiMIVSxQLVBCPch7/o
	9Hx+sJyFpXDYKyWMTJdwsFw7jSYlVUhnFHZB5nljyUPGpd9XoxzjQGWUZpCT7PaQ5emSvH6Vfjc
	Nh4N/4ICdANMoxce1ThJ7ooOz4lVFDo1EAvukq9FrRoE2KR0sh2krt+RJUejYmNb1EAorR4z9+R
	ob0gn7P3BEPkiWXyRHuti7EsVtDo8UccnQ/HAuFOtj3UzK2kOdapH0HCm/BAMg9+RPf/k3f/46j
	ouujq0UK
X-Received: by 2002:a05:6808:384b:b0:463:cf6b:982a with SMTP id
 5614622812f47-482e572bf95mr9889776b6e.22.1779113552419; Mon, 18 May 2026
 07:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-4-438f2e0513ff@gmail.com> <20260517150921.74C65C2BCB0@smtp.kernel.org>
In-Reply-To: <20260517150921.74C65C2BCB0@smtp.kernel.org>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 22:12:20 +0800
X-Gm-Features: AVHnY4JPO41uDYn2sfJin5JRZNtTVHwE3ZYBMAm1rZUjb0W1EOmPEqwU-c6UREI
Message-ID: <CAJsYDVKB4W=ewJVN7YFsAcwVL5bG3RqndqWJi4xj7gkWuNGj3g@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: add support for siflower sf21-topcrm
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 11:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
> - [Critical] Static initialization of the flexible array in `sf21_hw_clks=
` creates a critical out-of-bounds memory access vulnerability.
> - [High] Lock nesting violation on PREEMPT_RT due to `spinlock_t` usage i=
nside `.enable`/`.disable` callbacks.
> - [High] Global static clock definition structures are modified with per-=
device dynamically allocated pointers.
> - [High] Missing `select RATIONAL` in Kconfig leads to linker errors.
> - [Medium] Integer truncation in PLL rate calculations causes precision l=
oss.
> - [Medium] Silent acceptance of invalid or unsupported soft reset IDs.
> --
>
> commit 83e3e7ec9410a85a7d5912f8b3485089ca10bdce
> Author: Chuanhong Guo <gch981213@gmail.com>
>
> clk: add support for siflower sf21-topcrm
>
> This commit adds a driver for the toplevel clock and reset controller
> found on Siflower SF21A6826/SF21H8898 SoCs. It includes support for
> multiple PLLs, mux/gate/divider blocks, and a reset register.
>
> > diff --git a/drivers/clk/siflower/Kconfig b/drivers/clk/siflower/Kconfi=
g
> > new file mode 100644
> > index 0000000000000..03cbfbdbdb8db
> > --- /dev/null
> > +++ b/drivers/clk/siflower/Kconfig
> > @@ -0,0 +1,22 @@
> [ ... ]
> > +config CLK_SF21_TOPCRM
> > +     tristate "Clock driver for Siflower SF21 toplevel clock & reset m=
odule"
> > +     depends on ARCH_SIFLOWER || COMPILE_TEST
> > +     default ARCH_SIFLOWER
> > +     select RESET_CONTROLLER
>
> Should this select RATIONAL? The driver calls rational_best_approximation=
()
> in rate calculations, which could lead to linker errors if RATIONAL is no=
t
> enabled during a COMPILE_TEST build.

Correct. I'll fix this in v2.

>
> [ ... ]
> > diff --git a/drivers/clk/siflower/clk-sf21-topcrm.c b/drivers/clk/siflo=
wer/clk-sf21-topcrm.c
> > new file mode 100644
> > index 0000000000000..7d4c5e370d6d2
> > --- /dev/null
> > +++ b/drivers/clk/siflower/clk-sf21-topcrm.c
> > @@ -0,0 +1,1053 @@
> [ ... ]
> > +struct sf_clk_common {
> > +     void __iomem    *base;
> > +     /* Serializes register RMW sequences shared by clocks and resets.=
 */
> > +     spinlock_t      *lock;
>
> Could this lock nesting cause issues on PREEMPT_RT?
>
> The Common Clock Framework invokes .enable and .disable callbacks while
> holding its own enable_lock, which is a raw_spinlock_t. Acquiring a
> spinlock_t inside a raw spinlock critical section is a lock nesting
> violation and can lead to a scheduling-while-atomic panic on PREEMPT_RT
> kernels.
>
> Does this hardware lock need to be a raw_spinlock_t?

I'll change this in v2.
I'll probably also split this into clock_lock and reset_lock since the latt=
er
doesn't need raw_spinlock_t.

>
> > +     struct clk_hw   hw;
> > +};
> [ ... ]
> > +static unsigned long sf21_cmnpll_vco_recalc_rate(struct clk_hw *hw,
> > +                                              unsigned long parent_rat=
e)
> > +{
> > +     struct sf_clk_common *priv =3D hw_to_sf_clk_common(hw);
> > +     u32 cfg =3D sf_readl(priv, PLL_CMN_CFG1);
> > +     unsigned long refdiv =3D FIELD_GET(PLL_CMN_REFDIV, cfg);
> > +     unsigned long fbdiv =3D FIELD_GET(PLL_CMN_FBDIV, cfg);
> > +
> > +     if (!refdiv || !fbdiv)
> > +             return 0;
> > +
> > +     return (parent_rate / refdiv) * fbdiv;
>
> Could this integer division truncate the remainder and cause precision
> loss in the reported frequency?
>
> This pattern also appears in other rate calculation functions like
> sf21_pciepll_vco_recalc_rate and sf21_ddrpll_postdiv_recalc_rate. Would i=
t
> be better to use 64-bit math such as div_u64((u64)parent_rate * fbdiv,
> refdiv) or mult_frac()?

Sure. I'll use div_u64 in v2.

>
> > +}
> [ ... ]
> > +static struct clk_hw_onecell_data sf21_hw_clks =3D {
> > +     .num =3D SF21_CLK_MAX,
> > +     .hws =3D {
> > +             [SF21_CLK_CMNPLL_VCO] =3D &cmnpll_vco.hw,
> [ ... ]
> > +             [SF21_CLK_PCIE_REFN] =3D &pcie_refclk_n.common.hw,
> > +             [SF21_CLK_PCIE_REFP] =3D &pcie_refclk_p.common.hw,
> > +     }
> > +};
>
> If SF21_CLK_MAX is larger than the number of items explicitly initialized
> in this array, could this lead to an out-of-bounds memory read?
>
> When statically initialized, the compiler only allocates space up to the
> highest explicitly initialized index (SF21_CLK_PCIE_REFP). If the loop in
> the probe function reads up to sf21_hw_clks.num, it could read past the e=
nd
> of the allocated structure.

SF21_CLK_MAX =3D SF21_CLK_PCIE_REFP + 1 so this won't happen.

>
> [ ... ]
> > +struct sf21_clk_ctrl {
> > +     void __iomem *base;
> > +     /* Serializes register RMW sequences shared by clocks and resets.=
 */
> > +     spinlock_t lock;
> > +     struct reset_controller_dev rcdev;
> > +     const u32 *reset_bits;
> > +     unsigned int nr_resets;
> > +};
> [ ... ]
> > +static int sf21_topcrm_reset_update(struct reset_controller_dev *rcdev=
,
> > +                                 unsigned long id, bool assert)
> > +{
> > +     struct sf21_clk_ctrl *ctrl =3D rcdev_to_sf21_topcrm(rcdev);
> > +     u32 bit =3D ctrl->reset_bits[id];
>
> Can this accept invalid or unsupported reset IDs? Since the
> sf21_topcrm_reset_bits array has unpopulated gaps, bit will evaluate to 0
> for unsupported IDs.
>
> If this happens, the code blindly performs reg &=3D ~0 or reg |=3D 0 and
> returns success without throwing an error. Should it verify that the bit
> is valid and return -EINVAL if not?

This should have been guarded by fwnode_reset_simple_xlate check
on nr_resets.

>
> > +     unsigned long flags;
> > +     u32 reg;
> > +
> > +     spin_lock_irqsave(&ctrl->lock, flags);
> > +     reg =3D readl(ctrl->base + SF21_SOFT_RESET);
> > +     if (assert)
> > +             reg &=3D ~bit;
> > +     else
> > +             reg |=3D bit;
> > +     writel(reg, ctrl->base + SF21_SOFT_RESET);
> > +     spin_unlock_irqrestore(&ctrl->lock, flags);
> > +
> > +     return 0;
> > +}
> [ ... ]
> > +static int sf21_topcrm_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct sf21_clk_ctrl *ctrl;
> > +     int i, ret;
> > +
> > +     ctrl =3D devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> > +     if (!ctrl)
> > +             return -ENOMEM;
> > +
> > +     ctrl->base =3D devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(ctrl->base))
> > +             return dev_err_probe(dev, PTR_ERR(ctrl->base),
> > +                                  "failed to map resources\n");
> > +
> > +     spin_lock_init(&ctrl->lock);
> > +
> > +     for (i =3D 0; i < sf21_hw_clks.num; i++) {
> > +             struct clk_hw *hw =3D sf21_hw_clks.hws[i];
> > +             struct sf_clk_common *common;
> > +
> > +             if (!hw)
> > +                     continue;
> > +             common =3D hw_to_sf_clk_common(hw);
> > +             common->base =3D ctrl->base;
> > +             common->lock =3D &ctrl->lock;
>
> Could modifying global static clock definitions with per-device pointers
> lead to a use-after-free?
>
> If probe defers or fails later, ctrl is freed by devres, leaving the
> global clock objects pointing to dangling memory. Subsequent probes could
> then encounter corrupted pointers.

No. All the clock registers are called with devm_ variant. Before
freeing ctrl, all the
clocks should already have been unregistered and shouldn't be touched
by any code until it's registered next time.

--=20
Regards,
Chuanhong Guo
