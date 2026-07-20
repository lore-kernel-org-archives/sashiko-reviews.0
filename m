Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4C544D021
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 17:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784569590; cv=none; b=FQPZDPjdhgoGEdYbpzpu2aMFSV1LRjJPC61IrKBRydFJ6pDRQPCKTNuY6PxgzSvGdjyy7QvkXGFYCYCXszMysJNO/lgvlxBowVC9VSJwajmrR+EmLc680YLUzTGIr12IJ2N8orhmxl42FJyU8CCmojkIJM3v26AIM2H8Ujh6Wg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784569590; c=relaxed/simple;
	bh=gOLamp6WhhZpTe5dHXwQKJ94j6OmlPwvAw33r+2AFLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WDYly+UE/2UE48oofsy6ZVkhsiBKmYkdxbOq+1Uz9bllsvqDoWf7u9ZqaO8OlD9O5w9nONnqRDz/hkRVh96e0xd+o92qMF6B8og9UjdHn3VsUUfbWTUZF6bB/vUuvl0qhOy1TspWk1KNuh9TM7eeIbzBm8CUi20opWS0HOSPMs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TUJOUJMj; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TUJOUJMj"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cede6375caso351015ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 10:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784569579; x=1785174379; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSe3gsPdGWsi9VQkqamZmsXN0JAunSEo2DS5NUyoYNE=;
        b=TUJOUJMjCRddvboaYPIxtwENU/K42W5V9snPAlOKfd0KUSWqyL+Pv65sUBxdmd2Z7S
         MQGS65piL61V5/PO0SA0h0DGk4eTrMMqjmJfNOmy/7LOYNXnlu3+xBynp8ashB0V8Y2r
         RjiZYrWPnts3qul8lOgLt1N4VSXyHn3yIVuweZnjDjbYvBQlzdXdvRjbQbLz8iqmCN3I
         DwGc1amGwdykQRfm+lGByns2G7EaiNz/G1CczSLlMgC1RN3Fq01I84OtNZJyOkwSAaet
         WZunukpLPcQC72swkobiVTfGvQqjkYU2X+fORs9EDn6h4s0AKuj16m9yfrvx3yI4/ooC
         3GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784569579; x=1785174379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WSe3gsPdGWsi9VQkqamZmsXN0JAunSEo2DS5NUyoYNE=;
        b=Aw9LDVmxQw4RwLM/VYKklau9IEau6SdWshbvqIa8SrFDJd0/SHkCPstWS8VI4bhcto
         9M1UoLxAMZeRqAa+UCz3qAXQCM6n8lMvyD8fwS4Rlqe61OYq03DNVgZdXaEBe6RE/b2R
         Yom6ArUofH7nxJP4P95pzIOJCtmO9eitkIqF62QpgDdYnEWcCMRcl16MuCAhD/guMBIs
         XASp7xzo26imV8VhT313zY5AQQ+7ZFbwpDepiK2oF0yypV7jYT4FyZPdN9gk10EDy65e
         MHqEGzSyioeRRE4/Zae3AS1n18YBmPLMcyBKciB0g6P/Uxg5rEwbjx3DsbgvFgLzHE6f
         sZRw==
X-Gm-Message-State: AOJu0YzsL2KiHTEpWByZ5gLdyDheOE5Cq5RObcnGo32U+Mtj61H2yn7w
	TS2EHx3ZX7fT7CsRWYMplMd3v79GWt70by+s8mjasD5er4/JrKsytL6y6EupDbNaaz++qvUVT0f
	RCTlxDZML
X-Gm-Gg: AR+sD11KPm2CYGmdNLChwj72KxhYLQq7a7CN8ccDCe6r+0+TVHtA2QJ1yJ7GnIuIbTL
	Jt69uCRtoC1jVmb3LLjnTZtadJhQEPs7gILzyEkO79JLKlhGxzaXFWnX1MQP5WIxZYZHSP4REpR
	tA6hvoIeQk2WzzDTYjpwoE0aywazoqLnoWlln10s2SaWLHtSUnoD51kviVePmWF+HnBZqtL/tLo
	laZ9KY7auFc3D/TO7dJCl+bfMVAYFUgPi22nAaXzZipXS3v21AbaLhuxG8j0Fj2DZcCUFwxOhOv
	UD9XsJU7uVanGbgguqQUGYfvnVZTSB5DtFnVy0iZCbdpKGiYDacvHNcklZwUqTnY+/ldxUcf+Qf
	BqqSH5yQuGeSrwn7F/UPy/ak12onHUzZ3Sq5mm3wj15wCBUgyc3T8sLMo9PwsND3GlMYVqoL7Wb
	3pZohytPOJiCyH3ajpGF8EAd4Gbgbu4rPU8zue6Os=
X-Received: by 2002:a17:903:1984:b0:2ce:b436:272a with SMTP id d9443c01a7336-2cf7b500832mr1906865ad.3.1784569577823;
        Mon, 20 Jul 2026 10:46:17 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e022d6e38sm103524b3a.11.2026.07.20.10.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:46:17 -0700 (PDT)
