Received: from mail-ej2-f2.google.com (mail-ej2-f2.google.com [74.125.228.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A344D2EC4
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 20:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146787; cv=pass; b=MVUXwmWwvpJDMmaGZIOSS3YrlKP9Rt6lekwiZLiIxdUkjFRFk60FselfzXjyA9RpDmnNr0nr1S04tRJi3hNr31e2gpAhTCm1wrOMPQqhptpF7gMRQYp/wy4pWh4ECK2PUxzyOirELpKNgG0ku5Wh0Il1UcbQW0xn6ZK4dob1KAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146787; c=relaxed/simple;
	bh=Q5ccYVWvR+5jgS+UYin62kxL9TLl/TrtAkaA8NvL9HI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOHRBhr6xWoxpwaA5mfeFOaxBWlqTB3NLCiVZVQ7oG9wSS6/UF8JzNEl1yB5gp7u5qaY75QLzklUH0svLPAI0IppUFBs+repaxPGpVGvGE2V1WVBSRFrAlrSUXdWeIY0JUolMv/x4YYUAwSfSWoLZDOuLPRFB6UO11MJr88NMmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4dKTRXz; arc=pass smtp.client-ip=74.125.228.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4dKTRXz"
Received: by mail-ej2-f2.google.com with SMTP id a640c23a62f3a-c15f8dd6f18so360729766b.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 13:19:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784146784; cv=none;
        d=google.com; s=arc-20260327;
        b=aTaPl7smCIEO4QpI5n/kmKBlkz5cTsfUfdojAawLyI4l/hXG1Tp5vS1hkkj4RCSEwi
         I916wEAmfKsLeOHta1CpOXUnC5qvcM0h+wqdcGBfXyYn3uZdSKJFBCA71aiu7TtBKD8f
         WP/prHYZjoEZBflYM6TIN3xIZYBNJopM+8OJocH+4S7qbkSD2oUUB5U7wlEHjdQpDLew
         /VlJJcELlaMwuOQEPQKQeDVGTfKxAoYXJlIjk13pyLBRcp8ztw0xdcn0yRPX2X4gskJO
         WBDBwL0xUG7W179JJDO9w3GDWB3+wtqxvvD0iRUFY3odcZgI1QdFYISLs0OJIM2DaljU
         AiaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nubd27NNIvTV4B3FNhrgAkY1uJlNnIcqTLmtlT2/89o=;
        fh=RaVSQyovX+axG/rFSpJv47KhzLBKKJV+/S7D0MMWgBI=;
        b=C+/DCJTrdZliqFtUzSc/s4sKz+pjYJEx9bSsRABmxkOzUVxnMarKBAltB3bcg2EfuB
         gfl4TUWeRIlWd4j5x+vn+qDh/T1yIHjNsWtZj2h8Qf+pAW61WRt95gNEkqIBiLwBVGiJ
         GcLnj+1mwQzUxbWrBoCSBdUEpX43wV5a1+UWPmF0ujAob0vcprfQOLmer19HQTXNJiNj
         /YfN19OyEhVDL6c6SQPcN92xMBfiOVc2YB68398WeMsUQ0PjUNRCVQTh7no4NBWIVEoY
         FfQ9clmgvs858OWq2/EP3uETCxZa36i/8BcBhIdVJJxgqGt2MO/VgASUxvgifD21q2BC
         auEg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784146784; x=1784751584; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nubd27NNIvTV4B3FNhrgAkY1uJlNnIcqTLmtlT2/89o=;
        b=s4dKTRXz0Q39g+zLwuNtZv5MIngvftrBdJcjoGRcdmohey3ScvU0ZL4HAhL1DuxAZk
         CvMn9erfMaKBg1Vz974qvWs34QSjSqlwKHIcQ46z6Pq815hSnrnVvZlvodoqSlUrwW+G
         so8MowcFdmT+AfZ5h/42eSON0YAK26yTPLq/j4J3+IbDSJixSJG2MVprSSkVEo9sEkDI
         5YDwzVetVvuqRQ0e0C1WJWipjx5EcHag4H+oNrW71f/50Ky+lbrmI6/WowXhH57IjxS4
         un8hu5+jLrQ1OzydMwK/BZtDtlQkf2tu9284la6p7v1QDA3Pm+VR7Q7KpYAT6vVowrr2
         JEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784146784; x=1784751584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nubd27NNIvTV4B3FNhrgAkY1uJlNnIcqTLmtlT2/89o=;
        b=ZpyZcKAl2DKQqDxLZTJ53ZtrMiMNOBnfV+JyxdWqyqeiv5iqPOtNHQrT+CRRRJKdtc
         wKyTcahGUBKtG4MlXIl+x4QJ3f4sgIH9CLg8n+HtBsrTz/QxDoaAIfwzpKWrz2MoVSE1
         xMiV7IIZMLEPUBSuzmARQqhKF6tv0VBmhA3YKkKpGpc9qf5aDUiMD8gAfaQZSlj/tgp1
         NeiQoxTAvDQpHyHfWJg0ExqT1PuBKb/SDbN9LLpZptiiuylHliQ13V0WzuPZWd0+YIto
         gd94e/p7moNfsVMD7QagQ6ejNkNP+V6SXRd5BqHFnLJqtkao1z9GU6QI89lAARLdMmgH
         MkKA==
X-Gm-Message-State: AOJu0YxDmW5vIDCWW5JU9GJk1AcVSu0LHZEUoZTLxTpPdH31WBCed5Jl
	sdghzNDE2Kd4x/+UhvObQvqQmqkklxSTZSwmdN4nh17NNDgMzAVwq5JOKuB7RUU3EX2vKJ4BEn9
	4dWNlEvmfwUR6Z2Xu/ZbTWIU342FNPrU/MWn2+Pa5YrePymM=
X-Gm-Gg: AfdE7cmMHLLs1MZhXLMyDeqBEuxh4/5g870CNGrJ4xxdqx8bwt1QWlKJVVILXboKet5
	VqoZzQi2n6HFdJAspCszOg8Pz0iFJZ/QWqMb+7VScmBn2EajbR75LSmR0cqKjyxscpjOGAHb4Hu
	Q/9XsWUjze5qEBiTCgscjZKXpZTpUZyDAurD+OAjOdh1RY4hs9kXPdwu8sA0ajZrDNnG+wjbNVe
	baPlGr/nZ/+OUQrBtJv+YmHe29ebpmtB0A52ZSXJPFBicL9JIAMUb8/uU1saSj4W8yYXHxJTuA=
X-Received: by 2002:a17:907:9484:b0:c16:1227:e3d8 with SMTP id
 a640c23a62f3a-c16790fa355mr278084266b.13.1784146783933; Wed, 15 Jul 2026
 13:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260714191341.690906-1-coiaprant@gmail.com> <20260714191341.690906-7-coiaprant@gmail.com>
 <20260715191453.DEE731F000E9@smtp.kernel.org>
In-Reply-To: <20260715191453.DEE731F000E9@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Thu, 16 Jul 2026 04:19:32 +0800
X-Gm-Features: AUfX_my5g85fDayigq-hMxxzbVtYHNZXP8Ax7QFobz0v3NSrNqtAVYC0ELzRnTI
Message-ID: <CALj3r0ge83r9kmcDbnhvsEyD983Q7_oNcFTrd2iSFdvOsHTFdQ@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] net: pcs: xpcs: improve SGMII AN state handling
 for Rockchip RK3568
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, 
	robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

> [ ... ]
>
> > @@ -884,7 +889,7 @@ static int xpcs_config_aneg_c37_1000basex(struct dw=
_xpcs *xpcs,
> >
> >       if (neg_mode =3D=3D PHYLINK_PCS_NEG_INBAND_ENABLED) {
> >               ret =3D xpcs_write(xpcs, MDIO_MMD_VEND2, MII_BMCR,
> > -                              mdio_ctrl | BMCR_ANENABLE);
> > +                              mdio_ctrl | BMCR_ANENABLE | BMCR_ANRESTA=
RT);
>
> [Severity: Medium]
> The commit message mentions improving SGMII AN state handling, but this
> adds BMCR_ANRESTART to the 1000BASE-X configuration path in
> xpcs_config_aneg_c37_1000basex(). Was this unintentional, or should the
> commit message be updated to mention this behavior change for 1000BASE-X?

You are correct. This was unintentional. The `BMCR_ANRESTART` change in
`xpcs_config_aneg_c37_1000basex()` is a mistake that was introduced
during development and should not be there. I will remove it in v2.

The SGMII path (`xpcs_config_aneg_c37_sgmii()`) is the one that actually
needs this change, and that is what I have tested on the Photonicat board.
The 1000BASE-X path was not tested and the change was not intended.

> [ ... ]
>
> > @@ -1086,7 +1094,24 @@ static int xpcs_get_state_c37_sgmii(struct dw_xp=
cs *xpcs,
> >                       state->duplex =3D DUPLEX_FULL;
> >               else
> >                       state->duplex =3D DUPLEX_HALF;
> > -     } else if (ret =3D=3D DW_VR_MII_AN_STS_C37_ANCMPLT_INTR) {
> > +
> > +             return 0;
> > +     }
> > +
> > +     /* Clear AN complete status or interrupt */
> > +     if (state->an_complete)
> > +             xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0=
);
>
> [Severity: High]
> Can clearing the interrupt here lead to a permanently stalled link on
> Wangxun platforms if the subsequent xpcs_read() fails?
>
> The original code cleared DW_VR_MII_AN_INTR_STS at the very end of the
> DW_VR_MII_AN_STS_C37_ANCMPLT_INTR block, after successfully reading
> MII_BMCR and MII_ADVERTISE.
>
> By moving the interrupt clear here:
>
>     if (state->an_complete)
>         xpcs_write(xpcs, MDIO_MMD_VEND2, DW_VR_MII_AN_INTR_STS, 0);
>
> If a transient MDIO error occurs during the subsequent MII_BMCR read:
>
>     speed =3D xpcs_read(xpcs, MDIO_MMD_VEND2, MII_BMCR);
>     if (speed < 0)
>         return speed;
>
> The function will exit with an error and the link will remain down, but t=
he
> AN complete status has already been cleared. Will this prevent the Wangxu=
n
> initialization block from running on the next poll and leave the link
> stuck?

No, this is safe. The `ret` value used to determine whether to enter the
Wangxun-specific path is read from the register before the clear operation.
The clear only affects the hardware register, not the stack variable. So
Wangxun's `if (ret =3D=3D DW_VR_MII_AN_STS_C37_ANCMPLT_INTR)` block will st=
ill
be reached correctly.

If the subsequent MDIO read fails, the function will return the error and
the link state will remain down. Since the hardware interrupt status has
already been cleared, the next poll will not see `state->an_complete` set
again, so the Wangxun block will not be entered until a new AN event
occurs. This is actually the intended behavior =E2=80=94 the interrupt is o=
nly
valid for the current AN event and should not be processed more than once.

Therefore, the change does not introduce a regression on Wangxun platforms.

I will remove the 1000BASE-X change in v2 and keep only the SGMII-related
fixes.
