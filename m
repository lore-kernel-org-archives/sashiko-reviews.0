Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFCA415F39;
	Mon,  3 Aug 2026 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767077; cv=none; b=D7Yc77DDONUC6xeKed6/or/3T3gkYGObO4ZDahv71RbeiLmM68eZBaI6IAEpPVKoqb84E+UYhKN+HftrbEvLWtpZCFCAAubWC0uzMal4kQKkFhd2NigxhbA58D2fBQWNa9aWPifb/i8jGOYDReL/x7/ymmD1pb5jgwQjsO8CDCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767077; c=relaxed/simple;
	bh=7g7eEA1bu05u5lOSUH8CCLrf42Bm8Br4DlRfbxoSooQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCnpFZr8IfsGOW6sQLzc8W5KtXFr7F3L8KS7kw+smUK7+d3BxUlb6Etqc+dKEHCs15kXtbipvaNaVU9oj8ElKkboAgkb86VgBE7BFRGIuZaQgHMCxONe0wMcBsVc+h+8pQ7NpMaCheK0L+Rbsd+kgmo6rSrW7lGfFRBvatusbJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMFA7xQJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMFA7xQJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D50F91F000E9;
	Mon,  3 Aug 2026 14:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785767076;
	bh=ifZTwHILIcV5rLGR7LJpTs1bMZXBo6VWmvzT2PddO08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RMFA7xQJJkUahSpl49QKFePKMhneDyd+RND00OfztVfNyOtxmMfTBQUTql1LJ0cHk
	 FfFJqKL1/92wrH0zqH7NVPTbVVr2Nzv/zs4HstQRpMJLVsY26ookptE1dX5LwaT3z6
	 eXhDAenL68lHY1+TUi5ENoAnVX8YItYm5UOLiaCqoTnBTTC+YL0zeqiH5bT+DkLamC
	 /JHYApcXvYIvi3L0ZC7PxKuc7fBKodwCpSFAbIvydofW61FzCx6Oln4yxKt/m1wdWB
	 8TlhKwuRCMW4Wdj0piaWk1G8YMTMbPNCjShbCZLbr8w9XuGk44FXn+/foc6gVyVUEW
	 Zmlgs95gq0Xxw==
Date: Mon, 3 Aug 2026 09:24:35 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 05/25] dt-bindings: clock: mediatek: regroup MT8188
 dt-bindings into MT8186
Message-ID: <20260803142435.GA3302421-robh@kernel.org>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-5-ac4410697cc2@collabora.com>
 <20260802112233.374711F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802112233.374711F00A3D@smtp.kernel.org>

On Sun, Aug 02, 2026 at 11:22:32AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `allOf` conditional block incorrectly uses `enum` instead of `contains: enum` to match `compatible` strings, breaking schema validation for MT8188 nodes that require `#reset-cells`.
> --
> 
> --- Patch [5]: [PATCH v5 05/25] dt-bindings: clock: mediatek: regroup MT8188 dt-bindings into MT8186 ---
> commit 504c0ed21eb6420741b43bf9c5aae33308e93b7b
> Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> 
> dt-bindings: clock: mediatek: regroup MT8188 dt-bindings into MT8186
> 
> This commit merges the MT8188 clock and system clock device tree bindings
> into the existing MT8186 schema files. It aims to ease maintainability by
> having common files for SoCs with similar clock controller designs.
> 
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> > --- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
> 
> [ ... ]
> 
> > @@ -42,11 +65,36 @@ properties:
> >    '#clock-cells':
> >      const: 1
> >  
> > +  '#reset-cells':
> > +    const: 1
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - '#clock-cells'
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          enum:
> 
> [Severity: Medium]
> Does this compatible match logic need a "contains:" keyword?
> 
> Since the compatible property is evaluated as a string array, matching a list
> of scalar strings directly against it without "contains:" will always evaluate
> to false.
> 
> Without "contains:", does this mean the schema will skip the "then" branch
> and incorrectly apply the "else" branch ('#reset-cells': false) to all MT8188
> nodes, causing correct device trees to fail dtbs_check and allowing incomplete
> ones to pass?

The tools will fix this up to be a list, so that's not an issue. 
However, using "contains" here is preferred so the match will work if 
one of the compatible strings becomes a fallback. IOW, the position and 
number of compatibles should not matter.

Rob
