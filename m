Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72132ECD1D
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 20:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784839804; cv=none; b=pb1laPTJP1K0HEWGyySZKwnUM4+DGGvDpJWl9trzYe7RT210xKinelNAPjmi4m4DjmCSFjNV2rd1y4w5hYgJzT5r3+EyatqjD5dJsu9A+oW+DytziHEdWnFYUgBUcdztIHfLRUhhYZXlBRHnpwfxDb8MUbwjpjNPxgKJYcP+x18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784839804; c=relaxed/simple;
	bh=h48RRP+WBLX/GfXrAjAcXLBZDmUiZ2vByVtC1Gnqa1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gt09wxsLfwUXq0oiSEPZKUcE8YIAmvhW54h3sbuyF5Bb3KBcnYM4yvmKl+LVLd4iYduhGPpDYivB1KNXDtmWhlnRbECOUgf7eHtqHciI08oP8+vDHtNU6o3N4XTiLja6b4wV+V3r2tJHNcCnLNb9f/LHhp85qL98j1v615ZDxco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Z4rWdMJ0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Z4rWdMJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784839800;
	bh=h48RRP+WBLX/GfXrAjAcXLBZDmUiZ2vByVtC1Gnqa1k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z4rWdMJ0DeDE+Ty7Dwk/qE5PkJhR6WnqU6TGv+wcgXiV/FgWpPP4ZNPsW4PSgEsho
	 tSyenojjsWYevPjgly16JnezLa2k13HoGfTCc/Gxar1q8Eo7OgefpoZ12U2rVx5Crj
	 gMTzvbODFQRSw3UFnvCWoAlAvze3FMxEkMyngKO2uNqIZZRGSJQFaJITj6+1ANHPcW
	 woOIjTBka0/QLAXrI6ml4svTCfJg0tA+IYSxYs0nCR6tChPoVzxThs/e6njzxB8ccJ
	 B8yNB27gUqnnvmoZlgzpFyyfjDPRg1LWbDCqQ+0Ane+dPLST2MJBTJgiNGjm/d4ey0
	 W4ZW0qFP/iMrA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9B21017E0676;
	Thu, 23 Jul 2026 22:50:00 +0200 (CEST)
Message-ID: <b6b26c56-b6be-4e70-adef-0fea3fb25ed8@collabora.com>
Date: Thu, 23 Jul 2026 23:50:00 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/10] phy: rockchip: samsung-hdptx: Drop TMDS rate
 setup workaround
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com,
 neil.armstrong@linaro.org
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-6-8e786067865f@collabora.com>
 <20260723195420.840511F000E9@smtp.kernel.org>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260723195420.840511F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/23/26 10:54 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit claims to drop the TMDS rate setup workaround but fails to remove the corresponding CCF-based rate adjustment fallback, leaving the cleanup incomplete.
> --
> 
> --- Patch [6]: [PATCH v5 06/10] phy: rockchip: samsung-hdptx: Drop TMDS rate setup workaround ---
> commit 0f64c3b5ec0d09a00473e1362200c7598b861f9d
> Author: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> phy: rockchip: samsung-hdptx: Drop TMDS rate setup workaround
> 
> Since commit ba9c2fe18c17 ("drm/rockchip: dw_hdmi_qp: Switch to
> phy_configure()") the TMDS rate setup doesn't rely anymore on the
> unconventional usage of the bus width, instead it is managed exclusively
> through the HDMI PHY configuration API.
> 
> Drop the now obsolete workaround to retrieve the TMDS character rate via
> phy_get_bus_width() during power_on().
> 
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index 792eb57755eb1..31abff5ada9e3 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -1660,22 +1660,6 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>>  	enum phy_mode mode = phy_get_mode(phy);
>>  	int ret, lane;
>>  
>> -	if (mode != PHY_MODE_DP) {
>> -		if (!hdptx->hdmi_cfg.rate && hdptx->hdmi_cfg.mode != PHY_HDMI_MODE_FRL) {
>> -			/*
>> -			 * FIXME: Temporary workaround to setup TMDS char rate
>> -			 * from the RK DW HDMI QP bridge driver.
>> -			 * Will be removed as soon the switch to the HDMI PHY
>> -			 * configuration API has been completed on both ends.
>> -			 */
>> -			hdptx->hdmi_cfg.rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
>> -			hdptx->hdmi_cfg.rate *= 100;
>> -		}
>> -
> 
> [Severity: Medium]
> Since this patch drops the TMDS workaround here, should we also remove the
> corresponding CCF-based rate adjustment fallback and the restrict_rate_change
> state tracking?
> 
> Looking at rk_hdptx_phy_clk_determine_rate():
> 
> drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c:rk_hdptx_phy_clk_determine_rate() {
> 	...
> 	/*
> 	 * FIXME: Temporarily allow altering TMDS char rate via CCF.
> 	 * To be dropped as soon as the RK DW HDMI QP bridge driver
> 	 * switches to make use of phy_configure().
> 	 */
> 	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.rate) {
> 		struct phy_configure_opts_hdmi hdmi = {
> 			.tmds_char_rate = req->rate,
> 		};
> 	...
> }
> 
> Leaving this block behind seems to leave dead code, as the removal condition
> (the bridge driver switching to phy_configure()) has been met.
> 
> Does this cleanup belong in this patch as well to ensure the workaround is
> fully removed?

No, this is handled separately in [PATCH v5 08/10] phy: rockchip: samsung-hdptx:
Drop restrict_rate_change handling.
