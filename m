Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F5A2248BE
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784397916; cv=none; b=hhyNRTu9hVg5XNRBXzJe/ONF9Zr3L1cKNnjlCooRuIcn6QegxRnFJ739BXGO5tBqq5ZrAWtVxmZKnhsrEk24Mfg2oJgM/lgpzM4WMk1BVXHEjcou7B9+NEujvuHPMjyYIwLxz64BGmr44cHSRVzQ+ut9fWIvwXXFHZVAL8XQQ7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784397916; c=relaxed/simple;
	bh=Sidb2c/RwAU2rIEe8nUH6H1P79gpRCGxiQdJSewYE8g=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VAdQMrFvTH2rrUSuvHosjWBtUQe4jOG53xpqeFiBZnvwgxgpuw26Z6ApV0LZeQGQbHSZ+BV87/nd+/M2jLBJxCTGhJ3zmOV5qx3KQfj1mFgNtDB+WrV2b3hDZNgSXXFaukDZ7h0xYKMobrOC9FRiF/VsnhPxhRCICVssL5o5rhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Je3Nto1/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E8XEPYvE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Je3Nto1/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E8XEPYvE"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IGOOSq2248710
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lj0KthQFjmiFZbaHRNHX9gCpXpklkdkuBiE4u7UUrik=; b=Je3Nto1/82UDhWTB
	LlXPAqggJHP6ka018H7tN9MJVbIYg/bY7tislxhqsZjNP1GJTs0UZzDnB4iswY+8
	DSL6IzetPwBYgLDz0MH4KS2fB3Ga9HVQtFGt2/Ce1H3xKHplXFfTZj3OId+sCGNJ
	UYRJi+v2nmg2B6Hmti/ZldXz0WqJ//3KNRrPwARep5swGFbl7/947zbIj2lKuUBY
	9srp0HBoo5GIO1zYAoaTS2VjdyDSC+yR3MurAzu1+YAokF3jmYFFGWDdBobRlybh
	imDxJ1ZfOHcttLCNRJndgZ9VuLS3sGfjzN0hP+SGWBRhyONPU3NvCNTMkzi/JAhj
	tSZQ3Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2aas9qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:05:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so3291456a91.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 11:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784397914; x=1785002714; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lj0KthQFjmiFZbaHRNHX9gCpXpklkdkuBiE4u7UUrik=;
        b=E8XEPYvERZA8YGjMYz267DrZwkHCwCF/vQMdOeNybgrcaf0L8O3VjeWBIP6yzed7Ji
         l1uwirYmfOHS3OQKOva/gngQiWRBHvo8Y+g6NUcYTyZNGxhw36/sUQgEA+q0FoEkycoZ
         RynHR8AiffMm8IdZacQuh3qeKECD+eaNMt05PbQQDt92vUfTe0xr3PdMxMWpMKaBnAPZ
         yPh8lWtVTVzCtTNgfgJHpa0RQ6cDBegGxCoiXrDi1b3eW1h07q0nlN3QJxJoe5UbS97l
         TkHwmsPkRadxWuaBBhonw+g5B8CUcfLpXecYpD9eIpJKbLe39YcPPFj97wemoXzNiTGa
         1C1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784397914; x=1785002714;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lj0KthQFjmiFZbaHRNHX9gCpXpklkdkuBiE4u7UUrik=;
        b=eTNybfRWiTDLMe1kOKh9vH6OpWxDBNpU14E7JhPMbH11OUhI2KG7upjFDmFV1COB+3
         zUu72kNeg70rNvmnX8nOSFzJB1x1Qasci/fhcRqwRLoktGVlLkSO/JPxYef7SB4gTqwv
         m49N220pZkXonMg9npyHAKjcGNQJNvStigsm0e8h0qZ112cGUpsp8+e4cUrJvjUEEz1X
         ROavCXUFA3kiQ9w634/ayDh38fXA9KLWeKwS8IyNTN749JGB+Xy4lfk/0NnA2r4UYDTn
         jd/ZgpQZ7VY/zI3P1lZcPAtVcKoPHdKDjL4UApHWyp64kWE31etuOIfvHeZtRm9JXicA
         0zKQ==
X-Gm-Message-State: AOJu0YzXsP9PCRLVctoTqxszReb/TXJZ5fOk1EGbLLSlC3rDnqa1C3B4
	poXGgbAamy0yFri0rIxl8Zo9YYZQs/MMXXTW4VH6yO0S9TG1TMy+F4meG5Aw0EnGVZIysaotjx5
	EDjl5RrOcMX7hK7fm2P+qu3wArjotk5SsOUOdxbfmVJqqBCRqi0nzNShWeBYkaBSYIFjHBtSLZH
	0TvxPMlcC9
