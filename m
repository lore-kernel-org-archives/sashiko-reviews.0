Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594D43BB9EF
	for <sashiko-reviews@lists.linux.dev>; Sat, 11 Jul 2026 11:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783770220; cv=none; b=dnguQ7XzjOzEYr2bgOJ/bOR6CDQy+5FdFWlnYRYnwMhhrm8nEHlRhAz7eQZqHew68zNNiSIlamTi10X4eXk5pZgExK3NVnoHCecb4aTI9i242yHliIY8kOSKSL38IjEPRh6Sqj9jn5CZ7TVqKSqG8hdvm+zbkewC9GBVHFh9AYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783770220; c=relaxed/simple;
	bh=ROFKz8ZfzB1q5/1VAhQbotuLOfeDoggxQFdNpKhwI2A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b2CBInJV4ixRMiJCLwdXddKI6lU7FRWAYkcfOgeA+lpS0bpPel43YLIMAlZgE5EP/h23MaePH8S/WaubglTAd8LV18jbx33OI7Z7Ad4mT+BGWUvX9zeghXFOEdd46uKYqH4PdqOgx8yjX0bwjPvpTgbsefCe1rudo14H0XrzDn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=FGtvsdgE; arc=none smtp.client-ip=185.70.43.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="FGtvsdgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1783770213; x=1784029413;
	bh=54fCr4l9tcoBj/CLRH9neE+6ZDkmL1OGbEpVKEGc4o4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FGtvsdgEdXgTbQme4cpvIvRG0q6GGCKiFlHhzXJpagKvGWwh1uCyq4XPf139ihPKF
	 2LfMJtttb5I2OxHbM2OPc2myPLAXkZmYHyQeJrF4M5/VMv7/K/XbTxBbzVeb1xWRZ3
	 xJoKXobaJuuWVHI2Xxe/dIyaZWAXu2l2zUh51Yw2yxbcaCOu3Sb4QeFoIjT4k+8QvD
	 qg224lxyHnt2ii9VRBjHrVudV2Gi6sx2Ycpx0OU6YrmeP45iFtMx0BLOrzo9Qkpyvo
	 utRuY7i5xZE/uSmpRfYr7AjFdFCHDewae1/o3XDQBeyPWz8ZgoB21NGRSmDMgmLPU1
	 GdH9Z0bTH/xXQ==
X-Pm-Submission-Id: 4gy6KH5lCJz2ScXP
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/bridge: nwl-dsi: Correct MIPI DSI horizontal
 sync timing
In-Reply-To: <20260710142723.3A0A71F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 10 Jul 2026 14:27:22
	+0000")
References: <20260710-nwl-dsi-fixes-v1-0-927d918a86ad@geanix.com>
	<20260710-nwl-dsi-fixes-v1-3-927d918a86ad@geanix.com>
	<tkpQf_Zee02t-ObgBFPIV50cXi2IhbZxeMuFVbryCMha3UShmaIqgf2A3V_udamiMFj5LJvEu8bbdI7Z6FkWZw==@protonmail.internalid>
	<20260710142723.3A0A71F00A3A@smtp.kernel.org>
