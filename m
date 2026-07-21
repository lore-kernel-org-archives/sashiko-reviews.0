Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6033BCD12
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 15:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784646091; cv=none; b=PL+1JCsd3i9cieKyPtP6iGdpFduKRvKj5t3/2IoprcRyAHHrD6SAvTonBia4HuKPzuxuxuK0rEf2NSkTt12pS9HS51kq1rXNmN2wZG4BjrkeTFDC31Rd+UfotlgnrNid5tkPB6aIY8b05CDikmd3+5vEbq2sdVm2gNRxMJKmqYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784646091; c=relaxed/simple;
	bh=9omqenj/MNQht7ZKtL4rCnglIdiuYmuzCTNEc30UFj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qwl8ESt30Kd9d7PxElHKNButPtXFDgXJXkURjH91dG9OOtoSyCw8AZlPLEM/2ZgF1/pxnGKzpUmDR8TfzDpCnherH1IQvz3GcAPRtdp6wDPUWA8gqFhdYt9tXCKCzB9a4FrSPe5AxPf7HuVUASIEso+Hj+RbwH+/h8zXdkpggrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GMFNhjeK; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GMFNhjeK"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-384c94c9414so6838939a91.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 08:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784646089; x=1785250889; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pExrcbGfYsViK2FEI9tiXf/L+34P9VepLr+FV6llH98=;
        b=GMFNhjeK06HRkz49CpbJtCPaJJ0zTvzNBN6BfYyzjVgClKj7cVQcfRf+7yNUxAEG6L
         aWCuo0yGiP8fPm8is+JJcu5Xz9lyWI3k1IL43IYs6kvG/dc5b98hX9ITKu4letc2/9JX
         u2MDb+yFQUXdUMY4DBkvt4FbOIzvHGT4U3mTzBqiqvuHRRaNGtufpyct+YBMvHp8y7lm
         TF5Ghkxtp5VW1uQKcAO1ntiDPedLidAScOgAjOAmw6iJnFoyMxUj3WxxEfvfCiPMxHl7
         GqUk4wnmyzMSwVzG/3+Im32I1p1NrOAsS/vrPLGlRMoKUEV2FJwRfK7SYg3MJzNwsUkc
         +60g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784646089; x=1785250889;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pExrcbGfYsViK2FEI9tiXf/L+34P9VepLr+FV6llH98=;
        b=FVaJKiXeC5vxMQ7fwetQ6cbz9Ld3zlndf8a6yebBSdpixLTy9ClAp7E4ZzBanDRM67
         f+EYsEjezta0+n6reE73Yf3oO/YsdJg4T2HI3SgXaFZW8zhVzDIbBUK3XlLvFiub0Hut
         zCa3UbUxaDhRXiMZbo7iyUMKSIYYho9lkT5np0VOe2Cx3AWlPV2XdfCtFF9HCvenn0oE
         yok/6xCBC6yOpfkqM1a/nXcPpyu7Hpctr6vcAsxTdgwJA1j01FpvQyjweLBHOBX7y10U
         Dt5q+55pUj02Q9PAVw0AS7PKUmlepOX9bxUIxbBomeZhtwTt1M85JhItaMQMHdztrJtd
         spKA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+RDeqtVEP3EHVJOrR1fAA88GWsVq8LLpx8fFwSppMwhMUjAPkMqFRcJGMaVV5Jf+q7Dg+6AlovvU37BdhJMM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWKmA7Bn01njZdCZe3zTbX2QrilD/P5mYlnJpYMrMBH77OeMXR
	Kl/HlZkEdP6XV5OCjzAY+WiU7agbVpZ9HuBTOQ775O1QjpRYG0cuOPA6bbb9yQ==