X-Gm-Gg: AfdE7cnojNpVvVv7o7WgB75Da3rHGZatGeNMs9/pMRR9998JCNdOzdF6/MvzqdF8lvZ
	e9Tp/YhKkmy8NMtB0AY87a3aBZMPCvEI3RL61fHIA0CBrhAUrq3yG2+zxdHjIMXxzhTllBoR+Zf
	iNerYRKViwgBNLpZ/26IhlHW5eAdi3H5wpxoB+hBPDpJZErGYbHdoq2UEca0NilKIcNjEfZON/x
	oqxglElKIRN54KpD9Ab+evbHeH1fTZnj3+sORPdjidySLJBbm7fk57xcnvzpGMHdwrgRhzAW+nU
	P/VMiqIJQob+N/o9BemxlRAykHMtc49y5aHbgh7+MetXU+gM5SiRnTdMzkceVFgwI5oBmDxw3bI
	Ffv8Znw==
X-Received: by 2002:a17:90b:1c8e:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-38e4b410b8bmr8278185a91.14.1784397913590;
        Sat, 18 Jul 2026 11:05:13 -0700 (PDT)
X-Received: by 2002:a17:90b:1c8e:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-38e4b410b8bmr8278140a91.14.1784397912961;
        Sat, 18 Jul 2026 11:05:12 -0700 (PDT)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de21asm19412321eec.23.2026.07.18.11.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 11:05:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 02:05:07 +0800
Message-Id: <DK1W9M41UF2X.36VEVZJUD1M17@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <Frank.Li@kernel.org>,
        <imx@lists.linux.dev>
Subject: Re: [PATCH v2 4/8] drm/pl111: replace struct
 drm_simple_display_pipe with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com> <20260716-drm-simple-kms-removal-v2-4-1133a8fc3785@oss.qualcomm.com> <20260716092621.D8C091F00A3A@smtp.kernel.org>
In-Reply-To: <20260716092621.D8C091F00A3A@smtp.kernel.org>
X-Proofpoint-GUID: miVQkBywzD-rtbrUB3P4FEdgNNXFYOjG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE4OSBTYWx0ZWRfX8v81B0ehb+ob
 b3OpY/2P0XQTrzzKE6Hr0lD07Ctoe27AjkveX3KZLgWoF0ThvTQjS73AA4eZrJ2pFTuxL/hFq2y
 iNOe0GOnQfgozAEjB069doh6nAn49oY=
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=6a5bc05a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=QurC80Wvr54F7t3_XBwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: miVQkBywzD-rtbrUB3P4FEdgNNXFYOjG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE4OSBTYWx0ZWRfX1HTBgdRgSE6U
 NnVaDZLuePN2hMXR4KxPevC6/qmp/5JtG9g+TfoKCDTSeSb3pMrLpoDTHOgRW12LaluHtYyfDBj
 cxD0FAG6h28yu/+HRjmc3pGihUWT/HqkNsNU7tbBvIgM8YC8S5s+/y7/BpYPsGkOLr80p3n++Vn
 XvT/nyc/6TT3K5/XRFw2AAD+dJWk5uMgbk703dC0cq55QPqCYfaey2YbWjowDexUIR3MpOp48l1
 S9LNL9yVExsNdw8S+PwnjSIj2pDahWQeHkuHNJl+nfu0q32OvKbnW95/42PTcl/FJ3q/QWup0z9
 sqXrRlwqJKr0d9xGO6sjet4dl6RJGF6VDSW2AASIa1X0CKp9QzXZvNgltJ5F0xSR34DJkdcNwdn
 71pXlywh/2g9esT9+s6iyW2zdWwP5GCBDu4FJVHL9HLuHkrjGjuKI8tgwmZhDS+llquFGeJpjDO
 T1O950cP2ceM0hwbngQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180189

