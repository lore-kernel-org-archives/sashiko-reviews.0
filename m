Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5885231A41
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 13:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515783; cv=none; b=uZ57obEzgp1hj08pihq+WploEH2I4hOgC6sit6syBtc0coypD074DHMbRIeV5rOkuZ8ImptpVsEui9M578DmIj/I052U5hIn8SLc0ymQFwfUcMfj5AIRiPMLNXSoCsBZdSX5WhzskT4yQAWHihI2N07z/56rwf6d3oROp5IusHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515783; c=relaxed/simple;
	bh=7Lxi7iDaT8pqkFSGNTTdtgmJEOyqWAW6wc0jAeCCx7k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=r37TdEuRi2bXSyCZNUtrWGPz8XdsQi9LlQZDJ1KSgu2Aqn9Bd5UDdomlA/uD98DXQvANSTOa9oY+g86eREXTlxAqEegKSWNIWOnP47J/pY6E+b/ApdDD4F6yBF9WDClnH09YY1wD8tiPOIdk1fCBUb65Nhidl02OX+SeKb5Skn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QdA94HJa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GiNwGfK5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QdA94HJa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GiNwGfK5"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C45VO2716591
	for <sashiko-reviews@lists.linux.dev>; Wed, 8 Jul 2026 13:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bW8Rt8SkUXrRS7hBd4Xcr0lGu7clJHP5YFax+CGPEgE=; b=QdA94HJauxeS6O8B
	vLpFERs5En+fDw6Ni8zLPfZ10+wSRYl6/BFbkMLAxzw8vTgA1gELuMuLx1ehgNSb
	b1kvniHR69ev+n21b077EcR+t0kVJBN7EBqA/1lf3oVY5AMQ8lrEJrbjuv33LICA
	nn7Gwgp5x1qqJ2cPNKeCf41XBTw9WA4rxbwumCuLg6r/NXh4OuLVIbT/CzNlTuXE
	RGf/f3bWJSAKEL+/4603z+23/qIg+HFEFxTWAblRNCf/ztQJhl9gX9/QoR5i7SIe
	S3XMqUJvDLO71dioCMk0d9NYI3LUWmVmkK8plGoGfC4rzdsEwdeDX5zDQteI/+OB
	XKDtSw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd4hqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 13:03:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cacd6d37edso13864345ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 06:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783515780; x=1784120580; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bW8Rt8SkUXrRS7hBd4Xcr0lGu7clJHP5YFax+CGPEgE=;
        b=GiNwGfK5DZB+r9U99g/MQb1+dIq6vacuualkjjbfAIkMmDs1sYmyrLPHLEwYXFtZfk
         iE7lV1Glxki1C6CdLLmlgyHjcMR+au9q14QyrytnKPfJbp2MclFVnW1SU5LaOCJE2vw0
         1/vCYdSyF/VjOhScGMDYZFvyKIKDQdOCt4YSkYMEFIqEJMXhILYBnhL/TxhDAO4gbPVu
         ZBg13WKmlYBUE9t0PuR2DlXsegD5pdD36OfWtlh83++2VyQo3CcpYhM6qwC7ncQghDe4
         VYypshId9aNhyJfqaGE4MKaQuppFygfEWDtGv5RVx+JnB8aPUuJ4KFB3azQ3TW1CZ0pE
         /PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515780; x=1784120580;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bW8Rt8SkUXrRS7hBd4Xcr0lGu7clJHP5YFax+CGPEgE=;
        b=Fax4u4lv6IBfCKJ7gV2EAfWZDXxxVTkFWIAFFqW0aSS0+GeYcAvz5eX9v8ElMM3lMZ
         kPbK7gOOCYh4U+5cRePP4fya8EuDR6bZQN2isJJouyt38gXj1Nn9myGef11blpvA2bT0
         rLl3sK6xP1uayNau9hc00q00xjT4bajJ+6vkHPv+XphFNhkE2td20CB7BwMMLaq6QRYS
         DQTpBG3aNJtHVpn7Z/F1tcVe+NzIo6RizGwqxWvi8FmesUpiRRC+YTi5Oop3IMBKFjjc
         rPeeO5+5tKJLUJ3brYeWrGrzy1KLZibE3d3pBigDFQjXNj9QWpb+QnFv4ljP31rcb4LL
         xrOg==
