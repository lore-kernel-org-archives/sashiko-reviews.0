Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092E54E3782
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 14:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779201770; cv=none; b=jd0P8yHGf6GLUVoQzJJq8uzD17DlFhhNuDP025LMcyB7CgLRd+OXxaIYFxYKgAWVe+TwttiSJUdnmWEx8RM9ATDETClOVashosa2dK3L4ykQ9fk9tmWM3qj3abPaq1txAG7wHNmp5NJVY0YsoSmbRnesuRxCO/zWbSSedvN881w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779201770; c=relaxed/simple;
	bh=YWXRV+NQFDhT7ERt4QhzrnIt+wYuh2w0flQKS9YlgtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqt5iUZWgiY/oQXBnopOnoYKcJfFO/uKEeFHf4qxHf0gEnecmEtdz9LlgPovYiVY2vx1cS1yu1j0DeK6/PxlwHfMeo8zd2hGaTokF6kbDcdPhygbn2j3zBHQhJc90uUuP/wVy7U3yW7PBUe9EyIrNE7y5HcX8u+l9mQOYbvM5Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcCASo1m; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcCASo1m"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7c5d8f45465so31704927b3.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 07:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779201765; x=1779806565; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SMJK+Q1KPAmdYgADquxXV0jIfAYvH6d0diFJCZ4DWlw=;
        b=JcCASo1ms6UWF53kRcuE4/Qe6TLamWmdaxb095lrdGS0SxVPqZjxYmRCvjnICR2lTJ
         tKu5/PXtjrQno7onrQnSCcjWEnmR/uyHk7+pI3pZdlBC7wv7iSjtYbxGbHzB0SpHPttb
         uwOWYJ2yk2OlPEqBEBWJnS3DaUUaiuV7lD3h27vaYm0DY/gp1v3p0fryv1kSfsyHVq93
         1qWhzK6N3g+HI6C1NOmJJXBXj4ku3ZdD7png8HhfWGVFkb2yrZ1Ngludo4yzdwD3yn+o
         cPzZVs3s98caeNFGK/aznjkLb6bCrxqXufsbXxGARu6s61yNda9mGun7/8m7D5z76Ews
         Lisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779201765; x=1779806565;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SMJK+Q1KPAmdYgADquxXV0jIfAYvH6d0diFJCZ4DWlw=;
        b=WksQhbS6rLyqFbBF/6CGrnNJvhNEQ6pSrkKxdHP1Q227NUJ52q08yuoOFjbyDpaRdG
         6y71/u7M0VlSwpbBS7DnjeodmJ82pCVhYXK4xahAz8Di+WNKnRfH90armZoZgGDl5kxp
         mDbclm18ZyjutVgpE/27SjxHBeNvA01K8JfR7VHWGHjJ+zkSKT2Oc+CtVSYchG2QxiS1
         V6xrBgHyD/JX1hUTbdAupSvlJyI+NBSabeORWS825Z2zIL/uGtdsD8XBoAyu67ZqtaKq
         FufrA3/1uSm1ygOHj2OeWqkRsdXLPle+QK5k6HRiziNV3IFrQcU8hmb2urKutd3E6ygs
         wV0w==
X-Gm-Message-State: AOJu0YznGR9G9s67fKhoEC16qDKjPjmjb4fDGlZcSvMv17yvjQjmuKpl
	hM+586dYGxtUs/ccGmKaX1X6FEd7FDFyEs5ITrJDgON3aWDEPNGPb0rOGmK4Ng==
X-Gm-Gg: Acq92OHseKWEv/2JyY3fFNc7z9SriJyLEw2Z5fYcAqB//vFU4IGcqApIxw4vvph4dyR
	Inw1YHlABOxjXB4F3n5Tb2kVMb7t4/n7fZi5X85uzieb5J6Y5tRJMgVjeKhdG06jBbw7C9g1dmi
	/DMUKCHrVEQk7nAEDpFqKqVqnKKNvourrKjCSihlhfLWyilWIhcGzAIsvfCOI7F2ms97B9yW/iT
	NRVVV46er/rBnsJIk4NvsAMXY6jarZMszrd0OVj43NkMwF2CDZBIwaGoWO5LpoavpaHB6Een2HP
	rOPxI089KyrE90jPW8ruyVr1tDGnqKkJ/lOlx3HPLdUaMYFGT15tB/c+qDNnDK1yQKkPvMqJ/cY
	iHiiDA0o3uyxms79PSMGhdd2VjZHEFUSPoEpJm4XYx7Hv+qJlQ1hHiLFx8XURuyBb0+sGFa5bw3
	5VweWlPOA0MX7dnvx6mkyZS6jkxxf86iuq4JMHXd/mLE07SooVZw40Yi/PPQ==
