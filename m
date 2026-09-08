Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B9F55D878
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 13:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874172; cv=none; b=IaYWGcWpXGMtiiX76eP4M/JYt0Iw9gQFz8pvxzIs42G6vbreqeww9s1PNCUxezUYASnGtVoEHds81LkHQM1UtOWi/bPMep2SNTj7y2p/lnngLmRT8EtMNLCP6DpaZVBP8QxJ4UZD+WdICIpoJrQz62Ryr7gGjNxjF8MyCVRWITk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874172; c=relaxed/simple;
	bh=ilMIv23jDI2om5QXhKraazCHucV6pJlWdlh4viYTMaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gn89aAxfsrhjHqLaaxqcr8nVcY879LQdC5shy8qSiTG+7s0f+Fiu260+KUkgRl2h7XgERso98h+QBXAz2fu4xm66hq6Ki/EELIhHBcL395Dub/I3wh1Z/crQ9+2bvKMT4dDgeQPN/jIwVXshDZmkDA5Neiuuo70qOVhmcRYMMkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZsrFJ5aS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZsrFJ5aS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fe89fb333so3045405f8f.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788874164; x=1789478964; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YSgzUdR3sqoyk/gUrIXmjoEFUchlJ3rVBgk6ATmeKIw=;
        b=ZsrFJ5aSP3Dl9CoZJcE+PvmwT/i84bUjtMSM9xNE1B3iQgRbGo5k9WqXmPm0MLr67U
         QfHoV8bnrCGsl708aeGcLLloFeU3LWOBBKkvr67PEWjaOp62IxXYltvmILRzAryOXMGP
         Auk3llIEDsbd53Fb9GQ7yw9VOVW1oQqMW5OyvGBOTqOycRPl+3Nnz3XikfrcOuvTIkn5
         Iyi948NLh8vy4v49uuP+yCIWCgX1dkWsYxkna58v9Txbs7RgRv/ERtp+IvlxSz3QyVcG
         VfazCX1CVwtNMds7f8kw5GqV3+HQeBPo7ldw20wRpN9SOdcYoQ5wv/sLtnmJKfFZJ1Jz
         0Caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874164; x=1789478964;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YSgzUdR3sqoyk/gUrIXmjoEFUchlJ3rVBgk6ATmeKIw=;
        b=kF96Z8lC7zHaSG3gwUsAEsNVcepmSnh/Bcq2eDJazUr93hqAKAsZamdD1ahHnRUwMK
         1wPSeqWAZPdAXop8KlGjp/TqHG4lHtyJ3+ri4+JEgH90ZSt87nIi9wLOibTSAHWRbRvc
         9LrNyAHtYNVfvQXwrFTyQKC2NvPf66d+FwQxIMKWpVEoNz6Sb1/2HAs881MfHDFHF8sS
         bqqHV53qVbAK8xghCmMEdcnFnVoMt8n0UrakXzCljJ4InWRDmbNVAhbXYLZGeBKTEZmi
         ol5UoWwv4Nk0HdlUjExZMMQLwU5FCySAuF3LLaCBm/eZ0P23lhJojmfqJe0MYAnxqUxs
         bILw==
X-Gm-Message-State: AFuF++kQC403pNU5phj6qem9BCM0uTeiH+2dEKxwRP8DWSqxz6BP40cD
	myQJzf7EXbundMAttTwMc2xsrFoFt8GqPKZaWdMnHwgnh/2Tke20hF8Gz9kyTMyEjYOmlrC9KJH
	9rOf70IE=
X-Gm-Gg: AYBFou1LYhGgfXC4MdTNJkfZsdXgcQRkzslI7NqI9DNohEtCYorznlVnZ73Dd2AsiVv
	N0VP+LhNWkiLIN071C66LFu1DreXLIbP3dZQNRuwz0QbvK6lk7ShmBANNL2571D+KntnAdCDRKu
	pt6wui2+1z+ySkoAda3f5/X7RzLPft01a4/dJYPF1Y+oRs4ggi/pB03qxLcsPbJtxNg+fKnWdJI
	NxxWRJW4pOk6lNEIOG6SSotSG4v8yBhgDSqTSasFQ4g+Mj5GO12LoESwsPN4tlC6lYOOHx23iQc
	UEgRRVQ7i8lVfTqwQjZAdDwoYjdxNB+nISQVOFieWSOB01DTtnnBKG5ywL38lxj26g6ErKVWL5y
	qCnzueh/emedETd4wBu92IijfVLtz2282p9hGiYB2hcwo4FlHPYok3RpGK2SHFHvp5ydVWs47BV
	tfrscO4oQkY8P4RnWsEqO1HaTItMuA6gtWgodNFQdHpN2SeFKxOxI=
X-Received: by 2002:a05:6000:4710:b0:485:8a47:5b83 with SMTP id ffacd0b85a97d-4858a475c60mr26306825f8f.32.1788874163604;
        Tue, 08 Sep 2026 06:29:23 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm36856922f8f.29.2026.09.08.06.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:29:22 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:29:20 +0200
