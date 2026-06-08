Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F78125B0A5
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 16:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780936305; cv=none; b=A/8D4BrP/Tp41llGOA/FycZ76wiaVmhKiELUmN3hfNctCOp68JQ90UozO6uU6ADDgtr0V9ayGCqt6SPzuYrbvXse8lB980OqNckG2Chz0O/ceLuj1svdFhO+2JLnoC/AkZIA6qoq4MgrodhnLRezypbiG4kDyY1KATAoLa9Epbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780936305; c=relaxed/simple;
	bh=AgOAHgkMpIHvXnG4ionYgb96XvfEVLDR9FeDACc3j+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JwOreOFCKFHdqRULHd+FlPdd/kDSAB2Rarqe8rqUhxssYVTTyZtp01bhXVUUqTP9j0DUE3rQIdB9EwzkyMbpeqDOlyz8rpM/w5g4mn++V4PkwmoUxPDJUaa2pNY5Tf9X/UGRvxGd6XHSgeMqI+d7LnFHNPSizzCxx8vAeqMADR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hgm7pRmp; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgm7pRmp"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-137dd523634so7095661c88.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 09:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780936303; x=1781541103; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5BKy7hcNH0tq6+/srIEo3sBbzY2ejx5gBIEKniIcNIM=;
        b=hgm7pRmp1qCwcHp9JcDmVyK2NizDIIjrBdLXFarscbc7kigdUqPq+AzntgL/xX0BdD
         A81alHjEUwczke9/AsDwy+00tpyqnvYWgSV0GRHEBCpSJN0a+Yo+IAoyHacjNz5txgSG
         dqdZsBW//HHMi9hirLYNylJg84drmISmHhzBPBYn0ZMSWewhkoYl67e0E+jH07P6y67q
         WQpeIm2+xr7xLDb3dvZkwxgHP8uQnWYIaX8u57eKCos9e52hnpCYp40HLVQjGSunnqlJ
         q/HjjHXlYEDSQl1vy5ZrrcLX5tpNV7nHfTQw5JP6saqhrsPiiv93LiirFRTJdAIkSNSF
         MWKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780936303; x=1781541103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5BKy7hcNH0tq6+/srIEo3sBbzY2ejx5gBIEKniIcNIM=;
        b=XH3J5IbPS6RfmGq25hLMz+UMGfDTTLaEZHrDP8hyES5xcIsborl18AYRDWu+Xx4Arv
         f/08NRjSB0Qg/IgZgq31RNKcQH31IDb+i4z07EltjWD5iGF/MQhygVq/Z9qkaQ2ukSoq
         Ck0yqLTjA4v/Nk2k34b/Qnkj6vW1zF/4gEQbFIyD8dgx//xrJym/HqpZWlskLcfDkUZn
         M0kJLaadxpwk+Ju7c1hxLj0rBPTgNak0B7YbyTnnaldosCP2rmLeYku5+ZxDINaf9M/r
         83sEU4VUGMXOhpXo/r5oNHv14pSBvQJ+dDU/h2MdJqJiahkltTwZ+7c64ia0NF0DlyWG
         Atiw==
X-Gm-Message-State: AOJu0YwACHshgY6PGpsCjTB73rbyQax9FpBAWSGbQHyDyS4igwnUowSs
	Or3a3Ratiqf53eD/tlOwlDlsBQ+9hLy0wK4Vue1f5zwT0gRnhQCFoS7SKwt9aNRk
