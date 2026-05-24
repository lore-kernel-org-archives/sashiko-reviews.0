Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E00B4317D
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779640549; cv=pass; b=pD5wbwH+Rn1mXdtySMUg5FAzZ764Bk0koAjaAzBeN4zfUyyWKvBjVCT/Fj2V+YehHUxscGIY7fvwiWSX4K0/5IgFJLLU4OgmlnMmnU7tRjGP/EYN/OtmGo5N2bL3fGQmGVwNgtemrW0SplxSMQOzqgkbXHJwhaKYD5/HadnDGW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779640549; c=relaxed/simple;
	bh=5bRJgQeHU/yV/jJPRU6lHE/H7v2WtXNv1HQdony0bU8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OP9HWVKinXxe6pj33fdVWnsLlNWEe+YhWz1mLHdIO5PSpGvceUuK+gPL5N+wfy+mvNcZarexviSalVts7XaFlwhfh30Tsb16bnk6Uopl/XN1Q1jy+s+XB+Bzssv+Bj6flvzFquEvmJoJuBGsiOxCPyCe254toBXsSDr3WLpYhQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UKT2hZb3; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UKT2hZb3"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so6392554a12.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 09:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779640545; cv=none;
        d=google.com; s=arc-20240605;
        b=Uh/CUJFiPbpEeDQPweXJLj1aJz+Ot0YKtt/8D2t4cKSNDiUA5VW0Oh3WObyTfS4y3G
         8hYOxMAtNAVI4ZmLR7oi4X2A4W2Ik/9lf272S2I3Q9FmNM6Aj2vqXlg44bK2ebr7FxJw
         7hD06AlfXRO/orc9ovSScc+D/JOJsBbstZTDitnAQRtVA74iKIRM8p5g1+afHQ/Pmp4Z
         5F1R7/ByvZIXW6iihsLs/7wGYMnT/kcOYGNCgKEgiVbYPlkh5iEdB/lWCzQb8ftBo7hn
         rLsqpo9m7/XdDNLJoiGfLNPEmNPcBxt+vjpeH6aAVnnSNU5zW0oZOyARCOaHYHd5zPFH
         K38Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=O1HLcn//nYjl34kU/2TQC8I6ZR+db2Ttx6Cx3u1ROgY=;
        fh=ouXvSjf5SmEmNeimx6xyG+CKjdQvC3UxbsGBNR8v92o=;
        b=NVdDTddcKyqd6b6bftlduMSkK1rdhPyEC4/jPp0huTIWRNe3y/+9wYSyaQSSvBRVCG
         LnqNELHblNco5V+W5dqr8ochQbY+7DY/uy6SMvm4OU5YuOudcnR9cbdaORdmpGTb0ya8
         w36YQLyZZFtl7xDHtn5O41RrQIK3Q8ISQPZs7ys7URkMdDJNcL8V2Wun1RawWu/e72ip
         bduFNIrjsC1a8GwUAAi1GEttJh+6wYZAM6G1LgJQOH+UL74QQDQjapMxKT1jh7HKmwp/
         mgOyrm9+U8+UVa56sMOCM2mJ5OqtG+Kl1J3GwU7WXWiqXULU5FFkZCTHpSq7tkjQC1hK
         PMYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779640545; x=1780245345; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1HLcn//nYjl34kU/2TQC8I6ZR+db2Ttx6Cx3u1ROgY=;
        b=UKT2hZb3VtviYrpY2oOZKAlD6kPywdITf2Tt5H4WCGO1be7+U1j8JGQ6Lzs31gdzLx
         +qIfZrlrR92GgGHRcrH/q0A1xtGU2ZXYHVT1g/RefmngtSpbce6TqJz/MWtUYpB/KZ4N
         IkoiDhavVzFnX3Ifnd0REhoqyYHXZH0u9ynoL3Pcblhlcq0FryIjEQc/cAOX3vEIp5BO
         5W9z8hX3O/3w5RPrTMD/0xdwDbMPBa12OAwiEM3GKzSk2wtvQb9r5OWLCkVBMy9rtzqL
         7nvsLhQAVLho0YgBoCDrxEFrpZyUVNKlRK6769B0S2Mj4Rj5tzvqzAgk+tKhXAp9Jzih
         nV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779640545; x=1780245345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O1HLcn//nYjl34kU/2TQC8I6ZR+db2Ttx6Cx3u1ROgY=;
        b=SmDSFeZLETRnSG80JWQdvzl4ymRYeDr3J2nsA9d1EBWQtGn91z5cBygRFs1KF/LdcP
         nNOKEHYQoEt80BykW9vkNsi6EeAhCunUa1qIZn7sCYv2b6bVAL3gSaDpcJ/g/8LcoASz
         OSELWzQOK33n2qvZAP9E27RPMXossDnwyoEEQ1HXCp81Kx8albHF04I/gdEfdWs9cTxq
         nhUTpoboHdpf7Rd5elOx0lk5Lp0dJFT5GdRZ+BXF7D4Zu+ukF6VGVxxt9QUF1klEBA68
         ujy49yvA4uOYM6imUqsr4ZnTzDQlaRP6F3QDSxQYfBzvjBgpNdOB1ZMkQRWyiIysfJhc
         W+9g==
