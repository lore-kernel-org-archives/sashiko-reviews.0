Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D8D390CA9
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 22:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780697004; cv=none; b=XH40jcUUWpu/adIfoQxAZK94Cyrf+gUEoh7v5uUS9CBV1w09wuWbiy9EwyLo77i+WAUQJIF60Hw6Ls7rnMXdiMlUT+3Mkqbs33L8oLnN8JJkezteDleDXD95RuMeAuxLPdMzZHLYzpQfmkrhs1i+7eKhjFAnXjWl91bnA9iRMKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780697004; c=relaxed/simple;
	bh=SPbh3ojU72bFIXuY0qiZcOuk2PrvLuoH5dLI7Gt1djE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asDZ8lnijCgzVVF90nGAz9jzrQLWbIHsfBYnf14wyjk8mJtH+267dY9JdsGlHvfcqpdJuEAriTZJ763nh3j7MFjPmHtmAoo3kTL1CtlO3xeYQPoh5iDVdjD9bpiwxuMw3lJQLhq96gtjJrLT2RorIo5VrE+n/rrM/I0iJ8yMgsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=hrxocClm; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="hrxocClm"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5177b9a02bdso36113831cf.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 15:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1780697002; x=1781301802; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5SZooodiCJIzwrHSkzIWvRjJGmT7hEK7Fa4gKTfb1gU=;
        b=hrxocClm8JfRq3L5ItAFt/rAX+iqctQ8PveQta08A+4jX1phr96SiF3kyYyhi2sO69
         9YQOsS34e9X94n40qhGlqdwKSIDjSWp7K+Meptk3j4M08FZVCKtIq7djTtSVLg6H5Z3P
         5XJbB8rrRl0xnkb6oT+LmrxsbcO1jauL4DD+K9pe+SWr9TBVh4ZFg4AuPlp/lQo5k3hp
         Y6FqlWV7MEAJV52XVeT3dntAZQOcyZ37Hzjji0XSkyOzFBhjJ3i7DtcB3L/FVvRhKZup
         E13lQNr424TIBF0eXxCPR6wAV5c59DmWw3dCw+3dJbv5m0PEVhth83PL08gEqqz+DKXS
         hTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780697002; x=1781301802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5SZooodiCJIzwrHSkzIWvRjJGmT7hEK7Fa4gKTfb1gU=;
        b=qXriV6gGAsaacpR33FgasZbCdSuT0sAc4gsWA6Ra2KzQnW15sdEySX5LIAJcTnYPSO
         52Q0mfSlJ8rXNT28qqhVLB8mT4PNSriWbrdCbYFg83dfHoCl1S1DspKEvTD6wQPe8vBK
         XiB9oSWRwO+oMZXS/c6Z6KgY8RUrk81aw3DA2cFSstgl7/IgOh7pWCxAMi1TNkWX721B
         B9hT+n8X8y/3kWV/SniRIsJXMK3ZRMjcOYUNHWIIo1zx7GbSYMC1Sa4wSAUr1UedvGw7
         R5e3qyhVRcmQ7dmI53NQD4XIrrT3YQGBe4iYcXjGC2Rf9n6jTclLdM35O9Bemh+A29OC
         o7sw==
X-Gm-Message-State: AOJu0YxltPiWhE+MGIbrkpn7n+9ADeJNlQ9gIxJ4TFUjL4YSiYTYYq7i
	m/b9kjxp2j+Oqw1Q7R+csEMiFXvEaC5zwQwabfi5lPXOZh7UE+Ekw/ABl/VTkCc7oSTzhSUwx4i
	6NKzlQWrRug==
X-Gm-Gg: Acq92OFJk6SaR2avjAprjmPrbsyPSAFRDhLey/yAGaGlfPQ+ud0Ezxe6tHCKwVbkO55
	IwIIo33A7nLoavJ7XkOGw9RZyb2mp0V5qwD9OWfAStCjhkCR4Etiu3RwQSlRE+FxPzws4u0Zg+j
	9/ANZEuk6KDpaQiw1/n3dnGe0hUxN3BMDmueL3iB4x5/nYmwcVtBWS+vf6pUMoAKnQT/ucIcvIV
	hJRBFe3diSTVU+sfnws5cIB/TsflzgjB4f/28L7VwopJV+8m+Qj5pBLEx6ewyoXz1+KpF92Tefh
	EYRnIBYSzUpBfhh+0ziLav827KXsD1ux8EViH10OTY46fZefLpcxZWB93lg0Gj5lC1GhL2Vgnow
	tL9cdN/dKkHhtDwqPK3fcs7L/BakcMKDqDJ7FK/9/De+uD0gLxlrakugvdmTH3HLEOiY0mcMrdb
	Ky1b4rp42fC5bi4LpIJm+yFZjgQ20yRpb5adgl7+krkkdDTpkNBWu9VLUW3oixfV1RsOsp0Ekzw
	OO9WIpYRwJoHcG8+tutMvFEpEms
X-Received: by 2002:ac8:6102:0:b0:517:5add:e449 with SMTP id d75a77b69052e-51795b9ec5amr82684041cf.22.1780697002243;
        Fri, 05 Jun 2026 15:03:22 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775da6f41sm87047171cf.22.2026.06.05.15.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 15:03:21 -0700 (PDT)
Date: Fri, 5 Jun 2026 23:03:20 +0100
From: Gregory Price <gourry@gourry.net>
To: sashiko-reviews@lists.linux.dev
Cc: linux-cxl@vger.kernel.org
Subject: Re: [PATCH v4 7/9] dax/kmem: extract hotplug/hotremove helper
 functions
Message-ID: <aiNHqGsMih-XF0tu@gourry-fedora-PF4VCD3F>
References: <20260605211911.2160954-8-gourry@gourry.net>
 <20260605213602.10D1E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605213602.10D1E1F00893@smtp.kernel.org>

On Fri, Jun 05, 2026 at 09:36:01PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] dax_kmem_do_hotplug() unconditionally attempts to add memory for all ranges, missing a check for successfully reserved I/O resources, leading to unsafe hotplug and a permanent memory leak on removal.
> --
> 
> > +
> > +	for (i = 0; i < dev_dax->nr_range; i++) {
> > +		struct range range;
> > +
> > +		rc = dax_kmem_range(dev_dax, i, &range);
> > +		if (rc)
> > +			continue;
> > +
> > +		mhp_flags = MHP_NID_IS_MGID;
> > +		if (dev_dax->memmap_on_memory)
> > +			mhp_flags |= MHP_MEMMAP_ON_MEMORY;
> > +
> > +		/*
> > +		 * Ensure that future kexec'd kernels will not treat
> > +		 * this as RAM automatically.
> > +		 */
> > +		rc = __add_memory_driver_managed(data->mgid, range.start,
> > +				range_len(&range), kmem_name, mhp_flags,
> > +				online_type);
> 
> [Severity: High]
> Should this loop verify if the resource was actually reserved before
> adding the memory?
> 
> In dax_kmem_init_resources(), if request_mem_region() fails for a range
> but a previous range succeeded (mapped > 0), the failure is bypassed and
> data->res[i] is left as NULL.
> 
> If we don't check for !data->res[i] here, does this unconditionally call
> __add_memory_driver_managed() and hot-add memory for physical ranges that
> failed reservation?
> 

This feedback is actually subtly wrong, the old code would do

for region:
  get_resource()
  hotplug()

The new code does

for region:
  get_resource()

for resource:
  hotplug()

I see now I forgot to error out if nr_success != nr_requested.  With
that, this condition goes away entirely and we can cleanup without a
partial hotplug event from having occurred.

~Gregory
