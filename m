Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213B434F259
	for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 06:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343736; cv=none; b=MjiUnwZpqlUvwVdoQAaXzGZ6P/jGf+8+7PTbL1lYsK13pdDG9s/4Ig4qDNu8B8rB1TYDpBuJbuJld6XSDXCUcb9eT63eE7ifaPfisNPVJqP6vF3aSx6b6jU1GX1jsNMqvVw+B64jkkwb3+joa1H4TqsSLFliylAWIXKneMuscqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343736; c=relaxed/simple;
	bh=IGEMFtz5m1rgtvO20zFipE93T56u1qS09OUG8XV2g4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fC1t0gxf/LBSJmHGKagXU+J2bTl3ty48VqgrzkM/yA/REdsAdn36NvanyKOdZObBgQWIbODYEJsWHyZoivYE2I7/hrsZ0PGF6CPwIipsr3heCRolhFr2OECaS5+8TAPJ/fcCNMhJKN1Ae/R6L2PiAyJ5432GLuw0Dp4RSnsxKhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWvvIvml; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWvvIvml"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1523471a91.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 23:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343734; x=1786948534; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NItFpiIwMj1k7tiB1SnfhJqtoSXdWJbFQ3hu5IzRqxs=;
        b=LWvvIvmlalpF7AofIfvlhXXpEwFvf9bN7tXpHZJDTfZb5Jt3Tm1/NbxyxuqvnpouPm
         hEuZupxsun6vkTL/21ZzQSRYjn9XdomCoVOW/lNFrCjiXYyJveM0OGX65hRjlUyI/d9a
         ZrD9/9HfGqyj01BXS6jVl4KQJ/90yZ9KS8X8O75Tjq+JDHEPtJbON98ZMfkL89Ag6+9/
         iV2MR87csA8HXpJjIy/IuAO/JrrEMl3e85O+lPZMS1wb723Etda5aGfQTQK6IaQYZz/m
         gYhLao5GcCFp+64BgGuvwJVNa9dc3I1DCQ25AXUQcZICCmC0+LiEDhCKe1IGW4d+qk5k
         uA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343734; x=1786948534;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NItFpiIwMj1k7tiB1SnfhJqtoSXdWJbFQ3hu5IzRqxs=;
        b=QpkoslErfRUlroUWuKaDoPeSysAymvXdKc3NFsNIzL3TwtkwLpJCS75FzUj75useqS
         dOEa8eBUWEj+jCF5xPKIDXqEv03Xa6pp+1n5pC3ov+VJrq4yakCuzWNnf5xdeexQmzZR
         gVw+Nwgx5TiR+whubkpH5JCdpI4R0ASZ4oQLYuX44RFPqhYC0bgNw2VO2VSm4LRnW+k+
         Lx7dWjEuwoywQEAOCiWusq0WntCQrK/tDPijVHSxQsgaim0M2VwZJLKaxMJLxH3ZMG1g
         CrzQBE/j2Br424OPUh6RF+hymVxoik9bMSjDPHKMGc5RUvQcX/m/UgoQZgxgsyf2M15Q
         m4aQ==
X-Gm-Message-State: AOJu0YyVbnjQ3WXHoZfLtWFNjUJCEI7MTjz171w/bm6q1q4D7DH7T80K
	Xm+Kvl7001mfGtCENmkxNHHcoNjSnarLg28zOgKkVSNBROFhSaUzBrGGPHocHQ==
X-Gm-Gg: AR+sD13/d6gsReIdWrQQFeGPqwt1v5jpyCaursZnGtI6eMymAMLuAcqKjBx60aapS1W
	SSyaae0pFfegLcIfNvuA7AlK6C8FGSezBJNQiltfN69B4gxh3zG1dZTUs6n4IwguI3KYxmk65K9
	WsO05kck+eE/b/MQ+qfALNhtrU1R3Lek95vpPq6TduRB+bFD7oMgnlR4uiMUk+JxzExFisE2SKA
	H3Nye0I9YxxyZaqvOLE38RDnGG9jORaQNRIgYga0GsrW6p9FOXgScoZKr203Xm4ckSXiUcVdv4Q
	tU3nylZgi6mpNyPxaDMwzZW/TsqpUScI3+4CI1V6Vv5M4AzxEwWPWvIbyu9WKxN+YzHctmObybD
	daNVZGpr0PJqBrqFKWnBZy+F5xv44/VG0c949LzeXJAKZDqOJpZavHpNwPg+ITDuozVkmcJyP2n
	q9niF/TdxUCR4YxBPrYcEClg28hrNWcnVorylWl2nPQL51lpSkYYT/U0Oayw6sDPYPd0LXPJszG
	YxvgActhL32Vj7n5afAUEcAwBYflRcOfioo3w==
