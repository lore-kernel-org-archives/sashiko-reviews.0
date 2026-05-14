Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771E03A5445
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 18:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784546; cv=none; b=u/fHgYt4L3f4AuW9IQLkdDXl5/UjbTGTT6HESrFD3czax+f4QNKnu1q+w/IzteFDlTFGT2ff5zP14JrqbWqKyDTTA8etuqMFoN9dqHVTToIe+8uB+HcI76igKdZ1/eaFtNnjy86teWOGxuxzUsqIJjTeNs05IN3BZdPVoooIqMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784546; c=relaxed/simple;
	bh=S+HQA3DBDmaAzjxiWBE3o5kycRdNrVouq6LdlBu+WoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4NAmIyzNTGeEj+CAYz1YCJKgFZokryegjc/CFm9LFiLaH8GYPXtXOPuyVlAvdV4KhaxXeFYpE3I7kzzBhErXWQ9PbeeT5NRW+mDVTHWpMQc3ZEEnPw3mZ6HWUlNH5tXG7ur2HTnJe7lfbnjhHiFaYVfYRI/TW7SNl2xxHi5q1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UmFOaipo; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UmFOaipo"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36643b96b99so6064015a91.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778784539; x=1779389339; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O8yEpAjdQMsKna7KcQWgbLZNAzQyoKwhHcUHxguzEl8=;
        b=UmFOaipo71nOoNH7mq7KAZ3GKe4nk/+yGMNa+1/jp2GY5tAwTFTohOajoSNyFH1W8O
         O+GG4s8vJtOMK9yliBjIp4jO1HxWXHhKJQgVPHHjUKRVPFOxeijh4lCgCOrwJgwvs0UB
         T7TPon2NVH3gJ25RDtBsTNY5lAH0N8Q6F5MCWsZw/ik3f7Pmhh/izeoZjImBPrbh8Kus
         8cwtJqSuR7bzxVzagsC1nwgAR2tt1MYL3BZPwGowjMDZM26D5TROPDRaszi9kX/7PqPn
         rKU6WFXh06A8N22RkWon55pUDRJIjIkCw75PiR6ldyrbPVzsI/EyBUR5Bw9btyfievAe
         K9+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778784539; x=1779389339;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O8yEpAjdQMsKna7KcQWgbLZNAzQyoKwhHcUHxguzEl8=;
        b=j99f0P86rlMXvJ7NBGzdQRHyCbMSE9kmXa4jGzlZZd/Xug4PLba7xkGoTJYldK9sU3
         89OA8WNbUXxGXjHd7knghqXz0pNI6XFrEKcZkVXPx2PGg+8Zw+z4V2hhb7QDDvGsbGWG
         xqJwPE/hVjckNjc5ef0K37ald7RcH4jOM/F3kP6RRjzbvPrKRMVpoXupnxWY8H9s30NY
         /kqRXtlSoJFfkvpJ6Is5BkqKtHaSviXC1PtkggSma8J9DFs7jTp/J+jYrIhKTtpkKNMN
         92YVxF8Is8wjm9SDSXwDRokVw4laEKGH+H6kn1uy5hutdQZ4NJQdH0LMSsmxf8n2DWX+
         +6Vw==
X-Gm-Message-State: AOJu0YxSJpuyBjb380RF6Q60E8pbPPq4JzmoldkgzgPhX98giDeYnqxc
	CS5nyQc67LHX0dnApCNyXyWvz7uC/ShTV2fiDuosp9n7N9t6N4k9e1je0yKchlxPANb/7uNn3sk
	HzsFIgA==
X-Gm-Gg: Acq92OFdL5lGiw9Ak7su0jyuVid2Wk935K8zdHqE/3lZv5PKsN6vwBDRQFVa4zVA4ZA
	nXnb+/H6EZWV+VB8AU3cHIRXCiD7Hu19NVEYh9yaiJ4l7GVB3iIvs2eUAERimxKti9ogd1yLwrx
	jmztI5ufnl5cdGVtMIk1Y5zUkURu6jnGLvyvLyPAXMvNagexfa86C38DzsKQfnHBWhnwVjIQOAc
	107SXf8ABcGGBfw7oX1kR3TdwTUexORe8F7EfBisAMTaFxLdSMe+NYKSRZixxtvEjMhENJI/j+r
	Yii+VOe/HAdEk8Wc+M+aiDcF10liRPeqhOqJvVutYDJl4fLo8GhVNKXpRoH99BJF0Wf9TZYrh7z
	4IrBSIFEXzTrIg6qE73toum0DA38l0xhD9Lo1vBOh1C3prKSAhhG/nNu6fzNpED2EWWEEFfzOQk
	VpP+X9uHLf7TD9fg4gXsj/J8Pt+7k1wVmPJUJyWmbXrK11VarbK+0JEdojp0pQTiT3lfxOsYuo
