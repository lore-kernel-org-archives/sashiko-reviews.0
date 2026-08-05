Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CCA3955D0
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785943728; cv=none; b=jKv7XdiL0168AwiEs9sJ3E583TvyvdxPBM8DoiXixFPFVERXG7ieEkk/Vk7XNC6ZezqmapTQeuBOSvfyQhv8lNWExERV4ZgXu5XClyBt9e/vRnZBhPARINnoQvaK9YFpsTJNH/dqmOmz792kmiiacCHEJFSzq1+WG6MZGy1OCL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785943728; c=relaxed/simple;
	bh=oH2c8xWhA5Y/hqX4HJqULRl3t01Uj0jNPXPaDNXdyuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rjUYmoIK3yFUL4zEqSjj90nSvhrjqaqWVjRXnRG4AZRMGIJgutYz7QQWp5eCwuPw38PnwKDXYS7SOCVonX5PxRRsIKsDNi6R7LowG/hO4DeA25HoTu6u9G4qrAnj8giQJWAzAp0RHNlkviqJsIL5SK+AW4G0PJom5Cbbj3iX/a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPM4ltvf; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPM4ltvf"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3900e39d935so1093119a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 08:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785943718; x=1786548518; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euAjj5v9spvVbU87SbKkRLVKZRVH/7mzRMaCk1Nylks=;
        b=UPM4ltvf2rg1jg7OaaAha6fF/1NKSkhP2iygb0ab4/BS7HOJ5s8PXJaO87qIrGa2Bn
         QWHQR0s7moXRlW0AwapHviL9rzONhAJbwE2/q0brSjC9iJJzWKxzmLlzNAdux7EKfB2x
         9/z/PQO33QIMGle8v0S2AcIU8ucUts1UFu8/DWrWdCqLQjQQ1YRgoc/Rh8eKFrJ61T5m
         hJ5uTJmFVZd36RgQOd9nv9jfblLhQsjF6NTiphWassklcJRKu8lC0849dt2P+KGux4l1
         risRGWNEnSpUkqpZawcaHg1DUQz82q7H4MhezF+wQm7SoDN6kRwySIfxW6nFEhAVVUaj
         E56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785943718; x=1786548518;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=euAjj5v9spvVbU87SbKkRLVKZRVH/7mzRMaCk1Nylks=;
        b=jOojwclGDSybS+nOZCl8U4p18mYI75B3LBGf4NMopFFmThWH/vEbE6HaAmwtVDJ4El
         ZQXhEG9dGr/U/1qYndEv4fs8WJfHEJDzTFREnhow8kvY3E6XbjUxJaG2UkFVh3zxA8fl
         l4QBOjF1X6k+1MGapeFo2+aP8lSJ+nWKzKz0qHC/e81Tg4vgnv5/FqEY4SsFjErm9IGL
         A6HRJFpQMrE/i0hB+MjZEjcP8vY6mASQsC8SSI7fb7NMq+OJNP4YjMzfX2CzWi0gfzW+
         4TWCSs4Ke5GLP0xjRSfUoTB4kTnPuD9XlCefW+29WOoI5CjlwWZiCnsMJPyk6jvh8BkS
         9I7w==
X-Gm-Message-State: AOJu0YwsgZZdrw8gc1hCOknF5s8BVWRO+5Cc6l2T29GPG5zka9tqXrF4
	Bm7TTDe7JR8+NRADa7CV/0g5Q1K6lnC3KzIv4kaMuxWxTguGEjLwsad5YG/Nhw==
X-Gm-Gg: AR+sD10FqoHKCktzZQstcgeBVbSIyev1kGvi6Bn7Vrifq3mfUXrrKvstHICThQ7NoaX
	Y+zCg5SV9d+6Ns7Ve65KneFNEAHnlswmZH59gsyQZZylnLMZCF9sJJNXqR0SZ+GuUsgSbnH3hns
	7+QZ8A3dhxTZYp8BPfhuwQOFzU5FZ63WHzGLdD84V8bjOiwQIlntIJnPU6GoPDJZ3ZWmMvwkMmw
	XJRG+0es5LNbgZbt87S4lK5N8bum388LvfCeVFfNB9FZK1Xdh/2bNnYQAUfD/xcQfTG0vcIcn78
	DqGM6sljgWjL+BDTAdJmwREC8yqCSoa7n9UfqoQuOXc2QKviozaKjDEWHvChGY2qCjBSosDVQNi
	WRKjifG/n4NGxHZnvJmuiLHce/O0Z5bjOY31piNl7RKBnafa8NTJKxLk+MU/6/qCDL1g2yVqkz3
	2CW8iXts0XgyCpJW60GkcH3JIzaAiXPwvzGQoAhdWW2NJ+0v4PRE9UI/TAIr0z6lWITvvtJwewh
	i4LLMgGtqK82Ckg1lqBmLvORKx8rx6ssMqxbg==
X-Received: by 2002:a17:90b:274d:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-3903c534d46mr9263643a91.4.1785943717871;
        Wed, 05 Aug 2026 08:28:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3903f5ab7a4sm2000388a91.2.2026.08.05.08.28.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Aug 2026 08:28:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <23453025-34e6-4e8e-804a-7e0a36a32abd@roeck-us.net>
Date: Wed, 5 Aug 2026 08:28:36 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
To: sashiko-reviews@lists.linux.dev, Stoyan Bogdanov <sbogdanov@baylibre.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260805090400.2059006-1-sbogdanov@baylibre.com>
 <20260805090400.2059006-4-sbogdanov@baylibre.com>
 <20260805092026.A43961F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260805092026.A43961F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/5/26 02:20, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> 
> New issues:
> - [High] Incorrect scaling, missing boundary clamping, and unsigned wrap-around for TPS1689 PMBUS_VIN_OV_FAULT_LIMIT cause severely corrupted limits and bitfield overflows.
> - [High] The shared 8-bit warning limit write paths treat PMBus direct values as unsigned, breaking all warning limits for TPS1689.
> - [Medium] Missing scale adaptation for PSC_CURRENT_OUT in tps25990_probe leads to output current readings being off by a factor of 1000.
> - [Low] The intermediate expression in the read path for PMBUS_VIN_OV_FAULT_LIMIT unconditionally underflows in unsigned arithmetic, violating subsystem guidelines.
> 

Please address these issues.

Thanks,
Guenter

