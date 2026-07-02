Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127193168E6;
	Thu,  2 Jul 2026 06:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782974681; cv=none; b=A4xnPcdzJh1z5eBcwujt6D7sI3irWMbR2TGLFAwKXisSWQUlBFoO7iR0F4XthDjlfHLHZUoVKXON9S/HixR64LUksF8ASh2kdArdHh8wBkKlPHENvU62Mfbrwncj0D7fT2hWBa8LLxvike6w8cBT8r5iccPh0ao8dNwp7q9WViU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782974681; c=relaxed/simple;
	bh=JqjPYq6p2MqXXm0Y2W6qY4nb2o3X0M3pxwfmOF6/zxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVAe9TdZs9kAKQMWAqim7Gqv3E23/Ax+Njv+V5rFiezyccbtfJgKnfE52m6PLkQtDZusYyUQ9D2OuALGC+p35BzmFbdAe6Yf6Akfj+DZUNi1I7kQ0OWkuM6nVqDPKA2dACoMd/EFLrhjATH64Tgf9PM0K2ccp9PwvXUtsanJipo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2XlaCWY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2XlaCWY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86AB1F000E9;
	Thu,  2 Jul 2026 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782974679;
	bh=hpJlPNzQmt3UdfB41YOIWwIalCk5ZyKRBN8DlhlhYhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q2XlaCWYOU/eCr25+hf7p6LYBwpoPKbi7mGFtCkO2tBtM7zFlowhyz5v9nXRgSNim
	 m7lYlxh5jAhJKiY4spSFvrj2TuUec2A+OhOdF/It00lYszG+vX5+GxztSRtDDzwPRO
	 jhfHZxQB3clmM4FssW5upPpbgt0qKUObRVIczqvgX6USDsxclYw3zg7sY/6iYh9jgD
	 DlfTYeGTmpqYQ/h/9ZPEp4LEJaOO8CRVjTYDiueRdrHcm2MR4a9rT70jP0FC+xpDtX
	 sSdX5Cj9Wn0MPAokh87TZauFrhS9ZXVNyv2usAtbONuPj6DOohJj+SpBoP+X6u6rvO
	 njFDwznZ5Zh9A==
Date: Thu, 2 Jul 2026 08:44:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: apss-ipq-pll: Add IPQ5210 support
Message-ID: <20260702-magic-meek-scorpion-f14792@quoll>
References: <20260701-apss-clk-v2-0-776d054ab8c3@oss.qualcomm.com>
 <20260701-apss-clk-v2-2-776d054ab8c3@oss.qualcomm.com>
 <20260701071534.456D61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701071534.456D61F000E9@smtp.kernel.org>

On Wed, Jul 01, 2026 at 07:15:33AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing 'const' qualifier on 'ipq5210_pll_data' structure.
> --
> 
> commit 82121884055bac497befa1efc2a14f014cd9e6e1
> Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> 
> clk: qcom: apss-ipq-pll: Add IPQ5210 support
> 
> The Application Processor Subsystem on the IPQ5210 platform sources
> its clock from the Huayra PLL. Add the configuration data necessary
> to set it up.
> 
> > diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
> > index 3a8987fe7008a..569ac76c75dc3 100644
> > --- a/drivers/clk/qcom/apss-ipq-pll.c
> > +++ b/drivers/clk/qcom/apss-ipq-pll.c
> 
> [ ... ]
> 
> > @@ -140,6 +152,12 @@ static const struct apss_pll_data ipq5018_pll_data = {
> >  	.pll_config = &ipq5018_pll_config,
> >  };
> >  
> > +static struct apss_pll_data ipq5210_pll_data = {
> 
> [Severity: Low]
> This isn't a bug, but should this structure be marked as const to match

This is a bug.

I do not understand why existing code cannot be copied, but instead some
old deprecated syntax is pasted. Probably pasted from downstream crap
sources. Such way of working was scrutinized enough and if things do not
improve, well, this should be NAKed.

Best regards,
Krzysztof