X-Gm-Message-State: AOJu0Yyg4XWPjPfveLHuPjB16suoWSBoUQbPDeC6A0ZeVVgoz7qGgRXV
	/4QiO/6Zx/IAJwQTATtN9RfJqGug5S/1GO1KrfZuo1+rpkAlOwXUw5H30hNS4XrSAHBEuXKc8Me
	3Kgq+x4ojJtSRYIRTl7/USp0094XaDVNuSerSC9BIFpJPYHD9PxsXRN/I8sYqBM8OSAUdOn0fXt
	KwLl3qR6h/
X-Gm-Gg: AfdE7ckF11dLuZGRw73HRrIjD+2LQMoF8AOnDqk/GVALCT9FrEoDtUdTp4DtCe+F5yn
	/oKJ7Xf2hjapdcDeJF5YBdJ+UYtZrMuhhHjEjEPb4NQ9RcRtQ+9uPDHIBdyVK2rBE6uoEHMP5Qc
	a+vFiKprcExPmmNcUaZk1WVs8ZA0kwC6bju+oZNb+LAFVCe2FAzweiEcV7eNxiqbc670h3bJr8S
	zZI0+2RL2HfciPCMJ8w5dxqVdGIQa+JhLztWDvyLEtfZYzwUrlCRIBG2e4vHuBG8rw1RSRt44On
	5MhAV617lCjPzpOu9yuQQ1uWNEIb+XbiRMAon+lmGcFiJudmHlO82osT6bMt+vkfSQ9Rf3QufFg
	f+b2zwQWOyhOp504=
X-Received: by 2002:a17:902:d58e:b0:2cc:6817:d9b1 with SMTP id d9443c01a7336-2ccea3c5f85mr25549055ad.41.1783515779390;
        Wed, 08 Jul 2026 06:02:59 -0700 (PDT)
X-Received: by 2002:a17:902:d58e:b0:2cc:6817:d9b1 with SMTP id d9443c01a7336-2ccea3c5f85mr25548465ad.41.1783515778712;
        Wed, 08 Jul 2026 06:02:58 -0700 (PDT)
Received: from localhost ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb9bbsm28448435ad.4.2026.07.08.06.02.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 06:02:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 21:02:43 +0800
Message-Id: <DJT7KMR52GVK.3VALV6I8OUZU7@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
        <Frank.Li@kernel.org>
Subject: Re: [PATCH 3/9] drm/imx: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-3-b4e1ca053623@oss.qualcomm.com> <20260704184616.117DE1F00A3A@smtp.kernel.org>
In-Reply-To: <20260704184616.117DE1F00A3A@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNiBTYWx0ZWRfX5hdYK941ZXwh
 A0UB4NJM4pOw8dkgmpu0cklAEWwuz0tahgaiX54M6OER7SPa4F5dyt80wQWHoNRVrwaO2h52SB4
 gJxU3WZN/htvA4CsR5ozHhEUuU3BNZEEigk/4vyws4O6m19cPCqUgtu2nDkW3MgQmjxnVE7MdW2
 6w9lQbFbEG7Cc+BOS5hRANUpbWACStCPIC/nSgVl/VTh0AUYtNLZ9ELrTlVD0eQCpldZDWUbwQX
 /Fkt18JdBqCpbHDjXYpIF8oIWcOKr/qX162MMhlyKxF2xDyyZmSqJ+bdFYeZyYwIVld4cSf1ZSD
 bAgXhy5TatMfajoNSOFjs+VLXX7gWPe+1PyfOrOkqWDkTb75Vp4mQSCKOBDPWUMTMG4S9YJAtVH
 emE4HtBjo1ZQWEqKe4j/Cm32nvfVAXdT00sV9KLRmFnns20rldCLjY1mjcT7t4CpD3Q6yf2Fk/g
 32WWS3jsPQyhwfS/Cxw==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4e4a84 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=gqZdODBt_byO9L1YbMIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 0yU7Asqf44yQ0Tw6MzLY08Kd_HRG6J4y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNiBTYWx0ZWRfX+5YPybNcOaJv
 uvcdVSOh2miP7glxTw8amk+Umv/DUodUsuxlaaBCm+XPreC0K+1AsC9MIaw8ylElpcYU/1Jn/kY
 zq8TqX2TqebisAxa5JDb0XPRuH16NhQ=
X-Proofpoint-GUID: 0yU7Asqf44yQ0Tw6MzLY08Kd_HRG6J4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080126

