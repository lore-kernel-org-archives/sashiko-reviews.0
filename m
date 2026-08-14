Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011243C09FA
	for <sashiko-reviews@lists.linux.dev>; Fri, 14 Aug 2026 01:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786672503; cv=none; b=MC0LBYhV2RE6RIMGp+hFlgvex6kWxGT8yN98W2CdPcOo0/Osyhy+F74uaAtbGhh22wWfahYcA43iMCt5HOSjQP21xRthlcllJIhaktbvuK/LLG/2CubB+eMz6aAlCkf6F8A7n1HkobV24PsNC2bJeTkWNbth6Gng21azPrRtiC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786672503; c=relaxed/simple;
	bh=j85EFgrf1Y46rKhF3b/FocaS4pizP+Cr+46Pn/4H/Xs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aw04F2/pGRT8Woaqkz4mHGgGPmaP+4kgkOh74X7O4AfP+d334cFZ61qIxaF2xcFiz/iZy6uC70kRr5Mio9epAthF6g0RWXUlAMQLiXn+AnAHvmdwhJXTEIR02GSDXjaCFNG4FyRK9EJEyqeDTOWv5DA0PAWtyFm1xte9KemEqCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYR8+bea; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYR8+bea"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caea3f742bso10204705ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 18:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786672501; x=1787277301; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPbhXj68DFow4KobHedvhSuUYttTMn8QptH13rBUSKk=;
        b=hYR8+beayIDRy+ICdXR+OSBVqLd47VUNbZnzx7tAFRoWai5nmU+NRNcLoPSAVjEtY0
         Q2vDFOQT6JnSN1S9sxWeMZFbD+WpDhjaCiwYqQDo1f1jTmdksRjcslyOXZODUGCJb3nB
         aW3T2PjPHUMyDBhkBoc4wONSNRX5Kad6KvUIZalqsRJeFHMlKqfPaBgNNjx8MNo96gPE
         HjH5FMbH5YIAHUWCbF7QNAu12Ui5a5XXKHs3P9wPrcQgkxYG1LB3o9032MQPImQX48rG
         G1HlDa5mMHvnsZJUVPOpkOHjwmG3omihbapM920Y8jgJUlLmH3lD7LSaK8houV95smCV
         jUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786672501; x=1787277301;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bPbhXj68DFow4KobHedvhSuUYttTMn8QptH13rBUSKk=;
        b=oJkKdTHXQF3LJT6Qlm8uzlosDgkISPyJWUye5pbXCdQNWDDACwh/yw63r0CWaDhqke
         poII//qyHY3lZ1CQzAEuudWnKcqpFaRC2BzRBHDTnJpGoTxl4Ekk3ZhhPuQujpG1cVA7
         PXZcbCyQyE99kma1HZg11f/L4aKd99M8x00ovRi/e68xXcIzvy27cKXpfehSLPEO2UpN
         R4f1kB5+pS/uGQzjBxsnj8TlagPrcYEa+GIxEYKwOfkIvztC1SkTymdWc/sGVIglQjx8
         hJia5/oYi1chGQdz5qpwY2wpLWu76m0XEYhPN2yddPeswylB0xUw1gqSIIP3takQhxt+
         Xbcg==
X-Gm-Message-State: AOJu0YxbAiTNjZjDtPTeu8CJ8d/rWb+QPdIS49KMPSfk+RMF5y4dhXRB
	4jLqK7JY7u1XsViNs2IiiM5OhnVfNduYY24i5eECctGGFPCs5ypa5+N4WLq74Q==
