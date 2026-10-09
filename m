Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D944DEC34;
	Fri,  9 Oct 2026 14:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555334; cv=none; b=B8dBrkI0TIV9IRH8jHZrSzkIBhzuEc8H+HWLz+cZxMctVw6WPnX0DEckyACvGsGuTF2RXDdwxAM9y+CZsBbyfDsraoSvye7FaSgw12KGTLqTaAA6js1EJlU99EVC6UsERJAfc1vVnsS6rqIZLcmQnkh0gGU9asxSN+0XBSH6BtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555334; c=relaxed/simple;
	bh=n4ncK8Hc7quGspB6KqNeLniCTNy9lgQSPEpqpMHi9Go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ms0GEZLDtVjRsYpTzPzUCbUTWttxoNXnr/txk7XCP7N5nk50CKZJAPZ0OSl0nhSoPU+gNJ1zpPj9gYUQEcYGMplkSQWntlPUHYXpmCZN1x6yMy8aTMM+sMbUI4qWJyv6PMXAIPsrZeug7yjZqDe9H3wAC5n54pTdcg5cwxIbTh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f56yAEC+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f56yAEC+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A3F1F00899;
	Fri,  9 Oct 2026 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791555329;
	bh=RiaHyf3ej4O2YU0dL19brJPc2v7EU4L7rGeeNh3oslk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f56yAEC+Z+FOvTOJ078v59Qddz48eqlBhr3vc7TQ36mqoDoxAL6zOby3AmAsBHAC3
	 2Y2LpJPJn1jEoBlAlSBZUOpD/lIKC8zschIMg6HFwZqL+t9bq3nydL9+QR4qb2JfJE
	 gAjjvlUaLSexQyKWVVqaOQiXlD3Vn/Ss5EyZED+emQupd2FydQD/8hWzVkKIm2p/lC
	 mrFzBGogFqKFBWTy+KC1F1jTkC36GulFcdFrDHf+eKz/QZi+D8x5EpnNzoBrthMamA
	 WQFcC9zI+clGc5mFvUdDoDVedb6IUKnFQB7Qi3aueEkzXzNadb6wS3bBmXY1MfA3Bp
	 OsaIfSbYzew+A==
Date: Fri, 9 Oct 2026 09:15:28 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: joakim.zhang@cixtech.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
Message-ID: <20261009141528.GA1631855-robh@kernel.org>
References: <20261009092552.2377960-1-joakim.zhang@cixtech.com>
 <20261009092552.2377960-2-joakim.zhang@cixtech.com>
 <sashiko-outbox-165170@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-165170@kernel.org>

On Fri, Oct 09, 2026 at 09:32:13AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: loose schema constraint on dma-names allows invalid configurations
> --
> 
> commit 41d6caf5f15433436b2c0289025efcf429404414
> Author: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> ASoC: dt-bindings: Add Cadence I2S-SC controller
>     
> Add the DT binding for the Cadence I2S-SC controller integrated in
> the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
> controller supporting standard I2S, left/right-justified and DSP
> formats, plus TDM operation with up to 16 slots.
> 
> > diff --git a/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> > new file mode 100644
> > index 0000000000000..3fdf2334c4926
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> 
> [ ... ]
> 
> > +  dmas:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description:
> > +      One DMA channel for instances wired for a single direction, either
> > +      "tx" or "rx", or two channels for both transmit and receive.
> > +
> > +  dma-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    items:
> > +      enum: [ tx, rx ]
> 
> [Severity: Low]
> Does this schema definition permit invalid DMA combinations? 
> 
> Because items is set to just an enum, this allows combinations like ["tx", "tx"],
> ["rx", "rx"], or out-of-order configurations like ["rx", "tx"] to silently pass
> validation.

Yes, normally that is prevented, but IIRC there's a binding that needed 
something like this.

minItems: 1
uniqueItems: true
items:
  - enum: [ tx, rx ]
  - const: tx

Then when both are there the order is enforced.

Rob
