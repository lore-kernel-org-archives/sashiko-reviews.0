Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69771BF33
	for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784469663; cv=none; b=aoluOfxSSdPpaej2A5GS1ATXcUV1fwomQ3WmkjmJD+dvB2n4hO5oNVScHtQ12j3+J1yrNNXaPo/TsHDvqJNNKkNfMywtDDsuHZwqQEEQNGGbsZpC9V7b/zty3mg9cVdl37UFiBuqjAY/WD7COIVG6BThgGGBzdmOs+VTx6p1k9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784469663; c=relaxed/simple;
	bh=M47f7VIh1kNoZPfW0dI5ea/kkcnn6tS5VLR9zdkXom0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQyXAjTNiFv+iThidQdjQuWsKpT4AxP6pLO0xRbr7zGLgdB4dVk4yIwhzjcks8tFaNcjNKEhRy8Vzzm0F2UXQMGPEniBMw4iOlYwFGygHU/YeiCjPlVMWuqvCUuCgNhhW5tx5XCCaNN/0GoRs+KoiDTqrI++jNLVujmLuKL8rK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O04IQlaX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O04IQlaX"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacf197759so99079805ad.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 19 Jul 2026 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784469661; x=1785074461; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mONfO392/ulTQGfkgVIBctz3TKuVwRBShyEvO/haUhc=;
        b=O04IQlaXh+AMJAdsW76cjt2Dp7ksWFpGE4oR2FhJQ+sFBRG2THpi+PdqWfz4vdbO2h
         JqMQLvC3vadPE6S7N7H9IENBWjZHgnGj8r0fw7Nov8XTD4c7AhSdU5TQNfns3KPNXYtv
         oUPjwbjFVpIVyPi19hvOuliu9SrWG4Ii3Tu6txGS2zlE0tli/GGXcJ32Rs9OLp02fWrE
         G/Ies4kw1HK9EFiTfssz2Op7Z3VDF1SNcm4Pk1FwhNU1hlWHBTNeg2PDij8ftQjRbQvA
         +UWy42kKQx9uOEHUV7lKsDK5POb2QIRwzg2IRptoYIwvDCB9pYPLBuoyx4T4OidpT4+e
         lQ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784469661; x=1785074461;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mONfO392/ulTQGfkgVIBctz3TKuVwRBShyEvO/haUhc=;
        b=m5TSKXxM8J+I+bnUkm6+j5rF5vKx1I4C6/VtXwsXZ9qEqdjk3zI+9nAGX/tQ7RrYNS
         jbdai5/puDpSKuCsRnRX4o8i2GlisayfRhetdaDDuZhJ8MCrNnfdX8PGIF+86qBLkRPj
         KqiBmiBEJBFZbcNZMc+xL86P/+sMxrAKl9zGT3wrHOoVrEagYYRmPpj4NPlAIdFNCbYu
         68cfOXOp5byK9Dr+e09NMLFu7raBEEQUDgrzE4RtvXBMW4sp7Ksv8hdXO3n8BuI8XzVU
         jis67BCM0BLaHYhJf7+gM/Uop3v8oE1Qg8EYqTB5FH3tWQI2fTLjKN/jftN/JINGLOIJ
         C44w==
X-Gm-Message-State: AOJu0YwXJgsHq4HzCqooFsw1aSkZ9oyODWZ+O5MZZG89hVqsqYmR+P7o
	bVBwqEQwJqfCnz9hF2kkbzwJJoQw3o9cwqJqrzeGHbUNHyjQQFWwQmOWb5iQSg==
X-Gm-Gg: AfdE7cnLeeG7bQSOdpREA84R4HlC2QlpvkjKlhnviwT4WBMkEUaVgZ0GlGEYTUI5Prl
	M1WbE/DR8nACsozok5grvZkFC86cY/AhqxQR1ZNsSGodeBoE+F+Fco2vHc3nJ33p0gISzV348Hx
	mWWz0h0HD4K86BgRfQyBYsrusRyta/BljJFopMfeAExREEg55XX86VFN9egzuaeaamdZe60R7Rc
	pMSNXXwSf9r+BFviR15iV9tZOo0vEqR9nmAbFjnPBDhMtcAP/+0bbMEgMpgb3Eyk1TcDHcenA8N
	/pLuQ8R+qzgDP8vpQyvbalVFr98c1sbuEoCoAPVqeULsPTSXsfgBARMw9DRtmoV6rYeBrGYpOK5
	/LXd6fmktJWgF9/sXPNmLdfNxKpMs17LVfPfDx1yQKDoKlKNG0bQkkomX7wwJBCKGYKByoIi9/J
	r1OseRXZm0ipG8S4Uh49wfXg4r4aELVOHcydSYN9UXTWNV3xFdSjQ=
