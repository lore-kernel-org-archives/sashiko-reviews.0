Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966632;
	b=uZdoceFBO1hbuSvSLR6Vstv1Y+3+hZtwUfRPQzCdO8pUhqVgNX2NT0XhlgooCMD3tQSm
	 bd6a5kPHgLdU5+Of7haq0fExvI+dF5KZiiv+yP+PS9CIlaJ5oJi56zMmImrENUtDVaCj3
	 mkQC3MLUV6TuDf0pfxYalxo9EAB/aJOWHDKizbKX+Jq8+2zuqmXx4BIP7ANg7ZfdVTT33
	 ELWHg2oE/SUENoGbI2qTg6ED0plJ4tEs2s05u1s3ZW2IGfnzfZlfoS2v7vpaf1k4OaIta
	 fq8DKvRdNbPMDxfv0poRRLsKUPpdSXGKmsLUuLa5o8C/qowiIy1Nl6hdCShOnUkWODg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
	 X-Google-Original-Message-ID:Date:From:To:Cc:Subject:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=+3ys0FdSf1xCr+CCWg4Cx51eRM3hYz8a1czENaT0wUU=;
	b=NBzcze7nGvUGj4Ru1rwgn22f0R9w+bbTY100F8L3S/j8t6voDstkjDWpf4gKMOAw4z2N
	 IUN++N3HFX4aFgT1HnjO8xLwySvv6BsIwOUXK/JnYA57DxPDRSdoo6LLUZ8gVvxi0I1LF
	 Hn/U/kAOGYHvrQRn59elh1vuCnZWDBX0PQ0P9ffbuprKrr+uTO7uBj+iPD9cueoHzBZ12
	 03CG06oDCHM6JVXXTledi1rStU+El21mC9+YAwiwSBgxS3Og+nxXKN8cBHRcsUQ4kDb17
	 8rG4de+p1OqVw4c94ibXlWasaVeTu9KbnScqAe+X1MgyL7uI3WHDb5+8unbvyn4O2kA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cp/8kYUN";
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776EA606D83E
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 12:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 776EA606D83E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cp/8kYUN
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e46e449e8so362192f8f.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 06 Nov 2026 04:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966630; x=1794571430; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+3ys0FdSf1xCr+CCWg4Cx51eRM3hYz8a1czENaT0wUU=;
        b=cp/8kYUNzxML5Lm8zQlJcaQjSjFHc3pjS3STozP31mCuJaRuMQq2zQUPA2pxBk7Mkb
         IcLHFx4sWUNyTV1oOpWe7RArNFNeJED/PiJg/arkVfL1ideQ2ArMlqB/ISq/FAFCpr1G
         1F8pR15aFnW15Py83+fbFdAKNnO1lADq3GCvAY11QQiHP4hTIW57TEHWTsgQ2fuwGWME
         Zu8Syf+dByLEFUY1W6ARx4+eOInhKYTJ+C8aZgpzZzAyysyeBp+MYclF4+Bn9DfrEp5d
         LIiVOww0KlcnICiu2XVqjNrMIkXS+cum/OpONdj+NY6BsGeJOWUjW1/7CzXGbwmuj/OC
         RGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966630; x=1794571430;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3ys0FdSf1xCr+CCWg4Cx51eRM3hYz8a1czENaT0wUU=;
        b=V1IKmp/8GtKyx+GUWsUF6g8KfPOcUgpl8vdmL/WUzkLsz0/dTzRVxLUWMiNSCIV1hB
         5msNwSRuzMmMzY4siCMW2p+Ubh5JJm1Z8pgaURVNsclZOMc/yt36g0i/EcEpBRXr2xpi
         NZ9wnLqrlLXINcR3FDzkqO69hkJpwBMAf3fSZI/SyQmMkulIcphg6w9FPLTJCKtW5GBn
         xF5GNZtS1qE4S5WFYU8dk6ak8JMy6iD0c6P284XUVwqRA7g6AMaoe8kOUqe3aHDZ9r4x
         LYzxLklB1OIfaKSBvtswT2NLupXJHkOsOh+HMoY3AVRSbeDe2N4NNYNcQ9Vgqv9z0PBz
         9kmQ==
