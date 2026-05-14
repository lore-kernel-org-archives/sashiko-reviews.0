Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958403F4106
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 19:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778786555; cv=none; b=PU3v0xDR9DeYGOQMemGxNLxg1lL47bRrXuErLTS/R3CCcUAR0RQGBMo44G7cDC043UfKr+08zIyCbm5JzlusFhLioCp+99kBVwMaBcz9WL2w3RKjzarMMnLVf67lbti6eMrAaRZLIOul+CHamsW3HcPim3MmMvuU4pG+4lBFreM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778786555; c=relaxed/simple;
	bh=tGxOYv9Nyd6eZG66QUGsC8xf8ANNtJniWajQdhHgGys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtUkUhWEs+2cByqUUJ4wgGFaoJ/Ua/nKi3x9yr9kJOSVi3TNdcd8nDY36VZm3XhuiyuNY+iwatFFIwfuYnLynQzYiUdPc3GIuTlGxvUknXOud29ACdwUBIJZezI5lnBOxqpMFkjUHpZzRmYIaMZX61tdE7u3KEQauPpOkTfG3Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J1bLLQfU; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J1bLLQfU"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f7020a928eso11781791eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778786554; x=1779391354; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=swoWvHLtJzwRweupdjBAQi7lnJXOta8L1pMLFBh8CXc=;
        b=J1bLLQfUkYX9/K8u4Bff0ybXGPdtcBGbcS7NbMD0/dVwC6uB61tQHMHLKyAMZo23Ev
         UyBG6/UkZLqOdIcoqK7AoV7VDnEBNVHXGzyf2EQ0BprWiDpw9+WLBkQ7jwngEvf+hRuP
         YfwDjjOW55qUT8aA9z+6c0FbXXaJI5+KrEA7zeyGTZyd0tu/heyyR8mCRovkJ5Akm7ox
         I/bRghZaXiQKMnSnbXbkKf8aeHnPkrH5BGjAiOZC96ql6wM09CBbtAJAyUNNe4y7cJqV
         dNHRiFwbIgsTvI+YK7hBv1GYRJmrGxu9sNZQVNcgOiufW7S9HDBOd1+clG40g5t/pAYP
         5TYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778786554; x=1779391354;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swoWvHLtJzwRweupdjBAQi7lnJXOta8L1pMLFBh8CXc=;
        b=cXHxQ3yr2A2aP3W71dFKhwuN98ElUjsUFCHBwhJT6Dx78VGb3IXQo8iQxkCdrhni0Y
         vb6hB896qv8Z9PuqT8fQn5jgLqpLGGv76Oe2H8iOw/X6LYbC3sfv5/SLn0y+gxsZSRbb
         0AO0pNW2MUbbbTG4zfvbaUydPQ+7EiWKDUG76creUWuBH2P24sD8usddRXBk2y/FQzmU
         mEtSsHi5YjLU7Jz+/Slra7KVfZmqTGaNAs8poATB7urkPB6FXY/ro0Z2TCRBa+QLCqsr
         HKHEaBc5pMNkb3MCqamuSsQdWD5J1IvEKgKnES82CYsmJ8JFXVLvGy1RcxTAICWqGB/H
         2mzQ==
X-Gm-Message-State: AOJu0YwwlX4sPKTt6mORk/fOTkv8sdaxoW7bm60r9KdV7pxMfc4SGpHA
	5uxLddw7MF2jqc55JTU21VKWg+VxaJeCQNHK1ok5X/Fbr0WHUD2VUeAf
