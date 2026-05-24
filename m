Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E2F1F151C
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 10:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779620358; cv=none; b=ueev7XZ1Cz9K1wUntVoQEvCQuV1VeP5xVlX1YJ4oqH/REqGb9sUeMU421sOlfydqvI4k+Cdn/T5MNpnGxD7QdupQC2J8/Ly8pRyByDpZn6gPtr4kTCSNs3+7Sy7a06Dwur6abDAfDL8Q7u/oguHhtUcxhziADI9SF72BmCuXVNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779620358; c=relaxed/simple;
	bh=qbAAMj8v0Vzlk6IsntMTRvq/WtpyYsXlahFNXLVZADw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qlMWrmZClcMO6vLRuX+LmCHleIKM8T/i+fvyqJ5kAXOvQoYKOeseI5d37T9NdW2WDK9hJrNbz5BmlEETvinTKj6oupJ6xNYKuT9NSH473c6RadX4IwiiuJV9fOMp1n8eahxPrqbhFCp+QfADU8oyYagsLgdbbn+aXbV8RVNjy9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WmzYFGqu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WmzYFGqu"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48d146705b4so92614765e9.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 03:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779620355; x=1780225155; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7s/WuWNL9ddRgnnG+HfLCLif5sg1VJxBqglIWP1cQXQ=;
        b=WmzYFGquwgebhcgWdxSOOFxq62hNOGZ1RA4anQeGpa26DhkyFiP9CtEbYcXV082l+l
         ZphFlNKOCO1sVp03xUf7PjpjenEEzJ9Gcv7MrLXxI87Pue/+GgAJL8acP7Z5Brt/F5Z3
         BgRAcJk+pqoaVZRSjxkcuYGor66bNTj2FlDggc07Q8diLmuvYK4y3mPZHT/FQyl25YH2
         JIismhxsAFkoLkNYn6rVQ72YNkC/rebJNX62U4hUKludBlUHEkpiTWwem7xyQbMByYGn
         I0FQqyDPiK9OzT1E0Vuj8xZPTa1D6PvyJFY3/ms65b2c2rtSfpgaQHxRXG1gmYAcWUjK
         8qFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779620355; x=1780225155;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7s/WuWNL9ddRgnnG+HfLCLif5sg1VJxBqglIWP1cQXQ=;
        b=HQDBhk4git5p6+eIk/YS9wfsaLa80VFArDDjM38BULqdJopBPsVRWzeUK8oStlg+hx
         Pq2hhK7N3sJoVQbZXmYll7TJoYD6DFZwf0kAxRNrbZ4Hvu+gIM4itPtnkfhr7Yj8IS3w
         cQQJ2IunQiFXuSP3lpBPa1pfvRDRL463eYq+5D4qksw2DQYGujuPSqOEphLVTUQJnlUZ
         qOqABn0DxTnuO59c5vYG9lULX7WOTbPrs6frnAfHsSMO/UP/QWIlC7w+L3fgR3Qm0zmm
         GwwYZIp2S8QITkWZXiqZqcJi+9NM0cMCwlIyaxhPxhqhTpndbwM/b/TXb6Ruz2Bm8j8C
         ZgKA==
X-Gm-Message-State: AOJu0YwirTddyai9wuqDHRsP/omT4ut7i5bnmmfOnzVgDea0ORPdLrvB
	vq2i/Ls9uH68D/L6c6wBMsGJhFT1Ms2djo2jH4cB3K+eQenk17Qa1YkJ9ENeWWXGPSRZ+mcbqP7
	lX2yf/mI=
X-Gm-Gg: Acq92OFjuINOrBan/0mAvrD0tToVCK5k6rRL0BweRBqhxqgEblJPCrlId0lzQR6IEp5
	L3k2vqTMEcwoElDAmuOfcJYBKNbi9wWL/JGHqE08HFOcQKlspXRRS9b10KVd5EJb9eLqhrxRKey
	KNNUiiYtw/IkS09zR1lnYWMf5tPBqR3bw4/4Qp1iSx60NlZZkgiVVpSqBe73ONC82mGB5WsfQrU
	XojNZrjGdyoprySJiMFw3B8VtI07PImkNjoXvc25FvpRINWeFU+ROSJiBmZseiZG54PawvRS9le
	kVEcbzn/pbUrl2Byn91mbhnIcBs2TpGGTjyjjjNk+kWw0aJpINQXAylT7s41uwff87YNgLSoxnH
	3GSWQ7xQF0hbq2qlp+4JJEanQa7rilOSBQ0fWufJnvYzFKGB6usX3aZzlxLRB4CaBiUZAqT9PON
	ssqLEWgXuRxJXC0w8HMoGr0cQ0GeS8CaSIymFdjrRfHaU=
X-Received: by 2002:a05:600c:3b0a:b0:490:60cb:560b with SMTP id 5b1f17b1804b1-49060cb57b1mr22246205e9.28.1779620354935;
        Sun, 24 May 2026 03:59:14 -0700 (PDT)
