Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F064189CB;
	Mon, 20 Jul 2026 21:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581862; cv=none; b=B6p1PwBHvrXOB3Ff1fOgjc0pwFAFkkWJ0KnT3iMDIQ6hCeQbPuNOhHApcNmKiqRGHduHTGh9k/s0pF1JHkdIJU+z62rj2At7cCiW2B/e9vxlAbP1NFlMueZU+a5cz08p8phUgHn2vmDN15Buv2D9eyR62TKtwK9PKeQ4xYndNbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581862; c=relaxed/simple;
	bh=fHlpBDFo0h5C+MVPTHCHj/I0IIF3P8Xw6OTUSQ4KlMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BUQDWxKNCTxTFBAnqbP58Ps/evX+GqHsXdTRsj2GuxU7fgpY/dB26gXubnteCpoO4zG3Nt3Jof5DWo3Fbym53bCvWv+VHhlY4SZgN3pM2ItZkzy+TY9ANPwPji5I8G3+oG6CVbzCX1pezxBiSBR+3iXvRQrb/yhmqilSrLW/6yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3sutJlM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3sutJlM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 004161F000E9;
	Mon, 20 Jul 2026 21:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784581860;
	bh=9lhCuiXr6X41yb55rcydR/afvTUzSPhyJq1fxtHexf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U3sutJlMk1B1gWjY4+QhkKc2SS4uUAJ7HzmunjqQ9Svn7DpSSkd94kLqsmj/4P7xl
	 2XP4FhS+0M0ZkfwVppae1LB7OWJPyXHRFFP1vhzoMTRaV/8P045XemDoWG04+BXXL8
	 1QgoZ5YfqDqElyhZLFm31gL8i4N7yx0dQMM/lxhbjaIZXUnA8WHcE/AE6piv8Jf+QG
	 oznik+9hx/auio8HNqeSK+BbvW7bXi6m0da3p35VR9e/fHi1fhCopQuRlq2wr7kpbw
	 VHPnc8GUWollLGjh/XKYkBTqqbBi0jncItpIMFnrUm114aLjyZmPQGW9Tce4fudvif
	 hOpb2WDasOkgw==
Date: Mon, 20 Jul 2026 16:10:59 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Bhargav Joshi <j.bhargav.u@gmail.com>, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT
 schema
Message-ID: <20260720211059.GA4091045-robh@kernel.org>
References: <20260713-ti-iodelay-v1-1-5f06d36c4aac@gmail.com>
 <20260713125721.2E22D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713125721.2E22D1F00A3A@smtp.kernel.org>

On Mon, Jul 13, 2026 at 12:57:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The child node regex `^mmc.*_conf$` arbitrarily restricts I/O delay configuration nodes to those starting with 'mmc', even though the controller is generic.
> - [Medium] The `pinctrl-pin-array` property is not marked as required within the child node schema.

Looks to me like these should be addressed.

> --
> 
> --- Patch [1]: [PATCH] dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT schema ---
> commit 59d5959fa2ce86d89ce637daf5f846ce2bedcb0d
> Author: Bhargav Joshi <j.bhargav.u@gmail.com>
> 
> dt-bindings: pinctrl: ti,dra7-iodelay: Convert to DT schema
> 
> This commit converts the TI IODELAY controller bindings from plain text
> to DT schema. It also adds documentation for child properties missing
> from the original text bindings.
> 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml b/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml
> > new file mode 100644
> > index 0000000000000..a399946ae8172
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/ti,dra7-iodelay.yaml
> 
> [ ... ]
> 
> > +patternProperties:
> > +  ^mmc.*_conf$:
> 
> [Severity: Medium]
> Looking at the patternProperties definition, does this regression arbitrarily
> restrict delay configuration nodes to only those starting with mmc?
> 
> The commit message mentions that mmc pins are just an example of pins
> needing dynamic configuration. If a device tree dynamically configures delay
> for other pins, will this reject them as invalid?
> 
> Would it be better to use a more generic pattern?
> 
> > +    type: object
> > +    additionalProperties: false
> > +    properties:
> > +      pinctrl-pin-array:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description: |
> > +          An array of 32-bit integers defining the pin delay configuration.
> 
> [Severity: Medium]
> Could this regression allow incomplete configuration nodes to pass schema
> validation?
> 
> Since pinctrl-pin-array is not marked as required, an empty child node would
> pass dt_binding_check, but the driver expects this property to be present
> to initialize the mapping. Should it be added to a required list within the
> patternProperties block?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260713-ti-iodelay-v1-1-5f06d36c4aac@gmail.com?part=1
> 
