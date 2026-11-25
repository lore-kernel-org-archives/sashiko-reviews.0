Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643510;
	b=kRi9vl6LVXi/5awPrhksvzz7+0HWS6rDAnAkhgf9yklnePcdP3RtpldYvRy7XXSvqlAS
	 egIKZIoWT9pqEVZn0027jgxwo/yWyGQ+l4OzJj+cxmGHBUDwI/qQKOE+CmqXYuBnyedJ8
	 qdGYufy+iw6AW4vm05q0+3as88uoq/GtNeHn8toyGowvPe3jMtqmooPNUQkt041JmW0WW
	 SjqWRe1vRXKDpYtHDRzx3DCnQzKvakgI13uA+GwZH3XgsOuMlwQe86kFjfZUVEdBO4C/X
	 1l6BhWkh+KgLTiJZD39s769b1mjALDesjb+wUXQt0vFiPJ3DYb1DCcF6gzQXTA1xfsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=rbSy8/naK9NpKBKilS5D0FxnjU7qPGsjWJMaC5SsXmI=;
	b=GYC6eMhdfd/OY6lGJasTUzDvM+pl+zLnOkQjVBRxYRz6JQp67LMc/HxBZHJHQ9N83Muf
	 6lfDpILBIOnL3uzFLzQIerjOMti7RXm+oxwtMPqOIkS+JYsMbLJzDSxihGUXnbADhzVVE
	 4pA40XAublRE+GS2TuTZbtaHEjYNWktGznzd3iwRnD/zEOUXxoCFVRdsDXfXD6u3u+88Z
	 7wxbC7J+4OnWW3DehgkA6l7PWiGvCjmsjHAjbXwwt5MUySDemYtVsBFy1dtAMh4Ptjx+9
	 Uxl7epJ7nP6DIR71gR62m+PDYSvKXmtcYQcjrTVaBaqTvUaeFIj9D42l1rR0ZZ3FT7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=bJBt59kW;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7F5606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 21:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B7F5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=bJBt59kW
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-716b58a4365so3579223eaf.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 13:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795643508; x=1796248308; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rbSy8/naK9NpKBKilS5D0FxnjU7qPGsjWJMaC5SsXmI=;
        b=bJBt59kW5whYQ6qXqrvf7id3Toy2uQaDiUvUUUwLTCjRmiOauJ9bMH5VhtWqWDEkG/
         18o5uZxmdy3WlCDzHYKvAjZgB5HfMebx5NwplaZBG7e4SbkjwEih/v+94/DVi6I4EO2m
         e9hAU7iP253XXPhxae672K+xylgau5iFz7qZUK6tg5P7mFdhivXdCPZvvHeQl/URY5cW
         L9wlpQvuu5bR03/MJlGo5zeBAbVy0+OylPKFXUoXvtspD6eY8LKS0/J2b4iJk+GcZ1J8
         /22tICh4Q/ugRyyc2K0k9OwZldm2cLxOClR7FEc7qxaf6+8mwxM92W4JJNo6SyjloEUL
         ro0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795643508; x=1796248308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rbSy8/naK9NpKBKilS5D0FxnjU7qPGsjWJMaC5SsXmI=;
        b=s3zmvcFRRtnrKnY0iu9HZ0QuIZWet6WCC8G4A3Ezwc7TALbsBEpYEXq/4EJxzxFHqZ
         CEZBVHY+kFkI/n/P3/yQbL1NZjw3/qQpTREJn2M9zjtxWYzu1ZYpiqDRGHfJrnDxVUOS
         xThU2XL13i5K67pKsCFk0nVGKh3V2TrbwEVFCMPrWi+b32Bs0GREKNAFKplJBn3JNEsA
         0IZ5SaSyqm38WRO34kCzYUYwWjiQC6A8/YTNZ0H1qBLNQG+ih0LzAEcHC2Fld96aDCsM
         CT14y/eDByTeGQ6hHc4EDGkTr/7i2a58Ou8KeLR/k87EojJNQi91pLJPq+XzUjX3ONdF
         giwA==
X-Gm-Message-State: APuU4Z/1NfxSyflYzb+yX/0wrKbBNy8UG3qLfk/FhJLySwuucGfFY3yp
	J6ZCwOQs2XfQcQdznhwz3gtEbl7n9DYgCBm19MmsHCycxaYQmtKLZAmUaboCu1fBxZQizgUoy7K
	vD+a/4fo41A==
