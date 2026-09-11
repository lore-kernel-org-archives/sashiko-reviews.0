Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B0D2EDD40
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 14:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137162; cv=none; b=CP4uT6COqc8TbTsnEyv3G/8XEk3JGAj+XSeL31P9D3P0tAOBzTqwU9lYs+KEhj7yAcWE0ePGLECIVIxVnAGfUGLxIt5rt47GIEZGk6MVW6jZQTbIDAvNCEeaYp/vQVOgeE3sDH/0SH3CsLlTS3FlMulbK/F49GozhZ1YmKKMPrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137162; c=relaxed/simple;
	bh=92ip7+Ug0GQM2KeYbnMmAsYIHtULVob27HuCA9KByVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XWiSMTEPcCgGFrvGrsI7eG37lKqp1AeFPTdu+WuwOyDTQn+x9QO3ma8Ar+vIgB9PIHL3OTBrXa85VhuCisXwIQl868LxDpfg8H7EB0nBWmnVLaNTgVDHPAycuujZ0EawoGY/Qt1+rUgs3dMJxZR5ojNADBRryAzGBC27b8ybc6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNFEnV1n; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNFEnV1n"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-853c07a76adso1042684b3a.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789137161; x=1789741961; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eDSeR52nH6vtqDm1Vifi4FBumjLYLejrsEt3Rb0TzvM=;
        b=dNFEnV1nrM+jgsdUVuVylkFRb5HdX7Qj/g3fn9ui+MjSNBuQvPSHAwaMgT1+HpuZQT
         Yt2Dm8D8KauKpji0UuxbuuK8/7LF75rY12Tg9OLscPQzXKOCSP4rXY01IUt6x9Gs9I5o
         sLU83F6tSJ7C7jdcfVImjlXZ/lUwZrqUCB6lTJzXl0/nVDPEYV5+aqcI+9PlgjKeaiZ0
         DgyH8EjjXCupOso2ZzPtFR9Pb/BYKcstlgHQS9E8nTn4oPQDDbQIGSk1Na7LkCG1ABo/
         tsBGo30Tzda7iEAtak9YJ4igd6EFnrcvtiRYsWJYlVauVLVnSqHIEAEADesAJ3KjaWGg
         m6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137161; x=1789741961;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eDSeR52nH6vtqDm1Vifi4FBumjLYLejrsEt3Rb0TzvM=;
        b=G6PTkiiklRfAar+qB8M+e1WExiWypfp4YnoioFqcdo2IuRrtZzYIl1jrFMimaf9rRa
         kmt7uvXaQi64X8uznVelTJNEsmooXebeKJMg03LPuBGXzrxY6sjLYYUBFugOWes+8yez
         /4nNvXhA22IUuY/vXyd6Q7TMhSwfYDN0HPuzM+IbOGtIGaaJ/gQECW5lvAP+4PjqBg42
         dHOlIJH/gt1iEVcwTamugOTOjW45olx3Ix8vdVWf7q4zYDCKjLagFgPtg51EGZ1GnsV+
         zLs46N6QhNIu8ifyBG1OhGZA2w5rbhdacKTIgwIoI6EbE0SNC2oRt3Q2D7SEDPCXUFwK
         C25g==
X-Gm-Message-State: AFuF++kE45Sii2LHSZqNhc/VsxVUId9YZQkctMC9hzWOpnh4/7eJrdYq
	kzrXWgnWQrzK/6Z6JRwccLJCGjy+4pynpqL0ewfditJ3vQfXk7JYjjwh2CKZ9YOO
