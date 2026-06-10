Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F6B409134
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097739; cv=none; b=VZwKikYcikLDsssy6cYrXeWCFOGXu1i6LvJBFozS4oztiq2e8mVWpE3s/HkRAx/DjBYwy1TNKaK2EpKy+WEVHQc0lS+lDAyA9VyweQDx37DbBZtyz6jE3OGQWaq/WjmsmE1x80QzzADqjOiNFqGxalev5G3poVMcUfnc7TurH7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097739; c=relaxed/simple;
	bh=pJOegzbxXHxCQFaBtNelmTjWNZJJ08xVtrXxVwSa2ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PwHqcrbxgemXdlHmRXZUQMNSZp4gx8QLtr2H1vtVZUgSc8ol56zbdLrffKJarwZMiZ7yVHmES6NvbY8+FK2GgjYqId+Wtv/tjUZxoZheHZkwpdSXSSMyo3lQrUFvZbNDIi8MR7OPfyrgFgX1sW0QBk62dMW0vBSOWFnsMxfdaO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5wrCimn; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5wrCimn"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2bf125989f2so50049925ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 06:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781097738; x=1781702538; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Vakc+qhS6W2a+oJ9YI9y/ml+NiTipsztKUXDMw/wA5c=;
        b=e5wrCimn9WzmCHfaSiphJqtIdp3oqBVMF54vWHIva74EUPFIBF1+UU7/ByXBcvLlgO
         cJiPy3v6GrtszESgaaB6jcqWb8me/q0b9fMjHMmgTJnrNH9NOFieqW0GuGdChyIR8Vk0
         FBmwikHpyuq2tTHmgCVMIclStQVu6+njMRT9MuH6a2+iZjYAMXcV3mlcY+JNlHP8Jqja
         McP0mTNbYJTGkOkqE9YVq8KTg0flPxTsUgUuIDjxo+WDJpenx48ANl0GGjLMm9zWtyJY
         j+CP09fC0oulGX40IRU1HyOWRgK90/9ZZWl/hKZpitaUQoJcnS9MipR7enshbMlzIqCt
         lx4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097738; x=1781702538;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vakc+qhS6W2a+oJ9YI9y/ml+NiTipsztKUXDMw/wA5c=;
        b=RAiZJnWz0g+JitMu2pu54l6XAWd2+93wTitXjhvJvXj+LlFKdINQBuN3Ji40Qzy86n
         D1EBhobcHPAVXNyTbJB5ZFPMvOtTPZAGqeIiqF5VRR6Ck6Q5RNGfoof5gWR9Od5s1Ek6
         aUKsob37J/lnqadEVpgh+HOHP6Dp8yyi48reWQHsNewGFCyC++qalrhjK12wwXFve/qf
         BNW0U9CCgdNQL25S4BJQK/4+ln+LrKSQ7heA+Tj+ru3CBSbq5573KckeX3ZulnCeCaJB
         E95HyOFYBd50K5Rvd+lRrD7hfU8Tm4us080ilFmNtambe6BPoVf5fuG8YwPWrEK0t6nz
         4uzA==
X-Forwarded-Encrypted: i=1; AFNElJ+KNC7zls/kJtWuNvM3TscnShd+59dR2TpoVpBVk28lfO/p+jw1K6uNRtmjNbWj0IycRuavSGHU4xmp/YAiUCg=@lists.linux.dev
X-Gm-Message-State: AOJu0YysVIX5cjhLurUR9aD9JuaZQ8WbJN4vzdZNlw1ZJpP/zz5yp2Ex
	MWa74ujRCyUwZ9GPerv5LUd7F8NPBpgG+8S+9f+VJm59ORJPSAw3H/JZQ2dubCQn
X-Gm-Gg: Acq92OF/GSFS5nVZdSpTCxT8I346EzyYFgOsq7xqW4kd8wOLTmwSDGDeKzZXS0H7YWl
	g9RH21S5oIEIliecPS8tgch/8QvWAM46pnZWM95BtJMGWmgibZnq6klk0szEZcFCHHgNsKnOLgX
	nytdrFntg0yeC5ktvhHCLdAmgmtxMaYVzCwuTy1ukPC53M1V412EIcwKYzky1RObZMByKF3pwRw
	+9JyOgIiwN9VJLeu7hCbU9rk0fMnjcOcbPtpu327GFlMa/TpJrYugvhmMS28KodtSV0PkZliMES
	eBnLUryPMybV31wovHgHXiUfPePw68j6Lm6TtIOZ2glXZjAVLcgvq6CnP532Q1F00o1T784S4tx
	tsz5VLroWWautbQ+WMCS0Z9cV2ho9+IcR9GVa9ym8YC6WDfdsW7Kw4PpVa7it/cpRRnVQUZOA2d
	axRzDynvfAJOwrLnkq9AyQbUBhv9/HGlj+DQ3whJwTk7C7/+YzOVKbAqQq6fmFfltHZmmBvC9T1
	aC2pkq7CY4=
X-Received: by 2002:a17:902:cf11:b0:2c1:ea95:8297 with SMTP id d9443c01a7336-2c1ea958447mr301104505ad.7.1781097737680;
        Wed, 10 Jun 2026 06:22:17 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e636sm248435625ad.51.2026.06.10.06.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:22:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e5d0760a-6107-4b9d-8d36-5b321e67077c@roeck-us.net>
Date: Wed, 10 Jun 2026 06:22:16 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: ina2xx: support ina232
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260610-monza-ina232-v1-2-925b0d12771b@oss.qualcomm.com>
 <20260610084357.C62271F00893@smtp.kernel.org>
 <CAFEp6-3C0-g7P1m_0xNJj+uEqKJKKuoGk+LspzJgHxh8PKnfFQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAFEp6-3C0-g7P1m_0xNJj+uEqKJKKuoGk+LspzJgHxh8PKnfFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/26 02:26, Loic Poulain wrote:
> On Wed, Jun 10, 2026 at 10:44 AM <sashiko-bot@kernel.org> wrote:
...
>> New issues:
>> - [Medium] The INA232 configuration implicitly omits `.has_update_interval = true`, silently disabling sysfs update interval configuration.
>>
...
>>
>> [Severity: Medium]
>> Does this configuration intentionally omit the update interval?
>>
>> Because has_update_interval is not explicitly set, it defaults to false.
>> This hides the hwmon_chip_update_interval sysfs attribute, preventing
>> adjustments to the averaging time despite the INA232 sharing the INA226
>> register layout.
> 
> These are pre-existing issues related to out-of-scope voltage and
> power values. They will not be addressed in this series.
> 

INA232 does support configuring the update interval. The missing
" `.has_update_interval = true`" is not a pre-existing issue.

Guenter

