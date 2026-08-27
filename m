Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB0935F172;
	Thu, 27 Aug 2026 11:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830845; cv=none; b=cAQt8xERdMMyvXCyBquHjVh6tTE9P/y5NGwqKDysCKWf3BhQYLdueW4uGyyfZ3sjR/0mDTLOx7LR6W+bpe7G5Ek/oIwUFiGJbVKY4XTJOrNO5wShJonaJIANqaUGWgTNCgWXaF6QIIu8da+iEvywIpue52JJqUSkyHDLIAkTllE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830845; c=relaxed/simple;
	bh=5HLWpG4MMXBNUTo7bfA+tQVUa3AWtUneHeNjgfaQ6QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JelI8L2XY9VqCxNQ6h0KOPDXwEf6Xhw63+YWgEb71TU9TaTSeaw/Oj2Pj5/CW9EGggG1z+tkOIs/ASrZL7ctToNOAHmFfj4pFoG9F7luYYBlndBb+VW5jy0ZcvAMuSKcHRD2wn1hdnr6aC2mcrIsXNudIm/tDBSizKoBc2GkY3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Dk+9iEEt; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Dk+9iEEt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RFOfrqWy0gy9lPAGRhmq5L9wkrlW1ajf+5MBiyuIZYc=; b=Dk+9iEEt8hfjrR4MD3AvCHzkvV
	4U1JtXrrCqHACyq/gKBe8oAumvubY4EGyxbx3DDkXV1xkxH9y5LAmn4cL5tSgXMop8AooJtnoRqSx
	woarNzCRyNXZH3WpsuYkbsU0q6xfGpzWBnd3PZzrby6XYsdzS621J9pFCY3H/6QJj3bPNQxRNN3/p
	d4be6gZkPYrztHlenjS13e+HAPSwgb9feDqAAKqTz67qphFfdxwr1osd+yx/qdGxroQPhs2tDhnWl
	9au6KXuaSL5owErP+Swi6ddT2TgrDzg8XXRK/krYaEY8aS/9eYBffFJeAPADn/pdD3om+ydRnuw22
	LkyN5ESg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52902 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.5)
	(envelope-from <primoz.fiser@norik.com>)
	id 1wzYTK-00000008605-2QQO;
	Thu, 27 Aug 2026 13:40:42 +0200
Message-ID: <9e84fa38-597d-4e6e-9aef-f4fd8ff083ed@norik.com>
Date: Thu, 27 Aug 2026 13:40:40 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-07
 expansion board
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 Frank.Li@kernel.org, devicetree@vger.kernel.org
References: <20260827075754.2739119-1-primoz.fiser@norik.com>
 <20260827081042.BE81B1F000E9@smtp.kernel.org>
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
In-Reply-To: <20260827081042.BE81B1F000E9@smtp.kernel.org>
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

Hi,

On 8/27/26 10:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Missing `post-power-on-delay-ms` in the MMC power sequence for the NXP IW612 Wi-Fi/BT module.
> --
> 
> commit 60b0b6fcfb75ad1ee4054d84dfea3d70e8467993
> Author: Primoz Fiser <primoz.fiser@norik.com>
> 
> arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-07 expansion board
> 
> Add support for PEB-WLBT-07 which is an expansion board that provides WiFi 6
> and Bluetooth 5.4 LE functionality. It features the u-blox MAYA-W2 module
> with the NXP IW612 chipset.
> 
> [ ... ]
> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-07.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-07.dtso
>> new file mode 100644
>> index 0000000000000..008b6f9f46e59
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-07.dtso
>> @@ -0,0 +1,76 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
>> +/*
>> +* Copyright (C) 2026 PHYTEC Messtechnik GmbH
>> +*/
>> +
>> +#include <dt-bindings/clock/imx8mp-clock.h>
>> +#include <dt-bindings/gpio/gpio.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include "imx8mp-pinfunc.h"
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +&{/} {
>> +	usdhc1_pwrseq: pwr-seq {
>> +		compatible = "mmc-pwrseq-simple";
>> +		reset-gpios = <&gpio2 7 GPIO_ACTIVE_LOW>;
>> +	};
> 
> [Severity: Medium]
> Is it possible that the usdhc1_pwrseq node needs a post-power-on-delay-ms
> property here?
> 
> When the MMC core powers up the SDIO bus, it deasserts the reset GPIO and
> immediately proceeds to probe the module with no explicit delay. If the
> SDIO host controller probes the IW612 module immediately after the reset
> deassertion and the hardware is not yet stabilized, could this cause SDIO
> enumeration failures during device boot or resume?
> 
> Other in-tree configurations for the IW61x chipset, such as those in
> imx8mm-var-som-wifi-bt-iw61x.dtsi, explicitly configure a delay like
> post-power-on-delay-ms = <100>. While there might be an on-board hardware
> RC delay on the MAYA-W2 module that mitigates the missing software delay,
> adding the explicit software delay might be necessary to guarantee stability.

The same PEB-WLBT-07 expansion board on i.MX93 also doesn't use
post-power-on-delay-ms property, see
arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtso.

So far no issues without post-power-on-delay-ms property.

I would like to avoid adding such properties "just in case" for now.

Thanks,
BR,
Primoz


> 
> [ ... ]
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

