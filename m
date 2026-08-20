Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DF1145B27
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 01:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787188017; cv=none; b=Jnj1vrhZhPh+XwvpsoBSIQbecLL91PyF4nZ0WJ1VAya8WhpRRDQCzvUthFTVc2Tgg6T1AB/YI7yRmItm7XTteogXnuefNJAil0ZI2RBpHtWCh2KtWr0ImCxHaT0SL0X+iNZsC+x8lM3TtOwdQjIv14t/yk1/px86quFkdvep4AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787188017; c=relaxed/simple;
	bh=Uuvqvm9mfg5T5IQT0LKVnIXEIyZhbPwpS2trFNrBETU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTJc+jAZ2dPjCj5LkVwHyudsj+ENOkvoiECiXBhRTTlloKsRtg0vAc1StijQ9fnBkvORkRGTKkZTm7PisaI8tTOCndYFV1DvYzMfqc++zJQPGdi3Io+sMC2U12A4SLInUcziXRbaIMWfQxj3rSCANpT1bthn2IZoTjgoYBXA5Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYvxPWb/; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYvxPWb/"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso2050887a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 19 Aug 2026 18:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787188015; x=1787792815; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bgxWYN6UqbEyC1+LxoNwhIkrJ7McHuzDkGEeX5D8eIQ=;
        b=oYvxPWb/38izn+Q4xZ/E1czW1VEL1Flxs8WtEEqBgfgZfOhBtz1dNTafoOgaI+yfWW
         pCewTr98oXsSvRrR7Om3yl0lJouCtVrbOAmkIkjICIlClID3xx2MbCcTdte+hz3uoBN/
         FSxzt8wLU+PYaSrzfalMguMRWZqmD3blYC+tgAOJ3FghtITmljlayMlASjHGajF3Tiq4
         2wWOk4lc6oCdYtGsJpwQ6MHVXG3l4V/DD3n0U1kCpNPglVQacGLbxPnpdb0W3tjmxECz
         1nBflYQFnNOVJiuFN5bb2zjdA/BPIDeB2jS2PfjMulQI7u9vvOwJ3WhqlPBaAp54RbFJ
         3jcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787188015; x=1787792815;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bgxWYN6UqbEyC1+LxoNwhIkrJ7McHuzDkGEeX5D8eIQ=;
        b=Bqr0S4YZwi3vQDEF0VMHW18FRsj/wDTPaoOimFynqFzL+NUZBRIHCyqAQ22QbGzjB0
         nLqyGtk4uqBmpFh7EIR2GLdY0vjxi8HYv6tx7znDcUC9ib1GOrDAhPyUowcJNQ21lNGA
         5RgVd0fmqSlw4V5Dt6ZJq6+Qdx8xV5w96tEqnTGfkI810Rtsny5zgcg54flg+JgIE+zz
         VtGzC0PbJK2Pnka8ap3t1CbRwKLa2EmyypKj0FNBzkGL4Fabi7uc16vkO/PZQ8/xTmTi
         +PXid1QlQyK5E7Be62OgBGAdnkLAci6brxFUmuw9gbzXHrQN2HaLkjj/1jJk1h5VTOEa
         Lj3w==
X-Gm-Message-State: AFuF++mCmxp4NaORbX1EsSTFabMnltrovP+WAyOjLOkrR13X8AwG4CZR
	Q6t0Cm6nTLtFJD0/5TJODMPOQMt0GZexfSC6mIIEa0uSX1kz8GoJM5DG
X-Gm-Gg: AR+sD104wQg56zBcr9IeIsgPll6VjYfT2mzoO98RyjeoGpxM/nOdUa+OoFov/vQXsbp
	XWg1ocfoDxBRr0buNPH6h7aMKnh7vqb3utmWAi9z1m4TJz2cEeScqmLY+lciJYUJnr3Y1wqrLaJ
	2wAurMKWl19xUCqu6GDBrRKx81q+jcJKwyEj+3wjs81wO5RTs+8bwBDztDERCsv5Nm9sh1LKSwS
	G0AQHiK0ZwRBdos5hAFk4c3upZPso3t2e9y6itVvuxEeDZT3khGrNjMLVHpQ4LWVA/lmS7bLyLI
	SoevV+WA99h6Tt4A3VOEwFJZmPbMOZI5kaXureOAKjJiH4jdlJ61V3zmsBp7xQ4VnGeL7G9k0On
	MjF7/fMptOFeB3Q/djLJ4xQl77vwEUiwcyBAu360iMq+3K5bOdh2C2aG1jciieh1XLlH9Rchytp
	l/T5IV0pd/N7uK6hhl2uK9DPdcVANR0EkzjBPQ1tsmSBb7K2oXxl7bslAX4V0hSPJAGPJetPYpL
	x9bNrpEgHbNVy74HL2R5ajWpeIk80ShUWSD4H1wjGdv/kAJ
