Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FF03CEBB8
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 08:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362015; cv=none; b=cfEYgsUSNbP902sofEqlguD0L3kV7mlIqyyifIWYMrklhf7gw/gi4LzRk26RC1GvlRXLoHlq8cDZe4s/Z/t6pXRKAYOm7VYHtgb82QDuG5cyweV9m1vv15TII5MPB+M+KYZudD38WhF/A1FOfn38nC/9wEwJCZH8XNwGGej60cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362015; c=relaxed/simple;
	bh=nAWvF0NRtn6Rb1Gw9Fb5LrsP6FPPefqqvmqVqbv1Jcc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AuKbs8SDIO+gBR5KhUNvjvGAgCCQNaLR3NkxQiSrR9h9NHE9Jy5q2DC8tLVLObeZSsrh6wWbfQcBVAMjI4qlial8u2TDIR6E1BT3rKK72Ph0EuTwV8cqfuDHwZHQPfwP5Ofs1iQDrPM++u/LGY4zdhXnYQAtSfPZahFaJPG0mHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lCGuMMgY; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lCGuMMgY"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48870973bddso951424f8f.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 07 Oct 2026 01:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362009; x=1791966809; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxcGgnejISp1+VB6bpLIgoBBJ18yCkjKzQQ5g+qkFis=;
        b=lCGuMMgYFS0zB0dTsj4sj+UGYBj/MMyrSv6e/Yd4J828fiA3R6k8yp2UWsDAQRZ47j
         izaZwt4m5LsZAfpgpty19ujUtejOb0TPFrlPDztm3UaN5AoF1vYuDYIcZL04uDuJoT5h
         9sihnZ58SgbyeDwLduhZQ1FoUyOgRvyUhSacEbWzNLjBzTrEAxiBjRH2xObZPTUnhmYH
         qkn2HYu6GZ9APL/f/f+EnJCgx34wbnUbjxHIJ6bF3c0UDOHPkP3nW/ANgAPsQ6qFVHEu
         pLJwTLAnSP0z0uuebaCzAaQBxO/1K2cdR8teVF8DEA+0JpaxBZ9Y7KxXXctM1C+7LNa7
         MwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362009; x=1791966809;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxcGgnejISp1+VB6bpLIgoBBJ18yCkjKzQQ5g+qkFis=;
        b=g1hBXM7eG3B5O9swyP9EHlMGNebizwenV3tEDQgh4VFcXX5qHPQvAnT6Xs4uaUfMlO
         iR0VQ0erOrQPNOZ8o1RZI5+Bd+QWvKOXZ9QQfTSPrM66MpJFrgmaurNhtk1sOVbA/os8
         ZGHfEr8/IHs/kg29DLDojiXFfJ8oXQ+apqc/8JUjZ3bKlvSj/dyWmVL1WLuwPIcmHeFu
         QlpjvsQWKV8qTy39s7MWTzmsNfpweoUl3YByofFmuYfhS7E2dsEKAtZnMQRRkvHJdysc
         72C8zItUTKkl643NuP/kIKaohOnqVT5x5Zp9ppj6ffcR4Frbubhp492LhuouH2Ispewo
         S9qw==
X-Gm-Message-State: AFq9FYI3ZMcj4cGatAVw98F1geuQa79DYtLrx3qltylAxd/O0nSK9aSH
	kObHdDuvdwR6Vc2Tis9LGIt9HLxBEPiRqFiLlKlYe6SzGgc8rwgbydN2yWmA38dAGKjOmqnW97Z
	9FrGe44s=
X-Gm-Gg: AYBFou3tSr43iWwcvEjaJtWA3bc4Ag+gkMQubwblmrUMD/QlC2k4UFjEJ4KIfTX1aWB
	3veKEiGblvbiomwf+45eGFy0iFWK5v3q9BRvltonE/9jglhdMxdxWy4K9awftKEnR60S/K/KPTQ
	B2DHKrHBjzcvUDLpvm3hO7KQ89gvs8PTGeERUsjxpY5EngFxno/OWKvltF9I3XBsIPbIRtedq1F
	X11XKn9xVOszK6fuKGd5gNRUS09ITu1nPjViG9OVJxt9gEiv3yBKazYJrfm7HoR+LLxNAp0rz3B
	xgA9aLKWRSzQ1hIuZzdCbKJ+wz94FIJn3ADb3G7D/28TbIfmy8d0N+7uncDvNiX754/7yhzaRh1
	8cMLLQlzLltjMCS/MX+MpFwcebexIUDz98AFWzfMmE8oKrd2LrfgKfnpBDoBhyU4nnQKoVtcfh8
	5qq7pMN8wgy/VXBj5Nl626KNauFPgM0xvRGPIbvYqn2irYxeRXSpiXaoBRIn7NdXN11yx14TnOF
	aPkt5GDWgFsbnY=
X-Received: by 2002:a05:6000:3cd:b0:48c:69b3:6114 with SMTP id ffacd0b85a97d-48c69b362fdmr9482875f8f.3.1791362009297;
        Wed, 07 Oct 2026 01:33:29 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4290158f8f.52.2026.10.07.01.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:33:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-reviews@lists.linux.dev, Valerio Setti <vsetti@baylibre.com>
Cc: robh@kernel.org, neil.armstrong@linaro.org,
 linux-amlogic@lists.infradead.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v4 4/7] ASoC: meson: add AUDIN driver
In-Reply-To: <20261001162313.4333D1F000FF@smtp.kernel.org>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-4-2476646118b5@baylibre.com>
 <20261001162313.4333D1F000FF@smtp.kernel.org>
Date: Wed, 07 Oct 2026 10:33:27 +0200
Message-ID: <1jbj95zz8o.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu 01 Oct 2026 at 16:23, sashiko-bot@kernel.org wrote:


>> diff --git a/sound/soc/meson/audin.c b/sound/soc/meson/audin.c
>> new file mode 100644
>> index 0000000000000..808e7d4fd31a2
>> --- /dev/null
>> +++ b/sound/soc/meson/audin.c
> [ ... ]
>> +static const struct regmap_config audin_regmap_cfg =3D {
>> +	.reg_bits	=3D 32,
>> +	.val_bits	=3D 32,
>> +	.reg_stride	=3D 4,
>> +	.max_register	=3D 0x148,
>> +};
>
> [Severity: Medium]
> Will hardware state like the channel mask and endianness be lost across
> system suspend and resume cycles?

It is a good question but I'd consider this a pre-existing issue, if it
is one.

Amlogic audio drivers have seen very little testing, if any, when it
comes to suspend/resume, because the suspend support from the platforms
them self was very limited too. I have no idea if the situation has
improved lately but the subject is definitely not limited to this driver.

IOW, the issue might exist (or not) but I do not think it should be a
blocking point ATM.

>
> ALSA calls the driver's prepare() callback to recover a suspended stream,
> but not hw_params(). Because this regmap lacks a cache configuration, it
> cannot automatically restore the register state configured during hw_para=
ms()
> when the system resumes.
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001-audin-v4=
-0-2476646118b5@baylibre.com?part=3D4
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

--=20
Jerome
