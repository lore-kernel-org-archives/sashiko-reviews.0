Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421814;
	b=geE10pdKDvknSfYCzkZToX0//rJJR12z/qcHWAQsYanHMRol3UJstHj8dPFqovrh28Za
	 8IbaApBCgdaz88r8A9TFJHEmfkwJN4MNDQ2fyatRi+AfmkHNJwZLTwT9htTyFxZuNsu/6
	 NX8nwbbqDHta2ixgIErfwMYSCkA36+rFSiebiFWCgIrRitc2nlNTcsqj+VAvM9GkdKg1V
	 NXO2+uywNKTdOXX4rVKlliw0ki0kalkjj6WqMoaVddm7mhYcx5JEx1gbl0jZ6zmXLue0M
	 cXo3KYlT9f+k4gfoZLFTpfJS5T3x/y0tS3vm9TqUvXYqGVILHe2SFCf/ZBAr4zOaDVA==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421814;
	h=Received:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=YyVJu0EGkl/YFs7ApE6DeIsSQCa9Krhf/9Ms1uzPE1A=;
	b=0yQnZEdNNHCtFIJUyumYkL03nQlBj16f31V/xxRITXSayQkCCP9dKVZX++X91sK8ZfNt
	 A9zx7nzGaKaRqe7sHK48F/ZoFe+Pl4PnkQiLEK36qz0KEUBH9HzrPc21NVLrm5ELKhq0u
	 Zv3ULQjnE3LP0GnwiJiU/gtEUlsdikSC3I9YcNe1pUcJLRGl6j/TMRuxfkkDmg7zWBtwX
	 wIymj6sUtLv2EY6qECNc99+eKvNvyuzbJf8OSe2X5AhWdDFxrBfszzEzjm7Pr1qC2Q33X
	 9OEw97S+VDluFoyEDMUN/3oEb5f9arue7nIoiku5kWcp6TodFMTFiDEg955qyQCJwwA==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bYCBb3lV;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26966074086
	for <sashiko-reviews.lists.linux.dev@localhost.mlmmj>; Mon, 19 Oct 2026 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bYCBb3lV
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23727533D6
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421814; cv=pass; b=uHzYQLmEjCiN7lumrELHdwd357EOEpk+7AQthqUy5jCj5KSoXl0uYLAhYvlCYkhIeoiNYmtxHxoPh0ocriF5jVYXER4FHYNrDAidDpUdJolCfu074q1BngbvxnfRBlE2ZG9/C6bS+/RI6/JDlKgVw5gWaHpHttbz1i7bukxZWDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421814; c=relaxed/simple;
	bh=kec9NO7V8Aa8rBvpnv8dsuyzbW1E+nfIFUj70hjQ+mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JrDk3fh/uXzH1WqD06bFscUjKjH2X1LNG7eqF8mpBKq4oNLTF+BoJzryFr4LFj179w3COjJjvy3pwlkJTV0g4oLZqYIyRGyAXUZdlPjA+oCGoMtF5doW4bGTkpNP+hGVcpmJr7CJ3NOcQCt7UQmPUtY0/vCZ02RAOJcVz0BcJas=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYCBb3lV; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c40f29667e6so157940866b.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 07:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792421811; cv=none;
        d=google.com; s=arc-20260327;
        b=U87/mVUW+hwOHk1tRccrvB1BwBhIbbr09hMvNUrInUm74e6aFzcA3IteKXgYPJ6AzH
         ewcekKJNPTQvIwKPLRR0d71/B0iktsSiuue0vmz6npoeu0GR6j7P8BgHqWVUgydkUH83
         6rZYU87MM+KMkel+01GxILdyA9PX0nnrpaI58db3uD+zZz1PpIOWpKawyc7r/ft3VWvw
         dooVwTm89Hb4ql/ZPfJVmZiTjFtfh6IfNEPGhU9F6EIDwUXI1dys6480jyN7ZdmAYr1O
         JclsAXsNirYRaOqlbu0KUxXyuVl7PW9haFnXyFjQMEA8VADiB6hy6x22r5+dKYqZTq62
         u+QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YyVJu0EGkl/YFs7ApE6DeIsSQCa9Krhf/9Ms1uzPE1A=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=ISRMNY0P/b9mjawuSZQmbwQUCPEQF9Y2eOcmoyiCW+2HVL9vpK8I3tDFMgZyF6YyZ8
         GiXuWVaVFX5JtJtNwsvcNGskoEa63b1zGv461q1F15fm8KiVFhhyG23mt4plMzJAt+26
         hYwVAx52ZOawyDkMbmt0SbgZdUypyJeUaylbd3xH+QjMtLBC+D2GiSrIoP5UyQW/xhXb
         GoiU1KtrOp0MnYXl/IQ6cDcuVjlPgzm7ndTBdTkOP3aBcFhs6b1CcqK7O68c4tDtxmSG
         pU1oOA/mJXi6rSsQkPAdds0tKO2+BwX4YF493u8L3l8kjd5amX0KePRtyp44BTS2rPNw
         u+fg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792421811; x=1793026611; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YyVJu0EGkl/YFs7ApE6DeIsSQCa9Krhf/9Ms1uzPE1A=;
        b=bYCBb3lVRYJHSZpWADnM3oca6fFqsLKTRYggnU7+vMeNJEJM7zSlFD03l5TTqBeigR
         fJ15rLOjItMfm6UsAlzrSxhrfaCIp+A8NSyI0I8EBzN10+7MAbILrM8sYtkVCHZNusJR
         zGyMK+/omFW6vt2hF6Ro1ZUQwyPrzy+Ac/+dLs6ORHrO76xHCcytgbmR/viWdBGqjoJG
         CJRphEVQdnNfyiZ00p3/21guRhx7amLLMew/Kxk8SwECNM5Kgi+mc2DX/HMDfvFMWOQ7
         loX9YBrQ9g92wwdxFStsC5jG3Ws16dCjcebGKwizxJr3caxYTuY+ZLMV+SCAVzHuafV2
         fOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421811; x=1793026611;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YyVJu0EGkl/YFs7ApE6DeIsSQCa9Krhf/9Ms1uzPE1A=;
        b=XvS2zaR3nkCIsHVJNgPdtvqL8+JJ7xLAsF0iUvSwdZHdGgEQvV7yOCdRLXfR3+xBnh
         rTvbMPDAAQpsswcZuNo21XvXYqybXnMp4M0WZ9N7SzmpgGsegn5IzgZWKDpNS/Hp6cfJ
         QGkoxG7ngsUvaODE5n1eZP5wKnhLDMLfL3v6nxa71hSH/juul6W6jo2ieegZ2yPfuIMR
         vsHpMrtl1jat0WZFOrljEhhjRVWqQKhUNhaWoRUlworitTc7JTZl1CCtMpwBQ8p229fx
         ESMN+p1sWQ2V0lHedOgGmk0MbRbXpeeFjZl0+XbdWAvdZghswMsQpOTlSWdMPhPNY6wQ
         NXKg==
