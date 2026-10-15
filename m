Received: from mail-m81180.xmail.ntesmail.com (mail-m81180.xmail.ntesmail.com [156.224.81.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80D84A7C8B
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 08:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.224.81.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051482; cv=none; b=jfY9pOtMguGTf9TWNhTcWhHFT7GZffdXYMp8weMvs98alQFHU/frGizqFJLm1GP7aO2GJHzUf8s5uZkSU8OQqKKwOsXeGAMU1EzIV/13eyt5yBDcwitfin7VEJCDYlcjhGDro5khUY5csGrDHleb4sAdPF7YHvwF6qOo67Qu5yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051482; c=relaxed/simple;
	bh=LIH+3hEn0FCeFwMec+lLcxS6uMG+suzCj/s8G8LZL4A=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QD6ERRQKYj/vClqy+mQTJmX2b45t8FRtUdoGWpGmu3zjquKrc5N3PZnXflLxGZWxxM7xx2a/nGo9smF3GRvHrLNpZf56H1KiD9llXhNIBc+cGM3w7X8wv1Z/Qt9U5P1FMKMy9S2i7yTDSxS1NV1XS4p8GiP9A/9iyfX59TMqaP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=cJMO0Vwe; arc=none smtp.client-ip=156.224.81.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="cJMO0Vwe"
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 51250dbfb;
	Thu, 15 Oct 2026 16:04:29 +0800 (GMT+08:00)
Message-ID: <f591b5d6-7b1a-4809-abee-cbed2bc459f0@rock-chips.com>
Date: Thu, 15 Oct 2026 16:04:28 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-phy@lists.infradead.org,
 vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
Subject: Re: [PATCH] phy: rockchip: snps-pcie3: Raise the SRAM init timeout
To: sashiko-reviews@lists.linux.dev
References: <1792047775-77954-1-git-send-email-shawn.lin@rock-chips.com>
 <sashiko-outbox-172383@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <sashiko-outbox-172383@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa13e975c6503a4kunm47e1739f3d6e66
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0sdVhpKTR9JGBlIHUpKHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=cJMO0VweG/T5yRt7FErK+SVAwidYKvcb5nc7uNQI7YeWUNmqA16c3B61biCv4LwosDKYjk3uSWAzLMpk0yjfMGaSXGc2CKK9qb17IqBWLt05JqTuoGKoekrqXiDT3/Vfykr+S1UYcgHlYEX5GAL44M8ROK8K+pTSjZsxBsMVpUg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=qErlt+Zfw58/S/txB3SmkUfodQ0lNxdV+wY7hQt4lk8=;
	h=date:mime-version:subject:message-id:from;

在 2026/10/15 星期四 15:12, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] phy: rockchip: 20ms busy-wait loop in SRAM init polling stalls CPU
> --
> 

...

>> -				       0, 500);
>> +				       0, RK_PCIE_SRAM_INIT_TIMEOUT);
> 
> [Severity: Medium]
> When the sleep_us parameter is 0, regmap_read_poll_timeout() uses cpu_relax()
> and tight-loops instead of sleeping.
> 
> With the timeout increased from 500us to 20,000us (20ms), does this create an
> excessively long busy-wait that could stall the CPU?
> 
> Since this initialization runs during driver probe or PHY power-on, which
> happen under a mutex where sleeping is permitted, would it be better to provide
> a non-zero sleep interval (like 1000) so the CPU can be yielded during this
> extended 20ms wait?
> 

Good catch, will respin v2 to address it.

>>   	if (ret)
>>   		dev_err(&priv->phy->dev, "%s: lock failed 0x%x, check input refclk and power supply\n",

...

>>   	ret |= regmap_read_poll_timeout(priv->phy_grf,
>>   					RK3588_PCIE3PHY_GRF_PHY1_STATUS1,
>>   					reg, RK3588_SRAM_INIT_DONE(reg),
>> -					0, 500);
>> +					0, RK_PCIE_SRAM_INIT_TIMEOUT);
> 
> [Severity: Medium]
> And since this second poll runs immediately after the first one, could we end
> up busy-waiting for up to 40ms in total if both lanes are slow to lock?
> 

The two PHY lanes share most of their circuitry in both aggregation and
bifurcation mode, so in practice once the first PHY locks the second one
can be assumed to lock as well. The two sequential polls therefore do
not add any noticeable delay. I will add a comment into the commit
message for reference.


>>   	if (ret)
>>   		dev_err(&priv->phy->dev, "lock failed 0x%x, check input refclk and power supply\n",
>>   			reg);
> 

