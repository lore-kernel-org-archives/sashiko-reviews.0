Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFAB3148D8
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 07:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781854464; cv=none; b=qdCRqezrcQWBPOK/MFgugeQomGZcvxEepsqI8H+VCu0JDgJO5ucaxKBzj93dqkzQs4/RtiUqAwOejHqUstXAaa+EK9ISefEanNzsdv/tjxSM3QxZnabx+qjOJnuLJLEHFpeXSIqv/ZNbo5tY9rur+9mwstatsVTOSVHD0nMtyiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781854464; c=relaxed/simple;
	bh=oo2NwlXdoGMZAGZzoEFlNNPoHpWW5TOnQNct4wkenfA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CxVjrFn03yWwspUMkDeAiLh22SpCRExahrzaAqaTMBlTZtm6tz/3gGfzMxzEo8R7TBz9Cpv8sfjoVc7ToHxbiBr38/vS3UAcVaRqyTD2Zc1vbCdRvGPynsb+weXpGcP+BRijVqp71y7o8SZwwJ3Rg5tpdLtv4iqsQf1AnSyEKGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Pu71C2gc; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Pu71C2gc"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-462342ac290so2043865f8f.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 00:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781854461; x=1782459261; darn=lists.linux.dev;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C6ROwWS+BraRmUYYx28pn3bvnZE1QcDyqCuuK0v9v/Y=;
        b=Pu71C2gcAMiKWEaEeY2UiJ2qL6YZZWsg5MAgzpLwyaMwlnrhxs2NPzpEJ4uDkUdcge
         Zo9sGRUw7W9I3NPi+aes7lHEhuQJX6T4v8+7kRV/Ddm0jHHlPwEgRAdhwZEwSRHdWT5o
         ltxy2+UjhUo592Bak7QzPOe9pEILy5AhuMOWFwLPbmK2arCXWm92qPjXev3TPilLlppb
         Tc8dosaUqF3b2YjX/+3CsSx4UO48QQnXzNXzFgOFEW/o9VpDh5mZyAq96hb7uy6MjqH8
         LqdCmn/fWpPMmaqXFih+EDLeG0ZtBQelMeJUr13OlXwg32fcDtbRr68DVAPXdRJkujJB
         nOQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854461; x=1782459261;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C6ROwWS+BraRmUYYx28pn3bvnZE1QcDyqCuuK0v9v/Y=;
        b=HGXapE7i7+ZTH0mU/60I6+aVOpOObHZ1EtPaArqH+gknP0rsttFIxtOQM8Unx/ibJI
         FEvXHD6/ztqvXSqlo1sjWDi3Q9sQfjOBKEv/V2VJjtRn/An6UsOTGcyLC54vuLMjly9v
         F187ylC6d160J6D2EitaGk/TnqGOBStTGAY0m4EMjetQ5uqB0R8E8qTo63hswoi5JJja
         3gwH9SqQXhYpjx0vybfSPJD9GMedUQWWL9FI8Nio48JW8n4JDzzfYqnBRWpVXFJ32O7t
         UtVdmWsr5h+jnHXxmnN+8MYEUmMfjgJL5L4sONytJBISEnxsB+TSZH5lifrO3/i9xxuP
         GBBA==
X-Forwarded-Encrypted: i=1; AFNElJ8yTdQ/l8LF45wrrTs8a12CfeEMiv8OFQbPtGaAZOu5/WJ9XWlvAQ7v5GO710c3a0SYvBIi7QvGE4kxiE4gDCI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+L90fCTg0WCR9JWGnQWDvaC+vq2AKL6n6Pj59mpN8YbMRUGig
	tj8+4zDBtLznRGiQoMno8x70dT+cmFhiewtg7CS75oey0nt907E+3K4hBmJfhEac4HI=
X-Gm-Gg: AfdE7ckC21fhkGBcPm7bkLYF1PVAsrvjzRK8cb+1wIiGo8s89EIS1Pr12IV2+iKk2dX
	6xxlH9QeOzDNTcKIVn9KfMtFPw9rB9nU/oMMAwl6FMgywjS6yikCGlwKEd2U4m8yscDg3jb+oxK
	sEwxznmjSHsJhjfPLN/PNJRaUJsj2Sv7LZCnqhPu3gwaVaWUSLUjvxvTurP75w76olX61TkdR/Z
	SMgRoHQm8FK97FKdnIKP2O8z4kRiijQFQXRCWHjCNUamLUohTBQW1X8VGZtBCAQjfX+woWloDl1
	qcCnPRkBkL8xnLOnKSm4xe8IVfFsvbL/Vq3Qax5NFZsTiIv7JgTiZr/jYcBWt6FaIq4ls9/9kpd
	KxQBWdwjWeDGpCJ/OK7IMTKXVIkdvytyhrUeIAmFHxZN2S3DakbOB6Q9Txogto3zj2m2GA22eij
	H6qF4o3pN/LuFKHChXAZnYDA==
