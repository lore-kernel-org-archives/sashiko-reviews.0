Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589EF367F26
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779379115; cv=none; b=G640WPzqn8kZZDH4CAUF/BXX+xZmmlOqpLe3uAztJzKZK4N7dJ75f+rueBiyRa1RWLGhqj1OCoDGzME4yDXj+wyCu/Qf4jB7cir6SCpEox4WqdSRC3P3fkoCfPFdhCYQY57dudvdNTvq+oYX6vaWesv+jhyShmtLXl7UEQr4XB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779379115; c=relaxed/simple;
	bh=gwbzpMqoyauJv6ZRU25YlHFTPtZLY5Bw/4JWn1pxOLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3iNkyjfvlwsJNybmReLhWHVKtD96du0RHLZCc149Yk9FJ+5qjEQ8a5fNkcwqRWh8VhnkF05sM1DzYlDTI4HXej4q0vieToYw4lM0/rWUcqDMW28OCArjUnE6ooy67mDlsnBzaGSVYp0loCh4sOTYTeScM+Sbli/mVoRP6cp01k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A8/IES48; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A8/IES48"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso82511605e9.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 08:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779379112; x=1779983912; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1j9UgJds853Zv46e1xGjbShW1UJNiQmjpR76/hPVDE=;
        b=A8/IES485H2irupoFKCkYvzyMrCP7DuZP4jUw9L/UOkhv6iJGilWgdlKBkQE7pblOb
         qS0yNznQ+U0O1UfcI936TdfUi2RnafobcBpRePoM906P45pi0HUVbQEyNz2jj2FYb4Jy
         9g2Qw/LJwnxnGAelx2cOTC36yZag/7uWlPq0S4UeBigwVn3xRAKJbFgWk4DSwtlHb8SA
         0iKNg3NotKYx0H2Jdiu3G+rm/UU0SKB6h3F0tqnOs7/F3nNhukrfV8yZMrLajhobieGg
         ya8rvjykZJQYPiK/PeflCjh2rLJVMYsoU3yUY4rjgEA1n4JZMuQFxxv5qyiaysw/KhZD
         A1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779379112; x=1779983912;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1j9UgJds853Zv46e1xGjbShW1UJNiQmjpR76/hPVDE=;
        b=JJ/pvxWz4jPYkFKyy1iQ/TvJOkCICJw+zCzYFjpvLIczgbjy/xCYuAEdPPO9YOotXS
         f9kn++eDqcxFNnwbsSvIR/NN49K+z35FKLlHcp/KVT5XQruUVXfJcqzMBvNdW9KUtmmr
         wHELyA9DDdqEUx1wi4VPqeifU10PECoz5/uljaP+N2dq8pxDyWw6ve4qnXV1x6NkHEC2
         VakYvBdch0uh1a+5nPsD971ojudtyLvBzexIpvlMXeM3Aqj6CvMFCy4cX8L/V3JSx/9o
         cC5My+FHEG8r1XthoCSfuBgvbSMHYhh5eLb/t8mtB6s8WRjp7nPbcYafIVp43ZAwIqfP
         ITHA==
X-Gm-Message-State: AOJu0Yyk/U9s+cL5cTSn4zyi8fnlXMbfWxu4ITfuwUN/K+nJJR63zHtk
	egyCejs0zfOZiR0gznc8Nntb0QafEMCEjOiubJ0FXjN9G7JC9E4A6AAVkvQB8rB8gryl6aHzPgF
	ZYkbRlZs=
