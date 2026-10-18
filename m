Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B861038F954
	for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.21.61.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314274; cv=none; b=erur1Gy7y2c9Dp+nzZjDgESt3xo41DlQbHzz6+b1mSc5jtCFaRuOklj78mIl9NgWM/uw+T06EwA6RPiZDrErw2N58stUFkNoMtiYLa7J3X51rLAYH1Sh6+Er5NdP0S2dlvaXcjYV+RyQipCWLp9ZIuDvmn6jY0W69dXXhyquIcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314274; c=relaxed/simple;
	bh=7JSwmRHMeCpoRpZ+V304C3rcHX1ouKohB9jQ8dpXb9U=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=e5cc5b3GCT9Av3FVL/FAlpdVpFEGCcf30e90dCRdng1ICKbDQkXEJ+VR3rxIALFCyF+tWC1yB+cW9sWdB1J2TZXMuLJwjBxLq+/6RhSjNqSlhHr1nCbPxs7oRtHGaMcE5tXeASKjzzep7FoqRrN3qoZQqPgFXg4FSiXk5lq2aIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr; spf=pass smtp.mailfrom=aliel.fr; dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b=WAHDuXaE; arc=none smtp.client-ip=65.21.61.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.b="WAHDuXaE"
Message-ID: <dda4b297-6dd1-42ba-8332-80c22b741e29@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1792314262;
	bh=7JSwmRHMeCpoRpZ+V304C3rcHX1ouKohB9jQ8dpXb9U=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=WAHDuXaE0WHGgKo+PmYG9T25fFEMovyLJcTPtnJRvFdFYtHYf3YTdflYEMIh8zIE3
	 +LdKHLcDAOMgJhkAdDnijhoIpaC3Oc5MazTWCdQTqTgR80D37gwRBPdfTQt1dEuA+d
	 EVK3r6qspQ7JhJSQBIcUT+3+ReekxuqYYj7tfEyI=
Date: Sun, 18 Oct 2026 11:03:06 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v7 2/4] arm64: dts: amlogic: t7: Add thermal sensor nodes
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org
References: <20261016-add-thermal-t7-vim4-v7-0-6eede5450fd4@aliel.fr>
 <20261016-add-thermal-t7-vim4-v7-2-6eede5450fd4@aliel.fr>
 <sashiko-outbox-174722@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-174722@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/16/26 7:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] thermal: amlogic: system hang due to MMIO access before clock enable
> --
> 
> commit d943dedd550441fdf5ee6b1eb6eb97f02aac1ef7
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> arm64: dts: amlogic: t7: Add thermal sensor nodes
> 
> This commit adds six temperature sensor nodes to the device tree using
> the amlogic,t7-thermal compatible. The nodes include references to their
> required clocks and calibration data from the secure monitor.
> 
>> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> index 8aa85aab30469..c81632d3984e8 100644
>> --- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> +++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
>> @@ -696,6 +696,26 @@ sec_ao: ao-secure@10220 {
>>  				amlogic,has-chip-id;
>>  			};
>>  
>> +			a73_tsensor: temperature-sensor@20000 {
>> +				compatible = "amlogic,t7-thermal";
>> +				reg = <0x0 0x20000 0x0 0x50>;
>> +				interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>> +				clocks = <&clkc_periphs CLKID_SYS_TS_A73>, <&clkc_periphs CLKID_TS>;
> 
> [Severity: High]
> Does adding this thermal sensor node expose an initialization order bug
> in the driver that causes a system hang?
> 
> In drivers/thermal/amlogic_thermal.c:amlogic_thermal_probe(), the thermal
> zone is registered before the hardware clocks are enabled:
> 
> 	pdata->tzd = devm_thermal_of_zone_register(&pdev->dev,
> 						   0,
> 						   pdata,
> 						   &amlogic_thermal_ops);
> 	...
> 	ret = amlogic_thermal_enable(pdata);
> 
> During registration, the thermal core synchronously queries the temperature
> via the driver's .get_temp callback (amlogic_thermal_get_temp()), which
> performs an MMIO read via regmap_read() on TSENSOR_STAT0.
> 
> Since the driver enables the required peripheral clocks after the thermal
> zone is registered, executing this MMIO read before the necessary bus clocks
> are enabled will stall the AMBA bus and hang or reboot the system.
> 
> [ ... ]
> 

This is pre-existing and can be managed outside of this series.

-- 
Best regards,
Ronald
