Received: from smtpo63.interia.pl (smtpo63.interia.pl [217.74.67.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03403F44FC
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 11:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.74.67.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787657229; cv=none; b=G9fzGxslKADHA1z9wfG6IFRhlmpfUm58hs9c1B527lE5yCZzwv9CjxUtcXkP8boIxOkAN57Qgd/1USQ/ygT9tPI/PDHWRZtzYGUOkgqZJSkd+OgoCxhQoxKINiBPxI7/vwiXbkKzH7wTZJXPSSMKJ0lHyOCfW+KB+QJ9+xZt7Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787657229; c=relaxed/simple;
	bh=/nanS065TlBm8RMB1VQp3Q7XNBTCXcLcKnG17dOhiGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SPjgzwdf1+9diDB2SWjfT7ovmDBOauE6dyed6X4/pXBrUWzPFkRvxtwh5Kgo3lDg87rXo40NeHP50FnBXk+mdxDiMEZH9Y01zXWu5cXPT4IFpqDgL9DaCxfFj6bmrHI5E27Vuj2UeKyepXdQsDW6J9FgtdCLHkrHMcnlI/EHxqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm; spf=pass smtp.mailfrom=poczta.fm; dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.b=cmhpM67M; arc=none smtp.client-ip=217.74.67.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=poczta.fm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=poczta.fm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=poczta.fm header.i=@poczta.fm header.b="cmhpM67M"
Received: from nr200 (unknown [80.68.231.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by poczta.interia.pl (INTERIA.PL) with ESMTPSA;
	Tue, 25 Aug 2026 13:27:01 +0200 (CEST)
Date: Tue, 25 Aug 2026 13:26:58 +0200
From: Slawomir Stepien <sst@poczta.fm>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: sashiko-reviews@lists.linux.dev, syzbot <syzbot@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/cirrus-qemu: Validate BAR0 size during probe
Message-ID: <ao18Ag6ucRMqGRVI@nr200>
References: <b11f8965-5896-4119-98b7-6bd0eb9fa139@mail.kernel.org>
 <20260825074432.0B4511F00A3A@smtp.kernel.org>
 <ce0912d6-fdc4-4ead-9388-a9e0e9a1954c@suse.de>
 <ao1ketQ4oxNiWGAM@nr200>
 <7a61b8fc-68f4-4d8d-b5ff-0ffd9a9507fc@suse.de>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7a61b8fc-68f4-4d8d-b5ff-0ffd9a9507fc@suse.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poczta.fm; s=dk;
	t=1787657222; bh=u849jbuokEGJrG4MX8DSBd4S8qyShqARHeqPFRwMBnk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=cmhpM67MEZ37ijAG671Dl4j3ZWeRnGYqh4YR7REM468lXUCBDEwTY2dm9SMflzmzn
	 JduRxTM2zNKIbkSGGj59M9QbOwS6aOtC1Y5ijxDslfEiyxjN0zCrmwfbRtAbHbnA3U
	 8FnXHmcHG4cGlxrKxQpWhzRsOKsb/Hh9rtZGhwGM=

On sie 25, 2026 12:21, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.08.26 um 11:46 schrieb Slawomir Stepien:
> > On sie 25, 2026 10:00, Thomas Zimmermann wrote:
> > > (cc: Slawomir)
> > > 
> > > Hi,
> > Hello,
> > 
> > > thanks for the fix. Please see below for changes that should go into the
> > > patch.
> > thanks I will look into them and make a manual v2!
> > 
> > > Best regards
> > > Thomas
> > > 
> > > Am 25.08.26 um 09:44 schrieb sashiko-bot@kernel.org:
> > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > > - [High] The exact equality check for BAR0 size (`!= CIRRUS_VRAM_SIZE`) incorrectly rejects valid QEMU configurations with larger VRAM.
> > > > - [High] The VRAM size validation check is placed after `aperture_remove_conflicting_pci_devices()`, meaning the firmware framebuffer is permanently destroyed even if the driver ultimately fails to bind.
> > > > --
> > > > 
> > > > --- Patch [1]: [PATCH] drm/cirrus-qemu: Validate BAR0 size during probe ---
> > > > commit 75467ead62a494b6afbc057c666ab59f7e4b8915
> > > > Author: Slawomir Stepien <sst@poczta.fm>
> > > > 
> > > > drm/cirrus-qemu: Validate BAR0 size during probe
> > > > 
> > > > This commit adds a check during PCI probe to verify that the BAR0 resource
> > > > length equals CIRRUS_VRAM_SIZE. This is intended to prevent supervisor write
> > > > page faults caused by writing past the end of the mapped I/O memory when
> > > > smaller BARs are presented.
> > > > 
> > > > Link: https://syzkaller.appspot.com/ai_job?id=ba262a3a-bccf-4ad8-a1b0-583c55d34fd6
> > > > 
> > > > > diff --git a/drivers/gpu/drm/tiny/cirrus-qemu.c b/drivers/gpu/drm/tiny/cirrus-qemu.c
> > > > > index 075221b431d37..70c995025f508 100644
> > > > > --- a/drivers/gpu/drm/tiny/cirrus-qemu.c
> > > > > +++ b/drivers/gpu/drm/tiny/cirrus-qemu.c
> > > > > @@ -602,6 +602,9 @@ static int cirrus_pci_probe(struct pci_dev *pdev,
> > > > >    	dev = &cirrus->dev;
> > > > > +	if (pci_resource_len(pdev, 0) != CIRRUS_VRAM_SIZE)
> > > > > +		return -ENODEV;
> > > > > +
> > > > [Severity: High]
> > > > Does this strict equality check unintentionally break valid QEMU
> > > > configurations that have more than 4 MB of VRAM?
> > > > 
> > > > When a VM is booted with a configuration like -device cirrus-vga,vgamem_mb=8,
> > > > the BAR0 size will be 8 MB. The check in cirrus_pci_probe() evaluates
> > > > to true (since 8 MB is not equal to 4 MB) and rejects the device by
> > > > returning -ENODEV.
> > > > 
> > > > Would it be safer to check if pci_resource_len(pdev, 0) < CIRRUS_VRAM_SIZE
> > > > instead of requiring an exact match?
> > It seems that 4MB is the default one and 8 and 16MB are just for compatibility:
> > 
> > (qemu hw/display/cirrus_vga.c):
> > 
> > 2951     /*
> > 2952      * Follow real hardware, cirrus card emulated has 4 MB video memory.
> > 2953      * Also accept 8 MB/16 MB for backward compatibility.
> > 2954      */
> > 2955     if (s->vga.vram_size_mb != 4 && s->vga.vram_size_mb != 8 &&
> > 2956         s->vga.vram_size_mb != 16) {
> > 2957         error_setg(errp, "Invalid cirrus_vga ram size '%u'",
> > 2958                    s->vga.vram_size_mb);
> > 2959         return;
> > 2960     }
> > 
> > I will add the 8 and 16MB then in v2.
> 
> Please check that  it is >= VRAM_SIZE, so we're flexible.

Sure!

-- 
Slawomir Stepien
