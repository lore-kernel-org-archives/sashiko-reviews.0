Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4436E4749D7;
	Thu,  8 Oct 2026 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449487; cv=none; b=YOw3FdK3Wny0RT0waeygQxvhfzSsku3CZx0WHfTV5eLeaCvp8bHU3C5NYkJBsA4np/t/V4yKwB0bEfLvPRkG8TOW4Z9kly8oAOI+UALeEuILXWHD7dXp1khDDKxQTYm/CwieatrnGWV9QC89uH66t+cajvyo8d7hrHDHNnw5uLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449487; c=relaxed/simple;
	bh=ebOKl0JuPhEZJ/PFQWG9iTZygRdnerAnCNHGOO/HfJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NQRV/JJgI0AwmRiLYG4RLxGGyCJo32ar+Cw9+rtQERH9yxgtwF1gO/pDoTOPZODbglMK3E25gSLvBpovSvBx5YYAsmhdxZA1I1m36/Chj6hEATby8NmRl2/Rv4urQBc7Wr8/FXNO6+mC165KUclN1EFxeHLSYcc191fLFuzQ+n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehxHc7Lr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehxHc7Lr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77ADA1F000FF;
	Thu,  8 Oct 2026 08:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791449486;
	bh=8jgvcskmyF57Gv7gr0FHhVzxy2lNv4geCAABkQWsIgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ehxHc7LrSmfNw9tBllJ31+uHPuhFU3w3AqMl/ZefFXtbN4Q+pIVO5YO2oCsXdUmg8
	 j2LlMXBFDdvJadVkLSoCOE4cDcXQgl4gyBJoZtM+Ht9Xtde1/7gznsmPh0t+gHR/mH
	 4N1HPwNl9iVgOPcc3l6D36F8Xx1J7SoM+BB1l+H643hO12Y9OwATROMCsrV+T8mtDD
	 b1eucv7WTuQh6EbYyY3XG+1GNJdw9WE2H7VTR/J+AzmWIGLkCqBNE/qlVvGQagxsTQ
	 qyp10C2p9bJZdfYFRmYUHoRKUiXhGznWBpqqyBJ1E3/az9uuknU7SdyWk1I5Mz7oOx
	 q7XdeU3xQUp4Q==
Date: Thu, 8 Oct 2026 08:51:23 +0000
From: Yixun Lan <dlan@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/2] pmdomain: spacemit: Add power domain driver
Message-ID: <20261008085123-GKB2005@kernel.org>
References: <20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org>
 <20261008-04-k3-pm-support-v2-2-6f778a53dd2d@kernel.org>
 <sashiko-outbox-163593@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-163593@kernel.org>

Hi ALL,


