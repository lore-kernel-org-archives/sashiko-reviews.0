Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F49F403AF7
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 13:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781096920; cv=none; b=pLS0PA6VtF5vOLZPj/YHzpqJss3B/h+bHPBREwZWRUddFudg/ahSscvlrC2lrKScBQuf7Czb2g4MUN+lHyoR7Ut5rBgzj1JYU75fM27SSpWCmfNKqPitNL3H/AYXM6Yk/tWH3oRVNF+7yOXHc3ZpwowbjacFti25g3T6Cmu4HPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781096920; c=relaxed/simple;
	bh=EEOinw6CGZW45SAkE1xhJG+ynpqqAjNakg6bnKB2A/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gUnCIUehgT72ddspUMGpjOrbDQCg75ioGdmvmvw/cGKlaGFBods46S2FYFZcRQFx5Z80k9453j0Jr66+YQ6oerpX+cGf76kj6tz9sWXaHghhRJG04oZ8LcgsRWd4loF2oWCUqq7GLL8NJmskGCFh4t2HmAfilcPPZSO6Y9xeX9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTagpkcw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTagpkcw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso64890455ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 06:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781096918; x=1781701718; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JqJZ+prysRbXkAdz3gPAp6FWqtuUCNOsHZgjBYdDszw=;
        b=pTagpkcwtMba56Bkc/kevDwzbwoPmsv7pXqF+m5PO4EsagvNM8W6qzQxcztdTgaXfG
         bDaIut1esvnIzPcv0Ld+QtqMtA+CfgUM+HvHOv2ln8kHWSOAEoQJQp0x87gglwF/rXSy
         hDrTeorkgMNI5o8PV5tVzpqN60rKeSIS0jC7U2p9zdjAYaOUpKVVWZcIgrswKQu7geXP
         HpAx5K0bqwUXtco3jrGtbox+M34uqi3EqCvTxMtrGwc9gmQteLMnV14PYlIXJVXAMMhq
         xw7J5NyJmSkqpPeIqbBzKjx060fJlpK/na8NwhsGN/vJRbFYxsFP6kuz6iAg08eMbXJR
         kvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781096918; x=1781701718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqJZ+prysRbXkAdz3gPAp6FWqtuUCNOsHZgjBYdDszw=;
        b=h1UlAtOmk0AjLOZnZ46FEE2HSupHY0bdpTwpwf9Ci4eg899Sn57FFq1o9D1mzbrzol
         pfKfYaeuseCNCn1Z1R64hi9Ps9LI1DbRcZ9OBqus7T/YmrQ+vMW9F6Wzwfa1F62bEY6s
         Zvaqpjad5BJuzuGtjSfz2cTrZ7Usw7jOb2IWpqFLOmoQLS5SYfw557eIHLbecF7I38DN
         z+ndTBXaoJ/3+eYg7xCrpvOXZrEwPI00/jTfSDkmh3D63kH4IqiO90Rj+d6LR9tCPnh5
         WaqteWxV3tUDkPN6RdT7egBBdjtfdKi4S3s0x8JhDrq7E5lTYJ6VO/14BREb0ZEUSEYu
         iG3Q==
X-Gm-Message-State: AOJu0Ywtgf8i1ZOgWj8Ndg2n5aW1saqWIOEOke1jPrupZDqi6d2xN8oL
	x+7I29P8Yk186AtX2rGJMb5EicCbJ0PprZDMAs7nuUhSr/H0iEsqwQ9K
X-Gm-Gg: Acq92OGte4Yukg5lt/IYeOoapKn8lsxhb7qDvWu9BgqSq9nx6gwQGk7w9X8H4THjGuZ
	SynKo7JAoiMjvLDAJj1BnvbUssT/rvgLzFwJjD7upSlX3VRc5R2zr8j7QMFwb8TBk0nolvixO2S
	lXlFBos8ajZYiVoCdGmMZeTCv0nBzxaPQFvYhtpWxoRMGutrRvMaRLGwdTx5ozi0ac1ss7jIx8n
	YvnqsngD6rk71eP2Q1L+RpIPivvgf7/m9gn97wRnW9B8h7N9pRxtA3PhE+r0lQXrLx+E1/GjEbn
	BfAjJQl7bZHCq4lPnyaw8nadA+NVbPAZJ6TFZEybpW7s+SRwWuIYQyQitB4Fd8cmoCcin1kLOzH
	BuGUfjlWuGxawCgBhm9EvM/ylBs4MW1zopN4Ie9lXIRGHTDyM11WCO0XPkxw/UIWmuDpdKDQGNW
	twOxhfq9mnbAzpxYUWZIMuusk9gWgTljP3DaAF5lZER7sgl0peapWJUPR+9u1Vup6Dzrriuz1LM
	Bgno5BOoCU=
X-Received: by 2002:a17:903:2348:b0:2c2:33a4:aaa2 with SMTP id d9443c01a7336-2c233a4adcemr215193425ad.35.1781096918304;
        Wed, 10 Jun 2026 06:08:38 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8bc5asm258608485ad.27.2026.06.10.06.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:08:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bd3085f3-3797-4bca-8520-bed0d67684e0@roeck-us.net>
Date: Wed, 10 Jun 2026 06:08:36 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] hwmon: (cros_ec) Allow modification of fan curves
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
References: <20260529-cros_ec-hwmon-fan-curve-v1-5-da6792b3830f@weissschuh.net>
 <20260529213842.354A51F00893@smtp.kernel.org>
 <20159ced-3959-47da-9245-8d562d656f43@t-8ch.de>
 <81dc547c-7c62-4e34-aa90-5a48ebe46b9b@roeck-us.net>
 <263a9a98-c427-4d3a-8971-b42a27dab976@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <263a9a98-c427-4d3a-8971-b42a27dab976@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/26 05:02, Thomas Weißschuh wrote:

> 
> Given that patch 1 of this series introduces a compiler warning,
> could you drop the whole series and I'll resend it after -rc1?
> (I'll have to doublecheck why I didn't notice the warning before)
> 

I already dropped it.

Guenter

