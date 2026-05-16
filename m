Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E70274B32
	for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 23:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778973754; cv=none; b=GiRGgIR0x8wxhgTyWKsH8OBqN6IoxCqOx2DIyNBU5w0tc9R0CvbDCtPwXjYWVaT1+16F4NYe6loK+U/2R/qg63aPVKfr21jbulPPlvWWIv+hIdZ0LNCHqgQjvJNrD6NhlyvAtF/4VsNwuDZjHQ+1XcxfoGKAFEOcJe0rmJyfPQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778973754; c=relaxed/simple;
	bh=lFFO3qzKcB523jU5P7ZsP2W9YiCK4vDJLXG9EC4pmRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xjg5w+RFl8DdvenL/MxIQN+hN9CfGn8a8iSpCX/bWVjb6z1mBhxuJovSC8+t42erMRH7vkLm6dwpP7g0ZDFoW+iSWNlzSkQP7vegmkrlHOfsH1lOjkzEd7FLJaxw3i8vUmLIrQGYnclFkn8OGSSUycKQ2BpLWqrHk3/V3xQSvg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4fW+fhC; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s4fW+fhC"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f3c623322bso4156220eec.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 16 May 2026 16:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778973752; x=1779578552; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7L9PwLQsx3aiXw6hRLj/XoSJpF+zWJf7IJ8jsScG1uc=;
        b=s4fW+fhChM4czA6s2n7I2Jg/2sEVXpCdS3V5Fe9Dro4SJYPlI7KITXH44Q5v1HLNY8
         /ZiBxzPis1/eTXNzeE/Onao2l8ViylN4ot/Z9rCV74gwHTfvt6xfU/SptFesQNRqFtDA
         h9mBWQpzSt5YURr0Ttuom11fRhIWQbK9t2UYFBkjqUxfXOSoirsI2XY3gINELWVtL/q7
         M7qZroGyqEVcp/W1zjUNVyTFOgdYOOcm89mAtSRx60ybwjhq3G7fYwqUk1B3vVsCfSBe
         HHK0MWEX45eICHYPMzVHciqx2RgGY5mC+UA9NVYVOc998HS851liS4r09ZqmB5v2OaA2
         wvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778973752; x=1779578552;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7L9PwLQsx3aiXw6hRLj/XoSJpF+zWJf7IJ8jsScG1uc=;
        b=JCwTDAtXofj/ucWXonlUSgqxxOE/MxlbZTFF9zf/Mpu8x8ef6kzmi+JgwDaodm6oYt
         ToiPBjgS48jG188hlHnwhc24VuVxFf7ASF4mf7BnVssOaa+qbbz/38ulsp/365aE00PU
         bmuvtYSKiig5ktKe2QXpv+le3X7CK9/Dnk7XPMRsNA54R4mGomNhr3PPywNKsCwKoYFm
         2cp7Y6sNbCtVhwF6XMl3ZU5Yk253/HyFQGs956ZeTqOj+64PPeclwmCq8PU0EgJ8MNVD
         QYFcR00WtkJueuC/M6+Gv9lOWnHqS2fNU61TxPEXtzHsO1IAkiy8F1ohkcDpfVHg2Vin
         fkKg==
X-Gm-Message-State: AOJu0YyUsTQGpscgLdPe7B33Igr/G/VtImgBQb9oyJIXd76nHQ62b2Um
	e0z8EoF8j7iCPkHtDBn197S5fnTlsld+MQ6QeEx+PqIBPnHZiVUlo9sLfzK9jHYQ
X-Gm-Gg: Acq92OGi0CeZBI3MIFMkQfuMxIBmc2GHDd8gvywBZEO3yJaaXvCUZIXiLSjvhymHV1W
	d+DTlkb0BqqfBfBIz+01J/6PsGA7D0qphCgRYevXHVfremGtz2JDUjS49wtI7mcYpHfJs0tAvl0
	F/FVJB4F56CokxSFCalpkpk1zKAq90jUlAOfpeYSeE0gwJbH1Zs3I/HwVjjJXwp5vXzOaYbOA8F
	Pc/8UDxnByGbMDgUWtgY/43WmQC4XBazP4Cqva92W0bsm4HnPBPJ4OadfVRNVUQyXbt7ZfNn2M3
	iJFYKl3NbvyVdwLNWWrLNZEGyXCn4Ow3fRYFVJxmzJ0ZGpU8W0hYh8h/MRXOC26w56UrzxQ+Wkl
	ZxDWhs7IbYm+AL7gZyrmSJoJ5oGrbW+u3k1xlFZvHs27YvKQWtXcH2KrXMX/SH+QuaG3aURpr/5
	D9cltbG0b8khZHB/RRcK+HU52xsrOv+aVgKMGr+Luv1z5JRmGzpvvFWBDhm83WM/NZzEzJ3RdQ
