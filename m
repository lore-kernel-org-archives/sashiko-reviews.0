Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404C74FECDA
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 15:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572638; cv=pass; b=i/hfP6xrH0oCTBgOcTpym1rUYXKIjIVpEy1apOngsuw2e19Z3r79BdSOMVtY83wWg4NvHoMRzQ7KkXOFHPI+mtGNMbbyhqaGRxKLt5QVY2xyKpHrGhZ1I5Gk9dQRDzmMKkqsQ3LXrs683DElKcVoDnGLJmzC/A/VG1BJc9ZZQp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572638; c=relaxed/simple;
	bh=O3QLn2CpPoW3DrWyVcpQzdDveriLtVtFogD3GR0l6ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PHRrJpRTWqsRSNz8IzB1GThyRSihINRULWJzEQjpjT1UYbFMdVCW1KpRP6kmQI58m8ysKGox/AlAGT6nGHIvrxpgiZFiQ4/G2o1r0xbVpkTfcLuAZDMBX15W69D7t7VCTE0DIoCBCO6BefUbRvlwLkvj2jyiTbyHG/PH/vVoi0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FY00uXxO; arc=pass smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FY00uXxO"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c29440ee0e7so299891466b.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789572628; cv=none;
        d=google.com; s=arc-20260327;
        b=r0rkbWS63P3ToRi+xmdMGLL6gVLgkgUqFiZLZ+klJZr1o30XAP4hF4wPGh2Gl7RlUO
         GDFOvS3bT8opa52//YWOz1DJc6BP3qAgkm6IvOcSdOxF86wyrH0/rDAOmtXX3tTISp+F
         mbGdBFFNX4niu51J1Kzm76UUYBx3FzeuHNhK+5T1DkiRG8NithWRtgbpm5R3jMq7EFJV
         RezGrEijQLdDb8cSzYdPOkvffJjDE4ENac5z11J/a9enCKDI2UdRmipJpfILN95HPLu+
         Q9VLcxDRyv5WxHeX6KWsrEMYOhNtYZLU1EfZeYTowEG0/TcrtMe96iRB86MT66F7ufdk
         +xdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3iZhP1DReptHMS9Q1/qn9BvRZUgDeQPXvK/H8HNEb5g=;
        fh=je6+oLWJ3r+JMTcIL3VEXGGC5pfsNlFNzYu2p+/jrYM=;
        b=NeCaCNzcLJZVSSXnahciCPRQTu5Il5/V7PzO4NonxsuIRIufg49fN/P75g3rdSrW7+
         DSFonSAWUn8rkpkjuA+cwniyzWekIAaKq7K3H/zSPZiK2dPOs27qJu9d9BYYETO2+oOr
         LSoD+Dahjb8lYVPYJy5VOZXgMQCOWZm1PR7YQAkYA8G7xL8YXkBtiFmPkYtt7d7rs0WN
         uDOS8euohzrHz1bjbd3CnC5QQ05yfQTaWa0CI9Pyb0C0sDUEqEj2dVtOvo9kK0014mxm
         +RJ5rbhmn9iwQBf6u9AHkUMQ5Ft664A6qkiZTYi7tXHbRAweS0WNbMogJGj+S6ob7pS6
         CwYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789572628; x=1790177428; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3iZhP1DReptHMS9Q1/qn9BvRZUgDeQPXvK/H8HNEb5g=;
        b=FY00uXxODm8XenCKxkd8L7w4zsYagPo1ik/zrRJrM47MIPoAOBzFrsDQjxQQmYbc62
         1RIxOgwBpWjpwdum9YQo1VZkuDC370OEEV9vCRCw+8KH9tSLlnOuTjH7kLdfX/7PmeeX
         Ysnft8pjK+n8mBNUEvZ71CaUR4BE8dvYwkTDV0BnZAUUR/T7WoYkvKr2S+nlMWIBP6do
         i5XoqyP/2ozA+qfKajzlhLkOyo+u52U3X/vdoD2FYVvUg3STqNITAiQ4LzLFKIN1kcF/
         R7Q3YaZ/SjY/4n+aa9PWBPa3MgMmm43zw2BAtUmACnnUXZf2pjz3FrOetzsBEvEHwzqI
         kPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572628; x=1790177428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3iZhP1DReptHMS9Q1/qn9BvRZUgDeQPXvK/H8HNEb5g=;
        b=OtNqMwLvoKSZwJzjn9C4kJWIDduIbKji0hKdY+ijlscwGQSoq3kASaNpAMxOfPzZn2
         UQK47Rzlo0oFohPbmTU5msuiHBXITQ5H/7gI7VTRdKL83Sbz3q5AuyhQS1alWutoBQXE
         2FRXZ5fc+02JiWtcGGipm1EbDodsEDT0b2M28rcm56snLdRlxjiXvoJvt9xDnF7FkI+J
         K5ZLDaXmumrQZDFK3COU3SddRxfKyYBwCgEQTu0BvixWaPqH2RHL0wleccat64db2vyD
         JvoHK/scjCAKk6FqjfpGBH2E0/i91jm12kWQKMAOPgt5bmtvpgUCQjuoCqL0msA3EI7P
         JIdw==