X-Gm-Message-State: APuU4Z/84dR4iftX5I2P/3h8ee6BWYVWK4HE6iOVLZcgdSgY/LjD4WBr
	FCPDWK9a5BCHCn+vNBUSEHbGfdLQiVTX9xShEHJOagluu1bNtJZvC4nkRYv3gg==
X-Gm-Gg: AYBFou0ZIHMxRpnlGtuzRboObus+QwxvjRQrZ2YF/cVGdbLJw5kaHHk0qZPvH8yWxo+
	qujJJxtYz1vR16fOhTlSz5mZZjI2YWy2QhLjLV3tw6UWj8BiXNHgkBPTSE2suSCFjHfToto44Na
	EIm8yW36zHrN13fNNFcCTqt4Gjc+HAyv2ZSssAi7/V1ttY3JXhwZdkeZmQRJEZlUFFBHfo5naHc
	dYzWBhrlblWk1OYpltgREPVGiAglKPeTVvc18aetu6fvWqp5uwZkqWMFtnhU5SbGBglVTTboxcU
	p0ft0+FD29JUpIB8R1HpQw8fnqXFU3/t6dpWURbahZVArxKp+pUeypBR7oAHPrD/XIAUABfim8n
	wSBaMBjFPvXZmGnJKmiM85gv7VWBtTozji23nkdLS1Jy/agyKTSDjazdxjbCwOuXbj3QqGBo43G
	1m13S/mvMwAcBSWNhJH2vVnY/siv9+I63y42SItB4hcmZIm0qlVneO+CiE+XqQzr7+Ko6aXrfnW
	nIKyqpUb5fR/FvYmG4R5tS7KncckWFEiUblq++D9FYusiFOv7XROPrNf9FK6oxK5DvDWQ0XmioC
	yQfNtfF8kknOzJpsLG5Q+CVz61nRAu/EzaByksy8y+zkFBu7+sNqutMml5XjtMbiPVghdURpqAX
	MjU4afn9C75qPhyA=
X-Received: by 2002:a05:6000:26c5:b0:48b:e50:714e with SMTP id ffacd0b85a97d-4927730ed37mr4922729f8f.36.1793966629679;
        Fri, 06 Nov 2026 04:03:49 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d609c8sm3590824f8f.6.2026.11.06.04.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:03:49 -0800 (PST)
Message-ID: <6aedc225.21bfadee.6a467.f4d5@mx.google.com>
X-Google-Original-Message-ID: <au3CIhBF7z593ZpE@Ansuel-XPS.>
Date: Fri, 6 Nov 2026 13:03:46 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/2] clk: en7523: add support for .set_rate for en7581
References: <20261106113227.182324-1-ansuelsmth@gmail.com>
 <20261106113227.182324-3-ansuelsmth@gmail.com>
 <sashiko-outbox-201354@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-201354@kernel.org>

