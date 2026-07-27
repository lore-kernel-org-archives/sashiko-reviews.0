Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C5D3FD129
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 13:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785160716; cv=pass; b=nGfomzBLjcJzVkm3nA014u5gnoPujjOG/nrW8WBMafI/mswFqprHcZL3QJYZPweqKSmaQs4qZK6f0HGG35IjXY4Ly+WCFOOBAPUjdnus84JhBtt5u+oJIckQIY/m3/9wzsTZGswrEO1slLWrXt66nz+y12w2TcsHMJVZnczpNpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785160716; c=relaxed/simple;
	bh=uXBvOYhNzMxJ364+Ekr1qMbFo2iz6uQJjghwa4/XU5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIA+tHKYZnFgY999PTEo8IU23utGH7MmYuyOkMUSWoZMuhj0+GRenJBNzakAWa1P+w3hqmBTQGzrah1lpC2LXqLqIsySVj+Ql6qcBHfY9MxsDbnhlVaXAbrWjBSxKUBh5bSh38Hu2HPn6fDfeah1eFPsqQKtjgzYJ7hwGpNDaMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nmF5Qnt/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQkq5q2M; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nmF5Qnt/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQkq5q2M"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlijh4061167
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 13:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=2/I64L8gyijxS5bc44vT2Qmn8mMzYmRevPaSpuer7AY=; b=nm
	F5Qnt/+sbg12NOJAH11tzzZ4+3r6wCrzT0Ag+8iOBtWfWYAA7gqKio0snDQCsfk+
	aaZZmCdN1XsWGDFn3MdiuoSTQB5XSoWEABjBuIJxLQSjX6ANaelItxzbaI8At96O
	mg/NWJwmzfBU4P27m6yQfM7+FEYIEf5W9hXxszhlS8AnFrZY7ypBvy1kguUdADL+
	AnaNjhNK2zbNWqv1srGHYrPYYzqIOmmlalo0cC+YYvU5yhGwtA+DE9cFm2Sahvri
	DBbBMqpcGMQFdncXxfD29EP+ApoFxtDSBjP3kkQmRW3OzS68WDJvCkeXScT2f+cn
	EOAkA5ov1N1MzWCQopYg==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq11bw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 13:58:33 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-44899f99756so3140041fac.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 06:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785160713; cv=none;
        d=google.com; s=arc-20260327;
        b=KGKiwjl5ZRSDUm6qI4hyLA7L73Mv3jmCG/uXqwDUXfs2zNSQpYQYWlc4hu8CGddL5l
         auC8vST8nMgmNZNBgyk1/ILu1eyoa/sMrfD7qN6TTEDcSy1xGP93WMfwVJHsYkx2AVMm
         FPrbUIMRjnaE4PX2JQ15F7+YMIZCqkoLFblfANUBAdq2KJ32Yv5z0ow6zkx/QU5LAW6E
         y8UR+r3aX0pTnoRQPraun8HkYQyuuFXnc/xqBjV4Wyky2UQzS78t209qMETAWNBRpv73
         ngaf/3acf1VGYx9kt4ayj0qMPBoMHgYOhCc0w1ZROikcaONKt5Vp/fIhmUJznce/ng2c
         eh/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=2/I64L8gyijxS5bc44vT2Qmn8mMzYmRevPaSpuer7AY=;
        fh=bN3WHTlzXcVIr2RkgMpk3NXK/DwXOefqRaFpMbeYf7s=;
        b=qB2sMzWCGbHhD66489CMy5RzEMfSlmV/DUru/lPG3C3X6jb4kVlFZAQ16+6CCDQJxZ
         MzjmhV6+LiZEf3kWFBhsynD9heR6pc7BtppilCS36/BqV6tJnfmWRwOIVPqs4okg8H+9
         9knVoAK1BDn5MSBZpJi5qNvH+J8l2nZrXLg9+y0DZPE7ypXc7uogQFmNmXYMoYbiL8vi
         ZYawbb/QQpZwVKjdxYJMgLC6Tw0pzN/SPy9n+NNTY9nXsaX8LtsaC745OTHVQJ7BRBqu
         1NsnsYJnWPhVmOXimRx2gY0p02s/UXPsy+BBece8ZZ5KiSyG2dARLf+L61fs17y58XsV
         j8QA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160713; x=1785765513; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2/I64L8gyijxS5bc44vT2Qmn8mMzYmRevPaSpuer7AY=;
        b=DQkq5q2MrB/q+oGwWdtFDgmj4LSTg+QB6DJUwaHHAnVtvtSbYC3+UGJglqDvWrxwuF
         W+ERezn/y5AqxdBQ4MSJ/BFfPd/QwRK3CgRQtIKmPIxbjzrhNrfmxEEAm0ogJJrmbOBB
         OIWGDvk7OutrU1yQMpY3iWhxoTgr/maaO+2lbMzqeEnawSwrl6OWLoadfprrxsgfojD2
         cbUuj8+YXdJmfMFTyxDcPb14ejXaIbSgM08tYnQ1A7o6cwc4l3PwJ9lWoyxqNgvyBLl5
         TZodiPbb5OzKtQjxPcMNl/OYviUCx3p1oOsj/m5mh7KGLmLEQ1O/trxpRmFdHM3V041+
         OrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160713; x=1785765513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/I64L8gyijxS5bc44vT2Qmn8mMzYmRevPaSpuer7AY=;
        b=MOIVNA78pRS5RbCEPx0s2LnkGIUqlOxsDSI5kS3Lvo0IPgc15cacpY8o/KK0vKekqK
         doaT8JdSRGq0FOg+NHc94gHy6CCUxUWsoG0oWioi7aGl3CDeUaFYMLkdK4LK3AN+VfFR
         d8/dw5xMfDf0hvETbJJmkoTtRYOy+efZqa8trmmZUEx1Z2mBhBAunuh3FR5Raooc+VBH
         PlVru+I8PX5jFpn3O1sIFpFD3gXOh7boz5E4X0rnDUH8X+4iDArv99nlw3eFlP798sZk
         yame2MMA/Ep8PfIezVoj/r7gKBZssjM6cBVh7i6NR339rWp7Iy8297qRBg7c0W/FB7Gh
         xD8g==
