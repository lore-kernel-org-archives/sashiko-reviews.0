Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008093;
	b=V0brvrJKru6cC0qgAm6oK1PMV+SkBuDU7rMWt+yij+NUPLoCVlKcw0yvvby07T4fiTgo
	 VJ616N5gMUj9mmuF8NW9lG3J6yJZXdCC+BuO7Vz6oLDoiGkVmlwD/phAdFibWRdy8p6zA
	 kiXMasVDkVTSpZZmPxSxdk1oqvLeffUt1dTC62zD+ogEnaN21NW4VQYfHuYk1V7bcK4bT
	 RJwX3We4TrXgZnrdhiTDKf9LY6tiNlVQidLrPLTqFRVaryslCfd0Foh878LaxvXvG2uoQ
	 oz23MzNrddvNNXHOkhTjmdfDZvZAdgeqTu6aJTCtfTHXui/L17lgzgWM5epXhLPJIeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008093;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SfTZx8Jp3mL9/A9ePS6oiHF2jXSQx2p5MBCiDx+x+i4=;
	b=bhaGfSc1P21N7BXMONXNEKbsnYW494CKqxXr6s7/mIrQlG1FgKPMTFDJWlfytxuJ1Z56
	 R4KtnyKmEnnfdRj9Gi2si3o6z9VEQgymFpUDFSMCYyZfx9CNtU6cID6jgXh0EAZWW6ZX2
	 kaVYLdeDZj+6m67QDlidGYlAJFyogeK0jYLd9NNRt0iIa+mhM44F1WVzNvlnXlyhxapzv
	 KluOUrhNEKNzuW/3CyHLpg9U2cgNFEVbvfk7/MFv8HprF97ZIEqfeVCM7WDZg2tdityAq
	 /pdaITNVC30/x6ek9H7i7kNeh4wlqRpmrO6jz0efuGGdprJ3oM/Ejfo+yP6YLdQinOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYdHWF1l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A1D60A2605;
	Mon, 26 Oct 2026 09:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oYdHWF1l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CED831F01828;
	Mon, 26 Oct 2026 09:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793008093;
	bh=SfTZx8Jp3mL9/A9ePS6oiHF2jXSQx2p5MBCiDx+x+i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oYdHWF1l6Nl9PX9l4oZFhEmilpFs/+8lVaSaN/gEhAO+kjxaNvR9+/9SZd5CrPOaz
	 sZy8pV4wZSgJFHUMaMWO5fbsJDzsmxtOJu/ovl1j/E9preuKa8wU4obawgy3UQ5Ksj
	 qOneI3SnDbPKahn+XZV/bTFPWZabJzM6fSq6J0KYy7yOWiIeFzIRiWJdqH1rof+2wC
	 zQjSgEzKAR7sXtW4U4DBxlHOKC8qO6/p5O+psF+i5yo1XoN1oCNIHNtI2bvsQ9Ky58
	 Ywny02B+XA7B7mSHiUchbyiqOFf8SC1vU3pCu2FPNJTlgGfSdBII/K8yD+gZF8yctB
	 y86rvakIBiOxg==
Date: Mon, 26 Oct 2026 09:48:08 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kazuki Hanai <hnkz.64@gmail.com>, 
	Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, linux-mm@kvack.org, 
	David Carlier <devnexen@gmail.com>
Subject: Re: [PATCH] ALSA: us122l: mark hwdep mappings VM_MIXEDMAP
Message-ID: <at8hwlpXJlJjZQso@gremlin>
References: <20261023-fix-us122l-mixedmap-v1-1-e7bdd053850f@kernel.org>
 <sashiko-outbox-183642@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-183642@kernel.org>

On Sat, Oct 24, 2026 at 10:21:59AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] ALSA: us122l: VM_MIXEDMAP in usb_stream_hwdep_mmap() breaks mremap()
> --
>
> commit c40f3445d293957b8d56aca33b8d5ed4071fcf4b
> Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
> ALSA: us122l: mark hwdep mappings VM_MIXEDMAP
>
> This commit sets VM_MIXEDMAP in usb_stream_hwdep_mmap() so that clearing
> VM_MAYWRITE on read mappings satisfies the core mm requirement that
> mappings clearing VMA_MAYWRITE_BIT must not be mm-managed.
>
> > diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
> > index a5db0d044ef96..2986a90ea3351 100644
> > --- a/sound/usb/usx2y/us122l.c
> > +++ b/sound/usb/usx2y/us122l.c
> > @@ -193,7 +193,7 @@ static int usb_stream_hwdep_mmap(struct snd_hwdep *hw,
> >  	}
> >
> >  	area->vm_ops = &usb_stream_hwdep_vm_ops;
> > -	vm_flags_set(area, VM_DONTDUMP);
> > +	vm_flags_set(area, VM_MIXEDMAP | VM_DONTDUMP);
> >  	if (!read)
> >  		vm_flags_set(area, VM_DONTEXPAND);
>
> [Severity: High]
> Does setting VM_MIXEDMAP here cause a regression when userspace expands
> the read mapping with mremap()?
>
> In sound/usb/usx2y/us122l.c:usb_stream_hwdep_mmap(), VM_DONTEXPAND is
> intentionally omitted when read is true so that userspace (such as the
> alsa-plugins pcm_usb_stream plugin) can initially mmap() the first page to
> read s->read_size and then expand the read VMA to s->read_size via
> mremap().
>
> When userspace calls mremap() to expand this VMA and the virtual address
> range following the VMA is unmapped, do_mremap() -> mremap_at() ->
> expand_vma() takes the in-place expansion path in mm/mremap.c:
>
> mm/mremap.c:expand_vma() {
> 	if (vrm_can_expand_in_place(vrm)) {
> 		err = expand_vma_in_place(vrm);
> 		if (err)
> 			return err;
>
> 		/* OK we're done! */
> 		return vrm->addr;
> 	}
> }
>
> expand_vma_in_place() then calls vma_merge_extend():
>
> mm/mremap.c:expand_vma_in_place() {
> 	vma = vma_merge_extend(&vmi, vma, vrm->delta);
> 	if (!vma) {
> 		vrm_uncharge(vrm);
> 		return -ENOMEM;
> 	}
> }
>
> However, vma_merge_extend() -> vma_merge_new_range() in mm/vma.c checks
> whether the VMA flags allow merging:
>
> mm/vma.c:vma_merge_new_range() {
> 	if (!vma_flags_can_merge(&vmg->vma_flags))
> 		return NULL;
> }
>
> And vma_flags_can_merge() -> vma_flags_is_mm_backed() ->
> vma_flags_is_mm_managed() in include/linux/mm.h rejects VMAs with
> VMA_MIXEDMAP_BIT set:
>
> include/linux/mm.h:vma_flags_is_mm_managed() {
> 	return !vma_flags_test_any(flags, VMA_PFNMAP_BIT, VMA_MIXEDMAP_BIT);
> }
>
> With VM_MIXEDMAP set on the read VMA, won't vma_merge_extend() return NULL
> and cause expand_vma_in_place() to fail the mremap() call with -ENOMEM?

This describes a bug that I recently sent a fix for.

--
Cheers, Lorenzo
