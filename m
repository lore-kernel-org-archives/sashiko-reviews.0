Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1AB175A83
	for <sashiko-reviews@lists.linux.dev>; Wed,  5 Aug 2026 08:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918621; cv=none; b=SzLlbh0mKrx31N/PhBV2+S/e6gmt91WiTyCyTkZgPWPyB6nl0/7kVFJzFcys2xw+eh63NLDauWw3UstEz1ugE/Te3Vrgc2otyqbo4qzWjnSMjMD5QtyErKkAGnvJ0dtTYYY+g9J1JZk2knTNBQXJnboLmZfBkuizd3AIJjxGj6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918621; c=relaxed/simple;
	bh=wyDb6aiYJzuDo75DXeSRbyfaXaw4LKngEepKY5JR8mc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reoaBfjX6Dyh2XEMze23YBpg1+jUIwOaoGYJt3qkovJ0iqIDGb3n0lxCU5JXGHAK/vMLfOTvzJdfGbMzsspu9xADELlgl9Q9abVPFbEVe6PvUuaWfUaL5PGwZ6SiLmJ56lRiUBcZxxqO2s6XrPkHZjVfyEmmMCbSknGJKn4DB3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7EGUhiF; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7EGUhiF"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cf452def93so16311735ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 05 Aug 2026 01:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785918619; x=1786523419; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mpPAMc4ZZFPnAnk5upUQB/9QFh37+AndiyvVntjTWm4=;
        b=L7EGUhiF57S690QpdxjGPCw9QQqu6+E3uLPW4cZX1Tx72IiPhOO1T3Y/e+v6AgzGFF
         IHEMXCrYqMjMD16g6rvOBck7RiRnwuWHQHXInCCQRZkICrX1BvSCorxBEuD9bNh0+zRX
         kZkalCvBuBdsgGLBAvFv+Ul5gKzyGAbpv0+Vn1WxqjK9UarOK7RgVmM0nTzk08bkyopB
         vKj/5BxT6b0tX+QXpHzpqBck+x3Be4fZCWJmtxPBbflxPJUgdx8cTx/GheUmy6dHEkGP
         d9NH4I8aVjbuXMEotSA597eGyQf0wyMJZco0EzsV4wGZwR8W0VRHVwrrcAGnC6hjfnB2
         gRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785918619; x=1786523419;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpPAMc4ZZFPnAnk5upUQB/9QFh37+AndiyvVntjTWm4=;
        b=B9SPqY1BWSQf7b2Nn9QtKrjP57FKkomvhXnvBQ7P6bvTqyUwQ1XG6G5IP/1TMCQ4Ly
         cxqHXZVc/ICRz/h2yln29nRvbADQ6rH+zui11kx0trC0CcLTk44jEtUsJuWAyCdH+04b
         KoH+96h7kKj4xFgsEHP9xd3P9Zru9lfFfgrePbF+ionUB4meNuUFUycyJX0eN5JEHirR
         4ecsQHSNdw4XqSgzqOKl5SgGVF1zcZD/bN8tOjKRk1kYWLL02HY5updLcBa9Aw1i0fzT
         5kRnwmaJS5L+d9cuV8ATs3YcWCN3wtV20g9rHrrMtNxTOgqEd84rlJuCh34W3wvpcmKN
         Wn1Q==
X-Forwarded-Encrypted: i=1; AHgh+RqOGmChTEHvCincn5Ug+0m31MPmyF78Tb90goJGXpxY6Lt9nAFS86CgQ/Q3us+rV2EsCWmcnHEeh9QbcrVcpVk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yypp09FO4vqZjgG2sytvJbJkorBB2NBQtcdtD7eVwn7htCiSf0D
	9MH1tSIu828DxtaNSOrFi51oXetMQmyGuheQ6claTeTpAapItb6Fbgqbq+DPdsD2
