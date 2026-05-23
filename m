Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6785328B61
	for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779541865; cv=none; b=OrfqMXo2snqGDFSsoZHlfPnPEdsSciklwUWmhVhGjOt7CdxjQc4k7/SQpwsD+6l8Rqg0ypeKlCXjYjfGmCn9SbfKKnk9tx1Wfg77TTyYc6Q/x1QmtaGGMfZF7rpQ7Iau2SQII91OR4O2nTI6NySAQzwXf4h0CQQnV4ZcaaAmS3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779541865; c=relaxed/simple;
	bh=LvsYA0CCnlPuAYySq8D2KEr0XcfN7EGZ+If0+/WJmUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxD8siEQuCh1SKs60iyL61BZX9Wur76xMjqWg3VgLpj/E0fbVg6jwR9mM4v2Iapv1juRb3/nZKw4cUj35vUN8xiWTFU7GPEE1nYP6LAkPKed8wD/rvSJ8pl93pvy018wjF01d25VuOa2WyKvr1tSkG9Y1mm8+HiykEap3+Cfi+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9WKr/Xv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9WKr/Xv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2bdeed4f717so41600085ad.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779541863; x=1780146663; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yzyHT1CBV6SdGyl4lspqDckrFspESP8yAbrvbW352gI=;
        b=s9WKr/XvtYDWszZsZ29SpVUyfltKAkpFpGppHXi6xCHAptO/DJ3Ft5cQs1dL+Vdb+/
         TEfTRjGVoLi4wcCXUJrPgnveRqVCyu8tUhpCutCgf+Vtx1fPWMXSpLjNyyT0YlF+djez
         6BhpEDm0GGkMc2knDvZd+cuJizaKDFrPrBf2caG8+ssXP40IjmSkaBfrFeesFetaHYMo
         QIcIMVaN1CDLD2Z91uq8gx9dGOu39bKpAVYkNBcAhLNmhWVWyVxBqMtsGmFW1C+WbiHr
         m4FgCy3iPOFlRsewu4GSVFtNCPcJW32EpDFbuoglBNA58ADHAPr3fNOS5QkSCZM20x3l
         TtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779541863; x=1780146663;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzyHT1CBV6SdGyl4lspqDckrFspESP8yAbrvbW352gI=;
        b=cd3tNiMpoxvCYKhu/lGKErkztuKNBvXYnD8G9iyfctRIqgBhTQHhtY+zJEBdKP5SWu
         17wnNkS0W54FvtjGayTCt0XJqM6B+iPPHUn5RzDyDjvNMN71mivuPnGiKNegVeUPKOg1
         R6Rn6wPr7VET+PUzTRCjlYZuHFIl2QrdqjYdoDFqipgja01wbQlw2FUqkXKZB3HxNBqN
         aeEgkE4kffG5Gr3mYiEHoAL4n5ROoIZoqeLxQHbbnMdJlcnFe9SNHbtlucj1z+/hn5Uf
         1I5Qcr+RuMrW/cDH0/gaCFFCRcEU/fwugN5FUOXHut7ldNYiKZ9UOqNgf1nxOLzHffFS
         wpSQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mO+gbKIRCI1jjh9ClUdATuyHskZjrtcoElyCSEnkTUU19TgQJsn2MFrQc8UQcXltGwRPUmcqoKbiMrkrbfJc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMo5RP7zw+dEym214LB1CbsNAP4EP/UKRrNKxF12UWTKbmhujC
	BbcAmw02KNz53boe6o9iFz1EWS4IgNXKmvKQDG6j4isEfecskcXli3vAKcrmOqV4
X-Gm-Gg: Acq92OHanWkGM0PMmDQTbJnr73hrE42jvehhRo9HA+kQuS7MAuPJWx4JSiKy9a8J9f4
	YkDU9vygb397C9jNBJUyO/jlwZtK98gJgoV+XuIf8yL+fCVzssPYzEM1Xx5+uxoCGHAFtzgq0l7
	ttIH3iwek5EFfFrjhAjVFVs7i2eSsANoKrbSC4TCgDYxiMc8inpNzP2TzIcD0pJ1+PY63Xrqexv
	2HjmurNEmN8Wk3AbucZ1OgX+S4on5kpcEqpvOKCJOdbIjRrL8y7y+ZIVjB5D4rMXjsTZpVs5sLF
	Nh9Vzc3gx+33iZ72KUHHxMKlUchMcD9IrbsTemwLbKwilhR6Lpp4SsDj7Zh373MCgKG6ZWJeTXn
	2vfY/Kn5eBj1aW/O9ffW9fYavKvmWkZXvRjtujukG7MVM6J+GuLtYgQ2exmPmFWw6dnWYKrYeHN
	SjTJ5Ki0cmqM5GjvG732H+zJkNc20KDBVt1lwsIeuO08d0YHVAk35zN0xpCAni/toZHbtRf23h
X-Received: by 2002:a17:903:1b6d:b0:2b2:3bb6:fbf8 with SMTP id d9443c01a7336-2beb03884aamr82887705ad.16.1779541862814;
        Sat, 23 May 2026 06:11:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f5fsm46241145ad.8.2026.05.23.06.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2026 06:11:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <580689d4-a969-4f4e-8d06-cfffe809500e@roeck-us.net>
Date: Sat, 23 May 2026 06:11:01 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (lm63) expose PWM frequency and LUT hysteresis
 as writable
To: Jan-Henrik Bruhn <hi@jhbruhn.de>, sashiko-reviews@lists.linux.dev,
 Jan-Henrik Bruhn <kernel@jhbruhn.de>
Cc: linux-hwmon@vger.kernel.org
References: <20260522202250.3184791-1-kernel@jhbruhn.de>
 <20260522205930.3E2EF1F000E9@smtp.kernel.org>
 <DIPYQFU4CSI6.23E8KAFNAQ859@jhbruhn.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <DIPYQFU4CSI6.23E8KAFNAQ859@jhbruhn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/26 02:53, Jan-Henrik Bruhn wrote:
> Thanks, responses inline:
> 
>> Does lm63_update_device() release the update_lock before returning?
>>
>> If so, is there a race condition here? If another thread modifying these
>> variables in pwm1_freq_store() runs concurrently, could this code read the
>> new config_fan clock base but the old pwm1_freq divider, resulting in an
>> incorrect frequency calculation?
> 
> The new show function follows the same pattern as the existing show functions
> in this driver: lm63_update_device() refreshes the cache under update_lock
> and returns, and the caller then reads cached fields without holding the
> lock. Changing that would be a driver-wide change which I do not want
> to slip in here.
> 

You keep telling me that the existence of bugs in the driver warrants
introducing new bugs. Sorry, this is unacceptable. I won't expect you to fix
existing bugs, but I will not accept introducing new ones.

Guenter