Date: Sat, 11 Jul 2026 13:43:31 +0200
Message-ID: <87fr1peopo.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] Division by zero kernel panic if a display mode has zero horizontal blanking.
> - [High] Integer underflow leading to hardware register corruption when horizontal blanking is too small.
> - [Low] Build failure on 32-bit architectures due to 64-bit division.
> --
>
> --- Patch [3]: [PATCH 3/3] drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync timing ---
> commit eb9d34f1c88e6933d5822b8331847848414cfe4d
> Author: Esben Haabendal <esben@geanix.com>
>
> drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync timing
>
> The NWL MIPI Host controller registers specifies the horizontal front
> porch, sync pulse, and back porch in DSI packet payload size in bytes (ie.
> not in pixel clocks).
>
> The formula implemented here converts the hfp, hsa, and hbp to DSI packet
> bytes and then subtracts the number of packet header bytes.
>
>> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
>> index c9af6a3d47e1d..ed61580a35457 100644
>> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
>> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
>> @@ -317,9 +322,54 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
>>  			      dsi->mode.hdisplay);
>>  	}
>>
>> -	nwl_dsi_write(dsi, NWL_DSI_HFP, hfront_porch);
>> -	nwl_dsi_write(dsi, NWL_DSI_HBP, hback_porch);
>> -	nwl_dsi_write(dsi, NWL_DSI_HSA, hsync_len);
>> +	pclk_period = DIV_ROUND_UP_ULL(PSEC_PER_SEC, dsi->mode.clock * 1000);
>> +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "pclk_period: %llu\n", pclk_period);
>> +
>> +	hs_period = DIV_ROUND_UP_ULL(PSEC_PER_SEC, dsi->phy_cfg.mipi_dphy.hs_clk_rate);
>> +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hs_period: %llu\n", hs_period);
>> +
>> +	/*
>> +	 * Calculate the bytes needed, according to the RM formula:
>> +	 * Time of DPI event = time to transmit x number of bytes on the DSI
>> +	 * interface
>> +	 * dpi_event_size * dpi_pclk_period = dsi_bytes * 8 * hs_bit_period /
>> +	 * num_lanes
>> +	 * ===>
>> +	 * dsi_bytes = dpi_event_size * dpi_pclk_period * num_lanes /
>> +	 * (8 * hs_bit_period)
>> +	 */
>> +	hfp = hfront_porch * pclk_period * dsi->lanes / (8 * hs_period);
>> +	hbp = hback_porch * pclk_period * dsi->lanes / (8 * hs_period);
>> +	hsa = hsync_len * pclk_period * dsi->lanes / (8 * hs_period);
>
> [Severity: Low]
> Will this cause a build failure on 32-bit architectures?
>
> The variables pclk_period and hs_period are 64-bit unsigned integers
> (unsigned long long), and using the native division operator here instead of
> kernel macros like div64_u64() can result in an undefined reference to
> '__udivdi3' when compiling on 32-bit systems.

The driver is only used with 64-bit i.MX SoC's, so it should be fine as
it is.

>> +
>> +	/* Make sure horizontal blankins are even numbers */
>> +	hfp = roundup(hfp, 2);
>> +	hbp = roundup(hbp, 2);
>> +	hsa = roundup(hsa, 2);
>> +
>> +	/*
>> +	 * We need to subtract the packet header length: 32
>> +	 * In order to make sure we don't get negative values,
>> +	 * subtract a proportional value to the total length of the
>> +	 * horizontal blanking duration.
>> +	 */
>> +	h_blank = hfp + hbp + hsa;
>> +
>> +	pkt_len = roundup(((hfp * 100 / h_blank) * 32) / 100, 2);
>
> [Severity: Critical]
> Could h_blank be zero here?
>
> If userspace configures a display mode where hdisplay == hsync_start ==
> hsync_end == htotal (meaning zero horizontal blanking), the porches and
> sync length will be zero. This makes hfp, hbp, and hsa zero, causing h_blank
> to evaluate to 0.
>
> Since the mode parameters are not restricted from being zero during validation,
> could a custom mode submitted via DRM atomic commits trigger a division by
> zero kernel panic here?

I will add a safeguard against this.

>
>> +	pkt_hdr_len = pkt_len;
>> +	hfp -= pkt_len;
>> +
>> +	pkt_len = roundup(((hbp * 100 / h_blank) * 32) / 100, 2);
>> +	pkt_hdr_len += pkt_len;
>> +	hbp -= pkt_len;
>> +
>> +	hsa -= (32 - pkt_hdr_len);
>> +
>> +	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Register values: hfp=%d hbp=%d hsa=%d\n", hfp, hbp, hsa);
>> +
>> +	nwl_dsi_write(dsi, NWL_DSI_HFP, hfp);
>> +	nwl_dsi_write(dsi, NWL_DSI_HBP, hbp);
>> +	nwl_dsi_write(dsi, NWL_DSI_HSA, hsa);
>
> [Severity: High]
> Can these subtractions cause integer underflow if the horizontal blanking is
> too small?
>
> If userspace configures a mode with a valid but very small horizontal blanking
> (where the calculated h_blank is less than the equivalent of 32 bytes),
> subtracting up to 32 bytes proportionally could cause hfp, hbp, or hsa to
> underflow and become negative.
>
> Would those underflowed negative values then be implicitly cast to large u32
> integers when written directly to the DSI hardware registers here?

While it is not userspace that controls these values, it makes sense to
add safeguards against these kind of problems.

I will fix this together with the safeguard against division by zero.

/Esben
