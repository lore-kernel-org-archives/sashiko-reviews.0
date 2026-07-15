Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD1D3C3457
	for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784101942; cv=none; b=sTsWWEg5T6dBm5UujHyc5TrWD7Aa0/SqT8O5K/9tkJOi/Pd+DGJRphSQP0Z+u2sbuP54dwHGX7YC2SprzZx9iMd4KBq3U/c62konU0CVjeWJnXMi7Dec3+6l8oVXDEiT62jbjIyQl2ipZ4NyN4Rcv8SVPzCYWWSy02kdKWS0yBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784101942; c=relaxed/simple;
	bh=SFfaixy5mSLcBLwBntye6Z3BtPZ39eJulCWZ9W5HDL0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tpsGEHyWrJ37oBLJZzHdKmgEsLdWPGXgqH1xKU8gm48F55gUQiaiPF6ADosgNVWNv501gRiJ5gnerfP1yD7Hrna82nhJ3v2DVZrR0avWO7uSDmZ4X9Gihq6MyxoEhVB4Wewqn5dZfpm0yysTKN1n0SS0hP4CIEAU6Dd4h5OBcms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FIo4X9ss; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FIo4X9ss"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso2217331a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 00:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784101940; x=1784706740; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LkoZxLu3mKiKId6IT2QmHjKJhmmkO8Ne64sGip4OZac=;
        b=FIo4X9ss1li+RJe2GbxewqCYzeV4BFJzdxXH9cDodcPhDPPJOgAqqstwP25jmemvU2
         kwbhFItozMcNgt4tjBHkt3iHp0Pv47eoIFH4Zv5e0FrspFopAg3P+JOpsM4hNwp6LMc6
         2+n4zpAz1SJz/YeVHbqYM/ZvCF+GgdtUMsNrwytgYfQfXJI4LTDCQtzgZAzwllQjyiSX
         7N6quwA8lZMeLW5yrN+EzqLtAQggGrAL2O7NCZnGaQocC5l4DisgRGXoRBZgwtJkW1Cl
         lJpEePvLSiQcC/dE5uymPehIT04C+XeugxwGCuiFY5n0aRxduLVe1eM5QVtGXS36ubzS
         mQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784101940; x=1784706740;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LkoZxLu3mKiKId6IT2QmHjKJhmmkO8Ne64sGip4OZac=;
        b=DAldPViMWl+JXqnkN11MtO4VcP4XlCrtegURFCgnpwds3Z3wN56rAcG/1mtGVbJekb
         Vr42zA2EfBxAAVjG+KKyc8S8UuM7wU3vVCKgch9kPvbjlwOZjRd32CMtwMh9MXPWTKTt
         YV2anrkF5axZ8iZ4IHe/WqKTv1Ic8+5+6GCKJcKTWzZ9zkpvL03rs+nXwEcENsKLd388
         zmlAM6AerFSCh/hyd5w6rPNOE9K1SyZ7cT1uB8bbausNryePo69jvffLYzco1dYviKfR
         V3WoYUTQbJ4ZHq5TL6O5EXiprIAPKQKB5z+f2MzL1o1oWI/bhVcw6T/UXXTOb5yPrcFc
         +lmg==
X-Gm-Message-State: AOJu0YxOwq7MKPj9nR3gtRZic4Ers6pWQsv0K+nDQD7WsXOON+KPei4k
	h+K+1qsLudd6ICRYU8B4MML6e77TDCGNMDV4v5cPjnnFJEkKufjZCcWnpszinA==
X-Gm-Gg: AfdE7ckTajVAFJQcKRMtZWiaMVREcnVYR7bXmrUBwB4oHU/E38SWAB2n2Ybm7cMXI72
	Cw3YA8iBZwpvmUOC3QNLbLJhTNYwEw1EBmHhnpDH8AS+Bn+7Dprz22NgPaLULqHCRwwcwJNJue8
	RlhJyYf78rhLagBYLI9UuuEiOX+rEBiM3+g3eLarqoFCKiXlDQfgUARDS0F5cOYgiOuh0XTPi8z
	ceh0bdYarcPjRlaBUODn1xezmAIuVacnudW/CoBe/jmT9mT7o27Vd7Bi/H6iVyl/3spK7eKLo9v
	ZpI2nOArlyztEY1Mtk78p05uOlBOlJuXTWo8WlufzXK0AN0LtlwJglUbejsLjJAzHqEnImjLVfv
	O9Sde+LUMApZ/jrh1WrKtqdMM7vzeNpMIAN6gGQ1LSXs+9XiJcD/PVAiI+CqmwmZhY36PYiuwKb
	HIF7tzArTvOliRk5L3oSA7LkWEg9WcJVBaqlrJTe80V/5guaN8yICb+a2NdJugU4HSCBjlqpXB6
	4F2Gvw=
