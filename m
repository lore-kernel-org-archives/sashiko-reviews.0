Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.40.3.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795090389;
	b=QUO48o8Wxd35qFIzqGroByHlH1PsJd95YDXWgAOy6Vx3TNmbegXmDNC8kC3yN0+Y97KJ
	 6657K8iAlt+HaPzEwDSFFSQ3DTJP+RMyvLqep9EHhjgFm1Q/GK4nHQUYoC0ofLP9VodAC
	 iKQa6ALQc7m6pyknSiZyNCRAjq70uTdffjxSGT2IKcIjd+jAU5qKr+JWDvmtt3aY4iNW6
	 2zzxusFlWe70Tz0hKN34y7F9/94qt7J/jxvVFmHW3LHX/8verKq2F80UD6cieFVTFp4YY
	 Z+0oYgZ9rBa+UEDZKf1t7jbiwSQJVXepA0hCggnV3tYhE+JEHdWUf2lAb4jZlntqspg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795090389;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Virus-Scanned;
	bh=REsnftpp5R8mVp6m2NhUleDB0j+A8D+8snw/QN9P/es=;
	b=4uolKJLnuXWhWwvOjYBPwvKdmBaWerEG3yA/kpq+1v7TU7ebM4L9gbWHumQyK489i0CV
	 q7sKaWTMlWIyaufBt8AuEj/NjLsnHa/LxVt3ILPX2ttr/G319m1RIRKAwPIy8WGWm8aO+
	 5zZqGqUl5JOk0Lkm5S5IPNIUGA183dvQblpCQZTg9Vc1QlgI6mDrZ71tSCcse3eaVmLWK
	 wvjfk6nvsBVoq0kSRhaQN8+M+7J3qMcjQ5tWaAQGmiup0dkHtZsxO6CZDBzSzjPIlqqtz
	 tYBOyQc3Gkz6H6H3eg0JkE9lj5N1m1qaLxi6mSM+4vJSmKi8nawhSm2PiInIY49yXNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ew.tq-group.com;
	spf=pass smtp.mailfrom=ew.tq-group.com;
	dkim=pass header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b="Ow1j+iK/";
	arc=none smtp.remote-ip=188.40.3.216
Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E50A606A320;
	Thu, 19 Nov 2026 12:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E50A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.a=rsa-sha256 header.s=default2602 header.b=Ow1j+iK/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=REsnftpp5R8mVp6m2NhUleDB0j+A8D+8snw/QN9P/es=; b=Ow1j+iK/0IXr3VjEg+HVcVRwx4
	ClZh46wm3jwoJUVDAxFIqsxoZ2Ne7kNGjkKMnV1I2iuu+4Y2/PszSHbhbhw4W1hy3L+HiNX3dHrM5
	DP1TcGgLpSwzVCdI7sh8RlIqxLJtnk9KkHGMu2gGvJJ8YIaf8R6+QmTCmV5r1gY/cqOqvV67wD21z
	xv2rpZcvIdV5rCaZLOTboYJmaWqrI1UxU99KchXsx3c9Y9sl+ATp4XwLSLijEOfgRMmLOQfdQONKL
	LcmavD58kF7/4vNyS7B/Upkr7kSvvHtOybAQXD2X336TWJHk9+sERgqdHlv1s9U+mQ6FVhy5cx3GH
	hWdIyBBw==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <max.merchel@ew.tq-group.com>)
	id 1xU10k-0009Qi-1O;
	Thu, 19 Nov 2026 13:13:06 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <max.merchel@ew.tq-group.com>)
	id 1xU10k-000GBq-0t;
	Thu, 19 Nov 2026 13:13:06 +0100
Message-ID: <327196f2-9063-4164-a556-3093a649b5e0@ew.tq-group.com>
Date: Thu, 19 Nov 2026 13:13:05 +0100
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: imx6qdl-mba6: Add EEPROM nvmem cell for all
 board information
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org, linux@ew.tq-group.com
References: <20261119102531.2995127-1-Max.Merchel@ew.tq-group.com>
 <sashiko-outbox-222965@kernel.org>
Content-Language: en-US
From: Max Merchel <max.merchel@ew.tq-group.com>
In-Reply-To: <sashiko-outbox-222965@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.6/28188/Thu Nov 19 07:24:39 2026)


On 11/19/26 11:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] ARM: dts: imx6qdl-mba6: duplicate @20 unit-address in
>    nvmem-layout
> --
>
> commit b5a0ac272fe3356ca3f0ff5cbf739f7f5d760dab
> Author: Max Merchel <Max.Merchel@ew.tq-group.com>
>
> ARM: dts: imx6qdl-mba6: Add EEPROM nvmem cell for all board information
>
> This commit adds an EEPROM fixed-layout nvmem cell at offset 0x20 covering
> board information on MBa6a and MBa6b carrier boards.
>
>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
>> index aca320ee8f476..9b199b277c220 100644
>> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
>> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
>> @@ -29,6 +29,10 @@ nvmem-layout {
>>   			#address-cells = <1>;
>>   			#size-cells = <1>;
>>   
>> +			board_info: board-info@20 {
>> +				reg = <0x20 0x60>;
>> +			};
>> +
>>   			mba_mac_address: mac-address@20 {
>>   				reg = <0x20 0x6>;
>>   			};
>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
>> index c7bbd6195fef1..517913abbc66d 100644
>> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
>> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
>> @@ -39,6 +39,10 @@ nvmem-layout {
>>   			#address-cells = <1>;
>>   			#size-cells = <1>;
>>   
>> +			board_info: board-info@20 {
>> +				reg = <0x20 0x60>;
>> +			};
>> +
>>   			mba_mac_address: mac-address@20 {
>>   				reg = <0x20 0x6>;
>>   			};
> [Severity: Low]
> Does adding board-info@20 alongside mac-address@20 under the same
> nvmem-layout parent in both dtsi files cause duplicate unit-address dtc
> warnings?
>
> Because both enabled sibling nodes share the @20 unit-address and overlap
> at offset 0x20, building the MBa6x DTBs with W=1 or W=2 triggers
> unique_unit_address_if_enabled and unique_unit_address warnings.  Could the
> fields be defined as non-overlapping cells at their respective offsets, or
> exposed through a dedicated nvmem layout?
>
Hello,

the MAC address is the first part of the TQ-EEPROM structure for 
module/board data (MAC, serial number, type).

The function “nvmem_get_mac_address” in “net/ethernet/eth.c” retrieves 
an nvmem cell containing the MAC address and compares its length to 
ETH_ALEN. Therefore, it is not possible to use the same nvmem layout.

Consequently, two nvmem layouts are required, both starting at the same 
offset.

I have not found a way to use only the first part of an “nvmem layout” 
or to create sub layouts for sections of an existing layout.


-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/

