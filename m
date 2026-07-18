Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E24242D88
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784398932; cv=none; b=D6nxcQcplULDLEdMDT7T0uNJH6FVMpfl+c1wPk9lHaGGCJt3yTIrHGzAe833iGIt9AckLgaqxhaTWkGKcabWnHUJ4IF1W9EUbKOe4MOtoOzQ2e/ksh2chUxkADxuErDDgI9iHi/09QhXOVD67B1ZGrGVne4KHhr9cQ+U9lb4ZOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784398932; c=relaxed/simple;
	bh=mmhCxtvOcCVPzYJpjWdf54JNQMO8RYQ1+xtt+7mSAIE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=H5xXAjwcAgG6pQN3ifIPFrI56yGJ7CPeJ0LdmWlKL4xhNph5T7fA3X8iUae4FK550RfYhKqHZ7PemAAj7/ypFiOs/2u+bRbrn6znJ2Q08m7hVdQlWMIVLzATH6FvjWHj5AuhX8HIqLg5LPe6J2asgb6TuVkZ/yRYtRxexEJwsVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGNZsNoC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVCHG6WO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGNZsNoC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVCHG6WO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IGONls1262528
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:22:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HyBbYwp5p4Yke6LTJxxI12Zk78NEYeUMQXe2QXNyi9Q=; b=fGNZsNoCnta2l9tI
	FEPN5AaesMZTVVdySsoa1jZrc6/5uojsZCld5WXLUhoAFfZNfxYWG7j8782rW7z6
	ArsngHIB07mOYl/Rpum6JWK/cL2duwOcfyiYNdny1Qye9Zr+F8I7v937NIpg0TTo
	7AhIkc2WgM68oMlSqqRrS3V7p9uh5LpnN1V7wTkOj4TCpQlT8PxeN0dXvYdXvHtl
	xO3JnFQz5rbRTnRhnJnJOPv1rX+l/P0qy0iXLlB9CkVsM8D2KqkrvaDSViJlhC9h
	qTyltTZNzIcarxtvEQKLAZOZgrloCuyZkpnt70irZj7lS/dnLiUCqUulhmui6nEn
	abiKew==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2c69b36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:22:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38827cee19eso9469789a91.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784398928; x=1785003728; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HyBbYwp5p4Yke6LTJxxI12Zk78NEYeUMQXe2QXNyi9Q=;
        b=iVCHG6WOGu8QYR324kH3nV+45F7bE77VCK8X+MMcLzTDqHP/1Huuv+cFXLRKpu1x2W
         9oRc12+vBSK2Cl+KAMMgLXKyfRsu2RBeTRNV4J2Mh9iifHuQrB+f6OcCQfHcy0qmc7us
         exS4j0IPKiOblKYjedLcLCG4tSJJIlaNaik24jZgWouiuInr3UhCrpipI+VBDM1xdG7o
         QrYmlDnKYWTJDCb8D/fyxx/La2akN3zvTfDa7bM9+oJQWhUarc96yL7sOFLXSrYOM7Kc
         KhZEPS8+g2LqnNwh1ANORVE7nieg9cAJo2at1CdOyiDUBPMabpdZjQUVFYYLwiKwLS/o
         Pq/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784398928; x=1785003728;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HyBbYwp5p4Yke6LTJxxI12Zk78NEYeUMQXe2QXNyi9Q=;
        b=Ko85DIZbKISQNQQjmrPJGhdlR8d/oe6JG7OkXgksFCwhQoI5cpb5QNo+xACpjlwJ/Z
         2v6chza5l9jpWxVHlvnfI5zVvYci9V+lqbCTAGaAvB0hZwxC1hyyoDYlB1fInVM4x/pf
         MTcALQRheZ/tSkXmaLOREk2d1fEP1pRAsivETCKmEQBs5OHQ0uWUCGAlBrDyIila0dKF
         LQEgy/ziv70V9txuDWXti8+Oc1pS6E3UdJCHx9bfss253fp6+HlEUlHk45+Pw73uiNJX
         0R0Bz4vxO+1D344JblWVLAmcsquqJryCv1Zf3evK+ZX2u5Zju+GzCkVvgDJwjqkH+N7G
         jx0Q==
