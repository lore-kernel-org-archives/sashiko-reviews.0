Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E69442B2E;
	Thu,  3 Sep 2026 08:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424799; cv=none; b=YbNY/miD8nK/wFfVuepTqvZsaD8sARGygLbbZMR2uWUiiZweniHbZ3Z2mEKIGmwy+h4bVLdY0wQX1GzNWCW0n/6jkC89ImhkqSRAonf4QNMReOB9ZnlSa5ijDxa6cRMvIXCjYVkLtEDO1OpESKkaJkOvHed0sTp9yVIilvFFhJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424799; c=relaxed/simple;
	bh=0ara5kDWj9hWNdDhWaidn9fbQnuv77s70mCAisE4XsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcMXseEWCGsXNlXUxI7Mt+bchCO4seClmRMKLoSZTFotNx5gaZmLy7qsi3WQOJxs2rISsxsuEc/PnEpD/P3T9oiR5xyUwTxmos0Zz0tgaouXyreFiWR9ANNxDvYXC+argHHM/AWdifaidRhCaCcqozy+f26f1WG1kTXZQvYreYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgY3krhu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgY3krhu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2AF41F000E9;
	Thu,  3 Sep 2026 08:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788424797;
	bh=K1QDG/nvmF1UzRMpL95OuJsuTlpBW4aVBG+/KgNfMJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HgY3krhukhz/jsQz/txmK6A6V0O58Du7ug2yft3bLKKaW/c4UMxNF30b9bOFmmcbf
	 CCxY7F9ZUxe3CHJtTpcFbRwaR0frUVzJaKeotPv9cJ/Hc6L/K6nzVZCZitFh68UsMw
	 Jmw0/ThpbToTDyBQ0xiEo7V+xUnf1lxluv9PYBjodx3WIQTlDAw5RAbMtkSWpLV6V/
	 03CsNCnD947WQH2qDvL/7g3S3WSr53iCUCF87s4hbow8NC/WpM8K8XnmaTJxPWFe8w
	 cQNIEb0Ci+3xW/s5d+BihB54zoqK+hGFqhM8mnK31xgl3h0L6VhSna5feVylo9O0mG
	 dSmOamLsF9lvQ==
Date: Thu, 3 Sep 2026 09:39:53 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: James Hilliard <james.hilliard1@gmail.com>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, conor+dt@kernel.org,
	mfd@lists.linux.dev, robh@kernel.org
Subject: Re: [PATCH v8 2/2] mfd: ac200: Add X-Powers AC200 support
Message-ID: <20260903083953.GF2133376@google.com>
References: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
 <20260902-submit-ac200-mfd-v8-2-2aa06720b8ac@gmail.com>
 <20260902194008.8FF2A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902194008.8FF2A1F00A3A@smtp.kernel.org>

On Wed, 02 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Unconditional global chip reset in shutdown/remove breaks RTC wake, Wake-on-LAN, and live PHY state.

Is that true?  Needs a response from you.

> --
> 
> commit d8592c963caa9b21487926208ea5815e059be1be
> Author: James Hilliard <james.hilliard1@gmail.com>
> 
> mfd: ac200: Add X-Powers AC200 support
>     
> This commit adds support for the X-Powers AC200 mixed-signal companion IC.
> It enables the shared input clock, initializes the paged regmap, and asserts
> a chip reset during probe, driver removal, and system shutdown.
> 
> > diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
> > new file mode 100644
> > index 0000000000000..8445a460ef6c2
> > --- /dev/null
> > +++ b/drivers/mfd/ac200.c
> 
> [ ... ]
> 
> > +static void ac200_disable(struct regmap *regmap)
> > +{
> > +	regmap_write(regmap, AC200_SYS_CONTROL_REG, 0);
> > +}
> 
> [Severity: High]
> Does asserting a global chip reset here wipe the hardware state of all
> co-packaged functions, including the RTC and Fast Ethernet PHY?
> 
> Since ac200_disable() is unconditionally called by ac200_shutdown() and
> ac200_remove(), could this kill the PHY and clear the RTC during system
> shutdown, breaking Wake-on-LAN and Wake-on-RTC from power-off states?
> 
> Furthermore, because the PHY is enumerated separately on the MDIO bus and
> only references this MFD via a phandle, will unbinding the AC200 driver at
> runtime (via ac200_remove) forcefully reset the PHY hardware out from under
> the active MDIO PHY driver and lead to unpredictable network failures?
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com?part=2

-- 
Lee Jones
