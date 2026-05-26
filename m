Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9023BB66C
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806219; cv=none; b=P8kiec8y91Hs7/dlT6hZDAmP9sMDIgK2h5w4+jj4tVCBACanRqeV1UOv6abM8mU9rQdVJk8KdWLS+zio3lgigxzWKRKrD/TS/Trtn5vHKANC/KlE+JPBMmOVPMeYh6m+szQraa5XbkeKLhUosHluN2WGUBsSalQ+ZAsSAyYIdwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806219; c=relaxed/simple;
	bh=bddmPLdlh8k4/CdvGhfjRlpoA8phjbaXLF3xZh98BOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Puj7JPjjwRMAmXkoRwYCDNHMtGEaWiVnDOIlAyyZ4QqwF5tmUCQU7sIKqZjw3+Z2rJyQMC48wR1b4L5Om99gd702oglNjtv7xGVlBrAxTvtbeFWSoLL9Hx+pUP1k9J0piACttCO/yDT97aWlTfWo6/no0HXrxTgnBPs1423jKhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r6lboW4k; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6lboW4k"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891b0786beso71772915e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779806216; x=1780411016; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/6TPmhMOXzTepD6L2/v/4s1TFOwJFHZZXVYfuiMLr8=;
        b=r6lboW4kkRCjXn4fQ/FGjZC1e4IKdD4RqXLQsMhPrrJ1Cc6fHt1DXHajhqhBbDxOyW
         8TcIqJpdSCQIKqPP98p2RKU3ztz1ASjAthxUCbb0u3KvNvSpFaq5naBT1GaO0b0kLpEV
         AXB/aNL7DAWwNt9FE58hLC3XFp21COc/0DwDk+i+Gw47DM6V5LULcpjyjwaNO0m23H/q
         0twFFui3/72jvnLI0f0Q/PxjxXFai4+Ezg8C5IrvSVBQLMn5d0xv7rhhi+xb/BOt7wdE
         Kb8zL2fi5ZLZnQfdXz2ZA21rAudeIGqaWcc7MxddWEhR+PPVvJ2O+IGVWkVMVF3P1plo
         xJog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806216; x=1780411016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/6TPmhMOXzTepD6L2/v/4s1TFOwJFHZZXVYfuiMLr8=;
        b=m9O/ugOOE+CUfivs3mB35zzqCJXkbrJ4VPRyHvKfCq66H00j6WoVOBNhAB1pIMV/+r
         a1ovT2r2yj8VkXNf4NMvYxkOy4qSSEp5/vHqEgTG1jJVaugf0bv+N3bStHeYHtBYEmga
         dDYxNRYrhsepLAyc+rz6Vmp27cbj6thkl5868PufajJOjCxpYb+0hbf5cL6NnBqWg8WE
         CBc/Pbi0IdQEbI6ET9oa7WDszAqIPpd0uj34lHW3ergRkMl6xclmTqleeicEqF+pWNgF
         0v22/ktm3gihuxLDoHzv/2E1Jim/kfnecyuozeU6alQA2m/YcbHv3xfQ7Q8ZkHehjo7g
         9xaw==
X-Gm-Message-State: AOJu0YwdDD2QHgKzZQ9LFlN8iuggX0ZQUZSXA/hoFlOjKqZsVgIOOsCq
	svNIyrigDq6+QoDOcRuYyMDc6LzXUZ9HJUf2znJLRhDFR6gSXxE0R59PlKnVhAFupao=
X-Gm-Gg: Acq92OFPgqvxtsr4VNRf7KEC2iVwwf7i23vB8aFtPIfqV9xK2SY+F6MJnJGfBRw0LC8
	FZcw1OPd5BcruIZfUvGfmfA1DqpvLriquJI6iMF/8FJVFbHdzPOSpFBN4IqCVDBLXLuxTTYec2z
	/V5WUh6ouaxnVkZrTCaP2IGDCzLNQAKFZrgCOSZ1OzGbg7BZhu9ed13Kjk84lUHvMqxSNn6a8ek
	fmsD8yYKgFPa4+oloMgljMyhy4jcKCuverAxcrDhgLV8ta8O+QHjdgcG+snw93uo6c4jutqHmh0
	Bj0PpUn2lw23YEOf10qABdUV3gWK5A5mtfoz84dCyhFSNBBL5pKLIOFwx34AKtxTdQpXWhJuNgy
	tpEF8PymZMc1bgSLHLwziaS9T5VuGmSPHfqBD5MNzRKXOV+Lvq2kFkTdiqm855TyDZdyU+cHaaC
	MfVJOmYr0a4iQOhrca8ytTjVS2VKObjPU=
X-Received: by 2002:a05:600d:6413:20b0:48a:9540:1a3a with SMTP id 5b1f17b1804b1-49042495183mr238402265e9.8.1779806216533;
        Tue, 26 May 2026 07:36:56 -0700 (PDT)
Received: from [10.11.12.110] ([82.76.215.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cce01asm37274935f8f.11.2026.05.26.07.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 07:36:55 -0700 (PDT)
Message-ID: <d8539fc8-d2ed-4b27-aa1c-ee92d7c8ff8e@linaro.org>
Date: Tue, 26 May 2026 17:36:54 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/5] dt-bindings: thermal: Add Google GS101 TMU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
References: <20260525-acpm-tmu-v5-1-85fde739752e@linaro.org>
 <20260525125455.AF31A1F000E9@smtp.kernel.org>
 <4832a220-ace5-40ba-b85b-7c69b3aed869@linaro.org>
 <20260526-uptight-bustard-from-jupiter-291e59@quoll>
 <08eba1cf-2df8-4f2f-a527-ee03ee792920@linaro.org>
 <20260526-nocturnal-dragon-from-lemuria-c517a4@quoll>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260526-nocturnal-dragon-from-lemuria-c517a4@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/26/26 5:34 PM, Krzysztof Kozlowski wrote:
> On Tue, May 26, 2026 at 01:02:37PM +0300, Tudor Ambarus wrote:
>>
>>
>> On 5/26/26 12:39 PM, Krzysztof Kozlowski wrote:
>>> On Mon, May 25, 2026 at 04:06:40PM +0300, Tudor Ambarus wrote:
>>>>>
>>>>> [Severity: Medium]
>>>>> Since the commit message and binding description indicate that the
>>>>> Application Processor relies entirely on the ACPM firmware for all
>>>>> functional TMU tasks, shouldn't samsung,acpm-ipc be included in this
>>>>> required list?
>>>>>
>>>>
>>>> I disagree. The property remains optional because the ACPM firmware
>>>> can be bypassed entirely. The TMU IP is capable of handling thermal
>>>> management directly without IPC intervention, so the phandle is not
>>>> a strict hardware requirement.
>>>
>>> I see your driver will fail probe without it, so something is not
>>> matching here.
>>>
>>
>>
>> Yes, that's because plain TMU register access, without the ACPM, is not
>> currently implemented in the driver. The ACPM can be bypassed in theory,
>> which is why I left the phandle optional in the binding to reflect the
>> hardware.
> 
> The point is that phandle is not optional currently. Binding must
> accurately describe the interface implemented by SW, so either SW does
> not fail the probe on missing property or the property is mandatory.
> 

Got it, thanks. I'll make it mandatory.

Cheers,
ta