X-Gm-Message-State: AOJu0YxSfPrsnawcrv0ovesU390fSpCd7lY0N/2MdsdzUgUx9hDwBU3P
	9zRwxd6XnI3cqH0U9wQ9tA1VjpDbdojVzPIxgk9GZFvOeKlsP43CORnfGb9cRShNXLj9LITCSoZ
	iCxU9rn4IfrPv7iIzOib/+UT6D0LBMncaoZixnBkwwVH+qqe2vLs2ac1DjPrQh67G7PCLqIqsVu
	JdjJLrgzMq
X-Gm-Gg: AfdE7ck+ER6pr6mDEdSeposU2/QMr/lpXgCLdZRV/5XW6Jy5qDNLB4CfHDLjzHzvknI
	6qdJDE8qJ8MRusURxDgTiHQHevm1o19b4pTxa112qXgoVyBH33dHLk70wqQyY+BJSR+5/DbJV4o
	UqmBSelK/SoLst7UQ51eGgcsC8TYJMN3bEWJyUyTHKzdKz4Njl26XYNk3LaF7P/8cAQsZIJhXkD
	vovSNImRXxaSTiIT2BJ3v8AhJ79M6b2wfphWi4dzlriuOau8de6a8YKIfA0/CChSYPiRkQrl0Er
	7a0jwN+CSY+ycrcgPOa3fukXAg56I4ZjD5gh/lHxP1+u6RSBLS9cJmp2vvduwPgs9XS9UDnv8pE
	/kR37PQ==
X-Received: by 2002:a17:90a:d605:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-38e4b54436bmr8084701a91.30.1784398928606;
        Sat, 18 Jul 2026 11:22:08 -0700 (PDT)
X-Received: by 2002:a17:90a:d605:b0:37f:9ce3:ca95 with SMTP id 98e67ed59e1d1-38e4b54436bmr8084675a91.30.1784398928065;
        Sat, 18 Jul 2026 11:22:08 -0700 (PDT)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2de31a7sm16705718c88.15.2026.07.18.11.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 11:22:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 02:22:03 +0800
Message-Id: <DK1WMKS5DBMB.3O0SCPNN6ZSVV@oss.qualcomm.com>
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
Cc: <imx@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
        <Frank.Li@kernel.org>
Subject: Re: [PATCH v2 7/8] drm/tve200: replace struct
 drm_simple_display_pipe with regular atomic helpers
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com> <20260716-drm-simple-kms-removal-v2-7-1133a8fc3785@oss.qualcomm.com> <20260716092549.D4B5A1F000E9@smtp.kernel.org>
In-Reply-To: <20260716092549.D4B5A1F000E9@smtp.kernel.org>
X-Proofpoint-GUID: QOKNwA4_zk4Vo0TC4P6dbWL-a8fvP8co
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE5MiBTYWx0ZWRfX5s7PVBZu97Ko
 LxagjiVDbmY9LsUw1jcB6kpjtu4W7Gy0PvdZSUMsyQSx1vW0zYn+b+6WXEi0o9DKuT4AlWKZXMR
 lVlzEOKZxqdNY9KLi20PCUf3KS+zwL4gIk+MnIpTKIftIiSUtcRBefFFGZwZ6M5b9aJxfVHznbK
 h9h2iwgREcBSMI80QRz6HTMbYE3/PecH18bDQo8eHOCLk8WGy1Xt/yUu/Syzv5ZcFeQKoyZvXRL
 tF1gupLtDVnqizm/SCGFB9/1TQ8SCT2aoQpWJWY2NLC0uVL2lvvC1cgkGHwbQ7T8CRXnlA9M8zm
 79Ao/xUd1zh23dfKS6PGWPydCm8sbRmOch2q2mMvR8Ly/7ijFF7e3qnuzNP57EwISOGEsq+Tgim
 6OU5SAA7Rd0rNjnJMG323ux5+oqB/0TmDSjMO8Jc/K6sg4n62lsvVb30nZSBMMqG1i1TrPgoNGW
 ko6MFyBl+5T34CmeTFg==
X-Proofpoint-ORIG-GUID: QOKNwA4_zk4Vo0TC4P6dbWL-a8fvP8co
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE5MiBTYWx0ZWRfX9EX7fnFYglpS
 PSCI94yej7oYnzqcidwb5dTCTyMTbXbIZ7n0mieit9z0CtNrv5ks2GtkmPiQlfTjInQVO8NlVQR
 Tqfo32/so7LMbRst0IoN3VtPwXJFWYg=
X-Authority-Analysis: v=2.4 cv=CJQamxrD c=1 sm=1 tr=0 ts=6a5bc451 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=kdYVNXHMfqCZok_UY-oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180192

