Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C724FC346
	for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 21:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790026061; cv=none; b=DSOZ0k/boXLfrSMBjUHkBJ+yG917lVeTuz2RgKljNlXuHSmJwuIF7L+JRiouxHNcAHFVDU2DjA8yXb+oUkpYfiWHiuPxGOj3Z61M6MmShEmqg6Tv1j6+dlEHd1N+3lfEs54aq+D+hP1jCswRpbhfW/XGRZ+byAh49yGIltp4KCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790026061; c=relaxed/simple;
	bh=fo8XdEe5FSjrfsUHQCe4iJ/9r57GZB37hHQK3O7IOQA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UPam3RVP/kWJj4yY2PIS8o/QwHyMin8BCdVUxl31M6/HAihS2ajdxoMKaqWXUOb1mKdTyXneYsbqGbxSD6xSFqB1QhcTp6TyKW16WiFl20LR+Oj26UKh2V28CL3VLW+ZDe6XC1KxTYNmphFAGnpODdrrOIYsW8t7NOkCSsdajXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T3hKd9C/; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T3hKd9C/"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dc92350888so61497425ad.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 14:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790026060; x=1790630860; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=imbcA+h5CSacGkPDqFjCLKSXoDxa8F5RkkDF7GogBlU=;
        b=T3hKd9C/uuyHNWvm+A/74uWn5Et7Rt1aRmolE3rlsd9VwMeJS4CU2/KCjRjea12mo7
         pEspTcDiOYEwSWtw4inl92YhbYpD3DlJ5HGYz4g7XLcyt4TthufGzUJuM5kbw5wOJruv
         dl6rLaDpcL2aevfcqNkkV0hSpoUAn+g8H8t324w888PFGE/oTzvL7UQLzBB/E/uZ/SNW
         v43OeNuxI8iPo65t1CAfM5jCHbiG7PKPj1W7WSpSv5uBFpcPAZ6m4QiyIOONyqvP2xuO
         6Mmf9uWB3jnP/EHGNFv9xoF1qBHoVOzaKxEl1I0HfzknW53eczqVS2SL1D9uyGkAywji
         gmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790026060; x=1790630860;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=imbcA+h5CSacGkPDqFjCLKSXoDxa8F5RkkDF7GogBlU=;
        b=pmfFwff60b2rt0Adr1yUG5ExSyRwCtBIfgPqSFgbhUWjf/c7aW4wrqTk1Rg7SP8YP4
         QAXwzGmf+v6Mqf301PT6L39Bo65ahsd2WNI3mE416lGpK3ahHEWhR2VilCc9Z5Vg67y/
         Xcx/eHqGEHmMKWWK/5cvyt1nf8Uf9KXMOD868flU8f9wW2IXXwLC5m0saYssseluU3w2
         aogbmKS0w+CEe29eeVTh1/DPC4kcOm63CO5XpiZql24hWcPVNYezEIuD2B8T4v+krPhb
         SsbLoYaI4aMC5Zw9OQyeRimox2/FR1C88YAgETaKHnGcFIKcosktEddpWSAbeq2+gzkX
         Em4g==
X-Gm-Message-State: AFuF++nRjfsdN1IG4wEIKL2dOTX7rWjR8BYSjaBiXVvTE2fJZ3ztuJ2U
	Fc94Nfe6m9bffiZpF+HxS75ROb4i8oRs5asZ80U7BJrUKLK3QRu+o7QbkxRi+0o0uYVTnGQp2FZ
	ri7o0ZF+6v1fgIpgs1wuqvceVjEVFVknOVH7IfP4s0FMyJcNQJU9Sl1pbasJbV3gp8bcOslgken
	/8pR+7f0qYQ60e3EDGiXhuL90a5KzIumJmOggmMZBt+9I3Bup9
X-Received: from pldu3.prod.google.com ([2002:a17:903:1083:b0:2dd:7e95:7c98])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c947:b0:2dd:ad73:c93a
 with SMTP id d9443c01a7336-2ddb1bca6e2mr171876505ad.27.1790026059668; Mon, 21
 Sep 2026 14:27:39 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:27:38 -0700
In-Reply-To: <20260921211941.5E8A91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260921210616.1024168-1-seanjc@google.com> <20260921210616.1024168-5-seanjc@google.com>
 <20260921211941.5E8A91F000FF@smtp.kernel.org>
Message-ID: <arGhSlb-q8RkDiCO@google.com>
Subject: Re: [PATCH v4 4/5] KVM: guest_memfd: Establish memslot<=>guest_memfd
 bindings *after* memslot is ready
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Sep 21, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> [ ... ]
> > @@ -1944,6 +1945,15 @@ static int kvm_set_memslot(struct kvm *kvm,
> >  	r = kvm_prepare_memory_region(kvm, old, new, change);
> >  	if (r)
> >  		goto err;
> >  
> > +	if (change == KVM_MR_CREATE && (new->flags & KVM_MEM_GUEST_MEMFD)) {
> > +		r = kvm_gmem_bind(kvm, new, gmem_fd, gmem_offset);
> 
> [Severity: High]
> Does this new initialization order break guest_memfd creation on arm64?
> 
> By moving the kvm_gmem_bind() call to execute after kvm_prepare_memory_region(),
> the KVM_MEMSLOT_GMEM_ONLY flag is not populated in time for the architecture
> specific hooks.
> 
> In virt/kvm/guest_memfd.c:kvm_gmem_bind(), the flag is assigned:
> 
>     if (kvm_gmem_supports_mmap(inode))
>         slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
> 
> Because kvm_prepare_memory_region() now runs before this assignment, the
> architecture hook in arch/arm64/kvm/mmu.c:kvm_arch_prepare_memory_region()
> evaluates the flag before it is set:
> 
>     if (kvm_slot_has_gmem(new) && !kvm_memslot_is_gmem_only(new))
>         return -EINVAL;

Argh, all that time spent trying to avoid adding a "prepare" phase to gmem, only
for it to be all for naught.
