Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F3138330A;
	Wed, 23 Sep 2026 16:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790179340; cv=none; b=DXUJWiMYilwhSZDKwUOkqNTSpjKXSlYR5kysAFBujsPR5bXyx/kwSz8TdcqFE4jd8WyZ7PsX4LmWlngobnhKI9ivKCbWQXohl/H6av4FIb8vaGbZAOmDFv2/Hw0CdD8VwTW3jijLJH1cyijOiaMA6sM7LkYGndoYLhoVutWIunA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790179340; c=relaxed/simple;
	bh=yKqqCaXaiAW7wcD+XrLEsBiEhxfIF0z6QLyTnpWUAUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVBFmDv/69/msuiS1f8Wg2CgexS+MgAPyq1CqUnMqDtfbIS0p4O/HANPdFu/zg77ZeGCMwvWrYYEG33cewSPSDAOfY4VHrL2j+dxIMZo0Z/FfXDis3yEf2/AyN3Zw6Ztneufo4gCbWXRMBR67ZSqRAn25A8HobvepEf2KYOU6Pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOpNUTzq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOpNUTzq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1325A1F00893;
	Wed, 23 Sep 2026 16:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790179339;
	bh=VsHoebKLwX02l5yE7/WLv3OzxkTclCZuDFVV2fPFhPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AOpNUTzqlpUj6/3ZR+ipsdFTEolmjgzWuAuAzrUmukDipLBrOqbzsDm6jzQaJ3yG0
	 U39U6NneYANvmeqoNbWS1+LyAuAx5pNIgzVMC7M/6k8MDWGBc7pmhNSBVvo4IzQgcf
	 f4m63UMjckCAJt+oIc4vkgagxkoavdMnfNRENi84gsF36Tvb2rK3bYV+ftaccqW3mG
	 QhZj+ghckTtaVZIq1YdMlTBckJkD3KZM2rSS5VLJaFy+vxaBLNJjFK8PwhC+v0dF9C
	 NPcCGUDWjlmJQ1W2GknHhXnNl3zuYEdiOLYXW3LU+JiHfZCvJ7Q3P9gQUa5jjF52DG
	 v4e+pSfP25lWw==
Date: Wed, 23 Sep 2026 11:02:17 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: mfd: Add MT6397 sound DAI cells
Message-ID: <20260923160217.GH27237-robh@kernel.org>
References: <20260921232649.3132592-1-robh@kernel.org>
 <20260921233645.7ECE11F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921233645.7ECE11F000FF@smtp.kernel.org>

On Mon, Sep 21, 2026 at 11:36:45PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: mfd: missing conditional enforcement and example for #sound-dai-cells
> --
> 
> commit 81069b8500a138169e7ffa4f54dfcaa00429702d
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> dt-bindings: mfd: Add MT6397 sound DAI cells
> 
> This commit documents the sound DAI cell provided by MT6397 PMIC nodes.
> 
> > diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> > index 3cbc0dc12c319..e2caa049a60ba 100644
> > --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> > +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> > @@ -57,6 +57,9 @@ properties:
> >    "#interrupt-cells":
> >      const: 2
> >  
> > +  "#sound-dai-cells":
> > +    const: 1
> > +
> 
> [Severity: Medium]
> Does adding this at the top-level properties block bypass conditional
> enforcement for specific variants?
> 
> By placing "#sound-dai-cells" at the top level without an allOf: if-then
> conditional block restricted to "mediatek,mt6397", the schema fails to enforce
> it as a required property for the MT6397 PMIC, and incorrectly allows it for
> other PMIC variants. 

No clue about the capabilities of each variant, but I would guess if one 
has audio codec, then they all do.

> Should it be added to the required list for MT6397 and included in the MT6397
> example block, as per DT subsystem guidelines for new provider capabilities?

Perfectly fine to use this h/w and not use the audio functionality. 
Also, new required properties can be an ABI break.

Rob
