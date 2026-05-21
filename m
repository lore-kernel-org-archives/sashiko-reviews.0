Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F39368D74
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 15:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377773; cv=none; b=sBp6Y2Lcmx+L8iu9jeR9u4s5hbl8HZHBnqXeOQ1x9Ls078ISyMXK5aeRUNltXtZwPTeQzQ8+jt0/kDb0QsqwQNvUapgLSlBCvespdpmwzOuCI7PpgSEXoWuwm7L10tz4zPYf16O4J12RsC7MxviIjY5QEQsR2BFrpz8ZHxLboI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377773; c=relaxed/simple;
	bh=rGYF2CUBtEnyhzpYsNB5Y6dzRnLg4IpMqoZMJVYk+nw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxYOhZT7q6z61CsWnPIrKObUyzdDtadDVUKnFUnWTnRSZ9xDmw5S96P6HFOnMOKW6XCXob4erVI6fzV/ARcHfyZ7mzCGKRGI++9q9hHHsvLVXwBR2Ma6F4MmMW+5QgutDg616kOcNd1ahbFyMLA/CESVMWheF1n2wHJ/QnGBj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qew7UPNx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qew7UPNx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4526a8170ceso3093401f8f.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 08:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779377770; x=1779982570; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IWk6GQzhGW2RryhVAKkuT+Tv5fS5Q4uWu1yky+LSRfs=;
        b=Qew7UPNxQbIhNoY6bz9ANv21w1PnOhRriLCc5y9/Xx/AwXFEleO44KrBBQ8wbJMQSm
         k5d/fufiKk19VEmDgr3wjQq9tVxtNHBeOBwqYdALvti4fCGYfKBD05t7Gw8Z3bwMoX5y
         uSD+Ld3GLB8IuHjYj/6Frsr73VWhgHJN06ifr4uz8LOgIy+lLJuggmE7tRaDCOWDHwNb
         ekNoaq7AyfkI6+UYI7ONl8WA0uNTPp7mbtGzb6ULOmjmf/15xuNzjB8kEVRiX+n+xiBe
         4E2vAL9iJKhjBDijxdNnBbsq2xp/K9PFtpNtxuhSmQwW6GSz2ik1By0PI9UYaUAOnkjC
         CN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377770; x=1779982570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IWk6GQzhGW2RryhVAKkuT+Tv5fS5Q4uWu1yky+LSRfs=;
        b=Yxe1+QWCmFfYS1QgW4BH1y+NxCH0seSDY4mdHfFHlMeixUcJMr80ts9ci49b97I6Cu
         MOXnK5ZysKI/oVL8KoFZM6FNq5uuFhHlmdiZQz0s9Lq6LH/gvUc+/R8CjrVY2c2VAtmV
         g4q/Boog8TGSYto6KBxRLzZnZx3POGWu+G710JF6hfxdxAlVEX+Yy1+1cdL0p1TTozCD
         SnAdMQe5TdongZOhn24HTvneKOOkgGQrWL4UaFjrJi9VR2haFyyGzMAvR7YOBxRR5Cru
         SWB6UHXQfc6bOerSWRcenBhfcbYa9PXw5vbNM45Oo2ycS6+gsrZQlc+nNEwxXuqJd+N+
         MSXg==
X-Gm-Message-State: AOJu0YyRMM8J6Y9pl3XFkp6X2cZQGeHspd0DunFGVMD7+kUEw6z7JZyJ
	3iD5rTIP9evC+NVHLNx/a6OGLyAxSdxAQlUQp0B8cXj7gpdAJvwnad+rTy3dZOanXGXSPMRJe1R
	QbjOUtDo=
