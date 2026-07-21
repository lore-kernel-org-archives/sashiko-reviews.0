Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA50137107F;
	Tue, 21 Jul 2026 13:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784641384; cv=none; b=bfUY/JrTHeHx/jROw8z0X7y4KGFDFK0s4yXDp+NCENv6bOPsAXmyHxMe3ZfSwGsHh7+kj5zKRVODY61CLcPPvyuai+AHqXQYvX555f/itba+nLvJbF+Wd7XiTtLnsVIBcEBmR9v56hJXyJ+f3UdW0RasOJ6mPW3wPGJHYIQwQWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784641384; c=relaxed/simple;
	bh=hLmRRlKsBVrKDkjMrkYaA862eBccA8ABS6Q5XT+QDeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DV7qndRMtXCItPU7igmWoBSP4+/ZRM2YoXC1QIhuHsvDl0NNgWp90norj7w5FyLmhV0b/eclzfwC/zAuQ1RO9hVSvfg8OKObLrpI2judXGx/YThJz+zRkKpcd8tYrcv+QFhR7nUjKeXHCrDvF+XOlAMHFh2tXhds2YoS600ki4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LkSF97qk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LkSF97qk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97C961F00A3A;
	Tue, 21 Jul 2026 13:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784641382;
	bh=5iRMy3OIuuAuqVzVjmestvcYuq+6a7n9jiQslSsQ2VQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LkSF97qklgW1Ph9VvptfSEMVmFX48OC/omzXwGOZf8mKYbfvpyZSEFZhnJE1gy95H
	 LuTLdEMa5mIgJVLah72wZ+KRpvJm0Fqw4yr3+plfUsjYvSWRYxvilQxnr7emk4sn0s
	 PF2ZQd4o4c3vl7/p/taxKcu88Y6W7Gca6nILwIz0D1k6tEWCnEMa2KV6jMC2GvBmw2
	 5fOBtCPrAynPL7Tpf2B0urLI2wdL5+7MLhAqbgLqQLF9CxjX+mR9wpaMbjZadDzh/d
	 ZPYXmX65z77/6m/nNA6LeoMSULjAXUJrhV5RYoWAZnjOulI5WNd3IaFKB9yrODDkBM
	 +iPA8SJu4x5Yw==
Date: Tue, 21 Jul 2026 08:43:02 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Bhargav Joshi <j.bhargav.u@gmail.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] regulator: dt-bindigs: ti,pbias-omap: Convert to DT
 schema
Message-ID: <20260721134302.GA3373400-robh@kernel.org>
References: <20260717-ti-pbias-omap-v1-1-527848131801@gmail.com>
 <20260717181543.B5FA61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717181543.B5FA61F000E9@smtp.kernel.org>

On Fri, Jul 17, 2026 at 06:15:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Top-level `$ref: regulator.yaml#` incorrectly applies standard regulator constraints to the parent container node.
> - [Medium] The schema incorrectly uses `oneOf` to restrict the parent node to exactly one regulator subnode, which prevents valid configurations like OMAP3 from defining both MMC and SIM regulators.

Both of these look valid to me.

> --
> 
> --- Patch [1]: [PATCH] regulator: dt-bindigs: ti,pbias-omap: Convert to DT schema ---
> commit e24c9bc6e58ceda1b221ec8e8ce86f428408d847
> Author: Bhargav Joshi <j.bhargav.u@gmail.com>
> 
> regulator: dt-bindigs: ti,pbias-omap: Convert to DT schema
> 
> Convert Texas Instruments PBIAS internal regulator from text to DT
> schema. No Functional changes are introduced.
> 
> > diff --git a/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml b/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml
> > new file mode 100644
> > index 0000000000000..61a4dc87c48c9
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/regulator/ti,pbias-omap.yaml
> 
> [ ... ]
> 
> > +required:
> > +  - compatible
> > +  - reg
> > +  - syscon
> > +
> > +oneOf:
> > +  - required:
> > +      - pbias_mmc_omap2430
> > +  - required:
> > +      - pbias_sim_omap3
> > +  - required:
> > +      - pbias_mmc_omap4
> > +  - required:
> > +      - pbias_mmc_omap5
> 
> [Severity: Medium]
> Will this reject valid configurations that define more than one child
> regulator?
> 
> The JSON schema oneOf keyword requires exactly one condition to match. Since
> OMAP3 SoCs can have both MMC and SIM PBIAS regulators, and the driver
> supports them concurrently, having both defined would cause oneOf to fail.
> Should this use anyOf instead?
> 
> > +
> > +allOf:
> > +  - $ref: regulator.yaml#
> 
> [Severity: Medium]
> Does applying the standard regulator schema to the top-level parent node
> neutralize validation?
> 
> This allows a device tree author to mistakenly place properties like
> regulator-min-microvolt directly on the parent node instead of the
> subnodes. Such properties would be ignored by the kernel but silently pass
> the schema check.
> 
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - ti,pbias-omap2
> > +    then:
> > +      required:
> > +        - pbias_mmc_omap2430
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: ti,pbias-omap3
> > +    then:
> > +      oneOf:
> > +        - required:
> > +            - pbias_mmc_omap2430
> > +        - required:
> > +            - pbias_sim_omap3
> 
> [Severity: Medium]
> Similarly, does this restrict OMAP3 to exactly one regulator subnode? 
> 
> This would prevent valid hardware configurations from using both the MMC and
> SIM regulators simultaneously. Should this also use anyOf?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260717-ti-pbias-omap-v1-1-527848131801@gmail.com?part=1
> 
