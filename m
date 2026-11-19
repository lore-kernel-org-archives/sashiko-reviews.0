Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075975;
	b=W1duBMxbCaDKExFPhYBlUPU9b7X3oPRPndhEtbb/LpH46z7IPsvmuVNVSnc/MrfbvkPd
	 PAWcYFfVwxR2iiXONmFKOy7xcYULaFF3AvTwbbNrtmTEsvbmiQu7qpLLjfLD5VYDN3I+d
	 oN3zI1uX0IDyjWxd6ZYKmikHZum8QZIbuQv/Bi0G3XXiqdIO/u7wbSyacVccNdxcBtJr0
	 zgd9sKtAcDzALgBLgrYU9UN3FjN/1SYdYd91OHxE+Cd3SKce1FiTUluBPIQ1kcFFURxY7
	 g9MfOBAW8Utr3op5daTblUlaowS3fSNaF2/OV4NjSggJOOIuQUE0LEJUafO2nwBfreg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075975;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=yOZS1psKLpnUqBLeX9ZWHNiyksEhXVQkT5Ll7miEtlg=;
	b=43LgiEiwRHhCcvxnNoSqnjJ7uBwZOrWQ4RFPFXVSOgJqP4B5qgtKqsIOVSN9NHVqF9Q1
	 M1l8+d+skgsDgHsnDvL1Msq05kAfLrRogT9KWfggaVr+ryJWK9xYh8EfrfxzkUN5pDH1c
	 BKjLxlBLt8pAiljmMi9jgO5ZsybG52N/srymAnVfyhf5CgqLHUjGUQSOVpY4Xu+fhf7wk
	 /AUXw43si/JyCWZGdEUjqcRHFvFaPzQgE9tsDQnNOwuwKdk1GYXsNIaVyrlAYVL2UhkGM
	 g+dorSHzCtz6LjVXxkolmNLXztIyt3w4MbLZ0PV4cwagu6X6WdTl88HyX+2/tEKp9yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=b8aDmKpp;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A809606A32C
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 08:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A809606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=b8aDmKpp
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9F3244E4165F;
	Thu, 19 Nov 2026 08:12:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E23060237;
	Thu, 19 Nov 2026 08:12:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8787411BC2B18;
	Thu, 19 Nov 2026 09:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795075968; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yOZS1psKLpnUqBLeX9ZWHNiyksEhXVQkT5Ll7miEtlg=;
	b=b8aDmKppMAmBTvcONITykmfpurHncAY3a6tQI2COA1TVPVKUlwA/JaaHEpdbKkfFcuRnwx
	6jHCn7nHfCN35sPT8CSy1uVX0nawLxGA9BAI4M1lYBor+QwhI5JwtEpic0pCqgLgJsBf0+
	j4m06dxbjYOCaIsWuOumon4g5Wm5RvZLKZMACmAxd/D7cnEAvt+eTivr/liR+6J425wRL9
	Br+GLhb9xaK/LcHodj8uXW6YOUP8sz7GOAnG2OPQ7B34F1ZcWFO6iZ7/LHXZFu0t+UwUw+
	BKdW9ba4aUZdETVBG7FWXggIhb7PzJrXffv1DjhMOfhLV3ZJzVRkoNxpyHoYAg==
Date: Thu, 19 Nov 2026 09:12:45 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v9 4/4] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <20261119091245.2c6c6528@bootlin.com>
In-Reply-To: <sashiko-outbox-205130@kernel.org>
References: <20261109140916.90625-1-herve.codina@bootlin.com>
	<20261109140916.90625-5-herve.codina@bootlin.com>
	<sashiko-outbox-205130@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On Mon, 09 Nov 2026 14:50:21 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] bus: simple-pm-bus: unpopulated grandchildren in
