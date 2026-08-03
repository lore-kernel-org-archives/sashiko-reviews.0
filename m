Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB3540B0FB;
	Mon,  3 Aug 2026 14:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767564; cv=none; b=eYuNAIe8z/hgNApQD3Dj39QkfVvp/eqTgQs9+p3dkqc3sQePU737/cLE9stj8ZogsQGa9TZyQB1u7Aa/BnViwIv6iDKwrnh0AkNVJXNpgvQvesU/TTYeqQni8W98QvoFfSKMdBFiRpp6hSzFgjaC/nYN5V9vb0zM6LPSmew4bHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767564; c=relaxed/simple;
	bh=qG6GFx0LNRftNJMQeSITFbVXN1+rUFbPVDeQkE5hv8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YuMIHBgjyH2G+4kVK7Zg3ZH/1aePlXgPtee3ooCT0bvDzJ2fjeVK66bpLh0OHxgRjOaBgNjrRCRJHUD2+Hn+xThkeXRH2f3xTJMT7CddQ4ij0Zwu89ZgOEraKTvUN2JButtx2syAobCM9pfCw3E7fzv/nCIHgtwv1RXLAQ17kvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QUPBTl2p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUPBTl2p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EAD1F000E9;
	Mon,  3 Aug 2026 14:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785767562;
	bh=+MvjEox02nrAn0z45q6fn8PHVoWaNqOPmiIqFcaqtnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QUPBTl2pipdm0XUD5ghg05DTqF6JXGNI7J4CWx6Ab3MMv5q5iE+UCy+RUJEuH824j
	 +7pObk08TxUPA61W4gwlf2trz+sp3kFO/LK6US774DlBKZsd3Sj/gtCMkjug1QVf1K
	 ISxy44eacyelk/MG6Ep3vskDVrbFTKFhT9NGmfVYLRkuPJiyRxEfwWJL5B62U12Iak
	 X6/yx4C8M3HN1/g2jmsRlWIGR21FfO6fxGfSnpOJxnP4cCsfKMiyyqNm/HF3u0Jp1l
	 J1/PonD01JyFA/Vv0Zx/CzMdsykgeHDiGlHxflkPfqj4Dev8kWqitY7RJS4Wd7xoF0
	 EdpnP7xaOyKwA==
Date: Mon, 3 Aug 2026 09:32:41 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ramshouriesh R <rshouriesh@gmail.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, media-ci@linuxtv.org
Subject: Re: [PATCH v6 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor
Message-ID: <20260803143241.GA3364728-robh@kernel.org>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
 <20260801-hm1092-driver-v6-1-5979f223748a@gmail.com>
 <20260801130150.5BDB41F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801130150.5BDB41F00AC4@smtp.kernel.org>

On Sat, Aug 01, 2026 at 01:01:49PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The schema fails to restrict the `data-lanes` property to a single lane, allowing physically invalid device tree configurations to silently pass validation.
> --
> 
> --- Patch [1]: [PATCH v6 1/2] media: dt-bindings: Add Himax HM1092 NIR sensor ---
> commit ee5879a0923ec6b56edc74d8a66ff697b111ae09
> Author: Ramshouriesh R <rshouriesh@gmail.com>
> 
> media: dt-bindings: Add Himax HM1092 NIR sensor
> 
> This commit adds a device tree binding schema for the Himax HM1092, a 1
> megapixel monochrome near-infrared CMOS image sensor. The sensor is described
> as outputting 10-bit RAW data over a single MIPI CSI-2 data lane.
> 
> > diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1092.yaml
> [ ... ]
> > +  port:
> > +    $ref: /schemas/graph.yaml#/$defs/port-base
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        required:
> > +          - link-frequencies
> 
> [Severity: Medium]
> The commit message mentions the sensor outputs over a single MIPI CSI-2 data
> lane, but does this schema restrict the data-lanes property to a single lane?
> 
> Without explicitly defining a data-lanes property constraint (such as
> maxItems: 1 or items: - const: 1) in this endpoint block, the schema inherits
> the permissive defaults from video-interfaces.yaml. This would allow device
> trees specifying physically impossible multi-lane configurations
> (e.g., data-lanes = <1 2>;) to silently pass schema validation.

data-lanes should not be present, but that's probably an issue on a 
number of bindings. There's not a great way to so this other than using 
'additionalProperties' instead and listing all the properties used from 
video-interfaces.yaml. But then you have to list 'remote-endpoint' 
everywhere which is not great either. I'd rather just allow the property 
even if it doesn't make sense for the h/w.

Rob
