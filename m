Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 869E8480DE0
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 19:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501876; cv=none; b=sNWuDgAlYlrca+YV5caLZVSu/ymA5emacoPVgytAJGQOMHCjrCUMCuSLCzw6+cOGY35l6rNvtMzSsIo4N0cKvBziWNXoaGXYFWVmzvDmCQ9SRxsxiDC2dryhd9/30FFDEngusRund4aekrPOjIhm57sUGw4L7mUVZo3nduQput8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501876; c=relaxed/simple;
	bh=0SutQsPaKmuH/BzzQlpsitohyJ4zQTJeSU9h2QbL30Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NZPcJsJcJiY/fwnlyxerueQqPnLHP9cOuXIHNp9EljMZt85b8Jd/Mrg2Txs+1NRvHp3TdRGXu57aQO73je7Y9QUmmq+hLVMUJdxOMyFU/E+ujgquscCjh3/pyS+e665Nquz/nv8C+7brraB1wNyAQeC4rBPUhqI06giA+lzZ9b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=folK8HcI; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="folK8HcI"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0b25dso1555995ad.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 12:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789501874; x=1790106674; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=meRzmuvuHs1bpyaBL9rOvIRnoaP+Ll3HcV4m+UFLE28=;
        b=folK8HcIugfB3tHrZHqdJVd3mW1CkV87vqz44kw86E5OOhuoHD5qXjh3njz1ZBKKTp
         H8pQdESZlkgoy6MbTh+GuHkGOJ+cD3Ewc65j20Sz3HEaTKL6tYIS4Qowox0xYbHwatez
         snTCpZkwLieuzFcgB/iqOT1VyOsWxnyl2fUCh9BEG4Ok/SU8dXiZAlDylzLa8/QUkAhI
         XN4wL+rHdAeoTNQwIl7QHT6ybeVstf5ksnpVPp4TrfRm6S47PFQv3f2sdhW3MGcU8VnZ
         F8yFnqc8xVVnbJkwJ0PjBzhqs5qU7sDF/eo1pklPtL/FXfoTGoQq5//CBQPHKu4rl+Qb
         qZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501874; x=1790106674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=meRzmuvuHs1bpyaBL9rOvIRnoaP+Ll3HcV4m+UFLE28=;
        b=llndIDe41lESYggFHVfGq7Hf7P9sqZIkqjMe7nRyV192Ze2HkukicjfIFgHNvPiFKk
         5nsq0hfcVIbOp8/o3AuEkf+p8GbNQ2qMdX2QVSL3VDD2xdAxUg7LE7WIcTxDr+JT3kz2
         eIpKyxesy4nns4d30/r7rynwMXfbMCd3H4aU00HtWoKMB69Y1ESVX//NsjH7Sed3lJ9b
         LDk82Dg6BN6b+4yA6saT8HsXbR2WCGcHffWTukr69paRa4XRBCq188e8fcU9ZG0ABFbh
         emTWB53l5oQDqLTvPcxgdK3DghntNM58bF67Y2FGmIFO1GCbgJ2o4Kha+5wuq20unBU1
         vFFQ==
X-Gm-Message-State: AFuF++kqILTevB9qwTFv7tbqCdJcB096MVwwFE9j/NXPY8jNWLi9s6I9
	RyOPgwdnoSqnY8TN7czPJB37wNPZQMfB7Scc7ozgkS3qOMFvQHbMx6kioeeEVLjw
X-Gm-Gg: AYBFou2/U+1BCONyUmmSUHuSuINk1bo0a59yLF57nRGgIuyawjEv8fS3oVWin8fmNqo
	PqZ4BKwo0S+ZgKjvlaLRsYNm8wnbpqBmXARqBDDBzmYfCWn1HXg2CE9LLfE1+QbOkpBWjThhTjQ
	m/Pybp88A97KnRgYOunm2RWrGvLnsFRwUtFERORBB9Xwv8c5yPCf5l2QM3XEPGguBKJLOfjdGK6
	wLtj9Uxzt+2vugniuvIk9hjeBlpg5d5Hpze+VyWTNVLM89o+aEEAgp8PmrQyfebK+lP0IH3ITrf
	GTjYta+8K5B+Rgk1ETBOPqZVgb64UioGCG6ys+V7Qc+nAuNOjwrf0rO7XyiIwqBPMaVvgGCPHd4
	T4BLhrWgIB5Ebu12YfDEo9Vjea9BZRrviNMNQAqC2Bn86c/nY7wUnN2+dU1pyF9uDMPi9wCruVH
	v4F+JRotausVUJxYBRReKpJucrDHa6JAHr0aNYVZjpWxTcldnZcyHhF4VTBPvmOUvNdMTK2h6gB
	a1ABAGhXtatKnN4o8eRUR5oyiGS2a6TntO5fog8yrYXKOlLqGd27A==