X-Gm-Gg: AR+sD11rsbYwU+UaRRBie0IRXikUJyt+H1+x46DWcTjTICWX26B6BK/XrzL1AhkETrH
	QUYxijFSxp4S5M3wvLO2qLETtefqz3C0hKJ74cqLtV7GShyz2Jfm5Ab514dvDDNxrbPOyTbCeWh
	tBlR/r/e+AJN8y/VaDgBRZo9LmoTUtHI60mxFoLoLXI+P2igVuxzlJUXXmEx6O29tlbvSc2JK1w
	dqrE54PPuZLCyqvMfmdqNr3HBVfJgQvDVLomYB7SCDG5/yhNRvMAqCGFLMKibsQpVZyPfS1Sfld
	Xc3bip7x9hEyf1yEcCr4ZAMdjejuX371YgQI+GnrSQEOuw/Yxm5rASo4PVPi1KYCbbOzzWujnef
	3euEyvdrbRglzQ14JY+Cve7sZZuXrU/SJ4w/p1TLKH1e/ThsClSftttTSe3FqSzKQnxxIv51eOS
	twR5wqnBl2walKAHUb43PfpTnoT3rtxIBDF0FG2teca9GY8K8en2U=
X-Received: by 2002:a17:90b:586f:b0:38e:6b76:f0a4 with SMTP id 98e67ed59e1d1-38e6b76f1bcmr12740783a91.2.1784646088926;
        Tue, 21 Jul 2026 08:01:28 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d444sm56023456eec.6.2026.07.21.08.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:01:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7d6db045-07d5-4b0d-aa8b-b954a8e222de@roeck-us.net>
Date: Tue, 21 Jul 2026 08:01:26 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
To: "Torreno, Alexis Czezar" <AlexisCzezar.Torreno@analog.com>,
 "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
 <20260716-max34451_fixes-v1-2-a941b27eaecb@analog.com>
 <20260716083544.1B5B91F000E9@smtp.kernel.org>
 <eecfb767-972a-4b21-a088-d7c7b68c29c5@roeck-us.net>
 <PH0PR03MB6351C0B2AFC4CDD92F67AACBF1C32@PH0PR03MB6351.namprd03.prod.outlook.com>
 <0b555e2e-f687-4ea2-8b7d-cd80342fdaf0@roeck-us.net>
 <PH0PR03MB63514193F4A54535036B3A40F1C22@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <PH0PR03MB63514193F4A54535036B3A40F1C22@PH0PR03MB6351.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/26 00:28, Torreno, Alexis Czezar wrote:
> 
>> [External]
>>
>> On 7/19/26 17:42, Torreno, Alexis Czezar wrote:
>>>>>
>>>>> [Severity: Medium]
>>>>> Will this strict equality check cause issues with future hardware revisions?
>>>>>
>>>>> The commit message mentions adding support for the ETNA8+ version,
>>>>> but if a subsequent hardware revision probes with a manufacturer
>>>>> revision greater than MAX34451ETNA8_MFR_REV (e.g., 0x0015), the
>>>>> outer check rv
>>>>>> = MAX34451ETNA6_MFR_REV will evaluate to true, but this inner check
>>>>> will fail.
>>>>>
>>>>> This causes the code to silently fall through to the else block,
>>>>> regressing to the older ETNA6 coefficients rather than retaining the
>>>>> newer
>>>> ETNA8 ones.
>>>>>
>>>>> Could this use >= instead of == to maintain forward compatibility,
>>>>> similar to how ETNA6 is checked on line 328?
>>>>>
>>>>
>>>> Please comment on Sashiko's feedback for this and the next patch of the
>> series.
>>>>
>>>
>>> Replied to Sashiko on both patches. As patch 1 got applied, will wait
>>> for it to appear in hwmon-next before sending the fixes. Thank you!
>>
>> That patch was a bug fix; I applied it to the hwmon branch. I plan to send it
>> upstream in the upcoming week.
>>
> 
> Hi Guenter,
> 
> I forgot these patches 2 and 3 are dependent on patch 1 (the bug fix). How do
> I send the revisions to hwmon-next? Should I rebase my patches to hwmon
> or wait for the upstream?
> 

I just sent the pull request, so both would be possible options. Just remember
to mention the dependency.

Thanks,
Guenter

