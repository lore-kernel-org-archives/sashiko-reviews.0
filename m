Received: from mail-ej2-f7.google.com (mail-ej2-f7.google.com [74.125.228.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F111DF98F
	for <sashiko-reviews@lists.linux.dev>; Sat, 19 Sep 2026 12:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.135
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789821063; cv=pass; b=U5T4s5Kpd0jaEQNwvnSjc2FTixQpTONzW9xBnsP6Y5wv7pvag84Bg0/L+PelY9tiQcrjSYbjQEt8cDEOGWruamhZT1cPa18C9Rg6/6mVRnpmE+sW2QT2lJrC9H/EambHfYwxX7ofW8wYXBBixsjU/Ch69EEJ0h2cZFo+6LIl2JE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789821063; c=relaxed/simple;
	bh=Xm41jBuPvhC4Qx47xCYgrq9jjV5qcdDYuRSYD38mbYE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eGBBjuACP31Ijpq03pChGtDLjiAWMp7Mx6u8JZnjWts++oKb0pGepHqP2Lapw46t+moTNp4+KWyqEXWEFdHr8jwG8bFZ4HXf4JkWE0TmTsVQcn+5HpZAYxIO/jVuFc7VQb1FpciIe3HG2B7COXZDCjqTm1gF/T9aQCwrILMakG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBkomc0Y; arc=pass smtp.client-ip=74.125.228.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBkomc0Y"
Received: by mail-ej2-f7.google.com with SMTP id a640c23a62f3a-c28e3998eb7so133146266b.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 19 Sep 2026 05:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789821058; cv=none;
        d=google.com; s=arc-20260327;
        b=I71KPkgbBiPFCqEujYWXgy2vj8DrWzH6S1hS+EGAZ7Ud8GEZWs9u3MROUxpia82ZxU
         FJeIyJICKnvS86a8sjcf6kA/twDUW7kgRNjt0WGxhVC+NIoUyv+EmIAsrWSUvqNH7Ndn
         kS/P5E3HG/03mO9VtGBtrNAkGIdoLm5EP5RAyzroy+0+/eWjyQNfbvUj7EkRoWvqsmvP
         me0m+YjJkdSPC3X+v2ut0eguR/E3CJwyWwA4VZGasW9dnY5VFioOe3ZkFdbr6JylidXt
         6HJhhSCe4P1qcdiPI0zZRAq/KhHd3hNpdq+0FdRcZOvkr6S5G5h/5hfwwCZBG2khGOS0
         ehWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kbajk6IEEwy/Xs7sY4wEcDzXgbsQyEmagqT4mDV/8qY=;
        fh=6gTBLwUZpmxNRbJKv3xaUD9m7K0M1soHm1ChTXCgSOU=;
        b=gk7t5iO3Q5p3lddNKZft6LQjiVlcrXo62tW0YOalqJGsm4eROcC85fVKEkjpAeZxON
         UIf3t6BKtaSL7VQOl5UWEK15E2vllca+gM7/DW7j2KJ3liRj3hlPP2pOIagZNb4+DuZg
         2v0m/D9Z+MCt8KpJLTkoZqXvfcBRucoAAhzNDrVWPey0Zx2b9I42yhMOtRQ/Z+zgf5/p
         lsnfgctFvBXImlErLQHzMAC8zaCRGsCipEdrFt89zaFc2FCJOr86CeFWKXm85U4Bmfyr
         p3D+UqD01RvHDuiwKh9gW1FOtn1tty+9g8UpsPGqfFD3s2b/S1A/2N/9beAhhQD6NoZ3
         nu/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789821058; x=1790425858; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kbajk6IEEwy/Xs7sY4wEcDzXgbsQyEmagqT4mDV/8qY=;
        b=LBkomc0YxdJOa77y9rIyeOHw3+IinKqRt88aCmcGVWKCcgdxF9wH8xWFl97DdRj9X0
         RivvZxZEWhIkc/ZtxsDRkZzDEHEpv3K+jT1QtwhxpcrWkdTaNKNXbWtNJjhM9HShI47m
         +JKQV1ZS17kbT6mj3vKwwPkVcXhGRcOzspwTjKk2mQiBXY08tUCdJe8nqlhGVgsYfj6E
         lVX+3qk4IkueZ7ZF7rZJLJmBdPRGPVTytHoBIQY3dM/Kqu7uBC3f2Hjxv7VfRIxvXoEs
         ew8rDkzTbm2QVQoZF01fWIkyKc3f18fv5gwXtst4u+b5FDIsnXx/SRKHu+lucBGqsKdi
         YF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789821058; x=1790425858;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kbajk6IEEwy/Xs7sY4wEcDzXgbsQyEmagqT4mDV/8qY=;
        b=Abrjcz/WjDTeJNvUT4U9x/23vaGBznca5S8Y7Lz6z3cTHMU6EX6eVhCNW5Cew2y68m
         yrXQ3Yjk1lH7pyv1jTx1BkhDyitSnGy+9fpZ7pVmYIDA3Ldlt2MJqxT7d2pUevtZs76I
         EsJm0dPfYnCraJzmjHn7Bu5Kub2HMvLfMs7WWmTqcQO9FXuGWdm27aSU3Fwpp8w3KGuR
         92UFZIe+5tXvOXvwdOnhjRdluQ+APwF39+OJOdF73kicOGeilUNqzmFKD5GyvCKXCFXU
         80EmiQtU9Wr7Gc13nMfkHbzNPFtfRxoTyE9BfVYtonAKrP2P88IRaQd86Kmcz9kHUkeR
         x4cw==
X-Gm-Message-State: AFuF++l9Lcvi5IoqH27hw/mT9NzcBxrZDdJTiVnm0qBC0I212UdQWsKd
	lQN0JLNpRoqKsZC8qtbyfUqld865VdOMUCMMOSdTRguNoZRe8MmM5MIm/rbnVGzjAV+z7KFwIZn
	T+wmtjL2RX1Ur9YEviBD2qpmYJndi0NG26Ok0BpDaag==
X-Gm-Gg: AYBFou3fPGMsaaerz4GrwuLX4bxYpSt9HVenxcb8zKWpHlN0B/81SW92W98tS5vZYGq
	eCuCsZJcNI+YtgvbU74Pt8BWPWsZeKV8YRaVFH3FBk0eTXwYztCY50ovV6H5H6TXcbxgqGrjlFi
	oThjgF0/+FJpTy4b0xFDlywBOsJtjHQas7h3EOObnvoI2fXr5AfJCh4ao1kLM4kUY7fkRcYHplN
	H8w4dd0rAKtjPHMgoT/EdGKblVUGsM+pch2hr8DRpvrqH3NVG6yrSJ0rFJQ7M0IzgDxG97BCVKy
	ltM7fxd6RR5Wxyi+5NBpofxrpOxZ4kAUrbQXdGwce8Pa5Kklt5wV/CXSQg==
X-Received: by 2002:a17:907:3f82:b0:c29:d1b2:35df with SMTP id
 a640c23a62f3a-c2a1581946amr470610666b.10.1789821057622; Sat, 19 Sep 2026
 05:30:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260917204624.2427486-1-coiaprant@gmail.com> <20260917204624.2427486-8-coiaprant@gmail.com>
 <20260918204847.2B6441F00898@smtp.kernel.org>
In-Reply-To: <20260918204847.2B6441F00898@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Sat, 19 Sep 2026 20:30:45 +0800
X-Gm-Features: AcwNN1Wj96ApSAjh0B3vVvs2DEQWJ6lwYwJqIyKTrL4WkG90sIjEWZrkuc7fyp8
Message-ID: <CALj3r0hL9fewnCgcO4wT+5q=nWgcR6TXR=HXoYjQwtANo-B7Bg@mail.gmail.com>
Subject: Re: [PATCH net-next v7 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, 
	linux-phy@lists.infradead.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8819=E6=97=A5=E5=91=
=A8=E5=85=AD 04:48=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] net: pcs: use-after-free in xpcs_rk_create() during concurrent s=
upplier unbind
> - [Low] kconfig: unmet dependency warning due to PM_GENERIC_DOMAINS selec=
t without PM
> --
>
> commit 7e2d67535ce6f3173f2984680b0a77b61caaf964
> Author: Coia Prant <coiaprant@gmail.com>
>
> net: pcs: xpcs: add Rockchip RK3568 platform glue driver
>
> This commit adds a platform glue driver for the Synopsys DesignWare XPCS
> on Rockchip RK3568 SoCs. It implements a virtual MDIO bus to translate
> MDIO operations into APB3 memory-mapped register accesses.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 59, CRU_CLKSEL_CON29)
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part2%20V1.1-20210301.pdf (Page 2078)
>
> > diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
> > --- a/drivers/net/pcs/Kconfig
> > +++ b/drivers/net/pcs/Kconfig
> [ ... ]
> > +config PCS_XPCS_ROCKCHIP
> > +     tristate "Rockchip XPCS controller support"
> > +     default ARCH_ROCKCHIP
> > +     depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
> > +     select GENERIC_PHY
> > +     select PM_GENERIC_DOMAINS
>
> [Severity: Low]
> Will this cause a Kconfig unmet direct dependency warning during compilat=
ion
> when PM is not enabled?
>
> Because PCS_XPCS_ROCKCHIP has a COMPILE_TEST fallback in its depends on
> list, it can be enabled on architectures without CONFIG_PM. Forcefully
> selecting PM_GENERIC_DOMAINS (which depends on PM) without inheriting
> that dependency could lead to a configuration mismatch.
>
> Could this Kconfig entry add a dependency on PM, or only conditionally
> select PM_GENERIC_DOMAINS?

Thanks for the review. You're right, I was only considering the real
Rockchip build. COMPILE_TEST allows the symbol to be enabled on any
architecture, including ones with CONFIG_PM=3Dn, and in that case
select PM_GENERIC_DOMAINS would force it on against its own depends on
PM.

I'll change the select to be conditional:

    select PM_GENERIC_DOMAINS if PM

With PM=3Dn, PM_GENERIC_DOMAINS stays off and there is no unmet
dependency. The driver still compiles because dev_pm_genpd_rpm_always_on()
is a stub returning -EOPNOTSUPP in that configuration, and COMPILE_TEST
does not run on hardware anyway.

> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> [ ... ]
> > +     /*
> > +      * Pin the supplier before reading its drvdata: device_link_add()
> > +      * refuses to create a managed link while the supplier is being
> > +      * unbound, so if it succeeds the drvdata cannot be freed under u=
s.
> > +      * The link is released automatically when the consumer device is
> > +      * destroyed (DL_FLAG_AUTOREMOVE_CONSUMER), which covers all prob=
e
> > +      * failure paths, so no explicit device_link_remove() is needed.
> > +      */
> > +     if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER=
)) {
> > +             put_device(&pdev->dev);
> > +             return ERR_PTR(-EPROBE_DEFER);
> > +     }
> > +
> > +     pxpcs =3D platform_get_drvdata(pdev);
> > +     if (!pxpcs || !pxpcs->bus) {
>
> [Severity: High]
> Is this sequence in xpcs_rk_create() safe against a concurrent supplier
> unbind?
>
> The comment assumes device_link_add() returns NULL if the supplier is
> unbinding, but it actually succeeds and creates a link with a state like
> DL_STATE_SUPPLIER_UNBIND or DL_STATE_DORMANT.
>
> If userspace concurrently unbinds the XPCS supplier device while this
> consumer MAC driver is probing, reading the drvdata via
> platform_get_drvdata(pdev) might yield a pointer to devres memory that
> has already been freed by the supplier's remove path.
>
> Should this code acquire the device lock on the supplier, or otherwise
> verify the device is fully bound before dereferencing its drvdata?

Thanks for the review. This is a valid concern and I've fixed it in v8.

You're right that device_link_add() does not fail when the supplier is
being unbound. Looking at device_link_init_status(), a supplier in
DL_DEV_UNBINDING state produces a link with DL_STATE_SUPPLIER_UNBIND,
and the function returns non-NULL. The check at the top of
device_link_add() is device_pm_initialized(), not device_is_bound(), so
a supplier that is mid-unbind passes it.

The drvdata is now read under the supplier's device_lock, with a
device_is_bound() check:

        device_lock(&pdev->dev);
        if (!device_is_bound(&pdev->dev)) {
                device_unlock(&pdev->dev);
                put_device(&pdev->dev);
                return ERR_PTR(-EPROBE_DEFER);
        }
        pxpcs =3D platform_get_drvdata(pdev);
        device_unlock(&pdev->dev);

device_lock() serializes with __device_release_driver(), which also
takes the supplier's device lock while running its remove path, and
device_is_bound() confirms the driver is still attached before we read
its data. If the supplier is unbinding, we return -EPROBE_DEFER and
retry.

The device link is still established first so that the PM ordering and
the automatic cleanup on consumer removal are in place, but it is the
lock plus the bound check that keeps the drvdata valid, not the link
itself. I've updated the comment to say that.

Thanks,
Coia
