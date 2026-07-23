Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9A635675F
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 06:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784789271; cv=none; b=ePwNOWTixrn3YV75nQh3pA12lv1aETaoeOaAtaxIPZpsOOjFW3Kxo8/VcJHYHE4n1EtQY8MCK30OQw0t4TueTS+aYc/aVLXfDXzBK5/q6OLw1s7XKOIlZrdEa/kZjWJUposDI42RXQxzsDNaK3T4qMRpIgV9boGTqRig3AzY/PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784789271; c=relaxed/simple;
	bh=5++wbDKdSaBgQjroYtMbLSUHP26lkDMvR3CouD6Z+Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5LoVYa1NT8eFNkZzhvXpFVOgegVrcylONHawaBwRAR10iQvWBTg2g3V7N3XBSF/GrDnp1gkBq+Hh+M9UJ4YuvP5GBV/wrQYvLTv1Wl29FFIb2DKk4TMPJv8xue548c3CMKub6hRfYoeHzb8iZfU+mbp7UD7dPe91dU33EBU0Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id A0C4539C;
	Thu, 23 Jul 2026 08:47:40 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 8ABA7606F523; Thu, 23 Jul 2026 08:47:40 +0200 (CEST)
Date: Thu, 23 Jul 2026 08:47:40 +0200
From: Lukas Wunner <lukas@wunner.de>
To: sashiko-reviews@lists.linux.dev
Cc: Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH] PCI: Disable NoSnoop and Relaxed ordering for Intel
 wireless BE200
Message-ID: <amG5DN8sEetoZtvS@wunner.de>
References: <20260621065451.21650-1-emmanuel.grumbach@intel.com>
 <20260621071242.B20F31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621071242.B20F31F000E9@smtp.kernel.org>

On Sun, Jun 21, 2026 at 07:12:42AM +0000, sashiko-bot@kernel.org wrote:
> > +++ b/drivers/pci/quirks.c
> > @@ -4674,6 +4674,13 @@ static void quirk_chelsio_T5_disable_root_port_attributes(struct pci_dev *pdev)
> >  DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_CHELSIO, PCI_ANY_ID,
> >  			 quirk_chelsio_T5_disable_root_port_attributes);
> >  
> > +/*
> > + * The Intel wireless BE200 fails to copy TLP Attributes from a Request to the
> > + * Completion it generates.
> > + */
> > +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x272b,
> > +			 quirk_disable_root_port_attributes);
> 
> [Severity: High]
> Will this workaround survive a system suspend and resume cycle?
> 
> When the Intel BE200 device is hotplugged, the upstream Root Port's
> configuration state is saved at boot time by pcie_portdrv_probe(), which calls
> pci_save_state(). The workaround modifies the Root Port's current
> configuration to disable Relaxed Ordering and No Snoop, but it does not update
> the Root Port's saved state array.
> 
> Upon system suspend, the PCI core skips saving the Root Port's state because
> its state_saved flag is already true. During resume, pci_restore_state()
> restores the Root Port to its original boot-time state, which would re-enable
> the problematic attributes.

Hallucination.  pci_pm_suspend() resets the state_saved flag to false.

Usage of the state_saved flag was recently changed by 894f475f88e0 and
a2f1e22390ac.  Perhaps the LLM used by sashiko was trained with an older
version of the kernel source tree and is thus oblivious to those changes.

> Should there also be a DECLARE_PCI_FIXUP_RESUME_EARLY hook registered here to
> ensure the workaround is re-applied when the device resumes?

No.

Thanks,

Lukas