X-Gm-Message-State: AFuF++ls8WwdCrIftMOSLHfuTWG2KdBG1rua9tiYSDg3n6vgvPxCyFQp
	kAacL3HNl8oAairstNE72yhHIl4U9Fk6uSuNDMWYoTq9WhwOVhrFN+IQ4BC8HJ6jUYQdMTzHaFb
	pRJ7VqbTRLNC4EXcMPGtEKimBrfQA5CtBsBFbL1Bk6w==
X-Gm-Gg: AYBFou2sL/24BvPOVP6jHmBy+kOP0FtVMtnevPH4bdMq3meV+imRvLKELFBxsy+wked
	f2tDeOSNVQddw6ryuo9R4BBJkSo/ag6sfkKnMdAWXg0/l304m5+aLR+sH4XFgPdlhALMxm0U3VX
	iPLJcU1ViKMGQxGTpOURVZMWr6bTUUTzqjhp7D/frTXXrx6BXy0ggejHqi0MNRO2NUhRdwxPe7X
	Fh3H8fjhQTK+YF5+zd6QMfpmOnVK+SvcZuXysKK2N1YCR7eT2/rOB7UC9kgRUrBPAtEa/0xk6w8
	VcHq9rcYkvo8NHqF17DQgk3Ta7nwvdUTyqr2uiJ7a6Is7F0iRwPt4spF5w==
X-Received: by 2002:a17:907:c49a:b0:c25:8e53:45ca with SMTP id
 a640c23a62f3a-c29e52bf59bmr425926066b.21.1789572627794; Wed, 16 Sep 2026
 08:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260915123802.1561724-1-coiaprant@gmail.com> <20260915123802.1561724-6-coiaprant@gmail.com>
 <20260916145017.00DBA1F000FF@smtp.kernel.org>
In-Reply-To: <20260916145017.00DBA1F000FF@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 16 Sep 2026 23:30:16 +0800
X-Gm-Features: AcwNN1VAHr5mQCG8cyXXjxTi5LTBgNFWZMnSTKdoeh45_aT0Zqjxqq28yQF9Z9M
Message-ID: <CALj3r0hA00u7E-N8o+rkMae_8wHt9s=EfAcHO8TE=ERHKmmYWw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 05/11] arm64: dts: rockchip: rk3568: add XPCS
 and fixed-clock nodes
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	wsa+renesas@sang-engineering.com, olteanv@gmail.com, 
	devicetree@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=97=A5=E5=91=
=A8=E4=B8=89 22:50=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dts: incorrect fixed-clock modeling for XPCS generated clock
> --
>
> commit 18edca8a678c045ba2fe3270b1f3ca0505b94baa
> Author: Coia Prant <coiaprant@gmail.com>
>
> arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
>
> This commit adds the DesignWare XPCS node and its sub-nodes for the RK356=
8
> SoC, mapping it to the APB3 bus. It also adds two fixed-clock nodes to
> provide reference clocks for the GMACs when operating with XPCS.
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3568.dtsi
> > index 3bc653f027f1f..227d03e336043 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> [ ... ]
> > +     clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac0_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
>
> [Severity: Medium]
> Does modeling the XPCS-generated clock as an independent fixed-clock bypa=
ss
> power management and dependency tracking?
>
> Because the clock framework has no dependency link to the XPCS power doma=
in
> (RK3568_PD_PIPE), it seems it will switch the GMAC to this clock even if =
the
> XPCS block has not yet probed and is still power-gated.
>
> When the GMAC device uses this via assigned-clocks, the driver core switc=
hes
> the parent clock before the GMAC probe function is executed. If XPCS is
> absent or uninitialized, could switching to this unpowered clock hang the
> system at boot time?
>
> Would it be safer to have the XPCS or SerDes node itself act as the clock
> provider so the clock framework properly tracks power domain lifecycles?
>
> > +
> > +     clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac1_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
>
> [Severity: Medium]
> Is this second XPCS-generated MAC clock subject to the same decoupling fr=
om
> the XPCS power domain as the first clock?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915123802.15=
61724-1-coiaprant@gmail.com?part=3D5

Thanks for the review.

The dependency is enforced by EPROBE_DEFER instead. If the XPCS has not
probed yet, pxpcs->bus is NULL, xpcs_rk_create() returns -EPROBE_DEFER,
rk_pcs_init() propagates it, and the GMAC probe fails and retries. The
GMAC cannot reach a state where it uses the XPCS clock while the XPCS
is unpowered.

On the assigned-clock-parents path: fixed-clock has no provider driver,
so the clock framework registers it during early init. Switching the
parent to it only updates the CCF parent pointer and does not touch any
hardware. The actual clk_prepare_enable() happens in the GMAC probe,
by which time the XPCS is ready.

Making XPCS a clock provider would require a clock controller driver
for a block that has no controllable clock output. fixed-clock is the
correct description for a fixed 125 MHz output.

Thanks,
Coia
