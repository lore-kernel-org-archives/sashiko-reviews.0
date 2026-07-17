Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D797B25F98A;
	Fri, 17 Jul 2026 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784321883; cv=none; b=uwaMaW5qGpGnn1jApoRMHDR6O6haFFLbRjoZLBH/nIjkdlGz9SOm6G55sNt8d+L234IGj93puniPd/QL7wVwecwXwlsA1EUXPqnfvqUExrNN8HlDCH/5PTVMcF0H7oKrCHUd/bpZNKlz/Qc3wNqUgBWfFgeRN6tqbgVkpLJDYec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784321883; c=relaxed/simple;
	bh=AOCcIIfaEH+bV9kcCYzaAU/ZO4FuVJoxZarDy3zWIFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FjQcLtV+CEq3e5GUfYNSkbd2TJu0hdp1k7uDS9szhvqMGKzdSKMGjto91KpyXegMqvznc/L4oEdbxAvShwEKguQY6Jzsn21JJE+ugQWmg43ocx3EerhR+Al1rJkWFe2/8jcI6phOYnduGgBDX7MgAKHxxnqo8t5Lg5cLp+PqqMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=vIEmv3bW; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="vIEmv3bW"
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 15D15214F2;
	Fri, 17 Jul 2026 22:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784321877;
	bh=ZY59QmJoDS4x6XunqiqFX794Y6AFTfjbSPkMaoden4M=; h=From:To:Subject;
	b=vIEmv3bWCu7GGACJsv1Rx3V4ix/1xckRb5NWI5csFIidmxE1WxpymWfbmEEZUSgnA
	 fjPg7sNX5PD3skxSqKofdWO95LvZr8lQL7dcYleUFM9Eh7RmSIcKOoJbQDJw73NZ75
	 Yeq+HIt5BQozcysJqoZeQp0i71qrNtnL9RUuSJlmVzL7jGEtZ7cttsHVM+ALtt4di/
	 /CUSRnA5jTwqOqhDlKdqJgHBltk+ZiRQetndLo00rmkhX8CUKlPhknrz1PUwAqPIt6
	 DpqFYyR1WYjl+L5PNCgU7puPtV5LwgVvenzUkCA1Mv/gmP1D8f4D3zv4Cows/HqLz9
	 OH8ZUemSQ/v3g==
Date: Fri, 17 Jul 2026 22:57:54 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev,
	Francesco Dolcini <francesco@dolcini.it>,
	devicetree@vger.kernel.org, robh@kernel.org,
	dri-devel@lists.freedesktop.org, Frank.Li@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 1/4] dt-bindings: lcdif: Add interface pixel format
Message-ID: <20260717205754.GB512678@francesco-nb>
References: <20260717121847.488148-1-francesco@dolcini.it>
 <20260717121847.488148-2-francesco@dolcini.it>
 <20260717122808.693211F000E9@smtp.kernel.org>
 <alpQh0ASY1HgdNqE@SMW015318>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpQh0ASY1HgdNqE@SMW015318>

On Fri, Jul 17, 2026 at 10:55:51AM -0500, Frank Li wrote:
> On Fri, Jul 17, 2026 at 12:28:07PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] Introduction of the legacy, non-standard `interface-pix-fmt` property for a standard hardware concept (parallel bus width), violating modern DT principles.
> > --
> >
> > --- Patch [1]: [PATCH v1 1/4] dt-bindings: lcdif: Add interface pixel format ---
> > commit 7225ea545d2ff50540972dd75d375b8ecea4f315
> > Author: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > dt-bindings: lcdif: Add interface pixel format
> >
> > This commit updates the fsl,lcdif device tree binding to support the
> > interface-pix-fmt property. The property is used to describe the hardware's
> > parallel data bus transfer width to match board wiring and prevent shifted
> > colors.
> >
> > > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > index 2dd0411ec6516..209ee5a96e393 100644
> > > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > @@ -58,6 +58,13 @@ properties:
> > >      items:
> > >        - const: rx
> > >
> > > +  interface-pix-fmt:
> > > +    $ref: /schemas/types.yaml#/definitions/string
> > > +    enum:
> > > +      - rgb24
> > > +      - rgb565
> > > +      - rgb666
> >
> > [Severity: Low]
> > Is this introducing a legacy, non-standard property into the new schema ABI?
> >
> > Standard devicetree guidelines usually prefer endpoint properties like
> > bus-width (defined in video-interfaces.yaml) to describe physical parallel
> > data line configurations, such as setting bus-width = <18> for RGB666.
> 
> Make sense, can we use standard property?

video-interfaces.yaml is for video capture interfaces (cameras and the
media/v4l subsystem). It does not apply here for DPI display interfaces.

Francesco

