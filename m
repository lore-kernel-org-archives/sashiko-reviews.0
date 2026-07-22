Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D73753E0B;
	Wed, 22 Jul 2026 19:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784748940; cv=none; b=cuHPjQfDAGMVPizfGtz8xvvPDH50T4hxmL6YC207GgeuyxYe08+qsbkK56D4Ock4MA4BZb84dJmnImycNk6sHB+pm8EKCl4ZVeR91njiqxdLPLk4WnLXjq0a0iZzLBETbExT7HLnmjF0fO4wEHo3DwSL426pMVBsJz35qJORsBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784748940; c=relaxed/simple;
	bh=hP+UdXNtwxLs8RDfieVjnkDGwPDhxKk/ZIxEtUzzyuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q95UKT2knT+irUASTq6JwWMGoTgm2iYMiWJ/eMUh43XszsujPgieXtwg1rQ5acO75RUTPuxXuyEaX7p+N9AMyfmOmTrW7L/3uyV5nJA6iR0PROe0LyPjurULU65QHQJixMJGvAPxO799iCh4OYtusiCXYu5vk7Mh7N8M54LgKag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6BirluH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6BirluH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B311F000E9;
	Wed, 22 Jul 2026 19:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784748938;
	bh=xiER9WGvQg7w4rdURxGa1/D0vVTMjSAk3LEg2gjmRTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A6BirluH9Y/0MgNVwCWigbwqan7d9j5JiuafDgStNaUhWbOteYwStk8K2tfPqO3Vk
	 KvEXbY4wTuu9faekX578vgFlqKLoDP0Mh4uG3I+27sACZOVYBwqqDPFQkO0PpyCSHU
	 negKw/F4B6iha7++juyD6SUNpAF9YElEVFhe0lw63umer71SM9fEBDFDE8o6E6rsTw
	 OzbhX7xJGcdrrGZAtH2ywaW8c2d34JjdvTyZXy/NHmhxvYRfU3PA/oK/MfWvfbjgqw
	 1sWT/HUDCa9N/yXgBY/zjfCi8FY03Qp6VBR5yFoAD1kl87eOCGTusyAYCAELRmpTTc
	 ckqqbja6/CzuQ==
Date: Wed, 22 Jul 2026 14:35:38 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@oss.nxp.com, devicetree@vger.kernel.org, Frank.Li@kernel.org,
	imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: soc: imx-iomuxc-gpr: allow bridge@18
 as child node
Message-ID: <20260722193538.GA1541480-robh@kernel.org>
References: <20260718-arm_dts_ldb-v2-0-f5669571aa2b@nxp.com>
 <20260718-arm_dts_ldb-v2-2-f5669571aa2b@nxp.com>
 <20260718145730.8D5831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718145730.8D5831F000E9@smtp.kernel.org>

On Sat, Jul 18, 2026 at 02:57:30PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing `ranges` property in `fsl,imx-iomuxc-gpr` schema will cause kernel WARN_ON at boot.
> --
> 
> --- Patch [2]: [PATCH v2 2/4] dt-bindings: soc: imx-iomuxc-gpr: allow bridge@18 as child node ---
> commit 5e999c2b583f7149956f10a90d92e24192451d5a
> Author: Frank Li <Frank.Li@nxp.com>
> 
> dt-bindings: soc: imx-iomuxc-gpr: allow bridge@18 as child node
> 
> The legacy i.MX6SX SoC imx-iomuxc-gpr contains one LDB_CTRL register.
> This patch updates the dt-bindings to allow the LVDS Display Bridge (LDB)
> child node under imx-iomuxc-gpr to resolve CHECK_DTBS warnings.
> 
> > diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> > index 721a67e84c137..1879638918bab 100644
> > --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> > +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-iomuxc-gpr.yaml
> > @@ -47,10 +47,21 @@ properties:
> >    reg:
> >      maxItems: 1
> >  
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 1
> > +
> 
> [Severity: High]
> Will this omission of ranges cause a kernel WARN_ON at boot?
> 
> Because the syscon node includes the simple-mfd compatible, the kernel
> function of_platform_default_populate() will attempt to create platform
> devices for its children. For the bridge@18 child, of_device_alloc()
> attempts to parse its reg property.
> 
> Since the parent lacks a ranges property, of_translate_address() fails and
> returns OF_BAD_ADDR. This causes of_address_to_resource() to return
> -EINVAL, which is passed directly to a WARN_ON() in of_device_alloc().
> 
> Because additionalProperties is set to false in this schema, users are
> actively prevented from adding a valid ranges property to their device trees
> to fix this.
> 
> Should the ranges property be added to this schema and explicitly permitted
> so that device trees can provide the required address translation mapping?

You need ranges.

Rob