X-Gm-Message-State: AFq9FYJX0j3wEaJ88RJeVFG8F03kxCGOJv/b0mBNjM/872DzcpI0nHGL
	1DxNAjoAzrGKsbIXLUFdrB3dd/4k1NGoOd9771vNmwmezULAgG+XOAosDnz4hORy9t4DBNZ28XX
	aJ2fAoi9ic0DghuFNOqRv9AvmMj8N2bxAgZ7knNs=
X-Gm-Gg: AYBFou1HQ1o5Y4TwhFXa7NrWy17B1+DTcgX34m6t/DbC5bMRmZdIb70VmsAFRE1rpnQ
	sYhImmNxJHyF1lsTqBjh8ljzIAsynJmELUW70nTzY0r/QS+nygEsLoIpEr+JRHzU//MQt8x3oGA
	7fhAOC8scr9kS/vN3/N22D1W9oPqGFcm5flFNTxCVe/Fuv6TU79lSC6xs+7Y3YVU3ChMOOib806
	v4X/ZlTPojBMLxRV8IIrJx9CxxRDo3Y5eORQZyyClpnsyhW10x5p8/EHoDIqJQv4TcWlDNsbTVV
	qC7cYMEAim8VhOwOp/un3u6FlwQPHof7+WBzdeLLvcCjD8eAPKB0mYv10/OfI9GClri3dm2azSI
	QtviDTyHp0ClKG03ER8M3/p6v/yKv41wP5g3RThkZEg==
X-Received: by 2002:a17:906:d552:b0:c40:9839:c892 with SMTP id
 a640c23a62f3a-c419e2326demr628363866b.19.1792421811095; Mon, 19 Oct 2026
 07:56:51 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261013175753.37344-1-kolomiiec@gmail.com> <sashiko-outbox-172448@kernel.org>
