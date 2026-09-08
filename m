Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED8F58B6B5
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 16:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788886195; cv=pass; b=FyQ2jJBLdsCOSiz1bCdxirc9svXJ2tO7wronw+YVvStr6FqpEVfPKt2PmT+zxuZLqgM9pJrkGctAG2kO4NVr2zbYKW8DCk9br1tEZTD59fv4XLCiegimwPNCJatjBP9drSCdvQhWrv4zyrPvMhN4IxYv7nqZ4iy5AD2uolvTP5Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788886195; c=relaxed/simple;
	bh=wWV7RIDvPNgb61LRsb1T+lA9O/ZzB6BtS3dJ05zhDMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHlmLuklJweXtyKsHP9BV+jlq9nzOxkYbNq/hlVNsV8z5NZRo8MpRP6I0MQqenMEXjWgsLRnvO4kbMvEzS2yEdeiNtAVm8jEAi2cF7h6NHUoTVAeg38hlMtU0MfuTiOpFPzHaauprn9B2cBEjSuO5CQ3GhgE3WQbHEEyKk03Mlk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ECxUWokQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J6a83vUV; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ECxUWokQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J6a83vUV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FdZcO360078
	for <sashiko-reviews@lists.linux.dev>; Tue, 8 Sep 2026 16:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=jjyprxG2XG9NzXWNyzeCiXKjoh+WUs0B5koQZJEUIKA=; b=EC
	xUWokQuaOhKpZOpEBztQE0iKKXzBE40PJmeIAlWwXAPkCPpGL2n+9UUExBR6wFuY
	hknpXVJj1v2xNOK6U5IAvt/CLg5/logktIfRrnvelZhbKD07kOrPBqw/MSYMfpjL
	Efvhx7mq8RJLuUUoJh83X9tQGhHVsdb9dmgkWMjRMsnSXlyZJsBkXKJPsq2L2VWX
	yOtPMObXR234BFr308/LkD3SOPL/4gINIwS7/jHbS63BiYNjs17weuLHaci/luC2
	dID3qatDjIaXW5SvTKZI4cU8h09EHBJzKD1X3QXzrBvxjRJHovqTF5ofwc5wlWhP
	6UQ5SZ3gHKk3uAE7N2kA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjb0pb632-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 16:49:52 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6bd74449818so856966eaf.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 09:49:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788886192; cv=none;
        d=google.com; s=arc-20260327;
        b=c0TUuhVZlOHkKt2kq/R8NZ3BUtyitFumLe6YGfCCfAu8lUYjsPteVB1A7KZskEwkNg
         eOT97qpK+OAS2YfVw9WIl+YgeMIaf78i+IwF565zx6i+67SH+N4q3LF1NZaHmFUVX5MD
         cnyiFLWmW7kkwW42KsLpuAu8Ra25m4eIoWpl5G/7PkELsxiC5SEQi5XP/9JKCn4HTuND
         vi8IIv+829HLKosMVWuZiYcNOyl6Cfmz7aOgxxar6iiwbpM2EHK15RYU8GfdFm1p8HIp
         97VOf655CfIJAGb9ZX7vfiZs/68PlAiWuhNOuyapUONX0ksoDoOwgx/HrKQqTuGQ6xlP
         RDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=jjyprxG2XG9NzXWNyzeCiXKjoh+WUs0B5koQZJEUIKA=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=OfKT9qHVDbuABbhyak95B7C6t4gCZy0dd0yh+0zizhW8jNezZAdcxTO+jWnAuDMAxX
         /uOBVVwV/s2hJapdWSYA2Sz9VJP4Ta+HdXnOdNo90+k3IWZO/HI+9x/4K9ZHNIbrl3R7
         fX9FZUfYxKDGsjeIRmR5VAENbwSg6Mq7LoQCnG2d/QKo7ltjSLxqTuZ8oQUP2mdzJI+1
         pWOOaHP3rSFF4KrCTWJOt0hw3Pk2WpYjVYromZVAw2XwElpwYKav9NIYiW6zxj1TqaQA
         wNVghGdRhD0OkKIRi+OlNccfpkGnnRD4tehAea1St4g7NBUNWnAJNcJFE+4qAMevuYQE
         8+zw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788886192; x=1789490992; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jjyprxG2XG9NzXWNyzeCiXKjoh+WUs0B5koQZJEUIKA=;
        b=J6a83vUVor28+Jh5ISSZ7iKhClQR7cMUaE7RF95AyjP7S95MJawue7c0+l2mrUy+rp
         3pM4Oo8gsfDx6xB2Ht7C1Q2MA9MGgrGONAcvQOxDD9ZuDynQcMaV4EARkvOMA3SnY4SR
         uLVZyR8oRnimsRy38uJ5Ce72oku8OEK9vK74HGtB8sTY4gLUQ/J08Zv+to/rrepSNVpa
         vffbCTm8XbLN0V2oumzpFh1Y3ZsU6q5Ywmckxo7FIweZlkqguxMttx9RPy23aWzzdC1S
         KLjS60vS0WhQZGwBsWPgLt93gUG0YpEdgsxp3un9k+/9MnilGa5gDbj4W7kg4MOeUyps
         fEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788886192; x=1789490992;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjyprxG2XG9NzXWNyzeCiXKjoh+WUs0B5koQZJEUIKA=;
        b=nilRTL9XM5w6vN594YZycBulLIF3VCO7V5Yul/gwSNKto37Vc6Bh9y4gVKr1lxTkDX
         gB4Ph+y1OsXxDTK590jDVsSoKWeNC97dDr5Cyds8jiTdT2ug8aonaPDC9hpNnMMre8BV
         CeC1YNfzXG4f+JgFeL0zIUJ0T1S4JHNga4WGA6iv2NqZsOwrE3N18s+hgZPQZfsULC4r
         YjNQjtYi6lBr0DKEoB72HtS1tzX6d1J3aDVKddPRhGGrtkp4Xt/yu9S7b3K3hj49A5C+
         bXE16h4CdcCTTRjeDFqHZgLjRJRrS2bq6TPGn2a+/XcQlcq086BdojMzrDEW7CgHEMhY
         CaBQ==
