Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43B1280318
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784302598; cv=none; b=t5vLkUPHD4HuzzG4u0rLmxAh/E7OklH98CSPIsJqXLVM/ahar8mpOA6O8zyPWMekTt7v0ppzTbpGoKFcHO3WCUdRMl4bpa7xuTQe7iaR5cuDh8A9g2Du5MpPslsJID750S2ep4VcTFgEJbftU6FxeMZd1dPHTncCoDT4Bz/WT9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784302598; c=relaxed/simple;
	bh=OGy2pfcAN2GFKcbV/yorUJwArQd8TXfzZZ1JyYVIzRI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WGtCB6Jt/fdcrwoKUWVx5sVu4CDfx2bBSFCm1OzZrjo2w1HtRyk3Dmzmg1iI6q6rfSiQh0xIhNlDqvi7zvT+M+s1TX0lY8a2nQJiHnd6MzoclEL+i1I+IaeXLiXxC1bLaHnlAVRK5IroKdfwtZSEAV1JcQbFneV/3xY1Qw1vidY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mHGwXsZd; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mHGwXsZd"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f59f25ec4so632261f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 08:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784302594; x=1784907394; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Y4rP4sEq2yVBaw8AT4wD3lMJ7BMNwwChWjDwvDDGnM=;
        b=mHGwXsZdaRuplg5feExYGU41qYHiynjOwAQvv4wsN/PaZabktSek8ezaFqnAoKnJyl
         u0otkuIvdMQAfrkP+ghGypRK5W6sFP4MQJ1fF12t93g8eBgY0lj896rejneQMUB8ofL9
         La7+wZmyOkRsnWym/9ZNSVc/J3ZqJW8+FlNlisjTe+tH+71a1HbIStIY5MNA5sLkQ1mq
         6ITWPaDgoJwE2BjyOtf1FUOAvTdCZ2C6j+Ya81D3cNAIQGBqIUEQNOLXYrrXDhAbPiar
         +EV/BtyJil8sBRKOODuE3K/bWaNGXWedWdrJ8tvRyV8ziIsUh2xCd8TzeH2Lg0DxOuuY
         em0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784302594; x=1784907394;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6Y4rP4sEq2yVBaw8AT4wD3lMJ7BMNwwChWjDwvDDGnM=;
        b=PxoRxzWOYoJLsLVau6f+9Ift/w7ouBd5dRsNj+rAjZvEubarkHKglU9tC4pzFse/UR
         9FYZZufqnz/x1gI/7ZMZHrxvwbuUQqq5XD74B74wT0AvLri3EwMwSdNVXAIOmQ7nQ7J3
         ivsBEinShbKQV5sU+1o7QoKiu8AqmEbav0PoC58QlVkbA43GgNSCuIv+FHRS4902+NWN
         cgAHq3Q8gUJ4RSkXqrbLlpHRgUioKqWeEYzEYWqO+8yo0idM1qcGxXLmmn9ZxflMK/wH
         /7pw9GidfQFUpgmx5Ha2QKGjeiVlgciPTYkbtUENt1EqbuEn3bBuaBkghACDi5I1qgzI
         uxoA==
X-Gm-Message-State: AOJu0Yyt9muBjDM1QTsIG/ttS/BWZJ0aUWM+zkp3EHvQ2m54/S7RooVi
	svtDRLm96mQiKaQdxxZCTMA2CmvYiRAgBLVu0W1E5hgKlnbbIn95Qs0pXq42zgfpl1I=
