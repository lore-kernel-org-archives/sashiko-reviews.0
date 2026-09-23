Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D853AC0DD;
	Wed, 23 Sep 2026 16:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181221; cv=none; b=daYKdkUa0DoxmS83STXmQZZxG/Kqxh7g1n4iPA9rj/VXzXAA5AN9eEK9/MtnY1mW+5dDsUh3spvKUyKXiHQdJrE2IpB9qKjM2nrWIOGwAI2dq5trres2iFzZJ07/ZUr7cJWFp++gEv7HiLX3g4oGWK3Zytp/MKMKcnbn58uSQXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181221; c=relaxed/simple;
	bh=SxuHHQCeLbiUdtbI0qmnr+uqSAVaplG2ZqW2CmbswXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=El4IBrUt3sKdfo4B3GJKuPWrqKJy82+bw63OgAthp/G0m8nDe8t92L9KBR7hYh6bPjzTG7ZEl2FtFxuKeHy8BBOmqr6nIZ3i0srp/lIp+47+iXnXqR20GmePEDf8sWynscLklrTrrxb4J8FbX8Pxzm/sRtdlIpc6NsH6FKisF+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wyp2GVF0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wyp2GVF0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DD7C1F000FF;
	Wed, 23 Sep 2026 16:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790181213;
	bh=COUFzbpQq3wjtqVQRCTPf401CbzyKOLRHL1Dn07w3/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Wyp2GVF0Ow5HrJZQfQ6jRE/K9SnCbIhVjbw9q+LSCR1zUukEpBCuPJ6P9YpO4/v2a
	 qF2OI2LA5Z3bfervap9wNU8lX8yYFCKNThfrrdkDRCt/bIO8IeoyWQBiZP1RKdjdxp
	 Xc1vnw/I/V1QhYs1R25yAmn/DXC4BJBzX5eL1j/B72kbY5/WmOG7o/p/WqIV0Hykp/
	 nisgDicgpTCXK7TJKPsAacU8te5QoFnOIfwOlm3C0a96EAuN7JIYqKNz8661xk55yg
	 n1g5qfl7JnuS0SCuN6IpzWyyKNTiXbj5zt3y/OkBPINyYVbEgxAkzoBWmrfbukbJLm
	 ccOpFBV7cVZOg==
Date: Wed, 23 Sep 2026 11:33:31 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev,
	conor+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible
Message-ID: <20260923163331.GJ27237-robh@kernel.org>
References: <20260921232625.3131242-1-robh@kernel.org>
 <20260921233651.591281F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921233651.591281F000FF@smtp.kernel.org>

On Mon, Sep 21, 2026 at 11:36:50PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: mfd: hi6421: invalid gpios property for interrupt line
> --
> 
> commit 4ce4ba18007f2f81249a1f2307d744174beb3e75
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> dt-bindings: mfd: hisilicon: Fix Hi6421 SPMI compatible
> 
> This commit updates the device tree binding for the Hi6421 SPMI PMIC to use
> the hisilicon,hi6421-spmi compatible string. It also allows the gpios
> property for the GPIO interrupt line used by the HiKey970 PMIC node.
> 
> > diff --git a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> > index 6a824351834ee..9275c561e9d49 100644
> > --- a/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
> [ ... ]
> > @@ -32,6 +32,9 @@ properties:
> >    '#interrupt-cells':
> >      const: 2
> >  
> > +  gpios:
> > +    maxItems: 1
> > +
> 
> [Severity: Medium]
> Does this property legitimize a broken device tree description by using gpios
> for an interrupt line?
> 
> Looking at the driver in hi6421v600_irq_probe(), it unconditionally relies on
> platform_get_irq() to fetch its interrupt:
> 
> drivers/misc/hi6421v600-irq.c:hi6421v600_irq_probe() {
> 	...
> 	priv->irq = platform_get_irq(pmic_pdev, 0);
> 	if (priv->irq < 0)
> 		return priv->irq;
> 	...
> }
> 
> Because platform_get_irq() only parses the "interrupts" property, it lacks a
> fallback to parse "gpios". Will this cause the driver to fail to probe when
> using the HiKey970 PMIC node configuration since it cannot find the interrupt?

The staging driver used 'gpios'. That was moved to interrupts, so the 
gpios hunk can be dropped. And then the .dts needs to be updated.

Rob
