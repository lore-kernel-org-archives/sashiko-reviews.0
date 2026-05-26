Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D013C2B9B
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 21:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779831461; cv=none; b=uVFYn0TEER0qfY9yTSYFHM4onQsfb/ofUVdTL/NKZnr98zCb+6oSlUxFkCkg7AVXQmqoZjI0qetiKQPnj7RNsfOmKs3mqQVJqi39noUlTf668r9AYyZmiXcnPa4U9M69niEONx7glsV95TW/OMNecp4jlNZhkc8VU5a65xAOHpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779831461; c=relaxed/simple;
	bh=HG4xVfrnXi6E1NzBFUDPFHVSXE8Fty3+vuRYUDgcfZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KI2g/d55I5c41qLQkz0lGCY8XAYNI0L+UycCuVf1FkcRXPWGIojkAuk09jHRi2bDZNd0EW6uDFUm2P9R8loFmzBAJjpT3BKjuuqYixzd8Hls3aTp6NVCM26ZmtHAecsNTyWolpgqaTdZn1YBo40S8WaaWFHbVE8iP9c+bZGKtuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rgfl20Cq; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rgfl20Cq"
Date: Tue, 26 May 2026 14:37:13 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779831456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kjRuisyNNQy4ku/kSHiUBl5SugkhEtzAPwYa6riXyjU=;
	b=rgfl20CqrU3y8FA9y64GaR+mCfFJ5UFGNKG9hea0P2dA1eC88SlZmItgk2UMtDfijvJzV+
	EMrKlAVlTk/UqJ4BG3hF0OVUAqvfDbuA/25A109zsS4mIJEqi1Otg1p+SQb5s5FYUTV5M1
	oDD5bDi4G7E4JHnLjXKkPI62bbiChKg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
To: Amery Hung <ameryhung@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [RFC PATCH bpf-next 09/12] bpf: Add infrastructure to support
 attaching struct_ops to cgroups
Message-ID: <2026526211020.HhEJ.martin.lau@linux.dev>
References: <20260519215841.2984970-10-martin.lau@linux.dev>
 <20260519225002.986EB1F00893@smtp.kernel.org>
 <2026519225454.By6y.martin.lau@linux.dev>
 <CAMB2axPDDom8sD7u+2Fgo9dZO1ereX-unai8EW1SmsiDrnzzwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMB2axPDDom8sD7u+2Fgo9dZO1ereX-unai8EW1SmsiDrnzzwQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue, May 26, 2026 at 10:54:00AM -0700, Amery Hung wrote:
> > > > +static enum cgroup_bpf_attach_type find_atype_by_struct_ops_id(u32 type_id)
> > >
> > > [ ... ]
> > >
> > > >  static void *bpf_cgroup_array_dummy(enum cgroup_bpf_attach_type atype)
> > > >  {
> > > > +   if (cgroup_bpf_is_struct_ops_atype(atype))
> > > > +           return struct_ops_cfi_stubs[atype];
> > > >     return bpf_prog_dummy();
> > > >  }
> > >
> > > [Severity: High]
> > > Can using a loadable module's cfi_stubs as a dummy sentinel cause a
> > > use-after-free when the module is unloaded and reloaded?
> > >
> > > If all maps are detached, the module providing the struct_ops can be unloaded,
> > > and its cfi_stubs memory freed. However, the cgroup's effective array might
> > > still retain the dangling pointer to the freed cfi_stubs if BPF_F_ALLOW_MULTI
> > > was set.
> > >
> > > If the module is reloaded, cgroup_bpf_struct_ops_register() updates
> > > struct_ops_cfi_stubs[atype] with a new pointer. If a user then queries the
> > > cgroup via BPF_PROG_QUERY, the loop checks
> > > item->prog == bpf_cgroup_array_dummy(atype) to skip the dummy. Since the
> > > array contains the old freed pointer, it won't match the new cfi_stubs
> > > pointer, and the query loop might mistakenly treat the old dummy as a valid
> > > map, causing a use-after-free when calling bpf_struct_ops_kdata_map_id().
> >
> > Agree. This will be an issue on BPF_PROG_QUERY when the module reload.
> > I did think about the module reload case but I have only considered the
> > rcu-reader in bpf_cgroup_struct_ops_foreach.
> > BPF_PROG_QUERY does not use rcu_read_lock and depends on cgroup_lock.
> > This will need to be addressed.
> >
> 
> Also thinking of the potential problems of leaving dangling cfi_stubs,
> but I don't see any other cases.
> 
> In this instance, it seems adding a cgroup_bpf_enabled() guard in
> __cgroup_bpf_query should be enough. The dangling cfi_stubs will not
> be cleared until update_effective_progs(), which happens during the
> first struct_ops map attachment. cgroup_bpf_enabled() will be false
> until a struct_ops map is attached.

In __cgroup_struct_ops_link_detach, the static_branch_dec is done without
the cgroup_lock() for now. May be moving it before the cgroup_unlock()
is enough?

__cgroup_bpf_query() has already held cgroup_lock(). I was thinking to
use cgroup_lock() in cgroup_bpf_struct_ops_register() also but it will
need a cgroup_bpf_struct_ops_"un"register() when the module is in
MODULE_STATE_GOING.

Either way, this should fail early in __cgroup_bpf_query() once detected.
