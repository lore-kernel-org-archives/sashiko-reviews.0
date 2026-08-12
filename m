Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5867420480
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 10:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529560; cv=none; b=TheZ1bzs9mO2x+M//kDhAepzr0PiPo7rh/jqTpDoCtZSvfgSdUknsP2LCWHRn1HZIZ613H3yhxauD3aNZR+TzUN9pg47M7UtQai/tGb/no0b6KBX28h7+U+Z3wNZaGgUWzxRuALsgGnMoBaSreB+MgLpBJa8GS2EhVzYP+vWp6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529560; c=relaxed/simple;
	bh=Wp+KCXl/9Sd/sHKEioy7KGvsxxLMOLNXrcwm2mdbkss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hl9Ke/vwRk7cihDHNKrFLHp2rQYXPAuBGgLOCq6mhszmEaUdjB+HeQIl1Gk66k0HwYZoFy6xboedRHgYiqoCatFsX4f6hvpLwEQAFaT1jpDAwIvbpni9OxuGYuWhIcLODi1aNxPL7NBsfzFPsh8HWBbUDfPL5nLdswavMb4xTj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=r19nPTqz; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="r19nPTqz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786529547;
	bh=ws1QevW2CKfm189wBavEIUlJVUwxIrfJNNc6cWudhkc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=r19nPTqzQdzb0ILjS8eobtsg/bs5bSRrvylNjVH1w8OeNViAQ9x4kX69BR1UtFmE+
	 V0VwbyRNLJwRVjAGMTZpBfzyqzEtqE4HhcW1kCBRu2UTFY4ZBdgXIhPNNS3MpXsNq2
	 SDwSBK8r2x0WzOVxx4stZg154W0EWe6gYL+FtHLo=
X-QQ-mid: zesmtpsz6t1786529542tb67b7ec5
X-QQ-Originating-IP: Jv92GOJg5tk3t6iiMZpFNGqPJfh0MNDLxIzFpTonAaQ=
Received: from [192.168.1.100] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 12 Aug 2026 18:12:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10968251938216443348
Message-ID: <018D3A1DC2C9ABEB+543f835f-ae97-4205-8a63-e2424465dd72@linux.spacemit.com>
Date: Wed, 12 Aug 2026 18:12:20 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] riscv: dts: spacemit: add USB2.0 controller nodes for
 K1
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260812-b4-spacemit-k1-usb2-v1-0-f28cf29e522b@linux.spacemit.com>
 <20260812-b4-spacemit-k1-usb2-v1-4-f28cf29e522b@linux.spacemit.com>
 <20260812095128.BFAF81F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Junzhong Pan <panjunzhong@linux.spacemit.com>
