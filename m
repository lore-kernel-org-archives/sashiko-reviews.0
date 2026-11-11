Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405964;
	b=hQ+UCGfbsziZKzvGbUGvR4pFUfARYARJJnSwDhuedONwVaNjLCF9E+l0yBSKbbno5sS3
	 y7Ac581KgiKJnZo5S9vapN5+8YJ+kbgMfYZ9BjGGHVCvwCZ3kszDBUu+FdCwy9U1w8MFm
	 ks0ImRIQ4WYwnrI2gh51q9kz3jgTH4/dHJC0q5vokR5DiLKyJ5nQ0TqxcZ+AEUeu0Jwjt
	 yu12XzAFUdl+8zS2g6RCMDhSogQ8IIcmzYIOYPz8ElU2dr5drEGl4fBkjOPiW8f6Gv9sI
	 piaMx7Md+LWrUd5GK5yrCJRhmNf6crpP+hO3dTgpvqmmnuunKWcWit8kiY8XaFWA64w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405964;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=D4TyS8Y/WDY8hnQj6Eru7ypWQX8YAwLUlx6lvcYGC28=;
	b=sdQUbH4AO2NPa2YFnGIly1zIbyetAatIrlteKJE9L6KnI0PwqvAWQFZXcmS9KaSwoIfQ
	 Q4/LvfNYK4BPWqEdIooQk4JOMBPZ4Vb7yBpmduNWq2pG+IBFOSvhyXB2riSObL033mrMj
	 aX2yZ1jr47OTbOgbQDFA493QyJgGMgGzF14mGu/xbybgVHn/5RdzZo8rpAvGLj8V9ETKD
	 yE28qee3MlmXUIQoewSoRVEfxFFU4BkhvdmVMFQse1T0WV553PKcWwoWijWmLKwiA5w10
	 zsv63JeTPitUh4LlQQyUtmb7aGyvUB2EYS/elqIjqrxgGiyni5vWjsrXLJQQTYXukvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GeeEJ3tE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A59606A321;
	Wed, 11 Nov 2026 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GeeEJ3tE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0181F00A05;
	Wed, 11 Nov 2026 14:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794405964;
	bh=D4TyS8Y/WDY8hnQj6Eru7ypWQX8YAwLUlx6lvcYGC28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GeeEJ3tE/SLhG3VhWmb7uv2qB3C+Dn0sr8Yjodk7DcTDO4Y+WeaupFBIFPjcwY0j6
	 bv7r2Gl+wP5Bd0Wbk8++EzJCAyyqzBXn93eTtsEBLF7eYviqPP9sOi/QG8p4hH5KM9
	 K4YU0WiE1AfW2qnkqe3nQWqrnwsYyIvHSPUbgRHXtmebK9YNsUoZwvmll5h0E6hKd3
	 9GofRdtqSCV3KYbGR0PTkG+XzIMnQ4pBpWAbtdsBGttzC4IJMgwKsuJR2lhJqLtpH+
	 5S6daLwTrjofDj2FUKRIiXQqN5fjKm65RrxRQNR+u/t5ckcHTvUxsr0DDKgIhzoVbv
	 MfHGtuXW70l3Q==
Date: Wed, 11 Nov 2026 08:06:00 -0600
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: Convert HiSilicon GMAC v1/2
 to DT schema
Message-ID: <20261111140600.GA1476246-robh@kernel.org>
References: <20261109191641.653847-3-robh@kernel.org>
 <sashiko-outbox-207650@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-207650@kernel.org>

On Tue, Nov 10, 2026 at 07:17:28PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: net: hisilicon,hisi-gmac-v1.yaml omits
>   hisilicon,hi3516a-gmac
> --
> 
> commit ab6f211d13f9c7a3f51fb6e0f45f7089669c73d4
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> dt-bindings: net: Convert HiSilicon GMAC v1/2 to DT schema
> 
> This commit converts the HiSilicon GMAC v1/2 binding from text to DT schema
> format and relaxes the node name pattern in mdio.yaml to allow ethernet
> controller nodes that directly contain an MDIO bus.
> 
> > diff --git a/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
> > new file mode 100644
> > index 0000000000000..89ed6ab1905e1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/hisilicon,hisi-gmac-v1.yaml
> > @@ -0,0 +1,96 @@
> 
> [ ... ]
> 
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - items:
> > +          - const: hisilicon,hix5hd2-gmac
> > +          - const: hisilicon,hisi-gmac-v1
> > +      - items:
> > +          - const: hisilicon,hi3798cv200-gmac
> > +          - const: hisilicon,hisi-gmac-v2
> 
> [Severity: Low]
> Should the v2 compatible entry also allow "hisilicon,hi3516a-gmac" via an
> enum alongside "hisilicon,hi3798cv200-gmac"?
> 
> The removed text binding documented "hisilicon,hi3516a-gmac" as a v2 SoC
> compatible string, and hix5hd2_of_match[] in
> drivers/net/ethernet/hisilicon/hix5hd2_gmac.c still matches it, so omitting
> it leaves that compatible string undocumented for dt_compatible_check and
> breaks schema validation for hi3516a GMAC nodes.

No, the above matches actual users and the .txt binding was not precise.

Rob