X-Gm-Gg: AZFdTZed+ImDVTdIOPndj94cm7VVxAcFf6/RFWdCop9HUXV+5fn/IDWi6HBE0ahvKum
	fFxmq8Kbk/YoQvm/9hAYK8ViknEDSgrL19wI279eRsXHK+PXAC0VjlZx4/P41VYjssF9eMknbhR
	ARkvZ+W8fagrvCGbDur5bLMeBCHMooUZuWz/F7sP2kIHn7Y/ajYhlochzgBQm89LSMnKuObIzKT
	ycNBH8gkQhpi4H+n2fReTpqYF89NgLU3LjwVT4ArM7IRusQy3H57VbDdmCt9h5brbS8rZBZUHJU
	S4Be/F8wCw2E3yP4ojFcknmdRphRMLAoo9BEUO+UFg01ctz7EGnlrSM/9Rd+PKViR6XcTu+NoqA
	jsEDcPKHmDKQYHZa1/AImAoAgRG2ujK0IdALrzEGW199kwbO148GaRBtNRyJxmP8vAvdhoeacqs
	8boA3G7o5acuOLTCrF/m8dwv3UMrzb/KU2q7Br3FxgyEsIJnz+p9NNK+PAdW5ODBLFlCJ8sr3Vt
	v103pd5LinmqTY1dZm3+nhB2562BaTTOFiJKF9qpDjnAFBLdsYp/tmmY6e6bG82+9LL10HMcR4l
	AdHmJCUgb0RbHnyALbTEx0QdnT9Dz+0y
X-Received: by 2002:a05:6820:1391:b0:71b:8969:9d1d with SMTP id 006d021491bc7-71b8969a594mr465740eaf.31.1795643508188;
        Wed, 25 Nov 2026 13:51:48 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b38015c46sm12670866eaf.4.2026.11.25.13.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 13:51:47 -0800 (PST)
Message-ID: <d5abcbbb-e533-4a44-a26a-1ca17e37d7f6@riscstar.com>
Date: Wed, 25 Nov 2026 15:51:47 -0600
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
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: add TC9564
 clock node
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org
References: <20261125202141.1288493-1-elder@riscstar.com>
 <20261125202141.1288493-4-elder@riscstar.com>
 <sashiko-outbox-234134@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <sashiko-outbox-234134@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/26 2:28 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: qcom: clock-25000000 under pcie@0,0 shifts tc9563
>    port indexing
> --

This was a great catch on a seemingly unrelated problem.

I will consider how to address it.  Off hand I can think
of two options, but I'm sure there are others:
- Move the tc9564_xo_board *after* the downstream ports
   (after the end of the pcie@3,0 node).  In this case I
   would add a clear comment in the DTS file explaining
   why this is necessary.
- Make the logic in "pci-pwrctrl-tc9563.c" more robust,
   possibly by skipping nodes that aren't of type "pci"
   (or possibly "pciex"?).
I think the second option is better, but I'm open to
other suggestions.

However, at the very end of this message there is another
observation that might make the above moot.  I think this
clock node should probably be defined closer to the root
of the tree.  I'll verify that and will fix it.

> commit c4e2dd0c5c7aea169ea475dfdf59cb2e475d33be
> Author: Alex Elder <elder@kernel.org>
> 
> arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node
> 
> This commit adds a devicetree node for the Toshiba TC9564 clock and reset
> controller along with a 25 MHz fixed-clock node supplying it.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> index 682bcbc0b466b..b327f64885ef2 100644
>> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
>> @@ -890,6 +890,13 @@ pcie@0,0 {
>>   		pinctrl-0 = <&tc9563_resx_n>;
>>   		pinctrl-names = "default";
>>   
>> +		tc9564_xo_board: clock-25000000 {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <25000000>;
>> +			clock-output-names = "tc9564_xo_board";
>> +		};
>> +
>>   		pcie1_switch0_dsp1: pcie@1,0 {
>>   			reg = <0x20800 0x0 0x0 0x0 0x0>;
>>   			#address-cells = <3>;
> 
> [Severity: High]
> Does placing clock-25000000 as the first child of pcie@0,0 shift the
> downstream port indexing in the tc9563 power control driver?

I think it currently does.

> Both tc9563_pwrctrl_probe() and tc9563_pwrctrl_parse_reset_line() map the
> direct children of the pci1179,0623 node positionally to TC9563_DSP1,
> TC9563_DSP2, and TC9563_VDSP:
> 
> drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c:tc9563_pwrctrl_probe() {
> 	...
> 	port = TC9563_USP;
> 	for_each_child_of_node_scoped(node, child) {
> 		if (++port >= TC9563_MAX)
> 			break;

If the second option above is chosen, this function
should be updated the same way.

> 		ret = tc9563_pwrctrl_parse_device_dt(child, &tc9563->cfg[port]);
> 	...
> }
> 
> With clock-25000000 ahead of pcie@1,0, pcie@2,0, and pcie@3,0, the driver
> treats clock-25000000 as TC9563_DSP1, shifts pcie@1,0 and pcie@2,0 into
> TC9563_DSP2 and TC9563_VDSP (misassociating per-port settings, reset
> GPIOs, and the integrated Ethernet endpoint), and stops before reaching
> pcie@3,0.  It also violates Documentation/devicetree/bindings/pci/toshiba,tc9563.yaml,
> which only permits pcie@[1-2],0 and pcie@[3],0 child nodes.  Should
> tc9564_xo_board live under the root /clocks node instead?

The 25 MHz oscillator comes from *outside* the TC9564 chip,
not under the upstream PCIe switch port.

For this reason, it should be defined somewhere on the board,
not within the TC9564 chip.

I will investigate the right way to represent this and will
correct it.

					-Alex