On Thu Jul 16, 2026 at 5:26 PM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Pending vblank events are leaked during CRTC disable. The DRM su=
bsystem requires that pending vblank events requested by userspace (e.g., d=
uring a pageflip) are consumed and sent when the CRTC is disabled. In this =
patch, event consumption is implemented in `pl111_crtc_helper_atomic_flush(=
)`. However, the DRM core (`drm_atomic_helper_commit_planes`) only calls `a=
tomic_flush` for active CRTCs. When a CRTC is being disabled, `atomic_flush=
` is skipped, and the event must be consumed in the `atomic_disable` hook. =
`pl111_crtc_helper_atomic_disable()` fails to check for or consume `cstate-=
>event`. As a result, the event is leaked.
> - [High] Unsafe access to global plane state in `pl111_crtc_helper_atomic=
_enable()`. The function retrieves the framebuffer using `priv->plane.state=
->fb` directly instead of using the committed atomic state via `drm_atomic_=
get_new_plane_state()`. In the DRM core, non-blocking atomic commits synchr=
onously swap the global state pointers before the asynchronous commit worke=
rs run. This creates a Time-of-Check to Time-of-Use (TOCTOU) vulnerability.
> - [High] Sleeping functions are called from atomic context. The DRM subsy=
stem guide explicitly defines CRTC `atomic_enable` and `atomic_disable` cal=
lbacks as executing in an atomic context during non-blocking commits, where=
 sleeping is strictly forbidden. However, `pl111_crtc_helper_atomic_enable(=
)` and `pl111_crtc_helper_atomic_disable()` call blocking functions: `clk_p=
repare_enable()`, `clk_disable_unprepare()`, and `msleep(20)`.
> --
>
> --- Patch [4]: [PATCH v2 4/8] drm/pl111: replace struct drm_simple_displa=
y_pipe with regular atomic helpers ---
> commit 07a755e3243c0f70ec87dc33910c7d68aa70590c
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/pl111: replace struct drm_simple_display_pipe with regular atomic hel=
pers
>    =20
> Replace PL111 simple display pipe with explicit plane, CRTC and encoder
> objects. Keep the existing PL111 timing, format and pitch validation, but
> move it into the explicit atomic check paths. Move event handling to the =
CRTC
> commit path.
>
>> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl1=
11/pl111_display.c
>> index 5d10bc5fdf1f6..beb6423d4d439 100644
>> --- a/drivers/gpu/drm/pl111/pl111_display.c
>> +++ b/drivers/gpu/drm/pl111/pl111_display.c
>
> [ ... ]
>
>> @@ -117,16 +137,14 @@ static int pl111_display_check(struct drm_simple_d=
isplay_pipe *pipe,
>> -static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
>> -				 struct drm_crtc_state *cstate,
>> -				 struct drm_plane_state *plane_state)
>> +static void pl111_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					    struct drm_atomic_commit *commit)
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_plane *plane =3D &pipe->plane;
>>  	struct drm_device *drm =3D crtc->dev;
>>  	struct pl111_drm_dev_private *priv =3D drm->dev_private;
>> +	struct drm_crtc_state *cstate =3D drm_atomic_get_new_crtc_state(commit=
, crtc);
>>  	const struct drm_display_mode *mode =3D &cstate->mode;
>> -	struct drm_framebuffer *fb =3D plane->state->fb;
>> +	struct drm_framebuffer *fb =3D priv->plane.state->fb;
>
> [Severity: High]
> This is a pre-existing issue, but does this direct access to the global p=
lane
> state in pl111_crtc_helper_atomic_enable() introduce a time-of-check to
> time-of-use vulnerability?
>
> By retrieving the framebuffer using priv->plane.state->fb directly instea=
d
> of fetching the committed atomic state via drm_atomic_get_new_plane_state=
(),
> this might race with subsequent commits. If userspace submits a non-block=
ing
> commit to enable the CRTC, followed immediately by another commit that
> disables the primary plane (setting fb to NULL), the global state pointer
> updates to the second commit. When the first commit's asynchronous worker
> executes this function, it could read the new global state where fb is NU=
LL,
> causing a null pointer dereference when accessing fb->format->format.
>

As replied in patch 5, I'll switch to drm_atomic_get_new_plane_state()

>>  	struct drm_connector *connector =3D priv->connector;
>>  	struct drm_bridge *bridge =3D priv->bridge;
>>  	bool grayscale =3D false;
>>  	u32 cntl;
>>  	u32 ppl, hsw, hfp, hbp;
>>  	u32 lpp, vsw, vfp, vbp;
>>  	u32 cpl, tim2;
>>  	int ret;
>> =20
>>  	ret =3D clk_set_rate(priv->clk, mode->clock * 1000);
>>  	if (ret) {
>>  		drm_err(drm,
>>  			"Failed to set pixel clock rate to %d: %d\n",
>>  			mode->clock * 1000, ret);
>>  	}
>> =20
>>  	clk_prepare_enable(priv->clk);
>
> [Severity: High]
> This is a pre-existing issue, but are blocking functions being called fro=
m an
> atomic context here?
>
> The DRM subsystem explicitly defines CRTC atomic_enable and atomic_disabl=
e
> callbacks as executing in an atomic context during non-blocking commits,
> where sleeping is strictly forbidden. However,=20
> pl111_crtc_helper_atomic_enable() calls blocking functions such as=20
> clk_prepare_enable() and msleep(). This might lead to system instability,=
=20
> kernel warnings, or deadlocks.

