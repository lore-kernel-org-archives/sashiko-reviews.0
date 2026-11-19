Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.21.61.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795102238;
	b=ntM/k/FIFWJ7kjA1qLzTlbZUpnX8mDHrHxHN8NA3nKJgn3kC6zfa7M1KjRhoLrZ6iggG
	 dec9qF7FwO2ImTgiu94cn7aZA2Q5Ah8cijnVsVpwX7zoivug/i7KHL83LoJyjq6zf0Rjm
	 ukXI8x+eRIGereFVAmLr19NOBvb40xD7AsquTRDt1p8oEbAa/DMicFsJzzJhREiFDPZ2q
	 ofq/kHPWQGbELIHEZxgyU3lQ58GRokgVN/Xq/9higZ4QYM9x8lvJCq7FCZRGEAMF7ujXg
	 LedAtys+CQTba3b3uLE3ybOpktU073q3FUSwUBRW4juvlmiTvT5niQ03IukDL/HxYuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102238;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=FMi2mMXbZEaTTTJLs4nfOz4L1kEKPa7JQamE+tBPopc=;
	b=KhCv5F6hJ6wHcjWUjvK269Xn1+2EYzcwI3GvSQoK+GateXngurIHQVRDnEsQ7DWwBZ7X
	 WFgGFdR9nX8ENNJG0Rz4N0jZ3GtZnR7NR5wm6Iu84QeO5DgWjc60uQM+4X6rFBz2UO7Iu
	 Ad1b3exNEviJZfszgkqgZ5ol2k0d0QVv9vIBNM702wgoJtI21WsJoE0JqKMSy4pIslK9h
	 VXPLSGaojfUg3/7L66cRZynS00e1d92huC4nKaa6PIfMw3pPumfK7ZEDbF0AqS+N5CNsP
	 PrMH6mq9KnFo9GCdzRWH9+AauKFlboxQZ2Dnr3lO2UWbH8d0QRmxNLi0JWgLCNjLUkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aliel.fr;
	spf=pass smtp.mailfrom=aliel.fr;
	dkim=pass header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=Nj6zi7Fo;
	arc=none smtp.remote-ip=65.21.61.41
Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701CC606A325
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 15:30:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 701CC606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=Nj6zi7Fo
Message-ID: <ec9c8460-a8de-460e-92bb-dc03240152bb@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795102234;
	bh=3cxvdL4KfFwcHXkWK7rQriyomVokMs5MeD2OaggeClQ=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=Nj6zi7Fo0ca5Ps9aUATozF/jxT6gCv+7SS7P/dwLIZlh4hIVjAk7MXSsgA7JbBLy7
	 lf+mFz55owqBoYAWIJldfRz0SSqxgdM6lEpUk0rQzL+74rNH31mts30Mc31SPIGjA+
	 FTOPuTK24MLzcb6ip2CCC7ddL/fChzsbgAjliXNI=
Date: Thu, 19 Nov 2026 16:30:02 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 06/10] drm/meson: dw-hdmi: Drop manual HHI clock and
 memory PD setup
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 vkoul@kernel.org, olteanv@gmail.com
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-6-9e0ac931381c@aliel.fr>
 <sashiko-outbox-219570@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-219570@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/17/26 21:11, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] drm/meson: dw-hdmi: skipped HDMITX mem PD power-up in
>   meson_dw_hdmi_init()
> --
> 
> commit c8e782099f758bf635402705a20f57d7df9682a7
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> drm/meson: dw-hdmi: Drop manual HHI clock and memory PD setup
> 
> This commit removes the direct HHI_HDMI_CLK_CNTL and HHI_MEM_PD_REG0
> register writes in meson_dw_hdmi_init() and takes a runtime PM reference
> in meson_dw_hdmi_probe() to power on the VPU power domain.
> 
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index eb33c70f29c31..20a821936b3af 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> [ ... ]
>> @@ -599,12 +598,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>>  {
>>  	struct meson_drm *priv = meson_dw_hdmi->priv;
>>  
>> -	/* Enable clocks */
>> -	regmap_update_bits(priv->hhi, HHI_HDMI_CLK_CNTL, 0xffff, 0x100);
>> -
>> -	/* Bring HDMITX MEM output of power down */
>> -	regmap_update_bits(priv->hhi, HHI_MEM_PD_REG0, 0xff << 8, 0);
>> -
>>  	/* Reset HDMITX APB & TX & PHY */
>>  	reset_control_reset(meson_dw_hdmi->hdmitx_apb);
>>  	reset_control_reset(meson_dw_hdmi->hdmitx_ctrl);
>> @@ -829,9 +822,29 @@ static int __maybe_unused meson_dw_hdmi_pm_resume(struct device *dev)
>>  	return 0;
>>  }
>>  
>> +static void meson_dw_hdmi_pm_put(void *dev)
>> +{
>> +	pm_runtime_put_sync(dev);
>> +}
>> +
>>  static int meson_dw_hdmi_probe(struct platform_device *pdev)
>>  {
>> -	return component_add(&pdev->dev, &meson_dw_hdmi_ops);
>> +	struct device *dev = &pdev->dev;
>> +	int ret;
>> +
>> +	ret = devm_pm_runtime_enable(dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = pm_runtime_resume_and_get(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to power on HDMI TX\n");
> 
> [Severity: High]
> Can dropping the HHI_MEM_PD_REG0 write leave the HDMITX memory powered
> down when the bootloader turns on the top-level VPU domain without
> enabling HDMI?
> 
> In the VPU power domain driver, pwrc_ee_is_powered_off() only checks the
> top-level AO sleep bit and does not check HHI_MEM_PD_REG0[15:8].  When
> the top-level VPU domain is already powered on at boot,
> meson_ee_pwrc_init_domain() registers the genpd as already on without
> calling meson_ee_pwrc_on():
> 
> drivers/pmdomain/amlogic/meson-ee-pwrc.c:meson_ee_pwrc_init_domain() {
> 	...
> 	if (dom->num_clks && dom->desc.is_powered_off && !dom->desc.is_powered_off(dom)) {
> 		ret = clk_bulk_prepare_enable(dom->num_clks, dom->clks);
> 		if (ret)
> 			return ret;
> 
> 		dom->base.flags = GENPD_FLAG_ALWAYS_ON;
> 		ret = pm_genpd_init(&dom->base, NULL, false);
> 		if (ret)
> 			return ret;
> 	}
> 	...
> }
> 
> Because the genpd is initialized in the ON state with
> GENPD_FLAG_ALWAYS_ON, pm_runtime_resume_and_get() is a no-op and
> meson_ee_pwrc_on() never runs to clear HHI_MEM_PD_REG0[15:8], leaving
> HDMITX memory powered down when meson_dw_hdmi_init() and dw_hdmi_probe()
> access the controller.
> 

I will add a new patch with a function to release the memories power off
bits in v2.

> In addition, power-domains and assigned-clocks are optional in the
> amlogic,meson-dw-hdmi binding and were only added to in-tree DTs in
> v6.11, so dropping the HHI_HDMI_CLK_CNTL and HHI_MEM_PD_REG0 writes also
> regresses older DTBs (where meson_vclk_set() only configures
> HHI_HDMI_CLK_CNTL later at atomic_enable time) and builds with CONFIG_PM
> disabled.
> 

I will add a depends on PM in v2.

-- 
Best regards,
Ronald
