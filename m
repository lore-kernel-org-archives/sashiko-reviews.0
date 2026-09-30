Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E664DA9C4;
	Wed, 30 Sep 2026 13:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776314; cv=none; b=pGZJ3cvzO9nfBZsdH0o26XLKgH+1s9HekZHj92GSZKMieczjirCifBLFDrgDMJ/cExbqcnjc2AViAtJV1f4jCs0XSVqbKT8ayit9E5E9Tv8gzOU2xexNp75Lm2awUZYgU4F8mQMT4g0M90UQUw+F08VnM9STX4OsMSbT2jDbADk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776314; c=relaxed/simple;
	bh=l7abfpsRrMZ7oBWyL4FsSuaEMLrgrwqnzHPSNOOnZyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U8ECa8YqwCajeJ+A8h5Vfx7hyaD/RllaSC7WYBpEn2Fz5Nu2V0icC2viL2PmVmVpS6bVkMxDaTcxkjCFp7wQIWPFCAmqtXvs6joDgFghs/isGqSalr5pFujAb4z0t7iMF29bAvw/Hdxas/pOy+BmqQzIxS29GH22oMCK2Le/ujE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Eees9UHh; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Eees9UHh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NRkSzdr9h/KU/Gp3VjR0xCo3up6HUR7kMTPEsX5LBWI=; b=Eees9UHhgdaRBjfrs8w5185sc0
	+uySXruUWIbz+EvffpApA8edYaeI1MSJciKCuobjYZnpyrB2sff0WHWmSdA/wyOiKsEnaj00BUXgt
	yh1QqIhvExinYuSWiKEXmDoGkbEnIxRtY+FTYxHEWASMlP54i64pUDuH2QIFBSfEONzE8jHVmvfmo
	rvvZYTdwU9PGemsJuYz+fUajao8SOUMEajFhs+lU4uoOPl8o0fS2GL9OXKh4S7Sq0VoWG1Muu5ZFX
	Qy+YzGa7WNPB137wi2UT/hvk3L80S9h3H5IQd8UmcnpP4UFcKXo/5lVQ/lGxrhcXAxV6ye8TyDk/E
	78t9YQ/w==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:50572 helo=[192.168.69.116])
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBuil-00000000l1S-1WbQ;
	Wed, 30 Sep 2026 15:51:40 +0200
Message-ID: <a3cf3fa9-9468-4722-a053-5bec424d5526@norik.com>
Date: Wed, 30 Sep 2026 15:51:40 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ARM: dts: imx6dl-phytec-mira-nand: Enable all
 peripherals
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260930103425.2315286-1-primoz.fiser@norik.com>
 <20260930103425.2315286-2-primoz.fiser@norik.com>
 <20260930104006.EC64F1F00893@smtp.kernel.org>
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
In-Reply-To: <20260930104006.EC64F1F00893@smtp.kernel.org>
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

On 9/30/26 12:40, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dts: imx6dl-phytec-mira: missing m25p80 SPI NOR flash enablement
> --
> 
> commit 1324c8cd36593c2b5134e1d0d30d31d809ac1bc1
> Author: Primoz Fiser <primoz.fiser@norik.com>
> 
> ARM: dts: imx6dl-phytec-mira-nand: Enable all peripherals
> 
> This commit syncs the i.MX6 DL NAND variant device tree to match the Full
> Featured (FF) variants. It enables peripherals including CAN and PCIe, and
> removes the speed limit on the Ethernet PHY.
> 
>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
>> index d906a7f05aaad..1f827ad2ff5ee 100644
>> --- a/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
>> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts
> 
> [ ... ]
> 
>> @@ -50,6 +50,10 @@ &i2c_rtc {
>>  	status = "okay";
>>  };
>>  
>> +&pcie {
>> +	status = "okay";
>> +};
>> +
> 
> [Severity: Medium]
> Did this omit the SPI NOR flash enablement?
> 
> The commit message states the intent to sync the i.MX6 DL NAND variant to
> match the Full Featured (FF) boards by enabling all peripherals.
> 
> The FF Quad variant (imx6q-phytec-mira-rdk-nand.dts) enables the SPI NOR flash
> by including &m25p80 { status = "okay"; };. While &can1, &pcie, and the
> unrestricted &ethphy are enabled, the &m25p80 node is missing here.
> 
> Does this leave the board missing its SPI flash feature and partially
> unsynchronized compared to the other FF variants?

I re-checked and this patch is actually wrong.

There was never i.MX6DL som with NAND + FF set board.

I will drop this patch in v2.

BR,
Primoz

> 
>>  &uart3 {
>>  	status = "okay";
>>  };
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

