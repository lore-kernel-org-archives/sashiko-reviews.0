Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA94D3115AE
	for <sashiko-reviews@lists.linux.dev>; Sun,  7 Jun 2026 23:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780874833; cv=none; b=b+A4Ufd6R7cHiFuTop3v25peyemvPQOnbqG+SPNKHKukilTHImzwgo00Jhzz5739u5POADozJxz7Cc34B7va2EenUepxuhKXPI9g26nsiGT7PCDKJXmGJZmnyIZyn07kI6oJNUGPhlqRcskonG2F82oNtsrOEpRmNyf/cKqtpks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780874833; c=relaxed/simple;
	bh=JaIgZGp87mHQeaWQRPlb24gfMcw+k2bxvNISw/zeBi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJf+/wA5mvNOv3dIfafILjdru3ZazOYKIKPQPT+4SMsTSVcsEsvHA/oMsNzqBGOWi2/g92rFvjv+Hcbr7FuvFMHEPBQkrysLDMjYD0n5QNDCUAIrS6QxxoVpXGSU6Atg/vLekun2qYzOfkwZ6inzZN4hjlHeisEbM42Ckklc4eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZcKVTro; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZcKVTro"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf2e8ccca1so25557685ad.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 16:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780874831; x=1781479631; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=bUZyp94wCma5Mp7itw6GHKFNArJTxzXMRHFwaw1fChk=;
        b=PZcKVTroR4hBHaaeSv2e9EOjFZwGtzmk39AkeCidRFgVKumSATTAgo8MQzSOyFLY8Z
         jn9p64pe13c87UYx3Yxy+S3RHJ48dLr9VvcVUYazUVjQObzq9O7bhuzmetl/Rg8vCmSm
         qRE3GFxZLL29QGhhzAP7FNw2+NiWkPE9J9R6kHHw0SOamMOco9NAa0U+xfaRJ8WP0cWh
         oz4DOctFa1zjPYMXYgRlr5EsSDKLI52jJntZlupHqkNm91DqDSWHf9pUmfFdYWqNuBbN
         W5qdxBa2F6A50RNAxOrExvvZ1VRtOJM1pgCqt0bt/dsJJ6Yz87nTwlooOe27u5rk/dFd
         MU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780874831; x=1781479631;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUZyp94wCma5Mp7itw6GHKFNArJTxzXMRHFwaw1fChk=;
        b=YjMvI1Uf7jYYXIBmt9CqXK+tC8Khseic/P6D9zcyLROTQJsjAunmTLT9aPLxAz1QoD
         FlK3u77KhiRk2VKxWJga/7f7/ordwdShtPQRZT4EPL/2pOzK7sQSV17yumXFwzJoGeIM
         fYSb7bxPBF2JoQwbJjT7qAaP0PPyBPmPKUkxf34Eys1m3RWagPVmrRfbbssDoW7dyY1C
         ZSo9b4sihOoGM2pi6pldvnqaKkZyIPk5+tmwkJsVlR1cDQlzS595g4QuIgfnPVtNyYwS
         D4xu/iXHqKFXrr1+Y8Mg1D6tDNTBViq+YIxREAkDRXn2AQu8jE3Ilfo5L0cMwGxgriNu
         scDw==
X-Gm-Message-State: AOJu0Yw/HwFC/UbBAfl+Hg8gqCGyEghI21isGyabISSxTWv9VEvKZYVY
	gXK+vP5sOmxmDdr3NFhoFNkO73zDtMyNCS8XW3Tmf+fmqbFJNsCho/py8W8tQ13I
X-Gm-Gg: Acq92OF1HVBzJD72/BPTl4eHVXpJpqhIHeXdQftaEgm6v57e5YoIoZD6bEcFzt4p/ZS
	129Pw21za/Vq3mDoYuAYysUThoTOEkuc4iER3JSu+wUkZ0DJkdQtF0oc9+3+5N9QllVt0yoHZjm
	nXsvY4tkqv2K0/nV5PYtA+E9EFsFIDkvRE1cfabcGFBJrIzcRjE6fgkdzAJrldVdsqN6R7cNBab
	ay6ah5C2Yw3uJd4b4/pYGJzKZV+EqLrLG+VmXUnyFNt6Tkd7zUA/ygJFYG0EH0h1Ih+gtZT/Gon
	jC8YvTPspJrF/hqwTso2uYeimGxyZUUmLtMn/YESNph7ow5uH1QiiJsUiwbd+g2Go3lzsW7LNhm
	QulejpgzmxJApTbq2VclaFqSmFec4+XZpmtbGgMFZeaQTDhnxw7Z3SInkYtYPsVpDV9nQ1uXYQ6
	0IBKG+EwTvyABead4JOaM4nmF6FyHjue/+z2G5zqaH+j7oq+OwZq6m8rJHOwor8CTzKg4vGrc6W
	JnjXyE11nA=
X-Received: by 2002:a17:902:f64f:b0:2c1:6e2c:a5e2 with SMTP id d9443c01a7336-2c1e7e4f342mr146940555ad.17.1780874831262;
        Sun, 07 Jun 2026 16:27:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8792bsm162281735ad.23.2026.06.07.16.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 16:27:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e47953be-dc37-4d97-803c-5d38b4f7e910@roeck-us.net>
Date: Sun, 7 Jun 2026 16:27:09 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] hwmon: (emc1403) Convert to use OF bindings
To: sashiko-reviews@lists.linux.dev, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 linux-hwmon@vger.kernel.org
References: <20260603141033.111300-3-clamor95@gmail.com>
 <20260603143009.38F961F00893@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260603143009.38F961F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/3/26 07:30, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The driver probe unconditionally fails for `emc1402` devices because its chip enum value evaluates to 0, which triggers an erroneous error path.
> - [Low] Directly casting `const void *` to `enum emc1403_chip` causes a `-Wpointer-to-int-cast` compiler warning on 64-bit architectures.
> --
> 
> commit 8e14b2d237bb423a526fb43282f03dadf7dbb7dc
> Author: Jonas Schwöbel <jonasschwoebel@yahoo.de>
> 
> hwmon: (emc1403) Convert to use OF bindings
> 
> This commit adds an OF match compatible table. This allows the driver to be
> used with Device Trees.
> 
>> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
>> --- a/drivers/hwmon/emc1403.c
>> +++ b/drivers/hwmon/emc1403.c
> [ ... ]
>> @@ -659,14 +660,16 @@ static int emc1403_probe(struct i2c_client *client)
> [ ... ]
>> -	data->chip = id->driver_data;
>> +	data->chip = (enum emc1403_chip)i2c_get_match_data(client);
> 
> [Severity: Low]
> Does directly casting the pointer returned by i2c_get_match_data() to a
> 32-bit enum cause a pointer-to-int-cast compiler warning on 64-bit
> architectures? Would it be safer to cast it to an intermediate
> pointer-sized integer first?
> 

Most drivers either use a double cast or cast to uintptr_t to avoid
that problem.

>> +	if (!data->chip)
> 
> [Severity: High]
> Since enum emc1403_chip defines emc1402 as 0, will this check evaluate
> to true for devices compatible with emc1402? It appears this might cause
> the probe function to erroneously return -ENODEV and break initialization
> for chips mapping to emc1402.
> 
Other drivers do not add this check, and I don't see why it would be
necessary here.

>> +		return dev_err_probe(&client->dev, -ENODEV, "Unknown device!\n");
>> +
>>   	data->regmap = devm_regmap_init_i2c(client, &emc1403_regmap_config);
> [ ... ]
> 

