Received: from mail-ed2-f11.google.com (mail-ed2-f11.google.com [74.125.228.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B66447F2D0
	for <sashiko-reviews@lists.linux.dev>; Thu,  3 Sep 2026 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430573; cv=pass; b=CoUAdobdo1rZGhVnwl0mplqCNzo5nJk0C1cEZblXLjCpuzgNYz94K3gO6P9rI1WMfJMpm4P5NND/9uwwUzVPYZxaIphAfB/j0GpxZXEtJRqJ6y9MDWuiX5BqJMmj8DWF8K3S1EzBQqX5jXaXOrYO6NoQK6pXm3MPMUeKz+/qKXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430573; c=relaxed/simple;
	bh=WVlbokzFReA7Tc6/DcRmPk4toil5vu4Fw2X7RHf/oFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W57tnjMVSn8smu0xyyH6KJoylps5foKunu1EoiG1iXpWgweRXDsB7QDZbih1QAnvErXQUClv2L4f17dGezGT6o3g98jtZht9AI3bZsCuZ10Elul3LJ09yXQSR95yfepm5+vEyqHjAQPwR9HsaA0SOHKbWnxKPW2TeJpXJCwaNPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FAK7Hnhr; arc=pass smtp.client-ip=74.125.228.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FAK7Hnhr"
Received: by mail-ed2-f11.google.com with SMTP id 4fb4d7f45d1cf-6a5f56eae1cso1171299a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 03 Sep 2026 03:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788430562; cv=none;
        d=google.com; s=arc-20260327;
        b=lgeWTJNPTBz/yQ9Se+vLpuHWG+pwxsZnOvmhpTVhfSIAVh9VAujBVeSQT6/gUC8A2C
         fSapeGm3SJybGUgTD4S0mKhfsX9tU0M7YvN2Mb2Y/ottVH+jTuWuC65BFFBEPJ5MF5NR
         EnIpIGXvZ0FXcoLqWvVu7GYC/gJ/iwvddH6V38iMGvGS+NKk+DYPZh4l2ZPnMDz78mQS
         ZScK/dfC0QTurOtMBa5RbguQquDZiOPkH4loEnDsBsbwbY7O4qsYP9tYk7hgjuuva4Dm
         lhkfnCdny8xVZcZd2Vu40S+wNowVEgc2IVNzamfvrYwgt2lf1gj4DAXP1bBlBwNQG7hu
         laww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XZZc60YapILALMj+sMrNLxAzX0DBFLxvwfnKJeCXNro=;
        fh=Oq+z9tkhjCUfPEA2djWjK/YPBTt/ZpFl4+Jvr9GY9M0=;
        b=I/NVROVnPwBY95cKxBNsYLab6nLEAKGvJ9VapPw4/PFiEcQXkhAa0Gdiqdi1OE8CBx
         cm/8qvwDuNO03I4XWw3VjVeASdV/qqKNOzTlc2zp1TUhjb3ew1rlUG0qDKUml9T8vFzf
         mqeS+4pSaxW9O50c43ybLOlo7vTq7DFy3z80HMRE5v3SFLLVdwIkjqLzcF04h9caQNjD
         DNIgzeEG3bmgdYf7avOv8z2b8mGo4au2nI0fZ6bRXYO8cbnw+lC9ZwhcCfxFlZ1iF9iV
         tNttgzQa8s1fzmuJ5NJF1HMG2kNACDS3FG34nx1BLt8qZOfw6I+e+9iW6ebkY5zZADr2
         bGcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788430562; x=1789035362; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XZZc60YapILALMj+sMrNLxAzX0DBFLxvwfnKJeCXNro=;
        b=FAK7HnhrCCpa0/fH9UTDW9oPeswaNX+kUbkaElDSQ9n6yINeyZ7BuCIIofrSGxBKdQ
         aaOUEbllnKm29EgM0u1vs5i4tx8cqHr0hVJ3PL2/HqBKaUdRL5VHFWOdRFQGEfYDFTFa
         xPsXXtZSUDl9hllMA1L/dbP3Hx7Oogv8B0vItn7ZwmQq7Sk1tXEhqJn1z1H8rMbbGoMz
         7lJQW9bTfInltZgYF3r+b0CVndsOmViJ0kg4dUGZrEOhXuf0CgLTERo4gBQ1U6ucQfCQ
         CySo0LYt3mOS3QKvpfHbMZv7XyRXwQYi09qdxfB4R7Rzp09x8x52TqJVmZzuJkAitkoZ
         vcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430562; x=1789035362;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XZZc60YapILALMj+sMrNLxAzX0DBFLxvwfnKJeCXNro=;
        b=OCa0PTOtRiha6QDFrsDjvrkxw5iiTouO7O0aszAFNs9v23eRmyaq1nMKM45z0iabjS
         ijYwKVUsZY5f78i1x7feDYqjdv6JCNtmXRo25DOq7zgjtf9i21ymvgVnaE4txwvyBVDU
         96RogYIVvs6ZYdQu9rMVxGKsCCdvyjbcL8HsVMF2Fn2jhk4MvHunxzdFfI/LjE+M6OzZ
         jdEM0jx4rYIiQg8JpUcIQc9/nZA8lInR5Y/EJfXhnyWBXmjAeP8w+REOl373xWYxzbnH
         sqyu0R1b4ZFdm8hZgrCsuAfqn6pwRY3SeW12Wz3lgOyJypLE5GV2mTm5hkuILFodegsA
         KbGg==
X-Gm-Message-State: AFuF++nM8Oo0fSwqx9hCRTc5Odwt3ax2fpLNSOSONbYMHuPAARSaiVZD
	0dW2FQExJc1aGCbn/9Wg+XUIfcMSKY3V7sHSZ9ZkkRFxFTSDViAClpeLBz/f0Gs7WV5qrQlLvZI
	PMQxGZfKuvlwWqSPPii1mSmbCBMAZs7CFzKxf4BiJUHPI
X-Gm-Gg: AYBFou0fM3K+Cmi9/Cotr0cayFbNhdXzAc7XLu39nmAif5BClerSKjbwLmYYN32AjXA
	Hls8XVZQ5+F9Na4J3Cw55NTSLOWFSylQ5Url6VUmyiEi1L+rT//27OC6pGxoN3Z6pEG6RtOObsE
	3e3iXFN+Y1R/AZfgSWSStiIP6EefMIHTTw1KbtNi29hjbZr49HB3t3FIGaC/Yt0Q3muLa2NLpT4
	pe3Ni87v5VMnFQc2cKObzlGq9wRj+zP7BsYjr5EMBH4twTkZNHL1H62Gac9H5yHaVfEDM3h3bXK
	EtLFMUnV03gcUQKEOglPxN+97J1Hgezda54dY9hRr9rgcEG5AphGst6B32o=
X-Received: by 2002:a17:907:7203:b0:c25:254:292e with SMTP id
 a640c23a62f3a-c25d4c9f1a7mr635886866b.0.1788430561260; Thu, 03 Sep 2026
 03:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901150111.141037-1-coiaprant@gmail.com> <20260901150111.141037-8-coiaprant@gmail.com>
 <20260902150440.78D631F00A3D@smtp.kernel.org>
In-Reply-To: <20260902150440.78D631F00A3D@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 3 Sep 2026 18:15:50 +0800
X-Gm-Features: AcwNN1WY1KXAlYP6ywO7GSbIWh5cdAyLJ9V8yYe_I0JGYIyWb1Ll7tKOm3JNX8k
Message-ID: <CALj3r0jnyqvPgwURmggRBZiCqDiQ4f03=tn13BFez0=W8LH00Q@mail.gmail.com>
Subject: Re: [PATCH net-next v3 07/10] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, linux-phy@lists.infradead.org, 
	olteanv@gmail.com, vkoul@kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=882=E6=97=A5=E5=91=
=A8=E4=B8=89 23:04=E5=86=99=E9=81=93=EF=BC=9A
> > diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
> > --- a/drivers/net/pcs/Kconfig
> > +++ b/drivers/net/pcs/Kconfig
> > @@ -12,6 +12,29 @@ config PCS_XPCS
> [ ... ]
> > +config PCS_XPCS_ROCKCHIP
> > +     tristate "Rockchip XPCS controller support"
> > +     default ARCH_ROCKCHIP
> > +     depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
>
> [Severity: High]
> Is this missing a PM dependency?
>
> If the kernel is built with CONFIG_PM disabled, pm_runtime_resume_and_get=
()
> returns 0 without enabling the hardware clock. This could lead to a
> synchronous external abort (SError) when the unclocked APB registers are
> subsequently accessed in xpcs_rk_read_reg().

ARCH_ROCKCHIP already selects CONFIG_PM.

> > diff --git a/drivers/net/pcs/Makefile b/drivers/net/pcs/Makefile
> > --- a/drivers/net/pcs/Makefile
> > +++ b/drivers/net/pcs/Makefile
> > @@ -1,10 +1,9 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  # Makefile for Linux PCS drivers
> >
> > -pcs_xpcs-$(CONFIG_PCS_XPCS)  :=3D pcs-xpcs.o pcs-xpcs-plat.o \
> > -                                pcs-xpcs-nxp.o pcs-xpcs-wx.o
> > -
> > -obj-$(CONFIG_PCS_XPCS)               +=3D pcs_xpcs.o
> > +obj-$(CONFIG_PCS_XPCS) +=3D pcs-xpcs.o pcs-xpcs-nxp.o pcs-xpcs-wx.o
>
> [Severity: Low]
> Does this syntax create separate modules instead of a composite module?
>
> Because pcs-xpcs.c references functions like nxp_sja1105_sgmii_pma_config
> defined in pcs-xpcs-nxp.c without EXPORT_SYMBOL being present, creating
> separate modules will break symbol resolution and cause modpost linkage
> failures when CONFIG_PCS_XPCS=3Dm.

Sure, I will revert it in next version.

> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> [ ... ]
> > +static int xpcs_rk_init_clk(struct dw_xpcs_rk *pxpcs)
> > +{
> [ ... ]
> > +     pm_runtime_set_suspended(dev);
> > +     ret =3D devm_pm_runtime_enable(dev);
>
> [Severity: High]
> This devm action schedules pm_runtime_disable() to run during devres
> cleanup on device removal.

Yes, I will fix it in next version.

> [ ... ]
> > +static void xpcs_rk_remove(struct platform_device *pdev)
> > +{
> [ ... ]
> > +     pm_runtime_force_suspend(&pdev->dev);
> > +}
>
> [Severity: High]
> Will calling pm_runtime_force_suspend() here cause an unbalanced disable
> depth?
>
> Since pm_runtime_force_suspend() internally calls pm_runtime_disable(), t=
he
> disable depth is incremented twice during removal (once here, and once
> during the devres cleanup). When the driver is rebound, it will only be
> decremented once, leaving the depth at 1 and permanently breaking runtime
> PM hardware access.

Yes, I will fix it in next version.

> [Severity: High]
> Can a concurrent sysfs MDIO access race with xpcs_rk_remove() and crash t=
he
> system?
>
> Because the MDIO bus is registered with devm_mdiobus_register(), it remai=
ns
> active and accessible until devres cleanup runs after xpcs_rk_remove()
> returns. Calling pm_runtime_force_suspend() gates the hardware clock whil=
e
> the MDIO bus is still exposed to userspace. A concurrent sysfs read could
> increment the usage counter, call into xpcs_rk_read_reg(), and execute
> readl() on unclocked hardware, triggering an SError panic.

Yes, I will fix it in next version.

> [ ... ]
> > +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node =
*np)
> > +{
> [ ... ]
> > +     xpcs =3D xpcs_create_mdiodev(pxpcs->bus, (int)port);
> > +     device_unlock(&pdev->dev);
> > +     if (IS_ERR(xpcs)) {
> > +             put_device(&pdev->dev);
> > +             return xpcs;
> > +     }
> > +
> > +     if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER=
)) {
>
> [Severity: High]
> Is there a race window between device_unlock() and device_link_add()?
>
> If a concurrent unbind of the supplier proceeds after the lock is dropped
> but before device_link_add() creates the dependency, the devm-managed
> pxpcs->bus could be torn down and freed. This would allow the MAC driver
> to continue probing with a freed MDIO bus, leading to a use-after-free.

of_find_device_by_node() increments the reference count of pdev->dev,
so the supplier cannot be unbound between the lock release and
device_link_add(). The put_device() is only called after device_link_add()
completes.
