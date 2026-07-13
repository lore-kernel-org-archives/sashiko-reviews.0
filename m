Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7963D1A82;
	Mon, 13 Jul 2026 23:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985242; cv=none; b=AXqR3fcn9DsVfXCxqEVItEj1MbCvKJoFyH7EtF2wSlYtZuZHZF4RUUbyPW1FrUxXwmksFxLMrSqIVSQ2OFT4zDRK6FOL5UX1EW5NTgIQ0+1RWI+LrbSE4GNuDlHVHNLSttDikepo2WIDoFU8Djv5nH771Ic/+5nqlv5g8mOJAyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985242; c=relaxed/simple;
	bh=Wjug2qov7LRyqgr3Qse5dIMzwa/3KSun6rLl4rDLdII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IYvDMebcdIcpTuOELTwg6lMjjvTzgCMP43kUze95d1GVYVd70KYK3XgwzFLDtBu4DER+v4de7dbigmiAIxBvw6ViFduPBea1NZDidAHk/c1UMtZ2eaDGrGOaNfHIQmJ/zIaR5tbx9aW1tNDyg2MgdzcPhlBFkXWcWHCwYiuo6X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=KdzY9rKo; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="KdzY9rKo"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC60C1199A0;
	Tue, 14 Jul 2026 01:27:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1783985238;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dR7GHvB3UJZSmPkAEhG2QL9LbWKjbS7ctY0T+4ydKxM=;
	b=KdzY9rKor+121zBdNVAQ6jYyjVy6OKscrIGF0ylwff+P849Bm4XP10tevzf51rTts7YEiL
	KlYAoxXDEdKnV2qUyBIET/8PgxLphayTZSv5JA3kCLLgSThuFT5JyGtsOayEFSWkbKQUip
	mLaI1FkJa7oAuKHYqBEUemj0Aac0O+Kz9BzNSmoHbK/nMt5d0+WthIUowH/CkBfFSHdBRK
	3Ad+MlVsI5AjIzlv9+3zwUIASJnOVct2CO9DFKhgwkm1MJ+A5KsvZhS5DWNQxRwptPvtgT
	GGZWpMUAVRWKfkHPlN4UXYgA6hGfru4YCOllhuCvINNFWlQUgGp8YpAEa39JMA==
Message-ID: <f1e52327-42da-48e1-8e4a-dabf148ce216@nabladev.com>
Date: Mon, 13 Jul 2026 18:33:33 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 Frank.Li@kernel.org, imx@lists.linux.dev
References: <20260705200534.151803-1-marex@nabladev.com>
 <20260705200534.151803-4-marex@nabladev.com>
 <20260705202439.3F5771F000E9@smtp.kernel.org> <alUICTI-24tREZO8@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <alUICTI-24tREZO8@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/13/26 5:45 PM, Frank Li wrote:
> On Sun, Jul 05, 2026 at 08:24:38PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] The virtio device buffer node is named `vdevbuffer` instead of `vdev0buffer`, bypassing the driver's carveout exclusion logic.
>> --
>>
>> commit b1e78cbda66a659316ae8170db75a75bd2d9d9d2
>> Author: Marek Vasut <marex@nabladev.com>
>>
>> arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
>>
>> This commit adds device tree overlays for the CM4/CM7 cores on the Data
>> Modul i.MX8M Mini and Plus eDM SBCs. The overlays allow CM4/CM7 firmware
>> to be used with remoteproc and rpmsg without imposing the overhead on
>> every user of the platform.
>>
>> [ ... ]
>>
>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
>>> new file mode 100644
>>> index 0000000000000..8d681c0eff0d4
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtso
>>> @@ -0,0 +1,56 @@
>> [ ... ]
>>> +		rsc_table: rsc-table@b80ff000 {
>>> +			reg = <0 0xb80ff000 0 0x1000>;
>>> +			no-map;
>>> +		};
>>> +
>>> +		vdevbuffer: vdevbuffer@b8400000 {
>>> +			compatible = "shared-dma-pool";
>>> +			reg = <0 0xb8400000 0 0x100000>;
>>
>> [Severity: Medium]
>> Will this node name bypass the driver's carveout exclusion logic?
>>
>> Looking at imx_rproc_prepare(), it iterates over memory-regions and checks
>> specifically for the name "vdev0buffer" to skip processing the vdev buffer:
>>
>> 	if (!strcmp(it.node->name, "rsc-table") ||
>> 	    !strcmp(it.node->name, "vdev0vring0") ||
>> 	    !strcmp(it.node->name, "vdev0vring1") ||
>> 	    strstarts(res.name, "vdev0buffer"))
>> 		continue;
>>
>> Because this node is named "vdevbuffer" instead of "vdev0buffer", it appears
>> it will be mapped as a generic carveout via ioremap_wc() and unintentionally
>> included in the remoteproc coredump.
>>
>> Could this node be renamed to "vdev0buffer" to avoid wasting vmalloc space
>> and bloating the coredump?
> 
> Look like make sense, please check it.
> 
> It is not good to use node-name as ABI. Laurentiu is working on use
> memory-region-namses.
The memory regionss are referenced from imx8mm-cm4 { } node via the 
memory-region property:

memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>;
