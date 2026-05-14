Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3149391829
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 18:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784075; cv=none; b=Gsd2/RMh4pCbvfy+tCre2P/H9X2/FgNlM4JdA4Kgb2KRKUczfWon2V607K1MQUKF0NE8u9W0tHGNKcw4B6OxJpmFcDcZAG0h9C2uzKLTw7fQ3W9ADXLszaPH5TzeKYL1ZIgbM6Y31VmPOc6jv/OXX/o1blByeAEcoxfpbC9WUWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784075; c=relaxed/simple;
	bh=0lKuO/cTqQS7pGsVVjbnHgg88YxPkt0DwiFy+aM6C9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VC6YpALUMcXsX/nt/xNOCUjIZ2+A7WBLV1VUMbpp3SRbgoR2Yb3TZ5bW/s+oESmVzqF8DYsKBUA/JO959VhKY0lmdpNzRelFRyENKof0Qy0yFCb/kZBDhtcEDRKCGSLM1I/f/cG/jrC3wR2DDfhmRF2XKvZSrKktCg0h7IWWMPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ryeqhbky; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ryeqhbky"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso82427425ad.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 11:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778784071; x=1779388871; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/9wI3EBrzulRZ/UWRjzk7TAc6Cxt2CXG7DkwZbEc8og=;
        b=ryeqhbkyfMEe98t294jR+80v2/GIDz0fLn9TSDzYhXr75Zqf/pBOVBsYkiTkZC7J/J
         lGhuIOAyQ1oXQbLiTJy1X6BFiFTkxweW+FPctsx3yhCOuOzJcqrvXUyBugMbSxg+eI47
         p+R9o6dl/TS2dINB/8FQKOEqU+Qp7RpsIvn1uQpDFeoyog890gMADz5D5rcQ2Mv/QQSC
         PeAnp0yjHWB0nOl6PH3G9PkiUdl8Qx9I6UZVr6ix7IhRyMVQXl0++3K73BeSwpGRZM1O
         etR38+hDM/kq3cTVUhtnjtksto39cpJ1Pe1O/bmETqge/89jQp2NGZdxyI12/PbXwenR
         Zhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778784071; x=1779388871;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9wI3EBrzulRZ/UWRjzk7TAc6Cxt2CXG7DkwZbEc8og=;
        b=Ed12QvXkaPat2mlA/ShKIhE2tsgR1eAcwSgTlxX4ycaRhU+eXdE5/dSU5XkmTzLZ84
         7JEN8yw5Ll9va6e4csg5BrYwlY//pMVGQ35JneTB0z5BjtzIB9URnVM/q9+06ItfCe20
         FnHm119DwV39U+2ch+n24iD+/ZLO1MiJrGueOKURBDj06O1/IanC5YKRahaBepXMMeu3
         WaNAvJ2z2Q3m7/Etqf9cjhkOzMm5DtJzjnrnNa/0Dl+ImTvzVpehRMq0eHSDwfRL6prC
         dZJiR9hNjDuT0KzBSg3sSOkLHzG4ga4FszqvJ6nPQxob0IrJ40s69cNogSS+6JDLcPU0
         TUVQ==
X-Gm-Message-State: AOJu0YyKaBZjflV9Fw5xnjRaePPtO0+fCInOm7u9oRRqOb35Zx7XrYcr
	o6vSypM81LMDtg2qcq5UX2J8aZ5nEPu4/mbncNQo86V9I0k1JSJlNGnRxEeON07UGwb3fQXFPt1
	7qnyoSQ==
X-Gm-Gg: Acq92OHsVbWw4Q37PnZooVDt2CyXYaxk5SZ3BGhC5bykqSxreiOQlTlmpUpRpUh90XI
	K1SQUzHhCbh0GRmynZth1a+kvZNKzfAB/d8EPNKNv7iOCj7oO01/EKIX5edXObmp/GUY1jqMIZL
	B/q2Rxf/SfktJi5Xt3sh+Zoycy262IKP76FMF1bVnkTdDosWsS9qtpjppEbBLaqyva4zm54GIcw
	+b9tdTMGVac2TgoCV4Hyh5Ieho/kf5wMy/FVPOmxd6Fyb0NszHM70pvAI3M5mXXu1ZYZJfi28Iv
	C3PHRy9y3vYvSfKPSSfl3q5wfZDPGx9af4n6x/YWQzBcZNNXMdLKGwt8tl7v/Q7PehWrpEw9mCu
	kVKgPsGdzjW7+0gxoeuPMbcIepAXUfi3ViMTTPoLlKDoMYg7VPH5iwveKdxpHpiV+Txma7gNJ9F
	M37tEENbugmVMgjfyMdQOexnU/gQNDzThEAFFrVraN9UQsmvKuyjoJDV7L8q6SklMn9qNIkwuoR
	UKxqZnN8jY=