X-Gm-Message-State: AOJu0YzUPbyoXMveJwb3urLMTBHI96k17hJJbIe7vG9zAV/Wdd6hZZlc
	g3NkFgPx4D/Y5ZEykvwv06hx/3OlEwwWM9DjhqdBPzVhkw+SCGIjtjLa2/HmlDe/CezcRannpPC
	rztoDrKQsZ97OVKnup7+XZnTlH/jYCw0Zc7o0ta/N628PxBlTpN+Fgedvv+Y7OC9QpnYi7BRfXk
	BWgp054Mp9PzvccZ1MUWvzbcWpV72nM+JhCMYB8E2TzfjOfInCcrBt0A==
X-Gm-Gg: AR+sD13YykzEXlwRQzdsUDhDN0Jthk1hdZaCk0FSlnOivu9gx6mhGurDBwO/ggsH2C/
	KvSyV9DoSKrQpeTqlLNviuwfMMBkOIyc+7AoHmoG53g89VOAPPwJIGhH5IcabxQH1ImdG1YtPic
	ZPnq2cMD7T98OcdVzAs3ng7cgWyOuxF2NT9gKI5kYK2qDedJLbxLGuvuUK
X-Received: by 2002:a05:6870:8555:b0:455:d1ed:221b with SMTP id 586e51a60fabf-457f281f022mr6445979fac.37.1785160713134;
        Mon, 27 Jul 2026 06:58:33 -0700 (PDT)
X-Received: by 2002:a05:6870:8555:b0:455:d1ed:221b with SMTP id
 586e51a60fabf-457f281f022mr6445968fac.37.1785160712776; Mon, 27 Jul 2026
 06:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260726174215.30010-1-robin.clark@oss.qualcomm.com> <20260726175737.407241F000E9@smtp.kernel.org>
In-Reply-To: <20260726175737.407241F000E9@smtp.kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 06:58:21 -0700
X-Gm-Features: AUfX_mzjX5Oe7EwHSY1PGT2PCj3gUKS-CcVwTXWCey8klABS0TwYWJpECrVMSmQ
Message-ID: <CACSVV025Ss2=z1gwnPpn0w7=9AWE=z+9zVpjc_-TwLPWp-5c=g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Preemption timeout should be greater than hangcheck
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfX6IPQDub129nY
 QaU+KwfPOWsfWUIpK/Yow/EccJ+OFJn/pIH3wTIIZtLXodo+SpyG4KyEHoXRFPty/zV5/bBWeUk
 VYGkvfSmJPrwt6UYs1ywBaFzoJt0H4k=
