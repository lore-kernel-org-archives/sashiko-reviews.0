Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D45384CEA;
	Mon,  3 Aug 2026 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763244; cv=none; b=hLeu65sNV6yTjkd0hy8mNd608ayRzYsnrpe9pf+5RLFn34W6pn9y1N6hH0IKCxkHBGdhsNFG8dO0Zax2C1mxfrpCic/osesubhsaCrJshqhTlzGAFDdf+ev8JeZLBXpuMk0yrQ0CSRbf0bddJKmXrNYcowZjMDsql29mQVac0Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763244; c=relaxed/simple;
	bh=33xivn7ZTdCpVt8nJ61HC5K0snDrz/jRiGI6PhzMIXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OaKJPyIi9appcXZ1xavk08CLUbbE/UKVmCBPPjxx22/wp/Yc1ZhqBQjakXSkuKVIql6rKA9CREHGSyLC+SV2FkUsvuyOespO4lYc7J+eIqPHlvMaWOG05jhpnBE2iTKuXp9aQgk42QHifvclrTdfiZHxDUz3yFxj7WRoiwGO8Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vfq5axvm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vfq5axvm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E07D1F000E9;
	Mon,  3 Aug 2026 13:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785763229;
	bh=3M+77CTGWT0seKEmX9Zfc1rth1QKdujys104KTSchmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Vfq5axvmY1KhznV2gq5kiytUJJeniPr2A/Ajx8fz6zb2nvfYzLPZjhI7QeU3UixN4
	 y9lOczryuLku+M/a/oor4Ka+1NZqbs2XXi4XBQ2boha7PUm8WohKxujBn3ixNj4uFq
	 SY+YKPk+1QhcDvHJhIAKJ7eDcCmwUpCOFZARGmYBpLktxYHtjZa/TtMg0La/6SApQp
	 k326EE7waAC8w5lKL40ngoI8CouENFCKI6hhqZe7zjWeFbC6CSZdB+EmDAZJmHD1Lc
	 j/AQvbJz+gHA6D9Cleisgf79uXmKwbAcuMnTekw4whv9lvzQQwV7knbB2b1SKNVaFl
	 pzZdzim4Adaxg==
Date: Mon, 3 Aug 2026 08:20:29 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: shengjiu.wang@oss.nxp.com, conor+dt@kernel.org, Frank.Li@kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/4] dt-bindings: sound: fsl,easrc: add ports binding for
 multiple contexts
Message-ID: <20260803132029.GA2108420-robh@kernel.org>
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-3-shengjiu.wang@oss.nxp.com>
 <20260720101654.3A46A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720101654.3A46A1F000E9@smtp.kernel.org>

On Mon, Jul 20, 2026 at 10:16:52AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The schema fails to restrict the `ports` container to the 4 supported contexts (ports 0-3), allowing invalid extraneous ports to silently pass validation.
> --
> 
> --- Patch [2]: [PATCH 2/4] dt-bindings: sound: fsl,easrc: add ports binding for multiple contexts ---
> commit 0461b121d300fd40233634f4b977c32906d647ce
> Author: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> dt-bindings: sound: fsl,easrc: add ports binding for multiple contexts
> 
> The i.MX EASRC hardware supports up to four conversion contexts
> (A, B, C, D). Add a ports container property to the binding to allow
> each context to be represented as an individual audio-graph port.
> 
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > index d5727f8bfb0b5..0f579870110d9 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
> > @@ -55,6 +55,29 @@ properties:
> >        - const: imx/easrc/easrc-imx8mn.bin
> >      description: The coefficient table for the filters
> >  
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    properties:
> > +      port@0:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for context A
> 
> [Severity: Low]
> Is this ports container missing a constraint to reject unsupported unit
> addresses?
> 
> Since the inherited graph.yaml schema permits any port@.*, a device tree
> defining port@4 or higher will currently pass dt-validate without an error,
> even though the hardware only supports 4 contexts. 
> 
> Would adding patternProperties: "^port@[0-3]$" or unevaluatedProperties: false
> to the ports block help catch invalid device tree configurations?

'additionalProperties: false' in 'ports' is what is needed here.

Rob