X-Received: by 2002:a05:600c:8b73:b0:490:c682:e37d with SMTP id 5b1f17b1804b1-4924258f728mr21532045e9.32.1781854461201;
        Fri, 19 Jun 2026 00:34:21 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49240084928sm47909745e9.15.2026.06.19.00.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 00:34:20 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>,
  sashiko-reviews@lists.linux.dev,  linux-amlogic@lists.infradead.org,
  neil.armstrong@linaro.org,  robh@kernel.org,  devicetree@vger.kernel.org,
  conor+dt@kernel.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <20260618100341.0A42F1F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Thu, 18 Jun 2026 10:03:40
	+0000")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
	<20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
	<20260618100341.0A42F1F00A3A@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 09:34:18 +0200
Message-ID: <1j33yjc7b9.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 18 juin 2026 at 10:03, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] The AO PWM clocks are registered without an `ao_` or `a9_ao_`
> prefix, which will cause global namespace collisions with the main clock
> controller.
> - [Low] Typographical error in the clock name string literal for the RTC
> dualdiv input gate: `ao_rtc_duandiv_in` instead of `ao_rtc_dualdiv_in`.
> - [Low] Missing `#include <linux/module.h>` for `MODULE_*` macros.
> --
>
> commit ef5998ff087b6faed09d9eed4f59078d2b2f0a60
> Author: Jian Hu <jian.hu@amlogic.com>
>
> clk: amlogic: Add A9 AO clock controller driver
>     
> Add the Always-on clock controller driver for the Amlogic A9 SoC family.
>
>> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
>> new file mode 100644
>> index 0000000000000..88aa8cf3f5d00
>> --- /dev/null
>> +++ b/drivers/clk/meson/a9-aoclk.c
>> @@ -0,0 +1,488 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>
> [Severity: Low]
> Should this file explicitly include <linux/module.h>?
>
> The file relies on several module macros at the end (such as MODULE_DESCRIPTION,
> MODULE_AUTHOR, and MODULE_LICENSE). Although it currently compiles successfully
> due to transitive includes from <linux/platform_device.h>, standard kernel
> practice is to include the header explicitly.

Yes please fix this

>
> [ ... ]
>
>> +static const struct clk_parent_data a9_ao_pwm_parents[] = {
>> +	{ .hw = &a9_ao_xtal.hw },
>> +	{ .fw_name = "fdiv5", },
>> +	{ .fw_name = "fdiv4", },
>> +	{ .fw_name = "fdiv3", }
>> +};
>> +
>> +static A9_COMP_SEL(pwm_a, AO_PWM_CLK_A_CTRL, 9, 0x7, a9_ao_pwm_parents);
>
> [Severity: Medium]
> Will this cause a clock name collision with the main clock controller?
>
> Because the A9_COMP_SEL macro uses the #_name stringification operator inside
> MESON_COMP_SEL, this will generate the clock name as exactly "pwm_a_sel"
> (and similarly "pwm_a_div" and "pwm_a" for the others), without any "ao_" or
> "a9_ao_" prefix.

I think AI got it wrong and missed the prefix addition. Unless I missed
something my self, I think you are fine here

>
> If the main clock controller conventionally registers a "pwm_a" clock, failing
> to prefix the Always-On clocks will lead to global namespace collisions in the
> Common Clock Framework and debugfs.
>
>> +static A9_COMP_DIV(pwm_a, AO_PWM_CLK_A_CTRL, 0, 8);
>> +static A9_COMP_GATE(pwm_a, AO_PWM_CLK_A_CTRL, 8);
>> +
>> +static A9_COMP_SEL(pwm_b, AO_PWM_CLK_B_CTRL, 9, 0x7, a9_ao_pwm_parents);
>
> [ ... ]
>
>> +static struct clk_regmap a9_ao_rtc_dualdiv_in = {
>> +	.data = &(struct clk_regmap_gate_data){
>> +		.offset = AO_RTC_BY_OSCIN_CTRL0,
>> +		.bit_idx = 31,
>> +	},
>> +	.hw.init = &(struct clk_init_data) {
>> +		.name = "ao_rtc_duandiv_in",
>
> [Severity: Low]
> This isn't a bug, but there's a typo in the clock name literal. Should
> "ao_rtc_duandiv_in" be "ao_rtc_dualdiv_in"?

Yes

>
>> +		.ops = &clk_regmap_gate_ops,
>> +		.parent_hws = (const struct clk_hw *[]) {
>> +			&a9_ao_xtal.hw
>> +		},

-- 
Jerome