On Sun Jul 5, 2026 at 2:46 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
>
> New issues:
> - [High] CRTC disable operations fail unconditionally due to early mode v=
alidation.
> - [High] Plane atomic check rejects offline plane updates, breaking displ=
ay disabling.
> - [High] Missing drm_crtc_vblank_on() and drm_crtc_vblank_off() calls bre=
ak vblank synchronization.
> - [High] Missing .enable_vblank hook in drm_crtc_funcs causes kernel warn=
ings and breaks vblank.
>
> Pre-existing issues:
> - [High] Racy direct state access in atomic callbacks leading to potentia=
l use-after-free.
> - [High] Unbounded clock reference count leak on CRTC disable cycles.
> --
>
> commit 404ed5ff8b68b90a5ba44e0c6a32b76744948691
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/imx: replace struct drm_simple_display_pipe with regular atomic helpe=
rs
>
> This commit converts the i.MX LCDC driver to use explicit primary plane,
> CRTC, and encoder objects instead of the simple display pipe helpers. It
> retains the no-scaling plane checks and GEM framebuffer prepare callbacks=
,
> adjusting hardware state only when a framebuffer is present.
>
>> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/l=
cdc/imx-lcdc.c
>> index c67fe80b8115e..f0c4c19f91166 100644
>> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
> [ ... ]
>> -static void imx_lcdc_update_hw_registers(struct drm_simple_display_pipe=
 *pipe,
>> +static void imx_lcdc_update_hw_registers(struct drm_crtc *crtc,
>>  					 struct drm_plane_state *old_state,
>>  					 bool mode_set)
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_plane_state *new_state =3D pipe->plane.state;
>> +	struct drm_plane_state *new_state =3D crtc->primary->state;
>
> [Severity: High]
> This is a pre-existing issue, but does this direct state access create a =
race
> condition?
>
> In non-blocking atomic commits, the DRM core synchronously swaps these ob=
ject
> pointers before the asynchronous worker executes. If multiple commits are
> queued, we might retrieve the state for a future commit instead of the
> current one, which could lead to programming hardware with an unpinned or
> incorrect framebuffer.
>

Will switch to drm_atomic_get_new_plane_state()

> [ ... ]
>> @@ -230,34 +231,34 @@ static void imx_lcdc_pipe_enable(struct drm_simple=
_display_pipe *pipe,
> [ ... ]
>>  	imx_lcdc_update_hw_registers(crtc, NULL, true);
>> =20
>>  	/* Enable VBLANK Interrupt */
>>  	writel(INTR_EOF, lcdc->base + IMX21LCDC_LIER);
>>  }
>
> [Severity: High]
> Should drm_crtc_vblank_on() be called here?
>

Yes, will do

>
> Without notifying the DRM core that the hardware vblank interrupt is enab=
led,
> the core might consider the vblank state as off. This causes vblank waits=
 to
> fail unconditionally, forcing the plane atomic update to immediately send=
 page
> flip events to userspace rather than waiting for vsync.
>
> [ ... ]
>> -static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
>> +static void imx_lcdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +						struct drm_atomic_commit *state)
>>  {
>> -	struct imx_lcdc *lcdc =3D imx_lcdc_from_drmdev(pipe->crtc.dev);
>> -	struct drm_crtc *crtc =3D &lcdc->pipe.crtc;
>> +	struct imx_lcdc *lcdc =3D imx_lcdc_from_drmdev(crtc->dev);
>>  	struct drm_pending_vblank_event *event;
>> =20
>>  	clk_disable_unprepare(lcdc->clk_ahb);
>>  	clk_disable_unprepare(lcdc->clk_ipg);
>> =20
>> -	if (pipe->crtc.enabled)
>> +	if (crtc->enabled)
>>  		clk_disable_unprepare(lcdc->clk_per);
>
> [Severity: High]
> This is a pre-existing issue, but does this leak a clock reference?
>
> The atomic_disable callback runs after the DRM core updates legacy state
> variables, so crtc->enabled is guaranteed to be false here. This means th=
e
> clock might never be disabled during a DPMS cycle.

You're right, crtc->enabled is no longer valid here, I'll use old state
instead.

    old_crtc_state =3D drm_atomic_get_old_crtc_state(state, crtc);

    clk_disable_unprepare(lcdc->clk_ahb);
    clk_disable_unprepare(lcdc->clk_ipg);

    if (old_crtc_state->enable)
        clk_disable_unprepare(lcdc->clk_per);

>
> [ ... ]
>>  	spin_unlock_irq(&lcdc->drm.event_lock);
>> =20
>>  	/* Disable VBLANK Interrupt */
>>  	writel(0, lcdc->base + IMX21LCDC_LIER);
>>  }
>
> [Severity: High]
> Is a call to drm_crtc_vblank_off() needed here to synchronously disable v=
blank
> processing in the DRM core when shutting down the hardware interrupt?
>

