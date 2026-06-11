Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F8A391E6D
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 17:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781199868; cv=none; b=K/6IchzCPaAJA6iYQDd67Wwoytplom4RZl0OQZwUUSe7ScZQwyT82dxE3l4/gE0hAK3S4GAlWGFxBmemJsizqZiZ7+SkJg3iYToHrBd3luWwGQMXfFpnABaHNSGw2G1sl2e30J7xv6q16lzUcKw1gNJq+Yw3uwLNwdduoIeXdR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781199868; c=relaxed/simple;
	bh=9eF9y6klp9yUkeVGfh/71CAzDVsb592/NSi8sGVGmAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnNAAJXZ/Buxm5EzHwnsd0ZAKQae+eOoUSJ5WUZsBO88LtvoZday8VxMhxft/vdCzG9ethYk+/tIpkNZEYSLuJsQvqRlTjKZm/ucSeuOjnrEC2A+3HehC/XimDqaROH/CEZhLFzz9InBtG+xzxZs0bkwNU3yXU/yJ+kqC/2qu5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LkMnBz36; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LkMnBz36"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-842cd900ee0so113181b3a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 10:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781199866; x=1781804666; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=W93Z3lycQScXGmRNGQfKjAdgicdhZggI74rQJaRLrE4=;
        b=LkMnBz36VWZUBJt556RiREF8SVEoBBef8ymNd5UP3UWd5PGTbyU9fjlVN02/09V0td
         CIST5g0GMAJEvXBm3XPY7HIEm6jE/SD0XpabDg+YkUlPe+V7q2vg9mLYY+vvZamA3R0I
         3E2zUM1zGNAZ+Qif1CY1N0yHRsqEyKcotTxThOwCUgE0/6SNO1zDlbdzXNnB9MWJegVB
         fPg0hlV9PmeKKA79gyDj+veCxAvoFr9rLmuikwzhw/DcQFjIU/LiaM9+1OVyCX+1K5Z/
         dI8d5ydNkueIa3RtfF768ytPcGuph1vAmIrjsctcbTKuHQI8Iva/dlbMJAHoaI/ybq+s
         Z/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781199866; x=1781804666;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W93Z3lycQScXGmRNGQfKjAdgicdhZggI74rQJaRLrE4=;
        b=NDes2JzoflCtA9xOLjYbRzUydWXObASrQ+sfRL8wZgqWHcYpR8sW/QnbviUU8DBgiP
         ETNm+sh7WdKlv6mZ2CxB3Z8xQmjwNb/pFN+FgRIBfaspv0Pr9iqdnv29CHfzfVBVRE9s
         5vk6KDUd/03bPfqEUmWpqg3P2lRUqRj3K5SXl0omEOkl3lOmyxi4xptZAqZ+OAcDgRU8
         OVdhAMoCDQY3wAq1TE+8+RM3NiD+9FrWaRa+AqWGJtLcjk0Cppy0+oATmulhLo4ime+l
         vsiMtLcgHLRWc71N1/hmc65KgvKziM0RfvdOI9APCph7nOJ6xY0RSGZ+mGMf8EklwweM
         KoUQ==
X-Gm-Message-State: AOJu0Ywz/bkFsKrk4Bf8Aqhl6/jLemdI9kNY/6F7bTN0yHr5tTafW5Tf
	HZ+1ujNQ1ebJe0+mhN0I2K5sjAvkeNlU25vyqBVQfakXdY4pWizfVIhejiuJjOVk
X-Gm-Gg: Acq92OGK3RbrOg2DZhTkkn4c+Qknbs9uyLlWcGGGjziBpUFiSuyPrWKj3DO0rWi4VV1
	q10ntbdreQ5VypKYQXL7Y2DSXa4LlS54s29vPTtvG+pl5tMJgA7aBjY+yxACjtRVGFu+IJEZ107
	iHj32ki325KGCiqzzA2rpKiKBHTZF1CfZxjwimXh83SPD1gwyzH+MQOQXbhm5KAKjKPOXIpJEGy
	GPcuAVa35gs07H8SShxnGoNkRcw6m1itys/AbeKsYzv6zuyq2nfzXPfPSqQkLFWDBVi6APN8y18
	0gAq8HHhTDnxyLd+psOCym4Q9BhplUIzDolGi2qTDPPbDt1lsu/LgHMg4o7I4w6t4h4kbPKKv2t
	P51YjEOJmI+/ITA6SzcfCSUWDzIH3lM3Cx2D+1O/x1uuLgM1v8vzK4j+aZF3NqKU+g4ugptaBjD
	G2fM6IPBAEt/hwv+ZBPp/pVKKTxKi8JjX0TUWAUAlABMxEWJpp56RxfXGsplna9j1spD6jIOFR