From: Petr Mladek <pmladek@suse.com>
To: sashiko-reviews@lists.linux.dev
Cc: joe.lawrence@redhat.com, Harry Hsu <x90613@gmail.com>,
	jpoimboe@kernel.org, mbenes@suse.cz, shuah@kernel.org,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org,
	jikos@kernel.org, song@kernel.org
Subject: Re: [PATCH v4 4/5] livepatch: Clear relocations when
 klp_apply_object_relocs() fails
Message-ID: <aqANsLgTIOy44sDg@pathway>
References: <20260908120325.299649-1-pmladek@suse.com>
 <20260908120325.299649-5-pmladek@suse.com>
 <20260908121810.9577A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908121810.9577A1F00A3A@smtp.kernel.org>

On Tue 2026-09-08 12:18:10, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Off-by-one error in the rollback loop leaves the failing section's partially applied relocations uncleared.
> --
> 
> commit d297505bb4b1d833ec93725770d65ac1044abcad
> Author: Petr Mladek <pmladek@suse.com>
> 
> livepatch: Clear relocations when klp_apply_object_relocs() fails
> 
> This commit introduces klp_write_object_relocs_limited() to unwind and
> clear only the relocations that were successfully applied before
> klp_write_object_relocs() encountered an error. This prevents partially
> applied patches from leaving un-reverted changes that cause subsequent
> patch operations to fail validation.
> 
> Link: https://lore.kernel.org/r/20260830175608.4BABB1F000E9@smtp.kernel.org
> 
> > diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
> > index a6796cd6b65fd..714f97fdd271a 100644
> > --- a/kernel/livepatch/core.c
> > +++ b/kernel/livepatch/core.c
> > @@ -342,14 +342,17 @@ int klp_apply_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
> [ ... ]
> > +static int klp_write_object_relocs_limited(struct klp_patch *patch,
> > +					   struct klp_object *obj,
> > +					   bool apply, int limit)
> >  {
> >  	int i, ret;
> >  	struct klp_modinfo *info = patch->mod->klp_info;
> >  
> > -	for (i = 1; i < info->hdr.e_shnum; i++) {
> > +	if (!limit || limit > info->hdr.e_shnum)
> > +		limit = info->hdr.e_shnum;
> > +
> > +	for (i = 1; i < limit; i++) {
> >  		Elf_Shdr *sec = info->sechdrs + i;
> [ ... ]
> > -		if (ret)
> > +		if (ret) {
> > +			if (apply)
> > +				klp_write_object_relocs_limited(patch, obj, false, i);
> 
> [Severity: Medium]
> When an error occurs in klp_write_section_relocs(), the rollback is triggered
> with the failing section index passed as the limit. Since the rollback loop
> iterates with a strict less-than bounds check against this limit, will this
> skip the rollback for any relocations that were successfully applied within
> the failing section itself before it encountered the error?
> 
> It looks like this could leave partially applied relocations permanently
> in memory within the failing section, causing future module loads to fail
> validation.

Sigh, I did not go deep enough. And it goes down to the arch-specific
implementations, in particular arch/x86/kernel/module.c:

static int __write_relocate_add(Elf64_Shdr *sechdrs,
		   const char *strtab,
		   unsigned int symindex,
		   unsigned int relsec,
		   struct module *me,
		   void *(*write)(void *dest, const void *src, size_t len),
		   bool apply)
{
[...]
	for (i = 0; i < sechdrs[relsec].sh_size / sizeof(*rel); i++) {
[...]
			if (memcmp(loc, &zero, size)) {
				pr_err("x86/modules: Invalid relocation target, existing value is nonzero for sec %u, idx %u, type %d, loc %lx, val %llx\n",
				       relsec, i, (int)ELF64_R_TYPE(rel[i].r_info),
				       (unsigned long)loc, val);
				return -ENOEXEC;
			}
			write(loc, &val, size);
		} else {
			if (memcmp(loc, &val, size)) {
				pr_warn("x86/modules: Invalid relocation target, existing value does not match expected value for sec %u, idx %u, type %d, loc %lx, val %llx\n",
					relsec, i, (int)ELF64_R_TYPE(rel[i].r_info),
					(unsigned long)loc, val);
				return -ENOEXEC;
			}
			write(loc, &zero, size);
		}
[...]

We would need to implement the revert at this level.
IMHO, it could be done separately.

I used Gemini LLM to check it and it seems that x86_64 is the only
architecture with these permissive checks. It seems that all other
architectures just write the new value without checking
the existing one.

Would you go this way and try to get patch into x86 code?
Should I do it in v5 or separately?

Best Regards,
Petr

PS: I would prefer to go with unless it causes regression
    and fix this "later". We could not endlessly delay
    fixes because of Sashiko finding pre-existing problems.

> >  			return ret;
> > +		}
> >  	}
> >  
> >  	return 0;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908120325.299649-1-pmladek@suse.com?part=4
