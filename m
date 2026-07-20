Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549093DCD83
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784571004; cv=none; b=uN1sGf5p+j1sn+pHN34Ts6E8M6cAzxA6l+3Ic0sV4kPSwXbCxNU6ySZP7vxTDeoMRpRsQRwNETjIcCPjwDtQKyKr63HH97CkvYlDGppteA8TOBoYdFNI56c+MgzzGznC7S33uelk9P6LAnZsfvzqjK3tU8jlgNsPcLGkVjdCvWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784571004; c=relaxed/simple;
	bh=1uEDg/FV/ey3tIvkZiDPcz/YbhoRq4tudt2FBCrZf4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RbffIPgm3LHaTyCs2BKz7j6HmCcb5Bt7LNrXhJ7z2dFYSNVItoTMZ/OkWtpSpMomeyGcjbQEFrCm2/wHqGi2LF/WEv+hhDnyClZ4LYQNrwD1SSSfv7OSX4mAYZAOXnyagllk9MjX/cWCYmjJhg/IwPvjoo02XrwzoVFNQoc2Zrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hCZATedj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hCZATedj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cede6375caso354845ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784571003; x=1785175803; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GgL1Eiw85Kb5Jf3gvbIyNxC+Rnz0Bkj4TViq+kO7G5c=;
        b=hCZATedjvIKNNvQBt6qJX3IF3gEuh0k09nl71EGN9N6QmRjO3QtH0fmm2bhDqPpsRm
         RD3HaoVBA8TPonUFu6BxtjnoGwhLKs/YPKVkShN7jnBR1jvkMLyNdHLAjiIejqo117ux
         t1/41A2RPHmF5Eo/rwry6lR99pz7fXBwweysSvMAOq+AOqbjzu8MNgJogm49ygRm707a
         BYpWQGtqf9suRZ1yU629mkIi/L+O2x43FFyQb9WUNaXrzp9hQYMDjfYULuTdGRQhWg+a
         mRisM+9frlj0S4IHEhoSM+hcNlQOGqdkeXXm59ep9XwLdric3X6inpl79PyVT0qUK+Sv
         uC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784571003; x=1785175803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GgL1Eiw85Kb5Jf3gvbIyNxC+Rnz0Bkj4TViq+kO7G5c=;
        b=n1HkRsATn+ZUdBtZWfO3rVGBmBT0R4XcYSZkS7beR2ChG8MHUL4LgaHLxRqEpW9Pz/
         yMtXbXxstrQFyqIm7sOj6PG65dwyzib2j6fC2nbKI3A7tK4+ESyBBtY/gtS218DlJPvQ
         cEdU2ZhfGYcPIk6nVkRUgdrbg8qbr4qhURWLGK5E144YrdFrEtdAuS4xhLTwH3yRfWLD
         iBzHkz3Sodq29bKRyGpzRjEoP23N0HTalFjNzr5z7vyLRZe5Ac8t09Z+1vY9zTh1C4FK
         o0tUS9Dtg1qeRgKDnv67rxDhzU2xYPMcKBt1c9/O+43ItovcwChcVqDiW/5bxLMykrQu
         kTdA==
X-Gm-Message-State: AOJu0Yxh3OywMmeROK2D0Nt/o5iMgLvDPLi1ABUxnGmQ7x+Z+ADzaFQM
	7r3u5aCOyGCYLZBWQE7TffV9KRwIUUI6WZ/pSFHyPqV3OYgppys599aL37sJT3l3KnPhD/UD+s0
	kkpONM0ptRXs=
