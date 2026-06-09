Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4240B3C10BF
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 20:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037544; cv=none; b=Rk6PpMrV+zTIwWQY2ZTzbPipDJACvjVR5UBfmFx2trt9X8dQfnP/l8FZfhn+eFOSbuyK27cRHwr1gnY/uMj+y6ZJ/u2gVUsa5P39e2mCpEb7TsIZ5FjlPhdER9JQFUcjhH5ZBtEfr85CoGWvaLaCgDKWrDBYBKfN6uk8TiEcwL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037544; c=relaxed/simple;
	bh=08cDWJ1AoJw7XTjy3VUEvgAlD0lie4xSJmxfcTku0Bo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MM3PBfcCiEFNdriLY+9m6Sfk2nwxO3HT9MGA6RvlyX+g61E6HNPFQmahX8glJt/UHgxgM4WuT71gVyL/BHFxG5uXY7B8qsphjHXBO5mnMqrj1iDL9vMnp+DdmnDCW7rGX3aCvpo8aOO+g6+FKlU5Dg853pMaJ8bCScW+I0v4s5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=p/uFtyZn; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="p/uFtyZn"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-485ecc0f2dfso4658303b6e.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 13:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1781037541; x=1781642341; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xG+PJcI9dU8eULLGgiwqpsuOnpbG0JGZGxHHivVcL3w=;
        b=p/uFtyZntqHl79ztBnvemKzUUJ2l6HFN1te+lplUPnV4KnJqVNOmUa2j0zpndJApRR
         hZ73EIoqBEN+nWtZOFg0nxm2K86Y5P7BlYh3nYKzcf9zO4P/N1d2SPIAmbjTTJyD9ruo
         8Nd8kQHpbXe9zSijj0EfxtA25yJTsr0rCoaytfni7Vpj+PFu9DuOzHJ5OiDDeC5U8YTG
         V++wvxAWdBgSCwq8CMCr1AYR2giQaQnAr1tAXxNjJGBW9Mpt8OmtzjUj1/N3IMd1tCyC
         rKWfmcHH9ayYrECiHOSnVdXW25xJ8apbcTzpgO8HCF0HXfXVMfejGylyswSll1dnnqpI
         5vuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781037541; x=1781642341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xG+PJcI9dU8eULLGgiwqpsuOnpbG0JGZGxHHivVcL3w=;
        b=ABOm32ewKdSq6iJfetUZsKyNr+DseM+vE6C7LovCE1m9uWIaZyvF5GCWhTUow5uOLP
         c3C5jNoWYTUVz4FCYv+JS63taKAd6s6b4dGxBgQJhoJKRt6e6sKM5k5Cy+TDOaidQr1v
         Q8WaX1HecgaI6LqYogLVq1XufAwFQgeJWCrZwkTmyLPZFemWgeUHziX4rF+bmvv3x/R0
         GXkHRAk53fxdrZYRaS/aohf3JHWTU57GSCqh1OA7GSNRJOGsW/HWylMvFXWQWFUoE1tn
         TnQo4XAblLc5ywuLSM/GXfLRQR7PMxiJTG7Ej46/gf4gAFgwvMqpVnbG1DT06kFFDt+H
         LGPA==
X-Gm-Message-State: AOJu0YyiELmXcJ62LdAbeWfB4Uo6DMczMPj4aCT8CFz3frD6waSRtEqp
	hki0OwAzOyrkJuOo15hX/u5vEldm7QFpAOUj/tmJAcSujQXJQ/PbFJYbgblwrqZjqwsnOUhQrBB
	svWUr+Cg=
X-Gm-Gg: Acq92OETSOB3wgjGD8Zy/PaUDiDSp/Xb5x3Ym6WWGNYai7VaIvPWfwO4h52+TpBZzQg
	e25cSApc+LmOwAUiChp0Fj2h6aD21GVHkBiPE9tJvcNVq9l1VT83tTWQHggla3RpqWMcbRYjMYA
	RyDSuzRLsUSTlwzKIkWLKRqWIA3SFQbdWhTNJ5G3nKfcoUYWIiGGR/xYZ6F6TlCTwpnkhdKSWdH
	Co//pIURwFZL4uNwSSYGw64Kg0L1+EVtjlnd104aUt2vZopcJlPIas1kSTWFRl7jLHPXfWuS+rn
	iuDeI/xlkPO7Xzlo0gouMGUmslYKxz9ZcRfWQAVBnL2xPL8fDJMtnNxiv2S9GY1GZtg4S/m6vT9
	3DB89yL1DDfmTzCgkvauqw/SKP57L4S6CgCN7Nhlnev1DN9mrXJWuH+yPRBuN9ZWs2lzWZvbbFk
	StNCnMpXXHNwsjI/8f/HSaBY4EZlq5lEcn3w==
X-Received: by 2002:a05:6808:d4d:b0:485:4601:9c84 with SMTP id 5614622812f47-4868de44d92mr12430789b6e.29.1781037541328;
        Tue, 09 Jun 2026 13:39:01 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e78e7f9csm15313928a34.17.2026.06.09.13.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 13:39:00 -0700 (PDT)
Message-ID: <c2d586ec-84ee-4c25-b5b5-19a0a9819d6c@riscstar.com>
Date: Tue, 9 Jun 2026 15:38:59 -0500
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 03/14] net: pcs: pcs-xpcs-regmap: support XPCS
 memory-mapped MDIO bus via regmap
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, bpf@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org
References: <20260605010022.968612-4-elder@riscstar.com>
 <20260606010123.B07D01F0089A@smtp.kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260606010123.B07D01F0089A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/5/26 8:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing colon ':' after 'F' in the MAINTAINERS file entry.
> --
> 
> commit 2d23c3db72012c33d05246dcd5eb68b21952d164
> Author: Daniel Thompson <daniel@riscstar.com>
> 
> net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via regmap
> 
> This commit introduces helpers to allow drivers to register an XPCS using a
> regmap for the memory-mapped MDIO bus. It addresses issues where the MDIO
> bus is allocated to a register window that does not align to a page boundary.
> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index eb8cdcc76324f..2aa6ea012c848 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -25931,8 +25931,10 @@ F:	drivers/net/ethernet/synopsys/
>>   SYNOPSYS DESIGNWARE ETHERNET XPCS DRIVER
>>   L:	netdev@vger.kernel.org
>>   S:	Orphan
>> +F:	drivers/net/pcs/pcs-xpcs-regmap.c
>>   F:	drivers/net/pcs/pcs-xpcs.c
>>   F:	drivers/net/pcs/pcs-xpcs.h
>> +F	include/linux/pcs/pcs-xpcs-regmap.h
> 
> [Severity: Low]
> This isn't a bug, but should this entry have a colon after the 'F'?

Yes.  This will be fixed in the next version.	-Alex

> 
>>   F:	include/linux/pcs/pcs-xpcs.h
> 