X-Received: by 2002:a17:90b:3dc4:b0:365:fca2:8bdd with SMTP id 98e67ed59e1d1-36951778509mr672982a91.0.1778784538661;
        Thu, 14 May 2026 11:48:58 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517a820fsm315498a91.10.2026.05.14.11.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 11:48:58 -0700 (PDT)
Date: Thu, 14 May 2026 18:48:55 +0000
From: David Matlack <dmatlack@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Subject: Re: [PATCH v5 09/11] PCI: liveupdate: Freeze preservation status
 during shutdown
Message-ID: <agYZF7W-hRtj_IX6@google.com>
References: <20260512184846.119396-10-dmatlack@google.com>
 <20260514031440.483F0C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514031440.483F0C19425@smtp.kernel.org>

On 2026-05-14 03:14 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Preservation rollback fails if the device is concurrently frozen, breaking bridge hierarchy invariants.
> - [Low] Syntax error in the !CONFIG_PCI_LIVEUPDATE stub for pci_liveupdate_freeze().
> --
> 
> commit f49768e50767ced554fd83ab7e5016423c3d87a2
> Author: David Matlack <dmatlack@google.com>
> 
> PCI: liveupdate: Freeze preservation status during shutdown
> 
> Freeze a device's outgoing preservation status (preserved or not preserved)
> during shutdown. This enables the PCI core and drivers to safely make
> decisions based on the device's preservation status during shutdown.
> 
> > diff --git a/drivers/pci/liveupdate.c b/drivers/pci/liveupdate.c
> > index 6ab03bd548b37..825166a579130 100644
> > --- a/drivers/pci/liveupdate.c
> > +++ b/drivers/pci/liveupdate.c
> > @@ -334,6 +334,11 @@ static int pci_liveupdate_unpreserve_device(struct pci_ser *ser, struct pci_dev
> >  
> >  	guard(write_lock)(&dev->liveupdate.lock);
> >  
> > +	if (dev->liveupdate.frozen) {
> > +		pci_WARN(dev, 1, "Cannot unpreserve device after it is frozen!\n");
> > +		return -EINVAL;
> > +	}
> 
> During preservation rollback, can this check leave a child device preserved
> while its parent is not?
> 
> If pci_liveupdate_preserve_path() successfully preserves a child device,
> but fails to preserve the parent bridge, it attempts to roll back by calling
> pci_liveupdate_unpreserve_device() on the child.
> 
> If a concurrent system shutdown calls pci_liveupdate_freeze() on the child
> device before this rollback occurs, this check will return -EINVAL and
> fail the rollback.
> 
> Does this result in a broken topology being passed to the incoming kernel?

Hm yes that race does look possible. Will fix in v6.

> 
> [ ... ]
> 
> > diff --git a/drivers/pci/liveupdate.h b/drivers/pci/liveupdate.h
> > index fd7693c7ddd21..30deaa673efed 100644
> > --- a/drivers/pci/liveupdate.h
> > +++ b/drivers/pci/liveupdate.h
> [ ... ]
> > @@ -26,6 +27,10 @@ static inline void pci_liveupdate_cleanup_device(struct pci_dev *dev)
> >  {
> >  }
> >  
> > +static inline void pci_liveupdate_freeze(struct pci_dev *dev);
> > +{
> > +}
> 
> Does this stray semicolon after the function signature cause a compilation
> error for kernels built without CONFIG_PCI_LIVEUPDATE?

Yup, Mike Rapoport and kernel-test-robot also flagged this off-list.
Will fix in v6.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260512184846.119396-1-dmatlack@google.com?part=9