X-Received: by 2002:a17:902:d702:b0:2b7:88f9:9c3d with SMTP id d9443c01a7336-2bd7e7cb191mr6124705ad.12.1778784070937;
        Thu, 14 May 2026 11:41:10 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c263a0fsm33512605ad.37.2026.05.14.11.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 11:41:10 -0700 (PDT)
Date: Thu, 14 May 2026 18:41:07 +0000
From: David Matlack <dmatlack@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Subject: Re: [PATCH v5 06/11] PCI: liveupdate: Auto-preserve upstream bridges
 across Live Update
Message-ID: <agYXQ76N4mSDOqHC@google.com>
References: <20260512184846.119396-7-dmatlack@google.com>
 <20260514020517.DE0DFC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514020517.DE0DFC19425@smtp.kernel.org>

On 2026-05-14 02:05 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Kernel stack overflow via deep recursion in `pci_liveupdate_preserve_path()`.
> --
> 
> commit 9dcae64241d06ee18edeb26c25b9a7b263aa05a4
> Author: David Matlack <dmatlack@google.com>
> 
> PCI: liveupdate: Auto-preserve upstream bridges across Live Update
> 
> This commit introduces tracking to auto-preserve upstream PCI bridges when a
> device is preserved across a Live Update. It adds functions to preserve,
> unpreserve, and finish the preservation of devices and recursively applies
> these to upstream bridges up to the root port.
> 
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index 558fbaec8dddd..d8e06afde2c76 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
> 
> [ ... ]
> 
> > @@ -363,8 +389,82 @@ int pci_liveupdate_preserve(struct pci_dev *dev)
> 
> [ ... ]
> 
> > +static int pci_liveupdate_preserve_path(struct pci_ser *ser, struct pci_dev *dev)
> > +{
> > +	int ret;
> > +
> > +	if (!dev)
> > +		return 0;
> > +
> > +	ret = pci_liveupdate_preserve_device(ser, dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret = pci_liveupdate_preserve_path(ser, dev->bus->self);
> 
> Can this recursion cause a kernel stack overflow?
> 
> The PCI specification allows up to 256 nested buses in a single domain, which
> can occur with deep Thunderbolt or USB4 topologies.
> 
> Because the recursive call to pci_liveupdate_preserve_path() is followed by a
> potential call to pci_liveupdate_unpreserve_device(), it cannot be optimized
> as a tail call. This forces a new stack frame for every level of the PCI
> hierarchy, which could overflow the standard kernel stack, especially with
> KASAN enabled, and cause a crash.
> 
> Could this be rewritten to use an iterative approach instead?

I used recursion to simplify the code and based on the pre-existing
examples of using recursion in the PCI core, e.g.
pci_scan_bridge_extend(). But I will take a look at an iterative
approach for v6.

> 
> > +	if (ret) {
> > +		pci_liveupdate_unpreserve_device(ser, dev);
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> 
> [ ... ]
> 
> > +static void pci_liveupdate_unpreserve_path(struct pci_ser *ser, struct pci_dev *dev)
> > +{
> > +	if (!dev)
> > +		return;
> > +
> > +	if (pci_liveupdate_unpreserve_device(ser, dev))
> > +		return;
> > +
> > +	pci_liveupdate_unpreserve_path(ser, dev->bus->self);
> 
> Does this code have the same recursion issue as pci_liveupdate_preserve_path()
> and require an iterative approach?

See above.

> 
> > +}
> 
> [ ... ]
> 
> > @@ -519,28 +656,18 @@ void pci_liveupdate_cleanup_device(struct pci_dev *dev)
> 
> [ ... ]
> 
> >  void pci_liveupdate_finish(struct pci_dev *dev)
> >  {
> > -	guard(write_lock)(&dev->liveupdate.lock);
> > -
> > -	if (!dev->liveupdate.incoming) {
> > -		pci_warn(dev, "Cannot finish preserving an unpreserved device\n");
> > +	if (!dev)
> >  		return;
> > -	}
> > -
> > -	pci_info(dev, "Device is finished participating in Live Update\n");
> >  
> > -	/*
> > -	 * Drop the refcount so this device does not get treated as an incoming
> > -	 * device again, e.g. in case pci_liveupdate_setup_device() gets called
> > -	 * again because the device is hot-plugged.
> > -	 */
> > -	dev->liveupdate.incoming->refcount = 0;
> > -	dev->liveupdate.incoming = NULL;
> > +	if (pci_liveupdate_finish_device(dev))
> > +		return;
> >  
> > -	/* Drop this device's reference on the incoming FLB. */
> > -	pci_liveupdate_flb_put_incoming();
> > +	pci_liveupdate_finish(dev->bus->self);
> 
> Does this code also have the same recursion issue?

See above.

> 
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260512184846.119396-1-dmatlack@google.com?part=6
