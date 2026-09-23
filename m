Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178AF3B14D0;
	Wed, 23 Sep 2026 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152630; cv=none; b=dy34OI3ofUlyl+eoe1OMV3KegQTCArpzS5GotsLEmmVN00FeBqNUQQZY8OkovT9mAaDfh0LTCFkVqhIMs7NdVNmWGKd9HQxKdjviCfoFqngNHeS4qGBAAPvpZSWxhvJb3w5LwQhA73GXse8P0wjsi9FVU2c7rIdOwCYSokiC5Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152630; c=relaxed/simple;
	bh=48RAPsVTXs9kf0iupbpvU4t4/lttOcABhmE6db3ND4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZDuhqCt2mLwnlxR/IOBSNbifKbW4gI2Eddb+RCn8xO3V0xk/Kq7ViP2bq16w3qI4AKUnI4Phjy7wf0ybkm7GB59rBETGnnQ5DfdoydLsoc+9rh2nHdd2JkZITQtG9HlK2qQuTKUI0VJ2hepr7iXCDTIXiY7CGxFGRIPRkJEXTmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=f3f4qylD; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="f3f4qylD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qNC76z7AWJ3Lr1z37AHrwZtLtLuRBB5By3VnjdrIEw8=; b=f3f4qylD8kQtufiGwtpyiwBQp1
	mghbYdATfBD2PFQ+zM7Ts/8CJOWP/nZbaMVmK0jvdYdHTijoE26suq7a+lZk4bD9ePm8fPd7e+XKU
	vGh+ncTRU37NRQvN0sTCnBmhqg/A9h7P1iEjcFPr4K8ct36rO6L/UVQBIpxQh2WNCZreDBHLhdwZq
	5IsyPVfxPlHmwtCTuhWCGXbJmkeTRnWi+xun7PSHx9rbPWRU2VO4s7xvnCuplwxCmX9lJvk+c9hXT
	1nZMv+4FT8RAyKBlqEKDsD91ze+wUaQSmzlZsHGMHv7/gnc2PoFw04UqBhHcJ7LxhMHcVgPF4xhdj
	tqQ0p0dA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:58262 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9ITJ-00000009sUb-3FI9;
	Wed, 23 Sep 2026 10:36:56 +0200
Message-ID: <0eeeef63-6f26-4d48-a164-8a852a77ba2a@norik.com>
Date: Wed, 23 Sep 2026 10:36:54 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ARM: dts: imx6qdl: phycore-som: Add custom volt/freq
 table
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org,
 robh@kernel.org, imx@lists.linux.dev
References: <20260923070505.494949-1-primoz.fiser@norik.com>
 <20260923070505.494949-3-primoz.fiser@norik.com>
 <20260923074520.3633C1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Primoz Fiser <primoz.fiser@norik.com>
Autocrypt: addr=primoz.fiser@norik.com; keydata=
 xjMEZrROOxYJKwYBBAHaRw8BAQdAADVOb5tiLVTUAC9nu/FUl4gj/+4fDLqbc3mk0Vz8riTN
 JVByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT7CiQQTFggAMRYhBK2YFSAH
 ExsBZLCwJGoLbQEHbnBPBQJmtE47AhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQagttAQducE+T
 gAD+K4fKlIuvH75fAFwGYG/HT3F9mN64majvqJqvp3gTB9YBAL12gu+cm11m9JMyOyN0l6Os
 jStsQFghPkzBSDWSDN0NzjgEZrROPBIKKwYBBAGXVQEFAQEHQP2xtEOhbgA+rfzvvcFkV1zK
 6ym3/c/OUQObCp50BocdAwEIB8J4BBgWCAAgFiEErZgVIAcTGwFksLAkagttAQducE8FAma0
 TjwCGwwACgkQagttAQducE8ucAD9F1sXtQD4iA7Qu+SwNUAp/9x7Cqr37CSb2p6hbRmPJP8B
 AMYR91JYlFmOJ+ScPhQ8/MgFO+V6pa7K2ebk5xYqsCgA
Organization: Norik systems d.o.o.
In-Reply-To: <20260923074520.3633C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

On 9/23/26 09:45, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dts: imx6dl: missing fsl,soc-operating-points violates hardware constraint
> --
> 
> commit a3b6d4e5af39862c78043d8917ba381472b78ee4
> Author: Yunus Bas <y.bas@phytec.de>
> 
>     ARM: dts: imx6qdl: phycore-som: Add custom volt/freq table
> 
> The PHYTEC phyCORE-i.MX6QDL SOM-modules are operating with slightly different
> voltage and frequency values. Introduce imx6q- and imx6dl-phycore dtsi files
> with the modified power tables to achieve stable condition.
> 
>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
>> new file mode 100644
>> index 0000000000000..de85c084ac8d3
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
>> @@ -0,0 +1,23 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2021 PHYTEC Messtechnik GmbH
>> + * Author: Yunus Bas <y.bas@phytec.de>
>> + */
>> +
>> +#include "imx6qdl-phytec-phycore-som.dtsi"
>> +
>> +&cpu0 {
>> +	operating-points =
>> +		/* kHz    uV */
>> +		<996000 1275000>,
>                 ^^^^^^^^^^^^^^^^
> [Severity: High]
> This overrides the operating-points to increase VDD_ARM to 1.275V for the
> 996MHz tier, but lacks a corresponding fsl,soc-operating-points override.
> 
> Without it, VDD_SOC will inherit the default 1.175V from imx6dl.dtsi.
> 
> The NXP i.MX6 DualLite hardware datasheet specifies that VDD_ARM_IN must not
> exceed VDD_SOC_IN by more than 50mV to prevent latch-up and instability.
> 
> Does this 100mV gap risk system instability or hardware damage by violating
> this constraint? Note that the newly added imx6q-phytec-phycore-som.dtsi
> correctly includes the fsl,soc-operating-points property.

From the i.MX6DL datasheet:

footnote 4:

"In LDO enabled mode, the internal LDO output set points must be
configured such that the VDD_ARM LDO output set point does not exceed
the VDD_SOC LDO output set point by more than 100 mV"

footnote 6:

"In LDO bypassed mode, the external power supply must ensure that
VDD_ARM_IN does not exceed VDD_SOC_IN by more than 100 mV."

The actual limit is thus 100 mV, not 50 mV! Can you provide quote
regarding your 50 mV?

With this override, the only affected tier is the top one (996 MHz):
VDD_ARM = 1.275 V, VDD_SOC (inherited from imx6dl.dtsi's default
fsl,soc-operating-points) = 1.175 V, a gap of exactly 100 mV...

So this is still within limits hence no fsl,soc-operating-points
override is required here IMHO.

Moreover, PHYTEC boards using downstream kernel with this patch applied
have been operating with such settings for years now without issues.

BR,
Primoz


> 
>> +		<792000 1175000>,
>> +		<396000 1150000>;
>> +};
> 

-- 
Primoz Fiser
phone: +386-41-390-545
email: primoz.fiser@norik.com
--
Norik systems d.o.o.
Your embedded software partner
Slovenia, EU
phone: +386-41-540-545
email: info@norik.com