On 03:55 Thu 08 Oct     , sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] pmdomain: missing .remove callback causes UAF on driver unbind
> - [High] pmdomain: probe fails unconditionally if ALWAYS_ON domain is powered off
> --
> 
> commit ce2204cb1ba682f1391fc6691c412bb036ad43ca
> Author: Yixun Lan <dlan@kernel.org>
> Date:   Thu Oct 8 03:44:30 2026 +0000
> 
> pmdomain: spacemit: Add power domain driver
> 
> This commit introduces a Generic PM Domain driver for SpacemiT SoCs. It
> provides support for managing power domains across different application
> scenarios through software or hardware control modes.
> 
> > diff --git a/drivers/pmdomain/spacemit/spacemit-pm-domains.c b/drivers/pmdomain/spacemit/spacemit-pm-domains.c
> > new file mode 100644
> > --- /dev/null
> > +++ b/drivers/pmdomain/spacemit/spacemit-pm-domains.c
> 
> [ ... ]
> 
> > +static int spacemit_pm_add_one_domain(struct spacemit_pmu *pmu, int id,
> > +				      const struct spacemit_pm_domain_param *param)
> > +{
> > +	struct spacemit_pm_domain *pd;
> > +	int ret;
> > +
> > +	pd = devm_kzalloc(pmu->dev, sizeof(*pd), GFP_KERNEL);
> > +	if (!pd)
> > +		return -ENOMEM;
> > +
> > +	pd->pm_index        = id;
> > +	pd->param           = param;
> > +	pd->gpmu            = pmu;
> > +	pd->genpd.name      = param->name;
> > +	pd->genpd.flags     = param->flags;
> > +	pd->genpd.power_off = spacemit_pd_power_off;
> > +	pd->genpd.power_on  = spacemit_pd_power_on;
> > +
> > +	ret = pm_genpd_init(&pd->genpd, NULL, !spacemit_pm_get_state(pmu, pd));
> 
> [Severity: High]
> Will this unconditionally fail probe if the bootloader leaves the audio
> domain powered off?
> 
I've checked, the bootloader always set audio domain on before linux starts

> The k3_domain_params define the audio domain with GENPD_FLAG_ALWAYS_ON, but
> here pm_genpd_init() is called with the inverse of the current hardware
> state (is_off = !spacemit_pm_get_state()).
> 
this is still correct, but the name of function makes people a bit confused,
 I could change it to a more obvious one to match pm_genpd_init(.., is_off),
probably spacemit_pm_is_off_state()

> If the hardware happens to be off, is_off evaluates to true. However, the
> genpd core explicitly rejects initializing always-on domains in the off
> state:
> 
> drivers/pmdomain/core.c:pm_genpd_init() {
>     ...
>     /* Always-on domains must be powered on at initialization. */
>     if ((genpd_is_always_on(genpd) || genpd_is_rpm_always_on(genpd)) &&
>             !genpd_status_on(genpd)) {
>         pr_err("always-on PM domain %s is not on\n", genpd->name);
>         return -EINVAL;
>     }
>     ...
> }
> 
> Since a failure here aborts spacemit_pm_domain_probe(), does the driver
> need to explicitly power on always-on domains before passing them to the
> genpd framework?
> 
The case said here won't happen, and the system will be in unusable state
if audio domain in a 'off' state, so leave kernel yell and abort, that's
expected.

> > +	if (ret)
> > +		return ret;
> > +
> > +	pmu->domains[id] = pd;
> > +
> > +	return 0;
> > +}
> 
> [ ... ]
> 
> > +static int spacemit_pm_domain_probe(struct auxiliary_device *adev,
> > +				    const struct auxiliary_device_id *id)
> > +{
> > +	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
> > +	const struct spacemit_pm_aux_data *data;
> > +	struct device *dev = &adev->dev;
> > +	struct spacemit_pmu *pmu;
> > +	int err, i;
> > +
> > +	data = (const struct spacemit_pm_aux_data *)id->driver_data;
> > +
> > +	pmu = devm_kzalloc(dev, sizeof(*pmu), GFP_KERNEL);
> 
> [Severity: High]
> Could this cause a use-after-free on module unload or driver unbind?
> 
> The driver dynamically allocates the pmu structure and domain entries using
> devres APIs like devm_kzalloc() and devm_kcalloc(). During probe, these
> domains and the provider are registered with the genpd core using
> pm_genpd_init() and of_genpd_add_provider_onecell().
> 
> However, the spacemit_pm_domain_driver below lacks a .remove callback. When
> the driver is unbound, devres will automatically free the allocated pmu and
> domain memory, but pm_genpd_remove() and of_genpd_del_provider() are never
> called.
> 
> Does this leave dangling pointers in the core gpd_list and
> of_genpd_providers lists that could panic the kernel when accessed?
> 
That's something I will fix in next version, I've changed the driver to
support be built as a module.. while not implement a complete remove() function

> > +	if (!pmu)
> > +		return -ENOMEM;
> 
> [ ... ]
> 
> > +static struct auxiliary_driver spacemit_pm_domain_driver = {
> > +	.probe          = spacemit_pm_domain_probe,
> > +	.id_table       = spacemit_pm_domain_ids,
> > +};
> > +module_auxiliary_driver(spacemit_pm_domain_driver);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261008-04-k3-pm-support-v2-0-6f778a53dd2d@kernel.org?part=2

-- 
Yixun Lan (dlan)
