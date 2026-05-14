Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84F9290DBB
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 18:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783969; cv=none; b=EhR9Z8784Ab7gEK1m0ZvOjgfKFdhawDicFuyCR61WalQ2ZWBNmemHPTnRvbh1jCCVxChCIy2UF6D19DAU662vWPfZN4EU2zS/Djt5Tp7S+Jeu7iAze1ELi5OuIUqDG3DEx9UWwF81SUwbYiEkDA+m86+BvzumRazciLSThX63sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783969; c=relaxed/simple;
	bh=IrF0zGrTHmpd++IPJHJubaUM4ePJN6hA/bybSS4Ofz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oerO+el7ezHKJpHtTuj2m9SngInujqEa9RK+mRfUlIQkyIE40pbZznd6uN1AnH49kuEfAFvuS0gbQK2Ig4+ZSzL6yadtlSoLp0hidDTOIzNeItNVdw/fVs7akDp17N+aWmdFsPPpn6wQ/j2wq+1dHbZVuA9e+tOTB6b0tfqA6bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tr3qvB/v; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tr3qvB/v"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-83ea84df1d0so2226518b3a.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778783966; x=1779388766; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lLOCOr0MLE6BsBE2JUx9eHh9btnIM0Pqg1T53aQwE2M=;
        b=tr3qvB/v9picvR/sz/pACDHc6F2yfhSkeQzCrS2iQ0apTr28eX/SPZqB7rdryCQi23
         jkF9x4XqO6jW1+DMfyxAFZhG4OOCYrrUAEFC6iW96n4ieVldAVgKHFdaTIDFqrpm2JQ7
         rOeQoMj2bVtst9r8DYQLMO3HtQTwzbeRpefwZG3+UTwZ6S/eGBAmIVLgH18KYCd6xp7z
         2Kf+S+sXIutI5c3Qg3I3Uo5KSPD06B7r/tqf97MMDvXbeS4b9EWzFr3PPDClXUmc2JU5
         3pcQmlEBa6UhYoXfWWFAo2e9W7oONfgDwQx3mOKF1t3qQ4k+f0DzOtzrwE59MLzIfn2m
         hIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778783966; x=1779388766;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lLOCOr0MLE6BsBE2JUx9eHh9btnIM0Pqg1T53aQwE2M=;
        b=eVuv8Nap+L6yoPWOWlwEcQH9+zz7MPo+J3GhLpn0XZqizc8bwT+e1IW8i7nCal/Deh
         AGwaLWF1OS/rxALN7+SLOf3UrJESV7bVVsha7/M65FdhX+U2YU48LygmvMfe9LYCFQpJ
         x9Ms/zMgl454s19/VMfprFq3HK2goOpIGPzLgkY/fR2z4EWlsC/6Gyp+pBOVBzv89i/H
         lZM3KUMvyzhdd6RuR9F5e7tDW3NF5jusPbyBKNwtqrs+7mebcOQBaCcnQuZkwnuU9MlX
         k+feHGOWXnZ1QAwfPSc+r+jOF5s/VN3nMKGFKP/gosoN4hordiPzKCFk15s224iNg5dt
         J8jg==
X-Gm-Message-State: AOJu0YzbpbBxCpeEzPqwkIjU6VujXUErIFvNQjM2T7bVoCSN2rI0aJTn
	DskiyHwbygyr7IJDtpW4J7UhaDa2SelGpN8TrULszwfim7goAWUr8JoUAFbztd030/VAtQIDRNe
	mkU2auQ==
X-Gm-Gg: Acq92OFyY/PR7m+IrgS3vOBY0f72LfAYWlssNDwxMQHR1iP8caF2DhpmVaBm3BKUJwS
	yLd/BsNN8X3A4elmTvmcYFptHJG54ieUF8AD8u6kVt8rje7Y3V3eyhAHRp0dLRguLvkDNTcRr8+
	FVXqFiBGH4oEuQ7yicYkl6kVu5p8GkYUi5Ia3tKbFTyQHAIoQrOvn4071Z5wiX4A1Ajc7DWuD0y
	xfr/qXE6R9vsTYWwhD4Rw95nmgqhai4wj6hnHd4q29uJ36y2uRf+4AI2/aJzSsykhO9QDR4LImC
	xpeOmUlD0FH2A81xYQSNAPH2TjTjouXB1JDrbbgmZ4D1j731yGSQ9FVMvEztmA4HZyjYrHDJKAZ
	K/h3+fXJmL/4qMbfi9EqxexCxEuAeZoZlZ/tiW7KUyxRjIB9hGGvv0M0EZkCyHhBu4wHAEX4e5s
	qrV3F9mOGEm4LnyfIdHirCzPbeQnDWs0bCRyFEwDYisXBnyTT8LBtW+M+piFHTA7I5CpW6kbax2
	uDlY35vWZ8=
