Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917DD2E7365
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 02:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784858844; cv=none; b=g0d4XZxjudjJCihq+MXJjm7r1yxdInPv46/El7aU3aQobDqI5UE6a5jPK/VrlpbIY5Bjr2mWYN7rPWt4GpacSYefg3q+nXhVV2ttAd8h8vG12C6TnIOav7ghMo5eWuQpgLryuY5FBKx9gxU+aeEWVMVdYCIX+L5615fLY6UhUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784858844; c=relaxed/simple;
	bh=zcIh3xhJPfZul3vgF+1M9u53SutSZDLGPVP9Rpe9+8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EN7pZlbetcpgJ2smzuf8pbcdhWNEq/N87cgkZhHyun3OL+xBgfRgfNPZ+nn2Pgzlbw4nsCvs/1rV7OYipUO1+vMY9TS1uPKx9KHGAbRXEHsh+uFvFr2MeteIZMhGSa9J29LjE9GnzFmcC2FGE1OM2ryBPXW1YGfnKOYHlgzEaoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4KgeO8E; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4KgeO8E"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso1725444a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 19:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784858842; x=1785463642; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dl8tyxT4KPIKqu864RkA+VQDYik03yogsDeWzT/nylM=;
        b=l4KgeO8E0s0X1Qo7sX0bA+JJDJw0R0jLucH+2LodK/dUgm94W+/aQoSnIEiuCZu+wv
         q4Qt3Rb+LVBRSZI0s1Jl8ERRBnqPSGGhuVQCwfR5yicie3iuDPxcJa0KqTjl/i3hR2+I
         8AWZuJ/EzR8dqjCC7SZkcDFlIPTlpGYDNZxKfJxLkxUkMpQ7mbIVHoGbe5otsTMez+G5
         YVuTG0FsUGOdIYP8+hUy/+izBEQlmhZfXNVqIQbIQcHpizKemhIj1CnLQ5Ni3gmncZkm
         aR+VJnfwz+VIKeyr5tcs7Giil5MbfL6bFAsyq5faD4p6/+HsCPtrXFc7mttCGiiNckPn
         9Gcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784858842; x=1785463642;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dl8tyxT4KPIKqu864RkA+VQDYik03yogsDeWzT/nylM=;
        b=OMro3JX6ZXYFqnh0e1/QDs6ASt0tOWjbMVLfoYywDn6XlSAtq5GAzW0Y83yvZX+7Uu
         5rgFw5TtT4JLMfKFppymYm6GgaeewwFZwOmusFsy8n3RbGHKRizMcOdUWir5/HwCJxd9
         37zNMDd263KINTXcIGX3+r5++OGa+dQOpNIaiA1JdfJZeVFw7iFkC/5XVoWaHGv92GH9
         iKqiWFzQKr8vu1HmTjCEkKNAn9dR3iNlmL4oAdbS6MNBX6anlLqN2qdxw4wlM9RscZw0
         GRi6CSvejChcoNRM8WN7JhEkqbKg42q1b0iMeRwDAqBMO+CYNxzXvJbrGDN4R6A8XCe4
         ZWMg==
X-Gm-Message-State: AOJu0YxZ/1ZPsaYe33B+kBkmP+BfUy+BIzV+eJhKkIQG/W8mG+uNH3sj
	LXr4l+hg6bpREWNn4E+SDaelA9F0dhLzbNv4N4ZQ7LQjKUR4X3x1Kkgkv9hjpQ==
