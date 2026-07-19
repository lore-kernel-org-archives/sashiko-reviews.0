Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D15199949
	for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 22:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784500238; cv=none; b=kMeoOwyKIoqAlbrZHFQhIYA6txv8ZrW/LPi75NjSZByJgAIUNl6p0r9w1mco8dDM2JPitAFFa9zJhHPgimLvQ8lCBX8O64x8i017SBCiP9l89No4peAwnhYuJGp/5BTOBXUaS/q9Zx3UoM4SIKxq38OrcTSYmEXV6RVEzgVaerk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784500238; c=relaxed/simple;
	bh=0C2jaq6CHwX65Dpl7hbWEPT8Pg5z8tLgPBCiFFKIv+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WWGEO0ZBibp2zy/Ec7O4MMu9DlbDH6ItTicyhnGbtazZU2DRuOIZuXfzWncj09aT79czxJG7LCaoEsM0/gF8L18IatTLxYC5Vcsbi+C3hBi41T3r7Z2sY5iL7MFdRlHUjyCAvDhQNTr0hhlhtXMEihHRtpBF5fhb+vySwRwQqOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HV9uM8Fm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HV9uM8Fm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493f75f7172so73913975e9.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 15:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784500235; x=1785105035; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VNPJswjr3SJLrlJpAZg7EHmOY10XaD74Uxuqros5GpM=;
        b=HV9uM8FmfMoJ6GDlMmlQNME+FGVNDb+hGu2CPvM4qlS+Ls53RxlleJSRXZS9EXIhC9
         ij1/of3J2WqKU3aEn2i9BQt7p4wm15WmUdfvDuJdg67ihbnBPeRwRp3sIHx3FxKtTFW9
         k1EiEfkHOWOvo9ukDUzXaSuS9awuSO6XNvOymbN7Q3MqM3wP+ycJUzV0IKBKojLeAp49
         igvZiN0rXbNKv05fpR1fD0XxCFkRhoeVibQ7zMAyQ94yWJ9G40LXNEKklyuVTOGs3arZ
         tPtuywXzOJuyicVUfCrKGAXlVrD4bkMCcZeaDDvtSe2SG3QeMgk7Ni30Wk+l2ZllZ8w1
         ZISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784500235; x=1785105035;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VNPJswjr3SJLrlJpAZg7EHmOY10XaD74Uxuqros5GpM=;
        b=Y6C1RorL6wGD/nXTUqY/pRZMk95CLn9JDAxYbGl75HCkedFl4TiUZGzjUdtTf7D8ny
         deRdYOgFnpifPY4veEwRVs+PL0NEQTmG8waQ+SzsWa6qvIGSo9IUIQWXIVbY09yr3K5I
         YXCpG1iJ5GzXVnRpy5Vh+pwxem6FfK4AOqNtiueTzypluOV5FV+X9JFsu6vPcRCRKxfK
         It0soJjJhbVJ9VOTRr4F3F1CvJW2+j9gAOeISLp4G3BqulvloOdxEI+eK9QSaUH4k47+
         2NtF7SR0qQ80gjXImgb+/xGg54DSrOtN807synfNB5xBgyqiIiF9NvgEhHBWdBklmihE
         +ptw==
X-Gm-Message-State: AOJu0YxMPj+z6p71qYavFWha7rGeSyb+qGf7WRF5Cacs+vW9uurTwvnM
	h0CjG2E+gw6xeJNj60qhFm9Vtx/G2TKVF3OEuFSZZLkxdTdz1fTzwt4v7uBhv0k33yozwQ8gg73
	BZw+HkqE=
X-Gm-Gg: AfdE7ck6apO+st5lpEFQjlyUM5gEALTBfJZvjGnQySFtRgMyVrkNutOw43XpO9DZlA2
	33DScnFHN+PjaP0TkxnldwiqtD0NBJSIcCDfE4zG5qCp1cj7v08h8W/Iuf75LiLeoPeTqePhdEI
	3RvD6IS/gpLxRSufHqsm3BYXoZ1bZKGbR5ufJmOkEU7I5NnJLRaFLGoo1lfzAep1XdVqGMNh+aA
	PGdWZBCSLuQwoi2LQXQonhEWCwOOgC1vrRPpdFzwNiFMYyae2v2jdc+IRJYJV9AvEF3FIPgjIox
	fyIrczvdO2t7y2LzilKM22RavhF9izgmRQdHgFs7Jw3zc12qeWAxYOc/2wxnc1mZKwPS+CBQ9Jn
	i2JvMlgHOR40BOF+OUYdzxgq6nFMquTjVQaXsrqHuvhZhrSNEI9UI5N42IFsW5hSh3F8uYMmDsm
	mEDv7py91NlTZE3BGXhUoTkCsk
