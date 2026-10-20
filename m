Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510630;
	b=f6ev07hG/AoyBnFByS4A66YGtxbdLBZYWlN84vK73j7Ev8S4J3WAXdfXUtoivEDRI+pX
	 EqT/5R+PCd+KLoLh5Y6CpcOg2ypHYTGR/LUjDNf9yfv+7SlohYzvOEUUeN+boFMyZAOLR
	 ZUd/1hOT+xGcDeFG/obiVbmHCyq3rWMYpousMzQGY8FJjmnFh10np7967rpjZH9Y5Pr4i
	 BWtxbUsjX9BXgNgiisy/TS6tIpc7c2ELyukrNe+41W0moUlWhHt6a9p4kzj/jrBrXnX33
	 2mc/dgIl/Hfo85v4Ifx4omynWb9+fRta0WJuJdJevQZL29eZrkAQf1fVn4OiyIxxo8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=5G1bYmk4Cp+xcym+d9Gb+XVS8ngnxpeYifWGIoNpktY=;
	b=oj7wMGLMeYHpsXP6qTfDCOm1FFqxoZ9RRQEeSmVn8BaMx6l6+ZAx02eI5f47OtSV0pbn
	 TeQdl6O+5BraYsmJoitB1JG+BctIrdfXvvcgAqWDlozVbNx/wyZq2lQl4yvyW3mgNQsE4
	 0BhEFkS/z04omMxP0hrK3XVI6hc8DCcTifRiExL9zp45gxYktK8iu0oBlaX7JHjEThlto
	 fVjdl9PlBKdys58ih2WRlUEPzRRLMdLTcL1pVvoCU/ln4rDCgaOo+1cVw8AEGfTSp7la/
	 c3G19uYQTOFJl87kcolBSFjmmiL46mnT0QQxD00En2bvg68TEGFTVWfpw18AUmvSsMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IWgjXcTF;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596B260A2610
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 15:37:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 596B260A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IWgjXcTF
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15756f82e8aso312140c88.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 08:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510629; x=1793115429; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5G1bYmk4Cp+xcym+d9Gb+XVS8ngnxpeYifWGIoNpktY=;
        b=IWgjXcTF48//cL8Np+5HFsJUzFvQM6IFCpihhE5ftCgyqI6Z5g1gawJL4B/ttRIFps
         n8OnUdNVQr3tIqaC6ucYXnyheWQwM8Kv4e0Zfx+NLavzeOfp9WOJTRQ7pc2HbJI8ihcw
         O7oI+vjHUrrI2f0LqTSx4QEGAb1rv6InGow+XVAdOBQarQryDm3VBwhpaBtUmkWXhroe
         F3grCpBh7oqbgPBLdw5FP+K4DLuBoV3anPnnmIgL4ysu/rSFE4ZBOiXupq7iEumdAGAp
         sRZlaBfVKxNLRvd+g+4CThTi3pG/MZ0Qh1WFrYhVwvOLlwKiz0ItMsHzaZ76Zb+SOpLH
         juyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510629; x=1793115429;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5G1bYmk4Cp+xcym+d9Gb+XVS8ngnxpeYifWGIoNpktY=;
        b=A8VpMlmTEr5sXcuVdMMpUdYJJvv9CGUNQp1N2CI+Xj9+9sI2Y3mYDauKl/jB6fV5n9
         8MZ6W83muwvlpOOh27tjUd2C7ADmp/Xet6QXXU4m11bqIB6u63AjWjByHZp6m2DzKnPg
         iYAtf7r1Xw0mp5++hW/GjyREWxv7lOmGcaP67VxmNf3164YIcdiiMYMgY0DkYYluOs7U
         RWO3+anKSkKuCc8aAVvKC7urL4P3J7KxURL012BcGCOFK1UERwu7QU3li2/0wmbt/sbe
         42KS1mmaNHFxyvRvmogrVP9gmUUyhn/ebne+6bTYyzMegpmsnrN4/6mDTcMVIgCIIHnf
         t8bg==
X-Gm-Message-State: AFq9FYKDew/Wf3k+aaXJsQx+oo667axrTGxzKzVuzikHUKnfHHAUExIy
	ADRP/OkLBxAYGB1ybuQgrmtWrxAGXBS9od7vmf1e4kl6qTn0elUB4iW0FYrpxQ==