X-Received: by 2002:a05:690c:dd3:b0:7b8:926e:3f0d with SMTP id 00721157ae682-7c95c6f6efbmr208816987b3.26.1779201765187;
        Tue, 19 May 2026 07:42:45 -0700 (PDT)
Received: from suesslenovo ([98.97.172.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc9cda1a38sm37276747b3.43.2026.05.19.07.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:42:44 -0700 (PDT)
Date: Tue, 19 May 2026 10:42:44 -0400
From: Justin Suess <utilityemal77@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/1] bpf: fix deadlock in special field
 destruction in NMI
Message-ID: <agxkV-hsdwhvMliI@suesslenovo>
References: <20260519011450.1144935-2-utilityemal77@gmail.com>
 <20260519015123.36096C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519015123.36096C2BCB7@smtp.kernel.org>

On Tue, May 19, 2026 at 01:51:22AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] LRU maps containing NMI-unsafe fields (like BPF_KPTR_REF or BPF_LIST_HEAD) will permanently leak these fields and corrupt map state when updated or deleted in an IRQ-disabled context.
> - [High] Modifying the generic `bpf_obj_free_fields()` to silently skip destruction in IRQ-disabled contexts causes permanent memory leaks for callers lacking deferred destructors (like `bpf_obj_drop` and Array maps).
> - [Medium] Forcibly mutating the user-requested `map_flags` to include `BPF_F_NO_PREALLOC` silently breaks performance expectations and UAPI transparency.
> --
> 
> commit 3fbec1aa4107fa1f73249893a4ed21fd7d2213fa
> Author: Justin Suess <utilityemal77@gmail.com>
> 
> bpf: fix deadlock in special field destruction in NMI
> 
> This commit relaxes bpf_obj_free_fields() to skip async work cancellation
> and unsafe free operations in IRQ-disabled contexts. It converts hash maps
> with NMI-unsafe fields to non-preallocated maps using bpf_mem_alloc to
> defer the cleanup. LRU maps and preallocated hash maps are adjusted to
> support this mechanism.
> 
> Closes: https://lore.kernel.org/bpf/20260421201035.1729473-1-utilityemal77@gmail.com/
> Link: https://lore.kernel.org/bpf/DIG0ONMVOP0L.3QFYUPWFSKWI4@gmail.com/
> 
> > diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
> > index 3dd9b4924ae4f..0db1dc8ae0bec 100644
> > --- a/kernel/bpf/hashtab.c
> > +++ b/kernel/bpf/hashtab.c
> [ ... ]
> > @@ -522,13 +532,53 @@ static int htab_set_dtor(struct bpf_htab *htab, void (*dtor)(void *, void *))
> >  	return 0;
> >  }
> >  
> > +static int htab_convert_to_non_prealloc(struct bpf_htab *htab)
> > +{
> > +	bool percpu = htab_is_percpu(htab);
> > +	int err;
> > +
> > +	htab_free_prealloced_fields(htab);
> > +	free_percpu(htab->extra_elems);
> > +	htab->extra_elems = NULL;
> > +	prealloc_destroy(htab);
> > +	htab->map.map_flags |= BPF_F_NO_PREALLOC;
> 
> Does mutating the map flags post-creation to include BPF_F_NO_PREALLOC alter
> the memory model and user-visible flags without warning? If userspace queries
> the map info via bpf_map_get_info_by_fd(), will it see flags it never
> requested?
Changing the userspace visible flag was done to provide visibility into
the change.
> 
> Would it be better to explicitly reject this configuration and return -EINVAL
> rather than secretly altering the underlying memory model?
>
That would break existing progs unacceptably, including the common case
of a normal hashtab with ref kptrs and no BPF_F_NO_PREALLOC flag.
> [ ... ]
> >  static int htab_map_check_btf(struct bpf_map *map, const struct btf *btf,
> >  			      const struct btf_type *key_type, const struct btf_type *value_type)
> >  {
> >  	struct bpf_htab *htab = container_of(map, struct bpf_htab, map);
> > +	int err;
> > +
> > +	if (!htab_has_nmi_special_fields(htab)) {
> > +		if (htab_is_prealloc(htab))
> > +			return 0;
> > +	} else {
> > +		if (htab_is_lru(htab))
> > +			return 0;
> 
> Since LRU maps are exempted from conversion to non-preallocated mode here,
> they do not use bpf_mem_alloc and completely lack the deferred destructor
> mechanism relied upon by this patch.
> 
> When an LRU element is replaced or deleted, htab_lru_push_free() is called
> and synchronously invokes check_and_free_fields() which eventually calls
> bpf_obj_free_fields().
> 
> If this executes in an IRQ-disabled context, will the new if
> (irqs_disabled()) checks in bpf_obj_free_fields() silently skip freeing
> the special fields?
> 
> Does this cause a permanent memory leak since the element is then
> immediately pushed back to the LRU free list? When the element is
> subsequently popped and reused, could it inherit stale pointers and
> corrupt map state?
> 
It doesn't cause a memory leak.

It does have the potential to reuse slots with existing pointers, but they
aren't "stale" they are valid pointers that are recycled until bpf_obj_free_fields
gets called on them in a non-irqs_disabled context which can happen on
another delete / LRU trim / an xchg out and release / map
destruction.

> [ ... ]
> > diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> > index 6600e126fbfb4..1f52453d5a2f1 100644
> > --- a/kernel/bpf/syscall.c
> > +++ b/kernel/bpf/syscall.c
> > @@ -839,6 +839,8 @@ void bpf_obj_free_fields(const struct btf_record *rec, void *obj)
> >  			break;
> >  		case BPF_KPTR_REF:
> >  		case BPF_KPTR_PERCPU:
> > +			if (irqs_disabled())
> > +				break;
> >  			xchgd_field = (void *)xchg((unsigned long *)field_ptr, 0);
> >  			if (!xchgd_field)
> >  				break;
> 
> Because bpf_obj_free_fields() is a generic helper used throughout the BPF
> subsystem, does silently skipping destruction in IRQ-disabled contexts
> cause leaks for callers that lack deferred destructors?
> 
> For example, if a BPF program running in an NMI or kprobe drops an object
> containing nested kptrs via __bpf_obj_drop_impl(), will the nested fields
> be skipped and permanently leaked when the outer object is queued for
> freeing via bpf_global_ma?
>
Looks like this kfunc also tries to eagerly free fields and is callable
from tp_btf/nmi_handler with no recovery mechanism.

I don't see a good way to handle this at all... it also is effectively
already bugged in the existing code unless I'm missing something

Since you can use it to call abritrary dtors in NMI.

1. 

In some context where task_acquire is valid:

struct blah {
  struct task_struct __kptr* task;
}

b = bpf_task_acquire(...)
a = bpf_obj_new(typeof(*blah_ptr));
bpf_kptr_xchg(a->task, b);

2. 

Then xchg a into map
bpf_kptr_xchg([map slot], a);
...

3. 

In tp_btf/nmi_handler we exchange the obj out of the map
and then drop it.

c = bpf_kptr_xchg([slot where a is stored], NULL);
bpf_obj_drop(c); 

And because this can be called on an object not in a map, we don't have
a good recovery mechanism.

Because tp_btf/nmi_handler is always in_nmi and hence irqs_disabled, in
the code before this patch the task_struct dtor will be invoked and
cause a deadlock.

This patch will not fix the issue and just free a struct blah holding the
reference without actually dropping it.

Unless I'm missing something then this whole approach taken by this
patch can't handle this case since the bpf_obj is detached from the map
entirely and has no allocator recovery mechanism at all.

Then we are back to square 1 needing to defer the freeing with irq work.

Kumar / Alexei do you have anything on this?


> Does this similarly affect in-place updates to Array maps which rely on
> bpf_obj_free_fields() to clear old special fields?
> 
Basically existing behavior (undocumented) is that bpf_map_update_elem
won't copy kptr fields timers or spinlocks. (see copy_map_value, and
bpf_obj_memcpy).

So those fields can never be overwritten from bpf_map_update_elem on an
array.

The only thing that really changes is that now instead of trying to free
the existing map slot value on update we just leave it alone if
irqs_disabled().

It's definitely a behavioral change either way. And it may be worth
extending the bpf_obj_memcpy/copy_map_value exceptions to the other
types covered in this patch.

This was discussed here. [1]

[1] https://lore.kernel.org/bpf/CAP01T75942V+wKJD0yhs8yb7U5vj+y9s6efJ+UdpTMfzP31CWg@mail.gmail.com/
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260519011450.1144935-2-utilityemal77@gmail.com?part=1
