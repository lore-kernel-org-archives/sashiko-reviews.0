Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584F171B1;
	Sat,  3 Oct 2026 03:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790999878; cv=none; b=ALnW8kV7Xmrq3D/RbX103tL10Gub1dzCGi72gzK8BicixeCoDg3A/k9k63FcHFwXmxGUcWUCyYZFXcRMgPViWoGkx/YgmGBLb6GWdes9u57r3qlsjkZuDyay5j/kV+7y2RUDreTTGD8et5gETN3RB6jnQYyuY+mYTiJ1kMjTlL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790999878; c=relaxed/simple;
	bh=DpWhDO/vdUTbTi2AJigJJaIadSOLyzzzGoJkHiqkRtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2Agt6v9Ux/5UVjwlj9gEqMOBfDKNujNs3ScEXX3ErNyy/hUcqbpxiKB6fEiIRWGGm3TlxGI/hKNER5u0Kfgrp9qPonBfFcQoBygM4sDoTHZm5fFJ4Sf1+ZV5ZU9Bp+cWeUcnPThhU7MzIexBWoNPGdL6LBKtYXotP260UpAKCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=WB2UQbl8; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="WB2UQbl8"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E5BA1077D6;
	Sat, 03 Oct 2026 05:57:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790999867;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PuhoXoeA2Pi+cnJ3g9zEOtuLW+cFrTqs5s9GqaeHR4M=;
	b=WB2UQbl8PCYAwMiqCvhzYBmrynWvtel/y2V8Z6xv4Uw8t2iplfgb8x/Yz6eow+XEceiUwV
	jTpJcAZvTa0+5jTx2oGfWElJujJYFR7vzNznQlKxF85qQCBdv4Cx4HzNSuA1y46IrhTv93
	EYKJSaDek0ej40+nCCRAqpUuANjdRcBOuHP9bahe5nbBaPrNUW9nxpzwap9N68T/KEGqw/
	yJGID1kH+HkUmeFIOEPHhfCCLFL5ddQFjBntBXKIoWUC+/B2EVErWYHhsXXjvkNHb3spgR
	ukBWJbbe9kIDESqLaMM6PZx/5BT3DeU1PTEl4wly9Y6iKm+rvQAZsPWicBvA8g==
Message-ID: <20232ace-d9a8-4082-b553-8e029ab63963@nabladev.com>
Date: Sat, 3 Oct 2026 05:57:45 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next,PATCH] enetc: Set eMDIO MDC rate to 2.5 MHz only on
 i.MX95
To: sashiko-reviews@lists.linux.dev, Wei Fang <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
References: <20261001223947.60189-1-marex@nabladev.com>
 <20261003013406.536AF1F00898@smtp.kernel.org>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20261003013406.536AF1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 10/3/26 3:34 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] net: enetc: uninitialized mdc_div breaks MDIO for non-PCI users
> --
> 
> commit 324eeacc2ec0cb1fd98e9f3ac96f2fe7f653ae78
> Author: Marek Vasut <marex@nabladev.com>
> 
> enetc: Set eMDIO MDC rate to 2.5 MHz only on i.MX95
> 
> The current eMDIO MDC rate is 2.5 MHz on i.MX95 B0. It was pointed
> out by NXP, that the MDC rate is divided down from clock of different
> frequency and using different division ratio on different SoCs. Configure
> the i.MX95 eMDIO MDC rate to 2.5 MHz to match the 802.3 specification
> and reinstate previous divider ratio for all other SoCs.
> 
>> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
>> index a90a04a47befd..7ed9b9120f447 100644
>> --- a/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
>> +++ b/drivers/net/ethernet/freescale/enetc/enetc_mdio.c
> [ ... ]
>> @@ -63,7 +63,7 @@ int enetc_mdio_write_c22(struct mii_bus *bus, int phy_id, int regnum,
>>   	u16 dev_addr;
>>   	int ret;
>>   
>> -	mdio_cfg = ENETC_EMDIO_CFG;
>> +	mdio_cfg = ENETC_EMDIO_CFG(mdio_priv->mdc_div);
> 
> [Severity: High]
> Does this code break MDIO communication for non-PCI users?
> 
> The mdio_priv struct is allocated and zero-initialized by drivers such as
> the enetc PF driver (drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> in enetc_mdio_probe() and enetc_imdio_create()), the DSA NETC driver
> (drivers/net/dsa/netc/netc_main.c in netc_port_create_emdio_bus()), and the
> Ocelot driver (drivers/net/dsa/ocelot/felix_vsc9959.c in
> vsc9959_mdio_bus_alloc()) via devm_mdiobus_alloc_size() or
> mdiobus_alloc_size().
> 
> Since this patch only initializes mdc_div in enetc_pci_mdio_probe(), mdc_div
> remains 0 for these other drivers.
> 
> When enetc_mdio_write_c22() and other MDIO accessors use
> ENETC_EMDIO_CFG(mdio_priv->mdc_div), the MDC clock divisor will be set to 0
> instead of a valid value (like 66). This results in a clock rate that
> violates the IEEE 802.3 2.5 MHz limit, breaking PHY probing and leaving
> network interfaces unusable.
+CC Wei -- this is nonsense, right ? Ocelot isn't even NXP ?
