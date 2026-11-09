Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219468;
	b=aJREHlFTkpVGxs7/iHDfZpCsDU0+sai3AHxcqWCtDFxhDlgZoUzIBQcmqo6V+WM8QC9V
	 nq6GPP1FcBS3K+7JwkS/WBZuKKT0siel4dQ3lUo4j4lJoMg4Se5KlZPh8rFOizwDnwHfh
	 RkEZyHQIp+kic7OnuQpLoWPqwxxoYLK78dQPDLA0DFU9awuIrQVVm4FALMI5U4+t7uA++
	 3bvjWq9om9PpyHLUX/GhPR62tq2t+CYDKriULn5CjQvrgYkjYNz9+eogjOCs/lLkBphqQ
	 k+mxld2l1AIa8HN9j4AnzAdipkUEcfF9iz1gQ/aktYrO41N/LIfZ7aF6QrulBVVLNHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219468;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Ic7jHUfVZKqM2TKIUT0rc5yz6Z3PrS89BpZFZ+a+Jzc=;
	b=aPaEWngmpuVyiIBm/KVnGKnhTf/drrDiMAms6tBdGU6xMEdpdtn5zcVbjWEJt4C3+Mjx
	 xC3XQ/QodX4sRYxN4ZQcAdQEbACR7lfXam0Sq1JGVkOUKqonND8q8Mh1hoG4vZFey4y/d
	 W5JjpOM8myf7AL+yQXG7lV1yifWj73xR2+n9jokYRvp/kaRptV2Owr9RAZXzV8w5g7c/S
	 K7P7XeT3jfFU1+vbMjtpxpFN+eZDFTQRzXM1R496lOjR4RSTz4UO/x3jfHsY8ubusmQDe
	 iHS4JFiBwsarnsBFJupcOZtzlda16+RlCh4Vnsvhawk5A8zNGW8HaDO5uvi0tmOsylw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBPJjp+g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2E6606D80B;
	Mon,  9 Nov 2026 10:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FBPJjp+g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC461F0089F;
	Mon,  9 Nov 2026 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794219467;
	bh=Ic7jHUfVZKqM2TKIUT0rc5yz6Z3PrS89BpZFZ+a+Jzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FBPJjp+gHW5kzA3N2B/1DVWywmDXUy459v5nXcSoeQv9eGyqPE7KRG+BaJdelgjiE
	 IMNkLvuvIFOwOPdSASYqn31ocuI3nBtrdKWPvrVhoEUivf9h1ER6FNUCjEl8WIhBsP
	 5X7YbBbvAvZBfchMek1jQhdVmKRuhbS2s6Ib0KrCJkx9YJmAF4tO1TgvN9MHGcwfzx
	 VWxXVtK511vxCSbNT5aNlI48Xi+ZshWS0n1cg8YzVVczz8r2MJEXfob1psi/gqE9pR
	 L36KsI8PZBfYhA2HFvA168MKXcvAscLYwHCNx1sAHRbYcWG/uy5MJ2vfeIJ9+oEPDG
	 8eSQCRUdQRwFg==
Date: Mon, 9 Nov 2026 11:17:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Junyi Zhao <junyi.zhao@amlogic.com>, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
	robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, 
	neil.armstrong@linaro.org, Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: i3c: silvaco,i3c-master: Add Amlogic
 A9 support
Message-ID: <20261109-meticulous-salamander-of-ampleness-a74ce6@quoll>
References: <20261106-a9_i3c-v3-0-804b69b9095b@amlogic.com>
 <20261106-a9_i3c-v3-2-804b69b9095b@amlogic.com>
 <sashiko-outbox-200991@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <sashiko-outbox-200991@kernel.org>

On Fri, Nov 06, 2026 at 07:22:59AM +0000, sashiko-bot@kernel.org wrote:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - amlogic,a9-ao-i3c
> > +    then:
> > +      properties:
> > +        clocks:
> > +          maxItems: 1
> > +          description:
> > +            The "ao" variant is the controller instance in the Always-=
On (AO)
> > +            domain, which has no separate bus clock and derives the
> > +            bus clock from an internal divider.
> > +        clock-names:
> > +          maxItems: 1
>=20
> [Severity: Low]
> Does this new if/then block pass dt_binding_check?
>=20
> The dtschema meta-schema requires enum arrays to have at least two items,
> so matching the single amlogic,a9-ao-i3c string under contains needs const
> rather than a single-entry enum.  Also, property descriptions belong in t=
he
> top-level properties block rather than inside an if/then conditional.

Feels like hallucination

>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-a9_i3c-v=
3-0-804b69b9095b@amlogic.com?part=3D2