X-Received: by 2002:a05:600c:4445:b0:493:f262:b8 with SMTP id 5b1f17b1804b1-4954a3e374cmr116983045e9.1.1784500234679;
        Sun, 19 Jul 2026 15:30:34 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.79.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2edda2sm217846365e9.13.2026.07.19.15.30.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 15:30:34 -0700 (PDT)
Message-ID: <61f7c25d-fd50-42bd-aabc-8da1ea28e233@linaro.org>
Date: Sun, 19 Jul 2026 23:30:33 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, media-ci@linuxtv.org, vkoul@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org,
 linux-phy@lists.infradead.org, olteanv@gmail.com
References: <20260719-x1e-csi2-phy-v12-0-cc7311326d1b@linaro.org>
 <20260719-x1e-csi2-phy-v12-2-cc7311326d1b@linaro.org>
 <20260719135920.2195A1F00A3A@smtp.kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260719135920.2195A1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/07/2026 14:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Valid calculated settle_cnt of 0 is erroneously rejected as an error, causing PHY initialization to fail.
> - [High] Potential NULL pointer dereference in clock name comparison during probe when parsing malformed device trees.
> - [Medium] Missing PM_OPP Kconfig dependency causes unconditional runtime probe failures.
> --
> 
> --- Patch [2]: [PATCH v12 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver ---
> commit 7fdedc509474184e47a62af468ae08b71f96dfd5
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Subject: phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
> 
> This commit adds a new MIPI CSI2 driver in DPHY mode. It imports existing
> CAMSS CSI PHY initialization sequences to support devices like the
> qcom,x1e80100-csi2-phy.
> 
>> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
>> index 60a0ead127fa9..779a3511ba852 100644
>> --- a/drivers/phy/qualcomm/Kconfig
>> +++ b/drivers/phy/qualcomm/Kconfig
>> @@ -28,6 +28,20 @@ config PHY_QCOM_EDP
>>   	  Enable this driver to support the Qualcomm eDP PHY found in various
>>   	  Qualcomm chipsets.
>>   
>> +config PHY_QCOM_MIPI_CSI2
>> +	tristate "Qualcomm MIPI CSI2 PHY driver"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on OF
>> +	depends on PM
>> +	depends on COMMON_CLK
>> +	select GENERIC_PHY
>> +	select GENERIC_PHY_MIPI_DPHY
> 
> [Severity: Medium]
> Should this Kconfig entry select or depend on PM_OPP?
> 
> Without CONFIG_PM_OPP enabled, the stub for devm_pm_opp_of_add_table()
> used during probe will return -EOPNOTSUPP, causing the driver probe to
> unconditionally fail with an "invalid OPP table" error.

By design in fact as a result of a Sashiko review as I recall. Context 
window between runs seems required for this tool.

> 
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> 
> [ ... ]
> 
>> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
>> +					   struct mipi_csi2phy_stream_cfg *cfg)
>> +{
>> +	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>> +	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
>> +	u8 settle_cnt;
>> +	u8 val;
>> +	int i;
>> +
>> +	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
>> +	if (!settle_cnt)
>> +		return -EINVAL;
> 
> [Severity: High]
> Does this incorrectly reject a valid settle count of zero?
> 
> Looking at the math in phy_qcom_mipi_csi2_settle_cnt_calc():
> 
> phy_qcom_mipi_csi2_settle_cnt_calc() {
>          ...
>          settle_cnt = t_hs_settle_ps / timer_period_ps - 6;
>          return settle_cnt;
> }
> 
> If the link frequency and timer clock rate yield exactly 6 timer periods
> for t_hs_settle, the calculation results in 0. By rejecting 0 here,
> legitimate MIPI CSI2 configurations might fail to initialize.

Yeah, I guess a zero settle count should be legitimate.

> 
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> 
> [ ... ]
> 
>> +static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>> +{
> 
> [ ... ]
> 
>> +	ret = devm_clk_bulk_get_all(dev, &csi2phy->clks);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to get clocks\n");
>> +
>> +	if (num_clk != ret) {
>> +		return dev_err_probe(dev, -ENODEV, "clock count %d expected %d\n",
>> +				     ret, num_clk);
>> +	}
>> +
>> +	for (i = 0; i < num_clk; i++) {
>> +		if (!strcmp(csi2phy->clks[i].id, "timer")) {
> 
> [Severity: High]
> Could csi2phy->clks[i].id be NULL here?
> 
> The clk_bulk_get_all() infrastructure can leave the .id field as NULL if
> the device tree node has a "clocks" property but is missing "clock-names".
> Calling strcmp() on a NULL pointer will cause a kernel panic during probe
> when parsing malformed device trees.

clock-names are required in the schema but sure I add a check for this.

This ping-pong with this tool is taking forever, I need to figure out 
how to run this locally to stop wasting my own time.

>> +			csi2phy->timer_clk = csi2phy->clks[i].clk;
>> +			break;
>> +		}
>> +	}
>> +	if (!csi2phy->timer_clk)
>> +		return dev_err_probe(dev, -ENODEV, "no timer clock\n");
> 

