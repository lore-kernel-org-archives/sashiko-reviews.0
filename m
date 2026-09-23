Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E87497B84;
	Wed, 23 Sep 2026 16:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179524; cv=none; b=eLtc3cCJ2GCwyr+NJle55NxpNqisam7YtxAfgFJVpHTZuXDDVXYXGNEq4g1vLnxUDs/lyoEOa6F6IkCofQtUhmV78gea/o90cI4LMrkO5JoG1xcfj7Lk5PosUylT8kwD7z+2wngvEA1wCdlpqxKl7uOkTz2Jt+UUKjlmrfHO4vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179524; c=relaxed/simple;
	bh=q8cUfNQksoEeTkLBpiDrT/IRN5bH+FaXJ/Qkmk2oFug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQs7DAqcrhqGd2nYY1c+CdKX+70jfvBl5K2+T8qplDQSi3ctwY8HXis+e/8COdLEzUV+vQq0LX0zLpjY+UJ5oRDm85Zqm4Tjw1xnZbBQoSjprctssApuJ9ba7wL7PDGRrN68LQK/SKrOp+2BXL9Zk8vVbo1qrf1+SwU7/CoKlkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LfSaGM+V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LfSaGM+V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CF91F000FF;
	Wed, 23 Sep 2026 16:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790179522;
	bh=3+axgyUbPx/jzXDFVeUotiXzYHOPsB5/21ztWxyCbmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LfSaGM+VXCxLS0KCjmEKLx+OIHQcvstUceI4ai0h4ORBT2g3MfwmFugB/Qqu6OTyn
	 QWGNf85YREnJlpAaMKxgyFGDwnStnyv0CE8OaG6j3okp5YpX0uQc6pags0G6KEWvEQ
	 M7Hq2hvgmIeJpc7ygagkcKU4hO8Vg2fS3c6Xdtv9DRM200B+kUM7XLNEkVJpt+vekT
	 boKj4yFtDD9/DE/vhIFGcVX0rejZ+PZ7+yFNxlOxJPm55bdS3eHtwBG45D3DtBQUA/
	 fBG8eJDyZHcYJbCPEra10qXv3nPvC0BcoJXUK/hWoncivQ7W3fNjSzR7C8nKI++AjY
	 l4h6r6mxvELWw==
Date: Wed, 23 Sep 2026 11:05:20 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: coresight: Allow funnel clocks
Message-ID: <20260923160520.GI27237-robh@kernel.org>
References: <20260921232834.3138571-1-robh@kernel.org>
 <20260921233744.1FDBF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921233744.1FDBF1F000FF@smtp.kernel.org>

On Mon, Sep 21, 2026 at 11:37:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: clock-names schema forbids valid single 'atclk' config
> --
> 
> commit 50eea7a4ef1f09b2ff4cd2b8b69396c108a1c74e
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> dt-bindings: arm: coresight: Allow funnel clocks
> 
> This commit modifies the arm,coresight-static-funnel schema to allow
> one or two clocks, adding support for the apb_pclk and atclk properties.
> 
> > diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
> > @@ -30,6 +30,16 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >  
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    items:
> > +      - const: apb_pclk
> > +      - const: atclk
> 
> [Severity: Low]
> Does this positional item list unintentionally forbid valid single-clock
> configurations where only atclk is present?
> 
> By specifying items as a rigid positional list, the dt-schema validation
> strictly enforces that if only one clock is provided, its name must exactly
> match apb_pclk.

Or name should be omitted... 'minItems: 1' on clock-names can be dropped 
when applying.

> If a device tree node for arm,coresight-static-funnel provides a single clock
> named atclk, it will fail make dtbs_check. This seems to conflict with
> hardware configurations where static funnels lack APB registers and may only
> require an ATB trace clock. The coresight driver itself appears to fully
> support this configuration, as coresight_get_enable_clocks() gracefully
> handles an absent apb_pclk.

There's no such case in tree. This patch is fixing a case we do have in 
tree.
