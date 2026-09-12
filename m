Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6241B3C1D67
	for <sashiko-reviews@lists.linux.dev>; Sat, 12 Sep 2026 11:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789210952; cv=none; b=e/Zxt/nuDzRaYYFT3+Xg+OZ5QrQBT28+C8uivDOWzZy9iPC1QfCJq+AIc3Ew7qNXZg90WmyJoOAawTwUONXueNkPUO2h+JH9bPYRVBaJuYNHwsHuE1ThVbr99tM4jgAeZOIWjsgGS6tf4SldXMALcvNNJvLTUUU2XewwwRoEic0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789210952; c=relaxed/simple;
	bh=6D8tm6JVnV49Wc4HiQ2KJYB99HHllQBm9FljOEs9rNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZxBF9+ck/sd8wZBjrSvPnAR1Xfp6LRWDzEGYoSyrvd1aA1pp1ZzQZFZlooMJ1aEuqYBxFGEjKKPonMkKRbMSb6wqsNo9crpvltBBuq6EFy75y1yYDxfDgnsQUZDmbFFzu0I35moc24mX64MQjyDFi3TydxIiA65vK3+Md1LNGXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVkrrb0S; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVkrrb0S"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so624914a91.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 12 Sep 2026 04:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789210951; x=1789815751; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M5LuP0pAQuf2bi/QiOEHOd5Tvm82nmh6zdwhe3gPFHE=;
        b=GVkrrb0SnArSeCfLC6wfHm0zogP9+6Ll41d7U3RLMLtexTCWpcWox34wOxLGOdHUfc
         F+jJvgllDxDHhIjgnjW8/atVJg8MjFhPN9sBTuEuF3WcfOvxbnD1TuScHKP9kk1JwW0s
         27k03ptGrDkBn172q/Q+ejblySxNccGuKHEfbYTQjzkFPOd5u5fDPPL51yDcve8wCNqB
         /wjR6hwmVfBjUckJfoS1hRS/Xrl386gL8mXU95nl4dH85Ws8TqdUVMgVSHVDFU6VSHPy
         Uws1e7F6vHxPt4/eI+y/ZTe+1TlXcmJE91Ud/NqOdEjxZPq1aTs/eDQbn5n0T+DQuX5n
         hRng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789210951; x=1789815751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M5LuP0pAQuf2bi/QiOEHOd5Tvm82nmh6zdwhe3gPFHE=;
        b=FsGkoLlcqYHR7GHQShtyL3p/963qH0vxxHflF2Ekw/OcKgxgqeQ26hZc9G50EBITM2
         Gy0ffdhu/CJI+hu+5IXHxCXEkpOKIlVVTvjPPtNB019+3dfo0//vemphUimYGv5VhtRu
         +eZXHnM/HJ/HsgQAvJL1vGU15KbBKH4KzoyoeIEA7tfQn4lBKa2mrfpZvmxQ6okVO75L
         1iURsLCGXrN3KA1j3hftFA5+vZnf3kaBeTsth780nw0lbFhCi1qqLNjwt0pxO/Mkr5Rn
         FjyHRR6TxDF7V16qV1TEIte1cf6r2FeWP+norsITJ1r0h7GyHZu9LzNMwCSS5g8PJdm5
         v3/w==
X-Gm-Message-State: AFuF++lIhIGq6fDaCXrDXmHGnxUOeW3Ao83Iu353jyE3k/5g3OC+b8vm
	fCdeDQ99tdw8zGL/SWbpOzye8KjXBREGqNlFf9YMvnu5BY3LFmVhOQIAc5lsiw==
