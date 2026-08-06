Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ADB3AA9E2;
	Thu,  6 Aug 2026 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026669; cv=none; b=FLoyO2uzeECrDUjJqOymo4KEEVG5tZRtxNbx9ex6t4CNcB5GsSSl1Rg5SWaZmvbByWtBfBernGp8ga+x8NEhU3M6w63RUPS8RT411bpielK3XdFWpRYjTgOZGLMhBZJR4ImfVUlf+os4ZwuCrMGdVwEEmfoOlaWjKMngVAv+8Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026669; c=relaxed/simple;
	bh=4VGqnNGL3CTRgpPaMGTotgH6hk0gjZuB7D+pMLI7MHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDaG+p+OKn+AZddBJpvj8A0t/dLdGM5UapR1+yeDQKlPpwKy5OKHS7D4ZgAMUSa6/yn9uKC6QDGbmjDOkOOHUjh+mKB8rEkbFN8ZcLSdD5EAPt8pVVnkGcfpTp2xbK/jaM3g3PTIMCgVepINJeX9+oCCNGNHdMOQ8oXO2U+iqME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ac7cnT4O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ac7cnT4O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E7201F000E9;
	Thu,  6 Aug 2026 14:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786026668;
	bh=9z92muvUMBs/zQdm3D2JnlaPtwGBIzCpTvB/G8+cjrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ac7cnT4OjpFvQSstdpUSFUOfjWIFfIRFt+SwM04WnAGtCJhwG5wf2NrxpiQC2iQWg
	 vLvGIdaJoUSmaUCsPEjpvuUBDXnHZsinMXOEHIws8KDeQU2anB7loFw/evvmGefNo4
	 gyP0749U1whB/FCAeO0kK55wRsXKA0zOkjvHg8ZgWkP2MulwCc0A28M3LzXmmMH/x4
	 g/CkOAUVX0ttstk9Tk62sZGn6Am5Lv20mQ2D910MZ4esPXsqvHyJ5rzTa3VzX9dZQ+
	 QqJ/KduGwaBaW9XUIAAgqYzTHmzcmLZeSb54EcXB73U7cTCdzEo9l9ju+/jmgmUsen
	 8IiBuc3x1LvwQ==
Date: Thu, 6 Aug 2026 15:31:03 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,
	vkoul@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev,
	olteanv@gmail.com, conor+dt@kernel.org, neil.armstrong@linaro.org,
	linux-phy@lists.infradead.org, robh@kernel.org
Subject: Re: [PATCH v8 04/12] mfd: zx297520v3: Add a clock and reset MFD
 driver
Message-ID: <20260806143103.GN2869284@google.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-4-7a107b00f1dd@gmail.com>
 <20260727184155.2F0A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727184155.2F0A61F000E9@smtp.kernel.org>

On Mon, 27 Jul 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Platform data for child devices (`mfd_cell` arrays) is improperly passed as complex pointers via the `.data` field of the `of_device_id` match table.
> --
> 
> --- Patch [4]: [PATCH v8 04/12] mfd: zx297520v3: Add a clock and reset MFD driver ---
> commit 997b3ee44abc6ec239c36327d1c3fd90393542dd
> Author: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> mfd: zx297520v3: Add a clock and reset MFD driver
> 
> This driver registers child devices for the zx297520v3 clock and reset
> controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
> the next patches will drive the respective functionalities.
> 
> > diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
> > new file mode 100644
> > index 0000000000000..3a4f6cd0756e3
> > --- /dev/null
> > +++ b/drivers/mfd/zte-zx297520v3-crm.c
> 
> [ ... ]
> 
> > +static int zx297520v3_crm_probe(struct platform_device *pdev)
> > +{
> > +	const struct zx297520v3_crm_data *data;
> > +
> > +	data = of_device_get_match_data(&pdev->dev);
> > +	if (!data)
> > +		return -ENODEV;
> > +
> > +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, data->cells,
> > +				    data->num_cells, NULL, 0, NULL);
> > +}
> > +
> > +static const struct of_device_id of_match_zx297520v3_crm[] = {
> > +	{ .compatible = "zte,zx297520v3-topcrm", .data = &zx297520v3_topcrm_data },
> > +	{ .compatible = "zte,zx297520v3-matrixcrm", .data = &zx297520v3_matrixcrm_data },
> > +	{ .compatible = "zte,zx297520v3-lspcrm", .data = &zx297520v3_lspcrm_data },
> 
> [Severity: Medium]
> Does passing platform data for child devices via the .data field as complex
> pointers violate MFD subsystem architecture guidelines?
> 
> Instead of mapping compatible strings directly to zx297520v3_crm_data pointers
> via the .data field, should this use an ID enum or integer ID, and have
> zx297520v3_crm_probe() switch on the ID to select the correct static const
> mfd_cell array?

This is correct.  You must not pass one device registration's (MFD) data
through another (OF).  Use a defined integer instead and match in a
switch() statement.  There are lots of examples of this.

-- 
Lee Jones
