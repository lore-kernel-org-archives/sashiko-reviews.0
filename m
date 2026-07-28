Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34E447D45A
	for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 21:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785274211; cv=none; b=XqNAhhHWP2lNbLIPTZB5v+Vcj0NWCxe582ykcxmLhrHcKrpp+xD6y6cXA5e2HyxZ302i1srhzRHY6wV6UvH04oy3SPeG67/VcJLJcY6CBLzJpjeMFrWSxCDpE0WzLVJRBF/nCvM+bT1PUJ4dIMSLetWAR0GNA1QcIcURn0QtMD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785274211; c=relaxed/simple;
	bh=flxSn8FESRA6yR/pkFS3yn3W7beGhz3kdAfMImKpK9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a5m8cfA2Z3KKR18dJonCzxsUIOK/7E2elnlTa9unf/5QpHPappeqkCL21JMI+yrNY+FkB6KeGIGfo/k0BH+nnrWd5G0n/OZo7kzMjo0d9Jjre9BZqGWctGe7TYBgtNGiZbj/tzg/1QxtTRWZwGFN/4HiP0OJYGBn25z25Gqav4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KDPYCVxh; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KDPYCVxh"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-497d3e4460aso1351719b6e.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 28 Jul 2026 14:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785274205; x=1785879005; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfIIhN61OmpJAg95pfveNaV+liLi2NycTn3RfRjueFs=;
        b=KDPYCVxhR7lMdJi36MuWJu5FLtDl1/Mcz+WoL81gpPTpoNUhH2YUXG/GUZvmKSiROX
         aodTKJLhkeJHkJsz07jPnMxCR1+E9eoEgm1os5vT4zZ77amg7AgWBPod7i9Q2DFeGuH5
         FbokPgf3AyygjgA59SDr/di7ff+OPwayq0py+lVc5zRUrMIUguub2NGtYk5hBOiO8898
         M4D5d5/S7/WIkEfmjvwGBP0W7n0EhoSvJ214bQDMEcYMRYWvBkaJt/b8kO8VPYOt04z/
         xELKkQqhx75nyXd5G8kXEyUEQZ5v7WTDEFSlIa9SG9+rd5UHxBN+efgohb3rEuaZhPnx
         wX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785274205; x=1785879005;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfIIhN61OmpJAg95pfveNaV+liLi2NycTn3RfRjueFs=;
        b=nmBbZ3Cr4I0RBEsinenMphyDyuyXO+O6RhHdl4hvwllQ7Z/vIKGvpcRmkz7M2xT+b7
         JZMRn6KMk6lO+4ZZDQQBVb3HT5iIoclpfUAu5INPpDBFeA81LskRqVgcFtuAYizIxef8
         fjEsv+NhQdlCtcyKovFfonDG0z29Qzr+7a2Ss71htLVQdN+ciovTjz0Y27log7CmRADx
         HN7VCqe81ICvbNyimoI4aRjD/HA+mYuUsTuib/5SVWsQMILpKuoTdgGUKCqbTUjORPE0
         qzHH5zGDfq9O0d44LEpWBhSkVkb2Nn+Q5H/2RmEIuRt/891D4xcZRXdYnVoLaCBgaOZ7
         /P8Q==
X-Gm-Message-State: AOJu0YwBBbG1dLnOpZZw09fojiahfFpGRenwQiy9zsS7JZfzI1Jm2ONQ
	409fDyGaAAp0svw9IIs7XjNx8AghZvKsubqmzyNjKmlH+8M6/N+vSXdOuemPj/k/OrUcKy0cOWP
	S4kZG
X-Gm-Gg: AR+sD12usSMfUH2KN+7vvgCmh19wy037+W8aUPfbxNmRiN6h9Yvx5cLvjxYDBiMRP8s
	mTaiBxl9nHO5qyLSkLCqHjH2lfk6uke5ccGzNxdB7TwXcywkx8UwxNWqsc8DqwNsAlckXhBu54T
	xp+NrP+ZZAgX4apbM6lne/nBHp0h0aqnx11MvobkVTtvswAldviidGH5Mybe8YA8s2Iy4ESP1Ze
	NERaARMRTBSgUH3Yn696B0V03r42bTFW8r/iUA8VQacxXAX1/apyWV0E3IvN2Hvapc7TdCtHUUL
	G5nX2FWRVrUPi2TnaMJkDgWheko3UBrYEy7SKJjd49PVikrm4hhn8hGyC+o0B1XgyaaX1g6NAU1
	VTQ8SOlkj+fUfViU2Qczq0RlxcEqk29pS8Mpb3UTGWdsOz6QO70/50L5FPF+AKZL/aexJsAFlHy
	UcNoiMomFsAkbqsfL8tQcvlHB05+fI14zhbEBBF56Og30G6ZbZ6bFRK4rSy8YAMYioUJ2VQ6E64
	qSYXqv9gqTX/Qy+YuZiMfdV2SNgVVxUQOP/MR9oWnhmHXXP/g==
