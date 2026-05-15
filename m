Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A2572B9A4
	for <sashiko-reviews@lists.linux.dev>; Fri, 15 May 2026 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834608; cv=none; b=cVbM2668hJ+kDm7FMKMdv/8ZAKfYE7HGz9g+6zCkVGRQYDprgt0nMJvK5jAXua41t8JASka/vF+DIdWCiLaj1DypmztPibFY5KyCsFgTi1T4v5UDvoyIt1NuVbUP5Ttr5QBcr2gk2kzzwg59hyesM6dT1X8/lrSNx2ujFn6aLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834608; c=relaxed/simple;
	bh=nS+lCgr4OrV4iecFaYNEUGomabWrCmUsI7giLwsMxE8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=fT1z0ouqHjwNBZDPHKCxTkcvQvDFLgoHr/zJsjfYDC2UwQwz2vjGuFNIY3Vf+P5dyv1xNTRy7LFsfPM6nmCJ2Wo0ddhHU42aEsVEk3jPzbJ2hsxbXdihRajLcKxO0/rMNbIezlY18RCY73OTwr0jmX/oD0omDyA+m8Q1NqJb8jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=JUPrNsyI; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="JUPrNsyI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=Q/ZGijoJsq+Ap0qMs88xNOMP9wdMwxFtl
	TwU91GwQ7Y=; b=JUPrNsyIlumGooe5Wg33nkvjv14BdTDNK1s54SfgCgmMyRuM8
	Jk9YHhskel4JQGrv6lEIIgaHWBw6527pjIkKC4imf5uYyoEhsv2ouXT/4tiB8Jrs
	5HDxOHk1h8+Frmpr5f3tO3Jl2CJM9MPdzNG0nzTSEllzbyOzly9/yOjbqE=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwAnYULH3AZqvXQEAA--.5045S2;
	Fri, 15 May 2026 16:43:52 +0800 (CST)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 4/9] dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl
 bindings
From: Jia Wang <wangjia@ultrarisc.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>, 
 robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 conor+dt@kernel.org
In-Reply-To: <20260515014938.540FDC2BCB3@smtp.kernel.org>
References: <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
 <20260515014938.540FDC2BCB3@smtp.kernel.org>
Date: Fri, 15 May 2026 16:43:10 +0800
Message-Id: <177883459046.3325333.4510759257711016058.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778834590; l=6422;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=nS+lCgr4OrV4iecFaYNEUGomabWrCmUsI7giLwsMxE8=;
 b=az+mWxW9HCUgpUf5xEM4+Q6pi00Zk5iLLZgj7rrwQQo+cgiwM61nXnYO7foSUvM2y8a4ijcpc
 dlR0wLEb0h2CEUe9hwQgK01aM9RxYEFCsup+lHLKD1O/fcAzCtZBI1f
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwAnYULH3AZqvXQEAA--.5045S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKF4UuF4rWF4fKF17XryftFb_yoWxJryUpF
	WfJFW5AFy8KF45t392y3W8C3Waqan7CrW7Kr1Dtryjya98uF10qF13Kw45uas8ur4vvFy3
	Zay5Wa4UJa1DuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
	twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5
	L18JUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWoFRsMACwAMs6

On 2026-05-15 01:49 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] The schema lacks a top-level `required` block for mandatory controller properties.
> - [Medium] The binding introduces custom legacy vendor properties and magic macros instead of using generic pinctrl properties.
> - [Medium] The `maxItems: 32` constraint on the legacy array properties allows structurally incomplete configuration tuples.
> - [Medium] The schema incorrectly uses `additionalProperties: false` alongside `$ref` inclusions, forcing redundant property definitions.
> - [Low] The documentation incorrectly describes the legacy properties as a `phandle-array`.
> - [Low] The schema fails to enforce the hardware limitation that `func1` is unsupported on `LPC` pins.
> --
> 
> commit 20f50ac043d77ef903b805d0902034551c955519
> Author: Jia Wang <wangjia@ultrarisc.com>
> 
> dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl bindings
>     
> Add bindings for the pin controllers on the UltraRISC DP1000 RISC-V SoC.
> 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> > new file mode 100644
> > index 0000000000000..c7ed1f96382af
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml
> > @@ -0,0 +1,168 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/ultrarisc,dp1000-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: UltraRISC DP1000 Pin Controller
> > +maintainers:
> > +  - Jia Wang <wangjia@ultrarisc.com>
> > +
> > +description: |
> > +  UltraRISC RISC-V SoC DP1000 pin controller.
> > +
> > +  The binding supports two child node styles under the same controller
> > +  compatible:
> > +
> > +  - legacy DP1000-specific nodes using phandle-array properties
> > +    `pinctrl-pins` and `pinconf-pins`
> 
> Is "phandle-array" accurate here? The schema defines these as flat uint32
> arrays, and the examples show raw integer arrays without any phandles.
>