X-Gm-Gg: Acq92OGEWuD+T95BycoFdcQK1IqXXJ17BEuVp9Qw4lD6wOjuiMdRy4AyINcabmAwoUX
	IBtNfNBbjpZqNcSRnhRGWpPcySgmj3oPfuJ6fr2UPnv4ZsoEdOtc6mKMdiwpMk1fQMK5ybVNGMV
	TuL5KGamq/jp8GFTifZuRNlY9psBwaiQsEBCnr8P3HwolJqzrxI4n1ccZyNtaDhdjoE+IAwpH9J
	2X2uAp/U+EryXeN/tj0WgcyDc5s/3HhdibqyrJYa444MoTWotmhWSqkr+IiCrDSV4BmehNvL2CU
	0kJscX9MdymvXL/BmaHoxjX59LvoQlNzgRIOswBzflVly/N5NJUUhD4Jt0hcBdj9/ie0nNlBFqs
	CJnHaokEuicDIWw06rU4Dqxb9jV2gsh0/7uJcDsBnhRmhDBAdCFfmZbiLxAmH0AIPxhX387fU4s
	PYufsC4aJ6gnhKM1zYDTc2csRlhukWcmHc+uzFfzjyb9v0Dk9Ay+aQKeT7JpNajJithvSId5qOh
	dCnk7oc5Js=
X-Received: by 2002:a05:7300:6c9e:b0:2f2:5c68:5074 with SMTP id 5a478bee46e88-3077af66474mr7826964eec.13.1780936303110;
        Mon, 08 Jun 2026 09:31:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df191d0sm25737757eec.21.2026.06.08.09.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 09:31:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bbb0b077-f59d-4d15-9437-2d46a1dc4ec1@roeck-us.net>
Date: Mon, 8 Jun 2026 09:31:41 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] hwmon: ina238: add support for samples and
 update_interval
To: sashiko-reviews@lists.linux.dev,
 Ferdinand Schwenk via B4 Relay
 <devnull+ferdinand.schwenk.advastore.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
References: <20260608-hwmon-ina238-update-interval-us-v2-v2-1-2d939fbb2ea1@advastore.com>
 <20260608131209.1EBD81F00893@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260608131209.1EBD81F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 06:12, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Integer truncation from u64 to u32 in `ina238_interval_us_to_conv_time` causes large user inputs to wrap around, resulting in incorrect hardware configuration on 64-bit platforms.
> --
> 
> commit 4bfb82fb9bb164125fe0facd52cce87c1d8b248e
> Author: Ferdinand Schwenk <ferdinand.schwenk@advastore.com>
> 
> hwmon: ina238: add support for samples and update_interval
> 
> This commit exposes the INA238 ADC averaging count and conversion timing
> through samples and update_interval hwmon attributes. It caches ADC_CONFIG
> to optimize read-modify-write operations. The conversion times are derived
> using per-chip lookup tables.
> 
>> diff --git a/drivers/hwmon/ina238.c b/drivers/hwmon/ina238.c
>> index ff67b03189f73..667f78d43a6a8 100644
>> --- a/drivers/hwmon/ina238.c
>> +++ b/drivers/hwmon/ina238.c
> 
> [ ... ]
> 
>> @@ -261,6 +296,97 @@ static int ina228_read_voltage(struct ina238_data *data, int channel, long *val)
> 
> [ ... ]
> 
>> +static inline u32 ina238_interval_ms_to_conv_time(long interval, u32 samples)
>> +{
>> +	u64 interval_us;
>> +
>> +	interval = clamp_val(interval, 0, LONG_MAX / 1000);
>> +	interval_us = (u64)interval * 1000;
>> +
>> +	/*
>> +	 * update_interval reports the ADC cycle time including averaging.
>> +	 * The target per-field conversion time is interval_us / (samples * 3).
>> +	 */
>> +	return DIV_ROUND_CLOSEST_ULL(interval_us, samples * 3);
>> +}
> 
> [Severity: Medium]
> Does returning a u32 here cause integer truncation for large user inputs on
> 64-bit platforms? Since interval is clamped to LONG_MAX / 1000, interval_us
> can be extremely large. The DIV_ROUND_CLOSEST_ULL macro evaluates to an
> unsigned long long, but returning it as u32 will silently truncate results
> exceeding 4294967295.
> 

I think Sashiko has a point here. Please make sure that there are no
truncation issues. It should be sufficient to clamp the original value
against (0, INT_MAX / 1000).

Thanks,
Guenter

