Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F6D3542F8
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 14:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138380; cv=none; b=JdkVlXctXaBRzhqOqQUh/PzWpyNexh+WJE9cmMk55V5HdimK56YyZ8tTCRzMMHBzXZjMLZcGIjMfTaAXPtq1sgGSlHcEuTJQAp3Gm+Hgb0/dF29h+QpqNz69W+dsb9onpHy/ffEBAGalTbJDsOMNXsHpp84KeJI12Jdy1bp21og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138380; c=relaxed/simple;
	bh=fpmxr0cgb7peufCFX/fraHzTpsYDsX16E32Gu2HRJUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BSMoFjmAMUmy8Fj9Oi1D+JLJ4VKMXsE7o8uf74tbie8c5ITr462gUXzCRd1z9a+VQxZTxtp8TEUg8f1vpc7emG9vLEJYatnxQ5qwfLBlCSmpY2EaZEemDsj/bjBr9RZ+cFBVsPAeUl798wbhMR+CvXW2nYRuGIPv+qd8PjanC3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O2SVZKqC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O2SVZKqC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d942c7cc2fso9331045ad.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789138378; x=1789743178; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LdoXE+ewf5jb6LQYyxh8lGBqTy0FzOqpYpBgqMKD8BI=;
        b=O2SVZKqC2x5YmnUDwha8Yi2ogNEyiBsapFYwh6KdLjiYa8Fgy7TRWXUs0LposQMfCs
         v3H2IBhuKnVEABWRGEnXLOhxkmxp5PFao2ptGaVH1PBkSZFAOGixho+2X5jBqRKSUPrD
         WFNG1YobtKbsCnqasH8Rr26hTE/aL+CgVWoDWhGR4CcZlBo5kLDnNo7MYgKss027IVqZ
         OV/zjs5UCGTNHUbgZH+iwM8Nv79kpb59Q1dLt8HSQx/HvVzzfc2pnIV8JikwgIrH4pfN
         5WphAGvXJXh0XcT/9rPccZfmUyuAIYIdUdt1neD1n60gc1Z9lrgnnpGbDppBfiTVTqqr
         uHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138378; x=1789743178;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LdoXE+ewf5jb6LQYyxh8lGBqTy0FzOqpYpBgqMKD8BI=;
        b=N5XQzOX1C0rnnYGkHb8nvZVTC2ppdSCZnMdJkiuhZVifkp756CxPCs7DmhH23UTVTM
         SWAIBMUzY2USGVq3cCx4f1sj25y8/aCaQCIpxOkj9NNB9UtRAgeMyIcuCsN7uryz4L9q
         Dx//7CnDQ+sJzNqqA9tpFO7+rz4RGpZaHDrgG56atcJ/poMGm7+Ptyt2ezqbvNL9S3WW
         0omqZO5xhQmZR6flAX13LTs9ER6Ugso8Q6mr+xu7eTwGekyHtNK/FoWEP6taNAPJLklD
         5xgXztHXFAtIAt0zUmc3G8UmkMNNQvExotLKHfaK1OPvQoc92UxjUKV7uXHESNqpej7c
         HL9w==
X-Gm-Message-State: AFuF++nlVw+oSnBXnXz08XVPQfyJ6ziYfNO9A0qsDyh9s0mODFbH4HrL
	a+dX0FTYrlV3vtS4tHymAA7+ZV0g1BXiEAet3JpUPi9/gIy7ZKD3U8JmlU+87Ptf
