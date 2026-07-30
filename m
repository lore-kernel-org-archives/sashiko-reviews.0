Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E752235C694
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 02:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378933; cv=none; b=F/2QHWbep6fhYcecDxs+V+PhXHKXiE1K5VLkTp7jq8/3B0K9udAiCSIB/9JAtdCYPYzBB/ViJRJGek1x/GoEFs0MvEvW+Z9t4wCz1vcUp+2VxGMX3Czv4pmqOG9WfXMorLrVIwBkPGD1lxGlGtm5+V+lZShzTgSDq360mfirWvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378933; c=relaxed/simple;
	bh=6Y48ZIdMNNpL4QVK2z7qD+SFM1e++4Aj0Ygca+6+vKA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DxGLv7sDv4jcW8Q1bSUZevAWxND6MrL4XLQFM6wl2ytt/juL9IaFSgPvEO+lYRuMOzJepqum2QRapdnXK0GakZpNemgZmCLGestb7fJ3RP/1ap5MVxShavXPzaslvR/j3uywX+hhOkJyGBEkIu9dTDzuM+sHSO0o8FaDt2dBAyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJ+NfBm0; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJ+NfBm0"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9aea40d799so896728a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 19:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785378929; x=1785983729; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2rmqyOk2dYLKOaM5sRcp1NgPLaXmeuvz/kFO5pY5/A=;
        b=WJ+NfBm0ejMt1npPmRf8ta+mEqi9hrUDQG0HdUS+h8EfT33RzF4Ql+dgvaTCsytgrr
         +LHs9cWIvJyJZVXigJlLjUQCE8ne9ZHjCbdFb9TY79sNDVcgk9qSjv4Q4TjEc7V+EsSN
         SN6oi50fOgqDsfoyQ/QR2krIj/AelWTsctHQ6f//xo7aC6HK12jNvgTKyVN/1cZFxzs2
         Lbg2I2cj2O5byWHfNeEvMBDOaDC7PwvQNV/4P0kFjGUssRacTfGDmeWC+j94lNkW9m5B
         UYXwxF40ypi9m9Do3UHDaL/thqjkxI7LCENYAatQScF5t5QgUe6GhoEqKZaiGS6CiA13
         haBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785378929; x=1785983729;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/2rmqyOk2dYLKOaM5sRcp1NgPLaXmeuvz/kFO5pY5/A=;
        b=R7GLtvIBL3HxEuTiwq8mgraaa9Yhyw4/bw2HzkyN8RTx/Q/QsnHratYNRvsfhoGYMy
         BykqGn+bdkJ+HMt/lB9Y+1zC24k9ajssAdyuQzKM2rklUBvx3ldKGUgjNIf8Myi7PUpX
         b0iyJqyYQdS+zYLuzyYjng2q0C/DS1KKB7DCYxcRAGflXrTR+fjDpaTsaGDdB1f4Sjs2
         NbAM/5vccw0CkjPRddPbbV7RYPm8eg4Nu3ziTLaH0yes9WC/azk0wxV54v48skTASeCB
         wOpPeO04rx5s4/z605TH8AvDo/Dkd9s/1JdqoRgc1NY8FgHEJQBuIjl3n54LKJS0C/CL
         ey0Q==
X-Gm-Message-State: AOJu0Yxeb4MtKfPGhF67m0oL4VtBD2GoFenYIBs6Jhwz0MirfVSASKGT
	zdN1rv7m1cB97GMgc+hCgCyA1VtKouqTsFZBKw6bUn2kfWAxrYBYSOe24uPeGQ==
X-Gm-Gg: AR+sD106iFUJE/mEN+tQbckVcAmSR19AykmQ9OfAVyTZA1YbPWrafen5YMUAe4uScPM
	vC9cjFEqwsMJXdrjwqlpbqc0ME/kTgb9FsSpc7ztDMUk6tnm6p0Jfbu7h8GlwCvP2mOuZhycgSB
	OeoN+ZRQXCfh7vbdq3aA/aPb8x00BfSJD3wkTCpqjAXYxmEBkrALODKNo7hJe8AMEC8CYSzBktu
	5/7xYC++rSpRQq4JyHljfjthNWnowfPihx41a7cUZIjxisHLU4c03LN0G+K7XLqR7AtYoxczVLR
	YuuoscpzQyDSMIYKV+1qVuEB3gTcj6cfG1l9RfBjY5xLnEp9pBJqbqB3kjc97HX5zXkzdHJYYHe
	wgZwgoICDQPqFcU4MGw58vrFvm+qm4TvC7V0IAmBJG8I1tpxc043qrEtZp6g8+yRiHynBtVIUKO
	9bQKgSRDeYCCOqyCGWiNtFMYDPDNtfoIcdEcA0qBlIr/NZQfLcxB+Rn8EkJoexttpUSiMItA1tS
	EozrpZkA+eXsqSAczt6e1keX4G/exQXsu5oGNNRR1xD5RGr
X-Received: by 2002:a05:6a21:2291:b0:3c3:824d:5200 with SMTP id adf61e73a8af0-3c90085cf49mr662407637.41.1785378929470;
        Wed, 29 Jul 2026 19:35:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13f9a041e36sm2433441c88.7.2026.07.29.19.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 19:35:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <07433bfc-95d0-4de6-b4d0-b2ca70623776@roeck-us.net>
Date: Wed, 29 Jul 2026 19:35:28 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] hwmon: (pmbus/max20830): add support for max20830c
 and max20840c
To: sashiko-reviews@lists.linux.dev,
 Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-4-a7553f84ee74@analog.com>
 <20260730011406.A6B871F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260730011406.A6B871F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/26 18:14, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The patch adds support for MAX20830C and MAX20840C devices but fails to add their corresponding compatible strings and I2C IDs to the driver's match tables.
> --
> 
> --- Patch [4]: [PATCH v5 4/4] hwmon: (pmbus/max20830): add support for max20830c and max20840c ---
> commit f53870a8f52f5aa8dbc791f9a7e148eeab915f24
> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> 
> hwmon: (pmbus/max20830): add support for max20830c and max20840c
> 
> Add support for MAX20830C and MAX20840 step-down DC-DC switching regulator
> with PMBus interface. MAX20830C is a different packaging for MAX20830, and
> MAX20840C supports 40A regulation compared to MAX20830 that is only 30A.
> 
>> diff --git a/drivers/hwmon/pmbus/max20830.c b/drivers/hwmon/pmbus/max20830.c
>> index ddead72a8db5d..94433deda0113 100644
>> --- a/drivers/hwmon/pmbus/max20830.c
>> +++ b/drivers/hwmon/pmbus/max20830.c
>> @@ -21,6 +21,12 @@ struct max20830_data {
>>   	u32 vout_rfb2;
>>   };
>>   
>> +static const char * const supported_chip_ids[] = {
>> +	"MAX20830",
>> +	"MAX20830C",
>> +	"MAX20840C",
>> +};
> 
> [Severity: High]
> While the new chips are added to the internal string matching list here, does
> the driver also need to add these to max20830_id and max20830_of_match?
> 
> Without the new compatible strings in these tables, won't the devices fail
> to bind to the driver when instantiated via Device Tree?
> 
> For reference, the existing tables at the bottom of the driver only have
> entries for the original chip:
> 

Sashiko is getting a bit confused. Patch is ok as-is.

Guenter

> static const struct i2c_device_id max20830_id[] = {
> 	{"max20830"},
> 	{ }
> };
> 
> static const struct of_device_id max20830_of_match[] = {
> 	{ .compatible = "adi,max20830" },
> 	{ }
> };
> 