X-Received: by 2002:a17:90b:3142:b0:387:e0db:3d8e with SMTP id 98e67ed59e1d1-38e2a0a87cfmr1777436a91.41.1784101940512;
        Wed, 15 Jul 2026 00:52:20 -0700 (PDT)
Received: from AnisaLaptop.localdomain (c-73-170-217-179.hsd1.ca.comcast.net. [73.170.217.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm94910291eec.27.2026.07.15.00.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:52:20 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Wed, 15 Jul 2026 00:52:17 -0700
To: sashiko-reviews@lists.linux.dev
Cc: Anisa Su <anisa.su887@gmail.com>, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v11 05/31] cxl/mem: Expose dynamic ram 1 partition in
 sysfs
Message-ID: <alc8MagZWKAAcNA_@AnisaLaptop.localdomain>
References: <20260625112638.550691-1-anisa.su@samsung.com>
 <20260625112638.550691-6-anisa.su@samsung.com>
 <20260625181243.77F581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625181243.77F581F000E9@smtp.kernel.org>

On Thu, Jun 25, 2026 at 06:12:42PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Empty sysfs directory created for absent dynamic RAM partitions.

Fixed.

> --
> 
> commit 839299dd9514d54314e661cd789de765da08d4f4
> Author: Ira Weiny <iweiny@kernel.org>
> 
> cxl/mem: Expose dynamic ram 1 partition in sysfs
> 
> This commit exposes the details of the first dynamic ram partition via
> sysfs so user space can properly configure CXL regions.
> 
> > diff --git a/drivers/cxl/core/memdev.c b/drivers/cxl/core/memdev.c
> > --- a/drivers/cxl/core/memdev.c
> > +++ b/drivers/cxl/core/memdev.c
> 
> [ ... ]
> 
> > @@ -519,6 +551,29 @@ static struct attribute_group cxl_memdev_pmem_attribute_group = {
> >  	.is_visible = cxl_pmem_visible,
> >  };
> >  
> > +static umode_t cxl_dynamic_ram_1_visible(struct kobject *kobj, struct attribute *a, int n)
> > +{
> > +	struct device *dev = kobj_to_dev(kobj);
> > +	struct cxl_memdev *cxlmd = to_cxl_memdev(dev);
> > +	struct cxl_dpa_perf *perf = part_perf(cxlmd->cxlds, CXL_PARTMODE_DYNAMIC_RAM_1);
> > +
> > +	if (a == &dev_attr_dynamic_ram_1_qos_class.attr &&
> > +	    (!perf || perf->qos_class == CXL_QOS_CLASS_INVALID))
> > +		return 0;
> > +
> > +	if (a == &dev_attr_dynamic_ram_1_size.attr &&
> > +	    (!cxl_part_size(cxlmd->cxlds, CXL_PARTMODE_DYNAMIC_RAM_1)))
> > +		return 0;
> 
> [Severity: Low]
> Should cxl_dynamic_ram_1_visible() return SYSFS_GROUP_INVISIBLE here when the
> dynamic RAM partition is absent?
> 
> Since cxl_memdev_dynamic_ram_1_attribute_group is a named group
> (.name = "dynamic_ram_1"), returning 0 hides the individual attributes but
> still creates the group directory.
> 
> Won't this result in a permanently empty "dynamic_ram_1" directory in sysfs if
> the size is 0, rather than suppressing the directory entirely?
> 
Fixed.

If a DC partition's size is 0, better not the expose the directory at
all, instead of hide both attributes.

Ram and pmem always expose the size attribute, even if the
size of the ram/pmem partition is 0, but that makes less sense for a DC
partition, especially if support for multiple partitions is added later.

> > +
> > +	return a->mode;
> > +}
> > +
> > +static struct attribute_group cxl_memdev_dynamic_ram_1_attribute_group = {
> > +	.name = "dynamic_ram_1",
> > +	.attrs = cxl_memdev_dynamic_ram_1_attributes,
> > +	.is_visible = cxl_dynamic_ram_1_visible,
> > +};
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260625112638.550691-1-anisa.su@samsung.com?part=5
