Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAEE292B2E;
	Wed, 22 Jul 2026 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784749628; cv=none; b=tvo1966Ni5kbAybrW1KZ0+/g7SMnnz8Bp8RVctM5kOY3PpaG522/ENQwJW6BkhWuxi9aCh52efE0KXm6L4aK3hoYXo5fbKECeafjt6dh+QPmn88M29tDLH0ogQirRsNr4V1cmS0p8Pvj7cEt2diGqP0kl1/LfUktTgVDzf3VuUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784749628; c=relaxed/simple;
	bh=+RDEQWMCMljKR0yBIihc8yzDff+RKXG2l9xaCTwQIWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZYbd+KJIgZAubCpGHcg3Ycm6p+EH87qs3SITeav37Sue1EmCQQPh7cyfT/28dxqSeGQ4R7kfojm+W1j5SOcR1cYtFcqL8odTiOt/K+/1MAukiHhjcQ6QPK/6hAs7SIn/FTELn/P5yWbPa9d5xaOMpDU7HR7Fn4IJ32dWTi+EIKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=tIxVz/nc; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="tIxVz/nc"
Received: from francesco-nb (93-38-170-58.ip71.fastwebnet.it [93.38.170.58])
	by mail11.truemail.it (Postfix) with ESMTPA id E38471FA0B;
	Wed, 22 Jul 2026 21:47:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784749623;
	bh=Ijtk+bxGjefd3BFxrgHKuzhrZVrVdvf6txD8HAvKjiw=; h=From:To:Subject;
	b=tIxVz/ncyyxwhfpXs4BsHyZ87BzwiyGF33dzBYOGa4veP8xDdcPnykumghVoVeZeH
	 7/5IbfHEVS8Z3rvkTpH6e8VIlkazuBSSN1+dQvQ4yPiZMOIBaYm4YKFDP9R7I7yspZ
	 ups5PQqMbYTjRPEqSYiOrxoHShXvfsxy41qMEXfTFQd8CXQK18XQN4DePQYa654gle
	 cVDLmr5qcXx975kdgYOr0qWaRs0e0mtM+xestJ8Hy/WhdAj+XaKq5hpbnIX5eHAI1j
	 XzPColBP3DOqGFC1bNcWSzuHYM7NvGNH4ZeZmF5Oi4puQrfZUKv3M5ilJaN56Ad2KO
	 jHP/BA50vt7YA==
Date: Wed, 22 Jul 2026 21:46:56 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Frank Li <Frank.li@oss.nxp.com>, sashiko-reviews@lists.linux.dev,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v1 1/4] dt-bindings: lcdif: Add interface pixel format
Message-ID: <20260722194656.GA73938@francesco-nb>
References: <20260717121847.488148-1-francesco@dolcini.it>
 <20260717121847.488148-2-francesco@dolcini.it>
 <20260717122808.693211F000E9@smtp.kernel.org>
 <alpQh0ASY1HgdNqE@SMW015318>
 <20260717205754.GB512678@francesco-nb>
 <20260717211344.GC512678@francesco-nb>
 <20260722193044.GA1489843-robh@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722193044.GA1489843-robh@kernel.org>

Hello Rob,

On Wed, Jul 22, 2026 at 02:30:44PM -0500, Rob Herring wrote:
> On Fri, Jul 17, 2026 at 11:13:44PM +0200, Francesco Dolcini wrote:
> > On Fri, Jul 17, 2026 at 10:57:54PM +0200, Francesco Dolcini wrote:
> > > On Fri, Jul 17, 2026 at 10:55:51AM -0500, Frank Li wrote:
> > > > On Fri, Jul 17, 2026 at 12:28:07PM +0000, sashiko-bot@kernel.org wrote:
> > > > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > > > - [Low] Introduction of the legacy, non-standard `interface-pix-fmt` property for a standard hardware concept (parallel bus width), violating modern DT principles.
> > > > > --
> > > > >
> > > > > --- Patch [1]: [PATCH v1 1/4] dt-bindings: lcdif: Add interface pixel format ---
> > > > > commit 7225ea545d2ff50540972dd75d375b8ecea4f315
> > > > > Author: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > > >
> > > > > dt-bindings: lcdif: Add interface pixel format
> > > > >
> > > > > This commit updates the fsl,lcdif device tree binding to support the
> > > > > interface-pix-fmt property. The property is used to describe the hardware's
> > > > > parallel data bus transfer width to match board wiring and prevent shifted
> > > > > colors.
> > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > > > > index 2dd0411ec6516..209ee5a96e393 100644
> > > > > > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > > > > > @@ -58,6 +58,13 @@ properties:
> > > > > >      items:
> > > > > >        - const: rx
> > > > > >
> > > > > > +  interface-pix-fmt:
> > > > > > +    $ref: /schemas/types.yaml#/definitions/string
> > > > > > +    enum:
> > > > > > +      - rgb24
> > > > > > +      - rgb565
> > > > > > +      - rgb666
> > > > >
> > > > > [Severity: Low]
> > > > > Is this introducing a legacy, non-standard property into the new schema ABI?
> > > > >
> > > > > Standard devicetree guidelines usually prefer endpoint properties like
> > > > > bus-width (defined in video-interfaces.yaml) to describe physical parallel
> > > > > data line configurations, such as setting bus-width = <18> for RGB666.
> > > > 
> > > > Make sense, can we use standard property?
> > > 
> > > video-interfaces.yaml is for video capture interfaces (cameras and the
> > > media/v4l subsystem). It does not apply here for DPI display interfaces.
> > 
> > ok, looking at this closer, it seems this is a used property also in the
> > DRM subsystem. I'll appreciate a feedback from some DT maintainer before
> > reworking this patch accordingly.
> 
> I reject any custom properties for describing the format of the parallel 
> interface. 

v2 is coming tomorrow using the common bus-width property

thanks for the feedback