X-Gm-Gg: AYBFou0MuTtxttkE6ianYuV1bnrrxxL7vaL+SlNQYkME8psiNZgLxitnqjp0hICycBe
	IwePBhx3y9c4e6hI5lJD6PFCJIZKeuU1oRnzOOSk9y8kxNGadXDuzTsuHcWnfGMR1Bg3xGJ4lyq
	AhyTcVaDvdWGYmM6fq1meUcSvdD45l6dRRzldgyfrs/zbXr/lSsyTYBSNcjQOAeK8JWAUmFxuog
	ZVOdcB+KIV7cH74hXLpO5TgHr3b+4YDzEUUEsbZHE8FRsckBy3cOFvQ9wPoOtG7CJRdSo5KYiTG
	ZWwN9T2qrsC3BHntmmDsh+ALD5cCFVkko8e20qR8TxuXMY9v0edd4+zJmy8FOtOyLvPxt29ksAe
	Q3GvGhshfq+WKTdhOFN9jonDPc2QxzGqt5EwuNU26jXZh8iesYC2X6LntCpwQVpS+Kf3KrC2ouC
	cXmGOcTfGt4zqVBR0UfyrKEZxCIQSLtR1RuFFHTMy6xODT6X0zkBKUS3vvVUbLAap2t4i0jiB1c
	IL7CMPOE6DuzVw/ZPelHsHnmmuTF9t4xYusV9DetPoyHrKUMaDoem+wiZuErbxKDa9/QWFPjNxN
	xqYejHQwQjOlq5W/ImLoncraMrPs58c=
X-Received: by 2002:a05:701b:4210:20b0:159:f192:5290 with SMTP id a92af1059eb24-18dbf218391mr3054617c88.13.1792510629124;
        Tue, 20 Oct 2026 08:37:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f5a13sm44116282c88.12.2026.10.20.08.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 08:37:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
Date: Tue, 20 Oct 2026 08:37:06 -0700
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
To: sashiko-reviews@lists.linux.dev,
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <sashiko-outbox-178650@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set_voltage()
> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling in regulator ops
> --

Good that I did not just apply this patch. Do you have time to look into
those issues and fix them ?