X-Gm-Gg: Acq92OGSy3syKe70gmwthu+DsWw+c55p7FqH/bwSPNrzVlyX0eFpoRmruBeB1tAPhuk
	Hlhg2vzRRq3F0XKDH/Dx1ubUs2jK1aPTQnQ4TR+uJmiUtQ4Ea3Wc0h2HC3yGMa4wnB5SpPizIOE
	vAu3vGE1hbpxBXzASJBwyABPfGFFosW4TffFT658EV2hHHHJdx9ckOzRxY8yNzBOSB50a7D+l5t
	S1cCEPhj4XK8CrGd7eeAquBtNKVBgiYIRS9U4NoI/wYS5HYjP6KTlW9IBV+Ec2VxP/xwWp3pKPo
	gY+PCSFvCpu2vgLf1eJGkU3GbkeuSSK528EL2MkZqDH+eTkGbZVdv3hUDeqTyf/7MeHnObFOWPs
	C3t2OkU80lN8Noza9N5hhSrdxj7Bavv4UWrkZK+Gp4k/aYl/tK6fgN1uOjIOUJJqbEXeVhVUHV5
	cB+OhWmhn8irDEbHqRCogyL31n+4nVcxebcQ==
X-Received: by 2002:a05:600c:444e:b0:489:c57:7836 with SMTP id 5b1f17b1804b1-490360dbb9emr47602385e9.27.1779379111491;
        Thu, 21 May 2026 08:58:31 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.55.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035eec6casm18452345e9.33.2026.05.21.08.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 08:58:30 -0700 (PDT)
Message-ID: <06964d8d-10a4-4dfc-b0e0-a66eb12f8978@linaro.org>
Date: Thu, 21 May 2026 16:58:29 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org,
 olteanv@gmail.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org,
 conor+dt@kernel.org
References: <20260521-x1e-csi2-phy-v6-2-9d73d9bd7d20@linaro.org>
 <20260521124947.4BE4B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260521124947.4BE4B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/05/2026 13:49, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 10 potential issue(s) to consider:
