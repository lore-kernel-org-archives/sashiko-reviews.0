Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA744219F2;
	Wed, 23 Sep 2026 18:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187348; cv=none; b=JqMRXG5whlEf7FrySC/4/EBqOFh792h1jKgWKMc1bcucv5MGhV++8IlxqaoYwCYDcYLl3SAR+hxlP1EVhIQqDQU2wEh1gCl1boW7o6EmGpMZmBQX3580o1eHW3Dt6TeJUT/Ohw1OgCWfvwWsZYNwMWGSIhKBNjPND9CxsVd+GGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187348; c=relaxed/simple;
	bh=NE2ChObFX6pBG/7jNpYtbYkD70PoLaqgQjqb/mt0hOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OZ84ZrXrQIZiRI61QjnrJv4CZ2G7b6w+XUM/N6QhPz0tFJvduJiS+SbAfXGE778nfmL5AiuICgUSclchT29a/mEGseqEx87QlpZfKkO+zmQqagJ7IHO+q9+BWLtllJi/HxMg4pv085xYhdQm6xa24S82DGl2+FPGCT3ariMF/k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNF5+4gV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNF5+4gV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9271F00899;
	Wed, 23 Sep 2026 18:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790187336;
	bh=ffDq0xqBt+IGep2FVFd40UpnDWUTyRRz0vN+W3T1QZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XNF5+4gVCs0ArzErxiABVKxSx6bBDVaFDvVH1jR2Gzjr8ecQh2UVMQ5CNKgeImcUp
	 AEgnNU7TDB+hjcltg4/XGvKVur7qQGx4Tc59jvpDvdrb0XTEHN7xpO8dkExxvVLKQV
	 jGNlTRqc+qwFEJ1Xbjl2DROx3chVJ0Dx5a4LeBzMk2tqpdM3tHYe8lfo3T3MTN+QOt
	 /HCHnLOELYO7wd2VwroBSfRBv9W268LTbTNVXLP0U6pLMJmk3vczXzXQYN4VrM6NTP
	 kZSlz0dXvLZP9BxsrLyA7+dhAHaPouVocflW/03MHZo+IgHFk0N53AliBZhaeRS4EK
	 RyaunyLXL0e2g==
Date: Wed, 23 Sep 2026 13:15:33 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: coresight: Allow funnel clocks
Message-ID: <20260923181533.GM27237-robh@kernel.org>
References: <20260921232834.3138571-1-robh@kernel.org>
 <20260921233744.1FDBF1F000FF@smtp.kernel.org>
 <20260923160520.GI27237-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923160520.GI27237-robh@kernel.org>

On Wed, Sep 23, 2026 at 11:05:20AM -0500, Rob Herring wrote:
> On Mon, Sep 21, 2026 at 11:37:43PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] dt-bindings: clock-names schema forbids valid single 'atclk' config
> > --
> > 
> > commit 50eea7a4ef1f09b2ff4cd2b8b69396c108a1c74e
> > Author: Rob Herring (Arm) <robh@kernel.org>
> > 
> > dt-bindings: arm: coresight: Allow funnel clocks
> > 
> > This commit modifies the arm,coresight-static-funnel schema to allow
> > one or two clocks, adding support for the apb_pclk and atclk properties.
> > 
> > > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > > @@ -30,6 +30,16 @@ properties:
> > >    power-domains:
> > >      maxItems: 1
> > >  
> > > +  clocks:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  clock-names:
> > > +    minItems: 1
> > > +    items:
> > > +      - const: apb_pclk
> > > +      - const: atclk
> > 
> > [Severity: Low]
> > Does this positional item list unintentionally forbid valid single-clock
> > configurations where only atclk is present?
> > 
> > By specifying items as a rigid positional list, the dt-schema validation
> > strictly enforces that if only one clock is provided, its name must exactly
> > match apb_pclk.
> 
> Or name should be omitted... 'minItems: 1' on clock-names can be dropped 
> when applying.

Actually, this matches all the other coresight bindings. So it should be 
kept as-is.

Rob
