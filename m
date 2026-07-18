Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B8B35E92F
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 19:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784401991; cv=none; b=bNqxTtC7wbwu2q5tS+PrZUxPN8mG1ckeG4exI0w377lTO9Xq0bhC3tHH0CM1PnrqCTHLMo21llywsoa/19Oy+HK/0/vsj80FA1O0L3NltmGTXbx55Gq3l+QkWi80bX96IGWWbh8n4/CgosRdSglIO518AAxfLt8+RN6RqaBHZiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784401991; c=relaxed/simple;
	bh=5iJjm+Cwqc2e2XmTZvFfoaLpR18809rdT/qceEtiENU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=mzgsayYmfFbGoVSCqOSWVaN/EMuBEjbbVPKAPbssqTWTmJazguBQNuXVunfpmgq2ZkRPgvxus758vA0BhcACMsnaddRSlNN8z9BdilaKzucHsipq+N4dTUtIZ7Pt2+skXyRTjn1HY+UL9Fxvl7yq9zQ5sOaNKMKfirY+ngwhpD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=owp3YvJ3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tr5Rc8CC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="owp3YvJ3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tr5Rc8CC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IGP4J0932048
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 19:13:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	css553ETwH3ipHar7HV+Vwy4upNKK/INFB2fJhyJi/Q=; b=owp3YvJ3u7KHLBln
	9PzWLL7aNJ8479neSeSX1m+sgSWp0e+ICvG2XPGs2u0rJiLGZb32VvuR4sPJYMh1
	ZGzGLROi5mULK+b9sKS1Vr1NgrDUWfuyr3iSIcFz3NPf1K84y/0akNqXURr5ZvuW
	B5SkY8oRJ/lm7KU8/DFhSJvaMHPhKB7Kc6+g0WE3ARG6lGLBfW2quOwH54IQ+IiA
	RlXpwC7jkLmBRjoEiHsZzHNPzdgo3OdBTSiPvQFWmdP8P4R66dTx6X8M7mDkjqYy
	SJSnkGnv4iW3hug+vtLE5nSBDZdwUES3XCeHQVMGASDQ9sB25/6tQdt2Aa2DRavz
	bPkV9A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7sbjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 19:13:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e70ae557cso160674a91.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 12:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784401985; x=1785006785; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=css553ETwH3ipHar7HV+Vwy4upNKK/INFB2fJhyJi/Q=;
        b=Tr5Rc8CCAP3QbVGnDzvAgpJ1nHCOp9kB3gXYWHKFMq+gu3rGuMCOxB6TwzRtTCeCRc
         fZcqZtY7mEaQxDfaqqhCX89WrDlkAgJsHRsXrec1GQpV6Nrhwu4AgpkIsT7zYqSuPtSs
         Z0F0uYvCqf/1DSyPo41RDpQoQh+umAT1YseeC5hjDVsZ1gRcvaZHCaMxtCaK4eoB527X
         pJumSD/5UgLnNkKRSshwJQDxLY9huTKxUYsIxw8rJgCB3MW4fVEX+S5SAON04iMyKIKr
         XkIDyM+J3Orc7iBTWAdZmBvvTTIWxKfWGMsZyjA6lCbKJ7BR2iSPWt4776oL4Iv94LTR
         ctEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784401985; x=1785006785;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=css553ETwH3ipHar7HV+Vwy4upNKK/INFB2fJhyJi/Q=;
        b=o5EqTRozO27q4lcWrBuvW1q29t10RpONIOBQtZVIV/X0/sZe2UUViycajNMsmjVhL+
         F/tqyZHrCPwnSzaKjt+uniD7hjHvphKF4XcdEC6KnSe7Hyt6I6i/sHZw9TGwxI/lIPjh
         qnqnev/t1o/G1ekTLyWgafLUrczxyWZITGslyf6WjDBM6n9PqqMY2elfxpHTWcMzEIMY
         19KGuigLRU6+N9l15seEv3jU/hwSM0Tpvms/ansqVBR43uzJjLfIRXUQF1Z7qE3/I4i+
         QcgItPxn00vLWNDSqrjckp6yRJ+4LIjsGuI7Tj5iRH5DIkSXmAe8kKCTRsnPczZeVZmW
         4Jbw==
X-Gm-Message-State: AOJu0YwAHNAhWKZ0An19MC3+TLLkBuU4f8HWw7TA03kd84X694ynx0iu
	dfmBbQzTr8gA8aMx5ziALhZz3ZzuxB8YP3nB+3jJeF+g+SNsvzyG9IKEBhdaZxWPMCftiMTzh5B
	t23fK86kjkaWU9k8IhAlFcj78gVNKJHq2Cs47oyQNdEI42O8RcQVP3pGDLUTunDHOfP67ZsY719
	l0541+oQJq