On Fri, Nov 06, 2026 at 11:45:13AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] clk: en7523: division by zero in divider_get_val() when rate
>   is 0
> - [Low] clk: en7523: misuse of dev_err_probe() in runtime
>   en7581_set_rate()
> --
> 
> commit 21c9a3ba438d14108d5599a5785e71997f1e9fbe
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> clk: en7523: add support for .set_rate for en7581
> 
> This commit adds clock divisor tables and implements .determine_rate and
> .set_rate callbacks for the Airoha EN7581 SoC clocks.
> 
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 6640e814d36a4..db7447be31c33 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> 
> [ ... ]
> 
> > @@ -775,11 +864,148 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
> >  		return 0;
> >  	}
> >  
> > -	return rate / en7523_get_div(desc, val);
> > +	if (desc->div_bits) {
> > +		val >>= desc->div_shift;
> > +		val &= (1 << desc->div_bits) - 1;
> > +
> > +		rate = divider_recalc_rate(hw, rate, val,
> > +					   desc->div_table,
> > +					   desc->div_flags,
> > +					   desc->div_bits);
> > +	}
> > +
> > +	return rate;
> > +}
> > +
> > +/*
> > + * Simulate rate with every divisor supported
> > + * 1. Search the divisor for the requested rate
> > + * 2. Simulate the final rate with the new divisor
> > + */
> > +static unsigned long en7581_get_div_for_rate(struct clk_hw *hw,
> > +					     unsigned long rate,
> > +					     unsigned long parent_rate,
> > +					     const struct en_clk_desc *desc,
> > +					     int *div_val)
> > +{
> > +	*div_val = divider_get_val(rate, parent_rate, desc->div_table,
> > +				   desc->div_bits, desc->div_flags);
> > +	if (*div_val < 0)
> > +		return 0;
> > +
> > +	return divider_recalc_rate(hw, parent_rate, *div_val,
> > +				   desc->div_table, desc->div_flags,
> > +				   desc->div_bits);
> > +}
> > +
> > +static int en7581_get_vals_for_rate(struct clk_hw *hw,
> > +				    const struct en_clk_desc *desc,
> > +				    unsigned long rate,
> > +				    u32 *base_val, u32 *div_val)
> > +{
> > +	struct device *dev = clk_hw_get_dev(hw);
> > +	unsigned long parent_rate, tmp_rate;
> > +	int tmp_base_val = 0;
> > +	int tmp_div_val = 0;
> > +
> > +	if (!desc->base_bits && !desc->div_bits)
> > +		return -EINVAL;
> 
> [Severity: Medium]
> Can en7581_get_vals_for_rate() pass rate == 0 into
> en7581_get_div_for_rate() -> divider_get_val()?
> 
> Calling clk_round_rate(clk, 0) or clk_set_rate(clk, 0) forwards
> req->rate == 0 to en7581_determine_rate(), and divider_get_val() divides
> by rate without checking for zero:
> 
> drivers/clk/clk-divider.c:divider_get_val() {
> 	unsigned int div, value;
> 
> 	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
>     ...
> }
> 
> Rejecting !rate at the start of en7581_get_vals_for_rate() would avoid a
> division by zero.
>

Protective coding and I'm surprised divider_get_val doesn't handle such
case... Anyway I will add this extra check whatever...
 
> [ ... ]
> 
> > +static int en7581_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			   unsigned long parent_rate)
> > +{
> > +	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
> > +	const struct en_clk_desc *desc = en_clk->desc;
> > +	struct device *dev = clk_hw_get_dev(hw);
> > +	struct regmap *map = en_clk->map;
> > +	u32 base_val, div_val;
> > +	u32 reg, val, mask;
> > +	int err;
> > +
> > +	err = en7581_get_vals_for_rate(hw, en_clk->desc, rate,
> > +				       &base_val, &div_val);
> > +	if (err)
> > +		return err;
> > +
> > +	if (desc->div_bits) {
> > +		reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > +
> > +		mask = (BIT(desc->div_bits) - 1) << desc->div_shift;
> > +		val = div_val << desc->div_shift;
> > +
> > +		err = regmap_update_bits(map, reg, mask, val);
> > +		if (err)
> > +			return dev_err_probe(dev, err, "Failed to update div reg for clock %s\n",
> > +					     desc->name);
> > +	}
> > +
> > +	if (desc->base_bits) {
> > +		mask = (BIT(desc->base_bits) - 1) << desc->base_shift;
> > +		val = base_val << desc->base_shift;
> > +
> > +		err = regmap_update_bits(map, desc->base_reg, mask, val);
> > +		if (err)
> > +			return dev_err_probe(dev, err, "Failed to update reg for clock %s\n",
> > +					     desc->name);
> > +	}
> 
> [Severity: Low]
> Should en7581_set_rate() use dev_err() instead of dev_err_probe() here?
> en7581_set_rate() is a runtime clk_ops callback rather than a probe
> function, and the sibling helpers en7581_recalc_rate() and
> en7581_get_vals_for_rate() already use dev_err().
> 

This is funny... dev_err_probe is not only to handle PROBE_DEFER or probe
context... it does also gives more formatted error code and convert the
error code to the plain text error giving more info. I'm keeping this.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261106113227.182324-1-ansuelsmth@gmail.com?part=2

-- 
	Ansuel