Received: from [172.20.52.45] ([89.101.53.26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428e5adcsm66212625e9.21.2026.05.24.03.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 03:59:14 -0700 (PDT)
Message-ID: <8f19b1c2-8469-4699-980b-fbd3b3354169@linaro.org>
Date: Sun, 24 May 2026 11:59:09 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
To: sashiko-reviews@lists.linux.dev
Cc: neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, olteanv@gmail.com, vkoul@kernel.org,
 conor+dt@kernel.org
References: <20260523-x1e-csi2-phy-v8-1-a85668459521@linaro.org>
 <20260523030420.045501F000E9@smtp.kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260523030420.045501F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2026 04:04, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Medium] Using the literal `endpoint:` property name inside ports bypasses constraint validation for endpoints with unit addresses.
> - [Medium] The `data-lanes` property on `port@1` is overly restricted to `maxItems: 1`, which will break multi-lane DPHY split-mode configurations.
> - [Low] The example uses a non-generic device tree node name `csiphy@...` instead of the standard `phy@...`.
> - [Low] Mismatch between the `vdda-0p9-supply` property name and the actual 0.8V hardware supply used on the x1e80100 platform.
> --
> 
> commit 10936c65e44aeea784cc13676d51700996cf6559
> Author: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
> 
> Add a base schema initially compatible with x1e80100 to describe MIPI CSI2
> PHY devices.
> 
>> diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
>> new file mode 100644
>> index 0000000000000..270375f949880
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
> [ ... ]
>> +  power-domain-names:
>> +    items:
>> +      - const: mmcx
>> +      - const: mx
>> +
>> +  vdda-0p9-supply:
>> +    description: Phandle to a 0.9V regulator supply to a PHY.
> 
> [Severity: Low]
> Does this property name mismatch the actual hardware supply voltage for the
> x1e80100 platform?
> 
> The example later in this schema uses <&vreg_l2c_0p8>, which indicates an
> 0.8V rail. Should this be updated to reflect the 0.8V voltage?

This was feedback I forgot to implement yes.

>> +
>> +  vdda-1p2-supply:
>> +    description: Phandle to 1.2V regulator supply to a PHY.
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: Sensor input. Always present.
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
> 
> [Severity: Medium]
> Will using the literal endpoint: key bypass constraint validation if an
> endpoint with a unit address (e.g., endpoint@0) is used?
> 
> Because the port references port-base, such an endpoint will pass the
> unevaluatedProperties: false check, but its specific constraints wouldn't
> be validated. Could this use patternProperties: "^endpoint(@[0-9a-f]+)?$":
> instead?

Not sure about the answer to that. Also feels like the tool could have 
made this suggestion at v7, definitely room for improvement.

> 
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
> [ ... ]
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description:
>> +          Second sensor input. When present, indicates DPHY split mode.
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
> 
> [Severity: Medium]
> As with port@0, should this use patternProperties: "^endpoint(@[0-9a-f]+)?$":
> to ensure endpoints with unit addresses are properly validated?
> 
>> +            $ref: /schemas/media/video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +            properties:
>> +              data-lanes:
>> +                maxItems: 1
> 
> [Severity: Medium]
> Is maxItems: 1 too restrictive for multi-lane DPHY split-mode configurations?
> 
> Split-mode typically divides a 4-lane PHY into two independent 2-lane
> interfaces (e.g., data-lanes = <2 3>). This configuration would fail
> dt_binding_check validation with a single item limit.

Not sure where Sashiko is getting this "typically" stuff from since 
split-mode is a qcomism.

But no in split mode port@1 is specifically restricted this way.

Is there a way to give definitive feedback - with a meta comment perhaps 
- that stops the tool continually giving the same feedback ?

> 
>> +              clock-lanes:
>> +                maxItems: 1
> [ ... ]
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        description: Output to CAMSS controller.
>> +        unevaluatedProperties: false
>> +
>> +        properties:
>> +          endpoint:
> 
> [Severity: Medium]
> As above, should this use patternProperties: "^endpoint(@[0-9a-f]+)?$":?
> 
>> +            $ref: /schemas/graph.yaml#/$defs/endpoint-base
>> +            unevaluatedProperties: false
> [ ... ]
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>> +    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +
>> +    csiphy4: csiphy@ace4000 {
> 
> [Severity: Low]
> Does this node name violate the standard naming convention for PHY providers?

In the example does that matter ? Passes the dt checker anyway.

> The core phy-provider.yaml schema expects node names to match the generic
> pattern ^phy(@.*)?$. The current name csiphy@ace4000 will likely trigger a
> dt_binding_check warning.
> 
>> +        compatible = "qcom,x1e80100-csi2-phy";
>> +        reg = <0x0ace4000 0x2000>;
>> +        #phy-cells = <1>;
> 