X-Gm-Gg: AfdE7cmEATicJxoZD7m0v6ngBLxeSwJaApG2aQ0utnUnW4IAvYk2cZXSTrvxHdkVRec
	tF/US9LL5jwyjbDe3HSywQS01OZiADQXy1l/ICsOuLygho8JfDROEggZY/Umz5+JcHO1QO53+xv
	yYYbowSRqqR0+hczg40FLxzM4xrrragPyCN3VAMzU8EU1MUQ29fNvHNla6xeL2z7QVju9Bl2tFz
	mgKSg6YKF5W/T8L9WE0JpBJVDIhdkTdVEVcUnLCwOVhyQFSBAYS/9M754RHp+pgXGY9zsw7whht
	fJsvfGusY8jKBAxcGwEgga9KxmSu/NFKdFVJOByKpGgEQ1LTyLr1BzxWu68L+Bw2N/hP1iwVwp2
	Qqxbjag==
X-Received: by 2002:a17:90b:2244:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-38e4b43cb05mr8052629a91.18.1784401984525;
        Sat, 18 Jul 2026 12:13:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2244:b0:381:bc4c:da5b with SMTP id 98e67ed59e1d1-38e4b43cb05mr8052596a91.18.1784401983929;
        Sat, 18 Jul 2026 12:13:03 -0700 (PDT)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2900a37sm16169441c88.0.2026.07.18.12.13.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 12:13:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 03:12:58 +0800
Message-Id: <DK1XPK73QJHC.JWFUMTTLOD1D@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <Frank.Li@kernel.org>,
        <imx@lists.linux.dev>
Subject: Re: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe with
 regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com> <20260716091459.1D8101F000E9@smtp.kernel.org>
In-Reply-To: <20260716091459.1D8101F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDIwMiBTYWx0ZWRfXwGvHSLRQkWSt
 15/3Fx6EyNIgr0TMN4DA816Iyo1mteuyLY77UV93Ough/F6cCwL6whV0Fbg9axpQGSzrc2qowFQ
 MN24lWQBMpaTPqJmZpwmiYWMNRE6dUCoGIds+HcY5TIZGxjARPfi2qP2NzgrOmLZtg8d5z4AwrB
 cN5Pr7u247Webuii87UAYX8zJD0XCy7zJhoy1G5usS1tjs1N9QXhAm1YMOBbO1B1TbLD4i2bgfd
 YepbF1k4Otdtdk5ZCbbDMYtSguUci+7C8rxDf2iG402sgm/mpEkl8+FfBUySkyNtxuDE0EuRx4d
 nvBgBjhNc2c/+8RI16OyOB1cKtbwJTSkBNw7WsISxZ30yfKfloNwssb3+nJUqndlrjRpW+q+d2P
 mLiRQE8ROzcTwmMQnq2AfpI3Ac1qOt6v7U8ytLelSNQ4GaZ6zSyJcIsRwyB8ULwg+hI02dk62o8
 M5/8RdDaDydSs3zw5Tg==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5bd041 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=P-IC7800AAAA:8 a=U8GEcZiWL5moPHtnF8wA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: adUmIDcG_giNpN-l6FRRz1kqbnxkvWH4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDIwMiBTYWx0ZWRfXzMBPJ4F6CxX3
 sjqXYKB5k+54qz0trRxfgogHBTjr2wQlV4BHYs94+7VkBGyujRO/Lw5/+VcO7ur899GGbRHBSCI
 AMA6ldfZXicIMVbCv4w0McaAZP+PPY0=
X-Proofpoint-GUID: adUmIDcG_giNpN-l6FRRz1kqbnxkvWH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180202

On Thu Jul 16, 2026 at 5:14 PM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Missing framebuffer validation in atomic paths leads to an uncon=
ditional NULL pointer dereference when a plane is configured without a fram=
ebuffer.
> - [High] `imx_lcdc_plane_helper_atomic_check` fetches a potentially NULL =
CRTC state, causing a kernel panic in core helpers.
> - [High] Redundant clock enable calls cause a persistent reference count =
leak for `clk_per` on every display modeset.
>
> Pre-existing issues:
> - [Critical] The driver accesses peripheral MMIO registers and leaves int=
errupts unmasked while the AHB and IPG bus clocks are disabled.
> - [High] The CRTC atomic check unconditionally overwrites the `mode_chang=
ed` flag, potentially discarding modeset requests initiated by the DRM core=
.
> - [High] VBLANK completion events are signaled prematurely during display=
 disable/modeset sequences.
