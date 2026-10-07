Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E3B3CB553
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 21:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791408322; cv=none; b=TLZOt8RazdFRKmcRCvWItHxkYWB6w6BiT9Gd6QVlYKr9hbZhWcMwUmbCDgyyfXDwSQNdP9w/N+8YJ6yowPN99VemNkwRMWIFNCMxfQiu03K7kDFzbKim79gn6r9hTX6RhuZnLXLXJ1LuTAJygLqC/kIH3ICJBFO35X+NzFePA3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791408322; c=relaxed/simple;
	bh=SXwEfB0YrpC+Z0z4zEHdjXlvVK90EgkZyDvExIl9Ajk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUYeTP4NLksVVJ6/A5J6j0ohtYxoRfdO+sft1zExgxN+vdOPIQsLMzUXzg+2uF3w9sfERmmGxar7lyaRw34bBH5qwzlpMAJYggtMBXW+br4aeOMBnkvPxRKcvNPsx8OsUqA+Jp144xO4TCsuDp8muedM5cLClK5wA04LK7hw3YQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVsxStXS; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVsxStXS"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381b831d535so4544654a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 07 Oct 2026 14:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791408320; x=1792013120; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TLc7Zcf3JAoMm0kGaKtX3+RBEoj68Ac29TOBrDveylo=;
        b=HVsxStXSZ18cabRVw5Qdj7Gf6JlGHhLm1eoA5I+RiyBd7iZbt4HUhyp/vAY3I+mrke
         mJySgcgVvsyhHQ0eeJ6xuXuQ7KmhBkYjjQqJXFgR8JdgsRn1S7StcJ9QFVTrUPr1mdyy
         2YcIQiAHRDcOLNyNsPP4JFa9JK8V+xvPH6kbKumS+W5vGbWZK7496uj9svhAR1iWBg20
         MirU53CMGC46MMK6z+6nbFhQuIfBIxhWg3AaIMFKIjSc3BtDXpQRrnfMIChkVMLjoBJC
         6E8pYG2ZoeDzpji0d4gUXHO2Mjo2kjCu2Sj9Yz/SsAx0AbUvBrNrqPVY+6rDe+lHUHJq
         GZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791408320; x=1792013120;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TLc7Zcf3JAoMm0kGaKtX3+RBEoj68Ac29TOBrDveylo=;
        b=irCITlRXte82EUvTtusdh77NpdyfdR10OMxwZUz2KlPcu+fKNel9C+khiDX0hQX+ce
         d9D2s9mcGj6C4eR4tvh1oB2NzmlJ+9sKhu/3pDX3nfWmtCtOSsbeJVA3VEqkgGWpEcmP
         SWbMZgBh4Ru2WhBaZqoMxeueLuPYb55Gh8zAcg0Nh584IHPuTc5xK6V2pzEIO4WWi1iR
         UKayyv6rXFUsHFikZt4XBYPuCyqbMZ9IAMKXLUfHxjHQh+N3mQ2L7V0tVFHskZluRgva
         Hdg2h65qa6WKF+R3QGYPUoXat9x6qCBxGVnmU4Fi2R0L2jsnugWAE06vwOlZYrkreSCL
         9eFw==
X-Gm-Message-State: AFq9FYKXNjoegw2Lu7Udmn7yO3Adw8wrT1I/nsxBctjWIIKJiN7H6df/
	XZYY98Q30VtH0qxVB0/7bGUeSxu0ZEoJF9j3cs3JaylFUYil4/D/blbXkWBlJQ==
X-Gm-Gg: AYBFou2XgsQimnEpR3WmbHVnCKnb6Hf2MENBUwTd8rQCK1ovw47mqHtsL382v3WtEwO
	gkYNIZV3n110xEw15H/e0jFIAxcBZq2uR2e92ThlTlkk5gIGtAhmweaOIWFzH8yrbxWiTwQv2AE
	FE0PClqXMPnor2xDVPxqmuBXtA2ygzbdON64NlsxbljtYTBdkkDmE6JWq3Nid2bGUBU8esrz2IH
	eG0pVoz7u3Gp+ciNbSPWN/Mh7XI56LVnCnu7NXSwJjmQ+xWMyi0rp72dEStHi5qEFgdPcC1bH40
	9mn8R/HbfD7WMz7B5zTQR7BlnQritBRh1UI6TDV9CgDmnCUnbQkhkF7WDodCnZ4ik6uvBf58mlZ
	BHqhqJy+Adi124SlayWy8HIH9kOUisGjuqmOaE7mtQyVi4e+AGAnHeng3REDkUPvrRHMHXMgRko
	N1P/F+cAvWx+BbM6hlg5tRq/3jHgtIT4n0GQjAcgrLJsyVWhvXPDTFfA4FQpPiOSlcoWxPiWXUz
	YQHDkV409QV5cuaHe+fGuGNK8NzZxIjghZWwwrkGDGuuU0kX9zZl7Ii1iy2GF61n9ZiYBB0rmW1
	urFV5l3Kvj2V2P/rZqz+T44j
