Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3311A4266A4
	for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 15:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782745557; cv=none; b=XL05FeOUDskrJ+8o6i/8IxedL9yYnHROl4x2d4OaE0bPmC6O+R2MrgD9dVw50xouQNUOSmIjp5CXjUNJwUGOy4QkQVXiFHSDXvTHu1YHw9s57svholVLGUn0bVwucrbykZWpdH4iYpYfXMtbMh1xmTwSYuMfBc3eDstGkwUdunk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782745557; c=relaxed/simple;
	bh=NIbfOpAFlLlvaPWeifBrHOW03ZGaSqQUgrtJhDxVpjk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CBD768CNTPkeZS/YobXxRrM5FQg4afjhmUzV9xVnuOPNWP3Oxd42HpX/qe+oN/CRwUEsk5sFSphT/7vgxnKLZJf5sJntlHEUNp4qSa+m8k9MhZX+2qV3qxHeCaTYBkLWrtc8BfiIJ49xg1FNnYE56DDBNBHCihaJd70en2+T/Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=K47dHuDr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="K47dHuDr"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49395888c7bso28152265e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 29 Jun 2026 08:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782745554; x=1783350354; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAzrVW08LVfxI+Bn9EkRfmN0dtsivlXeptpZjuWvIi0=;
        b=K47dHuDr8YnSleXWvX37HvOUQ27v9DtkJu3Ch/RPmncgT/rJEW/TU3pUD72FmQvFre
         YFmYUBasj5OHE4TBory5H/yBEM6bnsft8/jcX/F/29pF5Ok2mmPA3AwW3py3qwvSDmmE
         J9fbac6+5rKaNOYHP8locFqRFlkLJcyNEvbPa/pG0owAAVya0HGObCdl/OfW0fZymi5F
         6Cd03WNxJ4mcMa/RVzreudwLDcPMWSZIM7xETXpMVB5zVXZPQjrNFe2RLr4+RydFLlG3
         25g/ayRGF70HTVDqaCWY4Us7aQdyEnAsz7ChLHwRm1war8w4HOVCjfRV4YY4xK53uzdz
         hbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782745554; x=1783350354;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DAzrVW08LVfxI+Bn9EkRfmN0dtsivlXeptpZjuWvIi0=;
        b=B7AVvYo2xI7tLHvMOdO55x98fwy7EZQLf75ZbmFb+c3KQGS54/gRHlZx/t+SI7Zt1k
         2S6mP67kSTjGmJdxe/2u/wIcQmNQtqmGNuqac6oEDo/6p7PTp5sm4iHT5IPmlALJmbrx
         93vacZIVV1ygN+YhReb1kmXQjMzcYnnhug9oWPw9/uSTaN0KezF6LQSmRDd/Z3IlDsd8
         +rJAVb2LZer+atNii8qVFAbH873UpLXOEhWQgai5COTFbFmFO7632rq8fip6G2j8q5Se
         BQx3MaaEmD2V1TJk3UM2T11UJR0/s2xsZJAajv54z+W9BvsOl51rI++3EVY040Vk9VCw
         vU8Q==
X-Gm-Message-State: AOJu0YxosVgiju1X1jhL+dYllwOQ3lwfEULUYoD+/RxQ6MpQMfHQ9v+Q
	uaN6g9ukapgK+RuXWSXMhEolC0VzwsMwIzzlg7KC4cuW1bIs77XYcpaPtcI53s5geus=
X-Gm-Gg: AfdE7ckA3l+w6kKQUvOIcOpBrE5RRhK5LvgZ88nTFKhkuELTqLRSrMANaLGw9lk76Zm
	1y8IxxASC/oWcCdRzIf6AWe/Y6P0UQj0NmhRidI1QmPURrXCO9AA1BR/+1ReGgl4gkS/osjkTS+
	l/DMtzziptI6U/7IUnF4ZHeRZwb8UYxU3mdU8l0/ppvvHCVX5BjAs7DU9Sagi0NJSvefy9u0WMS
	PZhxFJ6kpsJdN8asmYjtNRJpwTg7SNn8CFnkYH7yG5a279yBysbPFXSBBdPmonphOrvZAd01Vhz
	icPptpQMEDg4XpwI0RjByxevbQCAwr/lATsYe0Pzp8haIBuh/jGv5hjSYPGhCfTpwGZBFgXUQKD
	95lfFAKRCnouWitg4S/pQ0czsbYx9iH1i+nDklM9cGtXpbYned6R1iiLJeuOcL+i14W6goa1eot
	XnoSFvfEFv7Xw=