X-Gm-Gg: AR+sD13CvTZ4yA7Xj75BRsEmwIN6ezik9aukqAhuvWC8Ysm4ryekfEeYcGaHhEegevR
	jP7cC9wU7AJiF5uW6qFXTMTOczNwETs9MP02T5hOVW3QDnHnk+bINpAzPfsAUYwi2v0UmPoMwDF
	QOp2nPcR46XY6QcK9l3oJlqDQZ2DPQoK73nMxDBm5SbLemDhBQXQPhhhXRiQkyVa0jnSm0LqdH1
	YMb2WwP5Th87IRVtbLwMGwErp905Wsf8vykT3eSmUio0AbJZSvmWsh7WcHC1/raer9ePYJHVLQD
	SFNqzGBlmVfsKfJfjhPkVZY3GWcFhv8IIAyC0Q5kKmFWsMXV2W1ptZTdJkBUS+Lg16J6zloGrHI
	ZXaOjA8MWMut7Qorbx8UhNEO58/fjGtsKheX7Iwkwv1Z339GTwt7fH9wzgmtcWkUVdDy5RgQ/PQ
	nj75uT8e15uUgUTM7CSbcl0Ykv6DhOg+GFaC2IkGgBwX4FvsQ4yIeHUveglyFyyo7adg6tOYEzq
	HjZYrVthP+2rtfUFwAvBUzriGJIbmoRyrLss4eOa712wQOUDFsfcSI=
X-Received: by 2002:a17:903:384d:b0:2c9:c517:d08b with SMTP id d9443c01a7336-2d0c9b8873cmr27963405ad.22.1785918619163;
        Wed, 05 Aug 2026 01:30:19 -0700 (PDT)