Date: Mon, 20 Jul 2026 10:46:13 -0700
From: Vipin Sharma <vipinsh@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v5 05/20] vfio/pci: Register a file handler with Live
 Update Orchestrator
Message-ID: <20260720173305.GA1381701.vipinsh@google.com>
References: <20260714151505.3466855-1-vipinsh@google.com>
 <20260714151505.3466855-6-vipinsh@google.com>
 <20260714152856.F239E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714152856.F239E1F000E9@smtp.kernel.org>

On Tue, Jul 14, 2026 at 03:28:56PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The Kconfig option VFIO_PCI_LIVEUPDATE depends on a non-existent configuration symbol PCI_LIVEUPDATE.
> - [High] Calls to undeclared and undefined functions pci_liveupdate_register_flb() and pci_liveupdate_unregister_flb().
> - [High] Masking -EOPNOTSUPP on FLB registration failure leads to a double unregistration of the file handler and potential kernel panic.
> --
> 
> --- Patch [5]: [PATCH v5 05/20] vfio/pci: Register a file handler with Live Update Orchestrator ---
> commit a3c1a8c69f4b2c27d2e063cca84eb003906e3bbf
> Author: Vipin Sharma <vipinsh@google.com>
> 
> vfio/pci: Register a file handler with Live Update Orchestrator
> 
> This commit adds a live update file handler for vfio-pci device files
> with stub implementations. It registers the handler with the live update
> framework and PCI subsystem, gated behind a new VFIO_PCI_LIVEUPDATE option.
> 
> > diff --git a/drivers/vfio/pci/Kconfig b/drivers/vfio/pci/Kconfig
> > index 296bf01e185ec..c12d614fc6c4a 100644
> > --- a/drivers/vfio/pci/Kconfig
> > +++ b/drivers/vfio/pci/Kconfig
> [ ... ]
> > @@ -42,6 +42,18 @@ config VFIO_PCI_IGD
> >  	  and LPC bridge config space.
> >  
> >  	  To enable Intel IGD assignment through vfio-pci, say Y.
> > +
> > +config VFIO_PCI_LIVEUPDATE
> > +	bool "VFIO PCI support for Live Update (EXPERIMENTAL)"
> > +	depends on PCI_LIVEUPDATE
> 
> [Severity: High]
> Does the PCI_LIVEUPDATE configuration symbol exist anywhere in the kernel
> tree? It appears this dependency cannot be met, preventing the new
> VFIO_PCI_LIVEUPDATE option from being selected.

This series is built on top of an in-progress series as explained in
the cover letter.
https://lore.kernel.org/linux-pci/20260710212616.1351130-1-dmatlack@google.com/

> 
> > +	help
> > +	  Support for preserving devices bound to vfio-pci across a Live
> [ ... ]
> > diff --git a/drivers/vfio/pci/vfio_pci_liveupdate.c b/drivers/vfio/pci/vfio_pci_liveupdate.c
> > new file mode 100644
> > index 0000000000000..803528c9f1b27
> > --- /dev/null
> > +++ b/drivers/vfio/pci/vfio_pci_liveupdate.c
> [ ... ]
> > +int __init vfio_pci_liveupdate_init(void)
> > +{
> > +	int ret;
> > +
> > +	ret = liveupdate_register_file_handler(&vfio_pci_liveupdate_fh);
> > +	if (ret)
> > +		goto err_return;
> > +
> > +	ret = pci_liveupdate_register_flb(&vfio_pci_liveupdate_fh);
> 
> [Severity: High]
> Are pci_liveupdate_register_flb() and pci_liveupdate_unregister_flb()
> declared in any header or defined in any source file? Building with
> this configuration enabled might result in implicit declaration compiler
> errors and fatal linker errors.
> 

Available in the dependent series.

> > +	if (ret)
> > +		goto err_unregister;
> > +
> > +	return 0;
> > +
> > +err_unregister:
> > +	liveupdate_unregister_file_handler(&vfio_pci_liveupdate_fh);
> > +err_return:
> > +	return (ret == -EOPNOTSUPP) ? 0 : ret;
> 
> [Severity: High]
> If pci_liveupdate_register_flb() returns -EOPNOTSUPP, this error path
> unregisters the file handler but returns 0. Could this lead to a double
> unregistration when the module is unloaded and vfio_pci_liveupdate_cleanup()
> is called?
> 
> Calling liveupdate_unregister_file_handler() a second time on the already
> removed list node might cause list corruption and a kernel panic.
> 

Yes, this is an issue. I will add the fix in next version. Separately, I
will send a patch to make liveupdate_unregister_file_handler()
idempotent.

> > +}
> > +
> > +void vfio_pci_liveupdate_cleanup(void)
> > +{
> > +	pci_liveupdate_unregister_flb(&vfio_pci_liveupdate_fh);
> > +	liveupdate_unregister_file_handler(&vfio_pci_liveupdate_fh);
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260714151505.3466855-1-vipinsh@google.com?part=5