X-Gm-Gg: AR+sD13rJ1lrP1YIGnxZLQUiWaxYp3e2xC4d3AiD37Aqw3DLkGI7F6yImr5cAnaSStd
	Sen7XkodYxPOCgYXpsUEnf9DWC0bXx58a6kOQqidGSq/OP1OKfBsZeFy+MI/EAGMORTD1G0LJR3
	3CiX5bH2mfMzRc2iLLyM+qdXvCWZkApZFJA8vj0T7Unen7esZQ1dfVC//g5vKz3ixCdqw6UiS5k
	Drp8QCWEi/5V3BfxXopLWQwDPlRW/mNUxkeXSQgMYH0cz1XEf9PaBozAIMZCIuPsT/hnMqXzTdL
	+uwguWLv+qvYtl0iS+DygAjyUVbB+p18ylKAKAqBqTjTw6f6tAEj8kysJMhIoMs3w+UnkBfIlct
	qqzjtzPKyVWJGpgo6yfsL9XRDiKnajZT7uMOJotxfZmQdddpNn7MDcs7rscl5OsCGjaQt+gog4v
	nfPqED5yFCCqbKj0spfv0134JsoF4gDXzNHytvilbqgzjQQyv598ZMTy91O8HzRpP2fK9yHNk2j
	yT+l3NqizwxOzGlK861t71vYTdx4RhqoqeYjA==
X-Received: by 2002:a17:903:2384:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d3b088651dmr29467465ad.10.1786672501014;
        Thu, 13 Aug 2026 18:55:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc75d8casm14375368eec.3.2026.08.13.18.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 18:55:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e76206e7-5c8c-47e8-b630-97343570d4ae@roeck-us.net>
Date: Thu, 13 Aug 2026 18:54:59 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: Add support for currX_emergency and
 inX_[l]emergency attributes
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, Koby Elbaz <koby.elbaz@intel.com>,
 Konstantin Sinyuk <konstantin.sinyuk@intel.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
References: <20260813211433.879638-1-linux@roeck-us.net>
 <20260814012059.CFC2F1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260814012059.CFC2F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/13/26 18:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Internal ABI breakage in the habanalabs driver caused by inserting values into hwmon enums.
> --
> 
> --- Patch [1]: [PATCH v2] hwmon: Add support for currX_emergency and inX_[l]emergency attributes ---
> commit 618b70e656b029d918a4d90557dfadbd253324dd
> Author: Guenter Roeck <linux@roeck-us.net>
> 
> hwmon: Add support for currX_emergency and inX_[l]emergency attributes
> 
> This commit adds new emergency limit attributes for current and voltage to
> the hardware monitoring subsystem. It updates the hwmon core code, the
> enumerations, and the sysfs ABI documentation to support the new alarms.
> 
>> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
>> index dd713e193d0c3..a3a7d27f3b5ff 100644
>> --- a/include/linux/hwmon.h
>> +++ b/include/linux/hwmon.h
>> @@ -134,6 +134,8 @@ enum hwmon_in_attributes {
>>   	hwmon_in_max,
>>   	hwmon_in_lcrit,
>>   	hwmon_in_crit,
>> +	hwmon_in_lemergency,
>> +	hwmon_in_emergency,
> 
> [Severity: High]
> Does inserting these elements here break downstream drivers that rely on the
> historical integer mapping?
> 
> For example, in drivers/accel/habanalabs/common/hwmon.c:adjust_hwmon_flags(),
> the driver performs a hardcoded bitwise shift assuming the Linux hwmon enum
> values perfectly match the firmware API shifted by 1:
> 
>      flags = (cpucp_flags << 1) | HWMON_I_ENABLE;
> 
> By inserting elements into the middle of this enum, all subsequent values
> (like hwmon_in_average) shift by 2. This causes the habanalabs driver to
> incorrectly map firmware sensors to Linux hwmon attributes. For instance,
> inX_highest will map to inX_average, and reading from these incorrectly
> mapped attributes via sysfs will fail with -EINVAL.
> 
> Can these new enum values be added to the end of the enum instead, or does
> habanalabs need to be updated to decouple it from the hwmon enum ordering?
> 

There is no guarantee of a specific ordering of those flags. They can and will change
position and/or ordering as new flags are added. The hwmon subsystem must not be held
hostage by some driver making up their own rules. FWIW, I don't even understand
what the habanalabs driver is doing and what assumptions it is making about the position
and ordering of the flags.

Guenter

