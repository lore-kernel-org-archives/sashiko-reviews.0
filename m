Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9E33630BC
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 01:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785116302; cv=none; b=LRNLxpYtPYlvW8sRlYBt8xt28QirxJmi8RTjkdiz4um8BNFzMLMbTFR8aqjvVtCF995ZhF38NnWFYdfbZvvEm9uPbV0OOVh9TtATV//W6L7C/uUUgI1DaHMFaQr/SBPrdBwxiOfpt5wOIpUjp8iM4L3rCHksP+Y0M18k+ojeXAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785116302; c=relaxed/simple;
	bh=iGcAcujLAYiFRoTLLExD5c/GTX3QNk1LHPMICUEEsEE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HH5/FTKoCBAXzsX0DMDJwqARTYdAQQgB6jev+zsiuKh+O1yKJ4Zk3axPMU9XsAVsfp9o9b3cylvwKRIb1k1vYi7eMEyV06ehgnphcr51j9Cuw8tJ0SFaRgDWTU7wlZqJbElJRR2irG5W3aC51ghSClwauxd/aPrqlvKEgMqry4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 09:38:09 +0800
Message-Id: <DK8YWU9RLR0N.1S7LX5ZTBJAVP@oss.qualcomm.com>
Cc: <imx@lists.linux.dev>, <Frank.Li@kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/2] drm/imx/lcdc: avoid duplicate clk_per enable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-1-de36e534f7a1@oss.qualcomm.com> <20260726195919.D70021F000E9@smtp.kernel.org>
In-Reply-To: <20260726195919.D70021F000E9@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon Jul 27, 2026 at 3:59 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Calls to sleeping functions (`clk_prepare_enable` and `clk_disab=
le_unprepare`) from the plane atomic update and CRTC enable/disable callbac=
ks, violating DRM atomic context requirements.
> --
>
> --- Patch [1]: [PATCH v3 1/2] drm/imx/lcdc: avoid duplicate clk_per enabl=
e ---
> commit 48c4f154b28e9de1d485ea56766c8a24df823739
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/imx/lcdc: avoid duplicate clk_per enable
>
> The simple-KMS helper calls the pipe update after enabling the CRTC,
> which causes imx_lcdc_update_hw_registers() to be called again. This
> patch avoids the duplicate clock enable by skipping the register update
> when the CRTC already needs a modeset.
>
>> diff --git a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c b/drivers/gpu/drm/imx/l=
cdc/imx-lcdc.c
>> index c67fe80b8115e..e00e52c1c46ec 100644
>> --- a/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> +++ b/drivers/gpu/drm/imx/lcdc/imx-lcdc.c
>> @@ -310,7 +310,8 @@ static void imx_lcdc_pipe_update(struct drm_simple_d=
isplay_pipe *pipe,
>>  	else if (old_crtc !=3D crtc)
>>  		mode_changed =3D true;
>> =20
>> -	imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
>> +	if (!drm_atomic_crtc_needs_modeset(crtc->state))
>> +		imx_lcdc_update_hw_registers(pipe, old_state, mode_changed);
>
> [Severity: High]
> This is a pre-existing issue, but does calling imx_lcdc_update_hw_registe=
rs()
> from imx_lcdc_pipe_update() risk sleeping in an atomic context?
>
> imx_lcdc_pipe_update() acts as a plane atomic update callback, which exec=
utes
> in an atomic context where sleeping is forbidden. However, it calls
> imx_lcdc_update_hw_registers(), which in turn calls sleeping functions:
>
> imx_lcdc_update_hw_registers() {
>     ...
>     clk_disable_unprepare(lcdc->clk_per);
>     ...
>     clk_prepare_enable(lcdc->clk_per);
>     ...
> }
>
> Will this cause 'scheduling while atomic' panics when a plane format chan=
ges
> without a full modeset?

False positive
