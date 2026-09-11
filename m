Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB873D6CD3
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 02:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789092927; cv=none; b=GMA0RBGYtEUIoKu12ccowknqXzXsgMtq5gZ9/hOf3SYmh/ip9rESnSzM7nQFz6AyFWI9crRy97Oq/Y7bGUVJioWDPDXRhW3xiF+amfg6J0LS0J4d28CfbIZC5j7evq9UwtiTOWNxBHeeCc7yW4irq9OBCye12qEIc9jwVYnolyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789092927; c=relaxed/simple;
	bh=c5/c/iuk1PLNOXDE+ezMovGNa06OcIGGAi7k0LM2HDs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6sjaoJm+/5BVHySzAW+I3dkTujYETIRwQBbavXiIrOKuVwJSywn4fDtPCr7HVqNL/ejN6VLt+btHgmNAYoW1uSUogvKxOqZZPNcE2P1HEzksed+RWX5oqYCOKDEtrNThRDJaWbMsRprz8q3OWRzm7X7hOyw33Sox0ILGanZZKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9D5LLb0; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9D5LLb0"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-853c07a76adso433794b3a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 19:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789092925; x=1789697725; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bx9ZpFS+OPzNWA2YRAzKII3GvhLYAanR46+NuPP9i20=;
        b=E9D5LLb00OOu9DESay9UZEf9QFryNsamwWOego/x1NbFQjFN21R7s61EWN1C+SMppG
         i8ABxJPPcg483UA8CHFOIo+TGorn+mL/12HVIahtPAZqHmbm32rWv5BLJWSkbQ+aIoDK
         ncBx+aS4BSw3HYVDZv2jfGgpItpjlM/9Yg7nRbkrzJdrXSAR+WvaFH3kzYpxryFfgLQ/
         gIBrBAIzXiM/uAhQMYPLWkq0CniY9rs6iERLrG8ogzaic/4D1O1M3eBH5tWSOWJpbHLa
         Py2ST1ZbSpCLURRisDhQ7lo82VzQItbBbFxaJI85mS7i79+slD2OLMLrUA22i75635ik
         IL1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789092925; x=1789697725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bx9ZpFS+OPzNWA2YRAzKII3GvhLYAanR46+NuPP9i20=;
        b=RH446Ffab2nM4jSZ5YmPkcpeHbmjfBqu3flYihzXJS41xnbckcYkaeNG17OsnWVvDu
         bftHBxYHB07L1w97dRN4dCi3drYdyLZXIBWRbiLpcrOTamPaE9Uq+gb6vDnD2pePYdFW
         ZYWDgm4Ge1tqTeRnoe5rCYgdqJuhZeyOWSnyuW7D+JuyuGNEx3SCuGgTocfrp89o3IiK
         mmy6p6ZNU6Nm6BpVcU9DHUcX4DegpXRYSGqpLfoKhAOeaNdOVRnYPPKuT/NPFYhVdc5V
         lc0VWrfmyc9Y9O1OH0o41NhEo8XYmuY//NWAyQ1rn6l0IsiFidaJDuqrUuPwM9rs4xc0
         Xs1Q==
X-Gm-Message-State: AFuF++mxSOSxe8iZNvaCsB3OjQ2AbWkLPvaeOTWChx3FqM7Yml8S0w9b
	UYrJBGlzvfIhVb2UG5LlbpF18VPKHBQUSjGgE6MdQu8tGldep+7irnbKhv24tQ==
