Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816FC1E5B68;
	Thu,  6 Aug 2026 14:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026873; cv=none; b=HHzvQT05SW9bpUa7yk7jFclj2w6h607kfD8L7HidfOxcnebQvjvh5cPM/6whU3VMfecol+XtAJZpqX1OpOEEU0VwaoAu4iVHTXqGA6hpxwlRpd/0s3nHDpHPhQKJmXYu31izMtEVbuZ5y3TG5UGubPdjO4BKgj6opwWffTCDEjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026873; c=relaxed/simple;
	bh=BmxoDzmWvjYy7BRpRsNx1jtL/Z5kout8w6SoWYxNXdk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OM4hQ8pociUYPA6jdH61Ry3RPouK2hiGM4DS3b+GNJoPwutVfnailllERa+iP1q5wn90UJteUX6njfM0L59Bv9rBAazhuqwL7mNgiQy3/HhX3RgDQKvc7lLstVhYDQAksAJOwjPYNBNuG31uersrCvhLfRvhomMR0gC39b3LRFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGPWiCQ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGPWiCQ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18871F000E9;
	Thu,  6 Aug 2026 14:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786026872;
	bh=2Gx9mxxMMWTHPBUERGHiyw7TTYMO8e9sg6zsgfl3AAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bGPWiCQ6nrN6JGgxHyazw/rLj64xgBxv1i66XfQhUQtk/LiN6Nl0mJJ4ZQOqcl/1f
	 eZZvhtBDDVzWCri0zd82mk43awApgraBqYRdVEzNo4+dbIMlfbk73BKzlf30znKAt1
	 xIJcTjZmLJX1ELgGVpglqqBOA+kpnid6fcFPsfY6HcKDEi2cKISUsSsfvC9jXcMEz9
	 bo0XgafZkENYTwIoUfPUW178GQYHg9pfNiXozk+VlVtcwo9wh1OMCJujg3nn37Z96s
	 kdtLdHW5dWBVe98L2YlRxWJNEU9IbsknPD50WuWAmfh+rBUv//zHCN0gMOWKo3RPap
	 eU07vl9RzgAHg==
Date: Thu, 6 Aug 2026 15:34:28 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Christian Marangi <ansuelsmth@gmail.com>, robh@kernel.org,
	mfd@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v19 04/10] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20260806143428.GO2869284@google.com>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
 <20260728154846.1828945-5-ansuelsmth@gmail.com>
 <20260729171638.7CD821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729171638.7CD821F000E9@smtp.kernel.org>

On Wed, 29 Jul 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] Concurrent accesses by the switch regmap and the PHY driver on the shared MDIO address corrupt the PHY's hardware page state, causing arbitrary out-of-bounds PHY register reads/writes.
> - [High] MDIO child buses and PHYs are registered before the switch is taken out of reset and initialized, causing PHY probe failures.
> - [High] The reset GPIO sequence incorrectly leaves the switch held in reset, and the subsequent poll loop is vulnerable to false successes.
> - [High] `an8855_regmap_update_bits` fails to mask `write_val`, risking modification of adjacent bits.
> - [Medium] The driver assumes the hardware page register is 0 at boot without synchronizing this assumption, potentially causing MDIO reads from the wrong page.
> - [Low] The patch violates multiple MFD subsystem guidelines regarding naming conventions and commit message formatting.

I'll leave these with you! :)

> --
> 
> --- Patch [4]: [PATCH net-next v19 04/10] mfd: an8855: Add support for Airoha AN8855 Switch MFD ---
> Please note that due to mailing list constraints on quoting large blocks of 
> code, this review is provided as a free-form summary without direct patch 
> quotes.
> 
> commit 9fc0a25ce584ed2b0b637f4a623a857dd535edcc
> Author: Christian Marangi <ansuelsmth@gmail.com>
> mfd: an8855: Add support for Airoha AN8855 Switch MFD
> 
> This patch adds support for the Airoha AN8855 Switch MFD, providing a DSA
> switch and an NVMEM provider. It introduces a regmap over MDIO for switch
> and PHY accesses.
> 
> [Severity: High]
> In an8855_regmap_read(), the switch regmap acquires the parent lock and sets
> the hardware page to EXTENDED_4. Does this interleave dangerously with the
> PHY driver's paged operations?
> 
> Since the PHY driver paged operations hold the child MDIO bus lock, the
> parent lock is acquired and released for each transaction (page write, data
> read, restore). Can a switch regmap operation interleave between the PHY's
> page write and data read, changing the hardware page?
> 
> Furthermore, when the PHY driver resumes, an855_regmap_phy_reset_page()
> resets the page to STANDARD (0), ignoring the PHY driver's intended page.
> Also, an8855_regmap_phy_write() writes the page without updating the cached
> priv->current_page state. Will this lead to arbitrary out-of-bounds PHY
> register reads and writes?
> 
> [Severity: High]
> In an8855_core_probe(), the driver calls an855_mdio_register() before
> toggling the reset GPIO and clearing the global PHY power-down.
> 
> Since fwnode_mdiobus_register_phy() triggers the MDIO subsystem to read
> the PHY ID registers to detect devices, won't these accesses fail or time
> out if the switch is still in reset and powered down? Should the MDIO and
> PHY registration be moved after the hardware initialization sequence is
> complete?
> 
> [Severity: High]
> Looking at the reset sequence in an8855_core_probe(), the code calls
> gpiod_set_value_cansleep(reset_gpio, 1) at the end. Since the gpiod API
> treats a logical 1 as asserted regardless of polarity, does this permanently
> hold the switch in reset?
> 
> Immediately after this, regmap_read_poll_timeout() waits for the HWTRAP
> register to be non-zero. Since the device is in reset, won't the 32-bit
> MDIO read reconstruct 0xffffffff (as __mdiobus_read returns 0xffff on error),
> causing the poll loop to instantly and falsely succeed?
> 
> [Severity: High]
> In an8855_regmap_update_bits(), the implementation performs
> val &= ~mask followed by val |= write_val.
> 
> Since the regmap core does not guarantee that write_val is already pre-masked
> by the caller, could this unintentionally corrupt adjacent bits in the switch
> registers if write_val contains bits outside the mask? Would it be safer to
> explicitly mask it using val |= (write_val & mask)?
> 
> [Severity: Medium]
> In an855_regmap_phy_reset_page(), the function skips restoring the page
> if priv->current_page is 0. Since priv is allocated with kzalloc(), this
> assumes the hardware page is also 0 at boot.
> 
> If the bootloader or a previous kernel execution left the hardware in a
> different page, such as EXTENDED_4, will subsequent PHY reads access the
> wrong hardware page because the software state does not match? Should the
> page register be explicitly initialized during probe?
> 
> [Severity: Low]
> This isn't a bug, but there are a few MFD subsystem style and naming
> guideline violations.
> 
> Does the commit message description unnecessarily include the string "MFD"?
> Also, the private structure is named struct an8855_core_priv with an
> instance variable named priv. The MFD guidelines prefer using the device
> name for the structure, such as struct an8855, and ddata for the instance.
> 
> Finally, are there typos in the function names an855_mdio_register and
> an855_regmap_phy_reset_page, missing the second 8 in AN8855?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260728154846.1828945-1-ansuelsmth@gmail.com?part=4

-- 
Lee Jones
