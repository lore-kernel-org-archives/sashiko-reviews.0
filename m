Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C74133C19E
	for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 20:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787084472; cv=none; b=A8j8dboXnoHH4zifchRniFT2Sb3rfqQy/aaCBFGOJkSOpciUA29uo4AaDyTWpomyzHlKGUONhGifTdm4qshzuahvoZlFmdlm1HLKWYYNp/T3yB2qC0elkS4e1DIBDDP+6TSGaoa6xDX+RtC1T4LmSg0NOelDTyYi47TluJeCofA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787084472; c=relaxed/simple;
	bh=uJ7l3+0Kz+d1zVSznuwkAWrbWcHhnORnvwLkNSK27QE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RoJlX+Ua0pShnuRLogYppQlopnfYrXWV4eTPiGoXRkB0dNexmtXSq5t0dIoZbHNiQqkEEMeBMFzujIRsy814VvvPDHps/4lG9aquPoDHDYxfIsLGt/XuC8zF82FzWn+FeqUqWZ3oo/O+QNRspW8FcNMaeSxQ9KOtH+/T93jWIpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfGvi048; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfGvi048"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cab973140bso3391915ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 18 Aug 2026 13:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787084470; x=1787689270; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wAo+hbi5pIQETVuT2GBp4z5fZRcd8aBocbDb7r063U=;
        b=JfGvi0486NTdD9Rvk6BrcQ435tCff5uP4UFNoFUjXoMv2Li6MsMGs1idSDc8/uRKxR
         y4H2DMFjnp0MqXIn9izYkjOYGA5Jy8F2PjTG+LM3W/+yQtVXJ9GqZ57SVr1Y155W/jRX
         ulGZxyMoDEBaoU9xI/JTAxTIyzdR8AiqJ3Nii++mNpToweqHSUIhuP+xui6q323jq2va
         S7buaQFTyXDgYn8YXFVNozcSvbK4/vGREpGrUrGpK6a0PAc4rWLLWdbMxX1O59qeP0w5
         VN6ovqveXJfka5bNFXnl+EDj7Y7xFCFCvnKisYgp9XsWAYs8egQiizhXUm9BNw7cQvna
         B+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787084470; x=1787689270;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/wAo+hbi5pIQETVuT2GBp4z5fZRcd8aBocbDb7r063U=;
        b=IO48Ym+8FR3E80bUCvIiSlK93JtiBV8hKdHsXo8HCoiTEe6z8lk99bnS7jTS+S0j/J
         PC6CcFrGruf6Yz4uPaIsO7LBl49wJdHbHu2neU7Ar7qtZW6FQKo63BmAgSgt7p3Ti7eC
         fZJw1Yojl7bfIFrsD+sITyjHjZzMEQaRWV6U9ck1/28EIz9acu5U1raseKcGvSEyD0zZ
         A0NhzLe1vymJlPH/a6oqM/O3AgXJE4KUa2y7DLzD79uOxjqP0q47La7I6JSJdo4j5UKm
         uIT2sDCIwHfRvFyjP0gYMNJ9dKL4V4ZSWCtJfmvNN5aOsygGul2IgPkGCzs/5CaAQqQr
         s68g==
X-Gm-Message-State: AOJu0YzATctKZqn36yCVrRq0+PpQBJPAtEgsmBUcCbmjlJk+OYP0vRjl
	ApL5neoMDZrLhee/y9ukvo8QWXOg3BLGZ63Wi1H+fqPkq7vT1YPoaRD0
X-Gm-Gg: AR+sD13RlxIae86lWPvG9yqSezSv0t+X7GHjbeRqrIowgrx7ow3PYGC4TGQWl27AjwY
	AZP6rXPV4rCC09u4YlQrgu8GXlRxDn3a608h+OPiuPZgvarTidighNusX4KgLCWXK1814OabCnG
	GjiwczzKxgP48Ob2nMC8EwAKIxLM+4101Q72SRRvgL54ENvHrYLVfGhUiCdh3+UY8OAJLnYyCzp
	Ay1e/zUNf7Hgf5lApASKIx+xAQGcfcezorQl4XcFHu8xDp/7/S9B3s5Zwp0sVNT+G36+MdvtxdD
	8K9IOsXi0S/wW1hQb2NtUDb1VeZMi0HCSAJxDgnjdXPxV5tee4ZWPTNlx+gvUnVBGv8UEr9a29K
	t/2RDBxBRKpHYcCVBHqLThMppGgFXBdUocl5Tiwq1/FFW7GQ+gRxd6IW8dmMQ5Upo83gJnvmjWf
	iq3z69a9xtErOAs9VYmwfSptaP5x3vmUvmRBCV57RhSoyN2eoq6WOf8SL8iYJOnhWnSA3V8LP19
	dA8hE8+vk50e+SeyTfGNii/abQHXMR68s/J0yoB+7KCmcw0
X-Received: by 2002:a17:903:40d1:b0:2d1:d95:5253 with SMTP id d9443c01a7336-2d5f6ba5ademr7027555ad.15.1787084469784;
        Tue, 18 Aug 2026 13:21:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1e542ebsm18588485ad.47.2026.08.18.13.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 13:21:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d8191041-a4bc-4674-ab9e-7fb56ca2b56f@roeck-us.net>