X-Gm-Gg: AR+sD10PxIwyjEu3Z1RLNw+ydGmYHr1SZcNa0ZlsJTGhFFpOpoSwg9PhtGNu886EVwJ
	lVESG6F4P6S3edjrSXc6CPmxqvLjGjpsQ2yuM8YeQFureF7kTT8XK/nDRUdlaLvkazj8IDVN8bP
	L8SZCiOSpGydReJpwdXgRpnRsp9TR1CtTlO8WGxPGiBeTkv4S415q0gprde6ntMtZsRw9zCI3ua
	xt5Z97Qn57lbGy4PEo7MGs66vfQgwQutwFXrrJxc9r2U2ItdG0x+nASx05g5joKRB1RxZbEz+DM
	nAwRzFCzMJnhtJDo5syhcka9r3mSzXLMyrkPjuNc+DhRA2t308+F2gcQQbdQZYq5WqNYfBFnip1
	pfexiGgakwPQvvd5ZuPN/r549nrTZ0Wi9rlxwis3Fu5bjzn68nwz8ukWUafJNl6Z6kj0Q1YgLvF
	tq9+KGEtgcZN7KkPDV2sD1LAoYjVohHl7pJXco
X-Received: by 2002:a17:902:c94e:b0:2cc:a859:d404 with SMTP id d9443c01a7336-2cf7b6d3247mr1941935ad.23.1784571002014;
        Mon, 20 Jul 2026 11:10:02 -0700 (PDT)
Received: from google.com (60.89.247.35.bc.googleusercontent.com. [35.247.89.60])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519de34d4sm5357853a12.26.2026.07.20.11.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 11:10:01 -0700 (PDT)
Date: Mon, 20 Jul 2026 11:09:57 -0700
From: Vipin Sharma <vipinsh@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Subject: Re: [PATCH v5 11/20] vfio: Enforce preserved devices are retrieved
 via LIVEUPDATE_SESSION_RETRIEVE_FD
Message-ID: <20260720180910.GC1381701.vipinsh@google.com>
References: <20260714151505.3466855-1-vipinsh@google.com>
 <20260714151505.3466855-12-vipinsh@google.com>
 <20260714152845.50CA91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714152845.50CA91F000E9@smtp.kernel.org>

On Tue, Jul 14, 2026 at 03:28:44PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The function `pci_liveupdate_is_incoming()` is called but is neither declared nor defined anywhere in the kernel tree.
> --
> 
> --- Patch [11]: [PATCH v5 11/20] vfio: Enforce preserved devices are retrieved via LIVEUPDATE_SESSION_RETRIEVE_FD ---
> commit 27d87a41631434a0adb6626f478ee97f35b6c917
> Author: David Matlack <dmatlack@google.com>
> 
> vfio: Enforce preserved devices are retrieved via LIVEUPDATE_SESSION_RETRIEVE_FD
> 
> This commit enforces that incoming VFIO devices preserved by a previous
> kernel are retrieved using LIVEUPDATE_SESSION_RETRIEVE_FD. It adds checks
> during device open and group device fd retrieval to return -EBUSY if
> an attempt is made to bypass the preserved state.
> 
> > diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
> > index e4b72e79b7e3e..496180950eb6d 100644
> > --- a/drivers/vfio/vfio.h
> > +++ b/drivers/vfio/vfio.h
> 
> [ ... ]
> 
> > @@ -461,4 +462,21 @@ static inline void vfio_device_debugfs_init(struct vfio_device *vdev) { }
> >  static inline void vfio_device_debugfs_exit(struct vfio_device *vdev) { }
> >  #endif /* CONFIG_VFIO_DEBUGFS */
> >  
> > +#ifdef CONFIG_VFIO_PCI_LIVEUPDATE
> > +static inline bool vfio_liveupdate_incoming_is_preserved(struct vfio_device *device)
> > +{
> > +	struct device *d = device->dev;
> > +
> > +	if (dev_is_pci(d))
> > +		return pci_liveupdate_is_incoming(to_pci_dev(d));
> 
> [Severity: Low]
> Does this code compile successfully when CONFIG_VFIO_PCI_LIVEUPDATE is enabled?
> It appears that pci_liveupdate_is_incoming is neither declared nor defined
> anywhere in the kernel tree.
> 
> Could a prerequisite patch adding this functionality to the PCI subsystem
> have been left out of this series?
> 

This series is built on top of in-progress PCI Live Update series
https://lore.kernel.org/linux-pci/20260710212616.1351130-1-dmatlack@google.com/

> > +
> > +	return false;
> > +}
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260714151505.3466855-1-vipinsh@google.com?part=11