X-Proofpoint-ORIG-GUID: fODt-Ykt7LJ6CHEENCqEpCfiXLw6IXRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMyBTYWx0ZWRfXyFsilCLOlcne
 +6aeF0ZkfYe4j/8abWKVplxtXMU280HVhj7PW4JdzX1/gX8zBsxESqILwugy7SYylBHDc//TplS
 /PIIhdvpLmZJJMNvVm33S5fGKd7fKUWRx+4OJjAELA4fYITjYCRLQF0oCS5wFXtWR4VLH7/M/kr
 b/N5TmKu+FZBWN0EzRMoVMyTePV4P01p0m6Sz+mV9Vren12X+JP78em1qsSEMDlNIZkARIqA29b
 EVseudFEgDLUJ/VHnZofwfQ4+F4RZTrKdOHmwjwOeHqEu/C7PEZjB+ZHxxqSLjtFKhdmL4y7RgZ
 eqAPYRd/+ZuadCZwWGrXiFxNnnms2yO9NiBFRzflMRjjfQ/wG9JA1Wr4nmKrrSgLT1r/52xxezi
 a5DZjj6QBY2ucC++gVmcpkBWvybjeJs9ictn0HC/4WmBVK8V4E9IBcImzn0aVqsQH1YtftDh6an
 oGSoiF/c9QafhibKGwQ==
X-Proofpoint-GUID: fODt-Ykt7LJ6CHEENCqEpCfiXLw6IXRc
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a676409 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=qWa5M4ji-oYYbHf_jLQA:9 a=QEXdDO2ut3YA:10 a=1zu1i0D7hVQfj8NKfPKu:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270133

On Sun, Jul 26, 2026 at 10:57=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The preemption timeout calculation fails to account for the ha=
ngcheck progress multiplier, causing premature job termination for long-run=
ning jobs.
> --
>
> --- Patch [1]: [PATCH] drm/msm: Preemption timeout should be greater than=
 hangcheck ---
> commit 5454ddf4018869efeec2d7c8f2767056ad2612d9
> Author: Rob Clark <robin.clark@oss.qualcomm.com>
>
> drm/msm: Preemption timeout should be greater than hangcheck
>
> This commit changes the preemption timeout from a hard-coded 10 seconds t=
o
> the maximum of 10 seconds and the configured hangcheck period. This is
> intended to prevent the preemption timer from prematurely killing
> long-running jobs that are otherwise compliant with the hangcheck timeout=
.
>
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_preempt.h b/drivers/gpu/dr=
m/msm/adreno/a6xx_preempt.h
> > index df36c945b836b..178017aad26e6 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_preempt.h
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_preempt.h
> > @@ -35,6 +35,14 @@ static inline void set_preempt_state(struct a6xx_gpu=
 *gpu,
> >       smp_mb__after_atomic();
> >  }
> >
> > +static inline void set_preempt_timer(struct a6xx_gpu *gpu)
> > +{
> > +     struct msm_drm_private *priv =3D gpu->base.base.dev->dev_private;
> > +     unsigned t =3D max(10000, priv->hangcheck_period);
>
> [Severity: Medium]
> Will this under-calculate the true hangcheck timeout when progress detect=
ion
> is enabled?
>
> According to msm_ringbuffer.h, when progress detection is enabled, the
> hangcheck timer duration is halved and allows up to
> DRM_MSM_HANGCHECK_PROGRESS_RETRIES extra cycles.
>
> If a user sets a large hangcheck period via debugfs to allow for long
> compute shaders, wouldn't using priv->hangcheck_period directly here resu=
lt
> in a preemption timeout that is shorter than the actual allowed hangcheck
> time, potentially still killing the job prematurely?
>

yes, but the progress detection is based on detecting that the CP
advanced, which won't be the case for long running compute shaders

BR,
-R

> > +
> > +     mod_timer(&gpu->preempt_timer, jiffies + msecs_to_jiffies(t));
> > +}
> > +
> >  /* Write the most recent wptr for the given ring into the hardware */
> >  static inline void update_wptr(struct a6xx_gpu *a6xx_gpu, struct msm_r=
ingbuffer *ring)
> >  {
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260726174215.30=
010-1-robin.clark@oss.qualcomm.com?part=3D1
