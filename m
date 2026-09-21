Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E17C3BB10D;
	Mon, 21 Sep 2026 10:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987363; cv=none; b=SLrlR9FI64BWBucQJqYRp46SGIbRU840gA1/zEcNysl/rmN4Al/fYXsa9jiEKIKUdUENjV+jPLJmv9vMGOdiIiDW2VE9d7erBZ9LrKe715E9RbAsXD9M7wUMnFebHVBtod2CJEDXjBHytgiLW3hoqwkNunqP7V/UkMdiAKS+QPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987363; c=relaxed/simple;
	bh=aTDIe2bOs3K/vZWODS1UpMHRsyFvxtMK5/rA1dhtzv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WwMqprIZr4XQ1+DEnodMTbn/kt87GbyaMJg4SexFx00kUpNOtaXaMBzIfdupTLBDj7VcViySkE/0QtKzWQB6F4w4wSV46tWpK532V09YMA7vO94K4ukQZxR3rGfgMETsLXZp2yH5PPO7EChfjak0OqhYsgA8qXzsMpuaz0+03eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHZrHH6O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHZrHH6O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA271F000FF;
	Mon, 21 Sep 2026 10:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789987361;
	bh=17xgWH8tMxpmjaqdK33QC4+IrXrEpcHpI8VqRHYMDF4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CHZrHH6OhoLNEm8J+ehO3CrazTB3cX9lOn/SZmnoMaz4V7AuOneIMeOA7j0RanWMD
	 AtpH9mXTV4I4eb2XWsyri5aNwBK5s1+4X2+n0p+29Ky3xgIpH4nJwWnVFEIiSn6hp4
	 bYV3loIGdkPe1wgAhjtFeVl0e6ZGfpAbdmGrIbM99elyViQw32RSnVh8Uw+mNx9koW
	 ENWyi23vohRi9dXkIDc5eZML/ahUbybeuVjjSR9r0XhXEVoyIc9Pa86tqjDh21xadO
	 rtWlFriXm1l+jRQyM7NfOCainhK8KUZE63rf0cH1bLYeERC5ZeG5o8GmV5Y1GatJs4
	 udZjSlC+d4YIA==
Date: Mon, 21 Sep 2026 11:42:37 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	devicetree@vger.kernel.org, mfd@lists.linux.dev,
	conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH 6/6] mfd: qcom-pm8008: Tolerate missing interrupt
Message-ID: <20260921104237.GB2348773@google.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-6-de33d78fad9d@oss.qualcomm.com>
 <20260918165721.CA17C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918165721.CA17C1F000FF@smtp.kernel.org>

On Fri, 18 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mfd: qcom-pm8008: bogus IRQ mappings for child cells when client->irq is 0

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> --
> 
> commit 2c273914596163e5696becde808ceb33d98f0fe8
> Author: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> mfd: qcom-pm8008: Tolerate missing interrupt
> 
> This commit modifies pm8008_probe() to only register the IRQ infrastructure
> if the parent IRQ is present. This is intended to support devices like PM8010
> where the interrupt pin is tied to ground.
> 
> > diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> > --- a/drivers/mfd/qcom-pm8008.c
> > +++ b/drivers/mfd/qcom-pm8008.c
> > @@ -233,7 +233,7 @@ static void devm_irq_domain_fwnode_release(void *data)
> >  
> >  static int pm8008_probe(struct i2c_client *client)
> >  {
> > -	struct regmap_irq_chip_data *irq_data;
> > +	struct regmap_irq_chip_data *irq_data = NULL;
> >  	const struct pm8008_match_data *data;
> 
> [ ... ]
> 
> > -	/* Needed by GPIO driver. */
> > -	dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
> > +		/* Needed by GPIO driver. */
> > +		dev_set_drvdata(dev, regmap_irq_get_domain(irq_data));
> > +	}
> >  
> >  	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, data->mfd_cells,
> > -				data->num_mfd_cells, NULL, 0,
> > -				regmap_irq_get_domain(irq_data));
> > +				    data->num_mfd_cells, NULL, 0,
> > +				    regmap_irq_get_domain(irq_data));
> 
> [Severity: Medium]
> Will this lead to bogus IRQ mappings for child cells when client->irq is 0?
> 
> When the device has no IRQ, irq_data remains NULL, and we pass a NULL domain
> to devm_mfd_add_devices() with an irq_base of 0.
> 
> The MFD cells (such as pm8008_temp_res for qpnp-temp-alarm) specify IRQ
> resources using DEFINE_RES_IRQ() with hardcoded offsets, for example:
> 
> static const struct resource pm8008_temp_res[] = {
> 	DEFINE_RES_MEM(PM8008_TEMP_ALARM_ADDR, 0x100),
> 	DEFINE_RES_IRQ(PM8008_IRQ_TEMP_ALARM),
> };
> 
> When mfd_add_device() processes these IRQ resources and the domain is NULL,
> it falls back to assigning the IRQ as irq_base + start. Since irq_base is 0,
> a child device like the temp alarm will be assigned a global physical Linux
> IRQ matching its offset (e.g., 0 + 5 = 5).
> 
> If a child driver requests this IRQ, could it steal an interrupt from another
> hardware device on the system, leading to unexpected behavior or resource
> conflicts? Should the driver dynamically strip or adjust the IRQ resources
> from the MFD cells when no parent IRQ is present?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com?part=6

-- 
Lee Jones
