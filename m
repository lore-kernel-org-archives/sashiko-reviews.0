Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6284D37B3
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 18:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829562; cv=none; b=TSB6q8XKGcZ24lwkYAJ8AYmHfFR097lgDqdeE1+715bvyC8yz7MYr3U5eQDCmt3arem6YVys1P1gysqPxj4yxt6unwKF7UTHP9EyDZjih9sCAwH9vr2m5R01DISzG9nCB5mZWzrsGhehUPJCATaA2ffW8TkqU1Jm2ESeyEGxXRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829562; c=relaxed/simple;
	bh=KYwGODAjDP0sASE+8WP2R90caRCtyUktTX4vFh6LvhY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=garDS/WOUqVmY183MEWJhj1muKeOS1rvYFfvljzS6rcrSlVSlTa/701ulSTsOA/q/uxl26Q5/TddP8zo71UFSMdddBCdkMyJlBJsAwMvYwAcPkyW+4Imnr47swUh5LUS6sN76goxt4oxfPLPzW6jauiKGQViiunY2oLc1lQBQ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=BhkWXroa; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="BhkWXroa"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id EB3AE80BA1;
	Mon, 12 Oct 2026 20:25:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFduJ8gHuAow; Mon, 12 Oct 2026 20:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791829557; bh=KYwGODAjDP0sASE+8WP2R90caRCtyUktTX4vFh6LvhY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=BhkWXroaqx4Hq82xv9wyvpw6p0UIaVdCEZuau+OzpggPIyC62W3PKocdyyWHJTUk+
	 FkVBbqYuXbPbhxuWRNoDJFggQ8FVUedWXXqrspPyybDvkdS3/gZZlGoKgwvnVSl5dj
	 a39xrKE3av3EDUSiBXWpTuWuctz/sryRmTp7W4ktJMtQd18CjD8MxEsOjFPHtMFrUo
	 gcysCPYH6un+SqxUOx0jV8ZsmzjXi6Zw+3DRmZu6ft0hiWmWZTnNJw09rFUZtvfB2i
	 0qv7DypJ6LXR+qzRrZnF6Kn1CEf/fMp6czZZWSe8h04a91vCcDwPtKQMMC6InY2LNN
	 oif3H/5x3V+Iw==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 12 Oct 2026 18:25:56 +0000
From: Rustam Adilov <adilov@disroot.org>
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, olteanv@gmail.com,
 linux-phy@lists.infradead.org, vkoul@kernel.org
Subject: Re: [PATCH v8 5/6] phy: realtek: usb2: add support for RTL9607C USB2
 PHY
In-Reply-To: <sashiko-outbox-168528@kernel.org>
References: <20261012173739.36377-1-adilov@disroot.org>
 <20261012173739.36377-6-adilov@disroot.org>
 <sashiko-outbox-168528@kernel.org>
Message-ID: <f48943049c87c233f2f6f3a1a156cacb@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-10-12 18:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] phy: missing NULL check for of_iomap leads to dereference
> --
> 
> commit ab09dd4def3f2215950726cb780ea645be439c3a
> Author: Rustam Adilov <adilov@disroot.org>
> 
> phy: realtek: usb2: add support for RTL9607C USB2 PHY
> 
> Add support for the usb2 phy of RTL9607C series based SoCs. Add the macros
> and phy config struct for rtl9607. RTL9607C requires to clear a force host
> disconnect bit in the specific register before proceeding with phy
> parameter writes.
> 
>> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
>> index 2ddad7be73534..64076938c821d 100644
>> --- a/drivers/phy/realtek/phy-rtk-usb2.c
>> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> 
> [ ... ]
> 
>> @@ -600,6 +617,23 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
>>  		goto do_toggle;
>>  	}
>>  
>> +	if (phy_cfg->force_host_disconnect) {
>> +		const struct phy_reg_desc *reg_desc = phy_reg->desc;
>> +		void __iomem *vstatus = phy_reg->reg_wrap_vstatus;
>> +		u32 temp;
>> +
>> +		temp = reg_desc->read(vstatus + PHY_9607_FORCE_DISCONNECT_REG);
> 
> [Severity: High]
> Is it possible for vstatus to be NULL here?
> 
> In parse_phy_data(), the driver calls of_iomap() and assigns the result without
> checking for a NULL return value:
> 
> parse_phy_data() {
> 	...
> 	phy_parameter->phy_reg.reg_wrap_vstatus = of_iomap(np, 0);
> 	...
> }
> 
> If the device tree node lacks the memory region or mapping fails, vstatus
> will be NULL. Unconditionally dereferencing it here via reg_desc->read()
> could cause a null pointer dereference.
> 
>> +
>> +		/* disable force-host-disconnect */
>> +		temp &= ~PHY_9607_FORCE_DISCONNECT_BIT;
>> +
>> +		reg_desc->write(temp, vstatus + PHY_9607_FORCE_DISCONNECT_REG);
>> +		temp = reg_desc->read(vstatus + PHY_9607_FORCE_DISCONNECT_REG);
>> +
>> +		/* allow IP to startup */
>> +		usleep_range(10000, 11000);
>> +	}
>> +
>>  	/* Set page 0 */
>>  	phy_data_page = phy_cfg->page0;
>>  	rtk_phy_set_page(phy_reg, 0);

Why is this not tagged with pre-exesiting issue just like with the previous
review on patch 1..

Not related to this patch series at all.
