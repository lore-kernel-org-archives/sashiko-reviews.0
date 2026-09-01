Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6114A43B6CB
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788270612; cv=none; b=Q4fVZDG7Bz99uzAu3z6QasE/72bEiEC0zoPToaa4wRkHrQQTzGEiYOBsVZRzDdVBbVe6snA1Fhx52n4wyElwdZZ4hTHJoquzEdEEDobx8w++hRs3VeSRb8tRLNAvDfmfXIbVrzH1Wc7lkmvA1249sSn+AFPnyfotUsdSS/m/mA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788270612; c=relaxed/simple;
	bh=OsPt/cT8BwFgc2l35blwbFE8qUUU6lxYABA1mI2KYMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQ85e+05wEw247YWISZ/HSbO7osHgRC0wCvB9eX0UWJfxkTDyoj9zUGKLiGHA2vB5zEYw8nvxnGHanY7Sb2i5C4V2PByUNT7t83oEqCp5Lto8Dz80g4tGeaj+qvXf1lcMSkldnj2546aMdtk9B3e+jfx34kNwJxMA3scUDy6vjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ogiErb9K; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogiErb9K"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482f9309813so890560f8f.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 06:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788270607; x=1788875407; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rRkUL/OFvGAZqvO4fpwddKnaKIcFlaNkl3QdtF7lN4w=;
        b=ogiErb9KGReE127RltJ5au5kCp1hHcV8zBayGOAKixWT43lZ/9vPv692Dduwo1Nm/Y
         RfZhKNov2TmP2HmweBvoDOblArA6Ez2jmH/LyPN8FFMAj3EM7SkG7JLlemRRZzs+DF5T
         hC0PvBAJeceNBTLto1D6U7nGvcRQOJdYqnvWgtHMf6wWu+bM4BFBl1BO4Y3oKS6eREb1
         Ru/VSaqRAWw2I5xnizKYyyRPS5aKqkniaFwc0qjx3/zCI1QY4Mh9O9/tK9BfgFOkimsR
         mNEBcV5/rAGizhMbKYYAMa4qgsKXPT5DzYcWiTuWihPis7konfw3jgortSY+V99y15aq
         rPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788270607; x=1788875407;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rRkUL/OFvGAZqvO4fpwddKnaKIcFlaNkl3QdtF7lN4w=;
        b=j1eck5cnh+e70TtKWh2+ZxVOsKOXerbozVcjBMxQFva6Bo8z1JYGv+KP697dJ3xVuq
         Rhdh9VTGq9biHtm7YfNZwTW4EIRcdbRQL9DXHnSKy/lqaOkpMcWJEe8Sl1roZDogUqmo
         j/uR/t2RtSMDhzwVYyWtet2ymx04TiGHOQirmQRh6vR+/dMEzRHDxIwVVA4cEFY28MkP
         exrBBtWRJQb1HauWk5DKqhdJ4zKxKzkoEl35OY2hNKPgqZ+ReFYVb5EO3EVtSABeIBKp
         HYoE0Fcjvy6QBOIPVeKT+iMLh+uFxF2l7CVFuTZsYy6/YTFVbD9ppFQLErQrhSB/HjtT
         ACdw==
X-Gm-Message-State: AFuF++lG2Ph46+uyufTfNeYjH3eV0C5QMig48lOcLgBdXPCF3UOLtVmh
	WtjnhjDTiuTLJ1PCLUda777tRZm53gamiMD7u0r/iFDbZ7snHy5AQduq39fL8q3f
