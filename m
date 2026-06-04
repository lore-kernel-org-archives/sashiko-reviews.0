Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590EA436370
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 12:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576834; cv=none; b=Hjlmp3OXGewBwqWalYo2UM90w3RNeM9vILXRgDsVItsVKGjxtnFYTmRhuhyFgvnugcToNwY7EWkWP56ycbuEDq71/reebxcp3m2VmHacmu+ne9V0mPkqE0MMhvy6RqkDSoTyUvtJXoDpkQSBN6Qvg+HTnt9tgy3ZCMKeMVfVZWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576834; c=relaxed/simple;
	bh=Ftd+YG3sEeWMP78XhG0ocT+UAv8kkpARDu1rkCQwGaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ajAZJBnnSIXLgMQQakErLcqxpj6gZ8NYbR3qLtbY5oFpxhhv7qrXIBJ2urjqH5Q9K1K/EmEgoQWvasmR8yVBkB4wFU0ulP7NNKUWqY85lCfNr9+GzksDix73o2RKcCe3VuRIZ1SkgssmzfENtnW4zp/Ti+kZbmRbWYZbrO0mITs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AvAdAaZ5; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AvAdAaZ5"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-befd83e0521so370870166b.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 05:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780576830; x=1781181630; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L7nepo+Dy1VgfNR5G5jDP69Ut+DDs0u8dlV5QSB+0g0=;
        b=AvAdAaZ5Cz45qRKdT/KCB/WR2DkoN+18T+gkThstcg03LQoHmjLI6zBIr+F3+Wsrvm
         DemdWGSRsj2eu/gEYF4ZmViIKc069z7Ihgj3ICrpkzOoFZQMb8jHhWzdlMMoSsO6q/Bf
         Hxbh8Hq5hyPXEOHL8GibKx76fY12rlWNKRy9A/sbs6opW8hn89auhq5gFkCA/Pz3+uCt
         kNYGMqCALpYY3DIxlewVBhClO8pi7hrinOMJZBHEb5wkb4ez4VXuYXDhd8jjCyRK7RmH
         mXNeFqUzsOFH3FUMo2TVTZlCDsOJSwa/347XPWTRYGPc2Q0nCvrdIJy8bhc+7+q0ame4
         EgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780576830; x=1781181630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L7nepo+Dy1VgfNR5G5jDP69Ut+DDs0u8dlV5QSB+0g0=;
        b=LZwy1YsO3rmzo8wF5lQhyiepKKW6u3TxGC1uFFwOk2PAYVFjszt5HIG82AHP3042I7
         2jqgWMzWiE/Dz13Z5g+xJICZS9dC6J1Q1wxyMb62nY/LGQuBO8VdJYGAt902TsU4O+GI
         7JMqWoLRhE4nDyeH2BIkz3MHKI/OrL6rGi3tZOoN9fXDi6Nc4vdAWVfOsO4ewaOa78ua
         o3mNkNO2xLTCca5oyHS37LGVRJnjacgNI0LYu62ItutGP/vN94vBibovL2MlX+aKkOGF
         5OH/voEZGFdA7zMNqvsHRM1Dk1Yz1MDCOC7pltmb+cE7Iy6iMZlV04Bk9+uGBVCBOpGU
         PxUA==
X-Gm-Message-State: AOJu0YyDw01S33nddvZ9kOKK45RY2OGhLKXxKzaTdCyESxhYR1E2CYDa
	ahDyHT6havj0UXuKfbqLJdxsH+8W51oqJXAnJgVEpFoJnTJOPF+pqlH3387VD3FhszXqC0CZ3jG
	4F+138ZQ=
X-Gm-Gg: Acq92OGV9wQzBU0Fn74EdN93WEnSiIVMj9ifZ/9MkvrQlxLfKkZI4PY0V9UgMm7ehi6
	5YnjFUeyfgYRQSN+86xuOsu6uBR9QuhgZAHhJBejIfFaiaqLh76kzwmysPZ9q2QhRQHdqEIW1Yo
	UTHpXUYcyq8yrm7qn9xnHw344QJDUSnDxXJuQus9VzqZ63uQOqrBSnDs/2kbL7sB+R/QbPdXWDv
	uXbs9CFQVQ9IWHDDVYb486ce7GPq2XTCU/iQF6y6zAAned+D1gCt+NkItLwkf5bj/8YB0Wo4VPm
	oftPr61BdiuseMnTTuk7TPRNO58euLLR7luVnVkBh4LDo1mAoTysDs7zTx4kZAMlATfvn9IwpMs
	rLRS9bbpaSNCCSMQXK/tBi7b9u+P50O2upLyWIL0Mc7MgSlnCEvw4PGxb0boXSwsYWMBGICVgPW
	OUWUbnzTosSmI8V/YV+Hq8fDVGv5oYXrmwNyb+KplM7DCibBSloA==
X-Received: by 2002:a17:907:8d8e:b0:bec:4799:3ee9 with SMTP id a640c23a62f3a-bf1d159d3f1mr177831566b.5.1780576830383;
        Thu, 04 Jun 2026 05:40:30 -0700 (PDT)
Received: from [192.168.1.3] ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c8d3f1sm304115066b.17.2026.06.04.05.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 05:40:29 -0700 (PDT)
Message-ID: <7e740cb7-f832-40da-8e37-9824dbf88e72@linaro.org>
Date: Thu, 4 Jun 2026 13:40:28 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/19] perf test: Add deterministic workload
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
References: <20260603-james-cs-context-tracking-fix-v3-5-c392945d9ed5@linaro.org>
 <20260603102459.1DA691F00893@smtp.kernel.org>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20260603102459.1DA691F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03/06/2026 11:24 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Signed integer overflow in 'dt_work' multiplications.
> --
> 
> commit 89c17c87c140a5545531995cc6d206a8c6fffd71
> Author: James Clark <james.clark@linaro.org>
> 
> perf test: Add deterministic workload
> 
> This commit adds a deterministic workload to the perf test suite for testing
> CPU trace decoding. It introduces a new test file that performs repeated
> multiplications on a global variable to ensure a predictable execution path.
> 
>> diff --git a/tools/perf/tests/workloads/deterministic.c b/tools/perf/tests/workloads/deterministic.c
>> new file mode 100644
>> index 0000000000000..3caea8564043c
>> --- /dev/null
>> +++ b/tools/perf/tests/workloads/deterministic.c
>> @@ -0,0 +1,39 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +#include <linux/compiler.h>
>> +#include "../tests.h"
>> +
>> +int dt_work = 1234;
> 
> [Severity: Medium]
> Will this signed integer overflow during the repeated multiplications?
> 
> Since dt_work is a 32-bit signed integer initialized to 1234 and is multiplied
> by 7 repeatedly across deterministic(), function1(), and function2(), the 8th
> multiplication operation attempts to evaluate to 7,113,764,434.
> 
> This exceeds the maximum signed 32-bit integer limit of 2,147,483,647 and
> triggers undefined behavior in C.
> 
> Could dt_work be declared as an unsigned int instead? If the perf tools are
> compiled with Undefined Behavior Sanitizer enabled, this signed integer
> overflow will cause the test workload to crash.
> 
> [ ... ]
> 

Will change to +=


