Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C275305699;
	Fri,  7 Aug 2026 15:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117902; cv=none; b=pNBeQr3LODYSasFZVjfvu6/41orC2yXM3lhlXnyAgZm8X712wvDQkplHLHhyASMU+bwQkcj2+Qsu8TxpIelh3BQS3+vTpZvzpwlL5XxV9HyXa5e8RnMJ52Ayt3x3c4wR2CLvbL5Wi+mmLbJmlXr9CQANP3aLQm3vn9cwNWZnhxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117902; c=relaxed/simple;
	bh=jOIJgFZhtrCN8yQUck+4cseH9Q2Y1bR+woS8n5Mtn9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k17alQuJ6ecULOonGtn70tzr3YNEAK+dTR6saEkxMgU+w1LOtOc4TkBEQZua9i2Dm0GycIR9L3k8/O2gLWqLRsBb/xcwk2w17rw0svuvnzb9knrskMkF/dODcb0zTl4668qRrtS8RESAJ9k2NNbTBgNEVbNI8682YafpjZQSmFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aYLkVVQ7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aYLkVVQ7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D80871F000E9;
	Fri,  7 Aug 2026 15:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786117901;
	bh=gIpqIEJ1hpxZU+jdGL2zT4kDorAYvLQD53HhekKbuRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aYLkVVQ7c0l2WVoIIpbvPYPvfyKYPZRBAn185d7bbCQc6iaeaEep5onjdOqi8tPvl
	 xSrATgH2XtMDnM5t2uasfEsrv0pOSnsQaCvo28W1bsjNLr47BLOPDB1C8jJ+JAzHIa
	 Xb4cQObD0owIsW1Ewqp7lpSTIdI4NBWaoasK0AJEtgZOTUUlRDR14D3y33AMXjwx+V
	 Q2S82vr+8GfZTXPTxbKiRw+KTWjjzt0IPdfJvSbwxtrUSu71dsXqETLnTj1cjGnUqc
	 X/lLf6b5AFd4GODQCS/pJDF+RRyN7sSig8+zHrdLcw9Ml/XC59OlNWMci9E4IXEkTN
	 2qbZR2d1zwhwA==
Date: Fri, 7 Aug 2026 10:51:40 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v11 20/21] dt-bindings: display: rockchip: dw-dp: Fix
 sound DAI cells
Message-ID: <20260807155140.GA882294-robh@kernel.org>
References: <20260806-synopsys-dw-dp-improvements-v11-0-0d508505f383@collabora.com>
 <20260806-synopsys-dw-dp-improvements-v11-20-0d508505f383@collabora.com>
 <20260806174000.668AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806174000.668AB1F000E9@smtp.kernel.org>

On Thu, Aug 06, 2026 at 05:39:59PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Device Tree schema validation breakage for existing `rockchip,rk3588-dp` configurations.
> --
> 
> --- Patch [20]: [PATCH v11 20/21] dt-bindings: display: rockchip: dw-dp: Fix sound DAI cells ---
> commit 2c15bbfcf4dec184872abdf4c2e06063a52d1e2f
> Author: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> dt-bindings: display: rockchip: dw-dp: Fix sound DAI cells
> 
> The RK3588 and RK3576 DesignWare DisplayPort controllers both have two
> possible DAI interfaces: I2S and S/PDIF. Thus an argument is needed to
> to select the right interface.
> 
> > diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> > index 2b0d9e23e9432..c4f8959dd65da 100644
> > --- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> > +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
> [ ... ]
> > @@ -83,7 +83,8 @@ properties:
> >      maxItems: 1
> >  
> >    "#sound-dai-cells":
> > -    const: 0
> > +    const: 1
> > +    description: 0 for I2S, 1 for S/PDIF
> 
> [Severity: Medium]
> Will this strict constraint update cause make dtbs_check validation to
> fail for existing in-tree device trees?
> 
> The mainline arch/arm64/boot/dts/rockchip/rk3588-base.dtsi still defines
> #sound-dai-cells = <0>; for DP nodes.
> 
> While the commit message notes this breakage is intentional and will be
> fixed up separately, could changing the schema without the accompanying
> DTS updates cause automated CI validation failures and break bisectability?

Yes, and I don't love the intermittent warnings introduced. As long as 
the warnings are on a downward trajectory, I won't notice...

Not saying you have to do something here, but this will get more 
strict...

Rob
