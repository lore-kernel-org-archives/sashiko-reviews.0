Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD222C21D9
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 02:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785207520; cv=none; b=HskOZpFeMKfdv/U6iLTN41hAQSrrvl7YPulvjTL2h2bmhNokJMYy4Tr22sf0+WYF6mWII7pSUEdCCA/29FQeWVAEfXw+qlK7QVPZcvzIh8pc4Xzb25kDFWQ5udMndZBBKzHsILEo5lcJL9Q9M88BAJwZDphCXpm1fnMgld7+Jvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785207520; c=relaxed/simple;
	bh=n5UoZL2wb83PkAUD6T96dvq5LT7Om3pjVqKuJQ8CYKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5TQR8Fy0EHUdLYdY5/qJBcyfYVAXWD6zqUspN3waSOFzcsJKteMp80suvqrmBx2bS/5RB5vY0mhqffkYlHvnBdTMcvLZZ1804DTxvh3PJwT4HSdVwC4UpIjd0ApYP1ShLDucI4BYJBn02E+jrcSGL5ztdwbJFwItar38yDa/ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H8/4Mlqf; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H8/4Mlqf"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848643382fcso3311987b3a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 19:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785207518; x=1785812318; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXc32F38MmKZTmXMK9yqhLkQilQPpMqwdQShzx5K5q8=;
        b=H8/4MlqfxBYuGXvIo+auiZNhtBRv8tCAQct98Z2DJilZObn0UPJ8x6bM3pNHOJWNhz
         51x7cGxvShxKx9slzqK4g/h9YlD/a5I/hyuKvDTuF74QIdseQjtd5kuBcx+iW13NwhcY
         C5x7lnt+hbk7CdVBKTEGJmW/RfT/slYWFa2giGhZlTAZ2wQQJouVPFHS3GMvReIqOzCC
         6HBZ0OEq+DRmAqRnhnZl7/sB6QHb45Tgs29Jx5Y/itw7zd+AkPUIkjLaOi6YvAibM1DI
         dRCWce00y40E+vjkWWGxGrgr/IjdP176hp2qExVbri73kA6dlPKH9epsE1xyTSS+6djs
         /rpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785207518; x=1785812318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXc32F38MmKZTmXMK9yqhLkQilQPpMqwdQShzx5K5q8=;
        b=NYdmzKFz0GjZwmJSXBrBdnUkAipASospeNI07ITszZmabMue+FGWu96jL0+8UFA+1f
         3W4/oTAol8QYbTbiyWdCx9oxpscAKDZEf/4wjTSDnYP+uuGm0iuiRO6/AX23g8rXYqpO
         AK97KQa5wdVeMO3Ndyk+mYGS6imLr17tlyPsX3BYHyPebh/5xjCg84DoJFLrEFeAgyBF
         nlQB/tPU6WqhP4u9VSCJFLTHZosbM16dO4nqd4awhDddEY+NvydMmyjWTA313Vayjp3V
         X6yFD9uj4m7n3lHGBJqkYsLkHhsH7vfOGgTPnLnheQyleceBhbfp5SeLX8A/H6NpPytp
         CEYw==
X-Gm-Message-State: AOJu0YyCk1netu9meTLwWYAxDiPOxBddtozYNd60WOw5wK0FYlvb9MVo
	JGgFzlRF/Y+3736U00UWqrYmsXD3e9L4L+f5u6DwWC7aA90ZsPj9Xj6A5RSACA==
X-Gm-Gg: AR+sD10flz1jng8zQoVpf50LnKxkqlpT4FcrOQAGARsBA8nytUl/UmUcxyg3E0m7zkg
	Oh7BVJBBUCJpG+tM+qlMcW2fBykO99sqrLuP5M0pxi3O7vsO7jogP9/FMy2V2q8SMAVfxZCeU5b
	fXv4xNMsv03Z23JO+ELYUIQl8xT4HkYtPe8h+aBIX4jolWCzRzZwDANKyK4XnRfC434rCksaEh+
	l5eTSpbpYWRlAKfqMBjXhD808sbPMFiHtAc4QYuRKVlvw+SM1z0NDXczk1TzR6+JeNaViQaliOa
	0GEEcSXDYzT8O92FjoStYbvOVfSisNVEbWn1f74q2n0Y2j/IexCdEdQLrNFAtAZqkpZWE4+9Srh
	4Yk9VgYlPjkXsJzrnxBO4QHaC01X5m8mv8MqRkktRP3JQLFANvNCTad0a+kWoVl2tQuxRrrU6BB
	17O7e363ygeLMxufM3R+perkHl8x3oFOUYJTvmEIbXsIzV7hEzEMCZiOtU0lQMfidQARw9Lqfhp
	WzK5dsTpefQ5a2idkooSg89EPfbY2SAONPm
