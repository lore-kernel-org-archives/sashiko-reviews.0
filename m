Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8B534E75A
	for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 07:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781335261; cv=none; b=MQXLfqmTkdua+Qg9BMTfpa0tzkSrV25PW1z73OHvk6Sk/Wi0n1wM2bC/Vv7ivz0VG7x8ekZpQtnRXK+Pc3SlR9DYhrrz2WsrYrBhUJ15oKacQME+TZ4rKa0VEUmhmFEKfUBDHZxmvrOWUyk9HGSFREANRJGGFrHUaUaczpX91Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781335261; c=relaxed/simple;
	bh=qcp8Hgwj7d1i1tkEvvTQR8k2iNss2g1VzQekPD+R4+w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ab0HJgCWOI9BkaFReCkkVxNf+YyL7RQJU3wFSsObYvpx5PymflKHNiOyDrAaazPCbyz98iEtZkEMZ4gvnaeDT7nZxXqLfF2TYVLSvPjlFcpWS2IUZWw1tP8nOZkL/LRxJLoEK7UTFZflNAtYPxO0IzfqdwGbSPVmiwnIXRCWoiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FKZmhRhk; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FKZmhRhk"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8422f395a4aso1202092b3a.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 00:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781335258; x=1781940058; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yFlPsHECvjKKFoSYlqGhFvJ+I6A2Zwo1fKqJVG+6sUs=;
        b=FKZmhRhktI9AxOBeoTaUe571GZB8j5h3QQt2xOwc3WXEOOLqmDUvRYtdsCoMhe0K4A
         kfwCjra+jM1Z6fLvXSRCe2rCBM57IWOMUfkqJyL7eeAwNT48yoFEyYdGYUby8WvgfRnF
         pHJHk35HhD5TyylIBG6zUi5BZKOunl8C1XNy6nYAeReRO3poVXmTi3BXebxJDnFjj5wH
         eoas2Krt6ueHVCxzXtI0s3aJ+EFC8GSnmfuOSrxVR2wmeS8VpRTEcDP66QjK/1WcwdmS
         N4oyZtyvD0lr6SChB6Phu7PJDjy9TwRdlkCetaZ5ne3d9A9GpV9ie8Hkg+ktT9MZf4w9
         NE1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781335258; x=1781940058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yFlPsHECvjKKFoSYlqGhFvJ+I6A2Zwo1fKqJVG+6sUs=;
        b=o8eh1u4lv8pMBTsBAFZg1PWHv7cyJq1XFhr16UYy7BDpO4S6fxwLs0e3qQat9Jvzzd
         TqOf0U1n43mMcHuH8vjRuiT6A0CakvMU+gEfVtj+KbI2xf2aA0jI3S3BpB+H25MQ1shu
         PbSVWKnQLkTsH2DxIjQm9v5HWXuybtFHJ6rgd03BdNH6XnIaPWLdzFQ0j+8Q64p27Fuf
         5Bw8/V2UaUjIBpsTOF4HoobPpO/B9fTxYWspWjnc6cQ/T/N9KimMEl90EF5V8nuFz49Q
         ZXqVptW9wjdX53miIGLGT+74Zo2N3ZyGCSZ3VnSPKYfBEdoxi0RZRGi+bCE8iPGQ4mO9
         rjzQ==
X-Gm-Message-State: AOJu0YxTjehB7XnaJvpkcIvPWz/+UHGoqXcuSLrBBXP1z+hVixlIry/2
	Ht0ln5COuLmo2HiJCWyzouY5uZwdXQlPfHtYo0KhC6H63je+GPKxCCkNHPQhZw==