X-Received: by 2002:a17:902:c94f:b0:2dd:68a4:170c with SMTP id d9443c01a7336-2dd83851eccmr42584015ad.11.1789501873810;
        Tue, 15 Sep 2026 12:51:13 -0700 (PDT)
Received: from [192.168.68.67] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a166sm1247306eec.10.2026.09.15.12.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:51:12 -0700 (PDT)
Message-ID: <18a2d286-2345-4c0f-925f-125217983d44@gmail.com>
Date: Tue, 15 Sep 2026 12:51:11 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] leds: flash: rt8515: Support single-GPIO flash ICs
 with vin supply
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, linux-leds@vger.kernel.org,
 conor+dt@kernel.org, lee@kernel.org
References: <20260912-expressatt_camera_flash-v7-0-e1fd2edc8d84@gmail.com>
 <20260912-expressatt_camera_flash-v7-2-e1fd2edc8d84@gmail.com>
 <20260913025029.34B121F000FF@smtp.kernel.org>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <20260913025029.34B121F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/12/26 19:50, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
>
> New issues:
> - [High] Regulator is not enabled when requesting maximum torch brightness, preventing the LED from turning on.
> - [High] Replacing mod_timer with schedule_delayed_work silently drops updates to the strobe timeout and causes premature LED power down.
> - [Medium] Unbalanced regulator disable due to reliance on the global/physical regulator state instead of the driver's consumer enable count.
>
> Pre-existing issues:
> - [Critical] Premature destruction of mutex and cancellation of workqueue during device removal while the LED class device is still registered, leading to a Use-After-Free.
> --
1. Max torch regulator [High] - not reachable. The else branch needs
    brightness >= RT8515_TORCH_MAX (100). expressatt max_brightness is
    16, ux500 boards reach it but have no vin-supply so rt->reg is NULL.

2. schedule_delayed_work [High] - shouldn't matter. max timeout is 250ms
    on every in-tree board. Imperceptible. Happy to change it though

3. Unbalanced disable [Medium] - was in v2, dropped in v3 at Linus's
    request. happy to reinstate.

4. remove() UAF [Critical] - pre-existing. not sure if i should address in
this series.


