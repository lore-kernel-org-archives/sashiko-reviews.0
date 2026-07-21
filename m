Received: from th8-b.mail-neoserv.si (th8-b.mail-neoserv.si [152.89.234.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E22434E46
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 07:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=152.89.234.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619720; cv=fail; b=H/ocnCwwut+ODQQEDmk2eFQqwHk/KzL2EeU0iJuPf42KOyZ0CQXvg/o8NSy5n3dveHQ4Yep2dva4gbjQ/K92jJAj9WzuKdF1uJih+oKsdeIHH8g0z8nhnbwXPME5N5OTDyGAKThVRfMJMv28+oiMxaGTfF6549V/Qr20JUB+V9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619720; c=relaxed/simple;
	bh=rEeQQkug5RmUtVkac5zi2lz50S+47Aw3LULG17wjEAo=;
	h=MIME-Version:Date:From:To:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=djAc6bIOxwvMu8LScuEWG/tGq5wuOitr7Cn0nNkiIJdTZNasOcP5vwZh5LSKFZrpDWA/j35DOU+u8PYkeqEg5Nf5p82sSmpgFchs5AM18JOQDLrP8EtjPovoZSyZhc0SLm0X4fPdnV0CMcp0KBTthv5ywURayzYuxmiTTMaA6Ag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kanardia.eu; spf=pass smtp.mailfrom=kanardia.eu; dkim=pass (2048-bit key) header.d=kanardia.eu header.i=@kanardia.eu header.b=U/1kq2Cf; arc=fail smtp.client-ip=152.89.234.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kanardia.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kanardia.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kanardia.eu header.i=@kanardia.eu header.b="U/1kq2Cf"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=th8.neoserv.si; s=default;
	 b=OGvGQLd6iKa/s3mmnwyqLbhZntsb/bdcZ+jG80gk1xKUSgRal/euspzTu8ISHNQegAcMSKKSee
	  +Nf80CcddZlBIPKHY14ZdI+OFB5E+71+xAmrqiRrEmocnPiTrXbTWE5RwmhBfuNw3pmVKZARJb
	  SSInJJw+slb19iJN9mEPohOjfDXHqxN5NaQYcdvX60Q9bS1KNTKCjySe68LqaJVYfraOrgM70x
	  8RPP2D22T+VG/Pql2p+qnFzM6h86k8JxY55caKhU76ACxbJ0o0ECICzRTYyxsXyLlvjEmdVWAJ
	  QgzOpAfbq1YoYn9BxkQPev5KZ5PYLYUgiD2IBvOdnELBOQ==;
ARC-Authentication-Results: i=1; th8.neoserv.si; smtp.remote-ip=::1;
	iprev=fail smtp.remote-ip=::1;
	auth=pass (LOGIN) smtp.auth=rok@kanardia.eu
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=th8.neoserv.si; s=default;
	bh=rEeQQkug5RmUtVkac5zi2lz50S+47Aw3LULG17wjEAo=;
	h=Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	  Subject:To:From:Date:MIME-Version:DKIM-Signature;
	b=XrMEYw2rZVYCermjMZb6OzUnQXxHJn604e7GvNg1fwhhK7AweA5cPK9CH6CT5vDCphDE15I91G
	  lgtABAWpqXpuigjJ0G7GLwMLgLA+NPpFiORlP+a6GJcwFTolkZb79oQ9QFDWVw593PFjSh69Ct
	  K0gJW3420da8iFA1/mccsZRGP1BD5hebUIWMQq0UMU2gx+jHeMt9+Mcku2qPnkzG+us7Xy1yff
	  98iaqK0pFHnv5c3ONqJXTey8nL940jcBcvI413VEJp6dpOEVqM/dGH5ZRe0eUrGAjtcq3PSiLY
	  QIZTLvcvrMxHh42ei+RIm14FAumcOYqaJDqhammSaJ7ovA==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kanardia.eu
	; s=default; h=Content-Transfer-Encoding:Content-Type:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ejI77wNrwQGvWHy9V2SjFtO9Z8wh7sxJbgtnT3DAEzk=; b=U/1kq2CfI2xZCZMwTaw/jdLNcC
	0hEDSowLQzG1oDW4Amfi0e90+FLV8cYxavNkf2i1LBbvVq5BTGYwzI5jx/qHY1S9LqeL4EChIqcKc
	XEOGVE5RwJIKgwYsMiTYx3WcTHgm1ZxyS/3PZUEIIwKNHnGDtINbAdaH4yUIR45nOpmaoT6GJcbhU
	9j/lyEaDDZPecE7zeRaiN8jIkzK4UtUQ1tJPvLkUbdH5ofhiNqA+vPJJbQe97nmSDZwbV6aDN+9M7
	3qVgSoOqiiSOtaa2YWvpAIMTF1i4QYGRL05xM1CN7yvd9QH6AdSlvxHevFykUQkEJVhbOQS3AygTc
	IwLouV5w==;
Received: from [::1] (port=59042 helo=th8.neoserv.si)
	by th8.neoserv.si with esmtpa (Exim 4.99.4)
	(envelope-from <rok@kanardia.eu>)
	id 1wm4fO-000000003Sh-3La6
	for sashiko-reviews@lists.linux.dev;
	Tue, 21 Jul 2026 09:13:26 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 21 Jul 2026 09:13:26 +0200
From: =?UTF-8?Q?Rok_Markovi=C4=8D?= <rok@kanardia.eu>
To: sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH 4/4] arm64: dts: rockchip: rk356x: add LVDS node
In-Reply-To: <20260717121309.516801F00A3A@smtp.kernel.org>
References: <20260717120005.2087386-1-rok@kanardia.eu>
 <20260717120005.2087386-5-rok@kanardia.eu>
 <20260717121309.516801F00A3A@smtp.kernel.org>
User-Agent: Roundcube Webmail/1.6.17
Message-ID: <8be06fb3745f5aa7e511ac5f0aa5d2ea@kanardia.eu>
X-Sender: rok@kanardia.eu
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: th8.neoserv.si;
	iprev=fail smtp.remote-ip=::1;
	auth=pass (LOGIN) smtp.auth=rok@kanardia.eu
X-NEOSERV-MailScanner-Information: Please contact the ISP for more information
X-NEOSERV-MailScanner-ID: 1wm4fO-000000003Sh-3La6
X-NEOSERV-MailScanner: Found to be clean
X-NEOSERV-MailScanner-SpamCheck: 
X-NEOSERV-MailScanner-From: rok@kanardia.eu
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - th8.neoserv.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - kanardia.eu
X-Get-Message-Sender-Via: th8.neoserv.si: authenticated_id: rok@kanardia.eu
X-Authenticated-Sender: th8.neoserv.si: rok@kanardia.eu

17.7.2026 14:13, je sashiko-bot@kernel.org napisal
> Thank you for your contribution! Sashiko AI review found 2 potential 
> issue(s) to consider:
> - [High] Missing Hardware Clock Initialization for RK3568 LVDS
> - [Medium] Unbalanced Hardware Resource Teardown in Error Paths
> --
> 
> --- Patch [4]: [PATCH 4/4] arm64: dts: rockchip: rk356x: add LVDS node 
> ---
> commit bfe12cef9ca639b004d58e050ef9175743345f7b
> Author: Rok Markovic <rok@kanardia.eu>
> 
> arm64: dts: rockchip: rk356x: add LVDS node
> 
> This commit adds the LVDS transmitter node for the RK356x SoC, 
> assigning
> its clock, physical interface, and power domains. It is left disabled 
> by
> default, to be enabled by specific board files.
> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi 
>> b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
>> index a5832895bd392..2b3beab5507b1 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
>> @@ -879,6 +879,31 @@ hdmi_out: port@1 {
>>  		};
>>  	};
>> 
>> +	lvds: lvds {
>> +		compatible = "rockchip,rk3568-lvds";
>> +		clocks = <&cru PCLK_DSITX_0>;
>> +		clock-names = "pclk_lvds";
> 
> [Severity: High]
> Does the driver actually use this clock?
> 
> Looking at rk3568_lvds_probe() in 
> drivers/gpu/drm/rockchip/rockchip_lvds.c,
> it seems to completely omit fetching the required pclk_lvds clock from 
> the
> device tree:
> 
> drivers/gpu/drm/rockchip/rockchip_lvds.c:rk3568_lvds_probe() {
>     ...
>     lvds->dphy = devm_phy_get(&pdev->dev, "dphy");
>     if (IS_ERR(lvds->dphy))
>         return PTR_ERR(lvds->dphy);
> 
>     return phy_init(lvds->dphy);
> }
> 
> Because lvds->pclk is left NULL, the clk_enable() call in
> rk3568_lvds_poweron() acts as a no-op:
> 
> drivers/gpu/drm/rockchip/rockchip_lvds.c:rk3568_lvds_poweron() {
>     ...
>     ret = clk_enable(lvds->pclk);
>     if (ret < 0) {
>     ...
> }
> 
> Will this cause hardware registers to be accessed without a running 
> clock,
> potentially leading to system hangs on device probe or modeset?
> 
>> +		phys = <&dsi_dphy0>;
>> +		phy-names = "dphy";
>> +		power-domains = <&power RK3568_PD_VO>;
>> +		rockchip,grf = <&grf>;
>> +		rockchip,output = "lvds";
>> +		status = "disabled";
>> +
>> +		ports {
> 

Fixed. Removed unused clock.

> [Severity: Medium]
> Will enabling this hardware expose an unbalanced resource teardown in 
> the
> driver's error paths?
> 
> If intermediate steps like phy_set_mode() fail in
> rk3568_lvds_encoder_enable(), the function returns early without 
> rolling
> back earlier successful calls:
> 
> drivers/gpu/drm/rockchip/rockchip_lvds.c:rk3568_lvds_encoder_enable() {
>     ...
>     ret = phy_set_mode(lvds->dphy, PHY_MODE_LVDS);
>     if (ret) {
>         DRM_DEV_ERROR(lvds->dev, "failed to set phy mode: %d\n", ret);
>         drm_panel_unprepare(lvds->panel);
>         return;
>     }
>     ...
> }
> 
> Because .enable() returns void, the DRM core assumes it succeeded and 
> will
> later call .disable(). The rk3568_lvds_encoder_disable() function
> unconditionally tears down all resources:
> 
> drivers/gpu/drm/rockchip/rockchip_lvds.c:rk3568_lvds_encoder_disable() 
> {
>     struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> 
>     drm_panel_disable(lvds->panel);
>     phy_power_off(lvds->dphy);
>     rk3568_lvds_poweroff(lvds);
>     drm_panel_unprepare(lvds->panel);
> }
> 
> Could this cause refcount underflows for PHY, PM runtime, and clocks,
> resulting in kernel warnings if they were never successfully enabled?
> 

Fixed. Testing if lvds->enabled in disable.

Will post patchset v2.
