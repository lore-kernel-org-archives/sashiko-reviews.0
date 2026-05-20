Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E903B4EA2
	for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 22:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779314499; cv=none; b=mf0/hqU2RsP5zN9PuEnEWzjkBRvDe7Yo2+tZM6Bc/W5MxQQK8yYySFnFAdqZxi6ixddJ/G/EwSz+SjZXH0dc6haEwp6GHajbMVQ2Uwc1vMXJTzpYdSf+m83oKRX9cQeKXVHPIWpDuLEbfAmsXnNtihX5CnTz+6q/1YQnJF4scCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779314499; c=relaxed/simple;
	bh=RzpB14xk/2UzIGRN+1SLXmzPCeS1XLfL9h4CLr+vXao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S6/agDykWNA93gyHL8KOZxq/Kk9UGp2ffhDuR4AsNaUQ1xHY/w/zFfmsnr+NIsH/PSv3qs3Q+FjL16peZt38AcT9DU828AQH+XoxHHvdgmROm8ldXP8Aee3bM0r096Bv1r6bTs4h6BJzVvpRK4SZrMrjhCoc7WNN5iigvwtAdqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+QF90vF; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+QF90vF"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48e82c23840so43970085e9.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 20 May 2026 15:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779314494; x=1779919294; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=29/pt5xtdIfWUNP2HMoH7lMK3K2QTJTzmuk9CehWO9A=;
        b=A+QF90vFOe8gjmYMvOkC4iTkoUf3tZtgLIkU3/vHmBWmLbxa27HxyBgNhZobhvq5Qa
         5Wvs3oBxJMBvB4dvuuzeuabegILZbX9QoRDSO5x73J3E24WTGU+P1cXGxS8U0YvM4AJj
         cy2SxR+Kdpb6iHhSHQigRf9iPt+zyNfaUtoFBawFJEZd592K7/XNr2IXNZbO5eVazqQ5
         EYt1xCoGMxhWKMT+q00fig05OcmdE7SRSF5B+fgiAgZBz7NJJzYZgXSVWTGlvNo37sVW
         G+Je6tjrfjzt5TY+Tezzw/sDaT5yuFIyVTzVAgDCXJuJN8dOo2xuywhi6E2koWUTkCFb
         Xv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779314494; x=1779919294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=29/pt5xtdIfWUNP2HMoH7lMK3K2QTJTzmuk9CehWO9A=;
        b=TqNGVXuH3JNDPmTD2/pF833yNm8+wQq1f78Lbr+li0aC3nlrq0gBudNYDbFo9IxApU
         sQAwA/Yinl9cK0Q4r5dyvbPvxgyS5B0KvC1qO0+DVPak7nFRp+tZSYylNPWRMbtT4CYp
         2a1F3DNqYvvDojBuysHnJOfYXjFVTHQRYtto6aPcrWBr4Htl8jKSzmlLJSjZjvlr40QF
         +XYNlbiqYI4tY3rFA1S8Jo09MFNZhYFSOZbE+ol8L9A1AkjYhJ92OiIQxeEk99yfPqHx
         KR9XssY7pf31mnd3qdVxP8p4eioRGHDoZG09ZQSQ++Ts/aGGnD9ZstxfaVpBq2j0hOvA
         giiA==
X-Gm-Message-State: AOJu0Yx6bhe6nAelTeP3wIFTNSLU7EKWw8lTuBELjsvyyyBbqduldRL4
	+FCETQ0HwK6D9gSqOlKue7uq+lcwFbXqhB6V+begMQ3JB/+WPQ5Z9g5fRklk4OY=
X-Gm-Gg: Acq92OERwIUIBBnTuln7ZgMZzdL+LDnIaWcS7+x0Le+EItv5qyi6emXMB2ybAn/1ONY
	I1uvpI/YgUIDM1DZ7mBhkKByn63ENQLC7ZL1ZV1p0WD1KhBAdJaXzIT+qOKVOziM85ht7MWt1ag
	50wK4H4L7318oE8ERrj2Xd67jtfzOgzzheUtvsx8PmH12H2WzKBVOn2++9MRqgY7bjWn1EpunMG
	xr7HXNqMa6TnukC3M6KxTKwDInax2qn1gWuapO6imPtJU4tZKHalNkc3KzKdAU4bSSCt1XQU67o
	Jg5gBSxHNHtEvjAW43lss0WKr47DxFr3wq8YgYl+II8u4sXiqqUkuiMX1sNi9KA2cXpok9FIUVo
	7nIq0BiUy/Dhwq05lHB+fbSVzBYH6ZruOka5TPN0FmiEE0pfFLttLWNJRvWhXGcducuKfAHYs2M
	7TBHpqOp1qWO6FlnQ8MbYWK2e7+itbT/kdrmyHYrxEQFRD/TCoP37gky1bL45QuuiJubSpj1ASF
	U8211lc/aHrN7vCViouPbSMPQmVk9M5H7BeLY8BDmzxJ59StSf9khHBhIfHBDI6+zscIA==
