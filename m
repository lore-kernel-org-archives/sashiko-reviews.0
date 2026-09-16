Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914ED390600
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 04:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789532776; cv=none; b=H0Zfi4DqisnVqTuBRryc7tlPHXjycFL7xdBA+hRQ+8lI5VFH7w9ewkX/qn4RnBexbgbRP3KJTy1WD3rxAVxyoo4GqmiGrLEbUEKpOPdQE2W/3swhjUByVGxUr+ylQ86OldTLBDvPgZ/8AcPawMX4rzgqvzYKdMxHPp5WPniY1G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789532776; c=relaxed/simple;
	bh=334syfjaJkoAeyzsz1IUG5zqRPqMRQ/P32fFz+5LeU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=frEjqI6kr3qo3kW+sD4kxE/fKBZQyi00wkRhjfowE+Y2enFoJOO7e4tY3OzDGICITj3OpdikU8Dzv6xp+2JW9lsh8uW+a1PLlKnELjnz0pfx5dF2wQO7U6AKQ3RacH9FtJ8d1BPTQX2CII1Tn6IUnWJHbALA9Y7lMPII3qkJ7KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hB7VaaO4; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hB7VaaO4"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd66bb4so441165a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 21:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789532773; x=1790137573; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YJWhUN+rb3FeHB7oqdusxLkDrd5idpWaFetoXpAmflM=;
        b=hB7VaaO4NPmVMP2UuLjZznvjEjLrG1gI0T16x9rAHWWPatPjaN29kj+qZSguTgd2Fj
         VnR8506dpHpcrGbdRrt4McNpZ0hXI8R73o0QN/7JZEqa+2yAUDXl9/PlsQ9UHPg78ehr
         swqwbzTjIz6P+gSMFedLxqzBLqmbXSzQqv3MsV511Z6Y5bgyXgz2fImGoFhw9DZP3riq
         85AiqLVkvkF1PuknFtNJqr41Ggmstj2T2dBMeIiXNgoQLA7LdUB2kY1johFci+yBcTCt
         xontxVvI3Uvl4vBJKUyPSUMf+pdZyUdDt2d03c3nEg7ifBLcdfcgZ/lx7WxcEGmYJQxB
         6GgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789532773; x=1790137573;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YJWhUN+rb3FeHB7oqdusxLkDrd5idpWaFetoXpAmflM=;
        b=s951z+Zjko7sPGZugCKctLa91Vaav1ls6F0aJCP5wW6S/+wKTDH2Oy01j8FMxNGVhk
         fDdJc/HL1PzM7n/32kVYM8pSLx5BvsrnEZvx+bdA8zWy5XO8o+MLI6AlW8IvtZGmpDNV
         dsbFaSr888Cx3na2Kfon44nqJo+BQARmNwALDvf9W7GM8c9zcDqEZxj0bKix4i33sRrW
         9GBHvEpRrYsEXMz9CnbIs7VDcLrlJuOHiNg/KJphXVj8trzllA6XrwF3ovegArnQFvip
         uGCYVYCNKqem68ASMC5kzBGqZmk+xcQtO131S7jL1V3HIjMTePbgF/zUKco3JFHh5tyw
         G2MA==
X-Gm-Message-State: AFuF++mZEYJqiNzgIRl51+IdoqPlSAzJPu8PfhVx9cCrlI/gEEwG40Pm
	JgqykFZy3olD8VbXZwtoj8od7iRiexvFVtJokGeoN/smaSDmcu4ZDYBsycAuYA==
X-Gm-Gg: AYBFou3cCriHGNOR+40hXwCvJsIZPqFSd1NVkkY7Vuhc5BVYV0NzDKA/9F0GZZKcqUV
	eSjOfB0uoNdRBZttGT7SVTxOxVaR4NFqYCUZ4nelPXNPgcigUjAIVWP5mVdLJVj2co0Chx+SyWA
	+wWSX+RUlHcockBQRGJi6UxAGaG8ahMJ/zgUBqVm75vCu7BQI+gn2sNzft2DUPbdYQPXkk/4zFn
	lmlB9PTvLjhBu8kCvOcoIMK+2q/myeElIEUUS6tIqbFkYUZ00K9t5VLoj+1ROw5m5wBQe71qmNT
	CSQx+uXC/CHczDxHxSvbH70W/QZoZN/CGmD+1VLWr+8UPqKfdwRyRLzVqowfdMRhQOYSZXfa68n
	C22nnL3shwARCL8UUe89wlFaQh0uB/IKRh5aGh/TJMDn1romnr5mdXApk4N7yQbbQCInXG+ldtA
	YZc5C4Wx/+DH24wYDcr0MHvwi6rnCR/J+Nm8bRU1HT3OdIhkfk6yCbdkYJDjlo5IZw1IAFc0TgK
	aWEIDAI7cMp4csCDFcPNid+Fw2n+3Brnuz+meNroLhtYuf/yxo=
