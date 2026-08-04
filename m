Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B0636AB4D
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851989; cv=none; b=bYILaF7ufRzrslM7DMIm3dmZzK9NBUCPUelKr6TZr0c5sfIbGwjApVsqJGIewifQcPtUxrT+Qw5MGU/4GL/7vtx8UHzr1NOvsxkXKde44VFh+G7PHf9d0+4KpNAR9B0NL/mwnQyozdIFOhMq6PKKfTbbkaxnvmYcnfyaOLKEWVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851989; c=relaxed/simple;
	bh=EH09jQFTeWoHs309HdbutoKTeCUYz35kcR8BLAhCyAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SN69KFxUGIlH1lmXIcqwrFx3aG1mNYkP7MYS8v3izG9+gUZlDmkEhSc0AeinyV8aMpW/u+YxPfCedChBLY+hftQ9f1rkonzA3rx5nTSiRoKebEPtfLjpWImy7Z8EjrTqluWAOyVikiLrrJfIO4LqHUqRbbbK3ySuI1HQquh7Sr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKfsPt/8; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKfsPt/8"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so3516135a12.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 06:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785851986; x=1786456786; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=937XXt70UD99/sTdtME9pl+I5/+mWs4NA437Z4HSSMg=;
        b=WKfsPt/8O6lwa9JnW0P6m8ml43Gjywl8JwUhqRbsoRL/Ag2VqC6Td3ZbfRT48rDH87
         G3mI+sA6qLCPm4U7XT+3r0PiFqW/Vb3TNEU7Q68W/eEDOgaL9L5MhzZtb3aXMVmmxXt/
         TQdlNhJK5O+HiaECxI/IPNPn0oAAAbO81+hZD0iVRVU8SuaTtEfZ7zzeutZkz5i78nwt
         kXB4EmjN+mfFW+tL/Xz0gXc8If3iu0vilTdKiyg/8P3R2PIJ+bQx1Fc5zbblShId6wC0
         T+iZhxC6eIhbdF/2c3pzh+LX0OJhDl2ejmvZzKFD604Vb2hRzNq9C9DhXrb2+zoRKAmW
         o3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851986; x=1786456786;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=937XXt70UD99/sTdtME9pl+I5/+mWs4NA437Z4HSSMg=;
        b=lEzq9t5tXMNShAGwyd/rnfRsVlhcuHGnE3+4Io+6Q7xAhxwCGqtYswFyhsWtjzWSZM
         GCIYkvwDoqYl1viDNNRN0wMvbjTziVtpJAonaioX/p2JLngJ580j1zszOhWbquw4P6v7
         eCRrkf+T1IW3B66yDZb7Ncqi4herOCmSzhpRm3k/C5Eoe+sSIJVLjh/f/9WrwIjwFeIN
         Xw2bGHABmh3vMDx1RFUq3tA8Bza4wyYr9uzcmOdP5uekIg2l8iW09jgFoPpipr03/70A
         nj79C4mxJnkeuYYhucuYIW6yVnBqwevFAvnQ63qEwuxlGFWNQGWahHvyWJpWfUUQKTvs
         6SGw==
X-Forwarded-Encrypted: i=1; AHgh+RoqWQTmh3DPEz0029y6i0sCfkzAWXjnGcbxePiIpoLKWNlLntTA7ryCpybGKrXVS81eew01qrZ/unDMhq2hdwc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6jmg427Rpqkl8WeXBN1xeWLx9M0Xu6/il5jzDUdfzfGiMzAY/
	O8G5JIAaAHbs2iYnNoc2dIFA39uiPy0u0vQOJ3Uei7gczldszq+upKfD50qmGA==
X-Gm-Gg: AR+sD10i1RYUxHJgtLbO16CeTsGd+rmDWEmyIFTI5klZ5eakogawp6Od7QwGuBE0d32
	gQCdNF3GortRm4AA5ZmDHCubi21CaUu4VOds07sxbqk0YrWt3PUt7Myk4esVmR/4eTV7oIENUlb
	VDd8wpPP0bHV08ANmdfBQ+mKm1aw4N3nXDWIZDdRdbYTpcatBrEF84V90CGP1zrp9aSJOkRKQ/9
	YFktAV/o6qm2fGkT41QOwfHe+HWlUiUygrw65QGsahhXa4TNFE8XSh0E+Ia+FO2KM3zj5k0dYHl
	7k+dNhkeY84GgtWwN0Dy3mR3jBWJ/5MeR087aIvmXZXCbjk61L0kyjjDSUeAVaYTD8SAAFfaHf4
	Bhv4yvXhtKBPqHex7ia/pTjne49egrbMlVNMvX/xOVpnJIL0fvdYDaTvSehpEu3QKdINnhvp7zs
	bfA5rdPHchxAlHpbVv699iQvpfU5Q0JEUCrO+l+2RTndQhUwgDnziPDZGxf9XuAXfJ5bdKdMe1A
	PjCh0mUw9m7u99iX6QiHyIYvK9udGQ4MtxllFzPM1pahwp/