> - [High] Extensive resource leaks on error paths in power_on and set_clock_rates, and missing OPP rate reset in power_off.
> - [High] phy_qcom_mipi_csi2_configure overrides the DT-parsed lane count without bounds checking against the physical layout.
> - [High] Unconditional dereference of pd_list leads to a NULL pointer dereference panic.
> - [High] Division by zero occurs if the timer clock rate resolves to 0.
> - [High] Settle count calculation can underflow to a very large positive value.
> - [Medium] The ops->lanes_disable callback is omitted in phy_qcom_mipi_csi2_power_off.
> - [Medium] Clock lane positioning and lane polarities are parsed but entirely ignored.
> - [Medium] The probe function allows the absence of an OPP table, but power_on strictly requires it.
> - [Medium] qcom_csi2_phy_xlate accesses PHY arguments without checking args_count.
> - [Medium] Unvalidated data-lanes integer from DT can cause an out-of-bounds bitwise shift.
> --
> 
> commit 3c373b3ab7783a677ec4c98f344d8b1c57e2e110
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> phy: qcom-mipi-csi2: Add a CSI2 MIPI DPHY driver
> 
> Add a new MIPI CSI2 driver in DPHY mode initially. The entire set of
> existing CAMSS CSI PHY init sequences are imported in order to save time
> and effort in later patches.
> 
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index 0000000000000..8cdff35be2da9
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> [ ... ]
>> +static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
>> +{
> [ ... ]
>> +	timer_period_ps = div_u64(PSEC_PER_SEC, timer_clk_rate);
>> +	settle_cnt = t_hs_settle_ps / timer_period_ps - 6;
> 
> [Severity: High]
> Can this subtraction underflow to a very large positive value?
> 
> If the system has a low timer clock rate resulting in a high
> timer_period_ps, the division could yield a value less than 6. Since
> settle_cnt is an unsigned 8-bit integer, wrapping around to a large
> value could severely misconfigure the PHY hardware timings.

I'm not sure it is really worthwhile writing defensive code for this case.

We audit every DT binding for clock frequency sanity so you have to 
input junk into a device tree and upstream it and we aren't generally in 
the habit of verifying those inputs.

> 
>> +
>> +	return settle_cnt;
>> +}
> [ ... ]
>> +static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
>> +					   struct mipi_csi2phy_stream_cfg *cfg)
>> +{
> [ ... ]
>> +	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
>> +
>> +	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> 
> [Severity: Medium]
> The commit message states that data-lane and clock lane positioning and
> polarity selection are supported. Are the polarity fields ignored here?

Exactly the same situation as we already have for this PHY in CAMSS 
since forever.

We parse but don't program the various fields.

> It appears the clock lane enable bit is hardcoded and the polarity fields
> parsed from the DT are not programmed into the PHY registers.

>> +	for (i = 0; i < cfg->num_data_lanes; i++)
>> +		val |= BIT(lane_cfg->data[i].pos * 2);

Yeah this is longstanding behaviour but, its probably worthwhile to 
update it since we consume the data from DT anyway.
> [Severity: Medium]
> Can this result in an out-of-bounds shift?
> 
> The pos value is read from the device tree as an unvalidated 32-bit
> integer. A malformed DT with large lane positions (e.g. > 15) could
> result in a shift value >= 32, which is undefined behavior and might
> truncate the hardware configuration mask.

Still no - not going to spend time picking through what goes into DT in 
the driver.

For example we don't sanity check register values or IRQ vector numbers.
> 
>> +
>> +	writel(val, csi2phy->base +
>> +	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> [ ... ]
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
>> index 0000000000000..d8bdb2dd3c2ac
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> [ ... ]
>> +static int
>> +phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
>> +				   s64 link_freq)
>> +{
> [ ... ]
>> +	opp = dev_pm_opp_find_freq_ceil(dev, &opp_rate);
>> +	if (IS_ERR(opp)) {
> 
> [Severity: Medium]
> Since the probe function tolerates -ENODEV for the OPP table, won't
> power_on unconditionally fail here if the table is actually missing?
> 
>> +		dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
>> +			link_freq);
>> +		return PTR_ERR(opp);
>> +	}
>> +
>> +	for (int i = 0; i < csi2phy->pd_list->num_pds; i++) {
> 
> [Severity: High]
> What happens to pd_list if CONFIG_PM is disabled?
> 
> devm_pm_domain_attach_list() returns 0 when CONFIG_PM is disabled, but
> pd_list will remain NULL. This would cause a NULL pointer dereference
> here and in phy_qcom_mipi_csi2_power_off().

No idea, lets find out.

>> +		unsigned int perf = dev_pm_opp_get_required_pstate(opp, i);
>> +
>> +		ret = dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], perf);
>> +		if (ret) {
>> +			dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
>> +				perf);
>> +			dev_pm_opp_put(opp);
>> +			return ret;
> 
> [Severity: High]
> Does this leak the performance state for previously set domains?
> 
> If the loop fails on a later iteration, it appears to return without resetting
> the domains that were already successfully configured.

True we need to unwind.

>> +		}
>> +	}
>> +	dev_pm_opp_put(opp);
>> +
>> +	ret = dev_pm_opp_set_rate(dev, opp_rate);
>> +	if (ret) {
>> +		dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
>> +		return ret;
>> +	}
>> +
>> +	timer_rate = clk_round_rate(csi2phy->timer_clk, link_freq / 4);
>> +	if (timer_rate < 0)
>> +		return timer_rate;
>> +
>> +	ret = clk_set_rate(csi2phy->timer_clk, timer_rate);
>> +	if (ret)
>> +		return ret;
>> +
>> +	csi2phy->timer_clk_rate = timer_rate;
> 
> [Severity: High]
> What if clk_round_rate() returns 0?
> 
> If the clock is disabled or misconfigured, timer_rate could be 0. Later,
> phy_qcom_mipi_csi2_settle_cnt_calc() calls
> div_u64(PSEC_PER_SEC, timer_clk_rate), which would result in a division
> by zero and a kernel panic.

An esoteric ask since you again have to have bugs in your DT but, for 
the sake of not being spammed by a static analysis tool, sure lets check 
for zero.

