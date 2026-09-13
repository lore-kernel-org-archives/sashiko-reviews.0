Received: from mail-ej2-f10.google.com (mail-ej2-f10.google.com [74.125.228.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF64370AC0
	for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 17:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789318945; cv=pass; b=uPg1tIq14koKj9NDX8j1UuBvbc4reNmd1ReovrOk+m5G5FbL8IdB+Xort3GUMQWnt5a4U6EagBJUbZpPVKi2JtzS48ANWPcFirSsYgqNEV3yjThXBg1PcaSUvlVarPU4W5aHv0vAiUsMd0ZIB9eBhC9MKhsCh8MBHs/YqHkkP+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789318945; c=relaxed/simple;
	bh=7MqM8rpLnr5z5TUezX4PbEFSVD8MDXRA61Xn6G8NOHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAr+v+qHtFJlRtTpN0AwQhdvTsGFkHs3vG4G6lnryeZ29PR25+LBB8Cw6HHIl2jT+KUIWlSlnLRaG+9UUAGA7GAYC0cohpiGdp3xr9J7URuAiCXsp8X4Y8Imk3e6+/HYa5mslTD6CrfjVa/nDWXe1YoJwl7dEFjsD66fyDGYUPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5Bye8Mn; arc=pass smtp.client-ip=74.125.228.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5Bye8Mn"
Received: by mail-ej2-f10.google.com with SMTP id a640c23a62f3a-c25b4493edfso113139866b.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 10:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789318942; cv=none;
        d=google.com; s=arc-20260327;
        b=Cl1x61JE3eEbAtlY7O2I7RXwh3pcT/ezXu5sB1lwkv2hUg2mytSy214dl1EAIjsHyZ
         YLEdgRP1ISZF68AJssOv9Y82sZD7t5sbkkzHYlwZov94d0QGS0of4YJy0HlnhKdIhH+3
         vS+XrobHJdHZfNPxZNYfJaHNtOUF1lrOqwQW4t330p6W1ibWf7WEe8xJo8mjOzgXFntA
         Jn6XKtpAPnbjxbqmQ/P9joR6jDnBz0SNvL/FFQO4KLzqiWXQI89khYGQeYMU0SqZwF+T
         djhQ9REvGpBSNXB7ZjTWc73v6IkkI9Hse/70pqLVDwF3O28lvG5CkJliSShD8lPIPCcj
         U76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u3r0lTRDt7dv1B8F+vm9KqEdZJPwpZEhR6NU+5nIfvc=;
        fh=sKpHWfnTbcjzuT2a6X32MvMBQlrkUSHAx6oSYwF4Ym8=;
        b=QyrhToGojCJkk7U5u2EUMIxN9F3/kdcrBVw3XfvMPfZsObKWIGPch02Fy3UHNWPniD
         YudBx4knNEct1CrXOnQf7Cbj/LWyh9Vdgk95BmX+a9a7or9t29jRHi4filL0clYKfgAz
         BtP8N0epBRR78ReE8KSrvbd4+wGLG2aVr88489+C4m2n8/S+yqhNlyJs+FhG8UNqq6y6
         Sty0Jn5zcUV9oQ3HstbPA4ranwrvk4cpXBYKq61Te7M4O4idhGhmyxWf540qVvRQBwF+
         INnPpbiPJ0klQ4VtI7prJKd2YtGp0SUYtwR0pHEVi2FtHRSfQtoooo4d6YKivmaucKRa
         6+sw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789318942; x=1789923742; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u3r0lTRDt7dv1B8F+vm9KqEdZJPwpZEhR6NU+5nIfvc=;
        b=P5Bye8MnAGJfrAQCliDcUeBoMnjfQUEX0vJ7OqOxO+IgBYVhCAon1YRlhyowbe11u7
         o+PpsTovN1+uBr2AdI5ub2DXFOuIz6A1/Wi3BGKBKZ/PB+vGMoU2NnfZaK8Umai5yAWH
         ScyEWPfWSwPN17E2sdECt8ewp+77UJbs2D8dhCddZwMTd9NR4nIdCwmOWaEPAKqlRDIo
         KHGmwHp2X4wS4UUR7sncmLBTtAl0OErsj5anL8fpQHyfY3OrdwCz00YlIanuNRIpTMcP
         yqkhZyy9zIAKzj2vQF95yjbnibo7Eq/0OF0n2AmjgnVCX8lpC9wcalR5yu9Z/CH3Vibz
         C/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789318942; x=1789923742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3r0lTRDt7dv1B8F+vm9KqEdZJPwpZEhR6NU+5nIfvc=;
        b=sYKKs9vgNlEMDF0fzbIWASKVcpSrkVgl7RsgcqINX07e4KPNT7aVAfA0R40exK3UeW
         MZ8CxtNEiAo9sWKmaGsnvcixmgssNoGJqXGXePmFIK3WaverXzMbu2HuQEHgUBy/UIqh
         oQ5XH3dggTLeTr22AOupCvDgU8J4oRy5QZbr3a2x7/6oDK6/vy2qeQo3NkKiBRn6dtz9
         YAVWiSHaSqxs0a9lQmj+LFIBepeVUEv6X/39elZu3HzJPe6pAtwdckDOF0o1/XYLtY8a
         +nibakrHKSGp+cP/ZZcFD/P6o5XLSTgzKQRtlxJ4RW0Ihr75FP/26dgl3eQvu/+ZYln+
         fbrw==
X-Gm-Message-State: AFuF++lQc//+s52GAJ3lYWKEfHpy7mq0LDi03z1BmIAWb/xq7B5VmdfD
	5V2td3/nDepIZTMiwp+SJ3TX/xjtmdkIj5zedTH4VM53jaFn/GWYWSltyHA/t/zgSWWluido5U3
	FMCilusvdBQjuWJCqgKOWNBW1Iu3qE8sXX5Jr
X-Gm-Gg: AYBFou3oBgTli/jAUs8mY59FD5zrvonTIK2hFuSHherTsxO3RrCTC8GKk8rqtn8XS5Y
	s0YNMyz1QV5LqExAj8a8lFrKgg+n1WH/g4RCqeWMLRIosMcI60AxEun29kkhALT+cdmiXa49N5A
	a/MjyfjWO2RPm5FiuTi8CW7HTZjvxyWLlguBiC3RYrU7h+rwYwSXH9RwwEG3wBgE+OLjqB06JET
	L28taSVnXXJflgYv0sYKP1A0edfpDcaW+TRnr+1JM/Ob/DU1XNLadqaacSUZH84cCLUoW7n4l50
	EMx4mGP8H0GdE/39fxMBVR5rV+AW/5csnmxETkf08HAtJz/5AiEtpCyXIw==
X-Received: by 2002:a17:907:72cb:b0:c25:8c74:71e6 with SMTP id
 a640c23a62f3a-c2966537005mr646354966b.10.1789318941762; Sun, 13 Sep 2026
 10:02:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907153713.2572547-2-coiaprant@gmail.com> <20260907153713.2572547-9-coiaprant@gmail.com>
 <20260908154108.6864E1F00A3A@smtp.kernel.org>
In-Reply-To: <20260908154108.6864E1F00A3A@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Mon, 14 Sep 2026 01:02:10 +0800
X-Gm-Features: AcwNN1XgtcPUOC2eP2OxkBkMdRnvIa2R9l1DdLogBuRgiStmD3sxsfDlmW79idI
Message-ID: <CALj3r0i79sWnhyQU2xmECexi8G2VaznVOHWnuzdw+h9AzeKNSQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 07/10] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, 
	neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, 
	vkoul@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=888=E6=97=A5=E5=91=
=A8=E4=BA=8C 23:41=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] A Time-of-Check to Time-of-Use (TOCTOU) race condition in xpcs_r=
k_create allows a concurrent unbind of the supplier to free the MDIO bus, l=
eading to a Use-After-Free.
> - [Medium] Incorrect LIFO teardown ordering in devres clock cleanup actio=
n violates proper device initialization and PM hierarchy rules.
> --
>
> commit 7142dbf6b28b5ee94d0edc969bcf16d1183a5f41
> Author: Coia Prant <coiaprant@gmail.com>
>
> net: pcs: xpcs: add Rockchip RK3568 platform glue driver
>
> This commit adds a platform glue driver for the Synopsys DesignWare xpcs
> integrated in the Rockchip RK3568 SoC. It creates a virtual mdio bus to
> translate mdio operations to apb3 memory-mapped register accesses.
>
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TR=
M%20Part2%20V1.1-20210301.pdf (Page 2078)
>
> > diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-r=
k.c
> > new file mode 100644
> > index 0000000000000..68bcaa1a5cbbf
> > --- /dev/null
> > +++ b/drivers/net/pcs/pcs-xpcs-rk.c
> [ ... ]
> > +static void xpcs_rk_exit_clk(void *data)
> > +{
> > +     struct dw_xpcs_rk *pxpcs =3D data;
> > +     struct device *dev =3D &pxpcs->pdev->dev;
> > +
> > +     clk_disable_unprepare(pxpcs->eee_clk);
> > +
> > +     pm_runtime_force_suspend(dev);
>
> [Severity: Medium]
> Does this sequence result in the clock being disabled before the device i=
s
> suspended?
>
> In xpcs_rk_init_clk(), eee_clk is enabled first, followed by a call to
> pm_runtime_enable(), allowing the device to become runtime active. During
> teardown, pm_runtime_force_suspend() invokes xpcs_rk_pm_runtime_suspend()
> to disable csr_clk.
>
> Calling clk_disable_unprepare() for eee_clk before pm_runtime_force_suspe=
nd()
> violates last-in, first-out ordering, disabling the prerequisite clock wh=
ile
> the device is still considered active. Should pm_runtime_force_suspend() =
be
> called prior to disabling the eee_clk?

Sure, I will reorder it.
