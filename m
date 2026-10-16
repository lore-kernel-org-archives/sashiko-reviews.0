Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3142758E2C6
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 18:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792175509; cv=none; b=o4pbsaene/tJY8DDTOqsP9IENVHXLn61HzlQ0Ia7U8r9EB1pFNmSzATZ3gIdnRJTLl1AzYEBiBkKOvgjp3QlMwVGHfHIQ6ikMXlC0xZgtcAX46MSXSMSygGxw+JEbjrJ+3/+qZ4VdiNBYwzdQV2ucsUTDFn9eZ3s7HnTrB58vMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792175509; c=relaxed/simple;
	bh=04sQwonfurbo4BOea32Zt9xLoudiO0LSI0mstw4NKL8=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Tv/jJZ40Xe//83klqNTnDb85aBkCYtnYMKYoSnO8KMK7YjbjbtfuLETY7z631mum/a0EswdQjVq5bOuHFUSFklH8oLa8g1vcPg0XTQc5SCNxbwCWWdBXBP3XlMLl6/DDbRus9QQ8Sai7rqkwUZb8dGxPM0srWrm2OTlev9ZBj38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=ZrhSzoyA; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="ZrhSzoyA"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AC38482A7F;
	Fri, 16 Oct 2026 20:31:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQzl9y60FTqC; Fri, 16 Oct 2026 20:31:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1792175503; bh=04sQwonfurbo4BOea32Zt9xLoudiO0LSI0mstw4NKL8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=ZrhSzoyAKpDYe4+YPMKwxs0900t3u8XQ2ttWPi8bbpaeUqsblbmzpSnctT2nFnn7Z
	 J4onYGK1qdrEJpcXajb/HhIU+ofGuCPj+VqqCg8Q2YEUsmwm4ZH4npfP+oRpfGB3in
	 evSFPE72WkO46livCtdIfKvOpmInsmV/8VWEkKeHhlKZ7ljgBTrCtktdnsAakuNYRc
	 9ik5E9k4osR6VlQynoGoQpVHOwq7sOTXue/TWj+EzTfuvIv5q8mSrl4G3WMmoHJXgo
	 DUWPhwlzXjByqBUl2Zjvzflf0AaR+pCFgSfxclDcJKcAvOODjMQ4GZAlelvW+F2lif
	 N0a+KeHvGS/IQ==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Fri, 16 Oct 2026 18:31:42 +0000
From: Rustam Adilov <adilov@disroot.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, olteanv@gmail.com
Subject: Re: [PATCH v9 4/6] phy: realtek: usb2: introduce reset controller
 struct
In-Reply-To: <sashiko-outbox-174759@kernel.org>
References: <20261016180314.31760-1-adilov@disroot.org>
 <20261016180314.31760-5-adilov@disroot.org>
 <sashiko-outbox-174759@kernel.org>
Message-ID: <742854ba3f87aee86ea78e3f39f9682d@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-10-16 18:15, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] phy: realtek: register access before reset deassertion causes hang/timeout
> - [Medium] phy: missing reset_control_assert in rtk_phy_exit and error paths
> --
> 
> commit ae1074cfd8fee3a5506c0c9db06f187c80793713
> Author: Rustam Adilov <adilov@disroot.org>
> 
> phy: realtek: usb2: introduce reset controller struct
> 
> In RTL9607C, there is so called "IP Enable Controller" which resemble
> reset controller with reset lines and is used for various things like
> USB, PCIE, GMAC and such.
> 
>> phy: realtek: usb2: introduce reset controller struct
>> 
>> In RTL9607C, there is so called "IP Enable Controller" which resemble
>> reset controller with reset lines and is used for various things like
>> USB, PCIE, GMAC and such.
>> 
>> Introduce the reset_control struct to this driver to handle deasserting
>> usb2 phy reset line.
>> 
>> Make use of the function devm_reset_control_get_optional_exclusive()
>> function to get the reset controller and since existing RTD SoCs don't
>> specify the resets we can have a cleaner code.
>> 
>> Since the vendor usb driver developed by Realtek doesn't assert the reset
>> line (or in their case clear the register bit), we can reasonably assume
>> reset_control_assert is not needed here.
> 
> [Severity: Medium]
> Since this is an exclusive reset control, does it need to be asserted on
> teardown even if the vendor driver doesn't do it?
> 
> If the reset line is never asserted during module removal or driver unbind
> (such as in an rtk_phy_exit() function), could this lead to power leakage
> or unexpected initial states during subsequent driver reloads?

There is still a lot unknown about the IP enable controller and what it really
does, the reset controller is just my best guess. I would ideally not deviate
from what the vendor usb driver did.

>> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
>> index 5e483c853f02f..2ddad7be73534 100644
>> --- a/drivers/phy/realtek/phy-rtk-usb2.c
>> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> [ ... ]
>> @@ -676,6 +678,15 @@ static int rtk_phy_init(struct phy *phy)
>>  	if (!rtk_phy)
>>  		return -EINVAL;
>>  
>> +	if (rtk_phy->phy_rst) {
>> +		ret = reset_control_deassert(rtk_phy->phy_rst);
>> +
>> +		if (ret)
>> +			return ret;
>> +
>> +		usleep_range(5000, 6000);
>> +	}
>> +
>>  	for (i = 0; i < rtk_phy->num_phy; i++)
>>  		ret = do_rtk_phy_init(rtk_phy, i);
> 
> [Severity: Medium]
> If do_rtk_phy_init() fails, the reset line remains deasserted on the error
> path. Should the reset line be asserted before returning the error?
> 
> [ ... ]
>> @@ -1055,6 +1066,11 @@ static int rtk_usb2phy_probe(struct platform_device *pdev)
>>  
>>  	rtk_phy->num_phy = phy_cfg->num_phy;
>>  
>> +	rtk_phy->phy_rst = devm_reset_control_get_optional_exclusive(dev, NULL);
>> +	if (IS_ERR(rtk_phy->phy_rst))
>> +		return dev_err_probe(dev, PTR_ERR(rtk_phy->phy_rst),
>> +				     "usb2 phy reset is not working\n");
>> +
>>  	ret = parse_phy_data(rtk_phy);
> 
> [Severity: High]
> Can calling parse_phy_data() here before deasserting the reset control cause
> a hardware hang or timeout?
> 
> Inside parse_phy_data(), if the SoC configuration lacks a pre-populated
> default value for certain registers, functions like update_hs_clk_select()
> and update_dc_driving_level() will attempt to read from the PHY registers:
> 
> drivers/phy/realtek/phy-rtk-usb2.c:update_hs_clk_select() {
> 	if (phy_parameter->inverse_hstx_sync_clock) {
> 		if (!phy_cfg->page0[6].addr) {
> 			rtk_phy_set_page(phy_reg, 0);
> 			phy_cfg->page0[6].addr = PAGE0_0XE6;
> 			phy_cfg->page0[6].data = rtk_phy_read(phy_reg, PAGE0_0XE6);
> 		}
> 	}
> }
> 
> If the realtek,inverse-hstx-sync-clock DT property is set, it will read
> from the unclocked or reset IP block, which could lock up the system bus
> on many SoCs.

realtek,inverse-hstx-sync-clock property is irrelevant to rtl9607c.