X-Gm-Gg: AYBFou3RLDjne4q5GwzjSizmdiGwuHAIcN10XZzTj1CzWiCRT6i8ddSMtYHnZBl8jJD
	5GTOOHbEXeqTfsswqVuNM/uQgaDo8IFA9rIQJ+o8RcsfAg61KXWumuQANupwQrW2XT/Zi1lPI2v
	8BpuOcoA4f1Gb6q/x/3n3UYdyaoaWP2BvqtA25tBve7B5ywH/vRiaWEtWtuCZ2f0zq5OSb1upj1
	mhFwn6KaZ2lZRLSh4fyYPFxXpY3Qz/2UbF/h6cjCI9w3aaVcjBcDOm/bxYFwyBu3NyDZM8jbF0n
	zkFEUvXI6xsZm2LOu58yWpOMA6okb9c5uYKerPYBCzG/P5d+7GzbbtZuCXLUBPfMKIgH7X41K1e
	p44qE0POtofDghUsKn0sYCgH8C/p+Ie4JnC1X52xGBT64PIIM1RY98LCeRoCeWyVz8fb6b3T8Oh
	ssT3JTgYqoz5dnUHGeHyVeVl9EBBr6ZAk3UlSN/Ev5LslMYFpiLX+Ug9az77CgbxzxEvDU/G71T
	JZTGJdrQ4/E71SVqkjau0Ks0gk/13MYVPn/Bu8o8jjE1ghciW4SgSqh
X-Received: by 2002:a17:90b:3850:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39d9c36187amr13612799a91.22.1789210950751;
        Sat, 12 Sep 2026 04:02:30 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm9521600a91.4.2026.09.12.04.02.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 04:02:30 -0700 (PDT)
Message-ID: <bfc92b12-5067-46c6-b1f9-0dbd42fc9470@gmail.com>
Date: Sat, 12 Sep 2026 19:02:25 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: sashiko-reviews@lists.linux.dev, Zi-Yu Chen <zychennvt@gmail.com>,
 conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260908014526.413399-1-zychennvt@gmail.com>
 <20260908015435.7DE071F00A3A@smtp.kernel.org>
 <853110ab-1bd8-41cc-9b82-cc28002c0bed@gmail.com>
 <20260911-frisky-imperial-elephant-3336e4-mkl@pengutronix.de>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260911-frisky-imperial-elephant-3336e4-mkl@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Marc Kleine-Budde 於 2026/9/11 下午 01:56 寫道:
> On 11.09.2026 10:15:21, Jacky Huang wrote:
>>> [ ... ]
>>>> @@ -244,6 +244,58 @@ gpion: gpio@340 {
>>>>                         };
>>>>                 };
>>>>
>>>> +             can0: can@403c0000 {
>>>> +                     compatible = "bosch,m_can";
>>>> +                     reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
>>>> +                     reg-names = "m_can", "message_ram";
>>>> +                     interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
>>>> +                                  <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
>>>> +                     interrupt-names = "int0", "int1";
>>>> +                     clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
>>>> +                     clock-names = "hclk", "cclk";
>>>> +                     bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
>>>> +                     status = "disabled";
>>>> +             };
>>> [Severity: Medium]
>>> Should this node include the hardware resets property (e.g.,
>>> resets = <&sys MA35D1_RESET_CANFD0>;)?
>>>
>>> Without the hardware reset line, the bosch,m_can driver cannot perform a
>>> hardware reset of the CAN controllers during probe or interface toggles.
>>> It must rely solely on software initialization, which can fail to fully
>>> recover the controller if the bootloader or a prior crashed state left
>>> the hardware in an unpredictable state.
>>>
>>> This omission pattern is identically repeated across the newly added can1,
>>> can2, and can3 nodes below.
>> The reset property is optional for the MA35D1 CAN nodes.
> yes, but....
>
>> The bosch,m_can binding does not require a reset property, and the
>> m_can driver obtains the reset control through
>> devm_reset_control_get_optional_shared().
>>
>> The MA35D1 CAN controllers also operate correctly without explicit
>> CAN reset properties in the existing platform DTS. Therefore, no
>> change is required for this patch.
> ...we've observed that the SW reset doesn't clear the CAN state and
> error counters, see commit 9271d0ea07c2 ("can: m_can: add support for
> optional reset") for details. As your SoC has a reset line connected to
> the M_CAN IP core, please add it to the dtsi.
>
> regards,
> Marc
>

Hi Marc,

Thanks for pointing this out. I agree that the hardware reset properties 
should
be described for the MA35D1 CAN controllers.

Zi-Yu, please add the corresponding CANFD reset properties to can0 
through can3 in v4.

I will re-review the updated version.

Best regards,
Jacky Huang

