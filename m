Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814941;
	b=DgGLeCmEedyUS8gYVfqc41gJHsfGM+rjoMm0g/AA6GtsJ9c+SKc1aQEA51Td4fJKRSpB
	 wgzC/K01PO+weLCug+CYtq5KamW4wDhczbHMq+WRBlY3+QQatcMOAIeAkmwU+YMDk/SZO
	 RINRC7nLVYNlVfJt9Av1WJBNvAKZC3wDtF9mFPifXey/GGrDlY729GeXmq10+IDibmSVY
	 UQNznB1kN7nVBfPd45N40nb1hcnnnjP6I3TF1NA8cDeZJhH3frKi+qS3Ay0GHhbnkBvnA
	 VLoGtJdzJoahHqQJkUUKFOwEwqhWzVBrv8bW+XsTOOV3FxSzoQHmRhR2Xs6y4wD2ezg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814941;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=Tl26Zi3X/30LAaDKpJUZxDgW2vXPEOAWHzOkBFL5r8Y=;
	b=h5Ok2o8paHcr//syOiKsQPRqtksaMod2111W4ku6jZ/+glm6gjUeVYFjxvvDEvmDusB6
	 EelQJqcXRbg3937ZGX5itNYBywEaIfMUHEquB4piK4tbU2QNknYpVnM0yiAahaA4h8g4z
	 wVUq+XsSsf52NPHS34DgBzk+aawa3ZWyoW0nF8Wwzaal03Mef/6WUr/4lZBBdF2lu40rv
	 Yn7hMKZlI5ggikDa3rvYenSGBFL8yKUna8Ddc1zDeD9ss352FNvoziItY3IqgzWOqnx9Q
	 hmrRmrBegWVF+2/4Yyks/wAhFkfsjZTJ7ra3dFacb8dk/+ctuo8yG4WBVAP7DCnA00Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCpBmCt8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F4860A263A;
	Wed,  4 Nov 2026 17:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BCpBmCt8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72EC11F00A18;
	Wed,  4 Nov 2026 17:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793814940;
	bh=Tl26Zi3X/30LAaDKpJUZxDgW2vXPEOAWHzOkBFL5r8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BCpBmCt8yC5kDaQIcLZDjedCre9WEyKLxi5aYAIlAFxwm/pQKm9Fl2Jd7ejUYh9DF
	 gF1kc1ZyHaxv1NDBRwbL9T6+gWaRz2ymrIlRf7T8bI9+vTKxGoH8N9AHBiQz6j48/T
	 i97IJQG877OYF92ZfRch5kAF8hfUP/J7Ohve7AWPxeciLk803vH9DhanzzjnBJnB86
	 ISp+iA4WeTLlTY+XHvn5HolGZjQYysmmuqoW1LaR8xnqZcb6/1xf38bFq4XsZd9dlQ
	 QYAg5+qiwg/PAm88BqTQZ23OQTezRwzptHLeTSs8NHX8h7ccOfHQT6CragUMRB7lil
	 77wTmL7EC+mIw==
Date: Wed, 4 Nov 2026 17:55:37 +0000
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 4/4] mfd: max8907: Convert to use device managed
 poweroff handler
Message-ID: <20261104175537.GD1650678@google.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
 <20261027114634.79706-5-clamor95@gmail.com>
 <sashiko-outbox-186485@kernel.org>
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
In-Reply-To: <sashiko-outbox-186485@kernel.org>

On Tue, 27 Oct 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] mfd: max8907: max8907_i2c_probe() drops maxim,system-power-controller check

Did this get an answer?

> commit 5deb6448298f2829c11e1c8af86067bd08a79d7f
> Author: Svyatoslav Ryhel <clamor95@gmail.com>
> 
> mfd: max8907: Convert to use device managed poweroff handler
> 
> This commit replaces the global pm_power_off assignment in the max8907
> MFD driver with devm_register_power_off_handler().
> 
> > diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
> > index 2a38e00a10c3b..e282dd82ece69 100644
> > --- a/drivers/mfd/max8907.c
> > +++ b/drivers/mfd/max8907.c
> 
> [ ... ]
> 
> > @@ -185,8 +192,6 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
> >  	struct device *dev = &i2c->dev;
> >  	struct max8907 *max8907;
> >  	int ret;
> > -	bool pm_off = of_property_read_bool(dev->of_node,
> > -					"maxim,system-power-controller");
> >  
> >  	max8907 = devm_kzalloc(dev, sizeof(*max8907), GFP_KERNEL);
> >  	if (!max8907)
> > @@ -237,9 +242,10 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
> >  	if (ret)
> >  		return dev_err_probe(dev, ret, "Failed to add MFD devices\n");
> >  
> > -	if (pm_off && !pm_power_off) {
> > -		max8907_pm_off = max8907;
> > -		pm_power_off = max8907_power_off;
> > +	if (of_device_is_system_power_controller(dev->of_node)) {
> > +		ret = devm_register_power_off_handler(dev, max8907_power_off, max8907);
> > +		if (ret)
> > +			return dev_err_probe(dev, ret, "failed to register power-off handler\n");
> >  	}
> 
> [Severity: High]
> Does replacing the maxim,system-power-controller property check with only
> of_device_is_system_power_controller() break system power-off on existing
> DTBs?
> 
> In include/linux/of.h, of_device_is_system_power_controller() only checks
> for the unprefixed property:
> 
> static inline bool of_device_is_system_power_controller(const struct device_node *np)
> {
> 	return of_property_read_bool(np, "system-power-controller");
> }
> 
> In Documentation/devicetree/bindings/regulator/maxim,max8907.yaml (added in
> commit c254fcc966ae), maxim,system-power-controller is still documented as a
> deprecated property for backward compatibility alongside
> system-power-controller:
> 
>   maxim,system-power-controller:
>     type: boolean
>     deprecated: true
>     description:
>       Telling whether or not this PMIC is controlling the system power.
> 
>   system-power-controller: true
> 
> Should max8907_i2c_probe() check both
> of_device_is_system_power_controller(dev->of_node) and
> of_property_read_bool(dev->of_node, "maxim,system-power-controller") so
> existing DTBs using the vendor-prefixed property continue to register the
> power-off handler?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261027114634.79706-1-clamor95@gmail.com?part=4

-- 
Lee Jones
