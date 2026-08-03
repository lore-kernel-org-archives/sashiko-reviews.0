Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287022F49F6
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 06:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738390; cv=none; b=G3sXB2sReOok1Q6x5dJyu7RzaD0+4qtzDRkVDed+RnC0E8mZSZS40pQ+LNpbWLVKFdOR1Qj/zUiAIPjgbVLvtTLSSUnUG9T6yHBz3Nq3Vp98X7bQ3jtkhyDLc8T9oWnUeUUVyymNNtj1R7tUAWc1bKO53CpF1R2AttHV4/54AeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738390; c=relaxed/simple;
	bh=nhqzigJHu2rqL2Px63MJ43z3HN14aip2diXgZ+RPOUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sZxk5pVxVXQ8Use0Mep6r2wKlOgwDGEDAgYav0FtvFmJsH6t0lbMp5PDeuZtdWaFv6wTxKGGwVTvZ57l7lg6gpAtQB1wx1YgqEiLzZEKY3fKbw9TNbOUqKmmODoFbmdCy6ItjRV8PjtfJPQqPj1NJFXaaiGUM4IrsYm9N0gVfBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KW8cRgrX; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KW8cRgrX"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8485ef63b68so3236045b3a.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 23:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785738388; x=1786343188; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jR6DHa6uHR7CPMwwaGVZjRKeuYi64yZ/mtj7JzFEqlo=;
        b=KW8cRgrXbnDUAsyUZB3tTdZ+cnRNJ7NuTgFOY3wU4kO0OI72BgX20Vp6N55DjyPl24
         kn91To2pE0OX9BL5JCQUqgogffAxoB/n/vxAvA5bgZYlGzr/qP+DQaAGaJMUVhyYkmvD
         2pkI1NOEYUwbS47/6AEviV9x+LrJS2QhX1yauZgAfFCxanRjvTUh0xvoM5uSRHtoMTir
         gxvIUX0aIaHeYG9S7uECesHa7JwGoexYCB3l6UZfb5z4u4tJKFUXSsPyncml0PLoD/Wo
         8fWHe0pkLtNzb7inoxu5NDz2PxsBfj464fcZwBmpIkH4Qm/lyE2MkXRx9f8xTokdHYZ5
         ar6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785738388; x=1786343188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jR6DHa6uHR7CPMwwaGVZjRKeuYi64yZ/mtj7JzFEqlo=;
        b=WMbUWYiUmPIklc2EnHUBVr+/XyUPdXfLVEnYLowZ4tOv2tLX7dbY7yVAwj6OCZmpn5
         kHTY3DtbmAjZNkE/yzDegRiBmQ014B8z+Grc8iUKbInQ0E2djLXS8uZYH8C+TfabOpu9
         TIwWkxMzf6ZUCglQ5ZO96tmSgqNa/RLICp3TXMnPR3o+gOPTMfRobel4mX1Sv4DeJBAl
         XBhos8jjSTadJt8tF6sxFZTODIRtmDMSq1vGUXQNGRYV8huuQvtnqSGj2re67a7c8iTT
         +KYsWjhGGxQVhnvS7OakQjoVL59OqrXt+mrCyc7DIxbMbj7BzNZ+84ORSn9wPNUIrCYT
         Fmew==
X-Gm-Message-State: AOJu0YzjQgEespwEDRYK0gm9Lf+ZUUPe7N+TyIbOfbvBBgLAFvyebeHi
	MPod85T4Bok5j5tEPehFQY+WqlNsM2oTkQoSGuy2JDPiK1y+mLzZx3rWkVX0Ew==
X-Gm-Gg: AR+sD133e5gzbCn+zFcP17YJepVUm6bKxMGbIhOQQ529YuJWIobHqM9G9dsYRjCMuZF
	hz6Y1jzu/d4BcJJ5pPICzHDtcMXkKdzJmJWyFnvUoSSgBq8gOVMi8FUWwf8lcEYTut7GAEt7dv9
	KZKOmgYTgIwt900V0uow33ggAqJ36lFlF8YzDkdINfU8HYMaXvd5+Kc0edsLFDLT7YzHRBDhoeM
	qhD33lLvSo6jaxx/z9WvAYAPRMlu3LSylisfh8M0rRNFEkwnKpzKjlWzwfhLzSBIn3NT0G9FJtv
	3DMLtySXiSyGVxK1EvrGIGlGfBHIFMFko1Uf60rUTGrTfBbhbvAToU//2xwnvHd0AtkZG+e7Y3v
	IC/BxJ+99oNCv+qHqVLtODLmc/84ByDDSXMKtmjV6yyW2TAndcL8RFNYyB6iBAaLp3KUryDnonz
	an9W8J17gbSRYisbDeqQDoD55o2KCz3MemyKDDySrblgQB8FViFMAIwkfAz4877cXZiuzqxmJ78
	5rwX39VF74/AF3JKEfh3gTacyoj6V0SYkLS6obPH2jc6tM7sxw=
X-Received: by 2002:a05:6a00:3cd1:b0:847:98ff:4af5 with SMTP id d2e1a72fcca58-84ee47d5328mr8196482b3a.26.1785738388390;
        Sun, 02 Aug 2026 23:26:28 -0700 (PDT)
Received: from [172.19.1.42] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc51cc95sm3221883b3a.60.2026.08.02.23.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 23:26:27 -0700 (PDT)
Message-ID: <f852bd65-820f-466a-8fd5-52a899cfaff3@gmail.com>
Date: Mon, 3 Aug 2026 14:26:26 +0800
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