Thanks for spotting that. The term "phandle-array" is indeed inaccurate
here, but since these legacy properties will be removed entirely in v2,
this description will be dropped along with them.
 
> > +  - generic pinctrl nodes using `pins`, `function` and generic pin
> > +    configuration properties
> > +
> > +properties:
> > +  compatible:
> > +    const: ultrarisc,dp1000-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#pinctrl-cells":
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Should there be a top-level required block for compatible and reg?
> Without it, a device tree node omitting the reg property or left entirely
> empty could silently pass schema validation.
>

Yes, I’ll added the top-level required block for compatible and reg.
 
> > +patternProperties:
> > +  '.*-pins$':
> > +    type: object
> > +    allOf:
> > +      - $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +      - $ref: /schemas/pinctrl/pinmux-node.yaml#
> > +    additionalProperties: false
> 
> Should this use unevaluatedProperties: false instead? Using
> additionalProperties: false alongside $ref ignores properties imported by
> the references and forces redundantly redefining generic properties locally
> in this file.
> 

I’ll switch to unevaluatedProperties: false and verify the behavior.

> > +    properties:
> > +      pinctrl-pins:
> > +        description: |
> > +          The list of pins and their mux settings that properties in the node
> > +          apply to. The format: `PORT  PIN  FUNCTION`.
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> 
> Since the format requires 3 integers per tuple, does a maxItems: 32
> constraint allow structurally incomplete configuration tuples? 32 is not a
> multiple of 3, so it rejects a valid 11-pin configuration (33 integers) while
> permitting an invalid array ending with a partial tuple.
> 

This legacy property will be removed in v2.

> > +      pinconf-pins:
> > +        description: |
> > +          The list of pins and their pad configuration that properties in the
> > +          node apply to. The format: `PORT  PIN  CONF`.
> > +          CONF is a DP1000-specific encoding of pull and drive strength as
> > +          defined in dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h.
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        minItems: 1
> > +        maxItems: 32
> 
> Is it appropriate to encode distinct physical characteristics like bias and
> drive strength into a single integer using a macro? The pinctrl subsystem's
> architectural design typically models these as individual, human-readable DT
> properties.
> 
> For a new upstream driver, shouldn't it rely exclusively on the standard
> generic pinctrl framework rather than introducing new custom vendor properties?
> 

In v2, I’ll remove the legacy vendor-specific pinconf-pins/pinctrl-pins
properties from the binding schema. They were previously included for
compatibility.

The legacy format is kept only as a driver implementation detail for
existing DTs and is not part of the binding.

New device trees must use the generic pinctrl binding.

> [ ... ]
> 
> > +      function:
> > +        description: |
> > +          Mux function to select for the listed pins.
> > +          gpio maps to the hardware default mode. The default mode is
> > +          GPIO for PA/PB/PC/PD pins and LPC for LPC pins.
> > +          func1 is not supported on LPC pins.
> > +        enum:
> > +          - gpio
> > +          - func0
> > +          - func1
> 
> Could the schema enforce the hardware limitation that func1 is unsupported
> on LPC pins? Adding an allOf with an if/then block would prevent this
> invalid combination from passing schema validation.
>

Thanks, will add an allOf with if/then in v2 to reject func1 on LPC pins.
 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=4
> 

Best Regards,
Jia Wang


