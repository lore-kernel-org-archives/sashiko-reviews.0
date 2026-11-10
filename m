Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274584;
	b=jEKr9SZLH788/YF7z0A/lSFOWHCZ1MjhSPJxwLURHPkYnFOQeqN4KN0/PaYEE1kB/tWp
	 D55rYRhUJla+/S7THnYeYt6A+nCblx9xlHsrNVVG+W1Fx5FxYvr1OzP7SS0Pa4aslmIPx
	 Q23bh4OzW8Doft9WF7Vh0tXHM7pmNnkAJqfZhEc18gftQYYqHE6VJfdvCZxD2b9MC4cCH
	 0b0ec/hBxyfZpW9zJhUNdm7Q7fF1SBNqqWppYm8YK3P1cauzHxGLP7WIGkYqs+UM4eCUU
	 W1TUbWjBr3ZqRndIbHWOgFQIKaiIgIQfrDakhRi44Cxr1wWaynFuAbzTpTfAFQhD1Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274584;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=T4Ebh8dhdAtqQW32OzgRtdpRlNomsu9HMRNHYFGmf0o=;
	b=ZVgVuxVq1buZvHS6MtLRPAv0aMNnLghBBjmyWyRas7ZaOP6sxEt1UUiqSAaNjWdFVo0p
	 5hOGvDuiekJZwCkw9ksRruloZlhFqUcUvVDmsU52FRDCmw44HRoKD4b0yr3746oRdpHk6
	 BDzj509gi0+qnaaUcB1aEC2NT21Rv8x9U9jk7Gw1IZx53n2bAatiUFxIbKdAB6rMZX+q0
	 vRNI8QedwyHwFRykAMV0Avs/tmAR+qhmGH8N4DszHa/z5haFF6cVemwpyN1xYVcmAVYgP
	 WLksBqT5+CmC+lMYzoCeuebUYJqIC+wI8/DEGY8eSJqLobAo01ALqCGbMnVJUC6FVfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRfxedrE;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6CD606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 01:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A6CD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DRfxedrE
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso774429a91.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 17:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274583; x=1794879383; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4Ebh8dhdAtqQW32OzgRtdpRlNomsu9HMRNHYFGmf0o=;
        b=DRfxedrEZRdc5EGI9XC21YxIq9Ldnltn+ZfN4vBmYn2N7b5RZsW7tuT14HK2UPRoGP
         GCSlkdWgE8MhKpZ5TyYBR6PaeUQ/n5Rwsf1ZyI1CFOHHT6lUiN31iWUuCT6ml1fIgZMR
         1Hb7N9aHS5adb6Xw94/wYuqj3GNJ7ns0HRzBiyUSEMvSkRHjxFsiWbwyQci8B3VcQRFb
         PtfHtAAumpzzs+mG9HCBRTQMsu+6lLamzUipPpTxZhw+7uYL3fAX4PI1s6zhZPcTSDZ+
         SibLef9gcFVbbfrwjcHvRhGlex1P5QUBPMMw1WyY38y9HAcVU0OgifTjitjT3mjCq112
         +fQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274583; x=1794879383;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T4Ebh8dhdAtqQW32OzgRtdpRlNomsu9HMRNHYFGmf0o=;
        b=cB5w1zAsd/Jv7QNjBuD4RkVxn94zheWYAe3N25+Ukrnriq6Dx+1Lzidm8SsxJo7lYv
         4H3jMd7wzQqI/3r2E4gMJnUY7K2bvs2u7zYL30Ox+obrzVdh4KxmdXNTM7ZnyFk3x3ss
         ngNXspyGcuuf+MoyjwMj7Bnn0c2axhDVj3pSglXD6I2hDB4ofa+xe2s4DWkFlNIGsP3g
         bHNytilSC9KrwWwOPf7/5kIvW4w7fC319wLI4FRSGTboyEGMsVjYXpTQxt3pqgRrcpfd
         6ls6Yn457/EakVmFzU6PBPD2jvAl32LohQVOSjw1ANMojz5fdxb0h5twGZwpqWLT3dWA
         sPEA==
X-Gm-Message-State: APuU4Z8/TOJzxPIB+QBx8PIc6ahrDsAHtVg26aWXITzHSdtIOLvvr1lG
	5+RnIDSjkde80sm+sM+YvoOKmt5yHp/GvbCStxrGwkg6Bi/AreR0VrWhZgSGMQ==
