Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0EA3DB31F;
	Wed, 22 Jul 2026 23:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784762471; cv=none; b=cr4gyO+PqoYDML9I7D2ajfPrercJSplJKz+Mgybl+MNyUneezYqQCjBri4tV6PepGY1OQA4fb0HPwjmnSReA0NZ+BEUnq9FUCoa/MjUTQ4CH23rCl8Y/dahzApJddxMjtdTYuhx0HUmpgwDBjRz8RcIm4T4CL+OKOVUyihQ7rlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784762471; c=relaxed/simple;
	bh=0bF7JuHmTE+qq+ZS65ZDDvObmpNl9li4WWIW5Hth3IU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uAVkU2IddidIBT0vrEq3Bj4sUEz9ZU/0FYu+cnZ3w+/gGPdZFpiiHA9vsIUrh28zHXVjvxYwbiyUU56qZpW2vhWHzaUloSkAr7Lm2RojxM4vPRhw8A3x3ZLzCS30o/s/yM/XGMvwFh/j9XuClKo4PqANWLElPS4FD6aukgwqfn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bW3Xzx08; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bW3Xzx08"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 005061F000E9;
	Wed, 22 Jul 2026 23:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784762470;
	bh=TkJg8re8EKuv/YDehLLHQJKcgk2R2WqRbZWeKyA5/GE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bW3Xzx08m9x1pjWj1hNoqekvSC/OsFXNppblyY4B5i9zb8vffXbbRAJTZofyCQ3pg
	 8lB2393kiX5RrUunj/dKkP/Wd8f8BX9KuykhzLy0Y4a22MMQT/IAyr4M++mvL/1SxR
	 6SlZrVnyzLbEGgIh2EscD7kdzXOOGvcDu3Rw0CSoQhYaEQ3JG/Kh141HBxAKH6B3le
	 k2auZQNgrjcqQncfciLcomX3XIJWG8SDYWJ3G2Q3uDrRN1SWtriuolhkxWG0mKCjVF
	 jxaep2PV3YXqGQd7FvEIBOsZ2LJTMOgbZDNsxfXNi5GbnRaqbG4nAr3j1QtqowHFEZ
	 4BGqdchkHsXgQ==
Date: Wed, 22 Jul 2026 18:21:09 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Udaya Kiran Challa <challauday369@gmail.com>,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
Message-ID: <20260722232109.GA2760962-robh@kernel.org>
References: <20260722123243.341346-1-challauday369@gmail.com>
 <20260722124415.63DD11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722124415.63DD11F000E9@smtp.kernel.org>

On Wed, Jul 22, 2026 at 12:44:14PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The top-level `additionalProperties` logic using `oneOf` silently accepts undefined non-object properties and breaks validation for standard container nodes due to injected `phandle` properties.
> - [Medium] The `$defs/pin-node` definition bypasses all type and constraint checking for standard pin configuration properties because it fails to reference `pincfg-node.yaml`.
> - [Low] The removal of `#address-cells` and `#size-cells` from the schema creates a mismatch with the existing `pic32mzda.dtsi`, which will cause `dtbs_check` warnings.
> --
> 
> --- Patch [1]: [PATCH v4] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT schema ---
> commit 238b9bfa23edd44c05fbb35e962f0ab9f0bb9f25
> Author: Udaya Kiran Challa <challauday369@gmail.com>
> Date:   Wed Jul 22 12:32:43 2026 +0000
> 
> dt-bindings: pinctrl: microchip,pic32mzda-pinctrl: Convert to DT schema
>     
> This commit converts the Microchip PIC32 Pin Controller devicetree binding
> from legacy text format to DT schema. It consolidates pin-node properties and
> updates the schema layout to support nested or direct pin configurations.
> 
> Link to v3: https://lore.kernel.org/all/20260719183431.124061-1-challauday369@gmail.com/
> Link to v2: https://lore.kernel.org/all/20260707144223.120417-1-challauday369@gmail.com/
> Link to v1: https://lore.kernel.org/all/20260705132521.159522-1-challauday369@gmail.com/
> 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/microchip,pic32mzda-pinctrl.yaml
> > @@ -0,0 +1,107 @@
> [ ... ]
> > +properties:
> > +  compatible:
> > +    const: microchip,pic32mzda-pinctrl
> > +
> > +  reg:
> > +    maxItems: 1
> 
> [Severity: Low]
> Even though the changelog mentions removing #address-cells and #size-cells
> from the schema, aren't these properties still present in the
> pinctrl@1f801400 node in arch/mips/boot/dts/pic32/pic32mzda.dtsi? 
> 
> Will their removal from the schema cause dtbs_check warnings for the
> existing in-tree device tree?

Yes, but warning is correct.

> 
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +$defs:
> > +  pin-node:
> > +    type: object
> > +    $ref: /schemas/pinctrl/pinmux-node.yaml#
> > +
> > +    properties:
> > +      pins:
> > +        description: List of pins to which the configuration applies.
> > +        items:
> > +          type: string
> > +        minItems: 1
> > +
> > +      function: true
> > +
> > +      bias-pull-up: true
> > +      bias-pull-down: true
> > +      input-enable: true
> > +      output-low: true
> > +      output-high: true
> 
> [Severity: Medium]
> Does this bypass type and constraint checking for the generic pin
> configuration properties?
> 
> By assigning these generic properties to true without also including a
> $ref: /schemas/pinctrl/pincfg-node.yaml#, it looks like the schema
> validator might silently accept any value or type for them, missing
> mutually exclusive constraints like having both output-low and
> output-high present.

This should be addressed.

> 
> > +
> > +      microchip,digital:
> > +        description: Enable digital I/O.
> > +        type: boolean
> > +
> [ ... ]
> > +    required:
> > +      - pins
> > +
> > +    unevaluatedProperties: false
> > +
> > +additionalProperties:
> > +  oneOf:
> > +    - additionalProperties:
> > +        $ref: '#/$defs/pin-node'
> > +    - $ref: '#/$defs/pin-node'
> 
> [Severity: High]
> Will this oneOf construct silently accept undefined scalar properties?
> 
> Because the first branch lacks a type: object constraint, a typoed
> scalar property might trivially pass the first branch and satisfy the
> oneOf.

The $ref has a 'type: object' so we should be fine.

> 
> Also, for valid child container nodes referenced via a phandle, the
> devicetree compiler automatically injects a phandle property. Since
> that injected phandle is not an object, won't it fail the $ref type
> check here and cause spurious dtbs_check errors for perfectly valid
> hardware configurations?

I think the $defs should get fixed up with 'phandle', etc. added. You 
can check the generated processed-schemas.yaml.

Rob