Date: Tue, 18 Aug 2026 13:21:06 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] watchdog: s3c2410_wdt: Add exynos5515-wdt
 compatible data
To: Aiden Isik <aidenisik@protonmail.com>
Cc: sashiko-reviews@lists.linux.dev, Aiden Isik <aidenisik@member.fsf.org>,
 devicetree@vger.kernel.org, robh@kernel.org, linux-watchdog@vger.kernel.org,
 conor+dt@kernel.org
References: <20260818-for-next-lucky7-watchdog-v3-0-2912bd122c57@member.fsf.org>
 <20260818-for-next-lucky7-watchdog-v3-2-2912bd122c57@member.fsf.org>
 <20260818181349.894171F000E9@smtp.kernel.org>
 <k_6CWq_7vPkV72MkyL0wCdcr9ptTffpGOGc6dBLbXjcHBV4DGRzP-35mxO0tdOBaIEhy4BxByYLCh8T5nidgwaMwGcNYD9KCIpxkeF4RRiE=@protonmail.com>
 <83b5d8e7-9504-41c9-9f24-8fce60641de4@roeck-us.net>
 <-HoGjao7Mdcx5P3JHoh9WjecLbbXBISKawVeEa59KRfhq7rul5NozHGaISvi0T-ZTp2otj7_b5qqb9tQI5XR0Wvp4UzG7crAekiRTXhiOd4=@protonmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <-HoGjao7Mdcx5P3JHoh9WjecLbbXBISKawVeEa59KRfhq7rul5NozHGaISvi0T-ZTp2otj7_b5qqb9tQI5XR0Wvp4UzG7crAekiRTXhiOd4=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/18/26 12:35, Aiden Isik wrote:
> Hi Guenter,
> 
>> On 8/18/26 11:33, Aiden Isik wrote:
>>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>> - [Medium] Missing PMU counter enable configuration for Exynos5515 watchdog.
>>>> --
>>>>
>>>> --- Patch [2]: [PATCH v3 2/2] watchdog: s3c2410_wdt: Add exynos5515-wdt compatible data ---
>>>> commit 9ce360e3c933b7447ba5da9ba1b7ae3fee989703
>>>> Author: Aiden Isik <aidenisik@member.fsf.org>
>>>>
>>>> watchdog: s3c2410_wdt: Add exynos5515-wdt compatible data
>>>>
>>>> This commit adds driver data for the Exynos5515 SoC's watchdog timer.
>>>>
>>>>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>>>>> index e31f93db05096..5592f25fe6c83 100644
>>>>> --- a/drivers/watchdog/s3c2410_wdt.c
>>>>> +++ b/drivers/watchdog/s3c2410_wdt.c
>>>>> @@ -232,6 +232,16 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
>>>>>    		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
>>>>>    };
>>>>>
>>>>> +static const struct s3c2410_wdt_variant drv_data_exynos5515 = {
>>>>> +	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN,
>>>>> +	.mask_bit = 2,
>>>>> +	.mask_reset_inv = true,
>>>>> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
>>>>> +	.rst_stat_bit = 24,
>>>>> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
>>>>> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_DBGACK_BIT,
>>>>> +};
>>>>
>>>> [Severity: Medium]
>>>> Does the Exynos5515 PMU require explicit counter enablement like other recent
>>>> Exynos SoCs?
>>>>
>>>> Other variants in this driver (like Exynos850, AutoV920, and GS101) that use
>>>> the NONCPU_INT_EN PMU registers also pair it with a NONCPU_OUT register and
>>>> the QUIRK_HAS_PMU_CNT_EN flag to ensure the watchdog counter ticks.
>>>>
>>>> If the Exynos5515 hardware works similarly, omitting cnt_en_reg, cnt_en_bit,
>>>> and QUIRK_HAS_PMU_CNT_EN here might leave the counter disabled and the
>>>> watchdog silently non-functional. Could you confirm if this variant needs the
>>>> counter enable logic?
>>>
>>> Exynos5515 does not require this.
>>>
>>> Downstream on GS101, as an example, has this struct member set:
>>>
>>>> pmu_count_en_func
>>>
>>> This is not set downstream for Exynos5515, so it is not used for
>>> Exynos5515.
>>>
>>
>> You keep talking about "downstream". What is that ?
> 
> By "downstream" I am referring specifically to Samsung's Linux kernel
> fork for Exynos5515.
> 
> I host a copy here: https://github.com/Aiden-Isik/linux-android-lucky7
> 
> Also in this message I refer to Google's GS101 kernel fork, which can
> be found here:
> https://github.com/LineageOS/android_kernel_google_gs101
> 

Both are completely irrelevant for the upstream kernel. I am most definitely
not going to look into that code. If there is anything relevant - such as
the comment you pointed to earlier - you'll need to provide that as independent
comment(s), not just refer to some downstream code as explanation. The
explanation needs to be provided in the _upstream_ kernel code.

Guenter

>>
>> Guenter
>>
>>
> 
> Kind regards,
> - Aiden Isik

