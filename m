Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179726;
	b=0ajsZWW0+vMxsxOEbXhyX8Sy1+QN6fs5LMBxBKcfBV/4YSAXK2Z0zeaa8PiNf3/hL4oH
	 bki2awe8VGdSmCsYh9dGXL91mjU0QPRIj9DT+I4uiTlPcnNYn3EB2Poyrb3xiabySsPFP
	 GVATz2+GQg9DlRFeb0ZiKxAXtqi20T+YoPgANYq2u/L2izTz+TnnsFzkJ40vBJv6rYrQD
	 i8z1UyMtNt29vPyYUb2J9ff9GRb+bh9RaPMpWakNUX/jJaUYE4K4umQvwoaMR8KkfuK8q
	 o7ICkONvfXwAsIyKh0mvPQOvHxSI4FzxCHm3ho9BIloA4YFjtPLSoSd+8jDbN35gpfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179726;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=IIRTDkX7+h/RwK3bxBmKmbtA5TspSsmHCX/HJK+b2oM=;
	b=IpJd0Nw4bi7hZ0/gN92tAqtAXY/ngLjbsuZ/xUB4iFOz0UhCj5+bPA48nD/TIOsGJ4PQ
	 prRphbrWi2MmXF5pjJFRXtAQ+XGi+qdXBodplgMQq/X/ZKOJjQ04uIcQR1LwTisMspnnj
	 u1Be2txTdNi6uWaUERxGZPiDKaQ9pTG30kakhiyjT6BZm0B3zZWqjcveAdh+08en+p8rK
	 J7ks5vsVd4uzzM4L0xfuouYyWykRsdo65VSBSSyPRxbPIe4Uaa6Xb1xALm3Jyj3grvue1
	 htniS/JqGhoSAKI7vzMm5BMfCYurvcZhQpuBPIXDA2ujBPaAcJvEdpA15RFLVkhGxig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BoR2VswV;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14A6F606A31A
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 09:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14A6F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BoR2VswV
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261028092842euoutp022379bdccab6106e1a0cc19ecf024229c~ip3Tu8mT50395803958euoutp02U
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 09:28:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261028092842euoutp022379bdccab6106e1a0cc19ecf024229c~ip3Tu8mT50395803958euoutp02U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793179722;
	bh=IIRTDkX7+h/RwK3bxBmKmbtA5TspSsmHCX/HJK+b2oM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=BoR2VswVYLFw6g4uLULuGOQwInKC1Wz4+kzlKZD0C/5mkScHaPPljBRlY2lf45NjL
	 feQfoQWedEBUPxz8w+uM9Y4hAes5if8IgVDMWSYf7yO5ka4AWerLSV256gYnSUNfDs
	 TMB3NL0OAfAilHTLL4OVWkOI5ZZf3aOgJVt4Cr1E=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261028092842eucas1p2dc55792e353ac1acf432f2059760c162~ip3Tj7_-M1592115921eucas1p2U;
	Wed, 28 Oct 2026 09:28:42 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261028092841eusmtip1edf4abe538f7d2aeecee72325b60ab70~ip3TR6mn70726307263eusmtip1Q;
	Wed, 28 Oct 2026 09:28:41 +0000 (GMT)
Message-ID: <2a42bea6-00ab-4d5e-ad8d-facfb51d7a2f@samsung.com>
Date: Wed, 28 Oct 2026 10:28:41 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
To: Henrik Grimler <henrik@grimler.se>
Cc: dri-devel@lists.freedesktop.org, sashiko-reviews@lists.linux.dev, Luca
	Ceresoli <luca.ceresoli@bootlin.com>, Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260723095127.B41251F00A3A@smtp.kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261028092842eucas1p2dc55792e353ac1acf432f2059760c162
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261028092842eucas1p2dc55792e353ac1acf432f2059760c162
X-EPHeader: CA
X-CMS-RootMailID: 20261028092842eucas1p2dc55792e353ac1acf432f2059760c162
References: <20260723-exynos4-sii9234-driver-v5-1-44b31b5597bd@grimler.se>
	<20260723095127.B41251F00A3A@smtp.kernel.org>
	<CGME20261028092842eucas1p2dc55792e353ac1acf432f2059760c162@eucas1p2.samsung.com>

Hi,

Handling this patch takes definitely too long, but maybe You will find a few minutes
for the v6 with those fixes:

