Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F6A78F4A
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 00:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717412; cv=none; b=uL96w2LSFMCZ9CHIEZoi5iU4ocb6wxd8R0isETJ+SgykqpiiU1nDQgBkAu1a1ePLccFhn65g9WWQo+1DsmzeDZSyy6dWbbvLHjXXbbRYyRYqlTPCJmf/6XA3B1ldMXP3no6RsaTxeLXiC5Axi5WChrwmyPsXNCZ2BDX7/ulmIcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717412; c=relaxed/simple;
	bh=sS7wBLkPaNaEhn29un7LA5fVRg51/JIbqc/tbQVEgp8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eg0qJElGs7Q6EV+0eefLh/mxCTtBCs62TlFwm4Vw0Jq6UezXyQr1P584WkXb4v0/VDlbzodG0oajAPR8umPZp73qURrAoQ9BT8+8gEm8zxOvsrHly8d7M7cODNEhcBeyoN6ZjVrlyUmB6tJy77kuwhw4bnx3JbWzE8BJU0WW300=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prp1kk14; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prp1kk14"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-366070f71adso6720118a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 13 May 2026 17:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778717410; x=1779322210; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vOAcYdPyXHkFqrxKp0cDRmdzYG13zNkZb7reoBLfuYo=;
        b=prp1kk14tc9b4OnK1+8jKZ0Iqk2pr43HsIBEuFKlYtKQuFMAlkCEmNwkbhwzv3gt6a
         ZWfjuytggL+04/FMRDhlGzjQj4JdIEDpvzR5H15IiQEfU+IgaHMNmjI1W2DMD/cwd8VB
         AHHji4V/begWSzM7AE4h9ysBNuVLfkiOguvtK78y8IrMWWqS6OFXJPIOwyL9MZANPv8a
         q7AaxtWLKu39EiJVcZY8PnaGt1mq+1+2iZXdczc+DT7Od8bRqmltLDGqZKW4qvzhnR0y
         yTh4TUaxPGg4/MkLfiBxZuDtufUIrcOfB/H4JwHDxVva7rj0w75twwvYHyY38nd0lIxy
         81RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778717410; x=1779322210;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vOAcYdPyXHkFqrxKp0cDRmdzYG13zNkZb7reoBLfuYo=;
        b=Fbw6fQhMvV5LT01gCRKj460slDRr1aij/Kck30q1JH93WufioHXb00njvl2qjaDPeu
         JgtXsW7USWZ0uxmUJ88xg/AINqYQ8ysV7VNs3WOkJQV8tW2Neh6GkH/o4TkvoL5BVSeh
         UXqfH0yEAF6OTFCTioKs0jtupt6SRizi2Xackc3XHsnZxe9Yy7PoYGRQcyQ+vJarpgnj
         hqnt/Ikg7QaF6WcKEnytcNCa/W+rF1vtDYFb3PJligYG2kdBlxvV8fchtOQl6w/ryyto
         2fqxydDp6phTv2Yqa0reCHezwmsQFgXnQiwsursyNCTUlUngu7tSFT+p18zF7JZiiMFV
         0CEg==
X-Gm-Message-State: AOJu0Ywim1mb8tFcWPdcJCgarKEkBv1AEpWFBLb0VWDB2h1PBy9A2iIY
	GqVLGjBhEL/ubkWACdpJBmRWBcZ9d3D8vo69LphN89xOm+JjDtliyGTqIGJdaQ==
X-Gm-Gg: Acq92OFZ0WmAuiUG3Zhda6/0NhWJN1U8H4/OKMjutxMZ11Xif/T8MqWZd8jl/1dHd50
	hQi4zYXYUWEF6ZGZG3DdWESn5DJccRoRDxa4R64MvbnAPG59T/fBHdlCwPEoUD/ip91jmMfbPrT
	x2/wbSN9RT5UYW3FiMDA55EaE0JqaQA4/F44l/6gbV/qHR1ILm00qi8972bVqy0WLID1Yv2zWuY
	OeDxzZf6cFjaoMK437iTy9bQHUgWuu1YY4QtrNdbbEpzrc3oaZ7dUrizqVq0pRnVWe+7WUPu1og
	JAseHWIogX3qqqffv4hmAAJXOY8gsppZUABDQDnyIqjeiK3VEtaFg7aQcgRJ2ocb58YWm5y/Q0k
	V5pX1YDaOOd46jUuXNFuYo2QqI4WG4+dnLQzfuxqFjGeFylfB1hApDTdN6td+p2YPqJDrJPRgr+
	Gfnde9bnSnRA+lm90sg0hMJ17E+/cr4w4OwLA806jxaPIYq0w+lJzPRPP/55uZrFxTvgGX3kioP
	zkdRN3rmq4=
X-Received: by 2002:a17:90b:564e:b0:368:c2b1:ec9e with SMTP id 98e67ed59e1d1-368f79c728dmr5590441a91.22.1778717405565;
        Wed, 13 May 2026 17:10:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee626aaasm4494949a91.15.2026.05.13.17.10.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 17:10:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <45353c6d-3941-484a-a88a-49183227b7df@roeck-us.net>
Date: Wed, 13 May 2026 17:10:04 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (nct7802) Add time step attributes for tweaking
 responsiveness
To: sashiko-reviews@lists.linux.dev,
 Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
Cc: linux-hwmon@vger.kernel.org
References: <20260512041607.988078-2-ronan.dalton@alliedtelesis.co.nz>
 <20260513233146.CBAC5C2BCB3@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260513233146.CBAC5C2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/26 16:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] kstrtoul is called with base 0 for a time interval, allowing unintended octal parsing.
> --
> 
> commit 3cecff14f185e191b2b2e66dc9e9e9cb80c25244
> Author: Ronan Dalton <ronan.dalton@alliedtelesis.co.nz>
> 
> hwmon: (nct7802) Add time step attributes for tweaking responsiveness
> 
> This commit adds sysfs attributes to configure the step up and step down
> time intervals for the Smart Fan mode on the nct7802 chip. The user-facing
> values are specified in milliseconds and clamped to valid ranges.
> 
>> diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
>> index 8c9351da12c6e..f30123fd908cd 100644
>> --- a/drivers/hwmon/nct7802.c
>> +++ b/drivers/hwmon/nct7802.c
> [ ... ]
>> +static ssize_t step_time_store(struct device *dev,
>> +			       struct device_attribute *attr, const char *buf,
>> +			       size_t count, bool step_up)
>> +{
>> +	struct nct7802_data *data = dev_get_drvdata(dev);
>> +	unsigned long val;
>> +	unsigned int reg;
>> +	int ret;
>> +
>> +	ret = kstrtoul(buf, 0, &val);
> 
> Does this allow unintended octal parsing?
> 
> Using base 0 means that a zero-padded string written from a userspace script
> (e.g., echo 0150 > step_up_time) will be parsed as an octal number rather
> than decimal.
> 
> Should this use base 10 instead to prevent surprising behavior and match
> other standard sysfs attribute parsers in this driver?
> 
Agreed. Please fix.

Thanks,
Guenter