X-Received: by 2002:a17:90a:ec8e:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-3903c53827bmr43219538a91.2.1786343734084;
        Sun, 09 Aug 2026 23:35:34 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dbf82csm13435684a91.1.2026.08.09.23.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 23:35:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0309e122-3424-451e-afd3-8395f87e58e1@roeck-us.net>
Date: Sun, 9 Aug 2026 23:35:32 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: (max6621) fix negative temperature offset
 and crit readings
To: sashiko-reviews@lists.linux.dev, Cong Nguyen <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <9d3a4f1895a47794bb359a2a32fb1ccd6a15812c.1786334038.git.congnt264@gmail.com>
 <ad0baddbd6163cf73545c8e9273258136718585c.1786334038.git.congnt264@gmail.com>
 <20260810051655.C2BB81F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260810051655.C2BB81F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/9/26 22:16, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Medium] The `hwmon_temp_crit_alarm` read path ignores the `channel` parameter and unconditionally clears global alerts, causing alarms to be misattributed and lost.
> --
> 
> --- Patch [2]: [PATCH v2 2/2] hwmon: (max6621) fix negative temperature offset and crit readings ---
> commit 0116e27b3257c1efaee364113dfc90d35d8fb869
> Author: Cong Nguyen <congnt264@gmail.com>
> 
> hwmon: (max6621) fix negative temperature offset and crit readings
> 
> This commit fixes a bug where negative temperature offsets and critical alerts
> were read back as large positive numbers due to missing sign extension. By
> casting the register value to s16 before scaling, the read path now preserves
> the sign encoded during writes.
> 
>> diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
>> index 16a3a61d25326..1a644d7871431 100644
>> --- a/drivers/hwmon/max6621.c
>> +++ b/drivers/hwmon/max6621.c
> 
> [ ... ]
> 
>> @@ -254,7 +254,7 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>>   			if (ret)
>>   				return ret;
>>   
>> -			*val = regval * 1000L;
>> +			*val = (s16)regval * 1000L;
>>   
>>   			break;
>>   		case hwmon_temp_crit_alarm:
>>   			/*
>>   			 * Set val to zero to recover the case, when reading
>>   			 * MAX6621_TEMP_ALERT_CAUSE_REG results in for example
>>   			 * MAX6621_ALERT_DIS. Reading will return with error,
>>   			 * but in such case alarm should be returned as 0.
>>   			 */
>>   			*val = 0;
>>   			ret = regmap_read(data->regmap,
>>   					  MAX6621_TEMP_ALERT_CAUSE_REG,
>>   					  &regval);
> 
> [ ... ]
> 
>>   			if (regval) {
>>   				ret = i2c_smbus_write_byte(data->client,
>>   						MAX6621_CLEAR_ALERT_REG);
>>   				if (ret)
>>   					return ret;
>>   			}
>>
>>   			*val = !!regval;
>>
>>   			break;
> 
> [Severity: Medium]
> This is a pre-existing issue, but does this hwmon_temp_crit_alarm read path
> in max6621_read() ignore the channel parameter?
> 
> When userspace reads the tempX_crit_alarm sysfs attribute for any channel,
> this code reads the global MAX6621_TEMP_ALERT_CAUSE_REG and unconditionally
> clears it via MAX6621_CLEAR_ALERT_REG if an alert is active.
> 
> Could this result in misattributed alarms where a read on one channel
> incorrectly reports an alarm belonging to a different channel, and causes
> subsequent reads on other channels to miss their alarms because the global
> alert state was already cleared?
> 

Valid point, but the datasheet says:

The result is a 16-bit word (low byte transmitted first,
high byte second) that contains the register that
caused ALERT to assert. An error (8103h) is returned
when there is no active ALERT.

Since we don't know what "contains the register that caused ALERT to assert"
actually means (in other words, what registers are returned), we can not fix
the problem without access to an evaluation board or a board using this chip.

Guenter