>> +
>> +	return 0;
>> +}
>> +
>> +static int phy_qcom_mipi_csi2_configure(struct phy *phy,
>> +					union phy_configure_opts *opts)
>> +{
> [ ... ]
>> +	stream_cfg->link_freq = dphy_cfg->hs_clk_rate;
>> +	stream_cfg->num_data_lanes = dphy_cfg->lanes;
> 
> [Severity: High]
> Does this blindly overwrite the DT-parsed lane count without bounds
> checking against the physical layout?

It takes the lanes_count from the controller DT field.

> If a consumer requests more lanes than are physically mapped in the
> device tree, the hardware configuration could iterate out-of-bounds of
> the initialized array elements, repeatedly applying bitmasks for physical
> position 0.

No the value comes from the controller DT data-lanes field but since we 
are consuming data-lanes from the PHY its actually a worthwhile test to 
validate what the controller says to what we have an -EINVAL if they 
don't agree.

> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
>> +{
> [ ... ]
>> +	ret = clk_bulk_prepare_enable(csi2phy->soc_cfg->num_clk,
>> +				      csi2phy->clks);
>> +	if (ret) {
>> +		dev_err(dev, "failed to enable clocks, %d\n", ret);
>> +		goto poweroff_phy;
>> +	}
>> +
> [ ... ]
>> +poweroff_phy:
>> +	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
>> +			       csi2phy->supplies);
>> +
>> +	return ret;
> 
> [Severity: High]
> Does this error path leak the performance state and OPP rate?
> 
> It seems to only disable regulators, completely missing the cleanup for
> dev_pm_genpd_set_performance_state() and dev_pm_opp_set_rate().
> 

When the clocks disable the perf state _should_ drop back but, I will check.

>> +}
>> +
>> +static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
>> +{
>> +	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
>> +	int i;
>> +
>> +	for (i = 0; i < csi2phy->pd_list->num_pds; i++)
>> +		dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], 0);
> 
> [Severity: High]
> Does this leave the OPP frequency vote elevated?
> 
> It doesn't look like dev_pm_opp_set_rate(dev, 0) is called to release
> the OPP frequency vote.
> 
> [Severity: Medium]
> Is the ops->lanes_disable() callback intentionally omitted here?
> 
> Disabling the clocks and regulators without invoking the callback
> bypasses the hardware-specific teardown sequence (like clearing
> CLK_ENABLE and COMMON_PWRDN_B). Could this leave the PHY in an invalid
> logical state for the next power-on cycle?

I mean, when power goes off you loose the state in the regs ... but for 
the sake of completeness sure, I will add this.

>> +
>> +	clk_bulk_disable_unprepare(csi2phy->soc_cfg->num_clk,
>> +				   csi2phy->clks);
>> +	regulator_bulk_disable(csi2phy->soc_cfg->num_supplies,
>> +			       csi2phy->supplies);
>> +
>> +	return 0;
>> +}
> [ ... ]
>> +static struct phy *qcom_csi2_phy_xlate(struct device *dev,
>> +				       const struct of_phandle_args *args)
>> +{
>> +	struct mipi_csi2phy_device *csi2phy = dev_get_drvdata(dev);
>> +
>> +	if (args->args[0] != PHY_TYPE_DPHY) {
> 
> [Severity: Medium]
> Can this access uninitialized stack memory?
> 
> If the device tree node has #phy-cells = <0>, args_count will be 0, and
> reading args->args[0] might yield uninitialized memory, leading to
> unpredictable behavior or the incorrect rejection of valid PHY bindings.
> Should args->args_count be checked first?

I feel the answer is "no" but I'm not averse to checking.

> 
>> +		dev_err(csi2phy->dev, "mode %d -EOPNOTSUPP\n", args->args[0]);
>> +		return ERR_PTR(-EOPNOTSUPP);
>> +	}
> 