In-Reply-To: <sashiko-outbox-172448@kernel.org>
From: =?UTF-8?B?0J4g0Jo=?= <kolomiiec@gmail.com>
Date: Mon, 19 Oct 2026 17:56:14 +0300
X-Gm-Features: AclHuK8tloVCSjQ2U5-UDqRf3TB8_YW4TWwVk5crnPLxYw9n6ka3_9zIXu7hdC8
Message-ID: <CA+e2gLs8Q3Y-ow=PdYqhQyq0Gax9rp8PktA7fgzannG8OU8XFA@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: retry UVD v1 init on failure after resume
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
You are right, and thank you for the precise catch. On my hardware the
failure mode is different =E2=80=94 clock setup has never failed across 42+
suspend/resume cycles; what fails is the ring test =E2=80=94 so the unguard=
ed
uvd_v1_0_stop() never fired in practice. But that is luck, not design:
if radeon_set_uvd_clocks() ever fails, the retry loop would issue MMIO
writes to an unclocked UVD block, with exactly the bus-abort/hang risk
you describe. The guard is cheap and obviously correct: v2 keeps the
clock-setup result in a separate variable and calls uvd_v1_0_stop() only
when clocks were actually raised. I have sent [PATCH v2] with this fix
to dri-devel. Thanks again for the review.

Regards
Oleg


=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:1=
1 <sashiko-bot@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:

>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] drm/radeon: system hang due to unclocked UVD register access on =
clock setup failure
> --
>
> commit 9840a4a45eacb2033c0f3f3ceb29f75910196145
> Author: ukrainer8 <kolomiiec@gmail.com>
> Subject: drm/radeon: retry UVD v1 init on failure after resume
>
> This commit introduces a retry loop for UVD v1 initialization during resu=
me,
> as the ring test can sometimes fail due to racing with hardware. On failu=
re,
> it stops UVD, waits 20ms, and retries the initialization steps up to 3 ti=
mes.
>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1867
> Link: https://bugs.launchpad.net/bugs/1865130
>
> > --- a/drivers/gpu/drm/radeon/uvd_v1_0.c
> > +++ b/drivers/gpu/drm/radeon/uvd_v1_0.c
> > @@ -158,24 +158,45 @@ int uvd_v1_0_init(struct radeon_device *rdev)
> >  {
> >       struct radeon_ring *ring =3D &rdev->ring[R600_RING_TYPE_UVD_INDEX=
];
> >       uint32_t tmp;
> > -     int r;
> > +     int r, retry;
> > +
> > +     /* after resume the first ring test can race with the hardware; r=
etry */
> > +     for (retry =3D 0; retry < 3; retry++) {
> > +             /* raise clocks while booting up the VCPU */
> > +             if (rdev->family < CHIP_RV740)
> > +                     r =3D radeon_set_uvd_clocks(rdev, 10000, 10000);
> > +             else
> > +                     r =3D radeon_set_uvd_clocks(rdev, 53300, 40000);
> > +             if (r)
> > +                     drm_warn(&rdev->ddev, "radeon: raising UVD clocks=
 failed (%d), attempt %d\n",
> > +                              r, retry + 1);
>
> [ ... ]
>
> > +             if (!r)
> > +                     break;
> >
> > -     ring->ready =3D true;
> > -     r =3D radeon_ring_test(rdev, R600_RING_TYPE_UVD_INDEX, ring);
> > -     if (r) {
> > -             ring->ready =3D false;
> > -             goto done;
> > +             uvd_v1_0_stop(rdev);
>                 ^^^^^^^^^^^^^^^^^^^
> [Severity: High]
> Is it safe to call uvd_v1_0_stop() when radeon_set_uvd_clocks() fails?
>
> If clock setup fails, r is non-zero, and the loop bypasses the break
> condition to unconditionally call uvd_v1_0_stop().
>
> This function performs MMIO writes to UVD registers like UVD_RBC_RB_CNTL:
>
> drivers/gpu/drm/radeon/uvd_v1_0.c:uvd_v1_0_stop() {
>         /* force RBC into idle state */
>         WREG32(UVD_RBC_RB_CNTL, 0x11010101);
>     ...
> }
>
> Accessing these registers when the UVD IP block is unclocked can cause a =
PCI
> bus master abort and lead to a hard system hang. Should there be a check =
to
> ensure clocks are successfully raised before attempting to stop the hardw=
are?
>
> > +             if (retry < 2)
> > +                     mdelay(20);
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013175753.37=
344-1-kolomiiec@gmail.com?part=3D1