>
> commit 6a964f82a818f57f5a1a31366f614609bc9c5008
> Author: Rudraksha Gupta <guptarud@gmail.com>
>
> leds: flash: rt8515: Support single-GPIO flash ICs with vin supply
>
> This commit extends the RT8515 driver to support flash ICs that use
> only a single GPIO for both flash and torch modes, alongside an
> optional vin regulator that gates power to the flash IC.
>
>> diff --git a/drivers/leds/flash/leds-rt8515.c b/drivers/leds/flash/leds-rt8515.c
>> index 00904cc90ed6e..541f61e13f018 100644
>> --- a/drivers/leds/flash/leds-rt8515.c
>> +++ b/drivers/leds/flash/leds-rt8515.c
> [ ... ]
>> @@ -62,27 +66,50 @@ static struct rt8515 *to_rt8515(struct led_classdev_flash *fled)
>>   	return container_of(fled, struct rt8515, fled);
>>   }
>>   
>> -static void rt8515_gpio_led_off(struct rt8515 *rt)
>> +static int rt8515_gpio_led_off(struct rt8515 *rt)
>>   {
>> -	gpiod_set_value(rt->enable_flash, 0);
>> -	gpiod_set_value(rt->enable_torch, 0);
>> +	gpiod_set_value(rt->enable_flash, RT8515_OFF);
>> +	gpiod_set_value(rt->enable_torch, RT8515_OFF);
>> +
>> +	if (!rt->reg)
>> +		return 0;
>> +
>> +	return regulator_is_enabled(rt->reg) > 0 ? regulator_disable(rt->reg) : 0;
> [Severity: Medium]
> Since regulator_is_enabled() returns the global physical state rather than
> the per-consumer enable count, could this lead to an unbalanced disable if
> the regulator is marked always-on or shared with another consumer?
>
> Because rt8515_gpio_led_off() is reachable from user-controllable sysfs
> attributes via rt8515_led_brightness_set(), repeated calls when the driver
> has not enabled the regulator might cause the regulator core to throw a
> warning and return -EIO. Should the driver maintain its own boolean state
> to track whether it has enabled the regulator?
>
>>   }
> [ ... ]
>> @@ -91,23 +118,37 @@ static int rt8515_led_brightness_set(struct led_classdev *led,
>>   {
>>   	struct led_classdev_flash *fled = lcdev_to_flcdev(led);
>>   	struct rt8515 *rt = to_rt8515(fled);
>> +	int ret = 0;
>>   
>>   	mutex_lock(&rt->lock);
>>   
>>   	if (brightness == LED_OFF) {
>> -		/* Off */
>> -		rt8515_gpio_led_off(rt);
>> +		ret = rt8515_gpio_led_off(rt);
>> +		if (ret)
>> +			goto out;
>>   	} else if (brightness < RT8515_TORCH_MAX) {
>> -		/* Step it up to movie mode brightness using the flash pin */
>> -		rt8515_gpio_brightness_commit(rt->enable_torch, brightness);
>> +		/*
>> +		 * Step it up to movie mode brightness.
>> +		 * If there is no separate torch pin, use the flash pin
>> +		 * for torch as well.
>> +		 */
>> +		ret = rt8515_gpio_brightness_commit(rt,
>> +				rt->enable_torch ?: rt->enable_flash, brightness);
>> +		if (ret)
>> +			goto out;
>>   	} else {
>> -		/* Max torch brightness requested */
>> -		gpiod_set_value(rt->enable_torch, 1);
>> +		/*
>> +		 * Max torch brightness requested.
>> +		 * If there is no separate torch pin, use the flash pin
>> +		 * for torch as well.
>> +		 */
>> +		gpiod_set_value(rt->enable_torch ?: rt->enable_flash, RT8515_ON);
> [Severity: High]
> If a transition is made from LED_OFF directly to max torch brightness, the
> optional vin regulator remains disabled because
> rt8515_gpio_brightness_commit() is completely bypassed here. Does this mean
> the max torch state might silently fail to power the IC?
>
>>   	}
>>   
>> +out:
>>   	mutex_unlock(&rt->lock);
>>   
>> -	return 0;
>> +	return ret;
>>   }
>>   
>>   static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
>> @@ -116,27 +157,35 @@ static int rt8515_led_flash_strobe_set(struct led_classdev_flash *fled,
> [ ... ]
>> -	if (state) {
>> -		/* Enable LED flash mode and set brightness */
>> -		rt8515_gpio_brightness_commit(rt->enable_flash, brightness);
>> -		/* Set timeout */
>> -		mod_timer(&rt->powerdown_timer,
>> -			  jiffies + usecs_to_jiffies(timeout->val));
>> -	} else {
>> -		timer_delete_sync(&rt->powerdown_timer);
>> -		/* Turn the LED off */
>> -		rt8515_gpio_led_off(rt);
>> -	}
>> +	/* Enable LED flash mode and set brightness */
>> +	ret = rt8515_gpio_brightness_commit(rt, rt->enable_flash, brightness);
>> +	if (ret)
>> +		goto out;
>> +
>> +	/* Set timeout */
>> +	schedule_delayed_work(&rt->powerdown_work, usecs_to_jiffies(timeout->val));
> [Severity: High]
> Does schedule_delayed_work() correctly handle consecutive flash strobe
> commands? Unlike mod_timer(), schedule_delayed_work() silently ignores
> updates if the work is already pending. This could cause consecutive V4L2
> flash strobes to fail to extend the timeout, shutting down the flash
> prematurely.
>
> Additionally, if the delayed work is actively executing and blocked waiting
> on rt->lock, its pending bit is cleared. In that scenario, could
> schedule_delayed_work() queue a duplicate instance of the work that
> immediately shuts down the LED as soon as the lock is released? Would using
> mod_delayed_work() resolve these state management issues?
>
>>   
>>   	fled->led_cdev.brightness = LED_OFF;
>>   	/* After this the torch LED will be disabled */
>>   
>> +out:
>>   	mutex_unlock(&rt->lock);
>>   
>> -	return 0;
>> +	return ret;
>>   }
> [ ... ]
>> @@ -327,12 +389,17 @@ static int rt8515_probe(struct platform_device *pdev)
> [ ... ]
>>   	platform_set_drvdata(pdev, rt);
>>   
>>   	ret = devm_led_classdev_flash_register_ext(dev, fled, &init_data);
> [Severity: Critical]
> This is a pre-existing issue, but registering the LED class device via the
> devm API schedules its sysfs interfaces to be unregistered after
> rt8515_remove() returns.
>
> [ ... ]
>> @@ -371,7 +438,7 @@ static void rt8515_remove(struct platform_device *pdev)
>>   	struct rt8515 *rt = platform_get_drvdata(pdev);
>>   
>>   	rt8515_v4l2_flash_release(rt);
>> -	timer_delete_sync(&rt->powerdown_timer);
>> +	cancel_delayed_work_sync(&rt->powerdown_work);
>>   	mutex_destroy(&rt->lock);
> Because devres destroys the sysfs interfaces after this function returns,
> could a concurrent user-space write to sysfs (like triggering a flash
> strobe) occur during this window? This would cause the sysfs handler to
> attempt to lock the destroyed mutex and queue work on the freed device
> structure, leading to a use-after-free. Should devm_add_action_or_reset()
> be used here instead to ensure the work and mutex are only destroyed after
> the devm-managed LED registration is cleanly torn down?
>
>>   }
