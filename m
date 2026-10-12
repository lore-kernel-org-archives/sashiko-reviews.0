Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A174D0A0D
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 18:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829386; cv=none; b=P5sMEOUTIolA7n0YJZdoQ1+yEIQuJhKXZAlyqcqRFaltHAZIZ1aCNAhj298ihiJ+vfAirDnfGHRMBZHwakiiM/jI1L/CDHOJWC22I4ANfHnRCOnUtWgHvWd/+hrIQ8QWqAGNczxrWuaOGH1InfOg0T0wIXc8PEoCelpetiu6wD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829386; c=relaxed/simple;
	bh=Rv23X6bDaEgg7e13p58gKtt260VDqekwLQbSEoisScE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=PKksDov+bI6RtociX0GYbDm0FgVLuYrFCA/96W+gDVJbHQNut/h4qB1SJ2ZFjPgeOr50qNukV0zTUSWDcYdTRkzCk+CFZU4KFBVf+TxjH9ZCksHXwKLLw/ohCzS+byDXWzKbZW6c8bORUY2+rI7U/OynVHmxCKlK4fR8ZIO8Pi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=fh67C8oa; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="fh67C8oa"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 5D3BB80928;
	Mon, 12 Oct 2026 20:22:57 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yYmsGjDpRsO4; Mon, 12 Oct 2026 20:22:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791829376; bh=Rv23X6bDaEgg7e13p58gKtt260VDqekwLQbSEoisScE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=fh67C8oaLsS/4xnwtkIocLnNrL/frc9M3JglJVQCHpP6igU1YZo5Jj6ezTL55XIGz
	 uPmoCRvAC9hkUEAkrIESXMFcvWYew2hmwyxAOiG9Uzc13XHl6A0z+z303JSraD9Rth
	 8QR9vPqm83umVIhB3uy4UvS3BkAfBY20IHkyhyaS6k9pDJtm4dtV3s4E8lfY7HXeXu
	 EzEVWXRDeh23XGQOb7QqYjmxgVNJzqn+gXtBmCFDojLL3K9AiQQwNvJ20/gswcuiux
	 LtLaAWF/+Z+/GtU1Bmpjt46XbWzXF4/AZsIE2fc3Iuzq6uiRdPKgUdz51lUYv/ifb7
	 PGKu4ZW4ph9Xw==
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 12 Oct 2026 18:22:56 +0000
From: Rustam Adilov <adilov@disroot.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, olteanv@gmail.com
Subject: Re: [PATCH v8 1/6] phy: realtek: usb2: introduce phy_reg_desc struct
 to the driver
In-Reply-To: <sashiko-outbox-168495@kernel.org>
References: <20261012173739.36377-1-adilov@disroot.org>
 <20261012173739.36377-2-adilov@disroot.org>
 <sashiko-outbox-168495@kernel.org>
Message-ID: <8af219f842092d37b57100bd25e7c5b6@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2026-10-12 17:49, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] phy: realtek: data race between debugfs and PHY ops corrupts hardware state
> --
> 
> commit d16c7943f8b3fd4b0cfe55fc75ec12d09511eaf4
> Author: Rustam Adilov <adilov@disroot.org>
> 
> phy: realtek: usb2: introduce phy_reg_desc struct to the driver
> 
> This commit introduces a phy_reg_desc struct to the realtek usb2 driver. It
> stores per-SoC differences such as register offsets and busy bits. This
> avoids duplication in driver data for RTL9607C and RTD SoCs.
> 
>> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
>> index 248550ef98cab..e8d0f0119ec0a 100644
>> --- a/drivers/phy/realtek/phy-rtk-usb2.c
>> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> 
> [ ... ]
> 
>> @@ -190,29 +199,31 @@ static int rtk_phy_write(struct phy_reg *phy_reg, char addr, char data)
>>  	unsigned int val;
>>  	void __iomem *reg_wrap_vstatus = phy_reg->reg_wrap_vstatus;
>>  	void __iomem *reg_gusb2phyacc0 = phy_reg->reg_gusb2phyacc0;
>> +	const struct phy_reg_desc *reg_desc = phy_reg->desc;
>>  	int shift_bits = phy_reg->vstatus_index * 8;
>>  	int ret = 0;
>>  
>>  	/* write data to VStatusOut2 (data output to phy) */
>> -	writel((u32)data << shift_bits, reg_wrap_vstatus);
>> +	writel((u32)data << shift_bits,
>> +	       reg_wrap_vstatus + reg_desc->vstatus_offset);
>>  
>> -	ret = utmi_wait_register(reg_gusb2phyacc0, PHY_VSTS_BUSY, 0);
>> +	ret = utmi_wait_register(reg_gusb2phyacc0, reg_desc->vstatus_busy, 0);
>>  	if (ret)
>>  		return ret;
>>  
>> -	/* VCtrl = low nibble of addr, set PHY_NEW_REG_REQ */
>> -	val = PHY_NEW_REG_REQ | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
>> +	/* VCtrl = low nibble of addr, set reg_desc->new_reg_req */
>> +	val = reg_desc->new_reg_req | (GET_LOW_NIBBLE(addr) << PHY_VCTRL_SHIFT);
>>  
>>  	writel(val, reg_gusb2phyacc0);
> 
> [Severity: Medium]
> Can this multi-step state write be interrupted and corrupted by concurrent
> debugfs accesses?
> 
> A user with root privileges reading the debugfs file parameter via
> rtk_usb2_parameter_show() in drivers/phy/realtek/phy-rtk-usb2.c repeatedly
> calls rtk_phy_set_page() and rtk_phy_read() without acquiring any
> driver-specific lock:
> 
>     /* Set page 0 */
>     phy_data_page = phy_cfg->page0;
>     rtk_phy_set_page(phy_reg, 0);
> 
> If the kernel concurrently executes a PHY state change (such as
> rtk_phy_connect() or rtk_phy_init()), could their register accesses collide
> and corrupt the PHY's internal register access state machine?
> 
> Additionally, since struct rtk_phy lacks a reference to struct phy, it
> appears the debugfs callback cannot acquire phy->mutex. Is there another way
> to synchronize these accesses?

This goes into a pre-existing issue territory, i.e not related to this patch
series at all.
