Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D16A1DFFD;
	Thu, 30 Jul 2026 20:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785443570; cv=none; b=UqAM4lqp/WJ4RbVeKA3cX0GmauZQAPEMOc/u36gAmmjNYTN5x4EM+pod/wq4KTCB1XBFs5bfbnnUSdj2tHrrhigwRPpISWqjKtOBBXvzlIBFrMv8UAWwhF7Hi2v0QzgcuJcDdWL/QGZ0afGaN9Vxku/khuObS/tyN9Dwl/WyPXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785443570; c=relaxed/simple;
	bh=ssZHAlsxyvQuC8OhjIkUoOHqzKXaknTXbYFj5hoAWak=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RbTAXtlvYQIfe+n246jUTqmZUR+dy9tuBi/FMqJbcOOG7TgQ7fyh5uhPLeZ1Zo9+8UXw5EfKvhPCr87K6eykRQf0oKVAbeyC4BMVgtSyQSaTOnzafcfhBG7tcwIHVvt+KBNQUfHQHr+YLbv0QuRwDRPNyzh094BNRSBajHRfa9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Rez1aG3F; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Rez1aG3F"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7AA5411B93C;
	Thu, 30 Jul 2026 22:32:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785443558;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=8XbmfUF0rihk8kxhDWiWMPqWi56oby+o5/c++7iMamc=;
	b=Rez1aG3F3ibFdrHs3m2tM7fc5sMJLogDidXcJje6OCzd6COP29GiLND8wVmq+Am75epPmM
	0tGxmqfsFQIP5AXiGjDMoJFm1zPh6m+vDFlBJUmMqTxaRkpO5KECTcbQISdxwdz0IqV+9X
	SB9b6bTxEH7kh/GZlYe8fceVt82GeuIj21BrBgOXWIVt6iC40daZNlv/5UsjtsGcEK9DWw
	aMzdNqS4BbpPFmC2c9Ep1yOlDgg6+jI8XW3PXOrg38vqCMroxOJ4UyYuGdZCoYysY40Q8G
	vidisfidonIjuxp0yqp/5k5N8xYq34rlocr19yGPKH3wTyMTk8u9QyGvufQ3BA==
Message-ID: <e4f9ef42-d752-4563-a86b-4c62f47e43ac@nabladev.com>
Date: Thu, 30 Jul 2026 21:34:43 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs
 for Data Modul i.MX8M Mini and Plus eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260729214723.557461-1-marex@nabladev.com>
 <20260729214723.557461-7-marex@nabladev.com>
 <20260729221033.3CDB41F000E9@smtp.kernel.org> <amtq-Ukw_dyvavxJ@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <amtq-Ukw_dyvavxJ@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/30/26 5:17 PM, Frank Li wrote:

Hello Frank,

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
>> [Severity: High]
>> Does this interrupt routing conflict on the i.MX8MP baseboard?
>>
>> The shared overlay hardcodes the PCA9554 interrupt to GPIO5_IO04, which is
>> correct for i.MX8MM. However, on i.MX8MP, this pad (SPDIF_RX) is physically
>> routed and configured for CAN1_RX.
>>
>> Could this cause the GPIO expander interrupts to fail and CAN traffic to
>> trigger spurious GPIO interrupts when loaded on the i.MX8MP? Would it be
>> better to override this interrupt in the i.MX8MP overlay?
> 
> Yes, I check flexcan1 use this pad at i.MX8MP. you need disable flexcan1
> at i.mx8mp's dtso file.

I'll fix that in V8.

[...]

>>> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
>> [ ... ]
>>> +	sai5clk: clock-controller@30050000 {	/* SAI5 */
>>> +		compatible = "fsl,imx8mm-sai-clock", "fsl,imx8mq-sai-clock";
>>> +		reg = <0x30050000 0x10000>;
>>
>> [Severity: High]
>> Can this cause a devres memory region conflict during driver probe?
>>
>> This overlay adds a new clock-controller node with the exact same unit address
>> and register range as the existing sai@30050000 audio node.
>>
>> Since both drivers will use devm_platform_ioremap_resource() to request the
>> region exclusively, whichever probes second might receive -EBUSY and fail.
> 
> at imx8mm.dts, 30050000 is SAI5, here you change to to use clock-controller
> 
> Suppose address here is wrong.
This is correct and we already discussed this in V4, the SAI here is not 
used as an audio controller (not using sound/soc/fsl/fsl_sai.c driver), 
but as a clock controller (yes using drivers/clk/clk-fsl-sai.c driver), 
the bindings differ, hence this node.