X-Gm-Message-State: AFuF++m6+Wz0pIN5UCfvBSQmGwUZMwmjGSu89XppsRW6SCkW2qx8G06d
	KrfwGvEPdRyZxoS+LAuyhpA1mjW6kcgpO9XHmNem/BKCTP9APisWDZGnjbM9KNrYTNLDaQVEMSW
	8oIgyu/41JQ2/UO493s0YipYKqxjqkhxarP14iVsu+/mg27+5UmICr3fNgqgZ+PnJL2aH7mga1b
	8ierRcn7AybthjlE/f+TJdciEwBDMh7Pdyqau+myOTBQrsM1jzQqQTMg==
X-Gm-Gg: AYBFou1RauIAMzN/aHYNCpttKK6YcJQGM+PVQsV2KTvkGwL0//sQSGEbiThi5iMeCxc
	wuDXOXmoRvo7qSGzifAe6rb+gsdskqSUH2PpO91G8SYQRDPkGUiw+E+gm0SAuHmT1XdzbiT+BZ2
	EE63vRb7bczqw++YKVHKbH8o+f5frgK5Jg5g6xlmJEzWk1J29YGvRKtw4k
X-Received: by 2002:a05:6820:3102:b0:6b2:f445:af17 with SMTP id 006d021491bc7-6b6fc7d2b9cmr18109457eaf.26.1788886191655;
        Tue, 08 Sep 2026 09:49:51 -0700 (PDT)
X-Received: by 2002:a05:6820:3102:b0:6b2:f445:af17 with SMTP id
 006d021491bc7-6b6fc7d2b9cmr18109434eaf.26.1788886191179; Tue, 08 Sep 2026
 09:49:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903183725.15835-1-robin.clark@oss.qualcomm.com> <20260903184814.3BC6C1F000E9@smtp.kernel.org>
In-Reply-To: <20260903184814.3BC6C1F000E9@smtp.kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 09:49:39 -0700
X-Gm-Features: AcwNN1UsRKccp7EY1AAbXGvXSAW2NF0xgbz05s1mOXzHH6oBlCBvY7XVvB_WUuI
Message-ID: <CACSVV03gOMau27mbyG+29DGv9RjfWrd0YzwvmUnaDGe+u17nkA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Enable THP for GEM buffers
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ItM23tKtT5HMrVgRIx5knqbSlnKgmEK4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE4MSBTYWx0ZWRfX0L9TF+kNZ2LJ
 62P1NvodK/A7HwKardntw665gBzH52iq1ooOX3Ua18S9R5uzysNOzAG8+CeCnYWOXZaWsS92V6D
 1cEb+SufvUmQpmes4/LY2+Kb1yFTH9I=