X-Received: by 2002:a05:600c:45c3:b0:493:9b02:484c with SMTP id 5b1f17b1804b1-493b82b9e7amr734905e9.29.1782745554300;
        Mon, 29 Jun 2026 08:05:54 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4932f100e4asm220013365e9.1.2026.06.29.08.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:05:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  linux-sunxi@lists.linux.dev,
  robh@kernel.org,  devicetree@vger.kernel.org,  conor+dt@kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: rtc: sun6i: add sun60i-a733 support
In-Reply-To: <20260629125305.0DF981F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 29 Jun 2026 12:53:04
	+0000")
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
	<20260629-a733-rtc-v2-1-7b72112784f8@baylibre.com>
	<20260629125305.0DF981F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 29 Jun 2026 17:05:51 +0200
Message-ID: <1jpl198jzk.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On lun. 29 juin 2026 at 12:53, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The `clock-output-names` property has a global `maxItems: 3`
> constraint and a description limiting it to three clocks, which contradicts
> the new clock outputs (IDs up to 11) added for the sun60i-a733-rtc.
> --
>
> commit a1565b632e372c724867216463a453c9d1600ad2
> Author: Jerome Brunet <jbrunet@baylibre.com>
>
> dt-bindings: rtc: sun6i: add sun60i-a733 support
>     
> Adds a new rtc compatible for the sun60i-a733 SoC and new IDs for the
> peripheral oscillator clock gates of this SoC.
>
>> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> index 9df5cdb6f63f2..197a6f67b180a 100644
>> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
>> @@ -33,6 +33,7 @@ properties:
>>            - enum:
>>                - allwinner,sun20i-d1-rtc
>>                - allwinner,sun55i-a523-rtc
>> +              - allwinner,sun60i-a733-rtc
>>            - const: allwinner,sun50i-r329-rtc
>
> [ ... ]
>
>> diff --git a/include/dt-bindings/clock/sun6i-rtc.h b/include/dt-bindings/clock/sun6i-rtc.h
>> index 3bd3aa3d57ce1..5132a393ca4b6 100644
>> --- a/include/dt-bindings/clock/sun6i-rtc.h
>> +++ b/include/dt-bindings/clock/sun6i-rtc.h
>> @@ -6,5 +6,9 @@
>>  #define CLK_OSC32K		0
>>  #define CLK_OSC32K_FANOUT	1
>>  #define CLK_IOSC		2
>> +#define CLK_HOSC_UFS		8
>> +#define CLK_HOSC_HDMI		9
>> +#define CLK_HOSC_SERDES0	10
>> +#define CLK_HOSC_SERDES1	11
>
> [Severity: Low]
> Will adding clock IDs up to 11 conflict with the existing clock-output-names
> constraint in allwinner,sun6i-a31-rtc.yaml?
>
> The clock-output-names property currently has a global maxItems constraint
> alongside its description:
>
>   clock-output-names:
>     minItems: 1
>     maxItems: 3
>     description:
>       The RTC provides up to three clocks
>
> If a device tree author attempts to define an array of clock-output-names
> to document all outputs for the allwinner,sun60i-a733-rtc node, won't it fail
> dt_binding_check validation because it exceeds the maximum allowed items?

Not quite sure what to do with that one.

The h616 compatible devices all exposed more than 3 clock through the
provider, even if the higher IDs did not have define.

The clock output names for the h616 compatible device are not really
supposed to be defined through DT ... at least AFAIU ??

-- 
Jerome