X-Gm-Gg: Acq92OFTedd10KzRdMViXFtVjR7II4/9QhVWQzWArV3dFvZLPfxNQN/0n7hp3lk2l78
	BFUCCKYt1/yZdEhO9ozkGWgDk3m9knTj1fmFRCTp8COcXp6QysWkFIdWkOOVH8VEnNaDd7LkQue
	cxelmYB8xf9JHAX3vqSaX2+OLJTN8xwTmnDi9BL9c6nQ0bera+93mIrjcThJapAcba+qlBVTp54
	SiDCBhGFhItBCQVUBDStuMDJ2emI8scoFY29fkTvaHAD8BuhS0R1ISpHQhOgR1d3QQI76e38GYl
	gLAvyq8UtwOsJ3t1jHe8iSTAZ/Nt24NyPTyIH8I62hZlSf2CLN1yLxF8+VNT931oLK1XjS8UZPQ
	fTmDoIZ3bQomAvx2WHFB/my8jDqegAwTd2hUhSis7h7spuOXPbI5fxmEKUHOtAk9j/+yBNrtX3x
	DKCbuE2W3xmHQIKl1oaBKLSjCTkBKN7CKzR4hHxC7ruPKllZs=
X-Received: by 2002:a05:7301:3d1a:b0:2da:1a81:588 with SMTP id 5a478bee46e88-303983c6515mr406657eec.14.1778786553638;
        Thu, 14 May 2026 12:22:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm4623993eec.15.2026.05.14.12.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 12:22:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 May 2026 12:22:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jihong Min <hurryman2212@icloud.com>
Cc: sashiko-reviews@lists.linux.dev, Jihong Min <hurryman2212@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v5 1/2] usb: xhci-pci: add AMD Promontory 21 PCI glue
Message-ID: <8cbf1ac3-bba5-4223-8425-62aa49508c63@roeck-us.net>
References: <20260512213910.871859-2-hurryman2212@gmail.com>
 <20260514004055.1BBCAC19425@smtp.kernel.org>
 <110e9a0d-bc91-4959-8a7b-1a055d0b49f7@roeck-us.net>
 <1173f5c5-a740-4458-8e08-2c427a704207@icloud.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1173f5c5-a740-4458-8e08-2c427a704207@icloud.com>

On Thu, May 14, 2026 at 11:29:36PM +0900, Jihong Min wrote:
> 
> On 5/14/26 10:20, Guenter Roeck wrote:
> > > > +    prom21_auxdev->auxdev =
> > > > +        auxiliary_device_create(&pdev->dev, KBUILD_MODNAME, "hwmon",
> > > > +                    &prom21_auxdev->pdata,
> > > > +                    (pci_domain_nr(pdev->bus) << 16) |
> > > > +                        pci_dev_id(pdev));
> > > 
> > > Does left-shifting pci_domain_nr() introduce a signed integer overflow
> > > regression?
> > > 
> > > The function pci_domain_nr() returns a signed int, which can be up
> > > to 0xFFFF
> > > on ACPI systems. Left-shifting a value of 0x8000 or greater by 16 bits
> > > alters the sign bit of a 32-bit int, resulting in undefined behavior
> > > in C.
> > > 
> > > Would casting the return value to an unsigned integer, such as
> > > (u32)pci_domain_nr(pdev->bus) << 16, avoid this overflow?
> > > 
> > FWIW, I don't think that is a real problem. auxiliary_device_create()
> > takes an int as id parameter, so the result would be converted back to
> > int
> > anyway. Maybe use "(pci_domain_nr(pdev->bus) & 0x7fff) << 16" instead,
> > but I don't know if that adds any practical value.
> > 
> > Thanks,
> > Guenter
> > 
> For the auxiliary device id issue, after thinking about it a bit more, I
> think
> a simpler approach is to avoid encoding the PCI domain/BDF into the
> auxiliary
> id. The auxiliary id only needs to make the auxiliary device name unique;
> userspace identification is already tied to the parent PCI function.
> 
> So instead of:
> 
>   (pci_domain_nr(pdev->bus) << 16) | pci_dev_id(pdev)
> 
> I plan to use an IDA-allocated id:
> 
>   id = ida_alloc(&prom21_xhci_auxdev_ida, GFP_KERNEL);
>   auxiliary_device_create(..., id);
>   ida_free(&prom21_xhci_auxdev_ida, id);

Other drivers only call ida_free after the auxiliary device has been released.

Guenter

> 
> This avoids both the signed shift concern and PCI domain truncation/masking.