X-Authority-Analysis: v=2.4 cv=HL3z0Itv c=1 sm=1 tr=0 ts=6aa03cb0 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=qmBQeO1blzqszIYDDTQA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: ItM23tKtT5HMrVgRIx5knqbSlnKgmEK4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE4MSBTYWx0ZWRfX6waiknhhMI2N
 2UtLYrXNttuT3hGcI3wwt/x9ra2V22eU8MkUsJIWVb89MDuYtx+okNRJosWb93vqvEFim8maaZc
 XGqxZPYrhr5gUXDo5BkuxWk2T6Rf0dU9JOWnPkdSfAEeXgKmT8kB8BrxRaQt3QS+I33pmfPKQ/s
 xaNXtauJUQx+THuysHa1NSvC4C953YZ8W66cFL8a77pf4a8uDtQfKikc5Q70qpj3iABXfun93Pb
 ByO74geZz6H13iwK4Lfoty5wi3h3DHXfgkX0EFLODCo5Zr0y63HCSOs6XcitpyrObIuRYAz1BAe
 TlEMFVr6Xy4cxsOm42hp5Hdlh1mQdPm1CQwR0tJCSokNJxvJX+ZoCYxzpat2EK2qQBVDA05V9gB
 yHMH83JBqs2KwZmGWtUMztxCiQXWDxTIDwkrri1CiIyIco8SKsLHwGf3t5yCVbdRBGFPex7Tmwz
 G1aLdfpPAm3vEPKIRbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080181

On Thu, Sep 3, 2026 at 11:48=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] THP initialization (`msm_gem_thp_init`) occurs after the DRM dev=
ice is exposed to userspace via `drm_dev_register`, creating a data race an=
d allowing premature access.
> - [Low] The module parameter `transparent_hugepage` is defined inside an =
`#ifdef CONFIG_TRANSPARENT_HUGEPAGE` block but accessed unconditionally in =
`msm_gem_thp_init()`, causing a compilation error when the config is disabl=
ed.
> --
>
> commit 46b2b6fe3a31a0213c502585828f1edd5794c935
> Author: Rob Clark <robin.clark@oss.qualcomm.com>
>
> drm/msm: Enable THP for GEM buffers
>
> This commit introduces a dedicated tmpfs mount point for Transparent
> Hugepage support in MSM GEM buffers to improve page allocation performanc=
e.
>
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index db1b655dd055b..33b9f495af020 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> [ ... ]
> > @@ -58,9 +58,29 @@ static bool separate_gpu_kms;
> >  MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GP=
U (0=3Dsingle DRM device for both GPU and display (default), 1=3Dtwo DRM de=
vices)");
> >  module_param(separate_gpu_kms, bool, 0400);
> >
> > +#ifdef CONFIG_TRANSPARENT_HUGEPAGE
> > +static bool transparent_hugepage =3D true;
> > +module_param(transparent_hugepage, bool, 0400);
> > +MODULE_PARM_DESC(transparent_hugepage, "Use a dedicated tmpfs mount po=
int with Transparent Hugepage enabled (true =3D default)");
> > +#endif
> > +
> >  DECLARE_FAULT_ATTR(fail_gem_alloc);
> >  DECLARE_FAULT_ATTR(fail_gem_iova);
> >
> > +static void msm_gem_thp_init(struct drm_device *dev)
> > +{
> > +     int err;
> > +
> > +     if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && !transparent_hugep=
age)
>
> [Severity: Low]
> Will this cause a build failure when CONFIG_TRANSPARENT_HUGEPAGE is disab=
led?
> The transparent_hugepage module parameter is only defined inside the ifde=
f block
> just above, but the C compiler will still evaluate it unconditionally her=
e in
> msm_gem_thp_init(), resulting in an undeclared identifier error.

I was a bit curious how this even works on panfrost/panthor, which do
something similar.  But looks like they declare the variable as extern
in a header, and doesn't throw a link error because the reference gets
optimized out.

BR,
-R

> > +             return;
> > +
> > +     err =3D drm_gem_huge_mnt_create(dev, "within_size");
> > +     if (drm_gem_get_huge_mnt(dev))
> > +             drm_info(dev, "Using Transparent Hugepage\n");
> > +     else if (err)
> > +             drm_warn(dev, "Can't use Transparent Hugepage (%d)\n", er=
r);
> > +}
> [ ... ]
> > @@ -178,6 +198,8 @@ static int msm_drm_init(struct device *dev, const s=
truct drm_driver *drv,
> >       if (priv->kms_init)
> >               msm_drm_kms_post_init(dev);
> >
> > +     msm_gem_thp_init(ddev);
>
> [Severity: High]
> Is it safe to initialize the THP mount point here?
>
> Looking earlier in msm_drm_init(), drm_dev_register(ddev, 0) is called be=
fore
> this point. Because the device node is already exposed to userspace, a pr=
ocess
> could open it immediately after registration.
>
> If userspace starts allocating GEM objects before msm_gem_thp_init() comp=
letes,
> could this race condition cause the allocations to silently fall back to =
non-THP
> shmem, or potentially lead to a crash if a partially written pointer is r=
ead?
>
> > +
> >       return 0;
> >
> >  err_msm_uninit:
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903183725.15=
835-1-robin.clark@oss.qualcomm.com?part=3D1