X-Gm-Gg: AYBFou2WZyd9gxLyNyM0R66BOu5BJfI7SbdZsciO0r2k8B1FiY+6aLIpPjCvtNI/LBT
	ezLdVJ5qnDVtRHAroeaR8qWqSpROAJkHyJ6beL7lLscdjNHZlthK38u912zAg2+9YyY/vSda5kg
	67j6OIxCx+azBpXUBaRE2tuT5s0c9pMbGwOGdWCtdI+kEjh8XVVo7/rw+oJHfVAL/tnBCX04873
	Tj/jTaPRP+AeAlIuu/tdKlBURR7YwRyd6YJBYWrmm1i+sOM7ThEISVeMofNjaf0Rj6kTfkhTcJq
	pkwqTAJIOz37FtjddkvqiTpkjO9biXHfjk/8f8SFGOTbBqAY4a3vDNfYPzvY+UvrwGM3QCe9gVn
	szZYuKh1/by+dOKMnBQx+nPNso+m0Rv031HVTRWQzbQ9a/LaLy4ssuUtfZefG5lgqdURrhqYEmc
	Qw5Nx98VbtkdefEHDVmGgWqFopJj6JasByqxzFUSnjOQUq2tZDCqTfH4Lb8vDcO3SzLoG/YL4yA
	vSmQFzckwAf831kq/yIiHX2Gjyad7D5ckYZP260HR4zYoI41JGrxQIgZfE=
X-Received: by 2002:a05:6a00:190f:b0:845:cf73:c1d8 with SMTP id d2e1a72fcca58-86b3092551emr6956168b3a.14.1789137160779;
        Fri, 11 Sep 2026 07:32:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b41d74fd5sm1135687b3a.2.2026.09.11.07.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 07:32:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <88b90584-703a-429b-a6bf-445b26289f2d@roeck-us.net>
Date: Fri, 11 Sep 2026 07:32:39 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] hwmon: (pmbus/core) increase number of phases and
 add new mask
To: sashiko-reviews@lists.linux.dev, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org
References: <20260911-hwmon-max20826-support-v2-0-5e30cbd97d84@analog.com>
 <20260911-hwmon-max20826-support-v2-1-5e30cbd97d84@analog.com>
 <20260911140917.49D3A1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260911140917.49D3A1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/11/26 07:09, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The PMBus core driver iterates over `info->phases[page]` to access the `info->pfunc[phase]` array without verifying that the phase count is within the `PMBUS_PHASES` maximum. If a driver configures `info->phases[page]` to a value larger than `PMBUS_PHASES`, it results in an out-of-bounds array read.
> --
> 
> commit f0d55dee29cf753f56d794471093af9c4d34634d
> Author: Nuno Sá <nuno.sa@analog.com>
> 
> hwmon: (pmbus/core) increase number of phases and add new mask
> 
> This commit increases the maximum number of phases per page to 16 to support
> a new upcoming device. It also adds a new mask for controlling the source
> of the output voltage.
> 
>> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
>> index 2cd3216b3cd95..920c1102ab6df 100644
>> --- a/drivers/hwmon/pmbus/pmbus.h
>> +++ b/drivers/hwmon/pmbus/pmbus.h
> [ ... ]
>> @@ -386,7 +387,7 @@ enum pmbus_sensor_classes {
>>   };
>>   
>>   #define PMBUS_PAGES	32	/* Per PMBus specification */
>> -#define PMBUS_PHASES	10	/* Maximum number of phases per page */
>> +#define PMBUS_PHASES	16	/* Maximum number of phases per page */
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but is it possible for a driver
> to configure a phase count larger than the new PMBUS_PHASES limit and
> cause an out-of-bounds read?
> 
> In drivers/hwmon/pmbus/pmbus_core.c:pmbus_add_sensor_attrs(), the loop
> uses the unvalidated info->phases[page] as an upper bound to access the
> statically dimensioned info->pfunc array (which is sized to PMBUS_PHASES):
> 
> 				for (phase = 0; phase < info->phases[page];
> 				     phase++) {
> 					if (!(info->pfunc[phase] & attrs->func))
> 						continue;
> 
> If a driver calls pmbus_do_probe() with a pmbus_driver_info struct where
> info->phases[page] > PMBUS_PHASES, it could result in reading past the
> array bounds.
> 
> This might lead to a kernel oops during module probe or the creation of
> corrupted sysfs attributes by interpreting adjacent memory as functionality
> bitmasks.
> 
> Since the core framework explicitly validates info->pages > PMBUS_PAGES to
> prevent similar overflows, should a similar bounds check be added for
> info->phases against PMBUS_PHASES in the core API?
> 

Makes sense, but I would not give that high severity, and definitely not part
of this series.

Guenter

