Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E345952B1FA
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 15:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188915; cv=none; b=scHUoocDI8aoEQSQKa5K8tYu5MkH1xqFfVY0KjWxUZeRwfgn7J/7rXRDYEo5OhrK/6D//J4/rQNonUeSpnAQ0ozuAIgO1Dasmw7yHKCtZ08fU947d3Pe+YHNntpCbYA8KNENesEXZRkwvtxO14F+RICgxH2tYrQIy4dfJEeH8pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188915; c=relaxed/simple;
	bh=aa0jBTsW/JXDtcKMDtqMSHuvl+U9c2RkzktfkdnVFdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L9P8+5EHffcKmqOtm6HJpTwM4g9okzG3+AcT4O+Cfl+yfvZK1mrRQ2svMFzp0ajfnaIkaDNI352hIKRBcl5rft8M3+XngnD4+KWUN1Ifs3kVwoysWzE+YOCWbDAJz2EVTzxgB8i+SwfhUjLGojz6K3D9L8OSxczmgjACY1J5Kzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATpAXxJu; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATpAXxJu"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-85339ed040aso3127778b3a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 08:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788188913; x=1788793713; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TGZsE5pPPeNtqINqn2XOWd3ygllW4wLJTLRsuLko6xI=;
        b=ATpAXxJukr+0iiczSmbWqJjHyuOYyJq6B876x3Y45N2EEbKm1owVgg58oclbKOik7i
         0/F1aXGgZMUa2VCeyhqgxbaPnd0xV4Ht/fKGpAesb95ypICaHAw+0pw/b4Z4ytQCr6yR
         kKO/d5Ny5kWPXkSDrj49HRWsJ63JfZsO/dyDaux7omRaGEel3lDC/yndGYMLism9h/Le
         +FkyzzUsK01YwZ23J9upTvRe+WY91dG6f3UVeY7RYj4lWlRMw3ggIuhVAAUeqSldfV7H
         QXrzlaL2w+RI8VOq/VmzifhMAFzT+GxvrUUXBSMfnbLY5j3Lv801drl4MWTlFNo57PwG
         Isow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188913; x=1788793713;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TGZsE5pPPeNtqINqn2XOWd3ygllW4wLJTLRsuLko6xI=;
        b=q8/E11tvVk3NCiBhNV2U3K8u9Az9+JjmLNwSx+6JAdtGrPjwCHiZmrcKMHf4Vnm7Vc
         tfJ2EErt2kuJiD72xgfWbPNB1X8+4HpXMo8ajZhjk+szvQfWW40SKIW1U2iU565ZgtEp
         GFBLJLbxQuEExzZrHTEyYcwq3GSjJXHpGiKONYeLFd2PvGJn3j+YzrY4IElwk7c9AJ6u
         igW0ifFPD0vY5l4Q3T5e597ab+3Ylrps4+bJCxinsRQK+2EPIxUiCYXw/Q85BKGq3+8m
         yKpIgwpoqMgt4myePawlhEJ2G0iuYpqDghoVFiIq8yKGQtSN7EO1uSO69yOm5++5A5S1
         nGQA==
X-Forwarded-Encrypted: i=1; AHgh+Rr33K+ZmMIADvpBVWmREoOsQvJDScbtHX7VT3EaiUiOx79wh2v5y2F/6MVyMcvDnwdWRy+WpfoF6ReaZj7djAc=@lists.linux.dev
X-Gm-Message-State: AFuF++lArKwAUEYlReQJVyOris9tJzPt+iAf935igduZq+Baa+ZHHhSk
	BdDU2TlkKQdSVwxegTxoNr1sf3eLD8zEXh9QODuZB8MXI6DxAGDFJr8Q0Vph/w==
X-Gm-Gg: AR+sD13svgZoC88yU0vsWB96OEHohkp2L6e01UrvfhVBDIsUmCBd3DS4Yog7o03JxsZ
	NWdkgLwoM2crd+A+Z7gtlo1oIGmr3MbIoe2gCi6YdK4c6fykZJGgMcs+F05Ug+zBiSsBcRSRi1n
	vG+ixneNfOH4uEcaDwMMpzcgQJik6jTN/Df8+I8DTQkUCy8R470OVK2CMMjQWIuxNv3ygYAOi6t
	FGNvRRUAbOf/g76LZzqevyG/Q1PMG1KjbUXg+RTM5XPO8St/ef3HqJXmpEAIxpc5VSk4lha2h2+
	gt7SF2EmwZy0NZUJqhVGFUgOOS31FxAdOwOxmRHTeeHm0dAeqkptD/df0PQwijvxN9Zb7aCORdq
	APQaIj6CfnsbDccMYrM0G9GgEAlX20cnnxkM1DhyIqhrTDHAmu56AqdDoV6FRcp3NxFOjMrX2hc
	uv0aAGvXg13oAJPw5HFxSV/mhWYkRw6ZZim9OayeLMzsHBC1oY7wejI0jYa4fmBZ+vVqtmouuEq
	pJ+40f84eFKNClvngWipMbCvvBOzfpSHHOyLg==