X-Received: by 2002:a17:902:d590:b0:2ca:b89:7bcf with SMTP id d9443c01a7336-2cf3494b178mr111404475ad.22.1784469661111;
        Sun, 19 Jul 2026 07:01:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f614sm40536485ad.5.2026.07.19.07.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jul 2026 07:01:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eecfb767-972a-4b21-a088-d7c7b68c29c5@roeck-us.net>
Date: Sun, 19 Jul 2026 07:00:58 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
To: sashiko-reviews@lists.linux.dev,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
 <20260716-max34451_fixes-v1-2-a941b27eaecb@analog.com>
 <20260716083544.1B5B91F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260716083544.1B5B91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/16/26 01:35, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Forward compatibility issue in ETNA8+ revision check due to strict equality
> --
> 
> --- Patch [2]: [PATCH 2/3] hwmon: (pmbus/max34440): add support for newer version of max34451 ---
> commit 02e46b67255562393d163820572cc52a0cabe3e7
> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> 
> hwmon: (pmbus/max34440): add support for newer version of max34451
> 
> This commit adds support for the max34451etna8+ hardware revision.
> It updates the direct format coefficients specifically for this newer
> revision.
> 
>> diff --git a/drivers/hwmon/pmbus/max34440.c b/drivers/hwmon/pmbus/max34440.c
>> index e56057e9273c1..024109df26db5 100644
>> --- a/drivers/hwmon/pmbus/max34440.c
>> +++ b/drivers/hwmon/pmbus/max34440.c
> 
> [ ... ]
> 
>> @@ -343,12 +344,24 @@ static int max34451_set_supported_funcs(struct i2c_client *client,
>>   		max34451_na6 = true;
>>   		data->info.format[PSC_VOLTAGE_IN] = direct;
>>   		data->info.format[PSC_CURRENT_IN] = direct;
>> -		data->info.m[PSC_VOLTAGE_IN] = 1;
>> +
>>   		data->info.b[PSC_VOLTAGE_IN] = 0;
>> -		data->info.R[PSC_VOLTAGE_IN] = 3;
>> -		data->info.m[PSC_CURRENT_IN] = 1;
>>   		data->info.b[PSC_CURRENT_IN] = 0;
>> -		data->info.R[PSC_CURRENT_IN] = 2;
>> +		if (rv == MAX34451ETNA8_MFR_REV) {
> 
> [Severity: Medium]
> Will this strict equality check cause issues with future hardware revisions?
> 
> The commit message mentions adding support for the ETNA8+ version, but if a
> subsequent hardware revision probes with a manufacturer revision greater than
> MAX34451ETNA8_MFR_REV (e.g., 0x0015), the outer check
> rv >= MAX34451ETNA6_MFR_REV will evaluate to true, but this inner check will
> fail.
> 
> This causes the code to silently fall through to the else block, regressing to
> the older ETNA6 coefficients rather than retaining the newer ETNA8 ones.
> 
> Could this use >= instead of == to maintain forward compatibility, similar
> to how ETNA6 is checked on line 328?
> 

Please comment on Sashiko's feedback for this and the next patch of the series.

Thanks,
Guenter

>> +			data->info.m[PSC_VOLTAGE_IN] = 125;
>> +			data->info.R[PSC_VOLTAGE_IN] = 0;
>> +			data->info.m[PSC_VOLTAGE_OUT] = 125;
>> +			data->info.R[PSC_VOLTAGE_OUT] = 0;
>> +			data->info.m[PSC_CURRENT_IN] = 250;
>> +			data->info.R[PSC_CURRENT_IN] = -1;
>> +			data->info.m[PSC_CURRENT_OUT] = 250;
>> +			data->info.R[PSC_CURRENT_OUT] = -1;
>> +		} else {
>> +			data->info.m[PSC_VOLTAGE_IN] = 1;
>> +			data->info.R[PSC_VOLTAGE_IN] = 3;
>> +			data->info.m[PSC_CURRENT_IN] = 1;
>> +			data->info.R[PSC_CURRENT_IN] = 2;
>> +		}
>>   		data->iout_oc_fault_limit = PMBUS_IOUT_OC_FAULT_LIMIT;
>>   		data->iout_oc_warn_limit = PMBUS_IOUT_OC_WARN_LIMIT;
>>   	}
> 