Thanks,
Guenter
> 
> commit 8ccb177073557cf9644c419b791da4a5cf494d3e
> Author: Lars Petter Mostad <lars.petter.mostad@appear.net>
> 
> hwmon: (pmbus_core) Support relative encoding of vout related commands
> 
> This patch adds support for PMBus 1.3 relative encoding of output voltage
> related commands, scaling limits relative to VOUT_COMMAND in
> pmbus_reg2data() and pmbus_data2reg() and updating the cached VOUT_COMMAND
> when setting regulator voltage.
> 
>> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
>> index 5f69c1420b4e1..47dff264d28bf 100644
>> --- a/drivers/hwmon/pmbus/pmbus_core.c
>> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> 
> [ ... ]
> 
>> @@ -803,6 +806,26 @@ static void pmbus_update_sensor_data(struct i2c_client *client, struct pmbus_sen
>>   						     sensor->phase, sensor->reg);
>>   }
>>   
>> +static bool pmbus_sensor_is_vout_relative(struct pmbus_data *data,
>> +					  struct pmbus_sensor *sensor)
>> +{
>> +	if (sensor->class != PSC_VOLTAGE_OUT ||
>> +	    !data->vout_mode_relative[sensor->page])
>> +		return false;
>> +
>> +	switch (sensor->reg) {
>> +	case PMBUS_VOUT_MARGIN_HIGH:
>> +	case PMBUS_VOUT_MARGIN_LOW:
>> +	case PMBUS_VOUT_OV_FAULT_LIMIT:
>> +	case PMBUS_VOUT_OV_WARN_LIMIT:
>> +	case PMBUS_VOUT_UV_WARN_LIMIT:
>> +	case PMBUS_VOUT_UV_FAULT_LIMIT:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
> 
> [Severity: Medium]
> Can the PMBUS_VOUT_MARGIN_HIGH and PMBUS_VOUT_MARGIN_LOW cases in
> pmbus_sensor_is_vout_relative() ever match, and how does
> pmbus_regulator_list_voltage() behave in relative mode?
> 
> No hwmon sensor attributes are registered for PMBUS_VOUT_MARGIN_LOW or
> PMBUS_VOUT_MARGIN_HIGH. The only callers in drivers/hwmon/pmbus/pmbus_core.c
> that read these registers and pass them to pmbus_reg2data() are
> pmbus_regulator_get_low_margin() and pmbus_regulator_get_high_margin():
> 
> static int pmbus_regulator_get_low_margin(struct i2c_client *client, int page)
> {
> 	struct pmbus_data *data = i2c_get_clientdata(client);
> 	struct pmbus_sensor s = {
> 		.page = page,
> 		.class = PSC_VOLTAGE_OUT,
> 		.convert = true,
> 		.data = -1,
> 	};
> 
> 	if (data->vout_low[page] < 0) {
> 		if (pmbus_check_word_register(client, page, PMBUS_MFR_VOUT_MIN))
> 			s.data = _pmbus_read_word_data(client, page, 0xff,
> 						       PMBUS_MFR_VOUT_MIN);
> 		if (s.data < 0) {
> 			s.data = _pmbus_read_word_data(client, page, 0xff,
> 						       PMBUS_VOUT_MARGIN_LOW);
> 			if (s.data < 0)
> 				return s.data;
> 		}
> 		data->vout_low[page] = pmbus_reg2data(data, &s);
> 	}
> 
> 	return data->vout_low[page];
> }
> 
> Neither pmbus_regulator_get_low_margin() nor
> pmbus_regulator_get_high_margin() initializes s.reg (leaving it as 0), so
> when they fall back to PMBUS_VOUT_MARGIN_LOW or PMBUS_VOUT_MARGIN_HIGH,
> pmbus_reg2data() -> pmbus_sensor_is_vout_relative() returns false and caches
> the unscaled permillage value as mV in data->vout_low[page] and
> data->vout_high[page].
> 
> In addition, while pmbus_regulator_set_voltage() skips checking these margins
> when data->vout_mode_relative[s.page] is true, pmbus_regulator_list_voltage()
> still calls pmbus_regulator_get_low_margin() and
> pmbus_regulator_get_high_margin() unconditionally:
> 
> static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,
> 					unsigned int selector)
> {
> ...
> 	low = pmbus_regulator_get_low_margin(client, rdev_get_id(rdev));
> 	if (low < 0)
> 		return low;
> 
> 	high = pmbus_regulator_get_high_margin(client, rdev_get_id(rdev));
> 	if (high < 0)
> 		return high;
> 
> 	if (val >= low && val <= high)
> 		return val * 1000; /* unit is uV */
> 
> 	return 0;
> }
> 
> Even if s.reg were populated when reading the margin registers,
> data->vout_low[page] and data->vout_high[page] are cached once and not
> updated when pmbus_regulator_set_voltage() changes VOUT_COMMAND. Should
> pmbus_regulator_get_low_margin(), pmbus_regulator_get_high_margin(), and
> pmbus_regulator_list_voltage() also account for relative mode?
> 
> [ ... ]
> 
>> @@ -3351,29 +3419,38 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
>>   		.data = -1,
>>   	};
>>   	int val = DIV_ROUND_CLOSEST(min_uv, 1000); /* convert to mV */
>> -	int low, high;
>> +	int low, high, ret;
>>   
>>   	*selector = 0;
>>   
>>   	guard(pmbus_lock)(client);
>>   
>> -	low = pmbus_regulator_get_low_margin(client, s.page);
>> -	if (low < 0)
>> -		return low;
>> +	if (!data->vout_mode_relative[s.page]) {
>> +		low = pmbus_regulator_get_low_margin(client, s.page);
>> +		if (low < 0)
>> +			return low;
>>   
>> -	high = pmbus_regulator_get_high_margin(client, s.page);
>> -	if (high < 0)
>> -		return high;
>> +		high = pmbus_regulator_get_high_margin(client, s.page);
>> +		if (high < 0)
>> +			return high;
>>   
>> -	/* Make sure we are within margins */
>> -	if (low > val)
>> -		val = low;
>> -	if (high < val)
>> -		val = high;
>> +		/* Make sure we are within margins */
>> +		if (low > val)
>> +			val = low;
>> +		if (high < val)
>> +			val = high;
>> +	}
>>   
>>   	val = pmbus_data2reg(data, &s, val);
>>   
>> -	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
>> +	ret = _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (data->vout_mode_relative[s.page])
>> +		pmbus_init_vout_relative(data, s.page, val);
>> +
>> +	return 0;
>>   }
> 
> [Severity: High]
> Could updating data->vout_command[s.page] in pmbus_regulator_set_voltage()
> lead to a division by zero in pmbus_data2reg()?
> 
> At probe time, pmbus_init_common() rejects non-positive values in
> data->vout_command[page] after calling pmbus_init_vout_relative(). However,
> in pmbus_regulator_set_voltage(), when data->vout_mode_relative[s.page] is
> true, margin clamping is skipped and pmbus_init_vout_relative(data, s.page,
> val) updates data->vout_command[s.page] without checking whether the decoded
> voltage is <= 0.
> 
> If a consumer requests a small voltage (for example min_uv < 500 uV, or a
> value that rounds to 0 in pmbus_data2reg()), data->vout_command[s.page]
> becomes 0. A subsequent write to a relative VOUT limit attribute in sysfs
> will then call pmbus_set_sensor() -> pmbus_data2reg() and divide by zero:
> 
> 	if (pmbus_sensor_is_vout_relative(data, sensor)) {
> 		val = clamp_val(val, -INT_MAX, INT_MAX);
> 		val = DIV_S64_ROUND_CLOSEST(val * 1000,
> 					    data->vout_command[sensor->page]);
> 	}
> 
> Should pmbus_regulator_set_voltage() or pmbus_data2reg() guard against a
> non-positive vout_command?
> 