X-Received: by 2002:a05:7022:688c:b0:12a:713b:8964 with SMTP id a92af1059eb24-13504414c3bmr4732145c88.11.1778973752002;
        Sat, 16 May 2026 16:22:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cbcb93f3sm15913265c88.3.2026.05.16.16.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 16:22:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8cf390d7-214d-4738-8fa5-5e4ed970b038@roeck-us.net>
Date: Sat, 16 May 2026 16:22:30 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hwmon: raspberrypi: Add voltage input support
To: sashiko-reviews@lists.linux.dev,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260516191555.17978-3-chakrabortyshubham66@gmail.com>
 <20260516194503.3B563C19425@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260516194503.3B563C19425@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/26 12:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] Unconditional self-rescheduling of the background workqueue leads to a use-after-free on device removal.
> - [Medium] The driver incorrectly detects and exposes unsupported voltage channels due to unverified firmware responses.
> --
> 
> commit aa874218705dba1c84bc41a7c3b61abd93bbf0a2
> Author: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> 
> hwmon: raspberrypi: Add voltage input support
> 
> This commit extends the raspberrypi-hwmon driver to expose firmware-provided
> voltage measurements. It adds core and SDRAM voltage inputs, converting
> the values from microvolts to millivolts for the hwmon subsystem.
> Inputs are only exposed if the firmware reports support for the corresponding
> voltage ID.
> 
>> diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi-hwmon.c
>> index a2938881ccd2f..4f96f37116f32 100644
>> --- a/drivers/hwmon/raspberrypi-hwmon.c
>> +++ b/drivers/hwmon/raspberrypi-hwmon.c
> 
> [ ... ]
> 
>> @@ -56,6 +70,23 @@ static void rpi_firmware_get_throttled(struct rpi_hwmon_data *data)
>>   	hwmon_notify_event(data->hwmon_dev, hwmon_in, hwmon_in_lcrit_alarm, 0);
>>   }
>>   
>> +static int rpi_firmware_get_voltage(struct rpi_hwmon_data *data, u32 id,
>> +				    long *val)
>> +{
>> +	struct rpi_firmware_get_value packet;
>> +	int ret;
>> +
>> +	packet.id = cpu_to_le32(id);
>> +	packet.val = 0;
>> +	ret = rpi_firmware_property(data->fw, RPI_FIRMWARE_GET_VOLTAGE,
>> +				    &packet, sizeof(packet));
> 
> If the firmware does not support the RPI_FIRMWARE_GET_VOLTAGE tag or the
> specific voltage ID, could the mailbox transaction still return 0 without
> modifying the tag buffer?
> 
> If so, packet.val would remain 0 and this function would return success.
> During probe, this would cause the channel to be incorrectly flagged as
> supported, exposing sysfs files that permanently read 0mV.
> 
> Would it be safer to initialize packet.val to a sentinel value like ~0
> before querying the firmware to verify the voltage ID is actually supported?
> 

I guess we have to assume (hope) that the firmware interface returns
an error in this case.

>> +	if (ret)
>> +		return ret;
>> +
>> +	*val = le32_to_cpu(packet.val) / 1000;
>> +	return 0;
>> +}
>> +
>>   static void get_values_poll(struct work_struct *work)
>>   {
>>   	struct rpi_hwmon_data *data;
> 
> Does the unconditional rescheduling in get_values_poll() cause a
> use-after-free regression during driver removal?
> 
> If the work function executes concurrently with driver unbind,
> cancel_delayed_work_sync() will wait for it to finish. However,
> get_values_poll() currently reschedules itself just before returning:
> 
> get_values_poll() {
>          ...
>          schedule_delayed_work(&data->get_values_poll_work, 2 * HZ);
> }
> 
> After cancellation completes, devres frees the memory for data. When the
> rescheduled work executes later, it accesses the freed data pointer.
> 
> Could a shutdown flag be added to safely prevent rescheduling during
> teardown?
> 

That does indeed look like a problem. Please feel free to submit a separate
patch to fix it.

Thanks,
Guenter