X-Received: by 2002:a05:6a20:3d09:b0:3a1:90ef:7e46 with SMTP id adf61e73a8af0-3b5e33a2586mr4609567637.33.1781199866394;
        Thu, 11 Jun 2026 10:44:26 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8658811b30sm2340615a12.25.2026.06.11.10.44.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 10:44:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5bb4e945-7030-48b0-9cdd-4cf4a3866a07@roeck-us.net>
Date: Thu, 11 Jun 2026 10:44:24 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: add a driver for the temp/voltage sensor on
 PolarFire SoC
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
References: <20260611-blank-footprint-5504b819baec@spud>
 <20260611151316.685561F00893@smtp.kernel.org>
 <20260611-disaster-cadmium-91745bc1931d@spud>
 <4a5f47d6-90ac-4365-b4ae-02d4ca4d31d4@roeck-us.net>
 <20260611-strained-cadet-7ea5fd2cba19@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260611-strained-cadet-7ea5fd2cba19@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/11/26 09:57, Conor Dooley wrote:
> On Thu, Jun 11, 2026 at 09:41:49AM -0700, Guenter Roeck wrote:
>> On Thu, Jun 11, 2026 at 05:21:41PM +0100, Conor Dooley wrote:
>>> On Thu, Jun 11, 2026 at 03:13:16PM +0000, sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
>>>> - [Medium] Negative values written to `update_interval` are incorrectly clamped to the maximum interval instead of returning an error or clamping to 0.
>>>> - [Medium] Reading `update_interval` inconsistently under-reports the configured value due to integer division truncation.
>>>> - [Medium] Hardware sensors are enabled in `probe` but are not disabled on probe failure or driver unbind.
>>>> --
>>>>
>>>> commit 91a403f5c5eef9fbcfcab3857179dc2f03ad3c89
>>>> Author: Lars Randers <lranders@mail.dk>
>>>>
>>>> hwmon: add a driver for the temp/voltage sensor on PolarFire SoC
>>>>
>>>> Add a driver for the temperature and voltage sensors on PolarFire SoC.
>>>> The temperature reports how hot the die is, and the voltages are the
>>>> SoC's 1.05, 1.8 and 2.5 volt rails respectively.
>>>>
>>>>> diff --git a/drivers/hwmon/tvs-mpfs.c b/drivers/hwmon/tvs-mpfs.c
>>>>> new file mode 100644
>>>>> index 0000000000000..48de8d98b3444
>>>>> --- /dev/null
>>>>> +++ b/drivers/hwmon/tvs-mpfs.c
>>>>
>>>> [ ... ]
>>>>
>>>>> +static int mpfs_tvs_interval_read(struct mpfs_tvs *data, u32 attr, long *val)
>>>>> +{
>>>>> +	u32 tmp;
>>>>> +
>>>>> +	if (attr != hwmon_chip_update_interval)
>>>>> +		return -EOPNOTSUPP;
>>>>> +
>>>>> +	regmap_read(data->regmap, MPFS_TVS_CTRL, &tmp);
>>>>> +	*val = FIELD_GET(MPFS_TVS_INTERVAL_MASK, tmp);
>>>>> +	*val *= MPFS_TVS_INTERVAL_SCALE;
>>>>> +	*val /= 1000;
>>>>
>>>> [Severity: Medium]
>>>> Will this return an incorrectly truncated value for certain intervals?
>>>>
>>>> Since integer division is used both here and in mpfs_tvs_interval_write(),
>>>> the truncation can cause the readback value to be lower than what was written.
>>>> For example, writing 7 ms calculates `(7 * 1000) / 32 = 218`. Reading it back
>>>> computes `(218 * 32) / 1000 = 6` ms.
>>>>
>>>> Should DIV_ROUND_CLOSEST be used for these conversions to ensure the value
>>>> survives the round trip?
>>>
>>> Hmm, this is actually a good point that I overlooked.
>>> What is the desired rounding behaviour here?
>>> IOW, should asking for 7 ms produce the closest interval less than 7 ms or
>>> the closest interval greater than 7 ms?
>>>
>>> A consistent rounding is better than rounding to the closest IMO, if both
>>> update_interval and update_interval_us are going to be supported
>>>
>>
>> Not sure what you mean with "consistent rounding". Effectively the current
> 
> What I meant was that it would round to an interval that would either be
> at least (always down) or at most (always up) as frequently as requested.
> If, for example, the interval was set to 7400 or 7600 us via
> update_interval_us, and then read back from update_interval, that the
> rounding used for that would do the same thing as operating entirely via
> update_interval and always display an interval that was at least as or
> as most as frequent as the configured value.
> Rounding closest would of course produce different results for 7400 and
> 7600, with one being more frequent and one less frequent than reality.
> 

I must admit that I don't understand what you are trying to say. Either
case, your driver, your decision to make if and how you want to round.

Thanks,
Guenter