X-Gm-Gg: AR+sD10FAZPArFQurJAdHrKlpZbzNtNa2dQxaImN+RfdASetLgWyVJX3XI8e1V7jFsM
	I1sHj2nkD1hvMku7A1lVm8pyfhntUv3uncaJnlwJLags/nnKbUqIvdWguhbhO2r1CqBDIW1Gw8m
	varTFzKx8Avfsyb9g6p9HyKqoNOg8IgzV7ksH7SAkl91ZSVt9u30YBy6vdKl9AAAVqV1/V5mHyV
	PPB2gPI4sDDgrOh32KHnPj1uEYXq//Mdajcj3lYIUabIP3Dq52nlLQ4WGNYVi+A0DtSD+FePNsQ
	0KJ/zkrPE9tPa3oSJowvnaISESZobytwuU8dVYNO6C3cAlOtCWUxL9pRkq65YDqaOvqPk0uDkYs
	2NG4SClEHk/kbW9bnEwo915my1CUG3vEIOfEpzAUEdibnsliFLx2o92sswm+IZW0KSKlkDQsmLY
	s3IxXNSwiPgsEpx+87FgfwQXC6lElTu6aHQbwVG+uIXC8evH7cN/A=
X-Received: by 2002:a17:90b:4c12:b0:37f:c2a8:ce45 with SMTP id 98e67ed59e1d1-38ec6539535mr5383662a91.4.1784858841861;
        Thu, 23 Jul 2026 19:07:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf9bfbf725sm33637515ad.36.2026.07.23.19.07.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 19:07:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b5c0741a-b9da-4a3a-81ae-33368e6dd756@roeck-us.net>
Date: Thu, 23 Jul 2026 19:07:20 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] hwmon: pmbus: add MPQ8646 driver
To: sashiko-reviews@lists.linux.dev, Vincent Jardin <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
References: <20260724-mpq8646_v0-v5-0-5915b5ae9aa2@free.fr>
 <20260724-mpq8646_v0-v5-3-5915b5ae9aa2@free.fr>
 <20260724000643.E60C81F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260724000643.E60C81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/23/26 17:06, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Stack variables passed to i2c_transfer() can cause memory corruption or panics with CONFIG_VMAP_STACK.
> --
> 
> --- Patch [3]: [PATCH v5 3/3] hwmon: pmbus: add MPQ8646 driver ---
> commit 1098fecfca1c29b33a174b200465134bc5be4be8
> Author: Vincent Jardin <vjardin@free.fr>
> 
> hwmon: pmbus: add MPQ8646 driver
> 
> Add a new single-chip driver for the MPS MPQ8646 that is a PMBus device.
> The driver adds extended bits decode, alarm acknowledge, gate-close retry,
> and an in-driver alarm-poll fallback.
> 
>> diff --git a/drivers/hwmon/pmbus/mpq8646.c b/drivers/hwmon/pmbus/mpq8646.c
>> index 0000000000000..f8dfabef09df3 100644
>> --- /dev/null
>> +++ b/drivers/hwmon/pmbus/mpq8646.c
> [ ... ]
>> @@ -187,24 +187,24 @@ static inline struct mpq8646_priv *mpq8646_priv_from_client(struct i2c_client *c
>>   static int mpq8646_raw_xfer_rword(struct i2c_client *client, u8 reg)
>>   {
>>   	u8 cmd = reg;
>>   	__le16 data = 0;
>>   	struct i2c_msg msg[] = {
>>   		{
>>   			.addr = client->addr,
>>   			.flags = 0,
>>   			.len = sizeof(cmd),
>>   			.buf = &cmd,
>>   		},
>>   		{
>>   			.addr = client->addr,
>>   			.flags = I2C_M_RD,
>>   			.len = sizeof(data),
>>   			.buf = (u8 *)&data,
>>   		},
>>   	};
>>   	int rc;
>>   
>>   	rc = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> 
> [Severity: High]
> Can this cause memory corruption or a kernel panic?
> 
> I2C adapter drivers often use DMA for transfers. When CONFIG_VMAP_STACK is
> enabled, the kernel stack is not guaranteed to be physically contiguous.
> Passing stack-allocated buffers like cmd and data to DMA-capable APIs
> like i2c_transfer() will cause dma_map_single() to map incorrect physical
> memory.
> 
> Although this is triggered via debugfs, executing it on a DMA-capable I2C bus
> could reliably crash or corrupt the system. Should these buffers be dynamically
> allocated instead?
> 

Do not address. This is a false positive. Sashiko's I2C subsystem prompts
need to be updated.

Guenter

