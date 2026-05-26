Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC193DA7EE
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 14:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806342; cv=none; b=FQm8sBdO+hTDvN5g1ypMG6z/q9X4Gyny6Jkc72uRi1rwLPkIgwi16xm/E1VNoAGjc0g1SU1d+4G75eMgr1c87fk+N0dos/aV26lXmuUiZ6Z17IkAN4NZTqi8tm8sxTEjJUQwbxDTDQ7s6Tb9MTtT3ih011ue9oMy7kkXQ2fSndA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806342; c=relaxed/simple;
	bh=Za9tESbH37YJVoRwyLVYJJewm4lACsnvMy69bZH1pKA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q85NocBYk+GO+Gz+2p0MvBkZ3jcJsn6mdryR3JoBOWVhJb6XcF/ltlI7Id5UOpwsAGPWlvgJ1EOGJlh5NM1mCyXf8RPgRQ9Jtv5+PfZXn847b+qCCwHEKee/7kj/4hxoR0u9KZtYCMKsTbE1JQB9PBctZLGHSw8EaiP+BotSpJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yTp4u7TI; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yTp4u7TI"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3B2A01A36C7;
	Tue, 26 May 2026 14:38:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1023E6011D;
	Tue, 26 May 2026 14:38:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAD7610888874;
	Tue, 26 May 2026 16:38:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779806337; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TQ/sj9DlS/tDCpRj6ZObP+xQle+iacZdBbJGKCWhr/U=;
	b=yTp4u7TI5DcBACFynE4Nv3rz+HtVM8dsNthrmNoP1xx5P97sSyIZJDhKyzUU/Nlrj2/S7q
	K41GCkiDIFH7NzsTPCpE0QzqzqcfY1/3P66ZDq5PtxRVm6r4ilgGj55+C/cVvlh44tdpFy
	MkrxdckMxiSTOhwdT5KQjA87pAfpQPGtduFlKPl1PWckm9CQPlZJ5XhAgBagANH/6eOe7G
	NQhlr0AClRew6nDeccHxGeJmd58TB/9UwVe6LMiLcyGUZfnF0Hu9wAcRORQKPVoaNXRXla
	aD/vFs4JfNLgPhFyIQ6KwgP192xKB0A8oE9mK9YVEWbgJksmUvzzaqLE0S2z+A==
Date: Tue, 26 May 2026 16:38:54 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 8/8] PCI: of: Remove fwnode_dev_initialized() call
 for a PCI root bridge node
Message-ID: <20260526163854.6cb05dae@bootlin.com>
In-Reply-To: <20260512233518.0B0F8C2BCB0@smtp.kernel.org>
References: <20260511155930.34604-9-herve.codina@bootlin.com>
 <20260512233518.0B0F8C2BCB0@smtp.kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi all,

On Tue, 12 May 2026 23:35:17 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Removing `fwnode_dev_initialized()` causes consumers of the PCI host bridge to indefinitely defer probe or suffer a 30-second boot delay.
> --
> 
> commit 77e0afe5e647b8f57bcce68df03d0b7040fbfe25
> Author: Herve Codina <herve.codina@bootlin.com>
> 
> PCI: of: Remove fwnode_dev_initialized() call for a PCI root bridge node
> 
> This commit removes the fwnode_dev_initialized() call during the creation of
> the PCI host bridge node to allow devlink to correctly create links for
> devices in device-tree overlays.
> 
> > diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> > index 25fb02c3dc720..53a8a4f30eb66 100644
> > --- a/drivers/pci/of.c
> > +++ b/drivers/pci/of.c
> > @@ -811,7 +811,6 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
> >  	 */
> >  	of_node_set_flag(np, OF_POPULATED);
> >  	fw_devlink_set_device(&np->fwnode, &bridge->dev);
> > -	fwnode_dev_initialized(&np->fwnode, true);  
> 
> Will removing this cause consumers of the PCI host bridge to indefinitely
> defer probe or suffer a 30-second boot delay?

No, nothing of this kind has been observed.

> 
> The commit message indicates that the device related to this firmware node
> is handled using driver core mechanisms and is fully compliant with devlink
> expectations. However, isn't bridge->dev a structural device with no bus
> (dev->bus == NULL)? If so, it would never undergo driver matching or
> probing.
> 
> If fwnode_dev_initialized() is removed, FWNODE_FLAG_INITIALIZED is cleared.
> When consumer devices are parsed, fw_devlink creates a managed device link
> from the consumer to bridge->dev, expecting it to eventually probe. Since
> the bridge device never probes, its status remains DL_DEV_NO_DRIVER.
> 
> When the consumer device attempts to probe, device_links_check_suppliers()
> might see a dormant supplier and return -EPROBE_DEFER.
> 
> Additionally, because device_add(&bridge->dev) executes before
> of_pci_make_host_bridge_node() attaches the fwnode, device_add() would see a
> NULL fwnode and skip the fallback fw_devlink_unblock_consumers() call.
> 
> >  
> >  	ret = of_changeset_apply(cset);
> >  	if (ret)  
> 

No devlink should be created with a consumer/supplier relationship between
a device and the host bridge.

The traditional parent/child relationship between the host bridge and
devices behind the bridge is sufficient and fully handled without devlink.

With the flag set, the trace 'Not linking xxxx - might never become dev' [1]
is present for devlink creation where chidren of the host bridge are involved.

Don't confuse devlink setting this flag while all devices are created using
driver core mechanism.

Maybe Sashiko is confused also by the way things are done. Usually, fwnodes
are created first and devices are instantiated based on those fwnodes. Here,
devices already exist and OF nodes (fwnodes) are created and attached to
those devices. Indeed, we are on the PCI enumeration and missing OF nodes are
dynamically created.

[1] https://elixir.bootlin.com/linux/v7.1-rc4/source/drivers/base/core.c#L2167

Best regards,
Hervé
