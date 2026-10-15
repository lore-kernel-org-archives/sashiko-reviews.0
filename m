Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5BD74477E3;
	Thu, 15 Oct 2026 19:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792091473; cv=none; b=HcJEA62PEfJdI2C45sf1QkdczstcaXT+JVuua+AVonHjy2s6npow7Gd10gY02x82AQOYKIkQV9m433fj7JLGDk5oOngu97iAVIZ+udIYaxO53pXILk5OuqkFmokMvBYST5kFQ/uRQVQ923zwhr8yuuPKPMRdMfduCunhnVioVP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792091473; c=relaxed/simple;
	bh=UI7aqrZ5P2WoMQcPnINVd4pqEHRrNvj4RFqS0BctRos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J/Otsu8aCvDxh100rfIWpqUqIChNB+MW9yvKJDb4yz7Eau7RuGvDnTUejemip2mKPDjGM74gpDUF11gbtHC9e4EJZ3JjBviMXWq9+OvO5TuYlZN7QsKBtyCYL3GCRbjXiTWLProOG0D9O6ZiP7fqeWeLfoDhgQNqHgLLvQnm2WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJ6QBdLE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJ6QBdLE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E871F1F000C4;
	Thu, 15 Oct 2026 19:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792091470;
	bh=oXmNpCPOc7PrRNagDxNj32NtDgAynuREgwko8j7L/e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MJ6QBdLESoihs7ojJe0WyX14k3HyCS8Zbur1LvFynwMgVseVTywHsa3dXvK9LEgkd
	 Xn5RJd4VwJ0inw54iet+mqd05a5EQXQq8EH3g8+PLSEKT5oCAhl9+BajdAoetf4bpb
	 5CBLMz/bQnpgIfbqShg4vBb5a4q9e69J0JwawMjZKDeI/VhE4DCYa8rvoQ7/JcEFHe
	 EVBqnrASLT0r/5CTVkRpYnuaY4pW4C6sbA/Z3ImBBWkPxPE6Tb85WL1/JJAwxowah7
	 GhX+E0i+tOs9kf7VGQ1XzGFcFpT66v4YwhISVI3OHliG9CGCi4+XOkm0uu/3coJvsH
	 g5YVaFufPGFsQ==
Date: Thu, 15 Oct 2026 14:11:08 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, olteanv@gmail.com,
	conor+dt@kernel.org, neil.armstrong@linaro.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: phy: qcom: Relax required supplies
Message-ID: <20261015191108.GB5059-robh@kernel.org>
References: <20260921232603.3129898-1-robh@kernel.org>
 <20260921233422.E6B0D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921233422.E6B0D1F000FF@smtp.kernel.org>

On Mon, Sep 21, 2026 at 11:34:22PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dt-bindings: unintended schema relaxation for qcom,ipq5210-qusb2-phy
> --
> 
> commit 69ee638f4004f6e325a963f3b804b3c1cac5c6fb
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> dt-bindings: phy: qcom: Relax required supplies
> 
> This commit relaxes the requirement for three regulator supplies in the QUSB2
> PHY binding for legacy IPQ6018 nodes that do not describe board rails.
> 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> > index 001fd0ccc9852..2516eab7f6d32 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,qusb2-phy.yaml
> [ ... ]
> >  allOf:
> > +  - if:
> > +      not:
> > +        properties:
> > +          compatible:
> > +            contains:
> > +              enum: 
> > +                - qcom,ipq6018-qusb2-phy
> > +                - qcom,ipq8074-qusb2-phy
> 
> [Severity: Medium]
> Does this unintentionally relax the schema requirements for IPQ5210?

Yes.

> Since qcom,ipq5210-qusb2-phy falls back to qcom,ipq6018-qusb2-phy, an IPQ5210
> device tree node's compatible array will contain qcom,ipq6018-qusb2-phy.
> 
> The 'contains: enum' logic matches this fallback, which seems like it might
> incorrectly apply this legacy IPQ6018 exemption to IPQ5210 nodes, allowing
> them to silently pass schema validation without the required regulator
> supplies.
> 
> > +    then:
> > +      required:
> > +        - vdd-supply
> > +        - vdda-pll-supply
> > +        - vdda-phy-dpdm-supply

If these are compatible with ipq5210, they can't really have more 
constraints than it.

Rob