X-Gm-Gg: AYBFou141hEFURwRVcDO6LKx3RaH8sN9pIOdMN76oc0N0otiabC7MwHz2lxdzIBr3uV
	JMmg7VWtRHrEPBe2zEWeeeCidL0RLtU5+9L9ft2aPnJPMlu3nflj1n5kFpZdhlyksrTJ5PbWW7D
	5E8dIqsTBqYNLb5UtqY/gwXgyzau4Jc5ZddwKADAF3O4YK23Kp7bFONa+zSFpsh6EDljt2Ou/y2
	ifWeyPr7RjM2i7UNvrznU2yVWLJSU2nCm3kInQJALTY+RCAeLLbXLJ4UX1WN/Kutet/d4oAiXpc
	xcqA4qt5lNl5DC7/wO5TmTP00HanOdsBXe3k5wW5T5cLI2ByA1LS52HkyWxdGtLXKitVrtM0qPM
	lh6tjnD5cfZUJkiKVPpgSQAjSpvOENLfWV0PSv1xD2iDt58pM4t0LtmeIIJ14n5lGIQbtGaKno8
	kJmTXpBsqlDyJHe4Lnt6XJa22ypps9DL7hAnlkufpQlIiXYkKRq2Ytj8Na/IEfQheoaLL+jqKZQ
	olA5gVEvAYi/4jItsn3jFBl8G9WJHg=
X-Received: by 2002:a05:6000:4548:b0:484:4789:9bb8 with SMTP id ffacd0b85a97d-48447899d60mr2616212f8f.2.1788270606921;
        Tue, 01 Sep 2026 06:50:06 -0700 (PDT)
Received: from [10.25.209.52] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6dc16sm3988721f8f.20.2026.09.01.06.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 06:50:06 -0700 (PDT)
Message-ID: <9e6de8ae-aca6-41ac-bcef-f591d9fe8462@gmail.com>
Date: Tue, 1 Sep 2026 06:50:05 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: freescale: add MR-NAVQ95 basic board
 support
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 conor+dt@kernel.org, robh@kernel.org
References: <20260901131918.1189-1-laurentiumihalcea111@gmail.com>
 <20260901131918.1189-3-laurentiumihalcea111@gmail.com>
 <20260901132721.9559B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20260901132721.9559B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/1/2026 6:27 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing memory node in device tree
> - [Medium] Missing USB controller and Type-C implementation
> --
> 
> commit 3130a84e68bcdc800ca07e4c01ec3d00e67a37c4
> Author: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> arm64: dts: freescale: add MR-NAVQ95 basic board support
> 
> This commit adds basic device tree support for the NXP MR-NAVQ95 board
> based on the i.MX95 SoC. It defines initial aliases, chosen nodes,
> regulators, and various pin configurations.
> 
>>    Add basic support for NXP's MR-NAVQ95 board. This board is designed for
>>    robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
>>    following hardware feats (list is not exhaustive):
>>    
>>    * based on i.MX95 19x19 SoC
>>    * 64GB eMMC
>>    * up to 16GB of LPDDR5 memory
>>    * 1 x USB 2.0 TypeC
>>    * 1 x USB 3.0 TypeC
>>    * 1 x RJ45 port with RTL8211 PHY
> 
> [Severity: Medium]
> The commit message claims hardware features of 1 x USB 2.0 TypeC and 1 x USB 3.0
> TypeC, but looking at the device tree file, it completely omits any USB nodes
> or Type-C definitions. Will this leave the USB ports non-functional in Linux,
> and should they be added to match the hardware description?

This is intentional. USB nodes will be added later on.

> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-navq.dts b/arch/arm64/boot/dts/freescale/imx95-navq.dts
>> new file mode 100644
>> index 0000000000000..1366dc2d2bfa4
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx95-navq.dts
>> @@ -0,0 +1,222 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright 2026 NXP
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "imx95.dtsi"
>> +
>> +/ {
>> +	model = "NXP MR-NAVQ95";
>> +	compatible = "fsl,imx95-navq", "fsl,imx95";
>> +
>> +	aliases {
> 
> [Severity: Medium]
> Should there be a memory node defined here at the root level (e.g.,
> memory@80000000)? Omitting the memory node breaks standard DT conventions for
> root nodes and can cause boot failures if the bootloader expects an existing
> node to update and does not dynamically inject it from scratch.
> 

ACK. To be fixed in V4.