On 23.07.2026 11:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Use-After-Free due to race between `flush_work()` and devres teardown.
> - [High] Missing initial state check breaks display on coldplug.
> - [Medium] Missing `return` statement after `dev_err_probe()` ignores initialization errors.
> --
>
> --- Patch [1]: [PATCH v5] drm/bridge: sii9234: use extcon cable detection logic to detect MHL ---
> commit 15547772b748ad5e9e79681b157e1cae684d850d
> Author: Henrik Grimler <henrik@grimler.se>
>
> drm/bridge: sii9234: use extcon cable detection logic to detect MHL
>
> To use MHL we currently need the MHL chip to be permanently on, which
> consumes unnecessary power. Let's use extcon attached to MUIC to enable
> the MHL chip only if it detects an MHL cable.
>
>> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
>> index be67642ab7d31..bf211906fefc6 100644
>> --- a/drivers/gpu/drm/bridge/sii9234.c
>> +++ b/drivers/gpu/drm/bridge/sii9234.c
> [ ... ]
>> @@ -864,6 +870,63 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>>  	return 0;
>>  }
>>  
>> +static void sii9234_extcon_work(struct work_struct *work)
>> +{
>> +	struct sii9234 *ctx = container_of(work, struct sii9234, extcon_wq);
>> +	int state = extcon_get_state(ctx->extcon, EXTCON_DISP_MHL);
>> +
>> +	if (state == ctx->cable_state)
>> +		return;
>> +
>> +	ctx->cable_state = state;
>> +
>> +	if (state > 0)
>> +		sii9234_cable_in(ctx);
>> +	else
>> +		sii9234_cable_out(ctx);
>> +}
> [ ... ]
>> +static int sii9234_extcon_init(struct sii9234 *ctx)
>> +{
> [ ... ]
>> +	ctx->extcon = edev;
>> +	ctx->extcon_nb.notifier_call = sii9234_extcon_notifier;
>> +	INIT_WORK(&ctx->extcon_wq, sii9234_extcon_work);
>> +	ret = devm_extcon_register_notifier(ctx->dev, edev, EXTCON_DISP_MHL, &ctx->extcon_nb);
>> +	if (ret)
>> +		dev_err_probe(ctx->dev, ret, "failed to register notifier for MHL\n");
>> +
>> +	return 0;
>> +}
> [Severity: Medium]
> Will this ignore initialization errors?
>
> If devm_extcon_register_notifier() fails (for example, returning -EPROBE_DEFER
> or -ENOMEM), the error is logged but ignored since there is no return statement
> after dev_err_probe(). The probe function completes successfully and assumes
> ctx->extcon is active.
This is the lack of return dev_err_probe(...) similar to the ones already reported
for the earlier versions.


> [ ... ]
>> @@ -919,12 +982,17 @@ static int sii9234_probe(struct i2c_client *client)
> [ ... ]
>>  	i2c_set_clientdata(client, ctx);
>>  
>>  	ctx->bridge.of_node = dev->of_node;
>>  	drm_bridge_add(&ctx->bridge);
>>  
>> -	sii9234_cable_in(ctx);
>> +	if (!ctx->extcon)
>> +		sii9234_cable_in(ctx);
>>  
>>  	return 0;
>>  }
> [Severity: High]
> Does this code skip setting the initial state if the cable is already plugged
> in during boot?
>
> Extcon notifiers trigger on state changes but do not automatically emit an
> event for the current state upon registration. In sii9234_probe(), if an
> extcon device is found, sii9234_cable_in() is skipped, but the driver never
> queries the initial state.
>
> If the cable is already connected when the driver probes, the hardware will
> never be powered on, and the display will remain non-functional until the user
> physically unplugs and replugs the cable.

This is indeed an important remark. Just call

schedule_work(&ctx->extcon_wq);

in the else branch for (!ctx->extcon) check at the end of probe function.

>> @@ -933,7 +1001,13 @@ static void sii9234_remove(struct i2c_client *client)
>>  {
>>  	struct sii9234 *ctx = i2c_get_clientdata(client);
>>  
>> -	sii9234_cable_out(ctx);
>> +	if (ctx->extcon) {
>> +		flush_work(&ctx->extcon_wq);
> [Severity: High]
> Does this code introduce a race condition with the devres teardown?
>
> Since the notifier is registered via devm_extcon_register_notifier(), it will
> only be unregistered after sii9234_remove() completes. If an extcon state
> change occurs right after flush_work(&ctx->extcon_wq),
> sii9234_extcon_notifier() will queue the work again.
>
> Once sii9234_remove() completes, devres will unregister the notifier and
> free ctx (allocated via devm_drm_bridge_alloc()). When the queued work executes
> in sii9234_extcon_work():
>
> 	struct sii9234 *ctx = container_of(work, struct sii9234, extcon_wq);
> 	int state = extcon_get_state(ctx->extcon, EXTCON_DISP_MHL);
>
> it will dereference the freed ctx, resulting in a use-after-free.
IMHO this is a generic issue with devm_extcon_* API and for now I would suggest
getting back to non-devm extcon API.

>> +		if (ctx->cable_state > 0)
>> +			sii9234_cable_out(ctx);
>> +	} else {
>> +		sii9234_cable_out(ctx);
>> +	}
>>  	drm_bridge_remove(&ctx->bridge);
>>  }

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

