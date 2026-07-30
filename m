Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68E426D4CA;
	Thu, 30 Jul 2026 20:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785443566; cv=none; b=dcKzSWqAZvdMXlS0EdTR204GS+hSWEWHmOt1KlLFIdsfxzqoqY7m4LY9ZGJVK6Klr6EwJ/C80nuWtDX072cWSUJlDVm444H1RTvSKKVSx60UM4natshyATRdmOzd6sk6fIvxuVVMDs7ZG9xQu0+uE5gNrYFcVhHMYCS8JAjEbdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785443566; c=relaxed/simple;
	bh=G6OoLDIpfTYhM7nnmdyNfnz//0GpK0BbPJwedNT0xSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O69OkiZyjhdIDw7R3bOVE6+B7I2vQXWzJhgmMMyTxPI0Fb4sQyLsS/5YAwh7/kHjhXW4XMUcz83sqfywsHVqbAfOWF2GHjRrxPIUrqKRwSmSVYlloWvhCrKMgarlTLXepd/jOXp3CehiSZLIwJyx6E7+BPqkJm3vGFSpRVwO0GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=fN2Tm7kv; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="fN2Tm7kv"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD92D11B93D;
	Thu, 30 Jul 2026 22:32:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785443548;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=s5YXXXOIgXGXU8drugZtHBphjWURHJXpVj68T2X7UAU=;
	b=fN2Tm7kvpTvIMD8pFOnd74Xv0zd1ZVEzuXYAPHA0kxhQCFhQ1CJiyphd5FwRd6nBGGteFW
	631B8wJ5nyMNB6iY2AaTdCIt+MscgPxaQzMY3+HCJl9OogEo5mYi7QpoXZfxq3SPan7gRa
	laHLKzyl5slyaBIKuJ1nz0oKeMV0suR8ax0PdMWwOkS41wSIgbiZk3pQsBua9o/T1wDX2I
	Ex+o1A1spHYoJlu/mikncxlctzXt40vcVm0Yr8R41Qusho/xl/48aDVt7Qnhf4/YVrWpbl
	blmjgpixer6RzHbQeVLe3B310f3kXVNlDPW4lQ4ZzI9nD60n35Cw+O++UqvPFQ==
Message-ID: <9ee6dba5-1733-49f6-b6a6-18dcef62ed2f@nabladev.com>
Date: Thu, 30 Jul 2026 21:14:39 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
To: Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
References: <20260729214723.557461-1-marex@nabladev.com>
 <20260729214723.557461-2-marex@nabladev.com>
 <20260729220634.9AEC31F000E9@smtp.kernel.org> <amtuQUa0aPGdlRCT@SMW015318>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <amtuQUa0aPGdlRCT@SMW015318>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 7/30/26 5:31 PM, Frank Li wrote:

Hello Frank,

>>> +&backlight {
>>> +	power-supply = <&reg_panel_bl_supply>;
>>> +};
>>
>> [Severity: Medium]
>> Will this result in the wrong GPIO being toggled for the native i.MX8MP LVDS
>> interface?
>>
>> The shared imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi file hardcodes
>> enable-gpios to &gpio3 0 and defines a pinctrl. However, the native i.MX8MP
>> LVDS interface uses the IO expander's &gpiowifi 0 (via reg_panel_bl in
>> edm-sbc-imx8mp-lvds.dtsi).
>>
>> Since this overlay only overrides power-supply and does not remove the
>> inapplicable pinctrl or override enable-gpios, won't the backlight driver
>> toggle the incorrect baseboard adapter GPIO pin instead of the intended one?
> 
> I am not sure what's bad impact to wrong toggle enable-gpios. need check
> this,
> 
> change exist ones to keep consistenet, all use enable-gpios or power-supply.

Maybe the AI is confused, that display works, I have it locally.

[...]

>> [Severity: Medium]
>> Will this clock configuration be silently ignored by the clock framework?
>>
>> This overlay (and several others for the native LVDS interface) defines
>> assigned-clock-rates without providing or inheriting an accompanying
>> assigned-clocks array.
>>
>> The base board file imx8mp-data-modul-edm-sbc.dts does not include
>> imx8mp-nominal.dtsi, where the assigned-clocks array is typically defined.
>>
>> When assigned-clocks is missing, of_parse_phandle_with_args() returns -ENOENT,
>> and __set_clk_rates() silently skips setting the rates. Should assigned-clocks
>> be explicitly defined here so the panel clock frequency is correctly set
> 
> This is most like false alarm. But for better read purpose, suggest
> write whole group property
> 
> assign-clocks
> assign-clock-parents
> assign-clock-rates
> 
> Incase some change order in soc dtsi and forget update here and cause
> wrong.
> 
> I met similar issue before.
> 
> the similar case is clocks and clock-names, should appear in pair at
> every where.
This is the result of deduplication that was requested in V1->V2. I 
think it is fine to keep it deduplicated.
