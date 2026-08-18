Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327A3359A89
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 19:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787080070; cv=none; b=Zj7vMMN12b+OMWrnMkJuzJ9bo8GI9a8MDtJl34GsqBGcshA+7huxijueukIU7iuIubuuFXrWaDL+muQEDLoYlyRbr1saK0PM3thvEoK0H30o0TWl4Y+Tim1JE2PHUwTtRh8eTYFVEIIB0J7/Jtr9gVm5Bx8AT41dG1kZCDT69L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787080070; c=relaxed/simple;
	bh=+UESlRR/8ib3mSxysgwZsO+cPigBB/bpNY2eOyvRg3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVqCVJnrNTm7tuWtjsDKZPCx+ycEo0zmUax/VlwOhD2efUWVXBqm2GNULnDlBNTPasORFq7MyPvHtDp2NpLyrNXmRQ9kBCDmoZ1/SeHnKIzMbo+hNbGv+IZCqv+KFVRvWytOXe+BVqX9bZhM9yeASfG8y6l6S2Wd5nWjosP0EHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=df2/HQZ0; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="df2/HQZ0"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so1038211a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 12:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787080068; x=1787684868; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ho5Ut4zy/7Lfy6I1/eZq6GBEnTONort7hcGZ8vJucpo=;
        b=df2/HQZ09nsShkgG+N34boj1JCVnR+GvtLzIu1YELZhhYEpOQoM69CIt3XE828+9Zy
         M2bWfE4DNKlNCkkeHvdSU09tU/M230DGx15nUxfV6/3i+wqGhb74Mn/2HyY6xYlG6+Ut
         iTAs/CIc+6eR0RNlGY1rJR9XGd3rR6EBx3+zSlrVdPeA/H0gyHd9F5SdCdFp6XEVkNHS
         ng3Xke4x58RaKLt/HiIRj5QLYtiThHDLRVGS8R0OGG5c6Qz0RM52Xvw4RYotVIz0TrLi
         cOBRoLtHZTFS+IJ5vvk3gya7PMBk0iAcoEpyGraqvP0mtObuv+RNVQNpRAyHKSPAiSz0
         Kbfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080068; x=1787684868;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ho5Ut4zy/7Lfy6I1/eZq6GBEnTONort7hcGZ8vJucpo=;
        b=M4YdfVks3vvGohY9FujfgQQxrQcyHeTLK5ASoXrguasKqBdfY0J8dC7k+fISuP9X5F
         U29YtNtNidLwpDItuOmz99RAvf/P1SCndowCcTdWmzlCTVPjdc59TtBT1+49EjtsLfnh
         8o4HxW5BwwXNUeXv9uoNXFq5NgP9eRle+2rs5x7I7S1GxeFOgLwW99OuE96bVpbEfCbm
         wqFVRS4/b02F909g2MHzeZV4niLL42P12vu3J3/+55QUCr1pIUDu43SEe+MBf9b39SEv
         PK7r3WP3hNgdBOzo7vmtvJ8GmOLzqf4av3qikzIgF3zjqYTZqzJ3+xuPp23Pk43Bb0YB
         C49g==
X-Gm-Message-State: AOJu0YzvgDJF2MwWg+DPasn1l4asR/kStTItbKOLlzxLRV9OmmRWchcc
	l7u99Vm7F7X9k9HnobcXHk4Xt/6y4NCn8B36ALK3DziBt2P9U91HcmZJep0Few==
X-Gm-Gg: AR+sD10BuSaoGk0q7kFX00aF3GONsOvbjpviKpp879svoNlNn5w5cTWd/Ec5OkrKTB2
	LP0ESNaPJbMRcFGol7w2P40QLTf2kOVcd5qPXg89BoZCHsH8kqCbn3yxL34WHndds28LeIZpbLs
	DuncARxH7x/LYwr5xGuP6HukPfbEGItFCtqi2wAkDiLopUhu3vcJ2gL9ICPWGrX6T1gL2FK6sH6
	bcwzCHV/yDMl1OzebWr4ZfiHel3TVU6UUG/YUQKUTC3d6SWXXyGh/zgrQxWqkqb/dwAW/sv+YW6
	Bas51OG0Z2K1dt1HgkmGhYK4J26u0yuWXgcWWduJjGTVuqNidCqeHVWyX3zolllkGAWtuWKTxKC
	KnJok2HTX9BSVFkTlc4hDjcIqY/CFKKGKmzvGLi7R2t7EKzr1xu+UAwdCOdiuz4qTnEqjlVIxeh
	T32JqtT2WRTAGLXADHBGKDn2ORHAzbSHNUhm/M5DrV9q1q71pjew10jakEJDx2q18nZ1bhbYqzX
	LLGAVsPGxpH9yxQhGcKgOZwFuu+LRLtUkz865/FkwVpfv8k
X-Received: by 2002:a17:90b:37cb:b0:38e:4f31:8412 with SMTP id 98e67ed59e1d1-3955f173613mr8638273a91.11.1787080068218;
        Tue, 18 Aug 2026 12:07:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1415317054dsm17788131c88.12.2026.08.18.12.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 12:07:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e634117e-57be-4c74-973d-3b13cbcaa640@roeck-us.net>
Date: Tue, 18 Aug 2026 12:07:46 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] watchdog: s3c2410_wdt: Add exynos5515-wdt
 compatible data
To: Aiden Isik <aidenisik@protonmail.com>
Cc: sashiko-reviews@lists.linux.dev, Aiden Isik <aidenisik@member.fsf.org>,
 devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-watchdog@vger.kernel.org
References: <20260818-for-next-lucky7-watchdog-v2-0-6743f479a47f@member.fsf.org>
 <20260818-for-next-lucky7-watchdog-v2-2-6743f479a47f@member.fsf.org>
 <20260818155332.9E0DD1F000E9@smtp.kernel.org>
 <8919c7f3-2dcb-4666-91e0-a91edc378c28@roeck-us.net>
 <M_lNzXuQ5wi3MVyFU1JstH_dxQWKDdPGje5yyVFO9lvJsz1H4USWNtew1040JtG4p17UrpWTWoohByvy_x7Nc5dvBh0LuONKNmPZPNMImdg=@protonmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <M_lNzXuQ5wi3MVyFU1JstH_dxQWKDdPGje5yyVFO9lvJsz1H4USWNtew1040JtG4p17UrpWTWoohByvy_x7Nc5dvBh0LuONKNmPZPNMImdg=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/26 10:56, Aiden Isik wrote:
> Hi Guenter,
> 
>> Aiden,
>>
>> On 8/18/26 08:53, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>> - [High] The `drv_data_exynos5515` variant includes `QUIRK_HAS_PMU_AUTO_DISABLE` but fails to define `.disable_reg`, resulting in PMU register corruption at offset 0x0.
>>> - [High] The `drv_data_exynos5515` variant uses an INT_EN register for masking but fails to set `.mask_reset_inv = true`, inverting the watchdog masking logic.
>>> --
>>>
>> Please either address or explain why those are non-issues.
>>
> 
> For the 'disable_reg' issue Sashiko flagged, downstream says this:
> 
>> /* PMU registers are changed.
>>   * MASK_RESET register was replaced by CLUSTERx_NONCPU_INT_TYPE register.
>>   * DISABLE register was removed and its value was always fixed by 0.
>>   */
> 
> Which is why I omitted disable_reg. It no longer exists.
> 

What is "downstream" ? I do not see this comment in the patch, not
in linux-next as of next-20260817.

Guenter

