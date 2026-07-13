Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF683B95E3;
	Mon, 13 Jul 2026 23:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985243; cv=none; b=LzorIFQZvx+hyXhfT6DmoSHrQAEn6f8pSowg+5OsEGE6OV/YO/yd3VVuWj7fLOjki7HuneILtLDgkAWou6LsyaZvHlhRtf+rKPwHIUs3T2T/wwYvrJ93ij+cDowLzfEd94KC6ZHcopt2rDBdEwcAB0dF5xSdEj+bMOd36DVJpUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985243; c=relaxed/simple;
	bh=XJf98y7AoS4YfUWnQO9snJ/cXMlzoIoxg3AYArm9QYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+jkcp9+IJSxVFrJL78j+4DZtvoTn9GtL5ezk0BWrJ9Wh7CU37z3UL7qvuWoBCLvTxN+9JEg7sZG0J8xe5d+RsSlA6coVeSLcUjF9CbJo3BK6t+ZO2BRBiupUpkCxqey6cLl7C4JGa8S+iJrgaW0JOuT52uCrTXDMJgPUBjbqf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=gMJEvuUq; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="gMJEvuUq"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B96471199D6;
	Tue, 14 Jul 2026 01:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783985239;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=o/GWt+QYwjps3nuPm/JnZPXVZxL4jie70yU+1vvQkXQ=;
	b=gMJEvuUqg81bjNsTgnh035UVY7LVDJJ10izi42gcm5MqLgScHqnlrL94Sqsu7Dd/qlDrgG
	BdFv2bv0ghsc9Vahy2lYASm/Q4TSVxDf2oGv9y+e8KUzif9cFxzJ9wgCtgKyUCY4wLz/f6
	wkLg7/LeY3DQfXMwQDJFtnWR9yGSUbSoXgoak/QOl8pGe/p/aX/TzFn076rsXed4505q02
	/9qRGm5iqObje5ilJCmnP/SpTw0rQeg2X6r6aUEJTfbvVuF38mIDeEWn04OkaSSY7pdi4P
	sWARCur1GDh+AIFrl15OHEtM1yIGRjQguqJkqLHixaJcYNq6yZc9c66nWRcLoQ==
Message-ID: <aa134d00-df3d-4f0a-a598-4aea512d3cd0@nabladev.com>
Date: Mon, 13 Jul 2026 18:41:02 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/6] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs
 for Data Modul i.MX8M Mini and Plus eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260705200534.151803-1-marex@nabladev.com>
 <20260705200534.151803-6-marex@nabladev.com>
 <20260705202221.E99291F000E9@smtp.kernel.org> <alUJIlUUo98_x0Lm@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <alUJIlUUo98_x0Lm@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/13/26 5:49 PM, Frank Li wrote:
> On Sun, Jul 05, 2026 at 08:22:21PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>> - [High] The SAI2 interface is incorrectly configured with `fsl,sai-asynchronous` and an invalid `fsl,sai-bit-clock-swap` property, leading to audio capture and playback failure.
>> - [Medium] The overlays instantiate new `clock-controller` nodes at the exact same unit addresses as the existing `sai5` nodes, causing DTC warnings and resource conflicts.
>> - [Medium] Missing interrupt override for the PCA9554 GPIO expander in the i.MX8MP overlay causes the device to listen on a dead interrupt line.
>> - [Medium] The commit message claims features that are not implemented in the patch.
>> --
>>
>> commit 1e6ee57031100e82b436dac299b0eed194860d5b
>> Author: Marek Vasut <marex@nabladev.com>
>>
>> arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>
>> This commit adds device tree overlays for the eDM-MOD-iMX8Mm-FIO1-Audio
>> feature connector expansion module. It provides support for the SGTL5000
>> codec, CAN, I2C, SPI, and other peripherals on the i.MX8M Mini and Plus
>> boards.
>>
>>> Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1-Audio
>>> providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout and
>>> SGTL5000 codec. This adapter can be optionally populated onto the eDM SBC.
>>
>> [Severity: Medium]
>> Is the commit message accurate regarding the features provided?
>>
>> The FIO1-Audio overlay only seems to enable a single UART (uart2, while uart4
>> is disabled) and doesn't contain a pwm-beeper node or PWM pin configuration.
>>
>> Could the commit message be updated to reflect only the features actually
>> implemented in this variant?
>>
>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
>> [ ... ]
>>> +	gpio_feature: io-expander@20 {
>>> +		compatible = "nxp,pca9554";
>>> +		reg = <0x20>;
>>> +		#gpio-cells = <2>;
>>> +		gpio-controller;
>>> +		#interrupt-cells = <2>;
>>> +		interrupt-controller;
>>> +		interrupt-parent = <&gpio5>;
>>> +		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
>>
>> [Severity: Medium]
>> Since this file is shared between i.MX8MM and i.MX8MP overlays, does the
>> interrupt configuration need to be overridden for i.MX8MP?
>>
>> On the i.MX8MP baseboard, this feature connector signal seems to be physically
>> routed to GPIO1_IO08 instead of GPIO5_IO04. The i.MX8MP overlay doesn't
>> currently override these properties for gpio_feature, which might cause the
>> expander to listen on a dead interrupt line.
> 
> please check this

Its GPIO5_IO04 on both MX8MM and MX8MP.

>> [ ... ]
>>> +&sai2 {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&pinctrl_sai2>;
>>> +	assigned-clock-rates = <24576000>;
>>> +	fsl,sai-asynchronous;
>>
>> [Severity: High]
>> Does disabling internal synchronization between the TX and RX halves of the
>> SAI block break audio?
>>
>> The SGTL5000 codec only has a single set of I2S clocks, and the pinmux
>> settings only route one clock pair. This leaves the other half of the SAI
>> physically disconnected from any clock source.
>>
>> [ ... ]
>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
>> [ ... ]
>>> +&sai2 {
>>> +	assigned-clocks = <&clk IMX8MM_CLK_SAI2>;
>>> +	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
>>> +	fsl,sai-bit-clock-swap;
>>
>> [Severity: High]
>> Is fsl,sai-bit-clock-swap intended to fix the asynchronous clocking issue?
>>
>> This property is a downstream vendor leftover that does not exist in
>> mainline device tree bindings and is ignored by the upstream fsl_sai.c
>> driver. Should fsl,sai-asynchronous be removed from the shared .dtsi
>> instead so the SAI can operate in synchronous mode?
> 
> Please check this ?

dc06cf4268a4 ("ASoC: fsl_sai: Add RX/TX BCLK swap support") implements 
"fsl,sai-bit-clock-swap" so this is AI being confused.

>> [ ... ]
>>> +&spba2 {
>>> +	#address-cells = <1>;
>>> +	#size-cells = <1>;
>>> +
>>> +	sai5clk: clock-controller@30050000 {	/* SAI5 */
>>
>> [Severity: Medium]
>> Does declaring a new node here cause a duplicate unit-address warning and
>> potential resource conflicts?
>>
>> The base SoC .dtsi files already define sai5: sai@30050000 at this exact
>> address. Because the node names differ (clock-controller vs sai), DTC will
>> create two distinct sibling nodes rather than merging them.
>>
>> If the baseboard enables the existing &sai5 node, both drivers could attempt
>> to map the identical physical MMIO region using devm_platform_ioremap_resource,
>> causing a -EBUSY error. Should this overlay reference the existing &sai5 node
>> by label instead?
> 
> Make sense, please check it.
No, it won't, the other node is sai@... so this is a non-issue too.