X-Gm-Gg: AYBFou2ajKx1oKhxqLlB2gN8VGFR/UmPVvA6HAlPf8gDYYas5dmetQNouIZP1E7wpqY
	UfbsBTFG/tw1hBnxBIQW6KgbYasNnEIDk6iuSL0qfhrVxTGcD626/W6pcpzjgPbILE5qwg5DSOT
	c3CiXk3+zI6oTN+VFxqn8/e3xz3cQQn8ihS0I1wDr4zExxZLckA+Q1fwKWpBNI2lK7E4CWWf/7n
	yfwzmjQI5Pj9g7Svrn4iplPLsKlvC1uNPDLNc7mFXsavkNI+lI+VwpTOhxu4LuhZEuu7ikL4sSz
	rIMtMceblLux9NFH+jBR8nhfiKFtDw2mN2T6x+8Cnhq2t/ClKVPw0KAMfy7Bt6Duky2+a8Y7euZ
	4xll/G2KuqfF2GdEXvYh9o+SQuQnmGYMhJ6lsFgCRuT3WVpT7JzomjHI9K7Cpu7GVNZbiG7V+nx
	wMMtfs6wMtto3YIIyrYLhsOvoLlNfFn7cvX0EUUZYGIda20ls5PNPICJpGZP5pRcMIZgWiS2ZpR
	Ov5sii++DkpnYUfsiz/24R8UjdKaefaNkLnOQ2FiY1gp/zrvaN7UX979UMZQewbIwZYEOSWJ12L
	32GEeaDJ2+sqKGdYU8uThj9HICgOLjml5KMMfTwJHmKwXknQ0PBv4CMTYeeDX0sf0csncTUL8ZA
	A2ploxHBUKA==
X-Received: by 2002:a17:90a:ec83:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3b166cecc28mr1338219a91.58.1794274582333;
        Mon, 09 Nov 2026 17:36:22 -0800 (PST)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b594sm1694983a91.6.2026.11.09.17.36.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:36:21 -0800 (PST)
Message-ID: <84e38db6-ebd4-4b32-a36a-32f36bff3550@gmail.com>
Date: Tue, 10 Nov 2026 09:36:18 +0800
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
Subject: Re: [PATCH v8 2/4] arm64: dts: nuvoton: ma35d1: add USB controllers
 and dual-port PHY node
To: sashiko-reviews@lists.linux.dev
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
 neil.armstrong@linaro.org, olteanv@gmail.com
References: <20261109065606.62641-1-a0987203069@gmail.com>
 <20261109065606.62641-3-a0987203069@gmail.com>
 <sashiko-outbox-204536@kernel.org>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <sashiko-outbox-204536@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/9/2026 3:16 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] arm64: dts: nuvoton: ma35d1: usb@40200000 reg size 0x1000
>    truncates DWC2 FIFOs
> --
>
> commit aa9ff21b68491f1e002468f4d400c0d7fd2b192f
> Author: Joey Lu <a0987203069@gmail.com>
>
> arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY node
>
> This commit adds the dual-port USB 2.0 phy, dwc2 gadget, and ehci/ohci host
> controller nodes to the ma35d1 device tree and enables them on the som-256m
> and iot-512m boards.
>
>> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> index 7228ad4735b5c..72a1659207fa7 100644
>> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
>> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> [ ... ]
>
>> @@ -431,5 +439,62 @@ mdio1: mdio {
>>   				#size-cells = <0>;
>>   			};
>>   		};
>> +
>> +		usb: usb@40200000 {
>> +			compatible = "snps,dwc2";
>> +			reg = <0x0 0x40200000 0x0 0x1000>;
> [Severity: Medium]
> Does the 0x1000 register size for usb@40200000 truncate the dwc2 per-endpoint
> data fifo region?
>
> A 0x1000 window only covers the core global, host, device, and power control
> registers (offsets 0x000 through 0xe04), while the dwc2 driver defines
> per-endpoint fifos starting at offset 0x1000:
>
> drivers/usb/dwc2/hw.h:
> #define EPFIFO(_a)			HSOTG_REG(0x1000 + ((_a) * 0x1000))
>
> dwc2_driver_probe() maps the exact length from reg via
> devm_platform_get_and_ioremap_resource().  If the controller runs in slave/pio
> mode, dwc2_hsotg_write_fifo() and dwc2_hsotg_rx_data() access these fifo
> registers at offset 0x1000 and above, faulting outside the 4 kb mapping.
dwc2 register size: valid. dwc2 places the per-endpoint FIFOs at
0x1000 + n * 0x1000 (EPFIFO() in hw.h), so a 0x1000 window cuts them off.
The USB0 region in the MA35D1 spec is 0x4020_0000-0x4024_0000, so in v8 I'll
change it to reg = <0x0 0x40200000 0x0 0x40000>. I checked the other USB 
nodes
(EHCI0/1, OHCI0/1) against the spec; their 0x1000 ranges are correct, so
only this node changes.
