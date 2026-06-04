Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25FE1BD9C9
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780559601; cv=none; b=RPDid+OoTqf+WwwX/W9KB/rYeCDmGdBqiAph02+97pRIl2AUO5wQOUoyhq4pbHmHaHgbNN3O0+Q9BJnH/lj0YnYPOpru2dZig5JAwi+9LWpoaa6n8KCy7o3Oo9lZxu1SOAzbQYfkaCcfZOldpgRtnupnsx5U713SK+iheLqfacI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780559601; c=relaxed/simple;
	bh=31VrJerjYA7ej2yswOdHnob11vtUb2WMPqeUzEM6S1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=tyGUAuvutWWD+OrYTBZTRDMABjpVEbKJ73s2XwIErbFQTVWv+aRQnb4L5PfAAG2Sqh2MRs/2DOFkwHybEeLpPj4pUCx3GTrxZDPfgY7/3VXQHfpls1F1KRaD1+D0kodvVi/e3Lrn1NCoJP1zQvy95MmFGhu+uGQPnUoOnU6KyzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fGjpxLi/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fGjpxLi/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780559599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RAYTNOKtmgWbEWkc3IB5qxW7LGlwo108ofpVCkavs9M=;
	b=fGjpxLi/PVMecp7W/To/i2rT5WIY1RitZBcpRRhZyMkXZ14EMqVTn+4yz/EPzrN0TqwFSs
	LJUBnjbK3Fr877gPm5BwS1R67DyndJgxb+4PLvlb3Hwa6Ii1MxLpeft0KLiUJjzrmv71SZ
	LXQrI3geAKV63VLsLWA9EaKM5DnhUl0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-146-MHhkZZtyPi-cruSKb5QWew-1; Thu, 04 Jun 2026 03:53:14 -0400
X-MC-Unique: MHhkZZtyPi-cruSKb5QWew-1
X-Mimecast-MFC-AGG-ID: MHhkZZtyPi-cruSKb5QWew_1780559593
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490b61243easo4542475e9.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 00:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780559593; x=1781164393;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RAYTNOKtmgWbEWkc3IB5qxW7LGlwo108ofpVCkavs9M=;
        b=mhLgsj/zxLO+OqTZbS/Po5LnIUZ0B0mhfZF0FY1kDFZOmHU9lrvl9Hscb1FLWQTfco
         KIUPvZf5vLLk0gO/Av3WwnpWZ1ax+mL2NYi4jdBrSPNwngQJaOH5qMb/8ijDyvOYzA5U
         eE2vMRZHf7xDgO7a3TdrJbNoagMwTcDGgbZo20zx/8mGn569Hmo9O/+EZqui0ozzY5NM
         xc5J9k644k+tPnf+X5G85EpAW7/8ZIgxipuouqp4GaZKdkIwh7LFkCN04mIKMoH814N4
         EDbFjuSXmyUh7wf+h4kBuWX9tk+/GmJUZ3PjqLdJ2LNoPoMzkvEkell9o+BMGwP7+KpJ
         +JHA==
X-Gm-Message-State: AOJu0YzMPnPXkNjtQyv1swg1EgjQdZssW2OTLlwC77MNXK4t1ndfvtqI
	3DYTdPAPz4tGWm+IzFXHW3bzEJbdh21BuLbZF/0nepfTcrAc7PAje57yAMz/zaFTBf67pdA5ItZ
	T6EKjxH3FXHilyLeczSu1KpRv3htdsXEZk6xvlWMLwKannRE6FgaqAUAIFKcx3pa6iqpAOEXk7t
	VQ+c1pIImgKzzUjtf+/viiw5ISsgCKH14LkZwGnbESSr6GZ0s=
X-Gm-Gg: Acq92OHZ1zX6AxvrssVqimV7RiP5PETOKzcA8tCEt5nh8PIXgTWhBjaFMYrdH2j+LEy
	7XUPHfDe+wwUWwyZw7ynv19qWyhPuv5KDYXhsoWV8KB0K5NQUevtiacCzohAWcHfXpuKIluDlhY
	uv7XJtU3YUX3PmBcjZccGtVh0dj3n0HGomkDI3bqL8jNnhk0q2OUaULffcHw/bU0CbMy/2Z2aSP
	h25/JsmHaC959YsQ6i5tNeYxC+ORjLkDtwtGieLbhaSwWoT7vtiGEpls840u9n2J/BG6mr5Uxt7
	xEZV4Iuw4fER22M3S+yUyyqE0bazd6b+HLDT4nWe9VPYzWtqEyUYcc6+3Qp+oaZK/SVGoIdhfIE
	A01VOCgvw4O/3eFs2aIV+vFeerRd3PPSs90KOJOxwIujTp/YjvtaRtg==
