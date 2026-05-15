Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B073FBB45
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862084; cv=none; b=FtyncK7Nr/Xbdj/bb1uB4DuJcGxk96Mug6I3zx2Yat+UHX6CpjoxhTkUKStLwvnxdb9TPDfn/y6yb03a+MhXCXMpdbT9sMYEMlTfLoeEUoDU9BC1cc0feb9A+suTVY/AIf/yk76NDFTQn5RYOeu43ukgulxbovT5LYhe0WiTK2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862084; c=relaxed/simple;
	bh=Tw0vpBGDw8SK2cr6QXxiQxXRtOISgW9y1+qW6NRo0ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TbcaTzUq0CXKP18rUN/o3elA6nrcS1vxcai+JA3Yf/Z/+STf8DyVbxyquMG6BWMZWZV3yRwwt5kGbZCE16M4yY9xgiX5R9QQsr2bYoIk1yV6Kn4pIc5hi7nODuajW81w/X0e3xoLLKEuFf6dPCf04e9ISGWM/dizDJRlv9IRzrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaY7F1Rv; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaY7F1Rv"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f7ca62a3c4so2587eec.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 09:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778862082; x=1779466882; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ofmXR/2DExqxSy7SHuh8P3lsZ2wjIAkkynqNVif/tUA=;
        b=jaY7F1RvlH5fINoFCUogK1Y3wkYk/v7abgId6iZTe0WOC08eaUgJ6bKt6TL3R8shyA
         73aTXJJ0V4tJSNc8IJdZhgSG9ifVKjEzBjPh0K96nrJg+OeEqakEnpDUINwCJgpgcN1W
         sEH1N6I1BoqCdCwB8AMmNXUekXK/25MC/sle04us0/d3oD9S9/yshWFZEvTnMdDM4NN+
         izivngBYmCvTchFC0Ld5+pwaB/slw0W1LkZzO0fXQdawQflRIlNX6YgAV6jic9qXTi0S
         G3RKH9JJ4wbo+EvV1UT6Y735PPzXH2pVpYNru6e/eWbFVkW4IpyWfJR6feA9gUYjanTi
         6NBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778862082; x=1779466882;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofmXR/2DExqxSy7SHuh8P3lsZ2wjIAkkynqNVif/tUA=;
        b=J2ttRwyem6lQWQMHnAEjgJB54kjKfDQQBj/jRdqcJJn5RBaTMScw1y6hrB4EPJY6bD
         JM/R2HgBzSIfcBifj9G85mPu8dgYQZoEz08jYy5iRJHNZoz6tkSG6ayEqOZIZPNeL8zI
         n1Yl9XcIJ6GyhMOTG58oMS8NMPdr2pjjr1OM8BEcJXusyPUauL9zD9uUIjdSRQOJHcdG
         xPzVuScF/azhfas8RFBHH3BWzNFeiePDrMywX+2wQ6RskwNAt7h3esyGKUClKyDwJaTM
         TgZk1WwN0W1Kdym8Guvwki7CdkVW3FObkal97z+N/KniykoPF7x0l8iwAHkqVVPDH5eJ
         7w5Q==
X-Gm-Message-State: AOJu0YzarxtgNbPryYG4C+bUlaI4YehftMAVJrQxchOBGkJk8Z5+l2Q6
	ruuqjH+zOX/GdUlUUuGrgs/xs9XN4GpM8oVnyG6oR1/YioYYCEw8CgOAUNh20Q==
X-Gm-Gg: Acq92OHCp7MrDe1o+cEC4DPn06PRqQGCmtBOFHVhA7xAuBS+OG+fKmthTrzuW3pj80G
	GK1qm0lfUrvC2uav3liCLFK33K3Ufv0jY4UPxUjawsnwi0e9tkrVzJouwZMSJYPn8RwK3G3DSak
	5vTxBXReQnlEV5JMPoyarT8qzjRiBvYioblaCbRQK5JJqOGmhQaysWdc07yQQsfh6VdWwAaiZCU
	NpD4oP2/cZfp5rc1xsHvHR5qjMokzIvjSysgl34lnO2bV+H4F44JOg61hch7TGz67Ex2FjU8Sf6
	p8hCulVEE/Ty3/mHlN7slFPkEelRiDyY+OqZ6hythXCU1Z7s5RamlK9f+3nScN/Fsqmah0Hege1
	dnKQMe1MRpvJ4pway1XbBWa92rYSFHG7MJYFA92w0WvSHW7AhQvEXqlC8dXgs4hw6645f5qWrK4
	Ebh5efSBViwdQ1qqKAfkF9JKPTyO8F6tp8XAjgThOxqGbluemEPtxIbRcFqZAmJus/MxihwpN4y
	2KofEbbWnY=
X-Received: by 2002:a05:7301:fa0b:b0:2cf:3de7:22ad with SMTP id 5a478bee46e88-303986a6856mr2140894eec.27.1778862082152;
        Fri, 15 May 2026 09:21:22 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcc464sm7990113eec.14.2026.05.15.09.21.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 09:21:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <64b522a2-f246-40c7-a0c0-39e74612a4b9@roeck-us.net>
Date: Fri, 15 May 2026 09:21:20 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] misc: amd-sbi: Add support for SB-TSI over I3C
To: sashiko-reviews@lists.linux.dev, Akshay Gupta <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260515134506.397649-5-Akshay.Gupta@amd.com>
 <20260515153312.DB3A6C32782@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260515153312.DB3A6C32782@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/26 08:33, sashiko-bot@kernel.org wrote:
...
> 
>> diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
>> --- a/drivers/misc/amd-sbi/Kconfig
>> +++ b/drivers/misc/amd-sbi/Kconfig
>> @@ -23,13 +23,13 @@ config AMD_SBRMI_HWMON
>>   
>>   config AMD_SBTSI
>>   	tristate "AMD side band TSI support"
>> -	depends on I2C
>> +	depends on I3C_OR_I2C
> 
> Is this a valid Kconfig symbol? It looks like it will evaluate as a single
> config symbol named CONFIG_I3C_OR_I2C instead of a logical OR. Could this
> cause the driver to be silently unbuildable? Perhaps it should be written
> as depends on I3C || I2C?
> 

We'll need to teach Sashiko about this. I submitted a pull request.

Guenter

