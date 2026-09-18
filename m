Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD2F3C108E
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 22:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789772346; cv=none; b=UlNJQsUc3GGEoq4WMyK4RnYkicPnXo9czuNiVHfqAXqMOcabQIPI4T4OhAfwTUZzMlzh9XIijYL39V2N9s32HUL1xo2by2/0qgsNkZkCInmu/dwc6TBqq+BXUFGdOSHkIeGOUldZt7O2NNh790rjOCFkYu/FSehsEXEsVmkLmPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789772346; c=relaxed/simple;
	bh=G/Y8boK2DU4xEhD6ed9UxEeD7zKg4QbYoDi+BwDtBu4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pR8bdDU6XF+HT14VGJelDctjelyYVBOr8VyU9AxNu2z8Pvy/1p4p3/k0JgdgfbSCWfFcp/hrlOEEUEhc07uK3PjyIiXY3IUaGIvN8PTKvoGDDMFACvMmg3IfRzlBHqY4wYjA/5FYL5yXdMxKOmJvqPmkGRDudT7J6UQ/urrijm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZdnBTDP; arc=none smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZdnBTDP"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43f9b119so11095307b3.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 15:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789772343; x=1790377143; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z7+JE5sqbMswNstG0Mf2Li3BgMognV5IketQmgnwosM=;
        b=CZdnBTDPjBLUH0r4NggqLxTHDptRhr/5smr8c+8BPQeFPv99+gcDysZnvDEpDbuKSg
         OxPQCVHASmqKhMsokr3I/tYgmdqailKbKY9Iy3GNaMC9w1aXUAai7qPKZQztex/Zyd9O
         x4MXovh74zli4fS+EWaUZe5kYIfIzW+2AqHe2X17r1gEufWnLQhD+63T5XGtAHyJLWC0
         +nYSStSWJjyki3fIuwkGz4OUC+8gQmFOcJzejYG/udCDHX+zDZU7bu+WUgfXb8k3m5wj
         aIN5Wz82Ir2omK4YilUb2LxRIUf6D2P0YEYO5G/qATfXyx208qlZKf6wqs9s3HgAH53k
         Gr8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789772343; x=1790377143;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z7+JE5sqbMswNstG0Mf2Li3BgMognV5IketQmgnwosM=;
        b=fR+ZfFeGJhyU49XoBlXKJR4qUMvT0Qx3GaC1ULnOxvEz5LdGlcUJfF4sqSRERAspDO
         AJiehRfFbVAeiqJGhmfUfhQi5sf0DWGa3Vt7mGoYDr4BqnOH0PUIajiKWzMI2HI8YuhL
         0NcQHCSsaXEOEn4fmtZ1cuNPyuRoQ7aCJ2yXfnJjoyWaJk+qzaWHgh/XMuLHfDDGC6rn
         yGWf94Eu5BhNQpLWyd4H9U15VVeWiON8pg6WD8/Fr/fmsX/bzrk4zIMcQJemSZzEcgPP
         quqEkBjTs6oFBBjxpsYhURKHGSZYd3pk7M/pQaJTbiRPPVxudFtL+3CaoU8cltxtmbRe
         HhBg==
X-Gm-Message-State: AFuF++kDZYio+7eTwLab8S/eoxmHSooQAACkCk1K0wQVDQdnwBwZ1du0
	fWT4j0l3NW2a1l1XnePkcy8IObpqEkLObPeMyAis6CjW9dwTVapMtBvIKDFfAg==
X-Gm-Gg: AYBFou0ZTtL1WDVSwXkuExljbJ13i2S2tFlaTB+NmKDwXrgFyl1Y8jEaWT2nZ/M3zmV
	AsqHZTc2DDStIgNjJfyBtu3xsO/EVkjLl18/iHYe3ISAyQ5KQ5MzjNxROcSSkpdqMvrFI2pF/cn
	XMMxs47YwQGVZ8V5uYRxx0xkoTxhQOecFILI009Px+pus44uF0mfocOT1LFWz0kUj6uUT+8OvEc
	jxEMNFvFC4BRVZYLu8+DLyIruucDaoowwpFZe8Z9RRSa1sWx+H7K0YkZs+pMOs9ZWgFHmQNaw1u
	fERAeKMBZq/DGno4FCqzT6uVQN35UgkxWIpfrQOnsbX5i5Rjf8GHnC+jB+9eQSS5XRrb6+gtjHo
	o1p7SGHDUgOxoJcgpjU4kFEPgalYankWxZ9S1VvJnDwoqeFMcljhKqUgCJIshFy5QArlu+rrNgC
	mnorJg5gktqnF3a1WswI//7tr/itIVkTsJvWDIgc6Anzni/ZnhGWQ9tp2xK/oUpZ49ktA6oxawn
	e+95rfAYF0jbwF6YlUNhcXKn4Hkm5craSjATxviSRY/59K3nQ==
X-Received: by 2002:a05:690c:c4f1:b0:87c:62fb:9833 with SMTP id 00721157ae682-89730420b52mr15265477b3.6.1789772343583;
        Fri, 18 Sep 2026 15:59:03 -0700 (PDT)
