Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773B5233944;
	Wed, 23 Sep 2026 18:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790187024; cv=none; b=NqUz2g3rM3c9pm3hyBRjBd8mKyYyeBrcHf5uitXSfxj1MR3uiB/NPn7F3TKV5Khqd1DLPI7BxjCGsRNs8fH1niLGZYJb4eepgK9+C3OM5etlqQs3/IwdAFyirrb1FM4xNiITbru/kOKVTDo6ooBY6V1XR4cyHwHfl1PqhcpUxbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790187024; c=relaxed/simple;
	bh=eiWWzWFIUhclpiIMXoWB0DxXe94UWnzlkwxceYb2Qxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EDik+cXr++fpP+Gytp90ewj/C2g4RuTCOe80yHv6jbgoEJ7uXZsenWc2tgtXTOFozIFAVRf+YrkSbB43juB04Dc2++RWxaLp2ReS3k+jO2ukQnLG7fqQLgUsmxVMuWRCnRvwLgyKD4s2TfMXVg+6LHYo2p00zbaiKwJpNvJ4pk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iqRpxrQZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iqRpxrQZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B553D1F000FF;
	Wed, 23 Sep 2026 18:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790187023;
	bh=Fxb2q1DxhioaR56BCNJg+Ol9gf+WHOgjuh/wAmU0iqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iqRpxrQZQ65g+Tp9reqZ0Eldd8GDNjUYhH/L42095U3HYK4/w7gXpsC2OP6+/P/wZ
	 tumkeVHT+z7TVRuUGgla6AxKnmhO54AeJ1IzJ6dLs/ITBkom5AMfK5KzsUXYTAojO/
	 ve3cDKPTh2Q3tCYdrV+3yvEv7WaWrD9LubfTLZ+lJuCGTP5d2O8DBdoNNEw6ATzZfn
	 UB0CQQ8pRIgROafC2T9l3ST9Q7MOiMEg6eqVzCdb2gawd6DqMw54KmN5exnAghoQRM
	 Ah/9By2yJeGgFQiwLLPoC2y8cpnyZDuGSRsWQf5smT+5+rTOdZBln0RBmf4xtiWC9w
	 EEGJ2edSzB9Hw==
Date: Wed, 23 Sep 2026 13:10:21 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, mfd@lists.linux.dev, lee@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: Allow MT6360 interrupt flags
Message-ID: <20260923181021.GL27237-robh@kernel.org>
References: <20260921232701.3133291-1-robh@kernel.org>
 <20260921233250.355351F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921233250.355351F000FF@smtp.kernel.org>

On Mon, Sep 21, 2026 at 11:32:49PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: #interrupt-cells uses enum instead of required const constraint
> --
> 
> commit 3c231e0793c5c72fac7dc860b2b89ed70228f7a3
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> dt-bindings: mfd: Allow MT6360 interrupt flags
> 
> This commit updates the MT6360 device tree binding to allow the interrupt
> controller to use either one or two cells. It replaces the constant cell
> count constraint with an enum to support an optional second cell for
> trigger flags.
> 
> > diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
> > index fb65abf30d57b..828ed7f558f66 100644
> > --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6360.yaml
> > @@ -33,9 +33,10 @@ properties:
> >    interrupt-controller: true
> >  
> >    "#interrupt-cells":
> > -    const: 1
> > +    enum: [1, 2]
> 
> [Severity: Medium]
> Does this change conflict with the device tree binding subsystem rules? 

No.

> The subsystem guidelines mandate that cell-count properties like
> #interrupt-cells must use a const constraint rather than an enum to prevent
> ambiguous or variable cell sizes during schema validation.

There's always exceptions to guidelines...

Rob
