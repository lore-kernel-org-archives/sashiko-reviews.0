Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2586437110;
	Wed, 12 Aug 2026 12:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786536017; cv=none; b=sco7FEwI8YgmCEPAcghpShWUtVaE6mj6t4+Q6UOMKOIUgbTOGeEoBUsH2UI8SXClow4dgz8zBtLjVsRKQsa3J/XYR+xeaD2RGCwcWZ+Xj+HKzhEzpVftsho7VVXgPFthOYZXmEyhL0JrPJ309mnd/+zXbV/MV0pCJQ5HIX6wIXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786536017; c=relaxed/simple;
	bh=M6tgc7f8QWnd7QkekMGz/mTksQ7bzy7nYglMj9TzIqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdHFFjSQqmXzgwuHKt/fpOZ1P89ZwSeq2XOC42Kr4+oRoflUU1TJnmcp1PW6dBKz1X6U2siQEWke1tBJsuLuDpxLIhLpHKv+J3zY3ro3fTrNc4MItQF/f4a+1aqFDfVjOIRy3gWUiXwopFQPGyVG0fSzsFPr0pN42ijTwLx74dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ic/w6eGg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ic/w6eGg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D301F00A3A;
	Wed, 12 Aug 2026 12:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786536012;
	bh=MHNBwGGnswWSzAP7z65dBZa8AALtkmk2EGpH/Ujybd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ic/w6eGgJIqhYWfLKdXfmz98qSzg6rfB+ir7Atcv+jNiJY7/P3MdEASn2QvwjA1Xv
	 vKVSxqD2rofrap+9PVJs3t6FawtfXhajZu18cktJ+eZTRkEUvrgxPwPfXewolHSu29
	 ABfJrEv73jwoTYX2qs64v2L9KQYbFGv2ZP7z9Zk5cVUR9HpYfT0/I0iRwvGNMTpe/M
	 N//WCw/7H/yv0R0W6ZPIOMZXp8zgeGl42b4vpD9RgRI+YiyHym4yxzIHEdiPiyJwm2
	 z/SyrZlj9BtRrrqx1k06RxOVOt3y7sYa/Z4Cu/wjKJIqM8z5D3O1ToBZce0y9lDuyd
	 fLarLCf72R20g==
Date: Wed, 12 Aug 2026 13:00:07 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>, neil.armstrong@linaro.org,
	linux-amlogic@lists.infradead.org, mfd@lists.linux.dev,
	conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v9 3/6] mfd: khadas-mcu: Add support for VIM4 MCU variant
Message-ID: <20260812120007.GO1072730@google.com>
References: <20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr>
 <20260805-add-mcu-fan-khadas-vim4-v9-3-75df78710b9e@aliel.fr>
 <20260805081913.272991F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805081913.272991F00A3A@smtp.kernel.org>

On Wed, 05 Aug 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The driver unconditionally fails to probe on generic Khadas MCU boards (VIM1/VIM2/VIM3) due to a NULL pointer check on valid match data.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> --- Patch [3]: [PATCH v9 3/6] mfd: khadas-mcu: Add support for VIM4 MCU variant ---
> commit eab418dac1b5e94bd297b0a14e92e87b2063dc9b
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> mfd: khadas-mcu: Add support for VIM4 MCU variant
> 
> This patch refactors the probe function to use per-variant values instead of
> hardcoded globals. It adds dedicated regmap configuration, fan control register,
> and duty-cycle levels for the VIM4 MCU variant. A new compatible string
> "khadas,vim4-mcu" is introduced for this new device.
> 
> > diff --git a/drivers/mfd/khadas-mcu.c b/drivers/mfd/khadas-mcu.c
> > index 0e74efe14f367..4cb305ac915e1 100644
> > --- a/drivers/mfd/khadas-mcu.c
> > +++ b/drivers/mfd/khadas-mcu.c
> [ ... ]
> > @@ -75,47 +75,138 @@ static const struct regmap_config khadas_mcu_regmap_config = {
> [ ... ]
> >  static int khadas_mcu_probe(struct i2c_client *client)
> >  {
> > +	const struct mfd_cell *cells, *fan_cells;
> > +	const struct regmap_config *regmap_cfg;
> >  	struct device *dev = &client->dev;
> > +	int ncells, nfan_cells, ret;
> >  	struct khadas_mcu *ddata;
> > -	int ret;
> > +	const void *match;
> >  
> >  	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> >  	if (!ddata)
> >  		return -ENOMEM;
> >  
> > +	match = i2c_get_match_data(client);
> > +	if (!match)
> > +		return -ENODEV;
> 
> [Severity: High]
> Does this code inadvertently break the probe for generic Khadas MCU boards
> (VIM1/VIM2/VIM3)?
> 
> Because KHADAS_MCU_GENERIC evaluates to 0 in its enum, i2c_get_match_data() will
> return a NULL pointer when matching "khadas,mcu" in khadas_mcu_probe() in
> drivers/mfd/khadas-mcu.c. This will cause the check here to evaluate to true and
> unconditionally abort the probe with -ENODEV.
> 
> [ ... ]
> > @@ -123,7 +214,8 @@ static int khadas_mcu_probe(struct i2c_client *client)
> >  
> >  #ifdef CONFIG_OF
> >  static const struct of_device_id khadas_mcu_of_match[] = {
> > -	{ .compatible = "khadas,mcu", },
> > +	{ .compatible = "khadas,mcu", .data = (void *)KHADAS_MCU_GENERIC },
> > +	{ .compatible = "khadas,vim4-mcu", .data = (void *)KHADAS_MCU_VIM4 },
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, khadas_mcu_of_match);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260805-add-mcu-fan-khadas-vim4-v9-0-75df78710b9e@aliel.fr?part=3

-- 
Lee Jones