> --
>
> --- Patch [1]: [PATCH v2] drm/imx: replace struct drm_simple_display_pipe=
 with regular atomic helpers ---
> commit 78bda5593353310f7405860b2b4d7ea3060e0afa
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
> Subject: drm/imx: replace struct drm_simple_display_pipe with regular ato=
mic helpers
>
> This commit converts the i.MX LCDC driver to explicit primary plane, CRTC=
,=20
> and encoder objects, removing the dependency on the simple-KMS framework.=
=20
> It preserves most of the previous callbacks by rewiring them into the=20
> standard atomic helper paths.
>
> Link: https://patch.msgid.link/20260705-drm-simple-kms-removal-v1-0-b4e1c=
a053623@oss.qualcomm.com
>
>> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/l=
cdc/imx-lcdc.c
>> index c67fe80b8115e..5c858fc81a78c 100644
>> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>
> [ ... ]
>
>> -static void imx_lcdc_pipe_enable(struct drm_simple_display_pipe *pipe,
>> -				 struct drm_crtc_state *crtc_state,
>> -				 struct drm_plane_state *plane_state)
>> +static void imx_lcdc_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					       struct drm_atomic_commit *commit)
>>  {
>>  	int ret;
>>  	int clk_div;
>>  	int bpp;
>> -	struct imx_lcdc *lcdc =3D imx_lcdc_from_drmdev(pipe->crtc.dev);
>> -	struct drm_display_mode *mode =3D &pipe->crtc.mode;
>> +	struct imx_lcdc *lcdc =3D imx_lcdc_from_drmdev(crtc->dev);
>> +	struct drm_crtc_state *cstate =3D drm_atomic_get_new_crtc_state(commit=
, crtc);
>> +	struct drm_plane_state *plane_state =3D lcdc->plane.state;
>
> [Severity: High]
> Does this code result in a NULL pointer dereference when a primary plane =
is
> configured without a framebuffer?
>
> If userspace submits an atomic commit that enables the CRTC but sets the
> primary plane's FB_ID to 0, plane_state->fb will be NULL.
>

Will access plane_state with drm_atomic_get_new_plane_state()

>
> Since drm_atomic_helper_check_crtc_primary_plane only verifies that the
> primary plane is present in the plane mask, it does not prevent a NULL
> framebuffer. This causes an unconditional dereference shortly after this =
line
> when extracting the format via imx_lcdc_get_format(), as well as inside=
=20
> imx_lcdc_update_hw_registers() when calling drm_fb_dma_get_gem_addr().
>
>> +	struct drm_display_mode *mode =3D &cstate->mode;
>>  	struct drm_display_info *disp_info =3D &lcdc->connector->display_info;
>>  	const int hsync_pol =3D (mode->flags & DRM_MODE_FLAG_PHSYNC) ? 0 : 1;
>>  	const int vsync_pol =3D (mode->flags & DRM_MODE_FLAG_PVSYNC) ? 0 : 1;
>
> [ ... ]
>
>> @@ -230,40 +232,46 @@ static void imx_lcdc_pipe_enable(struct drm_simple=
_display_pipe *pipe,
>> =20
>>  	ret =3D clk_prepare_enable(lcdc->clk_ipg);
>>  	if (ret) {
>> -		dev_err(pipe->crtc.dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PT=
R(ret));
>> +		dev_err(crtc->dev->dev, "Cannot enable ipg clock: %pe\n", ERR_PTR(ret=
));
>>  		return;
>>  	}
>
> [Severity: Critical]
> This is a pre-existing issue, but does this perform memory-mapped writes =
to
> peripheral registers before the IPG and AHB bus clocks are enabled?
>
> Just prior to enabling the IPG clock here, the driver performs multiple
> writel() configuration writes to the LPCR and LCPR registers. Accessing
> registers of an unclocked IP block on i.MX platforms can hang the bus and
> trigger a synchronous external abort. Could we ensure the clocks are
> prepared and enabled before doing configuration writes?
>
>>  	ret =3D clk_prepare_enable(lcdc->clk_ahb);
>>  	if (ret) {
>> -		dev_err(pipe->crtc.dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PT=
R(ret));
>> +		dev_err(crtc->dev->dev, "Cannot enable ahb clock: %pe\n", ERR_PTR(ret=
));
>> =20
>>  		clk_disable_unprepare(lcdc->clk_ipg);
>> =20
>>  		return;
>>  	}
>> =20
>> -	imx_lcdc_update_hw_registers(pipe, NULL, true);
>> +	imx_lcdc_update_hw_registers(crtc, NULL, true);
>> =20
>>  	/* Enable VBLANK Interrupt */
>>  	writel(INTR_EOF, lcdc->base + IMX21LCDC_LIER);
>> +
>> +	drm_crtc_vblank_on(crtc);
>>  }
>> =20
>> -static void imx_lcdc_pipe_disable(struct drm_simple_display_pipe *pipe)
>> +static void imx_lcdc_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +						struct drm_atomic_commit *commit)
>>  {
>> -	struct imx_lcdc *lcdc =3D imx_lcdc_from_drmdev(pipe->crtc.dev);
>> -	struct drm_crtc *crtc =3D &lcdc->pipe.crtc;
>> +	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_stat=
e(commit, crtc);
>> +	struct drm_crtc_state *new_crtc_state =3D drm_atomic_get_new_crtc_stat=
e(commit, crtc);
>> +	struct imx_lcdc *lcdc =3D imx_lcdc_from_drmdev(crtc->dev);
>>  	struct drm_pending_vblank_event *event;
>> =20
>> +	drm_crtc_vblank_off(crtc);
>> +
>>  	clk_disable_unprepare(lcdc->clk_ahb);
>>  	clk_disable_unprepare(lcdc->clk_ipg);
>> =20
>> -	if (pipe->crtc.enabled)
>> +	if (old_crtc_state->enable)
>>  		clk_disable_unprepare(lcdc->clk_per);
>> =20
>>  	spin_lock_irq(&lcdc->drm.event_lock);
>> -	event =3D crtc->state->event;
>> +	event =3D new_crtc_state->event;
>>  	if (event) {
>> -		crtc->state->event =3D NULL;
>> +		new_crtc_state->event =3D NULL;
>>  		drm_crtc_send_vblank_event(crtc, event);
>>  	}
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does consuming the event
> during the disable phase signal completion to userspace prematurely?
>
> Sending the event here signals to the compositor that the modeset is comp=
lete
> before the new mode is programmed and flushed, which could lead to frame
> submission races or compositor stalls.
>
>>  	spin_unlock_irq(&lcdc->drm.event_lock);
>> @@ -272,17 +280,20 @@ static void imx_lcdc_pipe_disable(struct drm_simpl=
e_display_pipe *pipe)
>>  	writel(0, lcdc->base + IMX21LCDC_LIER);
>
> [Severity: Critical]
> This is a pre-existing issue, but are the bus clocks disabled before clea=
ring
> the VBLANK interrupt?
>
> Similar to the enable path, writing to the LIER register while the IPG an=
d
> AHB clocks are disabled can trigger a bus fault. Furthermore, since the
> interrupt is unmasked before the clocks are disabled, an incoming IRQ cou=
ld
> cause the handler to read the LISR register while clocks are off.
>
>>  }
>> =20
>> -static int imx_lcdc_pipe_check(struct drm_simple_display_pipe *pipe,
>> -			       struct drm_plane_state *plane_state,
>> -			       struct drm_crtc_state *crtc_state)
>> +static int imx_lcdc_crtc_helper_atomic_check(struct drm_crtc *crtc,
>> +					     struct drm_atomic_commit *commit)
>>  {
>> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(co=
mmit, crtc);
>> +	struct drm_crtc_state *old_crtc_state =3D drm_atomic_get_old_crtc_stat=
e(commit, crtc);
>>  	const struct drm_display_mode *mode =3D &crtc_state->mode;
>> -	const struct drm_display_mode *old_mode =3D &pipe->crtc.state->mode;
>> +	const struct drm_display_mode *old_mode =3D &old_crtc_state->mode;
>> +	int ret;
>> =20
>> -	if (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES |=
|
>> -	    mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES |=
|
>> -	    mode->hdisplay % 0x10) { /* must be multiple of 16 */
>> -		drm_err(pipe->crtc.dev, "unsupported display mode (%u x %u)\n",
>> +	if (crtc_state->enable &&
>> +	    (mode->hdisplay < LCDC_MIN_XRES || mode->hdisplay > LCDC_MAX_XRES =
||
>> +	     mode->vdisplay < LCDC_MIN_YRES || mode->vdisplay > LCDC_MAX_YRES =
||
>> +	     mode->hdisplay % 0x10)) { /* must be multiple of 16 */
>> +		drm_err(crtc->dev, "unsupported display mode (%u x %u)\n",
>>  			mode->hdisplay, mode->vdisplay);
>>  		return -EINVAL;
>>  	}
>> @@ -291,46 +302,116 @@ static int imx_lcdc_pipe_check(struct drm_simple_=
display_pipe *pipe,
>>  		old_mode->hdisplay !=3D mode->hdisplay ||
>>  		old_mode->vdisplay !=3D mode->vdisplay;
>
> [Severity: High]
> This is a pre-existing issue, but does this direct assignment to
> mode_changed discard modeset requests initiated by the DRM core?
>
> The core drm_atomic_helper_check_modeset() function may have already set
> mode_changed to true due to connector routing changes or userspace forcin=
g a
> modeset. Using a direct assignment instead of a bitwise OR (|=3D) silentl=
y
> clears that flag if the spatial dimensions haven't changed.
>
>> -	return 0;
>> +	if (crtc_state->enable) {
>> +		ret =3D drm_atomic_helper_check_crtc_primary_plane(crtc_state);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return drm_atomic_add_affected_planes(commit, crtc);
>>  }
>> =20
>> -static void imx_lcdc_pipe_update(struct drm_simple_display_pipe *pipe,
>> -				 struct drm_plane_state *old_state)
>> +static void imx_lcdc_plane_helper_atomic_update(struct drm_plane *plane=
,
>> +						struct drm_atomic_commit *commit)
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_pending_vblank_event *event =3D crtc->state->event;
>> -	struct drm_plane_state *new_state =3D pipe->plane.state;
>> +	struct drm_plane_state *old_state =3D drm_atomic_get_old_plane_state(c=
ommit, plane);
>> +	struct drm_plane_state *new_state =3D drm_atomic_get_new_plane_state(c=
ommit, plane);
>> +	struct drm_crtc *crtc =3D new_state->crtc ?: old_state->crtc;
>>  	struct drm_framebuffer *fb =3D new_state->fb;
>>  	struct drm_framebuffer *old_fb =3D old_state->fb;
>>  	struct drm_crtc *old_crtc =3D old_state->crtc;
>>  	bool mode_changed =3D false;
>> =20
>> +	if (!fb)
>> +		return;
>> +
>>  	if (old_fb && old_fb->format !=3D fb->format)
>>  		mode_changed =3D true;
>>  	else if (old_crtc !=3D crtc)
>>  		mode_changed =3D true;
>> =20
>> -	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
>> +	imx_lcdc_update_hw_registers(crtc, old_state, mode_changed);
>> +}
>
> [Severity: High]
> Does calling imx_lcdc_update_hw_registers() here cause a persistent refer=
ence
> count leak for clk_per?
>
> During a modeset, imx_lcdc_crtc_helper_atomic_enable() already calls
> imx_lcdc_update_hw_registers() which increments the clock reference count
> when the CRTC is enabled.
>
> When the plane helper subsequently calls it again here, the clock prepare
> enable block is hit a second time. However, during display disable, the
> plane update returns early due to a NULL fb, meaning the clock is only
> disabled once in the CRTC disable path.
>
>> =20
>> -	if (event) {
>> -		crtc->state->event =3D NULL;
>> +static int imx_lcdc_plane_helper_atomic_check(struct drm_plane *plane,
>> +					      struct drm_atomic_commit *commit)
>> +{
>> +	struct drm_plane_state *plane_state =3D drm_atomic_get_new_plane_state=
(commit, plane);
>> +	struct drm_crtc *crtc =3D plane_state->crtc;
>> +	struct drm_crtc_state *crtc_state =3D NULL;
>> =20
>> -		spin_lock_irq(&crtc->dev->event_lock);
>> +	if (crtc)
>> +		crtc_state =3D drm_atomic_get_new_crtc_state(commit, crtc);
>> =20
>> -		if (crtc->state->active && drm_crtc_vblank_get(crtc) =3D=3D 0)
>> -			drm_crtc_arm_vblank_event(crtc, event);
>> -		else
>> -			drm_crtc_send_vblank_event(crtc, event);
>> +	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
>
> [Severity: High]
> Can fetching the CRTC state this way cause a kernel panic in the core ato=
mic
> helpers?
>
> If userspace submits a commit that modifies only plane properties without
> affecting the CRTC, the CRTC is not implicitly added to the atomic commit
> state.
>
> In this scenario, drm_atomic_get_new_crtc_state() returns NULL. Passing t=
his
> NULL pointer directly to drm_atomic_helper_check_plane_state() causes a c=
rash
> when it dereferences crtc_state->enable.
>
> Could this use drm_atomic_get_crtc_state() instead to ensure the state is
> brought into the commit if it is missing?

I think it is fine here; I'll just copy the pattern from [1].

[1] https://elixir.bootlin.com/linux/v7.1.2/source/drivers/gpu/drm/mgag200/=
mgag200_mode.c#L487
