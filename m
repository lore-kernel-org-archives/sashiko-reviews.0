Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101422;
	b=tuXbCZGUjcaqmbfu+BIQFRm6fTeJFzwq+XLnl7F91AS1hzpWduu5Phh4NCUplm1U1mjd
	 59uAyuXkYVsQ+R6D1WEoOUALL830AFGWdA5fE1NRCqGuSXMeC2OwX3d/geA5mLjgpUxjY
	 wMZTQ56bNRUz7+vNy67xZnuufNVvmROd+dlCYprHR8iN8+ou6p49JiBgTMXqbC1mFbcdh
	 iBoVDqg6obmGd70F7ncD0GVB5rmED9dG7/6VqPsFRVo41RerD2UynEfEb/i/A6AuAbXMp
	 SSdP1NRKVejCb0xbDkfIv5cbIbidg4AJRs8aKujRDscvZ+18N6Lf+A5YFueq1Ly5HnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101422;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=bBJ2aRJrCiD8keCJr4hECrY2HF8+sAi+mcLKeE2oSVA=;
	b=sr59akrfruPA0ffNuada0N96hcJetQe50iKMB/7mNLwIetkXWKkpnE4NFuxfm8RpAGuX
	 HitWpwEk5y3cq1GHeHcscBKMBVdTSph0eE7pOZ0BhguSnvj8D1PuCdkJb7CpRLrfc3PWe
	 Ovgoqy27Qfeq4UDz/OnKclBHNccU7tNN5euqmA07ngUqndVz0VOyPOf+LyWo6TT/G2TJG
	 Og6w+RxBndxkTN3hddS1JprE7imN1e6mHI4rCVZQBqqK9zoMJqHwKUs1UpYYSiXRF7Hsu
	 Dr5tkBZaNAXjje3MN9PJKbBhOAzZ4Y2T882vFN4tlOik6F72HrKvRxlXlKNED1GL0Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJigARas;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD74606A325;
	Thu, 19 Nov 2026 15:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eJigARas
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B7831F000C6;
	Thu, 19 Nov 2026 15:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795101422;
	bh=bBJ2aRJrCiD8keCJr4hECrY2HF8+sAi+mcLKeE2oSVA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eJigARasediOZtfqOXkKB0/WB5dtbBxi8a3rDC+v3N6ZKwJYS7HI2WtJagdjVzRX4
	 d3NwWEuSoLNepVCb4GUnSCCwbguD3IxAbCCGRpvcbAHGNoVfWVzx6L5gQtvXPf4vat
	 n1XWq0wMaptXbUJPBnb/PLCoiUCx2bKrvwCVoPonTFqUXeQ44zoSNLKq2ZtZb+l5Pm
	 no8WkCFnQzW27YnRp/26VZQ+JykNBLA7x/v8n/2d0j7xQOpf2Boeh8khyhvl45uGEL
	 OF1sKFppBSvUWmLMngIXX7CVi08iqQatvtaO2hx3v6qlrGN9rXukdIf2G/rVQRZl+0
	 1RmaR/l7zK79A==
Date: Thu, 19 Nov 2026 15:16:58 +0000
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: "Rob Herring (Arm)" <robh@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: mfd: Add Marvell AP806/CP110 system
 controller schema
Message-ID: <20261119151658.GV98456@joneslee-macbookpro.roam.internal>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
 <20261111-dtbs-marvell-v1-1-938788aff3ae@kernel.org>
 <sashiko-outbox-209906@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-209906@kernel.org>

On Thu, 12 Nov 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dt-bindings: mfd: marvell,ap806-system-controller collides
>   with legacy driver

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> commit 4cddea2359377a9e6ae88c719cab7c7efc9634bf
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> dt-bindings: mfd: Add Marvell AP806/CP110 system controller schema
> 
> This commit adds a dedicated Device Tree binding schema for the Marvell
> AP806 and CP110 system controllers and their child devices.
> 
> > diff --git a/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml b/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml
> > new file mode 100644
> > index 0000000000000..4c43986c2c0a3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/marvell,ap806-cp110-system-controller.yaml
> > @@ -0,0 +1,59 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/marvell,ap806-cp110-system-controller.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Marvell AP806 and CP110 system controller
> > +
> > +maintainers:
> > +  - Andrew Lunn <andrew@lunn.ch>
> > +  - Gregory Clement <gregory.clement@bootlin.com>
> > +  - Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - marvell,ap806-system-controller
> > +          - marvell,cp110-system-controller
> > +      - const: syscon
> > +      - const: simple-mfd
> 
> [Severity: Medium]
> Does requiring marvell,ap806-system-controller on the parent simple-mfd
> node cause a collision with the built-in legacy clock driver?
> 
> Unlike CP110, where cp110_syscon_legacy_of_match matches
> marvell,cp110-system-controller0, ap806_syscon_legacy_of_match matches
> marvell,ap806-system-controller:
> 
> drivers/clk/mvebu/ap806-system-controller.c:
> static const struct of_device_id ap806_syscon_legacy_of_match[] = {
> 	{ .compatible = "marvell,ap806-system-controller", },
> 	{ }
> };
> 
> When a device tree conforms to this schema, ap806_syscon_legacy_driver
> binds to the parent MFD platform_device at boot.
> ap806_syscon_legacy_probe() then logs three false FW_WARN messages about a
> legacy binding, performs an unintended regmap_read() of AP806_SAR_REG
> (0x400) in ap806_syscon_common_probe(), and fails probe with -EINVAL and
> "compatible not supported" because the parent node is not compatible with
> marvell,ap806-clock or marvell,ap807-clock.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org?part=1

-- 
Lee Jones
