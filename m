Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795478755;
	b=FIgGdjJLX+EEKmzFa8zw5j16yPecbybDKiDnlFOKAMJz2xT1QIHn0c7Ygg1+VOGEimX/
	 sizTPAfqlzuj4SbX3VjYP7FDqr4FwiDDJx+lxMT9DmRO5pmJ4F8lCYM0o2YqfzSR2Yd7W
	 C16Qd9T2D2CT8PpO2xQXA3Njl9Zn2rq+hDAxx1vLNY8d6RwXYMeSSsesIxZ+n+lCe8hT+
	 0/5VUr/CnfgzJD/J/WtEyRZ8Mrbr+Apx0VyM2V+eIq9R2zzgfH7CGp2t4v/gsSeUM1SbZ
	 lC8NTRgjZhLEFuOEwPyhjG/RoFKNQoEHWjDiUdYFynPSQgOoNoKOPQPmUJEpnb7l1JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795478755;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nFXgaCkm2ZKc0EJf6IWJsCaQr6jha6aEaYYHNUZ+Ql0=;
	b=xxaM528NIAYlMQnSFpis+fVysZaAHaMedXZw97QmsgUsm8zIZ+z2Tzxp2t7ve51OR8Cy
	 lkbez9smtAeOFZ655hC8SnhSI3GW5okaawFqDdG/OL8XGauHS3QUcT2D/O50vTr/yL5e2
	 AWSbRiRthGmH3ZVb9s1dxe6DEAYwzi1cZyJT0ytzgsehBkmhC7JtCq5c5ftAOvCVHN/LP
	 KTx9DEgHGOXizS6runQLGhYFwXUiXLGm99MaAleG8Tz8CvO7U8ROeHRmyQO9iAADCtvHf
	 0J7J9HI+JoN3Hc3LKFz+rQP4Z6lZRMuu3HyYfaD5fj+sEXqiD/vA8SbWOPgCXrtx0/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqgZpSfx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6BE606A31E;
	Tue, 24 Nov 2026 00:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqgZpSfx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575431F000C6;
	Tue, 24 Nov 2026 00:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795478754;
	bh=nFXgaCkm2ZKc0EJf6IWJsCaQr6jha6aEaYYHNUZ+Ql0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kqgZpSfxRNhtdnXWIb8spdtaIBv6RqEL7KDrjn0wOK/ujdtFhxNYGRN76Gk+p6G8B
	 pUgONTYHKu/SS+vhPvFvraZzBYk0vLrDVxihP0BFeU2KHqjKbwS7idzpBgLOa21H3V
	 pcLyigNR/SU4DzXlfXDS5Z/J60fOu1M0OQtRP/zYrsdehVQA6eZ/bDiSHR6A2oXo6E
	 bs8YOKRldElaAJTvGbENDsAa5dgS2QHtftY0wfHgj0ITp9TSkUO+LTgePtfGwqdB9m
	 tynEZXc839+KIymmZ+pGhM1vhfHsUMOiltTd/H1inId7tijZvHsSO/1geqgyT4wj7j
	 jR6gM4oXghKnw==
Date: Mon, 23 Nov 2026 18:05:52 -0600
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org,
	lee@kernel.org
Subject: Re: [PATCH 5/9] arm64: dts: marvell: Fix node names
Message-ID: <20261124000552.GB3404231-robh@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
 <20261111-dtbs-marvell-v1-5-938788aff3ae@kernel.org>
 <sashiko-outbox-209904@kernel.org>
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
In-Reply-To: <sashiko-outbox-209904@kernel.org>

On Thu, Nov 12, 2026 at 12:21:41AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: dts: marvell: ac5: dma-bus@0 unit-address mismatches
>   ranges parent addr
> --
> 
> commit d32f1cd6738013623bd9cd4b37c287a2b69edbf8
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> arm64: dts: marvell: Fix node names
> 
> This commit updates node names across several Marvell device tree files to
> use standard naming conventions.
> 
> > diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> > index 4878773883c95..814b8a2e8ea93 100644
> > --- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> > +++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
> > @@ -231,7 +231,7 @@ sdhci: mmc@805c0000 {
> >  		 * Dedicated section for devices behind 32bit controllers so we
> >  		 * can configure specific DMA mapping for them
> >  		 */
> > -		behind-32bit-controller@7f000000 {
> > +		dma-bus@0 {
> >  			compatible = "simple-bus";
> >  			#address-cells = <0x2>;
> >  			#size-cells = <0x2>;
> 
> [Severity: Low]
> Should this node be named dma-bus@7f000000 instead of dma-bus@0?
> 
> This node has no reg property and defines:
> 
>   ranges = <0x0 0x0 0x0 0x7f000000 0x0 0x1000000>;
> 
> In check_simple_bus_reg(), dtc skips the 2-cell child address (0x0 0x0) and
> matches the unit-address against the parent /soc bus address (0x0 0x7f000000),
> so building DTBs with W=1 warns:
> 
>   Warning (simple_bus_reg): /soc/dma-bus@0: simple-bus unit address format error, expected "7f000000"

This is correct, but then we already have another bus @ 7f000000. That 
is the real issue.

Rob