X-Received: by 2002:a05:6a00:aa85:b0:857:7384:b5fd with SMTP id d2e1a72fcca58-85b5c4d0ebamr2583437b3a.25.1788188913160;
        Mon, 31 Aug 2026 08:08:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f301f166sm4561693a12.0.2026.08.31.08.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 08:08:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b2636e28-4c54-40f4-b129-08ded94dd9e5@roeck-us.net>
Date: Mon, 31 Aug 2026 08:08:31 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (spd5118) Select page 0 unconditionally during
 probe
To: Armin Wolf <W_Armin@gmx.de>, sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260830233009.322206-1-W_Armin@gmx.de>
 <20260830234131.498F71F000E9@smtp.kernel.org>
 <b5c0b655-e158-430b-b663-70913a99ce9e@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <b5c0b655-e158-430b-b663-70913a99ce9e@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Armin,

On 8/30/26 16:48, Armin Wolf wrote:
> Am 31.08.26 um 01:41 schrieb sashiko-bot@kernel.org:
> 
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>> - [High] Unconditional I2C write in `probe()` before verifying device identity can cause permanent data corruption on mismatched devices.
>> - [Medium] Failing probe on read-only buses entirely drops temperature monitoring capabilities.
>> -- 
>>
>> commit 83cea797ff679bd0608e7bc406325588975c70cb
>> Author: Armin Wolf <W_Armin@gmx.de>
>>
>> hwmon: (spd5118) Select page 0 unconditionally during probe
>>
>> This commit makes the driver write to the legacy mode register
>> unconditionally during probe to select page 0. This intentional write
>> fails on controllers where the BIOS blocks writes to the SPD device,
>> thereby avoiding issues on such controllers by refusing to probe.
>>
>>> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
>>> index 9724cf70b61d4..95b7cbd2f111c 100644
>>> --- a/drivers/hwmon/spd5118.c
>>> +++ b/drivers/hwmon/spd5118.c
>> [ ... ]
>>> @@ -637,45 +638,32 @@ static int spd5118_i2c_init(struct i2c_client *client)
>>>                        I2C_FUNC_SMBUS_WORD_DATA))
>>>           return -ENODEV;
>>> -    regval = i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
>>> -    if (regval < 0 || (regval && regval != 0x5118))
>>> -        return -ENODEV;
>>> -
>> [ ... ]
>>> +    mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
>>> +    if (mode < 0)
>>> +        return mode;
>>> +
>>> +    FIELD_MODIFY(SPD5118_LEGACY_PAGE_MASK, &mode, 0);
>>> +    err = i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode);
>> [Severity: High]
>> Does this unconditional I2C write in spd5118_i2c_init() risk permanent data
>> corruption if the driver is bound to a mismatched device?
>>
>> Because the device identity check reading SPD5118_REG_TYPE has been moved
>> until after this write, any device mistakenly probed (via sysfs or incorrect
>> firmware tables) in the 0x50-0x57 address range will have its byte at offset
>> 0x0B overwritten.
>>
>> For an ordinary EEPROM, this clears bits 0-2 permanently before the
>> subsequent type check fails and aborts the probe.
> 
> The detection code is unchanged, and we need that write in order to read registers.
> 

The device could have been instantiated manually with a write to new_device,
which would bypass detection. It doesn't hurt to write the old mode back if
the write succeeded and this turns out to not be a spd5118 device, so
let's do that if the code below bails out.

Thanks,
Guenter

>>> +    if (err < 0)
>>> +        return err;
>> [Severity: Medium]
>> Will failing the probe completely on read-only buses deprive users of all
>> temperature monitoring capabilities?
>>
>> If spd5118_i2c_init() returns an error here when probed on an Intel
>> controller that rejects writes, the driver completely drops support for that
>> device.
>>
>> Previously, the probe would succeed and at least allow reading the memory
>> temperature. Could this degrade gracefully instead, perhaps by marking the
>> regmap as read-only and disabling suspend/resume writes, rather than totally
>> preventing hardware monitoring?
> 
> No, because the driver will then block suspend/resume on those devices.
> 
> Thanks,
> Armin Wolf
> 
>>> +
>>> +    regval = i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
>>> +    if (regval < 0)
>>> +        return regval;
>>> +
>>> +    if (regval != 0x5118)
>>> +        return -ENODEV;
>>>       /* We are reasonably sure that this is really a SPD5118 hub controller */
>>>       return 0;
> 

