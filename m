Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48A4431A4C
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512528; cv=none; b=rRBU51yldDgnOcbBLO7TVZT+MIdRcyA9ls8EF/4OCCj/hJzDLNJNCmQjCIYko2dkj9RsJv5r4n7IrfsJyAPnqJDn3AgqiamSawRc1F2ep6hw3oT/pTYb/nakR4QE09NOxtqCXCr6bl1AOiC9c8C1z7fl3QROsqOfXiHX4YtoaEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512528; c=relaxed/simple;
	bh=LYlvOTib2FM4S0QhMRDhnJ6ost4UL+qbapvJXXj2/8g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=deKP76w84+GrkWTPh6Edn2UxF1M6k5yaWYhrz4KXaZzYfaF8fbAbPaPE5qsp8KdFX0aEIWcYWy5m6ti+vZyJ8BuqMPyEWwOzyi+fuL2l/xfssH6DdfICHtDnRyToIgaLpyfmEJ1IezXf2S0HHeggiBwfDrXCN9oFHuLQoOj0hcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=HReC0ah9; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="HReC0ah9"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so881686f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 08:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785512524; x=1786117324; darn=lists.linux.dev;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cJARTRpeUTDwH7ZSQm/DfErRwTHcsGyw7SKG2JJKGsw=;
        b=HReC0ah91mnS1p52Ee6ulMDvgfO7pSabx6YnAQrngEpGI5F6UjKk4q3tz2vh+tWteb
         Ja1zbp3TR8mYO8OSHKmiA4ezejqoqs+pcNvL5NL8jfU9sa+jEJCb2WvLkEHMAyAunJR3
         I/s9M2BxzvsY5EUeguL+d0Z4lCxETxctk18RkcAlR7NrRdEeEajqgiWzlnoZoAlyuVcr
         dzh6sij7Dc4XWFIf06IZiXD6Gy/Rbt1p38c5KTTdw7zHB2HIfxrhf0oRn98MXCA0hkXG
         kOtgws9flGBnd/8VTH1ra6m2o+Rvr60YfcTUy7UNskq+oWAyFk5nAX+cM1RU5M1E0zd9
         N0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512524; x=1786117324;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cJARTRpeUTDwH7ZSQm/DfErRwTHcsGyw7SKG2JJKGsw=;
        b=FK0ScGG7u9+9gzmOWUDi98qWPoYzRwOveaNQLnqwVjHpxKoVGkYXTGrKTJZdmMcsDx
         xBbW4oj3boIQKsVKvKvlvOouirBqrQcMSZqwhDQyKzqe6mbHQp+e0nDcfdfZb0LFZiyy
         WSNJOa7POJZMngDK0tcgiTAvkWYWid4k5T3Zkrnrud/+TvZJvYF4Pa27R/h4FqoDVYp+
         ozjTxhWd52sCf+37jZCgu8M2zTL4eBxA9d0oymO6sqV9cJCeMMPhZSWjI0Ml3RGC/JYP
         xqoDnE+4ErLTsRowULvwWug8bUPLws5uXJFLTaArzEjZhgNKESwuyUiSEkhKRSy3+Kl0
         yX6A==
X-Gm-Message-State: AOJu0Yy2hMUhg3glOpBgxDhe+CJ57jCoH6Op7Y3nlgABjNmF9yWhpJ2S
	mDwEYarGSB6zUOGIvHkyXMezGs2FTbOvEuWFGnszSrPgov2wkUFTyPjp6UWV2htAAnA=
X-Gm-Gg: AR+sD12DMlZnrK7FvVMj4rbzzNnXB1igBnqYJ7RyJX/ijInA9gG86koKQDZdGi6zPNc
	WWul1cTVBHm+dYOWz8WmcRHJXiQTTaknF7J/LsEQ0hYYX/PM49YhmU2pSluPW0FxY/syxYB+0Sc
	lJUnWJCnCI/2sr85Sf1L+SNQR8ZGHR+QaaKY8uujrGhq5f1ACdLLluaZDnCnPS/yyL5odlP6Inh
	SlaS1UJ54pVquwN4AW5i8D8vYmitVqat+dz3qnzD0ZxLa5/MTiIeklm5lBjr2GAux2ZYDMuN8zd
	lPCEJsx1AkWWVE/FeYaYWv4P/U8kvZJwk8x6Ecyb9FgiSuda6oX6Q1uKniQutGSnxdjES7dfT0G
	tfNVJSwy5GYDn7lGRcqJQF4u2TVSMj5YfVZ+Yoa+djF1d2Si9Ew01yuuKux+QJucV0gVVjAgXSS
	MpBOUsYcA6Yg/3ZrHAjFIfC/51DbQ1AGXrDptMq/5OQZ1Bi4GZEpvRRKBylQ==
X-Received: by 2002:adf:e309:0:b0:47f:7c4d:c9a7 with SMTP id ffacd0b85a97d-47fd72f1f7emr138197f8f.47.1785512524233;
        Fri, 31 Jul 2026 08:42:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd456262bsm5488966f8f.17.2026.07.31.08.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:42:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org
Subject: Re: [PATCH v6 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
In-Reply-To: <20260731145338.4479A1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 31 Jul 2026 14:53:37
	+0000")
References: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
	<20260731-axp318-regulator-v6-3-b4e745552a35@baylibre.com>
	<20260731145338.4479A1F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 31 Jul 2026 17:42:02 +0200
Message-ID: <1jh5lfxj1x.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 31 juil. 2026 at 14:53, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The compatible string `x-powers,axp318w` is omitted from the
> conditional block that makes the `interrupts` property optional.
> --
>
> --- Patch [3]: [PATCH v6 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W ---
> commit 0a2fd6c8b0d8fd1a45bf4a464bf3e71df8fa62f6
> Author: Andre Przywara <andre.przywara@arm.com>
>
> dt-bindings: mfd: x-powers,axp152: Document AXP318W
>
> This commit documents the AXP318W PMIC in the x-powers,axp152 bindings.
> It adds the new compatible string to the lists of PMICs that lack PWM
> frequency properties, and adds new input supply properties.
>
>> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> index 45f015d63df16..38556c32417b3 100644
>> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> @@ -83,6 +83,7 @@ allOf:
>
> [Severity: Medium]
> Was the x-powers,axp318w compatible string intentionally omitted from the
> interrupt requirement conditional block earlier in this file?
>
> Looking at the block just above this hunk:
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
> Since x-powers,axp318w is missing from this exclusion list, the interrupts
> property will be strictly enforced during schema validation. Does
> this match the expected configuration for this PMIC?

In the case of the cubie a7a it is wired to the NMI controller but NO,
it is not strictly required. A platform may not wire the IRQ and it
would be fine

>
>>            contains:
>>              enum:
>>                - x-powers,axp313a
>> +              - x-powers,axp318w
>>                - x-powers,axp323
>>                - x-powers,axp15060
>>                - x-powers,axp717

-- 
Jerome
