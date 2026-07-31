Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E853C2762;
	Sat,  1 Aug 2026 20:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785615400; cv=none; b=kZpfHOkSIipm36hFZDe5hEODn3b75metuZoYvHLQcc2c5eW2iuFjblS2+eZW3csupF66mwH34stJWGuXYM+fh/vleyfrlcSM8NE7VcOVAb4l0axBIGewZuZLK5NMJwxf6pA/D/J+wOLu9YZEW+x2zrtFA0f7E/eO7f62islmhbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785615400; c=relaxed/simple;
	bh=szEE9Afpkt0+oQbg+DThAnZDHkaqw/mWBnta2cm8awY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShqIRFSGZJ7ZNXiHokCLI6b4p7W5qc33IUnAsd9QxGCobdQiSoaPBRrKB8kxQDvPj6vMsmHAXXMiTp5k3kSuvzu6LPmln6vH5SS/Wm7d2moQfQ/gkSDoPHiz2VQCtOt+pXIYUKtn/3rIKz0mYMlS6xLph0sfGCXq8t1H2UMvlfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=TwicR78r; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="TwicR78r"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 404CD11BAF3;
	Sat, 01 Aug 2026 22:16:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785615384;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=V57S8j5sL4wbCUryfocsjRqwYLJFC9E04YgneRkkxxE=;
	b=TwicR78rDt4n4S3EWGAE3DiyxgSh/baCjLNOpZCeJZi6xKH4jkVHdtwlIhMy3OWT1mZyCF
	wgJQ2rwc7wt++N96G9XP5neusmMsllgn5YS4rKmpJDdmogcWw5VXGaYmbdnhr9d8GggBGl
	TNhXUZuwb13SSm8zvt8LJf9BaDKhs7B2V8Sc50DZyaJhJu4cvftyKtSloN6l8IDNdrrgYL
	abl0oPD6Z7Fr/+ykiQHnbNPtsYOZiGLcK2fW1eH9WZaYveYLKHi1+ZnsSNYnqlysJSO5YP
	ry48Sps8dwwgGVLd7Cnrxq+xHP2MsTYVy3/OWO3rvcilKi/TWlOdzntF02r6vw==
Message-ID: <8b211e2e-f042-4ac0-8d86-2118c91811b0@nabladev.com>
Date: Sat, 1 Aug 2026 00:46:25 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 conor+dt@kernel.org, Frank.Li@kernel.org
References: <20260730224351.95006-1-marex@nabladev.com>
 <20260730224351.95006-2-marex@nabladev.com>
 <20260730225802.A493F1F000E9@smtp.kernel.org> <amzO_vv2wjOWgZXg@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <amzO_vv2wjOWgZXg@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/31/26 6:36 PM, Frank Li wrote:

Hello Frank,

>> [Severity: Medium]
>> Will this hardcoded adapter-specific backlight enable pin break the backlight
>> on the i.MX8MP native LVDS adapter?
>>
>> By setting enable-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>; in
>> imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi, the adapter-specific
>> gpio3 0 pin configuration leaks into the generic panel configuration.
>>
>> Because the native adapter overlay
>> (imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso)
>> includes this generic panel file but fails to override enable-gpios
>> (to <&gpiowifi 0 GPIO_ACTIVE_HIGH>) and remove pinctrl-0, the native adapter
>> inherits the incorrect gpio3 0 pin, which may leave the backlight off.
> 
> 
> This finial dtb
> 
> backlight {
>                  power-supply = <0x120>;
>                  pwm-off-delay-ms = <0x0a>;
>                  post-pwm-on-delay-ms = <0x0a>;
>                  enable-gpios = <0x54 0x00 0x00>;
> 		^^^
>                  pinctrl-0 = <0xbc>;
>                  pinctrl-names = "default";
>                  compatible = "pwm-backlight";
>                  brightness-levels = <0x00 0x01 0x0a 0x14 0x1e 0x28 0x32 0x3c 0x46 0x4b 0x50 0x5a 0x64>;
>                  default-brightness-level = <0x07>;
>                  pwms = <0x9e 0x00 0x1046a 0x00>;
>                  status = "okay";
>                  phandle = <0xa1>;
>          };
> 
> At drivers/video/backlight/pwm_bl.c
> 
> get optional gpio "enable-gpios", which toggle this gpio
>   <&gpiowifi 0 GPIO_ACTIVE_HIGH>, which may not impact function, but it
> is potentially impact other funciton, if there pin conflict, need disable
> related module.

This is OK, this panel backlight supply comes from the base board in 
either case.

>>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
>>> new file mode 100644
>>> index 0000000000000..b06af369a9245
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
>>> @@ -0,0 +1,79 @@
>> [ ... ]
>>> +	reg_panel_bl_supply: regulator-panel-bl-supply {
>> [ ... ]
>>> +		/*
>>> +		 * MP2328 voltage divider settings:
>>> +		 *   R1=51k1
>>> +		 *   R2=5k62 with optional series Rs=2k21 (12V)
>>> +		 *
>>> +		 * 1 / Rx = (1 / R2) [ + (1 / Rs)][ + (1 / Rt)]
>>> +		 * Vout = 0.5 + ((R1 / Rx) * 0.5)
>>> +		 */
>>
>> [Severity: Low]
>> Is this mathematical formula for the MP2328 correct?
>>
>> For the 12V backlight supply, calculating Rx in parallel (1/Rx = 1/R2 + 1/Rs)
>> using R1=51.1k, R2=5.62k, and Rs=2.21k yields Rx=1.586k.
> 
> I calc it,   1/(1/5.62 + 1/2.21) = 1.586
> 
>>
>> Applying that to Vout = 0.5 + ((51.1k / 1.586k) * 0.5) gives approximately
>> 16.6V, not 12V.
> 
> It is correct, it is 16.6v.
> 
> According to gpios settings,
> 
> GPIO 0 1 to choose coonnect R2 and Rs
> 
> only choose Rs, it is 12v
> only choose R2, it is 5v.
> 
> Not sure how to generate 3.3v and 40v,
It's the comment that is wrong, the resistors in schematic are these:

-        *   R2=9k09 with optional series Rs=5k62 (5V) or Rt=2k21 (12V)
+        *   R2=9k09 with optional series Rs=14k7 (5V) or Rt=2k94 (12V)

The regulator configuration in DT is correct. I'll fix that in V9.

Is there anything else that I should address before sending V9 ?

Thank you.