X-Received: by 2002:a17:90b:3ccb:b0:39e:433:23b5 with SMTP id 98e67ed59e1d1-39e1e24f9f4mr2820333a91.5.1789532772806;
        Tue, 15 Sep 2026 21:26:12 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b69c756sm2159085a91.3.2026.09.15.21.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 21:26:12 -0700 (PDT)
Message-ID: <dfdddb60-d150-4d8a-9393-feb2f3e32805@gmail.com>
Date: Wed, 16 Sep 2026 12:26:10 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] pwm: Add Nuvoton MA35D1 PWM controller support
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, cwweng@nuvoton.com
References: <20260914110739.203479-1-cwweng.linux@gmail.com>
 <20260914110739.203479-3-cwweng.linux@gmail.com>
 <20260914111742.85BF01F000FF@smtp.kernel.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260914111742.85BF01F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



sashiko-bot@kernel.org 於 2026/9/14 下午 07:17 寫道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The driver relies on the bootloader-configured CLKPSC (prescaler) register but does not cache its value, which will cause incorrect period calculations after a system suspend/resume cycle.
> --
> 
> commit b9ac3c051c5908fe946a0ef1c7b809030aa32933
> Author: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> pwm: Add Nuvoton MA35D1 PWM controller support
> 
> This commit adds a generic PWM framework driver for the Nuvoton MA35D1 PWM
> controller. The initial driver supports 6 channels in up-counting,
> auto-reload, independent output, and period loading modes.
> 
>> diff --git a/drivers/pwm/pwm-ma35d1.c b/drivers/pwm/pwm-ma35d1.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/pwm/pwm-ma35d1.c
> [ ... ]
>> +static u32 nuvoton_pwm_get_prescale(struct nuvoton_pwm *nvtpwm,
>> +				    unsigned int ch)
>> +{
>> +	return nuvoton_pwm_readl(nvtpwm, MA35D1_REG_PWM_CLKPSC(ch)) &
>> +	       MA35D1_PWM_CLKPSC_MASK;
>> +}
> 
> [Severity: Medium]
> Does reading the hardware register directly here make the driver vulnerable
> to hardware state loss during system suspend?
> 
> If the controller loses power during suspend, the clock prescaler register
> might reset to its default value. When the system resumes and a consumer
> subsequently calls into the apply callback, this function will return the
> reset value instead of the bootloader-configured value. This could result
> in drastically altered PWM output frequencies.
> 
> Would it be safer to cache the prescaler value during probe?
> 
> [ ... ]
>> +static struct platform_driver nuvoton_pwm_driver = {
>> +	.probe = nuvoton_pwm_probe,
>> +	.driver = {
>> +		.name = "nuvoton-pwm",
>> +		.of_match_table = nuvoton_pwm_of_match,
>> +	},
>> +};
> 
> [Severity: Medium]
> Should this driver include PM callbacks to handle saving and restoring the
> hardware state?
> 
> Currently, there are no suspend/resume hooks provided. If the platform
> powers down the PWM domain during system suspend, the controller state
> will be lost upon resume and might not be appropriately reconfigured before
> the next state application.
> 

Hi,

Thanks for the review.

On MA35D1, the EPWM register context is retained across system suspend.
This includes CLKPSC as well as the other EPWM configuration registers
used by the driver.

Therefore, after resume, nuvoton_pwm_get_prescale() still reads the
same CLKPSC value that was present before suspend. The firmware-provided
prescaler value is not lost, so caching CLKPSC during probe would be
redundant.

For the same reason, suspend/resume callbacks are not required to save
and restore the EPWM register state on MA35D1.

So I don't think either of these issues requires a driver change.

Best regards,
Chi-Wen