X-Gm-Gg: AfdE7cmfC3qUZZYE2DL4D5EEHgEjS+nXgtEWKZbAm2HSQtpBDtVOO7PH06vsXhqbSBq
	LS6KR47ko6Y7RjUPo8UjKkLW/rec5DVQ3jLyyv8STgA8Ek3s3+XEvGsLdWwzL3IcTeqdLIUieZN
	apPSG2dRrAZj2rwMo4cWus4F9PC8FZZ8bzYkD+MZCpMSZCFcka8/Z7+8LjULrZ4temcRdJTTyQ0
	83AGq5LcTcSon67aTJLWXGwPw56yezyPhgK/ejnhl5NVF7O+VDs0q/fDnf5pyaKe3pEnPEGcFrf
	9LIE5OjRIvh6i55jk6GYkMxaeBTh6qx/ZJxOJpeN/fXA4A9UYaTJu0nBTVj3mpeMiDjreQkUwnN
	1mX/km30zWz9MgAFFTUa0Th520fTRRrqD1QDXvxLcARrL/uQDUrnRFGF6IRqzj/Tipb/pGOH/63
	lu
X-Received: by 2002:a5d:64ee:0:b0:47f:5a97:2a62 with SMTP id ffacd0b85a97d-47f622feb52mr4412603f8f.26.1784302594123;
        Fri, 17 Jul 2026 08:36:34 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f63e65644sm4276043f8f.16.2026.07.17.08.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:36:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  robh@kernel.org,  conor+dt@kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
In-Reply-To: <20260717144316.7D7371F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 17 Jul 2026 14:43:16
	+0000")
References: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
	<20260717-axp318-regulator-v4-1-50aff97084dd@baylibre.com>
	<20260717144316.7D7371F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 17 Jul 2026 17:36:32 +0200
Message-ID: <1jzezpeigv.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 17 juil. 2026 at 14:43, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The `x-powers,axp318w` compatible string was omitted from the conditional block that exempts similar PMIC generations from strictly requiring the `interrupts` property.
> - [Medium] The regex pattern for regulator nodes allows non-existent switched output nodes (`swout3` through `swout9`) to silently pass validation.
> --
>
> --- Patch [1]: [PATCH v4 1/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W ---
> commit 08577b06937ca6f13b4a7f204e7f0abb6042c44d
> Author: Andre Przywara <andre.przywara@arm.com>
>
> dt-bindings: mfd: x-powers,axp152: Document AXP318W
>
> The X-Powers AXP318W is a PMIC used on some newer Allwinner devices.
> This patch adds the new compatible string, updates the PWM frequency 
> property list, adds input supply properties, and updates the pattern
> for matching switched outputs.
>
>> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> index 45f015d63df16..95b3984fe0f96 100644
>> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> @@ -83,6 +83,7 @@ allOf:
>>            contains:
>>              enum:
>>                - x-powers,axp313a
>> +              - x-powers,axp318w
>>                - x-powers,axp323
>
> [Severity: Medium]
> Should x-powers,axp318w also be added to the earlier conditional block that
> exempts PMICs from requiring the interrupts property?
>
> There is another allOf block in this binding that forces interrupts to be 
> required for all devices except a few specific generations:
>
>   - if:
>       not:
>         properties:
>           compatible:
>             contains:
>               enum:
>                 - x-powers,axp15060
>                 - x-powers,axp305
>                 - x-powers,axp313a
>                 - x-powers,axp323
>     then:
>       required:
>         - interrupts
>
> Since the AXP318W shares constraints with siblings like axp313a and axp323,
> will omitting it from that exemption block cause valid device trees without 
> an interrupts property to erroneously fail validation?

No, irq should not be omitted

>
> [ ... ]
>
>> @@ -277,7 +303,7 @@ properties:
>>            Defines the work frequency of DC-DC in kHz.
>>  
>>      patternProperties:
>> -      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
>> +      "^(([a-f])?ldo[0-9]|dcdc[0-9a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-9]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
>
> [Severity: Medium]
> Could the swout[1-9] pattern allow invalid switched output nodes to silently 
> pass validation?
>
> The commit message notes that the PMIC features exactly two switched outputs,
> swout1 and swout2. Allowing swout[1-9] might let device trees with invalid
> nodes or typos like swout3 pass schema validation incorrectly. Would a tighter
> pattern like swout[1-2] be more appropriate here?

It is like that since v1 and has been acked.
It has been loose since forever so if it is an issue, it is defenitely
nothing introduced by this change. Making it strict would require a
different (crazy) regex for each chip.

-- 
Jerome