X-Gm-Gg: Acq92OEYxvY397WJ/EHJpg+nkpWblVaPlAxiIIIbaUWR/4e/x908kMZP9xpewCNym2k
	QI15q3fRycBMXnx3YusGZSRGC8llySMlB3orc91tBkbM1urs97I9lCvQjIfDEMzLNyhusEs4a4a
	WoH0X8TF4hw0qUNGbVUdLlkSyrB/DV94khDhpX301+kKwYchFlLa3ks1WvlQSDX1XVTM9zyDevX
	bKM5CXDd1cMzjhs4mB9icShCYe0z2KRhN1l3Tpzt8JjvFWy9nZ2ktJ0SBETd/jUEM8LLXGgMqVc
	y9eoWryp9sJP7V69eHCnP9BSN58YXjmHYabv+/GfThWxa6u0m+9asaIEYbtzGfz5aXhUcNoNAYw
	A7N9QrOszGarDym3BKRdVMQunAS186f659f/mOCIaeoUu0K50+xe3X/y3zUMscRhSaV0UfxGpXb
	rmJyyTKi+8TbqB2sDpLwf1K6xFa8ENtH5Oc4hwCb7l5od7
X-Received: by 2002:a05:6a00:2995:b0:82f:4725:f6d0 with SMTP id d2e1a72fcca58-843497b8ab4mr5387757b3a.29.1781335258570;
        Sat, 13 Jun 2026 00:20:58 -0700 (PDT)
Received: from [192.168.0.8] ([49.207.61.84])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434ac9df57sm4216413b3a.7.2026.06.13.00.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2026 00:20:58 -0700 (PDT)
Message-ID: <84be047f-350f-470c-9680-179805152e1a@gmail.com>
Date: Sat, 13 Jun 2026 12:50:54 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: pwm: st,pwm: convert to DT schema
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260613-st-pwm-v1-1-458c2c89709a@gmail.com>
 <20260613071327.BE3101F000E9@smtp.kernel.org>
Content-Language: en-US
From: Charan Pedumuru <charan.pedumuru@gmail.com>
In-Reply-To: <20260613071327.BE3101F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 13-06-2026 12:43, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `interrupts` property is unconditionally required by the driver but omitted from the YAML schema's required list.
> --
> 
> commit b16a62dff3236ec8b123a99775f6c90dbfd9912f
> Author: Charan Pedumuru <charan.pedumuru@gmail.com>
> 
> dt-bindings: pwm: st,pwm: convert to DT schema
> 
> Convert STMicroelectronics STiH41x PWM/Capture controller binding
> to DT schema.
> 
>> diff --git a/Documentation/devicetree/bindings/pwm/pwm-st.txt b/Documentation/devicetree/bindings/pwm/pwm-st.txt
>> deleted file mode 100644
>> index 19fce774cafad..0000000000000
>> --- a/Documentation/devicetree/bindings/pwm/pwm-st.txt
>> +++ /dev/null
> 
> [ ... ]
> 
>> -Required parameters:
> 
> [ ... ]
> 
>> -- interrupts:		IRQ for the Capture device

Okay, I will define and add interrupts to the required.

> 
> [ ... ]
> 
>> diff --git a/Documentation/devicetree/bindings/pwm/st,pwm.yaml b/Documentation/devicetree/bindings/pwm/st,pwm.yaml
>> new file mode 100644
>> index 0000000000000..2c10f54b5caf3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pwm/st,pwm.yaml
> 
> [ ... ]
> 
>> +required:
>> +  - reg
>> +  - compatible
>> +  - "#pwm-cells"
>> +  - pinctrl-names
>> +  - clock-names
>> +  - clocks
> 
> [Severity: Medium]
> Should interrupts be included in this required list?
> 
> The original text binding listed interrupts under the required parameters,
> and the driver unconditionally requests it during probe:
> 
> drivers/pwm/pwm-sti.c:sti_pwm_probe() {
>     ...
>     irq = platform_get_irq(pdev, 0);
>     if (irq < 0)
>         return irq;
> 
>     ret = devm_request_irq(&pdev->dev, irq, sti_pwm_interrupt, 0,
>                            pdev->name, pc);
>     ...
> }
> 
> Without interrupts in the required list, incomplete device trees will pass
> schema validation but fail deterministically at runtime.

Okay. I will add interrupts to my next revision.

> 

-- 
Best Regards,
Charan.

