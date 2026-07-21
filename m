Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B532A3845D8;
	Tue, 21 Jul 2026 14:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784645426; cv=none; b=BpFvIuevj6GG/v5LA3+2pI1vQCbqMuBTZhLcq8oDXJPaH83XLnDaF3YcCxyFljywzg8VoFlJ0Ec6Yi6S7fSlat8MoxsS53BMaduXP7UPl/mgHBjQsFwtxC9TVrKUH3n+LT+cc1eDtq2TjSbtWzo2dPIa4dDIY9tsdSZiSejB2PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784645426; c=relaxed/simple;
	bh=XyZPDmAs4Og2Ktb6HQmw1zbyOXmEaQXe2HwWXKHp+jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZD9o+y86c2Z5PK06/ltQG+smgECcozc/l9sFtSCaUsR04Vvo+gBWI1n87A1kvCn/2ohXVbxLobx89YZGkuDhJe3BrLZJkvHmA/cBlfbirrLTEzZFGOdar5Allj44uUU1zDczmivv3bGNgM1kYfc07+u0rUlx2pLV6gNbH2OkZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJ9DVqTl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJ9DVqTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C321F000E9;
	Tue, 21 Jul 2026 14:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784645425;
	bh=LXLcyHvsPkhBHHb6X2CAZ9UwnrE6MX2BBxsaoDVc4rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kJ9DVqTlrIQWG9lyjSuS2jpC3IAmsUAwdwVXg/dMnqfT7kwPhDj1ORvTInYMaeRht
	 /w1/zrJ+Vj3UpJwm4hHjPI3id1mN+4GEpl2/Gm6DVlv/PsSQ3dM30nBFcWYNDbyADz
	 PtDDfFouyS4W0AkaMtpvH1m1lc4JtkCTmUz/zTxfTcnhPNy8WPDkyknDHBta93gLsx
	 HKB9XxenWvFqp50ELOEhkHMf7QmQ4JdyzKakacv8GQ8QAndPHwKhqL7ZNV01tTnwMw
	 oIZoW7bXgvzsL8YWlk6YePqt+NBDpv0cvkheArKhl7xxV7iLgKW2eFhxiIJWXw/XIi
	 9i17b31z0oOyw==
Date: Tue, 21 Jul 2026 09:50:24 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Wojciech Dubowik <wojciech.dubowik@mt.com>, conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 2/3] dt-bindings: display: sn65dsi83: Add output
 data-lanes property
Message-ID: <20260721145024.GA3790672-robh@kernel.org>
References: <20260721071253.1098652-1-wojciech.dubowik@mt.com>
 <20260721071253.1098652-3-wojciech.dubowik@mt.com>
 <20260721072022.52FFA1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721072022.52FFA1F00A3A@smtp.kernel.org>

On Tue, Jul 21, 2026 at 07:20:21AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Redefining `endpoint` in `port@2` and `port@3` with `unevaluatedProperties: false` unconditionally rejects valid vendor-specific properties (`ti,lvds-*`), breaking schema validation.
> --
> 
> --- Patch [2]: [PATCH v6 2/3] dt-bindings: display: sn65dsi83: Add output data-lanes property ---
> commit c8014187b83b236fe065488764ddd649223ae575
> Author: Wojciech Dubowik <Wojciech.Dubowik@mt.com>
> dt-bindings: display: sn65dsi83: Add output data-lanes property
> 
> Adds an optional output lvds data lanes property with two allowed values
> for standard and reversed layouts, informing the driver if the reverse
> lvds config option needs to be set.
> 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > index e69b6343a8ebb..4000bf0b13709 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi83.yaml
> > @@ -86,10 +86,54 @@ properties:
> >          description: Video port for LVDS Channel-A output (panel or bridge).
> >          $ref: '#/$defs/lvds-port'
> >  
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> 
> [Severity: Medium]
> Does this local redefinition of endpoint with unevaluatedProperties: false 
> unconditionally reject valid vendor-specific properties (like ti,lvds-*) 
> and break schema validation? 
> 
> In JSON Schema, unevaluatedProperties only considers properties evaluated 
> within its own local evaluation path, so it won't see properties evaluated 
> by the parallel $ref: '#/$defs/lvds-port'.

sashiko is right here.

Rob
