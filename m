Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31DE4C4F54
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769470; cv=none; b=Da75+3HaMs9vUj6AblrEBR0DXoqiXregb2CmXGNxFjIdiSSMZUdba1dhHdMUCG8nsvn5ZfUbsdazQVWPWCO1oQhpGpjoXY8ipGZTYB3Zy5SotyleIv5GHpB10xpxqHyV5JJ5MCt3vBNt5FuYn8nEWAM413nk9KZJTlPk8NOT9p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769470; c=relaxed/simple;
	bh=CAVBgcBSjW/E6JpsXJ34gXjufEeT8u5msVH9erxG4Os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aqE2vYXhTjfoXMw5aIL7r6bEOTfxCiE90pXAGRM+kAujAmF7uFlDBzGxB4Z2Zlnd4qz2oAQbT+dL+am72Mj9CeRZ2glMMJ9oxiH/498QT8JvCh7in3UpB0luM8tfHFLlNbm/v8XE7l2bCojxVNXAeaDdGDXV/p8N9I2cBWW6RWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRnAU4fw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRnAU4fw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ABA41F000FF;
	Wed, 30 Sep 2026 11:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790769469;
	bh=vGBAJuP5zfhwRUsF2MWgpAG7yyMLggjg5vtTzCRNLQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LRnAU4fw9Fee7KwslHH2vIBPMeu4wlDITnqkzEPya8UcFOCYiQQLbw6hvmZVR/OWq
	 Gj4rCRdlAWaNrB718r0b8BUXf5gFDprV3ajwLyfeSO6NFg0Ceg9yqNKvDa/+COo4Ju
	 G12NDgGK1X56Y6oPiG4QrHGz3A5/IoJ8GJ4uGMcXkY4ZQNDPmMDWYJBJjfUDeomvtQ
	 yzQEziYsk3rWXTu4KFLn6HbRap/VYKRLhogpgl+CL5RglvoofpDZ5CwzgMErQx3jiO
	 SU1mwSvMWwOxPOo2JqezLIQ4Bk6LxBbXZJmb3w8Vz7KEDwVCzvmlP+cphzaMxYevFk
	 IHDXvx8nhEL8w==
Date: Wed, 30 Sep 2026 12:58:20 +0100
From: Jean-Philippe Brucker <jpb@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Ryan Roberts <ryan.roberts@arm.com>, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH v1 8/8] misc/arm-cla: Add userspace interface
Message-ID: <20260930115820.GH480985@myrica>
References: <20260717104759.123203-1-ryan.roberts@arm.com>
 <20260717104759.123203-9-ryan.roberts@arm.com>
 <20260717111016.4B15D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717111016.4B15D1F000E9@smtp.kernel.org>

On Fri, Jul 17, 2026 at 11:10:15AM +0000, sashiko-bot@kernel.org wrote:
> > +static void cla_vma_open(struct vm_area_struct *vma)
> > +{
> > +	/*
> > +	 * A vma previously created with cla_file_mmap() has been duplicated
> > +	 * within the same mm (most likely due to mremap). While this could also
> > +	 * be called for duplication into a new mm (via fork), we set
> > +	 * VM_DONTCOPY on the original mmap, so this will never happen. So the
> > +	 * contexts covered by this new vma already exist.
> > +	 */
> > +	struct cla_domain *domain;
> > +
> > +	cla_for_each_mapped_domain(vma, domain)
> > +		cla_ctx_map(domain, vma->vm_mm, vma->vm_file);
> 
> [Severity: High]
> Does this code need to check the return value of cla_ctx_map()?
> 
> If a VMA is duplicated (e.g., via mremap with MREMAP_MAYMOVE) and the
> domain is in a broken state, cla_ctx_map() will return ERR_PTR(-EIO)
> without incrementing the context refcount.
> 
> Because cla_vma_open() silently ignores this error, the refcount remains
> unbalanced. When the old VMA is subsequently closed, cla_ctx_unmap() drops
> the refcount to zero and frees the context.

I think it wouldn't hurt to move the domain->broken check after
cla_domain_lookup_ctx()


> > +static vm_fault_t cla_vma_fault(struct vm_fault *vmf)
> > +{
> > +	struct vm_area_struct *vma = vmf->vma;
> > +	struct cla_domain *domain;
> > +	struct cla_dev *dev;
> > +	struct cla_ctx *ctx;
> > +	unsigned long pg;
> > +
> > +	/*
> > +	 * Reassignment needs mmap_lock, so we cannot wait while holding it.
> > +	 * Luckily, this flag is only missing in some exotic cases which do not
> > +	 * apply for this VM_IO | VM_PFNMAP vma. i.e. GUP without
> > +	 * FOLL_UNLOCKABLE or FOLL_NOWAIT or fixup_user_fault(unlocked=NULL),
> > +	 * used by futex fault-in path.
> > +	 */
> > +	if (WARN_ON(!(vmf->flags & FAULT_FLAG_ALLOW_RETRY)))
> > +		return VM_FAULT_SIGBUS;
> 
> [Severity: High]
> Is it safe to unconditionally assume FAULT_FLAG_ALLOW_RETRY is set here?

I'll have a look myself at some point, but the experts say it is fine.


> Under the per-VMA lock fault path (which is the default for modern kernels),
> FAULT_FLAG_VMA_LOCK is set but FAULT_FLAG_ALLOW_RETRY is explicitly absent.
> 
> Consequently, any normal page fault handled under the VMA lock will hit this
> branch, returning VM_FAULT_SIGBUS and breaking normal memory access.
> 
> Additionally, because this is user-controllable, could the WARN_ON allow an
> unprivileged local attacker to spam the kernel log or crash the system if
> panic_on_warn is enabled?