On Thu Jul 16, 2026 at 5:25 PM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Directly accessing `priv->plane.state` in the CRTC atomic enable=
 callback introduces a Time-of-Check to Time-of-Use (TOCTOU) race condition=
 with subsequent non-blocking commits.
> - [High] Missing `.cleanup_fb` callback in `tve200_plane_helper_funcs` le=
ads to memory and resource leaks of pinned GEM objects and DMA-buf mappings=
.
>
> Pre-existing issues:
> - [High] The CRTC atomic enable and disable callbacks call functions that=
 can sleep (`clk_prepare_enable`, `usleep_range`), violating DRM atomic con=
text guidelines.
> --
>
> --- Patch [7]: [PATCH v2 7/8] drm/tve200: replace struct drm_simple_displ=
ay_pipe with regular atomic helpers ---
> commit 30e007b0736d27ee72ba4a5f39e203c3808e470e
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
> drm/tve200: replace struct drm_simple_display_pipe with regular atomic he=
lpers
>
> Convert TVE200 to explicit plane, CRTC and encoder objects. Keep generic
> plane-state validation before TVE200-specific mode, alignment, pitch and
> format-change checks, and install GEM framebuffer prepare helper explicit=
ly.
>
>> diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/t=
ve200/tve200_display.c
>> --- a/drivers/gpu/drm/tve200/tve200_display.c
>> +++ b/drivers/gpu/drm/tve200/tve200_display.c
> [ ... ]
>> @@ -119,16 +140,72 @@ static int tve200_display_check(struct drm_simple_=
display_pipe *pipe,
> [ ... ]
>> +static const struct drm_plane_helper_funcs tve200_plane_helper_funcs =
=3D {
>> +	.prepare_fb	=3D drm_gem_plane_helper_prepare_fb,
>> +	.atomic_check	=3D tve200_plane_helper_atomic_check,
>> +	.atomic_update	=3D tve200_plane_helper_atomic_update,
>> +};
>
> [Severity: High]
> Since .prepare_fb is assigned to drm_gem_plane_helper_prepare_fb, will th=
e
> lack of a corresponding .cleanup_fb callback lead to memory and resource
> leaks of pinned GEM objects and DMA-buf mappings when the framebuffer is
> swapped out?

The documentation for drm_gem_plane_helper_prepare_fb() [1] explicitly says
that simple GEM framebuffer drivers do not need a matching cleanup_fb hook.

[1] https://elixir.bootlin.com/linux/v7.1.3/source/drivers/gpu/drm/drm_gem_=
atomic_helper.c#L107

>
> [ ... ]
>> -static void tve200_display_enable(struct drm_simple_display_pipe *pipe,
>> -				 struct drm_crtc_state *cstate,
>> -				 struct drm_plane_state *plane_state)
>> +static void tve200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					     struct drm_atomic_commit *commit)
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_plane *plane =3D &pipe->plane;
>>  	struct drm_device *drm =3D crtc->dev;
>>  	struct tve200_drm_dev_private *priv =3D drm->dev_private;
>> +	struct drm_crtc_state *cstate =3D drm_atomic_get_new_crtc_state(commit=
, crtc);
>>  	const struct drm_display_mode *mode =3D &cstate->mode;
>> -	struct drm_framebuffer *fb =3D plane->state->fb;
>> +	struct drm_plane_state *plane_state =3D priv->plane.state;
>> +	struct drm_framebuffer *fb =3D plane_state->fb;
>
> [Severity: High]
> Could this direct access to priv->plane.state introduce a race condition
> with subsequent non-blocking commits? A fast sequence of commits might sw=
ap
> the global state before a previous commit's worker executes this function=
.
>
> Would it be safer to extract the current commit's plane state using
> drm_atomic_get_new_plane_state(commit, &priv->plane) instead to guarantee
> it reads the correct snapshot?

Will do

>
> [Severity: High]
> This is a pre-existing issue, but does tve200_crtc_helper_atomic_enable()
> call sleeping functions in an atomic context?
>
> Looking further down in this function, it calls clk_prepare_enable() and
> usleep_range(). Similarly, tve200_crtc_helper_atomic_disable() calls
> clk_disable_unprepare(). Since atomic commit callbacks can run in an
> atomic context where sleeping is forbidden, could this cause system
> instability or deadlocks?

It is a false positive.