X-Received: by 2002:a05:6a00:ad5:b0:823:cbb:a484 with SMTP id d2e1a72fcca58-83f33cbf6abmr694029b3a.14.1778783965954;
        Thu, 14 May 2026 11:39:25 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c78844sm3268209b3a.47.2026.05.14.11.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 11:39:25 -0700 (PDT)
Date: Thu, 14 May 2026 18:39:22 +0000
From: David Matlack <dmatlack@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-pci@vger.kernel.org
Subject: Re: [PATCH v5 05/11] PCI: liveupdate: Keep bus numbers constant
 during Live Update
Message-ID: <agYW2pLTsjwuNBg2@google.com>
References: <20260512184846.119396-6-dmatlack@google.com>
 <20260514013646.C4F8BC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514013646.C4F8BC19425@smtp.kernel.org>

On 2026-05-14 01:36 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Bridge bus numbers are inadvertently cleared for 'broken' topologies during Live Update, modifying the hardware fabric and disrupting active memory transactions.
> --
> 
> commit 0f468978660735d49ff81fb445992a21db06f9ce
> Author: David Matlack <dmatlack@google.com>
> 
> PCI: liveupdate: Keep bus numbers constant during Live Update
> 
> During Live Update, preserved devices must be allowed to continue performing
> memory transactions. This commit modifies the PCI core to always inherit
> bridge bus numbers when any devices are preserved, avoiding topology
> changes that could disrupt ongoing operations.
> 
> > diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> > index b5fdc5017f921..08ea9324647ba 100644
> > --- a/drivers/pci/probe.c
> > +++ b/drivers/pci/probe.c
> 
> [ ... ]
> 
> > @@ -1497,8 +1505,7 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
> >  		 * do in the second pass.
> >  		 */
> >  		if (!pass) {
> > -			if (pcibios_assign_all_busses() || broken)
> > -
> > +			if (assign_new_buses || broken)
> >  				/*
> >  				 * Temporarily disable forwarding of the
> >  				 * configuration cycles on all bridges in
> > @@ -1512,6 +1519,12 @@ static int pci_scan_bridge_extend(struct pci_bus *bus, struct pci_dev *dev,
> >  			goto out;
> >  		}
> 
> Does this code accidentally clear the secondary and subordinate bus numbers
> for bridges with a "broken" configuration during a Live Update?
> 
> In the first pass (!pass), if the bridge topology is invalid (broken == 1),
> the code enters the if (assign_new_buses || broken) branch and executes a
> pci_write_config_dword() that disables configuration cycles.
> 
> Since the pci_liveupdate_inherit_buses() safety check happens after this
> block, the hardware fabric gets modified before the early return. Can this
> disrupt ongoing memory transactions for preserved downstream devices?

No, it is on purpose, not accidental.

If the bridges bus secondary and/or subordinate bus numbers are
misconfigured during a Live Update then the options are:

 1. Proceed with enumeration with the misconfigured
    secondary/subordinate numbers.
 2. Clear the misconfigured numbers and refuse to enumerate further.
 3. Clear the misconfigured numbers and then assign new bus numbers.

(1) seems like a bad idea to try to proceed with a misconfigured bridge.
(3) could lead to the bus numbers assigned to preserved endpoints
changing, which could lead to corruption (e.g. memory transactions being
routed to the wrong devices). (2) seems like the only sane option.

> 
> > +		if (pci_liveupdate_inherit_buses()) {
> > +			pci_err(dev, "Cannot reconfigure bridge during Live Update!\n");
> > +			pci_err(dev, "Downstream devices will not be enumerated!\n");
> > +			goto out;
> > +		}
> > +
> >  		/* Clear errors */
> >  		pci_write_config_word(dev, PCI_STATUS, 0xffff);
> >
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260512184846.119396-1-dmatlack@google.com?part=5