X-Gm-Gg: AYBFou0ME+hbiKcd5Bz7NNAp75pyAjrUElA5ZNeypRLEzOcv60XRQueE3tny995rTQa
	WQMR2UgVxozB+/3YXTBfm8IJvHe7w1r41UBJ1b/zm7YcFHj+QBoWURGnZq90/zOfOGOtYPyVqdh
	vmU8c+DQHQOiv0axjK45tx3FNVz7pFh0VM05Mh382d3sioKvbW/fwfqHAKWqd3W32TTmoadcsRE
	QlN201fed864MscB5yH9GmSsj7Rbzy1nIN+J7in9j7M3MVxrP1yuCfeIdNhZ2NiF04Gf15Vy5zE
	w/7dtGAvGn+t+Ni4JLyj0ul+XuaMnt1e9FW+hXpZt5gEMrA8GUCFjeIg+cHVPAxDTgs1dIjjLVQ
	ayA7a2Zb+gVF96woEbffT6cadXMtJgvrhsBJlE6Yzhh+TLGgSWZtg64ae9He+R7NR/4Uphxen3D
	kTB2oaispRtLPcCZ2LZIChVHSW8RfBUxFBgV/9Vtnqn0lHLkI8d/XijEnPRPnWN4qAQQ465t+60
	qmj/HhWejPYTU+EPibbKSwbV8oIEa8ceBMlneWBp4XkLrNA
X-Received: by 2002:a17:903:1b4f:b0:2dd:40cb:a054 with SMTP id d9443c01a7336-2dd40cba32bmr20018355ad.19.1789138377973;
        Fri, 11 Sep 2026 07:52:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ccaceafsm12899705ad.9.2026.09.11.07.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:52:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <518aea33-277a-4d8f-8bf7-7469879f6f56@roeck-us.net>
Date: Fri, 11 Sep 2026 07:52:56 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: add Axiado AX3000 and AX3005 PWM fan
 controller driver
To: sashiko-reviews@lists.linux.dev, Petar Stepanovic <pstepanovic@axiado.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20260903-axiado-ax3000-pwm-fan-v2-0-ef43df46163e@axiado.com>
 <20260903-axiado-ax3000-pwm-fan-v2-2-ef43df46163e@axiado.com>
 <20260903084844.D1CC11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260903084844.D1CC11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Petar,

On 9/3/26 01:48, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The interrupt handler incorrectly returns IRQ_HANDLED for unhandled device interrupts, potentially causing an IRQ storm.
> --
> 
> commit ac0edffb2c72d464c05c340c5df147fdcf10b0f4
> Author: Petar Stepanovic <pstepanovic@axiado.com>
> 
> hwmon: add Axiado AX3000 and AX3005 PWM fan controller driver
> 
> This commit adds support for the PWM fan controller found on the Axiado AX3000
> and AX3005 SoCs. It measures fan speed via a hardware tachometer interrupt and
> controls the fan via an external PWM signal.
> 
>> diff --git a/drivers/hwmon/axiado-pwm-fan.c b/drivers/hwmon/axiado-pwm-fan.c
>> new file mode 100644
>> index 0000000000000..ac153afded47a
>> --- /dev/null
>> +++ b/drivers/hwmon/axiado-pwm-fan.c
> [ ... ]
>> +static irqreturn_t axiado_tach_irq_handler(int irq, void *dev)
>> +{
>> +	struct axiado_pwm_fan_ctx *ctx = dev;
>> +	u32 status;
>> +
>> +	status = ioread32(ctx->tach_base + AX_TACH_INT_STATUS_REG);
>> +
>> +	if (!status)
>> +		return IRQ_NONE;
> 
> [Severity: High]
> Will this handler cause an IRQ storm if the hardware asserts an interrupt
> where the status is non-zero but AX_TACH_INT_PENDING is not set?
> 
> Since the condition only checks if status is zero, an unexpected bit could
> bypass the IRQ_NONE return path. The handler would then proceed to clear only
> the AX_TACH_INT_PENDING bit and return IRQ_HANDLED, leaving the actual
> hardware interrupt active and bypassing the kernel's spurious IRQ protection.
> 
> Should this explicitly check if the AX_TACH_INT_PENDING bit is set before
> processing the interrupt?
> 

Please address this problem, or explain why it does not apply.

Thanks,
Guenter

>> +
>> +	scoped_guard(spinlock_irqsave, &ctx->tach_lock) {
>> +		ctx->tach.count = ioread32(ctx->tach_base + AX_TACH_COUNT_REG);
>> +	}
>> +
>> +	iowrite32(AX_TACH_INT_PENDING, ctx->tach_base + AX_TACH_INT_STATUS_REG);
>> +
>> +	return IRQ_HANDLED;
>> +}
> 

