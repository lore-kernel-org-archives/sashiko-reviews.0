Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A395379C3F;
	Wed, 10 Jun 2026 19:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781121535; cv=none; b=CB9pxp0SKBAvCwa2rnYAY8yESE7nlxugFriOvagskWF9TMAknqeEN8eqB4JOIjcweNyHTl7SF5X+TYsrZEZODZto+kObRbRM4zaAAgkv+wv0qFLKXt1ONxYEjU2ZtMRYvfiZ+BLo6PK1AHCnL9KHTJE+nC2Xdu0Thdle7vkJ5JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781121535; c=relaxed/simple;
	bh=2SrPYIsQX9T0GxeoShP7iB7JWVK60CRI/n7n8aj14wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYfK3YqTlaxEwqYu/vTI7ZfftbPgELKGT3Pe2FjFQ8wb4EGWKDHGNq8YctzyFvy7B4iEaEZBY6A3aDA30eL5yd+0rFH6ZQQcvThtYurENBk+SNxPgymuOsp1UFbcpNzqY1I0A3IsKaz2zsD701oCO69tBBrdUI8GROQ9GVdT3CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+TbHiCC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+TbHiCC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCC601F00893;
	Wed, 10 Jun 2026 19:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781121534;
	bh=1g0m9Jr1nkZa5nPEmppDa57OnXpH+pwuWB9UrpDdA/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S+TbHiCCK7fdGUXx2jykjvnV6J2ksS+6N/fjs5By6EHlgZBZoOlzZIODiT33ept2v
	 qKJR/hIFZmw4sPBHi+XGTQ776j/aXn7ZkzDPBfBh/9Ccm21zcDvrilV/NzOsg0lCtc
	 MvvBFtc8EVlr4S5NIXupKQVUUEs7Xhr3/lfS22LwtWHBYhgOeYUQiK6y/+hmmjV0rb
	 WU+vPjX3vBy6v8yPCEZlJfEFbnlwWsWWzXR8Egm/0jej/CS42Fdtm4evMZa97oI//L
	 ge+/wql+0EfdgKDLK+qh2bYiaeDjfaMaU6h8I5yk4eaGdUCkvty5l+ySqvRsV8xhnq
	 1RmUAoyznoCmw==
Date: Wed, 10 Jun 2026 14:58:53 -0500
From: Rob Herring <robh@kernel.org>
To: Markus Stockhausen <markus.stockhausen@gmx.de>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	'Thomas Gleixner' <tglx@kernel.org>
Subject: Re: AW: [PATCH 1/7] dt-bindings: interrupt-controller:
 realtek,rtl-intc: Allow 2 interrupt cells
Message-ID: <20260610195853.GA709337-robh@kernel.org>
References: <20260605211646.2101652-2-markus.stockhausen@gmx.de>
 <20260605212533.75D231F00893@smtp.kernel.org>
 <064801dcf776$2cbb8280$86328780$@gmx.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <064801dcf776$2cbb8280$86328780$@gmx.de>

On Mon, Jun 08, 2026 at 08:39:43PM +0200, Markus Stockhausen wrote:
> Hi,
> 
> > Von: sashiko-bot@kernel.org <sashiko-bot@kernel.org> 
> > Gesendet: Freitag, 5. Juni 2026 23:26
> > An: Markus Stockhausen <markus.stockhausen@gmx.de>
> > Cc: devicetree@vger.kernel.org; robh@kernel.org; conor+dt@kernel.org
> > Betreff: Re: [PATCH 1/7] dt-bindings: interrupt-controller: realtek,rtl-intc: Allow 2 interrupt cells
> > 
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] The cell-count property `#interrupt-cells` uses an `enum` constraint instead of a `const` constraint, violating dt-bindings subsystem rules.
> > --
> >
> > commit 11a7c1b034a74e6212dca3ea81cd1ec7e513c49c
> > Author: Markus Stockhausen <markus.stockhausen@gmx.de>
> >
> > dt-bindings: interrupt-controller: realtek,rtl-intc: Allow 2 interrupt cells
> >
> > This commit updates the #interrupt-cells property to accept either 1 or 2
> > cells to support explicit hardware interrupt routing to multiple parent CPU
> > interrupt lines.
> >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml
> > > --- a/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/realtek,rtl-intc.yaml
> > > @@ -32,8 +32,9 @@ properties:
> > >  
> > >    "#interrupt-cells":
> > >      description:
> > > -      SoC interrupt line index.
> > > -    const: 1
> > > +      First cell is the SoC interrupt line index. Optional second cell
> > > +      specifies the parent interrupt index to route to.
> > > +    enum: [1, 2]
> >
> > [Severity: Medium]
> > Does this change violate the subsystem requirements for cell-count properties?
> 
> Is switching form const:1 to const: 2 the right way here?
> Even if the driver changes handle the old 1 cell syntax 
> gracefully?

I don't know what rule sashiko is talking about. It is fine.

Rob