Received: from AnisaLaptop.localdomain (c-73-170-217-179.hsd1.ca.comcast.net. [73.170.217.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f9362esm15543935ad.12.2026.08.05.01.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:30:18 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Wed, 5 Aug 2026 01:30:16 -0700
To: Jonathan Cameron <jic23@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
	Anisa Su <anisa.su887@gmail.com>, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v12 3/8] cxl/cdat: Gather DSMAS data for DCD partitions
Message-ID: <anL0mD3DKfwJh4UY@AnisaLaptop.localdomain>
References: <20260731084901.1512819-1-anisa.su@samsung.com>
 <20260731084901.1512819-4-anisa.su@samsung.com>
 <20260731090250.0C8DE1F000E9@smtp.kernel.org>
 <20260804010748.7f9f8174@jic23-huawei>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804010748.7f9f8174@jic23-huawei>

On Tue, Aug 04, 2026 at 01:07:48AM +0100, Jonathan Cameron wrote:
> On Fri, 31 Jul 2026 09:02:49 +0000
> sashiko-bot@kernel.org wrote:
> 
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > - [Medium] The commit message claims to extract and store the 'read only' attribute from DSMAS tables, but this logic is completely missing from the code.
> 
> Given it will make a lot of difference to a user if they think they have writeable
> memory that isn't - I think we probably do want to have readonly here.
> 
I did some digging: it seems in v8, the read only flag was gathered and
exposed in sysfs, but dropped during the region -> partition rework.

v8 of this commit used to do:
    dent->read_only = dsmas->flags & ACPI_CDAT_DSMAS_READ_ONLY;
    ...
    mds->dc_region[i].read_only = dent->read_only;

    https://lore.kernel.org/all/20241210-dcd-type2-upstream-v8-6-812852504400@intel.com/

and a following patch exposed it, with a documented ABI:

  https://lore.kernel.org/all/20241210-dcd-type2-upstream-v8-7-812852504400@intel.com/

    /sys/bus/cxl/devices/memX/dcY/size
    /sys/bus/cxl/devices/memX/dcY/read_only
    /sys/bus/cxl/devices/memX/dcY/shareable
    /sys/bus/cxl/devices/memX/dcY/qos_class

In v9 dynamic capacity moved from its own dc_region[] array and dcY/
sysfs directory to the generic partition model:

  https://lore.kernel.org/all/20250413-dcd-type2-upstream-v9-3-1d4911a0b365@intel.com/

size and qos_class survived that move because ram and pmem already have
them. read_only and shareable did not, because the generic partition
model had nowhere to put attributes that only dynamic capacity has, but
the commit message survived the rework.

More specifically, read_only was dropped from both the sysfs commit and
this commit. shareable was dropped only from the sysfs commit, but still
read from the DSMAS entry in v9 of this commit. Not sure why though; I
didn't see any consumers of the attribute. Oh well... We use it now
since shared extents are supported to check if an extent marked shared
is actually in a shared partition.

So TLDR; I've removed the "read only" part from the commit message. But
let me know if you think it should be re-introduced?

I agree with what you said about it being important for a user to know
whether a partition is read only. Some things to consider:

- The partition model has no precedent for a DC only attribute.
  dynamic_ram_1/ currently exposes size and qos_class, the same two that
  ram/ and pmem/ expose. Adding read_only there would be the first
  attribute that exists for one partition mode and not the others.

- shareable is in exactly the same position. It is gathered and used
  internally but not exposed anywhere, so if we are adding one of these
  back we should probably decide about both.

- I don't think the DSMAS Flags bit 6 (read only) is specific to DCD?
  It describes any device scoped memory range, so a read only ram or pmem
  partition is expressible in CDAT today and the driver ignores it.
  Maybe it should be exposed in sysfs for every partition
  rather than only on dynamic_ram_1? Which probably makes it a generic CDAT/partition
  patch rather than something for this series.

> > [ ... ]
> > > @@ -266,15 +268,26 @@ static void cxl_memdev_set_qos_class(struct cxl_dev_state *cxlds,
> > >  		bool found = false;
> > >  
> > >  		for (int i = 0; i < cxlds->nr_partitions; i++) {
> > > +			enum cxl_partition_mode mode = cxlds->part[i].mode;
> > >  			struct resource *res = &cxlds->part[i].res;
> > > +			u8 handle = cxlds->part[i].handle;
> > >  			struct range range = {
> > >  				.start = res->start,
> > >  				.end = res->end,
> > >  			};
> > >  
> > >  			if (range_contains(&range, &dent->dpa_range)) {
> > > +				if (mode == CXL_PARTMODE_DYNAMIC_RAM_1 &&
> > > +				    dent->handle != handle) {
> > > +					dev_warn(dev,
> > > +						 "Dynamic RAM perf mismatch; %pra (%u) vs %pra (%u)\n",
> > > +						 &range, handle, &dent->dpa_range,
> > > +						 dent->handle);
> > > +					continue;
> > > +				}  
> > 
> > [Severity: Medium]
> > Could this trigger spurious warnings on valid hardware configurations?
> > 
> > The CDAT specification allows overlapping DSMAS ranges with different handles
> > to support multiple memory types or sharing characteristics for the same DPA
> > space. 
> 
> Huh?  Where did it get that from.  I'm 99% sure you can't have overlapping
> DSMAS entries for the same DPA space.
> 
Sigh... sometimes it does that. I double-checked the CDAT spec (r1.04)
to confirm:

The DSMADHandle of a DSMAS entry is described as "The handle used to refer to
this DSMAD. Each instance of DSMAS shall be associated with a unique
DSMADHandle value."

So each DSMAS describes exactly 1 DSMAD (DPA range).

Additionally DSMAD is defined as:
	 Device Scoped Memory Affinity Domain (DSMAD) is a contiguous
	 DPA range *** with unique memory attributes*** ...

Treating it as a false positive.

Thanks,
Anisa
> > 
> > If a compliant device provides multiple valid DSMAS entries that overlap
> > the partition's range but have different handles, won't iterating over them 
> > incorrectly flag the unselected ones as a perf mismatch?
> > 