X-Received: by 2002:a05:6a21:398e:b0:3bf:63af:855 with SMTP id adf61e73a8af0-3c92a4d6fd0mr15013628637.1.1785851985934;
        Tue, 04 Aug 2026 06:59:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586402e53sm8207973eec.11.2026.08.04.06.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 06:59:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5b9ab157-faef-41d3-83a4-62fcae83a524@roeck-us.net>
Date: Tue, 4 Aug 2026 06:59:44 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (ads7828) Check return value of regmap_read() in
 probe
To: Qingshuang Fu <fuqingshuang@kylinos.cn>, sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260804091719.651479-1-fffsqian@163.com>
 <20260804092412.59EE91F000E9@smtp.kernel.org>
 <48933be.818f.19fcc44b0e9.Coremail.fuqingshuang@kylinos.cn>
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
In-Reply-To: <48933be.818f.19fcc44b0e9.Coremail.fuqingshuang@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/4/26 03:14, Qingshuang Fu wrote:
> 
> At 2026-08-04 17:24:11, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>
>> Pre-existing issues:
>> - [High] The driver ignores `-EPROBE_DEFER` and other errors from `devm_regulator_get_optional()`, improperly falling back to the internal VREF.
>> --
>>
>> --- Patch [1]: [PATCH] hwmon: (ads7828) Check return value of regmap_read() in probe ---
>> commit 2a7377992af717bb6d251109d28baf026bc4a665
>> Author: Qingshuang Fu <fuqingshuang@kylinos.cn>
>> Subject: hwmon: (ads7828) Check return value of regmap_read() in probe
>>
>> This patch checks the return value of a dummy regmap_read() used to enable
>> the internal reference voltage in ads7828_probe(). If the read fails, it
>> logs an error and aborts the probe instead of silently failing and
>> registering a non-functional device.
>>
>>> diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
>>> index 149cfcec78dcc..91ef0c4a08c4e 100644
>>> --- a/drivers/hwmon/ads7828.c
>>> +++ b/drivers/hwmon/ads7828.c
>>> @@ -112,6 +112,7 @@ static int ads7828_probe(struct i2c_client *client)
>>>   	unsigned int regval;
>>>   	enum ads7828_chips chip;
>>>   	struct regulator *reg;
>>> +	int ret;
>>>   
>>>   	data = devm_kzalloc(dev, sizeof(struct ads7828_data), GFP_KERNEL);
>>>   	if (!data)
>>
>> [Severity: High]
>> This is a pre-existing issue, but does the driver mishandle errors like
>> -EPROBE_DEFER from devm_regulator_get_optional()?
>>
>> Looking slightly further down in ads7828_probe() in drivers/hwmon/ads7828.c:
>>
>>     } else if (dev->of_node) {
>>         diff_input = of_property_read_bool(dev->of_node,
>>                                            "ti,differential-input");
>>         reg = devm_regulator_get_optional(dev, "vref");
>>         if (!IS_ERR(reg)) {
>>             vref_uv = regulator_get_voltage(reg);
>>
>> If devm_regulator_get_optional() returns -EPROBE_DEFER because the
>> regulator driver has not yet completed probing, the driver ignores the
>> error. It proceeds as if there is no external reference and incorrectly
>> falls back to enabling the internal reference.
>>
>> If an external voltage reference is physically connected and specified in
>> the device tree, could driving the internal reference onto the same pin
>> result in incorrect ADC readings or potentially hardware damage due to an
>> electrical conflict?
>>
>> [ ... ]
>>
>>> @@ -166,8 +167,13 @@ static int ads7828_probe(struct i2c_client *client)
>>>   	 * voltage needs to settle before getting valid ADC data. So perform a
>>>   	 * dummy read to enable the internal reference voltage.
>>>   	 */
>>> -	if (!ext_vref)
>>> -		regmap_read(data->regmap, data->cmd_byte, &regval);
>>> +	if (!ext_vref) {
>>> +		ret = regmap_read(data->regmap, data->cmd_byte, &regval);
>>> +		if (ret) {
>>> +			dev_err(dev, "dummy read failed to enable internal VREF: %d\n", ret);
>>> +			return ret;
>>> +		}
>>> +	}
>>>   
>>>   	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
>>>   							   data,
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260804091719.651479-1-fffsqian@163.com?part=1
> 
> 
> Thanks for the review.
> 
> The mishandling of -EPROBE_DEFER from devm_regulator_get_optional() is a pre-existing issue and is not addressed by this patch. This change only adds error checking for the dummy regmap_read() call.
> 

In other words, it fixes a non-problem while ignoring the real one.

Guenter