In-Reply-To: <20260812095128.BFAF81F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Mb8cCQMEnYyAxbVZcdwTLoTqWpmltj9ZrJrmgFHWWcopUazZSJzb2msv
	/pmzVaKNMYVDcQN+9VepEHi03qSjio2ywD6C0iTUgmCDbT56p1OsLyVjy4QI7rs00RC18/e
	lpGirHq0dZXDOYlbU0cZv7l7BXrAs479y14eY9juvAIhZCNKQh/PYAQsjx1f51jE+rnh4DC
	yfuftptj2ktCQ7yj06RkqxRq+gmL5JL4gQdbjHP1haQhH/LU6BZf837LqAztkCO5nJ6WVNa
	/clQpEYEJDmOFL1KbA1pqyoYhTOIpF1ySP/GzFRAOqJ7G+XgsqX3N6317cU+1nEH1+t6DLB
	8XpSuYbjQhAGKz/DOF/63YorDYPN55XLjvjV8FXVI/EoifrC7yNjtb6d5Oz/hniRAUQstn3
	ayLdUS8cqQhjpqdJMhqASIJkoc8X76xoDDVfw1a2PdxXfo4bQksT9RgFpIP1pHad0Im5JDy
	fpQ6gIXFqP66VRqO/5Mj21ph5wVf48BJkBUnzk4rrhUo8XKml9C8Wje8yQXfLQ1GELFNMGh
	8d7tvDzDqHFDbpJyUQI7zI9ppUhKJcjIj4dZXMg+ileSOK9JMO25Fukw/qOlQQiGJz5CQzs
	UcKkxSo9cBwDUSHfxOZHmDlT9ri9QUYBITPQedxkeXsMIhod35+zQFsN70SnpPqn33xHU+w
	hbPNKaZN+vFcPIu+E0aXHLoJv+zmygTc7XcYjjqQak5VynYQwuB1FRcIM13Jlf/P4Z/tG6k
	XooILZa1C4vvUcDUm12eLP7wCaKJf/CDCKrNwqqPMqVeMgDrDAAjudnXcACmLhQ98mgGN1D
	gVr0cTzWxqpReoWgB5Q+HyG47hXNZB7vLR6pXTlLjojKyKJXZXNdxuTPNi2FIqNYLHN35bY
	+CmaUm4AAlcMlxWh7NjN2a8rSsffiFZphKyfJAa5rnB25ekuzu0523w2tKmP/HQpw5UoZh3
	LUEA2RjNDG2yjNpgEc6nDQYTrITNGyEs47ITyJSGDMw39/a86ksv+X4o5IGR3DIKxdEr9Sc
	GtTcs8FX+RBer6E5wKYAUh/rh81goGNXf0jLjj3/GvZr6fbBb+wjCJ7+cQT8Qm/URxVMAMy
	w==
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0


On 8/12/2026 5:51 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> [...]
>> @@ -1291,6 +1307,30 @@ storage-bus {
>>  			#size-cells = <2>;
>>  			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
>>  
>> +			usb2_0: usb@c0900000 {
>> +				compatible = "spacemit,k1-usb2";
>> +				reg = <0x0 0xc0900000 0x0 0x4100>;
>> +				interrupts = <105>;
>> +				clocks = <&syscon_apmu CLK_USB_AXI>;
>> +				resets = <&syscon_apmu RESET_USB_AXI>;
>> +				phys = <&usbphy0>;
>> +				phy-names = "usb-phy";
>> +				dr_mode = "otg";
>> +				status = "disabled";
>> +			};
>> +
>> +			usb2_1: usb@c0980000 {
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but will these new USB controllers
> fail to perform DMA operations because of the storage-bus node's dma-ranges
> property?
> 
> The parent storage-bus node defines:
> dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
> 
> This restricts DMA accesses to physical addresses between 0x0 and 0x7FFFFFFF.
> Since the system RAM on this SoC starts at 0x100000000 (above the 4GB
> boundary), will the kernel's DMA subsystem reject mappings for data buffers
> or descriptors located in RAM?
> 
> Placing these new DMA-capable USB nodes under storage-bus seems to guarantee
> they will fail to map memory.
> 
>> +				compatible = "spacemit,k1-usb2";
>> +				reg = <0x0 0xc0980000 0x0 0x4100>;
>> +				interrupts = <118>;
>> +				clocks = <&syscon_apmu CLK_USB_P1>;
>> +				resets = <&syscon_apmu RESET_USBP1_AXI>;
>> +				phys = <&usbphy1>;
>> +				phy-names = "usb-phy";
>> +				dr_mode = "host";
>> +				status = "disabled";
>> +			};
>> +
>>  			usb_dwc3: usb@c0a00000 {
>>  				compatible = "spacemit,k1-dwc3";
>>  				reg = <0x0 0xc0a00000 0x0 0x10000>;
> 

I am pretty sure this would not be a problem. The SpacemiT K1 have 0~2G as part
of the system RAM, the default dma mask of these device would be 32bit, and there
is swiotlb would help with the mapping of high memory. So the DMA configuration
correctly works here. Thank you sashiko.