X-Received: by 2002:a05:6a00:2d03:b0:848:2f73:8ffd with SMTP id d2e1a72fcca58-84e93378c58mr462507b3a.70.1785207518364;
        Mon, 27 Jul 2026 19:58:38 -0700 (PDT)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e583sm3710262b3a.57.2026.07.27.19.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 19:58:37 -0700 (PDT)
Message-ID: <d117c544-1566-453d-880e-c4d903e09e23@gmail.com>
Date: Tue, 28 Jul 2026 10:58:35 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] watchdog: Add Nuvoton MA35D1 watchdog driver
 support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260724091427.1689980-1-zychennvt@gmail.com>
 <20260724091427.1689980-3-zychennvt@gmail.com>
 <20260724092454.EE24D1F00A3A@smtp.kernel.org>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260724092454.EE24D1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



sashiko-bot@kernel.org 於 2026/7/24 下午 05:24 寫道:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Writes to REG_WDT_CTL are missing required hardware synchronization waits (SYNC bit), risking dropped writes and hardware state corruption.
Not applicable. SYNC only used for the change of WDTEN.

> - [High] The watchdog timer is not paused during system suspend if it was running from the bootloader but not yet opened by userspace, leading to unintended system resets.
Fixed. Added a check for watchdog_hw_running.

> - [High] Driver fails to synchronize the hardware timeout with the software configuration when inheriting a running watchdog during probe.
Fixed. Added set_timeout() before devm_watchdog_register_device().

> - [High] Read-modify-write operations on REG_WDT_CTL inadvertently clear W1C (Write-1-to-Clear) status flags, leading to lost interrupts and wakeup events.
Not applicable. As noted in the cover letter, this does not affect the W1C flags.

> - [Medium] In ma35d1_wdt_resume(), the driver writes to REG_WDT_RSTCNT before ensuring the control register changes have synchronized.
Not applicable. These two operations work independently and do not affect each other.

> - [Low] Spelling mistake in Kconfig help text.
Fixed. Corrected the spelling mistake in the Kconfig help text.

