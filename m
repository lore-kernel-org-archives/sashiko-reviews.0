Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C493770B
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 06:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785736917; cv=none; b=iYJOPgf6/+2zAS7Qo4yzYF02r3mbrz7UXqAGZRNp/Ac1QQkO7pL2jHJE7Hk+2XGBHuFPXdSvC3lkSH/Wrb7Tgn6Si50QeL9p8TQzz+9u1hjD8oElRyvFdqoIUPSi85cwo1Jz4X1h8G3SoJQfE4hdwpTRZ8AinWdBXvX0QeFhqgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785736917; c=relaxed/simple;
	bh=nhqzigJHu2rqL2Px63MJ43z3HN14aip2diXgZ+RPOUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiwN47TtgUZ3uWQ5JrUTK47x7SP8k5WpZo9Hyk/afXDkoMPLGedkkFDkFkziB3TWhIxUWrpJ3cSeW5HvOIpBRXfXXRzooc/9pgREA3X8lNlemMsH9JCh+0bD6XB2X3EAfFmgpMDCk1HoyXYx/L3rD41mDvusFmmvJ/6HNhoWbbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqN2GuC5; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqN2GuC5"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-848595b338cso3753502b3a.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 23:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785736915; x=1786341715; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jR6DHa6uHR7CPMwwaGVZjRKeuYi64yZ/mtj7JzFEqlo=;
        b=UqN2GuC5+5MrQ8SjH10IQDsExUq73Jk/X8T8SgdcgLq1ETLq6J3tE8BVrjnRzQgEcx
         A/2HPcJLlZdD3kcGYHlQb4I98d7lECfe0HXIUKdWMjxD0DGkz++BXjxLj52Qsaf9/jqD
         Y4D22Ybqq94rFoL5Cp2IbKq5FuTbGeWLEx9Vzq56dq+pOvwB+7buJycIDq44nXUzRTal
         IhDQspW8pZlA61xcdbx/WKeiNKaQsZPcZmEYWHMiWpuXowR4ca8MoEgz9+aBIBvT/ltF
         vokD/+m7oXoKlGYqpF+axYjdKMY96E7V6v+AJz08vLjw2gwsPghP/hnmBHUr+4YsyRyW
         hPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785736915; x=1786341715;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jR6DHa6uHR7CPMwwaGVZjRKeuYi64yZ/mtj7JzFEqlo=;
        b=TpSRjYlBiHXDezvHgtRL70Kr+UTZgy6+OleZ15WEzFj+8uRS3hgCxPd9hRTwKc1h/N
         M/FqmE9xxGigKvG8RJzh4WI6aWKYigbiQ/UagKGXjXib2ZLvJ3lZSqSTTJCgnw3e/8dK
         DefoeR/dzd+KjSB3gmjQzD8H2yuJHg12ArhUapdZaNwKUtrOhEAzOBakFEPcbEd5ismT
         U2TeJUUHlIeZQyMZ5dK8SHVdJZPV4vhteJTnRZjD45qcSFsmgOCbi/wzMFgTiAxrCiaj
         3kpWfnpmVW5D2jhxgc/6Rc1tscgsJYj7TQ66N8gyazNLsUj4GhQc8bfPbZeS2svKSaYO
         tVuw==
X-Gm-Message-State: AOJu0YzUqK0z3xcYgli6ckagn5kWfV2XK6ggI/3G1reJxNmhW3fqSXQY
	OrN7bXfkrIeriiMmJC7cRhn9Gr820NbhuwtXHrmpaYnA9c9VZUjeb33kBXiqGQ==