X-Received: by 2002:a05:600c:4688:b0:48e:8345:6f8f with SMTP id 5b1f17b1804b1-490360a8789mr2218195e9.18.1779314492259;
        Wed, 20 May 2026 15:01:32 -0700 (PDT)
Received: from ?IPV6:2a01:cb08:52d:7400:bbd7:ca83:de4a:f625? (2a01cb08052d7400bbd7ca83de4af625.ipv6.abo.wanadoo.fr. [2a01:cb08:52d:7400:bbd7:ca83:de4a:f625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035c22bd1sm1823845e9.2.2026.05.20.15.01.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 15:01:32 -0700 (PDT)
Message-ID: <ec232a52-795b-4f32-bcb4-2b6e5f8fc928@gmail.com>
Date: Thu, 21 May 2026 00:01:31 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/11] arm64: dts: qcom: sc8280xp-arcata: Enable backlight
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-2-9df52552bf87@gmail.com>
 <20260520165709.E485C1F00893@smtp.kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>
In-Reply-To: <20260520165709.E485C1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/20/26 18:57, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The eDP backlight regulator (`vreg_edp_bl`) is mapped to the wrong PMIC for its enable GPIO, directly contradicting the hardware findings documented in the commit message.
> --
> 
> commit 5bb21a2e354ddc1fbe2cb4a72c610f631fc3961f
> Author: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> arm64: dts: qcom: sc8280xp-arcata: Enable backlight
> 
> This commit adds backlight nodes and enables the backlight so that it can be
> controlled with the buttons on Surface Pro Type Cover keyboards. The nodes
> are similar to the ThinkPad X13s but use a different enable GPIO for the
> vreg_edp_bl node.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
>> index f2b4470d4407f..14287092fb07e 100644
>> --- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
> [ ... ]
>> @@ -127,6 +137,22 @@ pmic_glink_con1_sbu: endpoint {
>>   		};
>>   	};
>>   
>> +	vreg_edp_bl: regulator-edp-bl {
>> +		compatible = "regulator-fixed";
>> +
>> +		regulator-name = "VREG_EDP_BL";
>> +		regulator-min-microvolt = <3600000>;
>> +		regulator-max-microvolt = <3600000>;
>> +
>> +		gpio = <&pmc8280c_gpios 6 GPIO_ACTIVE_HIGH>;
> 
> [Severity: High]
> Does this map to the correct PMIC for the enable GPIO?
> 
> The commit message explicitly states that the hardware match for the backlight
> enable GPIO was found at platform/c440000.spmi:pmic@3:gpio@8800 (which is
> gpio6).
> 
> According to sc8280xp-pmics.dtsi, pmic@3 corresponds to the pmc8280_2 PMIC and
> its pmc8280_2_gpios controller.
> 
> However, the patch configures the regulator and pinctrl to use pmc8280c_gpios,
> which is physically mapped to pmic@2.
> 
> Will this result in toggling the wrong physical pin on pmic@2 instead of
> enabling the eDP backlight?
> 
>> +		enable-active-high;
>> +
>> +		pinctrl-0 = <&edp_bl_reg_en>;
>> +		pinctrl-names = "default";
>> +
>> +		regulator-boot-on;
>> +	};
> 

I was skeptical at first but upon review I've tried the following patch:


diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts 
b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index f938e68c69ea..82e0a01276a8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -198,7 +198,7 @@ vreg_edp_bl: regulator-edp-bl {
                 regulator-min-microvolt = <3600000>;
                 regulator-max-microvolt = <3600000>;

-               gpio = <&pmc8280c_gpios 6 GPIO_ACTIVE_HIGH>;
+               gpio = <&pmc8280_2_gpios 6 GPIO_ACTIVE_HIGH>;
                 enable-active-high;

                 pinctrl-0 = <&edp_bl_reg_en>;
@@ -1050,6 +1050,11 @@ vol_up_n: vol-up-n-state {
  };

  &pmc8280_2_gpios {
+       edp_bl_reg_en: edp-bl-reg-en-state {
+               pins = "gpio6";
+               function = "normal";
+       };
+
         wwan_sw_en: wwan-sw-en-state {
                 pins = "gpio1";
                 function = "normal";
@@ -1061,11 +1066,6 @@ edp_bl_pwm: edp-bl-pwm-state {
                 pins = "gpio8";
                 function = "func1";
         };
-
-       edp_bl_reg_en: edp-bl-reg-en-state {
-               pins = "gpio6";
-               function = "normal";
-       };
  };

  &pmr735a_gpios {



and ... backlight still works! It can also be enabled/disabled with:
    /sys/class/backlight/backlight/bl_power
as expected.

I have no clue why both gpio6 on pmc8280_2 and gpio6 on pmc8280c can 
enable and disable the backlight. Is it a common scenario, Johan?

Anyway, if I follow my own investigation fully based on the X13s 
reference and the properties of its backlight enable GPIO, I should 
switch to pmc8280_2 to use the better match.

I will update this patch in v2.

Jérôme