I think it's a false positive.

>
> [ ... ]
>
>>  	/* The PL110 in Integrator/Versatile does the BGR routing externally *=
/
>>  	if (priv->variant->external_bgr)
>>  		cntl &=3D ~CNTL_BGR;
>> =20
>>  	/* Power sequence: first enable and chill */
>>  	writel(cntl, priv->regs + priv->ctrl);
>> =20
>>  	/*
>>  	 * We expect this delay to stabilize the contrast
>>  	 * voltage Vee as stipulated by the manual
>>  	 */
>>  	msleep(20);
>
> [Severity: High]
> This is a pre-existing issue, but similar to the clk_prepare_enable() cal=
l,
> does calling msleep() in pl111_crtc_helper_atomic_enable() violate the DR=
M
> subsystem guidelines for atomic context execution?
>
> Sleeping from this path could cause warnings or deadlocks during non-bloc=
king
> commits.
>

ditto

> [ ... ]
>
>> @@ -355,9 +373,9 @@ static void pl111_display_enable(struct drm_simple_d=
isplay_pipe *pipe,
>>  		drm_crtc_vblank_on(crtc);
>>  }
>> =20
>> -static void pl111_display_disable(struct drm_simple_display_pipe *pipe)
>> +static void pl111_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +					     struct drm_atomic_commit *commit)
>>  {
>
> [Severity: High]
> This is a pre-existing issue, but does pl111_crtc_helper_atomic_disable()=
 leak
> pending vblank events during CRTC disable?
>
> The DRM subsystem requires that pending vblank events requested by usersp=
ace
> (like during a pageflip) are consumed and sent when the CRTC is disabled.=
 In
> this code, event consumption happens in pl111_crtc_helper_atomic_flush().
> However, the DRM core skips atomic_flush() for disabled CRTCs, meaning th=
e
> event must be consumed in the atomic_disable hook.
>
> Since pl111_crtc_helper_atomic_disable() fails to check for or consume
> cstate->event, the event might be leaked. This could trigger a kernel war=
ning
> in drm_atomic_helper_commit_hw_done() and cause the userspace compositor =
to
> hang indefinitely.
>

I don't think this is an issue here.

In drm_atomic_helper_commit_planes(), atomic_flush() is invoked after
atomic_disable(), and it is only skipped for inactive CRTCs when
active_only is set [1]:

    if (active_only && !new_crtc_state->active)
        continue;

    funcs->atomic_flush(crtc, state);

However, in the default helper path active_only is not set [2], so
atomic_flush() should still be called in this case. Because of that, I
don't think an extra event handling path in atomic_disable() is
required here.

[1] https://elixir.bootlin.com/linux/v7.1.3/source/drivers/gpu/drm/drm_atom=
ic_helper.c#L3055
[2] https://elixir.bootlin.com/linux/v7.1.3/source/drivers/gpu/drm/drm_atom=
ic_helper.c#L2968

>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>>  	struct drm_device *drm =3D crtc->dev;
>>  	struct pl111_drm_dev_private *priv =3D drm->dev_private;
>>  	u32 cntl;
>
> [ ... ]
>
>>  	/* Power Down */
>>  	cntl =3D readl(priv->regs + priv->ctrl);
>>  	if (cntl & CNTL_LCDPWR) {
>>  		cntl &=3D ~CNTL_LCDPWR;
>>  		writel(cntl, priv->regs + priv->ctrl);
>>  	}
>> =20
>>  	/*
>>  	 * We expect this delay to stabilize the contrast voltage Vee as
>>  	 * stipulated by the manual
>>  	 */
>>  	msleep(20);
>> =20
>>  	if (priv->variant_display_disable)
>>  		priv->variant_display_disable(drm);
>> =20
>>  	/* Disable */
>>  	writel(0, priv->regs + priv->ctrl);
>> =20
>>  	clk_disable_unprepare(priv->clk);
>>  }
>
> [Severity: High]
> This is a pre-existing issue, but does calling msleep() and
> clk_disable_unprepare() in pl111_crtc_helper_atomic_disable() block execu=
tion
> in an atomic context?
>
> Since this callback runs in an atomic context during non-blocking commits=
,
> these blocking calls might lead to system instability or deadlocks.

I think this is a false positive.
