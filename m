Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B2737BE8E
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784362549; cv=none; b=MZAgrSIy87UvTY9YQTo2Ygn3fyIiSf6KhCJDm3RWDIzeukPO5958vbb42RaiZGYJftrubGbiYiH+TfJEBzVtJhi2lAcxOv5sqvlamyX9k4f4qPP+eKluh5C5sjGmNxc0Q3GdotW+yRU/uPaZbd1YVbVaWPeytXzpM5H18Tj74HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784362549; c=relaxed/simple;
	bh=EzqbWeSzT85oPY2MHsX+tDDam0WXfL2C/ffFGRTeXHY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=duBVFvZqO5sH1Tr3HRigsnHhjNA7Dh5JbBinnrnxEOKGAX8fTkwpcA94J7WbAAh803lHs1QRCNV0dChkJ6W6A+tBn+mbX0+9bGU0GcjdCCAOopv/rUeaGtk+16yz8J5L/iwepx8ey+p5zngZXiHZFgnmlwIP8eeHLf+q0Q6GQxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qz1GgM0Y; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qz1GgM0Y"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8486ac3f347so2093158b3a.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 01:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784362548; x=1784967348; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bSp1oXB6t0r670gpxmHzNoI/B82n3yPGLeuK8fscBxA=;
        b=qz1GgM0YQRl4UOke+vg84tPfpdL16MbCWq6lPSVFdONjpxR6Ov8YNV/pvpt4LfbO70
         mtlxIAjArxSUGlV5vot1oMKQNCEEZa4l9aRD3NrRx+anEMIVTx2mGkg0l8dpYED4kWMN
         81aTw+A+2MRzKXcN9bpvB9jPL3Ixb8PaANAendwzNPWTiM1LPz4OqWSv+eVjZ32RH9TQ
         CQ15VNlC5i423R4Bn14yLMQpuXGIFejGkl5/zMD0zfrffBEUOg2oZMmO2s/4ScAUKir5
         ag8caVKw6S8WqTl3cRcL4CWpJJBnQELu2H+xNbtQzmkGeSPl3wMvPRXLn6VDve5jJTUu
         ZDFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784362548; x=1784967348;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bSp1oXB6t0r670gpxmHzNoI/B82n3yPGLeuK8fscBxA=;
        b=gWXWdO2xarII9MG31YaljZ9K39i+V271UKP0d+ROZUTDttMUbIBVeaNijtGnFJpJHJ
         MuapgIqSKCci3HMy6jjWOZiMG7yjeP5Z1dTnNOOoy0f45ASydXmdkyLjnotj7DP7mYLF
         AGByAoQfXSup84QNHM0ukqqYrpbqZzYwiqAzHYec+IWkzIDcMRv9qMaT9DWsisf/RpcV
         MIo7gwDvxq7ceyR7EA9yYQvrF8hgFonfeey6jh/wfT6jPtsm6p9YBX1yblTd7pj3CRit
         bu1ycdh3PoeqqcgoCTwXDALrOU+jVNGMvLlRdGbrtFLx1Lho7e5uWUcMdulhBCOVKUll
         okfQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8M/mW+Q3JYv+zDpAagwVSdfjN6EESY7gl8+cEOv0m5Hrv2XYT7NNTM8PSZrvL+GzyIlHHLePxUzv/uHYQkF0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvwSitoZJwuW36dDeMJwFgcFuYavStmmTlL0/4ULWnN6Pj8uWu
	BAXdx2rGpfuxN5+gAscFYfF8BR/aetM8/5k2ei0lfSVMrf+btfpEDP+7
X-Gm-Gg: AfdE7ck20+oNlPoJz7lPu4rLWviXj7sUNKrO18URsA09ErMsyPvjYvHctdA8icCghhz
	Uf+r7sMbr1nOCbqNPD3u6bv5xNLUxR/iHvSX/0SjxAXo6ZFIys/1MxHEqh/oqQPq0M9yI3B1zvA
	bxxSTzajUaKULA6l3KbAVNH0kkxpwBIUDVYRJEFOVbYs0YjDAeYH1PavjL0WXXCnrALYG5eUUxd
	nd1/t3O3mIGrv/zPzpge4SiV7PbL+m+NLlgjmY15iYzTE0lsa2w7+mSD+rzMG+fNPEhgzhvJHde
	KZgwiYEqfIbcjsIU6oN/mbFAEnvCg/LxMA3tOYN/5lBavjd5e9O6+feOwA5w2jRzRds5ITu4GgI
	DpsK3hzi0cmAwCKtf99qRC+SGYA7eywb37LMYPXB7auUC6a1LtyMzYMNtJHX1KAS9JiKGmymyAF
	2mkjkwIcqiGL2vR6CYEY7sFpXt+AC/jnbiK8ZA8Ms49I7GvF17/NT7xZWBH4tOHAss2E1TDdT9I
	6WWJ4KN39aldNkvN53WLwWvyCuh4RWIsILKfUWYQsJb
X-Received: by 2002:a05:6a21:e082:b0:3b4:8c67:51d4 with SMTP id adf61e73a8af0-3c38dc7b38dmr11363127637.39.1784362547811;
        Sat, 18 Jul 2026 01:15:47 -0700 (PDT)
Received: from [192.168.0.100] ([202.179.95.46])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm27605069eec.21.2026.07.18.01.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 01:15:47 -0700 (PDT)
Message-ID: <2f1795b5-cab3-4241-b3f8-532a7fc4df9b@gmail.com>
Date: Sat, 18 Jul 2026 13:45:43 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ninad Naik <ninadnaik07@gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
To: Rob Herring <robh@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, lee@kernel.org,
 conor+dt@kernel.org
References: <20260701175330.1645927-1-ninadnaik07@gmail.com>
 <20260701180553.473121F000E9@smtp.kernel.org>
 <20260716173939.GB534222-robh@kernel.org>
Content-Language: en-US
In-Reply-To: <20260716173939.GB534222-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 16/07/26 11:09 pm, Rob Herring wrote:
> On Wed, Jul 01, 2026 at 06:05:52PM +0000,sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Low] The schema conversion incorrectly restricts LED child node names to `^led(-[0-9a-z]+)?$`, which breaks `dtbs_check` validation for all existing upstream device trees using this binding.
>> --
>>
>> commit 6c59295f22b17d02a2b26847db54458f820fa4f3
>> Author: Ninad Naik<ninadnaik07@gmail.com>
>>
>> dt-bindings: leds: lacie,ns2-leds: Convert to DT schema
>>
>> Convert lacie,ns2-leds to DT schema.
>>
>>> diff --git a/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
>>> new file mode 100644
>>> index 0000000000000..679a618906d80
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/leds/lacie,ns2-leds.yaml
>>> @@ -0,0 +1,87 @@
>> [ ... ]
>>> +properties:
>>> +  compatible:
>>> +    const: lacie,ns2-leds
>>> +
>>> +patternProperties:
>>> +  "^led(-[0-9a-z]+)?$":
>> [Severity: Low]
>> Will this restrictive regex cause existing device trees to fail dtbs_check?
>>
>> The old text binding example used a child node named blue-sata, which does
>> not match this pattern. Since additionalProperties is set to false below,
>> nodes in existing device trees that don't start with led will be rejected
>> during validation.
>>
>> Should this regex be relaxed to allow existing node names, or should those
>> device tree files be updated alongside this conversion?
> While yes we prefer what you did, it's perhaps not worth changing these
> old .dts files to match the preference.
>
> Rob

I understand this. Should I relax the regex to allow any pattern so that 
the existing as well

as new DTS files could be properly validated?

Thanks,

Ninad Naik

