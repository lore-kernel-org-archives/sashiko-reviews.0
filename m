Received: from mail-ed2-f10.google.com (mail-ed2-f10.google.com [74.125.228.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C79541D12B
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 10:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789468571; cv=pass; b=BxGD90JxMLTKPJj9ExQV8SBSGXc0lHwVxMF8r7jvYxpRs4XuMasDPj+eDhzZ2K2Pg6F3dAk8J3d1L5uj4ut4+Lxg87VK2fwBGqEmtNcih2ShzMflg4HMz78B1u4xK4ljnj2qrNEAdF4WlPwsnsUmzH5dlL864XZL1KopH8ZQxp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789468571; c=relaxed/simple;
	bh=lVH5yPIi3/pyYRXwtAiWL+HzSoiC/igDNveot238DKo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAL9fmI1UJGg9KJGLBJoNYgGPsdda5H7d0uCsdKQe4S+NZKRNJk5WJR37TKW8/pPCWgoI/DMs6eIf7tD7lP0a1N1ohXxkrwpZUKGR6dmPJstRewJSfAnyWb/4UHTdaThevQaB5wi8/xlfg44KP/sdHLVpA1CJPOVq0pLNat+/cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N39cfNHZ; arc=pass smtp.client-ip=74.125.228.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N39cfNHZ"
Received: by mail-ed2-f10.google.com with SMTP id 4fb4d7f45d1cf-6a6713aec3bso2691183a12.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 03:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789468568; cv=none;
        d=google.com; s=arc-20260327;
        b=EFBnOK3eapv9aV+6spbhSBl9xnN5trtjeZY3fyfVeznCv2mC5MvR3MNfzbuieS3OW2
         s4U30hk1ATl7qvXWMjyyXq4ET6IiPf1E5p6RjjzQ5wrrrS/V3/Jcnw81wnD4AqpWIMQW
         gAO8VAJrkhw2ds+0RJstz26dv9ZC/qnB42+7pxaXyhZ0qi0fwp1WF+nnaZs1BnK2Tdts
         E6KIbdDltMf0C9Z7njbRUWcJ0CFiGwRzESl7/qmiiqX53jzTXKh6hV9wKDEcvzg6OgG7
         fV4oT1hNMh1LyLTsXIGayTz0Zf+pK3eNIJDnToHGpfxJw8PWLWaZprlQJyjJaE6kYfWN
         ruOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EybIxRu7gh0/uGvNpGNQAsB/2hq7wOMr36eqhjWJ4kA=;
        fh=HoIEfnVPM5gZs5Gg3H15i/nRn/VIzCuEe4n4Mon3SgI=;
        b=s4N3i0tOpqvQ80D62YPnXsWNiNn5nZey6lvs6Xk/o23NljlRCg92BMbcUUZOk64a6x
         4tZoCnauO5nIkQQi0CktKvD7frX5TKUP+edkS5lq4gJKXm6vU5pqot04KiFvL0ccK6UL
         QMs0N1nac7tH5SCwSUT02E4EuqXfzoIx0uIh5rBDYASa5uEk/17F8VXP0+sEXd5HPaKu
         rdXRq7cn3TTj1Zh1wZhJ56sCmptlFveRD/GKysaBhnNNDNbtwAWaPYyysupXZIwLqBk0
         RMJ30pgIXiI/jNegM5ssr6cV9o2oLjIT5dvmt/iijPE1WdwSJSXxEGchf2m4VRN4byZO
         OCKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789468568; x=1790073368; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EybIxRu7gh0/uGvNpGNQAsB/2hq7wOMr36eqhjWJ4kA=;
        b=N39cfNHZjtRH/Dqd3z0wKgkxIB0oxGHiEi9gshEMjbIFSe0LInOa/u/tWZI29rQ1/j
         hQfavAkBnbaZWVBTykAMf1Cu4CwhTJfHgp4t0gxPhrTcGpRNl5zws448tnVRJ90MkMy+
         PU6f/F1Sr9hiJ18dTbqf4bupElxjuf8wl1IdI2/EcVpOAG41YtBJOwyC4fIAo/asg9dx
         xznI+LE8MVoyeuGHfZ8/rlhIeF9lUfSiZ9waF37nEjfMYGNc+LwJHZpnKjF1Eb9hB3GU
         ExU7jgLiFLbpFIyJ5VP7mEsXirAQA8I5k53vxcSvCL6wIQWauJ6d+eZaWq+zLGq927Lw
         veKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789468568; x=1790073368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EybIxRu7gh0/uGvNpGNQAsB/2hq7wOMr36eqhjWJ4kA=;
        b=t8WFrFGUFRisEEFoDzBSIlUoWChJJbBiH33zcaomecWTgniUcEmBbTmzeh9fsVY5vp
         WC+3wwbTFJIPMe0xaDWbtOwxAgBrnPgK9o0J3JSvdOus71SGthn1ZJS+HqhcK/fvniCw
         4wR0xJxYozwJClUe6/7l2bRE0cJiediappS854Lelo5+G6B7OTONHwLHVYHppWWpGYl9
         gkhs/YufyjDbxfSzXHQYPByIxtDUPAv0GVHURPziRYNPNKVywyshJyLgzlTlfbSJ4xtz
         0XpvUwWG+75pz9cMtPWty8QM/qKRiOyBOJkHK/tOeDK0sb0Z/66sJXzvhSX60A3oY8c4
         EOhg==
X-Gm-Message-State: AFuF++kCYzaz55LhBeJFDpzfx0rGFgecfDivm5D7tp7IRq532RDupEzT
	gFFxU6oeOiKn9k1Epp0fMrhz5hneeELIvgYPx7Ebw0j+EYxDP7W1+AQzwax0tOA1v4S6e59hpHK
	9+ZeOXU3UHkcBLuy4m0rNlXN/r+T9Ci1Gi9A9vF8cxQ==
X-Gm-Gg: AYBFou3Rdh4CpnKGE5g8GSheIXi3UONSe8OZJ/ZXcyOcx6BgeHcr+GBRDy4B8Dfekgs
	vKeR9XAaweUTSaOuaDwsvvlwPVkwkQSweXJJM65MrfxLjivLdBmjorfNWDf7+3ShcR9/QeB7ZD8
	/zW9Y+sFy3J8DLT2sSxm3txHHZQPCbgG4bWwECXl4CBPcK6bbrzMULI4/PHhalpFzYbm0pdSZGt
	W616thVepyjKS5rE7JNHNOjCpclnvp8B3iFth5eY5cSlN7lp/AfTCew/yoE0zznmVYqCdmd3ABl
	IohIykgX6qgIramdSdjhhPyulbKRDFB6RZ8Uy9RVSbKhcuB1cw4I4Ft16g==
X-Received: by 2002:a17:907:80c:b0:c29:1678:de36 with SMTP id
 a640c23a62f3a-c29b8756facmr375515766b.46.1789468567393; Tue, 15 Sep 2026
 03:36:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260913185849.907479-1-coiaprant@gmail.com> <20260913185849.907479-7-coiaprant@gmail.com>
 <20260914194421.944211F00893@smtp.kernel.org>
In-Reply-To: <20260914194421.944211F00893@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 15 Sep 2026 18:35:54 +0800
X-Gm-Features: AcwNN1VJezYkhl7wtVaby68YugY1136mwuoA1MxlIq9aSNGHJATVbB4iAMAwGQo
Message-ID: <CALj3r0jHGpLSRgErU5Vy3xO-CKMsdY_6ixAczeapx32yFbSziA@mail.gmail.com>
Subject: Re: [PATCH net-next v5 06/11] net: pcs: xpcs: add ANRESTART support
 for SGMII link recovery
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, 
	conor+dt@kernel.org, linux-phy@lists.infradead.org, 
	wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8815=E6=97=A5=E5=91=
=A8=E4=BA=8C 03:44=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Unconditionally applying the RK3568 SGMII AN restart quirk cau=
ses an infinite interrupt storm or workqueue loop on standard interrupt-dri=
ven DW XPCS configurations.
> --
>
> commit 78eb5488d0c0d3fe9f609e56e59710ced52856fa
> Author: Coia Prant <coiaprant@gmail.com>
>
> net: pcs: xpcs: add ANRESTART support for SGMII link recovery
>
> This patch adds BMCR_ANRESTART to DW XPCS when configuring auto-negotiati=
on
> and when the link goes down. This is intended to resolve an issue on some
> platforms (like RK3568) where the PCS does not automatically restart
> auto-negotiation when the link goes down and comes back up.
>
> > diff --git a/drivers/net/pcs/pcs-xpcs.c b/drivers/net/pcs/pcs-xpcs.c
> > index 0337e2bcc0125..8c3875b6985b9 100644
> > --- a/drivers/net/pcs/pcs-xpcs.c
> > +++ b/drivers/net/pcs/pcs-xpcs.c
> [ ... ]
> > @@ -1093,9 +1107,18 @@ static int xpcs_get_state_c37_sgmii(struct dw_xp=
cs *xpcs,
> >               return 0;
> >       }
> >
> > -     /* Clear AN complete status or interrupt */
> > -     if (state->an_complete)
> > -             xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
> > +     if (state->an_complete) {
> > +             /* Clear AN complete status or interrupt */
> > +             ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INT=
R_STS, 0);
> > +             if (ret < 0)
> > +                     return ret;
> > +
> > +             /* Initiate the next round of AN */
> > +             ret =3D xpcs_modify(xpcs, MDIO_MMD_VEND2, MII_BMCR, BMCR_=
ANRESTART,
> > +                               BMCR_ANRESTART);
>
> [Severity: Medium]
> Could unconditionally applying this AN restart quirk cause an infinite
> interrupt storm or MDIO polling loop on standard DW XPCS configurations?
>
> If a cable is disconnected on an SGMII port, the PHY may continuously tra=
nsmit
> the 'Link Down' AN configuration word. When the MAC completes AN and gene=
rates
> an interrupt, xpcs_get_state_c37_sgmii() is called. It clears the interru=
pt
> and unconditionally sets BMCR_ANRESTART.
>
> Will this cause the hardware to reset its AN state machine, immediately
> complete AN again with the PHY's continuous 'Link Down' word, and fire an=
other
> interrupt, creating an endless loop?
>
> Should this behavior be isolated to only the platforms that require the q=
uirk
> (like RK3568), rather than applied to all hardware using the DesignWare X=
PCS IP?

Thanks for the review. The High item describes intended behaviour
rather than a defect.

The state you identified =E2=80=94 ANCMPLT latched with LNKSTS clear =E2=80=
=94 is the
normal state of an SGMII port whose link partner's media side is down.
The partner PHY keeps sending a LNKSTS=3D0 config word, so the PCS
completes AN and latches ANCMPLT while LNKSTS stays clear.

That is precisely the state the restart is meant to handle. Without it,
the PCS stays in that state indefinitely and never re-runs AN when the
partner comes back, so the link can never recover. Re-issuing ANRESTART
on each poll while the link is down is the mechanism that makes
recovery possible: on the next poll the PCS re-runs AN, and if the
partner has come back with LNKSTS=3D1 the link comes up.

On the poll rate: xpcs->pcs.poll is set for RK3568, so this runs at
phylink's resolve interval, roughly once per second. A single MDIO
register write per second is not a concern. On interrupt-driven parts
the behaviour was tested by Wangxun and no adverse effect was observed.

Thanks,
Coia
