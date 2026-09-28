Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7753E306779;
	Mon, 28 Sep 2026 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790599881; cv=none; b=BvzmsGuWLu/i+/tWSSenSTnJe3DQa5G/q/33fBo+xRqz4CQ2qK4bVTtY04rpbmomTBiBmGtWNDEO4eHBUf2AlxdXz4/d3B3vv2FnHMPbtPzRTudPhVfHgj4HigznHpd8qmizp7IkY1EJJ7du6BO9f99dG19DRG/hJVjhLuW/tns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790599881; c=relaxed/simple;
	bh=NVnUykZb2bttYQ/cwG/R9RTv+eYHY7atrHpBM825X84=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLNb/rnhwXfP5zYuU6dgLwzsYPd25QvTumk33tvpZBvLWiCc2nhSt2PZmWuTyMLooVPSklwnHvuU3EOLjIkHdojaEDRLXQCEHs5cbgtEB6MYzpvIYZlEWYRSJz6dMhuS8p0NYFUd04bd77JJPwrMZ/jwvKBsOsk4qtYBmwvtjRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=dhsXa91E; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="dhsXa91E"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rinGqyQqnVWywjI+IAdfG9OGkv98ahQmrv2dvsNrLYE=; b=dhsXa91E/nVpsbdpw4lE+R7e2+
	RwnaMAdu27MYylA8GAnhBdVI8uFWd7AIJfOgSEKrCSfxMpvs/4IQAURpto5T69xCGlb0MbtzmrAkB
	JYCe1JrtRMSM2P03JsY/SMHH4Hp+BUQVD5qQzvTkLjpsqkMwEyWS3oxkmXvw0wazMnW59w7XZWw6e
	kdWH57vsp1wc5lnhVIoDIcjX7pkyIfi5XSq6gX3HuzdpSTkZKP6txVhptvRJRUP2zqVYeZsNxJW5j
	KED9Y7RATe+CaesH/a6mkmHVSjt/pCbmI0u793f0Dapepa2db73HR3pT6JV3sD/VcZmX/yAY4Nk2Y
	h2Jsijsg==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:52346 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBApC-0000000FppD-0z9I;
	Mon, 28 Sep 2026 14:51:17 +0200
Message-ID: <83ccb4b4-ee31-40e1-9b34-83d59a905607@norik.com>
Date: Mon, 28 Sep 2026 14:51:16 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: imx6dl-phytec-mira: Add phyBOARD-Mira-i.MX6DL
 with eMMC
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, imx@lists.linux.dev
References: <20260928123612.2250601-1-primoz.fiser@norik.com>
 <20260928124450.3B22D1F000FF@smtp.kernel.org>
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
In-Reply-To: <20260928124450.3B22D1F000FF@smtp.kernel.org>
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


On 9/28/26 14:44, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] arm: dts: build failure due to non-existent .dtsi inclusion
> --
> 
> commit d27346cce6650da77827531e0a8db928754f5352
> Author: Primoz Fiser <primoz.fiser@norik.com>
> 
> ARM: dts: imx6dl-phytec-mira: Add phyBOARD-Mira-i.MX6DL with eMMC
> 
> Add device-tree for PHYTEC phyBOARD-Mira-i.MX6 DL board with eMMC. The
> variant with NAND storage is already present in-tree. Now let's add the
> eMMC variant for which the compatible string "imx6dl-pbac06-emmc"
> already exists too but was not used until now.
> 
>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts
>> new file mode 100644
>> index 0000000000000..aa3239660bca7
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-emmc.dts
>> @@ -0,0 +1,75 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (C) 2018 PHYTEC Messtechnik GmbH
>> + * Author: Christian Hemp <c.hemp@phytec.de>
>> + */
>> +
>> +/dts-v1/;
>> +#include "imx6dl.dtsi"
>> +#include "imx6dl-phytec-phycore-som.dtsi"
> 
> [Severity: Low]
> Could there be a typo in this include filename? The file
> "imx6dl-phytec-phycore-som.dtsi" doesn't exist in the tree, which results in
> a fatal error during device tree compilation when the C preprocessor fails
> to find it.
> 
> Should this include "imx6qdl-phytec-phycore-som.dtsi" instead, which does
> exist and is used by similar variants?

True.

This patch depends on series [1].

Sorry for confusion.

BR,
Primoz


[1]
https://lore.kernel.org/all/20260923070505.494949-1-primoz.fiser@norik.com/



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