> --
> 
> --- Patch [2]: [PATCH v2 2/3] watchdog: Add Nuvoton MA35D1 watchdog driver support ---
> commit 31ed5d4971c74d4f75935b7f98c40e226cdc3521
> Author: Zi-Yu Chen <zychennvt@gmail.com>
> 
> watchdog: Add Nuvoton MA35D1 watchdog driver support
>     
> This commit adds a new watchdog driver for the Nuvoton MA35D1 SoC. It provides
> support for timeout configuration, ping, and system reset functionality via
> the standard watchdog framework.
> 
>> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
>> index 08cb8612d41fe..972740fd36a69 100644
>> --- a/drivers/watchdog/Kconfig
>> +++ b/drivers/watchdog/Kconfig
>> @@ -720,6 +720,16 @@ config STMP3XXX_RTC_WATCHDOG
>>  	  To compile this driver as a module, choose M here: the
>>  	  module will be called stmp3xxx_rtc_wdt.
>>  
>> +config MA35D1_WDT
>> +	tristate "Nuvoton MA35D1 Watchdog Timer"
>> +	depends on ARCH_MA35 || COMPILE_TEST
>> +	select WATCHDOG_CORE
>> +	help
>> +	  Say Y here to include support for the watchdog timer
>> +	  for the Nuvoton MA35D1 series microprosser.
> 
> [Severity: Low]
> Is "microprosser" a typo here? Did you mean "microprocessor"?
> 
>> diff --git a/drivers/watchdog/ma35d1_wdt.c b/drivers/watchdog/ma35d1_wdt.c
>> new file mode 100644
>> index 0000000000000..e5247e55dfee4
>> --- /dev/null
>> +++ b/drivers/watchdog/ma35d1_wdt.c
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_stop(struct watchdog_device *wdt_dev)
>> +{
>> +	struct ma35d1_wdt_dev *ma35d1_wdt = watchdog_get_drvdata(wdt_dev);
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	guard(spinlock_irqsave)(&ma35d1_wdt->lock);
>> +	val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +	val &= ~WDTEN;
>> +	writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
> 
> [Severity: High]
> Will this read-modify-write inadvertently clear Write-1-to-Clear (W1C) flags
> like IF, WKF, or RSTF? 
> 
> Looking at ma35d1_wdt_isr(), it appears that reading a 1 and writing it back
> clears the flag. Should these W1C flags be explicitly masked out when doing
> read-modify-write operations on REG_WDT_CTL here, and similarly in other
> functions like ma35d1_wdt_set_timeout(), ma35d1_wdt_start(), and
> ma35d1_wdt_suspend()?
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_set_timeout(struct watchdog_device *wdt_dev,
>> +				  unsigned int timeout)
>> +{
>> +	struct ma35d1_wdt_dev *ma35d1_wdt = watchdog_get_drvdata(wdt_dev);
>> +	unsigned long target_ticks;
>> +	unsigned int val, i;
> 
> [ ... ]
> 
>> +	guard(spinlock_irqsave)(&ma35d1_wdt->lock);
>> +	val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +	val &= ~TOUTSEL;
>> +	val |= FIELD_PREP(TOUTSEL, i);
>> +	writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +
>> +	ma35d1_wdt_ping(wdt_dev);
>> +	return 0;
>> +}
> 
> [Severity: High]
> Does this writel_relaxed() require a call to ma35d1_wdt_wait_sync() before
> proceeding? 
> 
> Without waiting for the SYNC bit, could the immediate ping command be ignored
> by the hardware or cause hardware state corruption?
> 
>> +static int ma35d1_wdt_start(struct watchdog_device *wdt_dev)
>> +{
>> +	struct ma35d1_wdt_dev *ma35d1_wdt = watchdog_get_drvdata(wdt_dev);
>> +	void __iomem *wdt_base = ma35d1_wdt->wdt_base;
>> +	unsigned int val;
>> +	int ret;
>> +
>> +	ret = ma35d1_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	guard(spinlock_irqsave)(&ma35d1_wdt->lock);
>> +	val = readl_relaxed(wdt_base + REG_WDT_CTL);
>> +	val |= (WDTEN | RSTEN);
>> +
>> +	writel_relaxed(val, wdt_base + REG_WDT_CTL);
> 
> [Severity: High]
> Because ma35d1_wdt_set_timeout() writes to REG_WDT_CTL without waiting for
> sync, and then ma35d1_wdt_start() immediately performs another read-modify-write
> on the same register, could this back-to-back unsynchronized access cause
> dropped writes and prevent the watchdog from starting properly?
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct ma35d1_wdt_dev *ma35d1_wdt;
> 
> [ ... ]
> 
>> +	val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +	if (val & RSTF) {
>> +		ma35d1_wdt->wdt_dev.bootstatus = WDIOF_CARDRESET;
>> +		writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +	}
> 
> [Severity: High]
> Should there be a wait for hardware synchronization after this write clears
> the RSTF bit?
> 
>> +
>> +	if (val & WDTEN)
>> +		set_bit(WDOG_HW_RUNNING, &ma35d1_wdt->wdt_dev.status);
> 
> [Severity: High]
> If the bootloader left the watchdog running with a very short timeout, could
> the system reset before the core's ping worker can keep it alive?
> 
> Should this also call ma35d1_wdt_set_timeout() to ensure the hardware's
> timeout matches the software configuration when taking over a running watchdog?
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_suspend(struct device *dev)
>> +{
>> +	struct ma35d1_wdt_dev *ma35d1_wdt = dev_get_drvdata(dev);
>> +
>> +	if (watchdog_active(&ma35d1_wdt->wdt_dev)) {
> 
> [Severity: High]
> Does this need to check watchdog_hw_running() as well?
> 
> If the bootloader started the watchdog (WDOG_HW_RUNNING is set) but userspace
> hasn't opened the device yet (WDOG_ACTIVE is false), this check will skip
> pausing the hardware. Could the timer then expire and unexpectedly reset the
> system during sleep?
> 
> [ ... ]
> 
>> +static int ma35d1_wdt_resume(struct device *dev)
>> +{
>> +	struct ma35d1_wdt_dev *ma35d1_wdt = dev_get_drvdata(dev);
>> +
>> +	if (watchdog_active(&ma35d1_wdt->wdt_dev)) {
> 
> [Severity: High]
> Similar to suspend, should this also check watchdog_hw_running() to ensure
> a hardware-running watchdog is properly resumed?
> 
>> +		u32 val;
>> +		int ret;
>> +
>> +		guard(spinlock_irqsave)(&ma35d1_wdt->lock);
>> +		val = readl_relaxed(ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +
>> +		if (device_may_wakeup(dev)) {
>> +			val |= RSTEN;
>> +			val &= ~(INTEN | WKEN);
>> +		} else {
>> +			val |= (WDTEN | RSTEN);
>> +		}
>> +		writel_relaxed(val, ma35d1_wdt->wdt_base + REG_WDT_CTL);
>> +		writel_relaxed(RESET_COUNTER,
>> +			       ma35d1_wdt->wdt_base + REG_WDT_RSTCNT);
>> +		ret = ma35d1_wdt_wait_sync(ma35d1_wdt);
> 
> [Severity: Medium]
> Is it safe to issue the ping command (writing to REG_WDT_RSTCNT) before
> waiting for the control register changes to synchronize?
> 
> In ma35d1_wdt_start(), the ping happens after ma35d1_wdt_wait_sync(). Could
> doing it before sync here cause the ping to be ignored by the hardware?
> 

Regards,
Zi-Yu Chen
