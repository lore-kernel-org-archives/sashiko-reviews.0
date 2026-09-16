Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AF74D990A;
	Wed, 16 Sep 2026 10:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554643; cv=none; b=XvV8qxx7yNdvV9r9cX1tmJ2f/Y9IcNMfp9dvMKositceF8NADZl3MkxcQtO45ZmcMVncI+0D9AvxY+m6uVtp33hKEFATEhQE1Vx/zIU7wDKS+KpETs7wSHG77VUeNFxsntoq/Kckh9e8t8dTpYSVLafWKKOmy/3vw5zisNcS6ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554643; c=relaxed/simple;
	bh=ToDiMD4kX9Iv406tqdtGXihdMYJOYTJMXqk/zYESWj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQ9Cmmge8m2goi7e6TjzfiT/Dg/WRlXqHYlpmoyDeWT3yMIf0d4kohP+2NHKvsUB2hhn22qHWMnsa2rOBbGw56/rmFJKSxzbqS7I0skj0Lm9Di6gTZC7giNlA8orjGJ4Zh9VhQZvtgjHfXjDE0p5yOJM8BhW2CJJg/mrjxudfBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HPVnz4nf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HPVnz4nf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B7091F00893;
	Wed, 16 Sep 2026 10:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789554620;
	bh=HMnGR1uP61JN+YKnnP9vFpggh244A2KHvY9fMIpEhfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HPVnz4nfexvQhm6Ny/K/nF407DX5XswJufYNl/mLsMCXQncIkes5DPb6rOyeCJPwk
	 V2EDc1JYGmk/bZrLXi1QuXydpXpSK7wPqG+qjvHRQUJSM//FCPShW1FVWIjz2OytjS
	 pgXxihgAW1VFKnfGsRWgsACXsXJF8UI197ss3ECqdaPAIRqbPOEvF9uZKYgYDOXMWL
	 adYRm9mb3tHlC2FSIPjqeQ9qiLikZf9KfDPbEPEIbArC/QYMuiGo3DnT71thp7mRXg
	 ijy6pWDL6snOx6Rpulb6Q8GieZsvAPQlS+0nIGyJt8OLernbgXOcUGj96S1peR7gbs
	 y4aGOo702H8Sw==
Date: Wed, 16 Sep 2026 11:30:16 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ryan Brue <ryanbrue.dev@gmail.com>, robh@kernel.org,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH 3/3] mfd: mt6397-core: Add mt6397 AUXADC support
Message-ID: <20260916103016.GK11487@google.com>
References: <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com>
 <20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-3-d35d2ac3d6f0@gmail.com>
 <20260916042448.A40941F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916042448.A40941F000FF@smtp.kernel.org>

On Wed, 16 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] iio: mt6397-auxadc: hardware state leak on error paths

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> commit e17dd59587f106380c3ede8aa27c118b33350f88
> Author: Ryan Brue <ryanbrue.dev@gmail.com>
> 
> mfd: mt6397-core: Add mt6397 AUXADC support
> 
> The mt6397 PMIC includes an AUXADC. Register the AUXADC in the mt6397
> devices array to allow the corresponding driver to probe using compatible
> string.
> 
> > diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> > index 9ec9519965887..5d5f816492aaa 100644
> > --- a/drivers/mfd/mt6397-core.c
> > +++ b/drivers/mfd/mt6397-core.c
> > @@ -261,6 +261,9 @@ static const struct mfd_cell mt6359_devs[] = {
> >  
> >  static const struct mfd_cell mt6397_devs[] = {
> >  	{
> > +		.name = "mt6397-auxadc",
> > +		.of_compatible = "mediatek,mt6397-auxadc",
> 
> [Severity: Medium]
> Enabling this device exposes a hardware state leak on error paths in the
> mt6397-auxadc driver.
> 
> In mt6397_auxadc_isense_enable(), if the second regmap write fails, does the
> function return without unwinding the first write, leaving
> MT6397_CHR_CON16_ADCIN_VSEN_EN incorrectly enabled?
> 
> drivers/iio/adc/mt6397-auxadc.c:mt6397_auxadc_isense_enable() {
>     ...
> 	ret = regmap_update_bits(map, MT6397_CHR_CON16,
> 				 MT6397_CHR_CON16_ADCIN_SEL,
> 				 MT6397_CHR_CON16_ADCIN_VSEN_EN);
> 	if (ret)
> 		return ret;
> 
> 	return regmap_set_bits(map, MT6397_AUXADC_CON14,
> 			       MT6397_AUXADC_CON14_CH0_NORM_SEL |
> 			       MT6397_AUXADC_CON14_CH0_LBAT_SEL);
> }
> 
> Similarly, during teardown in mt6397_auxadc_isense_disable(), the use of the
> ?: operator short-circuits the sequence.
> 
> If the first regmap_clear_bits() fails, will it abandon the cleanup and skip
> disabling MT6397_CHR_CON16_ADCIN_SEL?
> 
> drivers/iio/adc/mt6397-auxadc.c:mt6397_auxadc_isense_disable() {
>     ...
> 	ret = regmap_clear_bits(map, MT6397_AUXADC_CON14,
> 				MT6397_AUXADC_CON14_CH0_NORM_SEL |
> 				MT6397_AUXADC_CON14_CH0_LBAT_SEL);
> 
> 	return ret ?: regmap_clear_bits(map, MT6397_CHR_CON16,
> 					MT6397_CHR_CON16_ADCIN_SEL);
> }
> 
> A similar issue appears in mt6397_auxadc_battemp_bias().
> 
> Does this function lack a rollback path if the second or third regmap
> operation fails, permanently leaking previously modified register states?
> 
> drivers/iio/adc/mt6397-auxadc.c:mt6397_auxadc_battemp_bias() {
>     ...
> 	if (on) {
> 		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
> 				      MT6397_AUXADC_CON0_BUF_PWD_ON);
> 		if (ret)
> 			return ret;
> 		ret = regmap_set_bits(map, MT6397_AUXADC_CON0,
> 				      MT6397_AUXADC_CON0_BUF_PWD_B);
> 		if (ret)
> 			return ret;
> 		return regmap_set_bits(map, MT6397_CHR_CON7,
> 				       MT6397_CHR_CON7_BATON_TDET_EN);
> 	}
>     ...
> }
> 
> > +	}, {
> >  		.name = "mt6397-rtc",
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260915-rbrue-suez-upstreaming-mt6397-auxadc-v1-0-d35d2ac3d6f0@gmail.com?part=3

-- 
Lee Jones