Received: from 4470NRD-ASU.ssi.samsung.com ([50.205.20.42])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a4761747asm4285417b3.30.2026.09.18.15.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:59:03 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Fri, 18 Sep 2026 15:59:01 -0700
To: sashiko-reviews@lists.linux.dev
Cc: Anisa Su <anisa.su887@gmail.com>, linux-cxl@vger.kernel.org
Subject: Re: [PATCH v14 2/8] cxl/mem: Read dynamic capacity configuration
 from the device
Message-ID: <aq3CNTPThN2Q2Gga@4470NRD-ASU.ssi.samsung.com>
References: <20260918203049.7273-1-anisa.su@samsung.com>
 <20260918203049.7273-3-anisa.su@samsung.com>
 <20260918204428.E2C4D1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918204428.E2C4D1F000FF@smtp.kernel.org>

On Fri, Sep 18, 2026 at 08:44:28PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] cxl/mem: cxl_configure_dcd() incorrectly treats Total Capacity as static capacity boundary

False Positive
> --
> 
> commit 72ce11842054ad85a9e98674e8c97e80cf0a2d21
> Author: Ira Weiny <iweiny@kernel.org>
> 
> cxl/mem: Read dynamic capacity configuration from the device
> 
> This commit implements the Dynamic Capacity (DC) mailbox commands to read 
> and store CXL DCD configuration information. It validates the first 
> partition and ensures there are no gaps or overlaps before configuring it.
> 
> > diff --git a/drivers/cxl/core/memdev.c b/drivers/cxl/core/memdev.c
> > index b3419df586b9c..15df8db314d90 100644
> > --- a/drivers/cxl/core/memdev.c
> > +++ b/drivers/cxl/core/memdev.c
> > @@ -643,6 +643,54 @@ int cxl_mem_dpa_fetch(struct cxl_memdev_state *mds, struct cxl_dpa_info *info)
> 
> [ ... ]
> 
> > +int cxl_configure_dcd(struct cxl_memdev_state *mds, struct cxl_dpa_info *info)
> > +{
> > +	struct cxl_dc_partition_info dc_info = { };
> > +	struct device *dev = mds->cxlds.dev;
> > +	u64 total;
> > +	int rc;
> > +
> > +	if (!mds->cxlds.media_ready)
> > +		return 0;
> > +
> > +	rc = cxl_dev_dc_identify(&mds->cxlds.cxl_mbox, &dc_info);
> > +	if (rc) {
> > +		dev_warn(dev,
> > +			 "Failed to read Dynamic Capacity config: %d\n", rc);
> > +		return rc;
> > +	}
> > +
> > +	if (dc_info.start < info->size) {
> > +		dev_err(dev,
> > +			"DC partition 0 base %#llx overlaps static capacity ending at %#llx\n",
> > +			dc_info.start, info->size);
> > +		return -EINVAL;
> > +	}
> 
> [Severity: High]
> Does info->size here represent the total capacity (volatile + persistent +
> dynamic) rather than just the static capacity?
> 
No. The info returned by Identify Memory Device does not include dynamic
capacity.

That's why we need to send Get Dynamic Capacity Configuration to find DC
partitions and their sizes.
> Since cxl_mem_dpa_fetch() initializes info->size to mds->total_bytes 
> (which is the total capacity), comparing the dynamic partition's base 
> against this will evaluate to true for spec-compliant devices, 
> unconditionally rejecting them as overlaps.
> 
> > +
> > +	/* A gap between static capacity and the DC partition is not supported */
> > +	if (dc_info.start > info->size) {
> > +		dev_warn(dev,
> > +			 "DC partition 0 base %#llx leaves a gap from static capacity ending at %#llx\n",
> > +			 dc_info.start, info->size);
> > +		return -EOPNOTSUPP;
> > +	}
> 
> [Severity: High]
> If info->size includes dynamic capacity, would enforcing that the DCD 
> partition starts exactly at info->size be physically impossible without 
> overlapping the unprovisioned space at the end of the DPA?
> 
info->size does not include dynamic capacity.

> > +
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
> Could this lead to double-counting the dynamic capacity?
> 
> Since info->size already includes the dynamic capacity per the CXL spec, 
> adding dc_info.size here would inflate the value. 
> 
info->size does not include dynamic capacity -__-

> If a non-compliant device bypassed the overlap checks, this inflated size 
> could also cause the strict contiguity check in cxl_dpa_setup() to fail 
> later during device probe:
> 
> drivers/cxl/core/hdm.c:cxl_dpa_setup() {
>     ...
>     /* Require ordered + contiguous partitions */
>     if (i) {
>         const struct cxl_dpa_part_info *prev = &info->part[i - 1];
> 
>         if (prev->range.end + 1 != part->range.start)
>             return -EINVAL;
>     }
>     ...
> }
> 
> > +	dev_dbg(dev, "Adding dynamic ram partition 1; %#llx size %#llx\n",
> > +		dc_info.start, dc_info.size);
> > +	add_part(info, dc_info.start, dc_info.size, CXL_PARTMODE_DYNAMIC_RAM_1);
> > +
> > +	return 0;
> > +}
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260918203049.7273-1-anisa.su@samsung.com?part=2