X-Received: by 2002:a05:600c:34ca:b0:490:bb45:79f0 with SMTP id 5b1f17b1804b1-490bb457abdmr61057275e9.3.1780559593345;
        Thu, 04 Jun 2026 00:53:13 -0700 (PDT)
X-Received: by 2002:a05:600c:34ca:b0:490:bb45:79f0 with SMTP id 5b1f17b1804b1-490bb457abdmr61056505e9.3.1780559592722;
        Thu, 04 Jun 2026 00:53:12 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-25-45.inter.net.il. [80.230.25.45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c15cesm55238155e9.5.2026.06.04.00.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 00:53:12 -0700 (PDT)
Date: Thu, 4 Jun 2026 03:53:09 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH] KVM: guest_memfd: fix NUMA interleave index
 double-counting
Message-ID: <20260604034539-mutt-send-email-mst@kernel.org>
References: <0eff0a90667b900bee837d06b5db5025e1f304b5.1780501924.git.mst@redhat.com>
 <20260603161525.D9E241F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260603161525.D9E241F00893@smtp.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: wP339UwTWnEVj7Ljl2jddHINKJprCd1zrP4Ug-6l8uU_1780559593
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Jun 03, 2026 at 04:15:25PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] guest_memfd memory allocation ignores page offset for NUMA interleaving, falling back to the task's global interleave counter.
> --
> 
> commit ce4f65d7ee89d8194749cc615f30619f101248db
> Author: Michael S. Tsirkin <mst@redhat.com>
> 
> KVM: guest_memfd: fix NUMA interleave index double-counting
> 
> This commit fixes a bug where the NUMA interleave index was being
> double-counted by setting *ilx to the inode number instead of the full page
> offset in kvm_gmem_get_policy(). This allows get_vma_policy() to correctly
> add the page offset without duplicating it.
> 
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index bf9659a7b0f6d..65daef23c8390 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -438,11 +438,12 @@ static int kvm_gmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpo
> >  }
> >  
> >  static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
> > -					     unsigned long addr, pgoff_t *pgoff)
> > +					     unsigned long addr, pgoff_t *ilx)
> >  {
> >  	struct inode *inode = file_inode(vma->vm_file);
> > +	pgoff_t pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> >  
> > -	*pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
> > +	*ilx = inode->i_ino;
> >  
> >  	/*
> >  	 * Return the memory policy for this index, or NULL if none is set.
> > @@ -453,7 +454,7 @@ static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
> >  	 * can then replace NULL with the default memory policy instead of the
> >  	 * current task's memory policy.
> >  	 */
> > -	return mpol_shared_policy_lookup(&GMEM_I(inode)->policy, *pgoff);
> > +	return mpol_shared_policy_lookup(&GMEM_I(inode)->policy, pgoff);
> >  }
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does guest_memfd memory
> allocation ignore the page offset for NUMA interleaving and fall back to
> the task's global interleave counter instead?
> 
> While this patch fixes the index calculation for the policy lookup, it seems
> the index is completely dropped later during the actual memory allocation.
> 
> In virt/kvm/guest_memfd.c kvm_gmem_get_folio(), KVM calls into the generic
> filemap allocator:
> 
> folio = __filemap_get_folio_mpol(inode->i_mapping, index,
>                                  FGP_LOCK | FGP_CREAT,
>                                  mapping_gfp_mask(inode->i_mapping), policy);
> 
> But the generic allocator hardcodes NO_INTERLEAVE_INDEX in mm/filemap.c
> filemap_alloc_folio_noprof():
> 
> if (policy)
>     return folio_alloc_mpol_noprof(gfp, order, policy,
>                                    NO_INTERLEAVE_INDEX, numa_node_id());
> 
> For policies like MPOL_INTERLEAVE, using NO_INTERLEAVE_INDEX causes the
> allocation to use the faulting task's global il_prev counter rather than the
> file index-based deterministic interleaving.
> 
> Doesn't this defeat the purpose of the shared policy, causing interleaving
> to be randomized by the chronological order of vCPU page faults rather than
> deterministically spread based on the guest physical address?

Does not seem to be caused by this patch.
And I've no idea whether changing this will break anything
users rely on - might be prudent to have userspace opt-in,
if we are changing this?

At least kvm is the only user passing a non NULL policy, so
fixing filemap_alloc_folio_noprof should not break anyone else.
Anyway, I'll leave this one to the kvm maintainers.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/0eff0a90667b900bee837d06b5db5025e1f304b5.1780501924.git.mst@redhat.com?part=1