X-Gm-Gg: AR+sD13K5OyvYOt+0RmDFO4g0VnneMpoaR/+vCwswcL07ndnUg9LCWCrSQQowjEMK2m
	PxRgrBBVOPwHvuBToI6LFdPOPL6OYoZepxkq8qsUJWJLIHP72npVVQNfQOFmakM/NyuvMlVqTLu
	9aYZEKMimbxiduqt2fQVqPgHVfpL+BpRu21EbR1eWvSs2R3CIypvKK7/iemXt0XQ8loxIQ+fMag
	JMk6P+HmXrSTAaYRyvXhEVbGEByWqhS4c7kVYJf25h6GJ43zoJ3HzX2LuxCXugUWbbzzGiHt/ZK
	tPIRM3kcTZGUwCLGRqZPp1bK2JMSFEL26cfTa3rWQ6chXZ3I23wCYPK8vV2ftSGoNOrleB2JWze
	p8zSimeIWoID/udw9bisRLTYBOML3AsywfA6nn5sBM676TRakhX6GSvdzn+F55ikXztCs3cy4Da
	LTpfQmhpbAIkqmwUkhwFZIWvvizr8S1Sip23Iq+G0OcatK/bo025smFI7y9eMHf3Kap7R+2vl6J
	ujKP7mMyMnVYVxEyuzTak7bBKLGROl1hlW6Q4wa
X-Received: by 2002:a05:6a00:cc4:b0:848:2f6e:e52b with SMTP id d2e1a72fcca58-84ee48ea8d3mr8120475b3a.63.1785736915112;
        Sun, 02 Aug 2026 23:01:55 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d901csm3106716b3a.48.2026.08.02.23.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 23:01:54 -0700 (PDT)
Message-ID: <a7c2335a-6c63-475e-b11d-12c56c90c212@gmail.com>
Date: Mon, 3 Aug 2026 14:01:53 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO chip
 selects
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260803024048.1641756-1-cwweng.linux@gmail.com>
 <20260803024812.9FBDD1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Chi-Wen Weng <cwweng.linux@gmail.com>
In-Reply-To: <20260803024812.9FBDD1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


sashiko-bot@kernel.org 於 2026/8/3 上午 10:48 寫道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit disallows the `cs-gpios` property in the DT binding based solely on a current Linux driver limitation, violating the core Device Tree principle that bindings describe hardware, not software capabilities.
> --
>
> --- Patch [1]: [PATCH] dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO chip selects ---
> commit 3aecb6991adf3696410ad69c99107c7d732fd078
> Author: Chi-Wen Weng <cwweng@nuvoton.com>
>
> dt-bindings: spi: nuvoton,ma35d1-qspi: Disallow GPIO chip selects
>
> This commit updates the nuvoton,ma35d1-qspi binding to explicitly disallow
> the cs-gpios property. The change is made because the current driver only
> supports native chip selects, preventing the use of GPIO-based chip selects.
>
>> diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> --- a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> +++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
>> @@ -33,6 +33,8 @@ properties:
>>       maximum: 2
>>       default: 2
>>   
>> +  cs-gpios: false
>> +
> [Severity: Medium]
> Does this restriction violate the device tree principle that bindings should
> describe hardware rather than software capabilities?
>
> By explicitly disallowing cs-gpios in the properties block based on a current
> Linux driver limitation, board designers who route a standard GPIO to a SPI
> peripheral's chip select pin will be incorrectly prevented from describing
> their actual physical board wiring. When running make dtbs_check on a board
> device tree that uses cs-gpios for this controller, the schema will reject it.
>
> Should the hardware schema allow standard hardware properties like cs-gpios
> even if the current software driver lacks support for them?
>
>>   required:
>>     - compatible
>>     - reg

Hi,

Thanks for pointing this out.

I agree that the binding should describe valid hardware and board wiring 
rather than the current driver limitation.

I will send a v2 that keeps cs-gpios supported by the binding and 
instead enables GPIO descriptor-based chip-select handling in the MA35D1 
QSPI driver. I will also keep active-high chip selects restricted to 
GPIO-based chip selects, since the controller's native chip selects 
currently support active-low operation only.

Best regards,
Chi-Wen

