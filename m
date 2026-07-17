Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2793072618;
	Fri, 17 Jul 2026 21:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784322831; cv=none; b=TUsSSPlBoA6NDa2F/c9WFBsi/k1PHwmo4BxxUP4Fdfde8vuwTPbZclxv/qmf/TPw+3KcAGSehV6JnDno2EPsSAFZ3s0YWPGCnQjcmxKcYI7SUwgjKYOt04SfZHutfs2Ifs+9UdWPGqWxeZ93hMCzWWTfBqwSi6bDAXoSX8CfoCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784322831; c=relaxed/simple;
	bh=wU1n0hOrlprQHWnhzkaItTdslJW+pRo/wRH8azhdL3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iln8d19EhHy5IlQtjIoUi1rCTTa2QrfRActnNDA2KZ3rkOKOEkKRFCod1UVCn1JCnQjICA5blMJcMnM2oVJvTyV+PY4GiRO+h4OwPVdqSWBNRL33UQYyG8Fo0AhFvmSX8uiDkJTeBElRYivkDD9tjY1+Z439ThSRjBmEKDSruFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Qa8WNCTN; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Qa8WNCTN"
Received: from francesco-nb (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id 00E771F9FE;
	Fri, 17 Jul 2026 23:13:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784322827;
	bh=yMr4YvPSGTUuTkpmhzKNy6bqQMBEMI+em96DebwBIU4=; h=From:To:Subject;
	b=Qa8WNCTNZQoAWiX+O4hlDcq7TKa5qf37Ez5FtotARqbMVnyVjyATdvE5ao5Jqqnqw
	 3GuLyDRJ3XOkIAxbUWj6i3qzRhAYgkScI2QOPk2s2zXrh/lNaafOrt0NlneDRnfKJg
	 XWG4nmNOSHJMQJLUrZ7jpAUi8hOsuWsQtCv0cBSZaN3Y1UdrHZgNGWD5cnTRPU9Gr3
	 7c1vSn4gJLc2Tvcpaa7ejBJrXMmUHyvl18nSfxlFvFf6UgsdnXwXA1A3KFFi7fWMo1
	 Ji9bohztIvHjTG8VOd4nSkY8mHP+vTpz7ytj3HXeYRXVIsm2phq3kxgAAjEA5moJSH
	 j3XI+HZRUbeLg==
Date: Fri, 17 Jul 2026 23:13:44 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Frank Li <Frank.li@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	robh@kernel.org, dri-devel@lists.freedesktop.org,
	Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 1/4] dt-bindings: lcdif: Add interface pixel format
Message-ID: <20260717211344.GC512678@francesco-nb>
References: <20260717121847.488148-1-francesco@dolcini.it>
 <20260717121847.488148-2-francesco@dolcini.it>
 <20260717122808.693211F000E9@smtp.kernel.org>
 <alpQh0ASY1HgdNqE@SMW015318>
 <20260717205754.GB512678@francesco-nb>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717205754.GB512678@francesco-nb>

On Fri, Jul 17, 2026 at 10:57:54PM +0200, Francesco Dolcini wrote:
> On Fri, Jul 17, 2026 at 10:55:51AM -0500, Frank Li wrote:
> > On Fri, Jul 17, 2026 at 12:28:07PM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Low] Introduction of the legacy, non-standard `interface-pix-fmt` property for a standard hardware concept (parallel bus width), violating modern DT principles.
> > > --
> > >
> > > --- Patch [1]: [PATCH v1 1/4] dt-bindings: lcdif: Add interface pixel format ---
> > > commit 7225ea545d2ff50540972dd75d375b8ecea4f315
> > > Author: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >
> > > dt-bindings: lcdif: Add interface pixel format
> > >
> > > This commit updates the fsl,lcdif device tree binding to support the
> > > interface-pix-fmt property. The property is used to describe the hardware's
> > > parallel data bus transfer width to match board wiring and prevent shifted
> > > colors.
> > >
> > > > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > > index 2dd0411ec6516..209ee5a96e393 100644
> > > > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > > @@ -58,6 +58,13 @@ properties:
> > > >      items:
> > > >        - const: rx
> > > >
> > > > +  interface-pix-fmt:
> > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > +    enum:
> > > > +      - rgb24
> > > > +      - rgb565
> > > > +      - rgb666
> > >
> > > [Severity: Low]
> > > Is this introducing a legacy, non-standard property into the new schema ABI?
> > >
> > > Standard devicetree guidelines usually prefer endpoint properties like
> > > bus-width (defined in video-interfaces.yaml) to describe physical parallel
> > > data line configurations, such as setting bus-width = <18> for RGB666.
> > 
> > Make sense, can we use standard property?
> 
> video-interfaces.yaml is for video capture interfaces (cameras and the
> media/v4l subsystem). It does not apply here for DPI display interfaces.

ok, looking at this closer, it seems this is a used property also in the
DRM subsystem. I'll appreciate a feedback from some DT maintainer before
reworking this patch accordingly.