X-Gm-Gg: AYBFou3kUV2FIWcFzf9gr9hgLTnXJdAb4An7MJsQlFlBuv6gsdUmndt0RUH6qca4HWA
	WnQR9B90whQ+aoL9DfkKg7tsTOhg4Y0M3yd4lOBbf2hiBUmzYh5QvNxMnehT0dC3QCuAgJ0Z+N4
	6OJKwNruujYvY4BX9YKJ/1zt8ZlsJHKgFp548QIypb6euJWewvIuzb81v6P+n66Javezh0lLpLH
	vxDKqE/JFPBNnhOMTMpRh30h74L2UH6sp7suQwkTtVAsat8Etn20Q1bQxVQL+weNgf55mjQzoKh
	0T5a1alvnZvHuX5lyKZPlyYortODhrxHr6ow8g7muiXGeNoExQjNAvTIAF20IHlyM2BZu8rahSA
	K8D0Ik+7pccnEyEvCgWdeKtj0lOO8Vq4dvAOu5I9DC/fV2cVBCw5l8A+d3MTvXNtdoVy53iDftO
	SyFv7L0OvAjDvumGTXRVuZAI26LfrXRAuXZFYq6rUrS0bMVwsNinOeD8DSN9T9SusGzs+dNv9r/
	FH3Xa3sD8bC6R/L7zITNn0fecTP2zvzjukej3EX41X1mIvRhOL5NrkAKb7XnWVbjX8=
X-Received: by 2002:a05:6a21:600c:b0:3c4:1c9f:d7e with SMTP id adf61e73a8af0-3daed14cf94mr3362546637.6.1789092924990;
        Thu, 10 Sep 2026 19:15:24 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c652aa8dsm385498a12.7.2026.09.10.19.15.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 19:15:24 -0700 (PDT)
Message-ID: <853110ab-1bd8-41cc-9b82-cc28002c0bed@gmail.com>
Date: Fri, 11 Sep 2026 10:15:21 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: nuvoton: ma35d1: add CAN nodes
To: sashiko-reviews@lists.linux.dev, Zi-Yu Chen <zychennvt@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260908014526.413399-1-zychennvt@gmail.com>
 <20260908015435.7DE071F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260908015435.7DE071F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> [ ... ]
>> @@ -244,6 +244,58 @@ gpion: gpio@340 {
>>                        };
>>                };
>>
>> +             can0: can@403c0000 {
>> +                     compatible = "bosch,m_can";
>> +                     reg = <0x0 0x403c0000 0x0 0x200>, <0x0 0x403c0200 0x0 0x2000>;
>> +                     reg-names = "m_can", "message_ram";
>> +                     interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
>> +                     interrupt-names = "int0", "int1";
>> +                     clocks = <&clk HCLK3>, <&clk CAN0_GATE>;
>> +                     clock-names = "hclk", "cclk";
>> +                     bosch,mram-cfg = <0x0 4 4 32 32 32 8 8>;
>> +                     status = "disabled";
>> +             };
> [Severity: Medium]
> Should this node include the hardware resets property (e.g.,
> resets = <&sys MA35D1_RESET_CANFD0>;)?
>
> Without the hardware reset line, the bosch,m_can driver cannot perform a
> hardware reset of the CAN controllers during probe or interface toggles.
> It must rely solely on software initialization, which can fail to fully
> recover the controller if the bootloader or a prior crashed state left
> the hardware in an unpredictable state.
>
> This omission pattern is identically repeated across the newly added can1,
> can2, and can3 nodes below.

The reset property is optional for the MA35D1 CAN nodes.

The bosch,m_can binding does not require a reset property, and the
m_can driver obtains the reset control through
devm_reset_control_get_optional_shared().

The MA35D1 CAN controllers also operate correctly without explicit
CAN reset properties in the existing platform DTS. Therefore, no
change is required for this patch.


> [ ... ]
>
> --
> Sashiko AI review · https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fsashiko.dev%2F%23%2Fpatchset%2F20260908014526.413399-1-zychennvt%40gmail.com%3Fpart%3D1&data=05%7C02%7Cychuang3%40nuvoton.com%7C0f6b077d07ea424b0be208df0d4c30cd%7Ca3f24931d4034b4a94f17d83ac638e07%7C0%7C0%7C639244293026922482%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=mOpnaGY2o1KYf6Z5OXNovFUJbA6M5WauNCVif8Ihfn4%3D&reserved=0
>