X-Gm-Message-State: AOJu0YzHKz0NbGOaodEoRQvSd4TeGfmcr/W5zGDpDJAPYjUHa809jtAo
	G7VO/w+kID+o7wWlbEwE7kHg0JyTWdYYpI5LfWqk9Tviqe334lYjJc/m70jMnkTzoCdXLSCRKiq
	DxLhQ5Df2jaBla+S0Fj90aUvAgiSHivnO/uYHAg==
X-Gm-Gg: Acq92OHq4UlQFv+ULi5r4tCVwdL0hxS2V7pH61y7iamRhCVEOkMU2FsKDbyCTNP4REZ
	kySZBYTVXxXiaQxcwYhbKoGHDnX/RnvTJvXgYmKRPZA5YZawsSWUPKFAr01ahFlumhOq8oHQSqO
	EGnh1Cz9w9R0Jv0HiOAvQmNd09sJNxV7FLOS+1lVDga9p6RsjGtBGGm3bvKznmldCIUDeO+EG8y
	LSzY0hGhyk7XPXDHGC2Vl7dLe/mklW33vJIPBG0mWZx9u+yoY4+Sq+cKvowe9REpHf4X9Gil2A8
	P0kjHIVCsleR/yjPqVCccnG9GU6FG4x9A6Or
X-Received: by 2002:a05:6402:350c:b0:677:75e5:a1b3 with SMTP id
 4fb4d7f45d1cf-6889c465f79mr5819047a12.18.1779640545136; Sun, 24 May 2026
 09:35:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260524160657.17802-1-mhun512@gmail.com> <20260524162533.A98601F000E9@smtp.kernel.org>
In-Reply-To: <20260524162533.A98601F000E9@smtp.kernel.org>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Mon, 25 May 2026 01:35:31 +0900
X-Gm-Features: AVHnY4LHk1AV0u1q-ffKndmXPDLMXPr4_aduMj0oer5MdAfLPHViFp_2Gmo8zUA
Message-ID: <CAGEsz8GaGhRwAPvOdiBYxho0GyCe__mVwPtT3xfhpK_mWioO=w@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: clean up KMS polling on register failure
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review.

Both points look pre-existing and unrelated to this patch. This change only
adds the missing drm_kms_helper_poll_fini() on the drm_dev_register() failu=
re
path after drm_kms_helper_poll_init(). It does not change the
drm_dev_put()/component_unbind_all() ordering or the component bind devm
resource lifetime.

I would prefer to keep this patch scoped to the KMS polling unwind fix.


2026=EB=85=84 5=EC=9B=94 25=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 1:25, <=
sashiko-bot@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Use-after-free of the `drm` pointer in the `free_drm` error path=
 of `meson_drv_bind_master()`.
> - [High] Memory leak of `devm_*` allocated resources during component bin=
d failures or unbind operations.
> --
>
> commit 0a1b882dff3689e80c5546f7c0bf38c6930a1652
> Author: Myeonghun Pak <mhun512@gmail.com>
> drm/meson: clean up KMS polling on register failure
>
> This commit fixes an issue in meson_drv_bind_master() where the KMS
> polling helper is left running if drm_dev_register() fails. It introduces
> a new uninstall_poll error path to call drm_kms_helper_poll_fini() before
> freeing the IRQ.
>
> > diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/=
meson_drv.c
> > index 49ff9f1f16d32..e49de5df73867 100644
> > --- a/drivers/gpu/drm/meson/meson_drv.c
> > +++ b/drivers/gpu/drm/meson/meson_drv.c
> > @@ -352,12 +352,14 @@ static int meson_drv_bind_master(struct device *d=
ev, bool has_components)
> >
> >       ret =3D drm_dev_register(drm, 0);
> >       if (ret)
> > -             goto uninstall_irq;
> > +             goto uninstall_poll;
> >
> >       drm_client_setup(drm, NULL);
> >
> >       return 0;
> >
> > +uninstall_poll:
> > +     drm_kms_helper_poll_fini(drm);
> >  uninstall_irq:
> >       free_irq(priv->vsync_irq, drm);
> >  exit_afbcd:
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does the error unwinding p=
ath
> have a use-after-free?
>
> Looking further down in this function at the free_drm label:
>
> free_drm:
>         drm_dev_put(drm);
>
>         meson_encoder_dsi_remove(priv);
>         meson_encoder_hdmi_remove(priv);
>         meson_encoder_cvbs_remove(priv);
>
>         if (has_components)
>                 component_unbind_all(dev, drm);
>
> Since drm_dev_put() drops the final reference and frees the drm structure=
,
> won't component_unbind_all() trigger a use-after-free when unbind callbac=
ks
> dereference the freed pointer?
>
> [Severity: High]
> This is also a pre-existing issue, but are we leaking devm_* resources
> during component bind failures or unbind operations?
>
> Because devm allocations are scoped to the device probe lifecycle, they
> are not implicitly released during bind failure paths or unbind calls.
>
> Could this result in permanent memory leaks across retries if component
> binding fails and is later retried?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524160657.17=
802-1-mhun512@gmail.com?part=3D1
