Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549503F106C
	for <sashiko-reviews@lists.linux.dev>; Sat, 29 Aug 2026 20:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788034712; cv=none; b=FPRFzp4Ozo8bNRuSua80LtI4gfdA+NZtPe2MXqaedNkri5NjklqXEnpub2pgjfSekw8wkYG9GyhmFzxQV/yfApv5mjIGhcSUs8xEkwCMBwwunjk68Q3ysIyv/8E7UdaQWtElHxUbpSYwLiTTTnX0hWGf3Jan7yWOl9hrr40z3GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788034712; c=relaxed/simple;
	bh=X1KEZO6u63eMOK44PuiZkrtaZhMnvdNl0vdSm8nwUBM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YIQheafqDAxI97nrpJlGM5VfXYWIFtTZ599h1s4dY/9b+XUNcLzBGSfPTSbD/T13jo11Tb9XJ8lFgqfljNpjKDPhP1KzXGMIgjpDE2H2e/b19O8KwgQWMd2YcFWnbuPYSRvklIxgzbmpS/OIdIE+xASvb3KFFRwoA52evJhylJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=DMse7pzQ; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=UlG2hGF6; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="DMse7pzQ";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="UlG2hGF6"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788034695; bh=99oQqqsmDdYcuU1KZ1BBNtz
	eXvz/eiQA8iTcrFoXqIQ=; b=DMse7pzQkebE9ELqmn+vxiJj6jWBXBCV+5si2YDBWZEdK+dhgn
	m1OWgG1o8czZieM+5Qk6arZUiTbW+8+2j5LGv/+/I5yT1DEKrV/VH8HvzlV8QfNwGzg65t03+R9
	ubaDBpIccNehc9VUPSA5PHUr3APYa7xsbiPgVM+VErO+K8aGBsLfIHEe8jhBh44FwZQe8CVzYQK
	QJ0pp3Lb4U7PrOrkBq2ZcGg+SJXTDZ3QcEZKGg2RLiNpeUKAE/qSjFWNqCCqp5lc0uPgpGH1pSw
	biqduohF338vjs1uFJkKbAShvDvcnWGTrIKxyh3QqjNs+WMbGH3+SEPjg3I42yKMJxg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788034695; bh=99oQqqsmDdYcuU1KZ1BBNtz
	eXvz/eiQA8iTcrFoXqIQ=; b=UlG2hGF6ZkfucljrhX0AKlQZZojfgmvDL/P0ciu+VPUv7kdO3l
	u+6HiXxMKHT5D9eq8oPbtI/CjMsi8An3PYDA==;
Message-ID: <6e0e03f6-8ce9-4c01-9f04-206b163d5664@mainlining.org>
Date: Sat, 29 Aug 2026 23:18:14 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] dt-bindings: display: panel: Add bindings for
 Novatek NT51021
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, conor+dt@kernel.org
References: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
 <20260829-qcom-novatek-nt51021-panels-v1-1-cc1ca61bd261@mainlining.org>
 <20260829201500.796D31F000E9@smtp.kernel.org>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <20260829201500.796D31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


29.08.2026 23:14, sashiko-bot@kernel.org пишет:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Commit message and schema description contradict the schema's compatible list by claiming to only support 'boe,tv101wum-nx0' while silently including 'boe,tv080wum-nx2'.
> - [Medium] The description for `reset-gpios` incorrectly specifies the polarity as '(active high)', which contradicts the example and typical panel reset semantics.
> --
>
> commit 4949971c710c300054975d637c238b42bc5c2c75
> Author: Nickolay Goppen <setotau@mainlining.org>
>
> dt-bindings: display: panel: Add bindings for Novatek NT51021
>
> This commit introduces device tree bindings for the Novatek NT51021 display
> driver IC. It explicitly states support is added for the BOE TV101WUM-NX0
> WUXGA video mode panel.
>
>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
>> new file mode 100644
>> index 0000000000000..a3e4ed10e645d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt51021.yaml
>> @@ -0,0 +1,93 @@
> [ ... ]
>> +description: |
>> +  The NT51021 IC from Novatek is a generic DSI Panel IC used to drive dsi
>> +  panels.
>> +  Right now, support is added only for a BOE WUXGA LCD display panels with a
>> +  resolution of 1200x1920. They are video mode DSI panels.
>> +
>> +allOf:
>> +  - $ref: panel-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - boe,tv101wum-nx0
>> +          - boe,tv080wum-nx2
> [Severity: Medium]
> The commit message and the schema description state that support is added
> only for the BOE TV101WUM-NX0 panel, but this adds boe,tv080wum-nx2 to the
> compatible list.
>
> Is this regression intended, or should the description and commit message be
> updated to reflect support for both panels?
>
> [ ... ]
Will be addressed in v2
>> +  reg:
>> +    maxItems: 1
>> +
>> +  reset-gpios:
>> +    maxItems: 1
>> +    description: phandle of gpio for reset line - This should be 8mA, gpio
>> +      can be configured using mux, pinctrl, pinctrl-names (active high)
> [Severity: Medium]
> Could this description cause regressions for users configuring the reset
> line?
>
> The text explicitly specifies (active high) for the reset-gpios polarity,
> but typical panel semantics and the example block further down use active
> low:
>
>              reset-gpios = <&tlmm 62 GPIO_ACTIVE_LOW>;
>
> If users follow this text description instead of the example, could they
> drive the physical line incorrectly and prevent the panel from initializing?
Will be addressed in v2

-- 
Best regards,
Nickolay