>   simple_pm_bus_populate()
> - [Medium] bus: simple-pm-bus: auxdata lookup table dropped in
>   simple_pm_bus_probe()
> - [Low] bus: simple-pm-bus: missing Fixes trailer for commit
>   98e96cf80045
> --
> 
> commit 7ba99d9ea04b1e1a29eebc1e1525489b300fe107
> Author: Herve Codina <herve.codina@bootlin.com>
> 
> bus: simple-pm-bus: Populate child nodes at probe
> 
> This commit updates simple_pm_bus_probe() to populate child devices for
> transparent bus matches (such as simple-bus, simple-mfd, isa, and
> arm,amba-bus) during probe, and skips runtime PM calls in
> simple_pm_bus_depopulate() when runtime PM is not enabled.
> 
> [Severity: Low]
> In the commit message, this patch fixes the probe behavior for bus-only
> devices where returning 0 without populating children caused
> device_links_driver_bound() to create wrong fw_devlinks. Should the commit
> message include a Fixes tag for 98e96cf80045 ("drivers: bus: simple-pm-bus:
> Add support for probing simple bus only devices")?

The commit 98e96cf80045 didn't introduce the issue nor change the behavior.
The problem is there from the beginning. For fw_devlink child devices should
be populated by at parent (bus) probe(). bus-only devices such as simple-bus
can populate devices recursively skipping the parent bus probe() step.
I don't see an obvious commit to point for a Fixes tag and so I don't plan
to add a Fixes tag on the next iteration.

> 
> [Severity: High]
> In drivers/bus/simple-pm-bus.c, simple_pm_bus_probe() at line 104 now calls
> simple_pm_bus_populate(), which at line 64 calls of_platform_populate() with
> NULL for the matches table instead of calling of_platform_default_populate().
> Does this leave grandchild devices unpopulated when a child node has a
> device-specific compatible string followed by a fallback bus or MFD
> compatible string (such as compatible = "vendor,syscon", "syscon",
> "simple-mfd")?
> 
> When an outer of_platform_default_populate() creates an ONLY_BUS device
> after simple_pm_bus_driver is registered, of_platform_device_create_pdata()
> synchronously runs simple_pm_bus_probe() before the outer
> of_platform_bus_create() reaches its child loop. Inside
> simple_pm_bus_populate(), of_platform_populate(np, NULL, lookup, dev)
> creates the child platform_device and sets OF_POPULATED on the child node.
> During device_add(), simple_pm_bus_probe() rejects that child with -ENODEV
> at line 100 because the generic bus compatible is not first, and
> of_platform_bus_create() returns 0 at drivers/of/platform.c line 371 without
> recursing into the child's subnodes because matches is NULL. When control
> returns to the outer of_platform_default_populate() loop,
> of_platform_device_create_pdata() sees OF_POPULATED already set on the child
> and returns NULL, so the outer loop also returns 0 without populating the
> grandchildren. Calling of_platform_default_populate(np, lookup, dev) in
> simple_pm_bus_populate() would pass the default match table and avoid
> skipping those grandchildren.

Indeed, will switch to the of_platform_default_populate() call in the next
iteration.

> 
> [Severity: Medium]
> In drivers/bus/simple-pm-bus.c, simple_pm_bus_probe() reads lookup from
> dev_get_platdata(dev) at line 74 and passes it to simple_pm_bus_populate()
> at line 104. Can this drop the caller's of_dev_auxdata lookup table for
> devices beneath a simple-bus node?
> 
> When a caller such as sysc_probe() in drivers/bus/ti-sysc.c (line 3243)
> calls of_platform_populate() with a match table that includes simple-bus and
> a non-NULL auxdata lookup table, of_platform_bus_create() only attaches
> platform_data to the simple-bus device itself if the auxdata table has an
> explicit entry matching the simple-bus node. Otherwise dev_get_platdata(dev)
> on the simple-bus device is NULL, and simple_pm_bus_probe() synchronously
> populates all child devices of the simple-bus with lookup = NULL (setting
> OF_POPULATED on each child) before the caller's of_platform_bus_create()
> loop can recurse with the caller's auxdata table. As a result, child devices
> under that simple-bus lose their auxdata bus_id and platform_data overrides.
> 

Indeed.

To fix the issue I will add a OF_DEV_AUXDATA() entry for simple-bus in the
existing omap_auxdata_lookup table.

A new patch for that specific modification will be added in the next
iteration.

Best regards,
Hervé