X-Received: by 2002:a17:90b:3c8f:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-395810e9626mr17401300a91.15.1787188014899;
        Wed, 19 Aug 2026 18:06:54 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fbbc017sm4998829a91.15.2026.08.19.18.06.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 18:06:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <01a0682b-b7ec-45f0-a19d-df40ed6366a2@roeck-us.net>
Date: Wed, 19 Aug 2026 18:06:53 -0700
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
 <d8191041-a4bc-4674-ab9e-7fb56ca2b56f@roeck-us.net>
 <cTie_daC2kaIY2BT6HkyAeivwspRhq3thkrkGDMVdIpF2vF5Vr38HQxPcvKFK6pvWatAFk-CO7XL2uz3OCfDSwI-EOxQqI8hNylXjG1jrQI=@protonmail.com>
 <XNt95pVriUNFbMMYsr5mnQo9LUABboJjUMboxV5mWYj9FQJb6XGjsGkGRre7eSK4bvCG4oOuTg4YNiujCpX7ZlonVgQSHFBEzpFvZLFTXtw=@protonmail.com>
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
In-Reply-To: <XNt95pVriUNFbMMYsr5mnQo9LUABboJjUMboxV5mWYj9FQJb6XGjsGkGRre7eSK4bvCG4oOuTg4YNiujCpX7ZlonVgQSHFBEzpFvZLFTXtw=@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/26 16:36, Aiden Isik wrote:
> Hi again Guenter,
> 
>> Hi Guenter,
>>
>>> On 8/18/26 12:35, Aiden Isik wrote:
>>>> Hi Guenter,
>>>>
>>>>> On 8/18/26 11:33, Aiden Isik wrote:
>>>>>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>>>>>> - [Medium] Missing PMU counter enable configuration for Exynos5515 watchdog.
>>>>>>> --
>>>>>>>
>>>>>>> --- Patch [2]: [PATCH v3 2/2] watchdog: s3c2410_wdt: Add exynos5515-wdt compatible data ---
>>>>>>> commit 9ce360e3c933b7447ba5da9ba1b7ae3fee989703
>>>>>>> Author: Aiden Isik <aidenisik@member.fsf.org>
>>>>>>>
>>>>>>> watchdog: s3c2410_wdt: Add exynos5515-wdt compatible data
>>>>>>>
>>>>>>> This commit adds driver data for the Exynos5515 SoC's watchdog timer.
>>>>>>>
>>>>>>>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>>>>>>>> index e31f93db05096..5592f25fe6c83 100644
>>>>>>>> --- a/drivers/watchdog/s3c2410_wdt.c
>>>>>>>> +++ b/drivers/watchdog/s3c2410_wdt.c
>>>>>>>> @@ -232,6 +232,16 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
>>>>>>>>     		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
>>>>>>>>     };
>>>>>>>>
>>>>>>>> +static const struct s3c2410_wdt_variant drv_data_exynos5515 = {
>>>>>>>> +	.mask_reset_reg = EXYNOSAUTOV920_CLUSTER0_NONCPU_INT_EN,
>>>>>>>> +	.mask_bit = 2,
>>>>>>>> +	.mask_reset_inv = true,
>>>>>>>> +	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
>>>>>>>> +	.rst_stat_bit = 24,
>>>>>>>> +	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
>>>>>>>> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_DBGACK_BIT,
>>>>>>>> +};
>>>>>>>
>>>>>>> [Severity: Medium]
>>>>>>> Does the Exynos5515 PMU require explicit counter enablement like other recent
>>>>>>> Exynos SoCs?
>>>>>>>
>>>>>>> Other variants in this driver (like Exynos850, AutoV920, and GS101) that use
>>>>>>> the NONCPU_INT_EN PMU registers also pair it with a NONCPU_OUT register and
>>>>>>> the QUIRK_HAS_PMU_CNT_EN flag to ensure the watchdog counter ticks.
>>>>>>>
>>>>>>> If the Exynos5515 hardware works similarly, omitting cnt_en_reg, cnt_en_bit,
>>>>>>> and QUIRK_HAS_PMU_CNT_EN here might leave the counter disabled and the
>>>>>>> watchdog silently non-functional. Could you confirm if this variant needs the
>>>>>>> counter enable logic?
>>>>>>
>>>>>> Exynos5515 does not require this.
>>>>>>
>>>>>> Downstream on GS101, as an example, has this struct member set:
>>>>>>
>>>>>>> pmu_count_en_func
>>>>>>
>>>>>> This is not set downstream for Exynos5515, so it is not used for
>>>>>> Exynos5515.
>>>>>>
>>>>>
>>>>> You keep talking about "downstream". What is that ?
>>>>
>>>> By "downstream" I am referring specifically to Samsung's Linux kernel
>>>> fork for Exynos5515.
>>>>
>>>> I host a copy here: https://github.com/Aiden-Isik/linux-android-lucky7
>>>>
>>>> Also in this message I refer to Google's GS101 kernel fork, which can
>>>> be found here:
>>>> https://github.com/LineageOS/android_kernel_google_gs101
>>>>
>>>
>>> Both are completely irrelevant for the upstream kernel. I am most definitely
>>> not going to look into that code. If there is anything relevant - such as
>>> the comment you pointed to earlier - you'll need to provide that as independent
>>> comment(s), not just refer to some downstream code as explanation. The
>>> explanation needs to be provided in the _upstream_ kernel code.
>>>
>>
>> There's not really any explanation for it other than "that is the way it is".
>> Samsung designed the Exynos5515 watchdog timer to not have that quirk,
>> I read the downstream code and learnt that fact, so we don't enable
>> that quirk.
>>
> 
> Just in case I am misunderstanding what you are asking for and you want
> examples of how I know this is correct to be posted on the mailing list,
> here you go.
> 
> Unfortunately Samsung doesn't publish technical specifications for their
> modern SoCs, so the best documentation we have is their own source code,
> which doesn't really explain the *why*, but it does explain the *what*
> and the *how*.
> 
> I'll do my best to explain it concisely and how we drive the hardware
> in the same way upstream:
> 
> Google (and/or Samsung since GS101 is Exynos-based) define the struct
> for the watchdog timer like this:
> 
>> static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
>> 	.noncpu_int_en = EXYNOS_CLUSTER0_NONCPU_INT_EN,
>> 	.noncpu_out = EXYNOS_CLUSTER0_NONCPU_OUT,
>> 	.mask_bit = 2,
>> 	.cnt_en_bit = 8,
>> 	.rst_stat_reg = EXYNOS_RST_STAT_REG_OFFSET,
>> 	.rst_stat_bit = 0,      /* CLUSTER0 WDTRESET */
>> 	.pmu_reset_func = s3c2410wdt_noncpu_int_en,
>> 	.pmu_count_en_func = s3c2410wdt_noncpu_out,
>> 	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT | QUIRK_HAS_WTCLRINT_REG |
>> 		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
>> };
> 
> Note 'pmu_count_en_func' is set.
> 
> Later on in the file, we have this code:
> 
>> if (wdt->drv_data->pmu_count_en_func) {
>> 	ret = wdt->drv_data->pmu_count_en_func(wdt, true);
>> 	if (ret < 0) {
>> 		dev_info(wdt->dev, "wdt count enable fail\n");
>> 		return ret;
>> 	}
>> }
> 
> Which will call the chosen counter enable function if that field is set,
> which will, well, enable the counter.
> 
> Now, for the struct corresponding to Exynos5515 in the same driver:
> 
>> static const struct s3c2410_wdt_variant drv_data_exynos9_v4 = {
>> 	.noncpu_int_en = EXYNOS_CLUSTER2_NONCPU_INT_EN,
>> 	.mask_bit = 2,
>> 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
>> 	.rst_stat_bit = 23,	/* CLUSTER2 WDTRESET */
>> 	.pmu_reset_func = s3c2410wdt_noncpu_int_en,
>> 	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT | QUIRK_HAS_WTCLRINT_REG |
>> 		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
> };
> 
> We can see that 'pmu_count_en_func' is not set, meaning that code within
> the if statement shown earlier is not called, and the counter is not manually
> enabled.
> 
> Translating this to upstream, if QUIRK_HAS_PMU_CNT_EN is set as a flag,
> the following code within the if statement will execute:
> 
>> if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CNT_EN) {
>> 	ret = s3c2410wdt_enable_counter(wdt, en);
>> 		if (ret < 0)
>> 			return ret;
>> 	}
> 
> Which as we can see does the same thing and enables the counter.
> 
> So, since 'pmu_count_en_func' is enabled on GS101 in the downstream vendor
> code, the QUIRK_HAS_PMU_CNT_EN flag is set, as the Sashiko AI points out.
> However, since it is *not* set for Exynos5515, that means Exynos5515 does
> not require manual counter enablement and that flag should not be set,
> which is why the AI's concern is wrong.
> 
> I also tested this (with the watchdog actually enabled this time), and it
> behaves as expected.
> 

All ok, but you do not explain all this as comment in your patches, you just
point to downstream code. At least some of that downstream code, if I recall
your previous feedback correctly, actually _did_ explain at least some of
this.

Example: A comment along the line of "According to <place source here>,
Exynos5515 PMU does not require explicit counter enablement" would do.
Sashiko does not know the context. I don't either, and neither does
anyone else.

So why exactly are you not willing to add such comments ? Please explain.

Guenter

