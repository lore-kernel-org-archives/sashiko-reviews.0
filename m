Received: from mail-ej2-f0.google.com (mail-ej2-f0.google.com [74.125.228.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D8C3101A0
	for <sashiko-reviews@lists.linux.dev>; Thu, 24 Sep 2026 05:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790226792; cv=pass; b=fldUGE+dSWGbShBdiqbS2HrtWhSvFx00jxe/oSTa5l+chJcgR04w6OrDeQzzXyjl6sfS2A0CO982OKPDAxfawYar2ZVLYhSBCBQfgfeSiNo5ztV5E/8VObke5qIFBOgTqtcfN/yXnaCUYtnyr6Hz3UzHk7LxY3PbSgVtjBC1JcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790226792; c=relaxed/simple;
	bh=9SPc+L7BuklXAX0yw4Mp3qv1IcpydHf7I9c54H106T0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XBo/UqD3KRpWCMSvdKy4O441YZC06xbkBAM/K8V8MuS5USH8INV9/yK8787QK4oq11w8BhkmRRlDmyGVfz0F4LbV9fXM6VWyDIMLzgq9fIrNLC8PczIa1ZgyXP+6WFjVLLVnP37eN4N4ZNtDMVDt5Q5Od49b5cqCFp78q8wHP6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmbfS86y; arc=pass smtp.client-ip=74.125.228.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmbfS86y"
Received: by mail-ej2-f0.google.com with SMTP id a640c23a62f3a-c293a9e09b9so79118166b.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 22:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790226789; cv=none;
        d=google.com; s=arc-20260327;
        b=k57jsCxlP9RLYqWvy0xCeWR7kDG7RO3M7xMOtEzovzHKGIxm+tf5Hyc2g3NeDnRnyh
         KbYDY691Ry/aQZdy5vAPPYRsWXPc0rQM9CZ6uHE0QsbvGdYfMNSp9/ziiirLCNbfRYa2
         uwe5ZkbmeieTRGQP1gCqbWeR8O8jZwZTo3wmAt33UlkcCh4BJVmHY7/XgIsEaSRZxt+j
         RQ0Y5P1aEpXQGD6f3wsP2uXdCgHf8d2G1waCIc/xRjXfqnYqeP0VlsA2/4B8yWztBOSG
         pyVzQk3waZacSwLYtPHlcDkMU7C2QBwc+xW8Znu/NpLFgUSpAuaxdr/kMEfkX95DKot8
         PE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F0MbMqtSvR+bKuyDMIBNdTC0TQ1xzz8SEFZhDO0+ELc=;
        fh=u1vc5nOb9/JYMQ1/Y/jxdEOi0UiD+Es0eskS5ogEvVA=;
        b=k7PnNYVtLnRi+TImep8q9q67E1fUn4e1T4kExEfZhhKhAax4OwBC1sYrFHp9nxRriY
         QfhcwS9VoWu4CvwyQViEsx+z2CFf7oiGYcE7lxnJFTSVmzgo784f0NbX/gi6TVuykoaO
         MKxLmQ2yfhnuBNE/mFZUg/Jp5SqLHtUWxVkU9rNppcfPBnuhMART73N7IOF24oTWAzsB
         LsnwwvaHKsG/op1+ByT4V4F+9l8dnCTFsZL2579egDGYvIwf3mWE+BAic8ZrciwP7eRZ
         MwdVjQvRbbTgFztdAtqit8/T8Gf4T7tSy2WYYyPr5pb0q41+6dbje0ginC123y3fXssO
         i+Sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790226789; x=1790831589; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0MbMqtSvR+bKuyDMIBNdTC0TQ1xzz8SEFZhDO0+ELc=;
        b=RmbfS86ykFnk95nLTe8QqCZjLAetD2RoNNwDAfr4WWysorAGSkuSz8nKHAADXlTUqs
         3fnQuDxJURvBUUIyXRpP03ZQiY0H+EIA/7OtdzgIeh8/03QYy8/DXo45fmfNsbgrckib
         e447qZlJq7GW9yD5CaV6FYXRwYMGrCWU8Q528yi3oMXOg18D91w4F0eQqxJP9zZSJVfQ
         XN8a2dAx2h8QcsxjwdKNfGSii8Tl7hS/7S6yB7GuDwlusqipveaJ8L4ZPhrpuk2pHlti
         CBbRG6y/aE7RMlP2lraQzp8doa7bH2xXUB9nh49hgpsDm5nUw0ESpPc4QBMAo6YfJjBX
         xQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790226789; x=1790831589;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0MbMqtSvR+bKuyDMIBNdTC0TQ1xzz8SEFZhDO0+ELc=;
        b=hc7F/nMRelBiTf2b8xRHi43RtqHeiE7cBTvbtl2Z7IPqF+R+oe+TpzkzMyl0UN3stD
         tsIKfoy+zAKO3NJpgjF5JiHlSL5u9ChMRyZTF+NVaXSGvl4iI9j/cjKWBsYRETlDvqcy
         CKplh8gfVoe6fij+bEOQ+1sbl+Tiipl66S7R4D/D/fPGMeqvkb4H4ip7sg2IMP38If5n
         hbq4JVt9SBM2oJetJsXGKWg+ydrO/FQV0ji6HeZfWBUERIOhj/cAO6rqP4k27h1ygcA/
         zJkx/bs7t6cA+IgpWo28/yDqdG1Xjcal7S0c6DygwiUPIHEl1lIP1zOgb2qvvBmqejqs
         X3TA==
X-Gm-Message-State: AFuF++ngBGe0Q3nvHkwJ8+JPXYK0HAAgnAMQ2mvWInF54uidSnl9Xldw
	D19Bn1wjS8w+sSAWB6O+WWw0y94BI6s/1iieX4aAcSGJPzgZSAKBdxI5CF/lcSs9bNvnGcmEF36
	7HiHvlhhtWbNXlCzRAT8LD3///XBzqPIFdj3/IuRapg==
X-Gm-Gg: AYBFou2zwqv9HOrgUq6r3UurSK5tUDa3iqFSp07+QyLgp9wFT9MYB2NqpzXcopXAC84
	tsuAHCZI/O0Du2OqgP2GcSKxyOVsHIxIZKip9aFwFLjOTpwMX1tsWZFz7o4F23TX7tCaieUEF9C
	CMUduNoEuoADLAvF7GgYxa0Ds1mHbVj3gYkcsZnhvZnO4+mYQJ8YPrNgmJ+wC/N8ZpQ9i9LWJdm
	Bw2Ij9AZ0PzQqPVN5/fxEE/EAEK85UeAeQKHFhe8DO9+yRLzpiok/HssJzaStPQhb0yXRBhM9Z9
	2+NsodcJ3bT9q5UHnzL9iztXfh3C81M5Grb/XucapcvqZB8LWjbYzRubdw==
X-Received: by 2002:a17:907:a2c8:b0:c29:3838:dd69 with SMTP id
 a640c23a62f3a-c2ac256657bmr83116266b.39.1790226788805; Wed, 23 Sep 2026
 22:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922200336.2201212-1-coiaprant@gmail.com> <20260922200336.2201212-8-coiaprant@gmail.com>
 <20260923200523.E766D1F00898@smtp.kernel.org>
In-Reply-To: <20260923200523.E766D1F00898@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 24 Sep 2026 13:12:57 +0800
X-Gm-Features: AclHuK-lw6TEGWFDRwVyt75CcRiJm_UXyDL5fRY6bD8kdC3GnVL_Pk8dt0Fcf5w
Message-ID: <CALj3r0jt0hFRGrhxiqWnD2XmKrj4vy1U1to-1XrhT_ZesJ19Wg@mail.gmail.com>
Subject: Re: [PATCH net-next v10 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
	olteanv@gmail.com, wsa+renesas@sang-engineering.com, vkoul@kernel.org, 
	neil.armstrong@linaro.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8824=E6=97=A5=E5=91=
=A8=E5=9B=9B 04:05=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] pm: unbalanced pm_runtime_enable on teardown
> --
>
> commit 43d28493f3eec64a96af219e5448ffe0efe56d58
> Author: Coia Prant <coiaprant@gmail.com>
> net: pcs: xpcs: add Rockchip RK3568 platform glue driver
>
> This commit introduces a new platform glue driver for the Synopsys Design=
Ware
> XPCS on Rockchip RK3568 SoCs. It implements an MDIO bus that translates
> requests to APB3 memory-mapped registers. It also adds necessary clock an=
d
> power domain management for the device.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part1%20V1.1-20210301.pdf (Page 59, CRU_CLKSEL_CON29)
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part2%20V1.1-20210301.pdf (Page 2078)
>
> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > new file mode 100644
> > index 0000000000000..35ee980a759e5
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> [ ... ]
> > +static void xpcs_rk_exit_clk(void *data)
> > +{
> > +     struct dw_xpcs_rk *pxpcs =3D data;
> > +     struct device *dev =3D &pxpcs->pdev->dev;
> > +
> > +     pm_runtime_force_suspend(dev);
> > +     clk_disable_unprepare(pxpcs->eee_clk);
> > +}
>
> [Severity: Medium]
> Could this lead to an unbalanced pm_runtime_enable?
>
> In xpcs_rk_init_clk(), pm_runtime_enable(dev) is called, and this functio=
n
> xpcs_rk_exit_clk() is registered as the devm teardown action. However,
> pm_runtime_disable(dev) is not called here.
>
> If the driver is unbound via sysfs or fails to probe later in the sequenc=
e,
> the teardown action runs but leaves PM runtime enabled. This can trigger
> kernel warnings about an unbalanced pm_runtime_enable and break subsequen=
t
> device binding PM state.

pm_runtime_force_suspend() calls pm_runtime_disable() unconditionally
before invoking the runtime_suspend callback, so runtime PM is already
disabled on the success path. The runtime_suspend callback in this
driver always returns 0, so the error path that re-enables runtime PM
is never taken. No change needed.