X-Received: by 2002:a17:90b:48c7:b0:398:b1eb:136c with SMTP id 98e67ed59e1d1-3a8a04ba071mr2767269a91.9.1791408320344;
        Wed, 07 Oct 2026 14:25:20 -0700 (PDT)
Received: from 4470NRD-ASU.ssi.samsung.com (c-24-19-224-150.hsd1.wa.comcast.net. [24.19.224.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a7e9e4sm1196231a91.7.2026.10.07.14.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 14:25:19 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Wed, 7 Oct 2026 14:25:18 -0700
To: sashiko-reviews@lists.linux.dev
Cc: Anisa Su <anisa.su887@gmail.com>, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v15 2/8] cxl/mem: Read dynamic capacity configuration
 from the device
Message-ID: <asa4vh2RaQyoVorj@4470NRD-ASU.ssi.samsung.com>
References: <20261007201828.952-1-anisa.su@samsung.com>
 <20261007201828.952-3-anisa.su@samsung.com>
 <sashiko-outbox-163339@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-163339@kernel.org>

On Wed, Oct 07, 2026 at 08:29:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] cxl: cxl_configure_dcd() falsely fails overlap check and double-counts total DPA capacity

False Positive
> --
> 
> commit e491a6175f0241ed507a397807a28860fd54aadf
> Author: Ira Weiny <iweiny@kernel.org>
> 
> cxl/mem: Read dynamic capacity configuration from the device
> 
> This commit implements Dynamic Capacity (DC) mailbox commands to read and
> store DCD configuration information. It validates the first dynamic capacity
> partition and configures it as dynamic ram, disabling DCD if the
> configuration is invalid.
> 
> > diff --git a/drivers/cxl/core/memdev.c b/drivers/cxl/core/memdev.c
> > index b3419df586b9c..def26c490dfe4 100644
> > --- a/drivers/cxl/core/memdev.c
> > +++ b/drivers/cxl/core/memdev.c
> [ ... ]
> > @@ -643,6 +643,53 @@ int cxl_mem_dpa_fetch(struct cxl_memdev_state *mds, struct cxl_dpa_info *info)
> >  }
> >  EXPORT_SYMBOL_NS_GPL(cxl_mem_dpa_fetch, "CXL");
> >  
> > +int cxl_configure_dcd(struct cxl_memdev_state *mds, struct cxl_dpa_info *info)
> > +{
> [ ... ]
> > +	if (dc_info.start < info->size) {
> > +		dev_err(dev,
> > +			"DC partition 0 base %#llx overlaps static capacity ending at %#llx\n",
> > +			dc_info.start, info->size);
> > +		return -EINVAL;
> > +	}
> 
> [Severity: High]
> Will this overlap check unconditionally fail for any valid DCD configuration?
> 
> Earlier in the execution flow, cxl_mem_dpa_fetch() initializes info->size to
> the total DPA capacity (including both static and dynamic capacity):
> 
info->size does not include dynamic capacity.

>     info->size = mds->total_bytes;
> 
> Since the DC partition is placed within this total space, dc_info.start will
> always be strictly less than the total info->size. This appears to cause a
> regression where cxl_pci_probe() silently disables DCD support.
> 
> [ ... ]
> > +	if (check_add_overflow(info->size, dc_info.size, &total)) {
> > +		dev_err(dev,
> > +			"DC partition 0 size %#llx overflows DPA space ending at %#llx\n",
> > +			dc_info.size, info->size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	info->size = total;
> 
> [Severity: High]
> If the above overlap check were bypassed, would this assignment double-count
> the dynamic capacity size?
> 
> Since info->size already includes the dynamic capacity initialized from

info->size does not include dynamic capacity.

> cxl_mem_dpa_fetch(), adding dc_info.size again to the total could cause
> cxl_dpa_setup() to allocate a dpa_res root resource larger than the physical
> device limit.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261007201828.952-1-anisa.su@samsung.com?part=2
