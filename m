Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC4B368D55
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 04:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785384770; cv=none; b=mHWeKHub/XxGUbpg40DahpUe2U6GAEe2QRd8rXUcKqAq3kDtV30iaTiDst4dV1l58YY984pQUllH0IYCg6NIYPwAE70fBRKJfZXla6t01hwI91E6OrhiMoJT0Wk5OqjEKixRNBBHYs/WG938kGNBpxqoj/e1qwbLJfCh8K7R6bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785384770; c=relaxed/simple;
	bh=S05elIAgEDFPxffm6US5XwDiLG3j89Gks0C3PBMYf1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W2n2qS11XdDGKgTBGDApGiQNJEjFYRzXpZDRVlb6YmYfKhbGTGx9WzIEe5gTX28amTUT+SF+achmefvhfDSUjYuOJOG0GYz4Yzw6asnQm9YcJWBi5ZA6iyF1llIpFVVblWSA6BVy+z4ReiTVSG/Jujk49OjUEDcXqjGrctqB4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OrDuidMO; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OrDuidMO"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8487088510aso1753838b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 21:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785384768; x=1785989568; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrUKv4UtSvyZWLjf9iBBjhJjTZlyrezq04V3SN/NPFU=;
        b=OrDuidMONTtpY5fXlTn6Gkj25TyH6hl+nbalOpCSz6RHFT6f/swqt5RC6GWlNaQAYy
         b5IxrpioUIQoJfuy8Sr1sHlARtJXSMvxbBHGWGm/3OJEtCusHwbkA07CgcdFyU9cidh6
         jlGDbJmHu6hVcqx0z9nZLwXzOiQ5Dh7VtkiSRAHOQ/ktcyf8504zYq2hfs9sV9AtW1IA
         WrUQ/Nzk7MjeF/do8z3Ov3uBc6FJndTeDnTIFw1MYYikhFF91xmuphK4L64e3KTo0M50
         H91ycgoLLpXwyPZNzlTZwICx5YCFkYpvyEnuzphGgf6ZG25rDt0QUzXdI4ZWM53AV8Id
         2Xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785384768; x=1785989568;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yrUKv4UtSvyZWLjf9iBBjhJjTZlyrezq04V3SN/NPFU=;
        b=luohj1bf6C2nlMxOkM8Fzrxok/rGFpMZWGTMob+9F0kcZRQ2OOykoHt34hXsUQPzMI
         jQaNL7vEKjxVVFy285sg1nq5v9ZhDtQyigoUQ2v+4kALHztv//Xi1hReUuY3xILK6AVI
         VhBCn3h44s/fUV7ksiDkTGJa4q5zluz8FdunFQU6NscavJcBLeSoSHg5xtzEzFA0E9hl
         uA/nRYjHx/OATcCuZQmRQCdAIwVNzH9dUdWukGqfk4zCSby4tGwx8OvDYJolDVrsPDB5
         ZUzaDkW/a+7KLm3MJCJxmG2+fUsdIe9Ua07U01f+ClXFdq7/OaEQA+YrNGMycJU1De5N
         VFYQ==
X-Gm-Message-State: AOJu0YyPhcggCgmeOtTBR/SiUFIwK5VLFc5eT7mQDHj2HG25EZqliUVf
	x5coTpzfRBC94mtZoEmHiOPLGajf/Pn7pnx3OwJY+LibbY04BLBtjaLmi4tUsQ==
X-Gm-Gg: AR+sD12tQoDHUjV9SUihigSa3hkexIdPt/7A89h9kIu6oWAmYNBqUiq5+HlUqiV9osN
	5bKajeoeWfsNtpGQz66DgojkZLXd13yeN6vcCbj8DZBrdCV9oegRr7eZ9zta92TFgYrUNebq6po
	Dm94Gxw+I7xprJG1ZCNxlxNtwjZhtx3OoMbhZfISLc5HhEsq9zudDzL15o5LNsB1Ch3JSeEF68K
	zj4oMzX+0ZOE7gTKMzL0QcPJsQqxsXqRXHVyYMwqxFHRtKrEGlscov92tVBiZn8LHP4zoJDn1bC
	5dEJLmsZPdkZ8Csk6AQSMqc9jSIXmp9hoAr4ASodoX1EKrNhsFvdN8bc7XEoqbmvMU7De9RMY5Y
	U0Hy7TZbtfSyOA2Bq75NgsXDQ0rvvHg5ZFbobmkGt1Xqlkf2LNClQ8dSXVt0St0CzjRKAuk7uIN
	TllAl5e7pXJam1dXeYO6pSZgGvBQt9S5mLCuX2dnVmPk9oyofkR0pvZnbaSqupcXzqKkKcDc2Eh
	e1yw/RzVBJCrjf1++JRBvAvWJ9xt8rL6zY5MdW3yZi6qUxo
X-Received: by 2002:a05:6a00:909a:b0:848:6c1c:17c0 with SMTP id d2e1a72fcca58-84ebc213480mr1074576b3a.19.1785384768343;
        Wed, 29 Jul 2026 21:12:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0378b18sm2219894b3a.48.2026.07.29.21.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 21:12:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <53527fab-620d-49c1-a65a-5253a9b65011@roeck-us.net>
Date: Wed, 29 Jul 2026 21:12:46 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] hwmon: pmbus: add MPQ8646 driver
To: sashiko-reviews@lists.linux.dev, Vincent Jardin <vjardin@free.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260729-mpq8646_v0-v6-0-98848151cdb4@free.fr>
 <20260729-mpq8646_v0-v6-3-98848151cdb4@free.fr>
 <20260729220547.C24321F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260729220547.C24321F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 15:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing named initializers in `struct i2c_device_id` array.
> --
> 
> --- Patch [3]: [PATCH v6 3/4] hwmon: pmbus: add MPQ8646 driver ---
> commit 63fabec4213f8ada1bf01d09967620e66fc9f459
> Author: Vincent Jardin <vjardin@free.fr>
> 
> hwmon: pmbus: add MPQ8646 driver
> 
> This commit adds a new driver for the MPS MPQ8646 PMBus device. It provides
> basic PMBus telemetry, alarm acknowledgement, STATUS_WORD extended bit
> decoding, NVM-backed post-mortem data, and an in-driver alarm-poll fallback.
> 
>> diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
>> new file mode 100644
>> index 0000000000000..1fd41d89e5bef
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/mpq8646.c
> [ ... ]
>> +static const struct i2c_device_id mpq8646_id[] = {
>> +	{ "mpq8646", 0 },
>> +	{ },
>> +};
> 
> [Severity: Low]
> This isn't a bug, but should this array use named initializers? The I2C
> subsystem guidelines specify that initialized arrays of type struct
> i2c_device_id must use named initializers, such as:
> 	{ .name = "mpq8646", .driver_data = 0 },
> 

Yes, this needs to be a named initializer.

Thanks,
Guenter