X-Gm-Gg: Acq92OGh+cJdHEU/geoUk6gcqqTR4eglhLHUC7IR9rSZ5pzW91m/OLYlIkewzuHaTW0
	gcL497jkZP/NrakY4+7Rf5+9VYavpl6t9+yRQygMvV2Makt2VJxJG/ZT6K7avNt1cwzYBE3btbH
	Z6hbOFWmCiWIuEeOJo3xgv8BS6uqrG8vV5UN0t5wqm+ysfUg5nc+MQv/J5q/RlpZ/iei3MjOYV0
	Oj5NTn5OiyO4sCPDHPbwmbJgzRsGUJYFN1gEEAyUPIzBssWisTplxvkQg3IqQZdIjHUsYwfv7Z6
	5DVI/n8WToIVcMaKsf7qYinn3Idr8kxBReQYNR3J/k2A4fHp6sgpKjzfrm3cRiJyY9CHC0H+kRg
	awRJcVg6+8Ht82/eoM49P9mSAnVzx5jPY3q4uo3x4/b0Ao62CGaSZhnWMEWbsLFHZ/qrPJFHVOs
	Kg1034B+B47n5CbipSogX//D7LVHTWmu8lnQ==
X-Received: by 2002:a05:6000:1ace:b0:43d:300b:2285 with SMTP id ffacd0b85a97d-45ea37bbfb9mr6086071f8f.11.1779377769950;
        Thu, 21 May 2026 08:36:09 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.55.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa93ce5fsm3749850f8f.33.2026.05.21.08.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 08:36:09 -0700 (PDT)
Message-ID: <634c0951-dabb-4505-ad52-4101a8ec0bbd@linaro.org>
Date: Thu, 21 May 2026 16:36:08 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org,
 robh@kernel.org
References: <20260521-x1e-csi2-phy-v6-1-9d73d9bd7d20@linaro.org>
 <20260521122645.3EF9B1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260521122645.3EF9B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/05/2026 13:26, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The schema unconditionally requires `clock-lanes` for `port@0`, which incorrectly breaks C-PHY configurations.
> - [Low] The example device tree node is missing required `data-lanes` and `clock-lanes` properties in the `port@0` endpoint.
> --
> 
> commit bec75335fd5214a065f090cefeb28f9c895cfd3c
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
> 
> This commit adds a new base devicetree schema for Qualcomm MIPI CSI2 PHY
> devices, initially for the x1e80100. It supports CPHY, DPHY, and DPHY split
> modes across three ports, allowing per-PHY voltage rails to be individually
> defined and required.
> 
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> new file mode 100644
>> index 0000000000000..c9116246c1e9e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> [ ... ]
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: Sensor input. Always present.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            properties:
>> +              data-lanes:
>> +                minItems: 1
>> +                maxItems: 4
>> +              clock-lanes:
>> +                maxItems: 1
>> +              remote-endpoint: true
>> +            required:
>> +              - data-lanes
>> +              - clock-lanes
> 
> [Severity: Medium]
> The commit description mentions the PHY supports both C-PHY and D-PHY modes.
> Since C-PHY embeds the clock signal within the 3-phase data lanes, there isn't
> a separate physical clock lane. Does requiring clock-lanes unconditionally
> here break configurations that need to use C-PHY mode?

Fair hadn't thought of that.

> 
>> +              - remote-endpoint
> [ ... ]
>> +examples:
>> +  - |
> [ ... ]
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                csiphy0_in_ep: endpoint {
>> +                    remote-endpoint = <&sensor_out>;
> 
> [Severity: Low]
> The schema definition above explicitly requires data-lanes and clock-lanes to
> be present in the port@0 endpoint. Will omitting them from this example cause
> a validation failure when running dt_binding_check?

Yes this is what happens when you ask the question "should I run the 
check one more time" and say no.

>> +                };
>> +            };
>> +
>> +            port@2 {
>> +                reg = <2>;
>> +                csiphy0_out_ep: endpoint {
>> +                    remote-endpoint = <&controller_in>;
>> +                };
>> +            };
>> +        };
>> +    };
> [ ... ]
> 