X-Received: by 2002:a05:6808:e82:b0:4a4:c95a:38d1 with SMTP id 5614622812f47-4ad5b794abdmr2108852b6e.4.1785274205564;
        Tue, 28 Jul 2026 14:30:05 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:3096:ee5f:6f57:afe1? ([2600:8803:e7e4:500:3096:ee5f:6f57:afe1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ed2bc54sm235967b6e.5.2026.07.28.14.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 14:30:04 -0700 (PDT)
Message-ID: <df107a87-b63d-4818-82bb-3488f4d461f3@baylibre.com>
Date: Tue, 28 Jul 2026 16:30:03 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ranges
To: sashiko-reviews@lists.linux.dev, Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Robert Nelson <robertcnelson@gmail.com>
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
 <20260728-arm-dts-beagleyai-gpio-info-v1-1-783ec90d54da@baylibre.com>
 <20260728195706.3D5C41F00A3A@smtp.kernel.org>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260728195706.3D5C41F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Tony,

Mostly a question for you since you are the pinctrl-single dt-bindings
maintainer.


On 7/28/26 2:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Adding `pinctrl-single,gpio-range` on K3 platforms causes dynamic GPIO requests to silently overwrite the entire pad configuration register, destroying previously applied board-specific settings like pull-ups and drive strengths.
> --
> 
> --- Patch [1]: [PATCH 1/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ranges ---
> commit c5d1a1cd5d0bb91d0c680ae90328952c44500103
> Author: David Lechner (TI) <dlechner@baylibre.com>
> 
> arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ranges
> 
> Add pinctrl-single,gpio-range properties to the BeagleY-AI .dts so that
> GPIOs get the correct pin mux when requested.
> 
>> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
>> index 5255e04b9ac76..599d576f694f6 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
>> @@ -149,6 +149,19 @@ led-1 {
>>  };
>>  
>>  &main_pmx0 {
>> +	pinctrl-single,gpio-range =
>> +		<&main_pmx0_range 0 32 PIN_GPIO_RANGE_IOPAD>,
>> +		<&main_pmx0_range 33 38 PIN_GPIO_RANGE_IOPAD>,
> 
> [Severity: High]
> Does adding pinctrl-single,gpio-range here cause dynamic GPIO requests to
> silently overwrite the entire pad configuration register?
> 
> On K3 platforms, the pinctrl-single,function-mask is typically <0xffffffff>,

Is pinctrl-single,function-mask supposed to just contain the mask for the
mux bits (function) rather than all config bits?

The DT binding description is vague:

	Mask of the allowed register bits

Does it mean all bits in the register even not related to function or all
bits related only to function?

Looking at the code, it seems like it should just be the mux bits (function)
since pinctrl-single,function-mask is stored in pcs->fmask and pcs->fmask is
only used by pcs_set_mux() and pcs_request_gpio().


> meaning the pad electrical properties and mux mode share the same register.
> When a GPIO in these ranges is requested via gpiod_get(), the gpiolib path
> calls the pinctrl driver's pcs_request_gpio().
> 
> Since the function mask is 0xffffffff, pcs_request_gpio() will execute:
> 
>     data &= ~pcs->fmask;
>     data |= frange->gpiofunc;
> 
> Could this completely erase any previously applied board-specific settings
> like pull-ups or drive strengths from a device's pinctrl-0 property, and
> replace them with PIN_GPIO_RANGE_IOPAD (which includes PULL_DISABLE)?
> 
> [ ... ]
> 
>> @@ -267,6 +280,15 @@ &main_uart0 {
>>  };
>>  
>>  &mcu_pmx0 {
>> +	pinctrl-single,gpio-range =
>> +		<&mcu_pmx_range 0 21 PIN_GPIO_RANGE_IOPAD>,
>> +		<&mcu_pmx_range 23 1 PIN_GPIO_RANGE_IOPAD>,
> 
> [Severity: High]
> Will this have the same pad configuration overwrite issue for the MCU domain
> GPIOs when requested?
> 

So in order for pinctrl-single,gpio-range to actually work correctly, we would
need to make this fix first.

---
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
index f130c7cb998d..cae21cf92ca7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
@@ -280,7 +280,7 @@ main_pmx0: pinctrl@f4000 {
 		reg = <0x00 0xf4000 0x00 0x2b0>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
-		pinctrl-single,function-mask = <0xffffffff>;
+		pinctrl-single,function-mask = <0xf>;
 		bootph-all;
 	};
 
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
index 5288c959f3c1..1aa73526bba4 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
@@ -11,7 +11,7 @@ mcu_pmx0: pinctrl@4084000 {
 		reg = <0x00 0x04084000 0x00 0x88>;
 		#pinctrl-cells = <1>;
 		pinctrl-single,register-width = <32>;
-		pinctrl-single,function-mask = <0xffffffff>;
+		pinctrl-single,function-mask = <0xf>;
 		bootph-all;
 	};
---

And then we would want this change as well...

---
diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index 4491898d8294..29e401f16bc9 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -112,7 +112,7 @@
 #define PIN_WKUP_EN			(WKUP_ENABLE | WKUP_ON_EDGE)
 
 /* Default mux configuration for gpio-ranges to use with pinctrl */
-#define PIN_GPIO_RANGE_IOPAD	(PIN_INPUT | 7)
+#define PIN_GPIO_RANGE_IOPAD	(7)
 
 #define AM62AX_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
 #define AM62AX_MCU_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
---