Yes, indeed, will do.

> [ ... ]
>> -static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
>> -			       struct drm_plane_state *plane_state,
>> -			       struct drm_crtc_state *crtc_state)
>> +static int imx_lcdc_crtc_helper_atomic_check(struct drm_crtc *crtc,
>> +					     struct drm_atomic_commit *state)
>>  {
>> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(st=
ate, crtc);
>>  	const struct drm_display_mode *mode =3D &crtc_state->mode;
>> -	const struct drm_display_mode *old_mode =3D &pipe->crtc.state->mode;
>> +	const struct drm_display_mode *old_mode =3D &crtc->state->mode;
>> +	int ret;
>> =20
>>  	if (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES |=
|
>>  	    mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES |=
|
>>  	    mode->hdisplay % 0x10) { /* must be multiple of 16 */
>
> [Severity: High]
> Will this cause CRTC disable operations to fail?
>
> When userspace disables the CRTC (like via DPMS OFF), crtc_state->enable =
is
> false and the display mode might be zeroed out. Validating the mode dimen=
sions
> before checking crtc_state->enable could cause this check to return -EINV=
AL
> unconditionally.
>

OK, will check crtc_state->enable before checking mode dimensions

>
> [ ... ]
>> -static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
>> -				 struct drm_plane_state *old_state)
>> +static void imx_lcdc_plane_helper_atomic_update(struct drm_plane *plane=
,
>> +						struct drm_atomic_commit *state)
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_pending_vblank_event *event =3D crtc->state->event;
>> -	struct drm_plane_state *new_state =3D pipe->plane.state;
>> +	struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_state(s=
tate, plane);
>> +	struct drm_plane_state *new_state =3D plane->state;
>
> [Severity: High]
> This is a pre-existing issue, but does assigning new_state directly from
> plane->state risk a race condition?
>
> For non-blocking commits, fetching the new plane state from the
> drm_atomic_commit object avoids reading state from a potentially concurre=
nt
> future commit.
>

Will do

> [ ... ]
>> +static int imx_lcdc_plane_helper_atomic_check(struct drm_plane *plane,
>> +					      struct drm_atomic_commit *state)
>> +{
>> +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state=
(state, plane);
>> +	struct drm_crtc *crtc =3D plane_state->crtc;
>> +	struct drm_crtc_state *crtc_state =3D NULL;
>> +	int ret;
>> +
>> +	if (crtc)
>> +		crtc_state =3D drm_atomic_get_new_crtc_state(state, crtc);
>> +
>> +	ret =3D drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  DRM_PLANE_NO_SCALING,
>> +						  false, false);
>
> [Severity: High]
> Does passing false for the can_update_disabled parameter reject offline p=
lane
> updates?
>
> If userspace tries to disable the CRTC without detaching the framebuffer,=
 the
> helper will see a plane on a disabled CRTC and return -EINVAL, which brea=
ks
> display disabling.

It is inherited from drm_simple_kms_plane_atomic_check(). I'd like to
keep it the same way.

>
> [ ... ]
>> +static const struct drm_crtc_funcs imx_lcdc_crtc_funcs =3D {
>> +	.reset			=3D drm_atomic_helper_crtc_reset,
>> +	.destroy		=3D drm_crtc_cleanup,
>> +	.set_config		=3D drm_atomic_helper_set_config,
>> +	.page_flip		=3D drm_atomic_helper_page_flip,
>> +	.atomic_duplicate_state	=3D drm_atomic_helper_crtc_duplicate_state,
>> +	.atomic_destroy_state	=3D drm_atomic_helper_crtc_destroy_state,
>> +};
>
> [Severity: High]
> Should this struct include implementations for .enable_vblank and
> .disable_vblank?
>
> When drm_vblank_get() is called to wait for vsync, the DRM core requires =
the
> enable_vblank hook. Omitting these causes a kernel warning and makes the =
wait
> return -EINVAL.

Right, we need enable_vblank and disable_vblank here. I'll implement two
empty hooks.

Thanks,
Ze
