Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C134B2F7EFC
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 17:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790183781; cv=none; b=WRRVSVr5l2DHiUbdzvj15GZIlmfhwqI/95VnK19cbFXNbYgPa8MevmvmC0F/L8ewM6CCETc0SKtAYM9ZEvqo1JU0P3ycGieCZINiGcUOMYyXLAG3Ny5IFy2c35FFreDG+9BeNDAplFSBBn/idmtxvICmuCCOO3DCr0lEJsqVDqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790183781; c=relaxed/simple;
	bh=+mtnjfAbkq9mykGV+znG/NBgx6xv4b0+pBRp2Ssr818=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=at1k8bAdXhCN8Y3ZFis1PmY3ZSkING9h8F34oaprJlcPQ8QlbyivsBDylKO4TDTKAO90i6XxBCveLYWuZsZLG5E//ri3jOAICo/YL95MF2L6idlt4ju+6ojIMURYBXoyFjMDYATGfJrGCy2ZWkp5ozOlojhjhhMhsaG3OjmDgmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SNdHJWY/; arc=none smtp.client-ip=209.85.216.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SNdHJWY/"
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so798738a91.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790183773; x=1790788573; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qd7c8sCPSTVG4sj8Jdv+Q7gffaqRcr+/MUM/BeQpcX4=;
        b=SNdHJWY/O+9IiqjqXVIx8j2zdduXMcIKmvrp/CnxKtE06CAGQu8RO3P0QVre+V9Azh
         /JntftGDNdCgBrmMrik7TaSwKAGVkWSyXMp+UMqh38lgXc/2FONnsza9Dvii8KqSfS3t
         PCDyO+s/2KhZwDaX8sX0qPpU6bYZrvFmNyw06IeRRI/Fb/LNQ22noUj3ehr/ZL8CX2iO
         72FCFuBSYPFjO0EBGPNVTUbtJeYEImQYzcpTRfNe2Hdapnixt/J0lZajnbN89B7lsnAh
         O9QNyTAySE09DXRNcL6aPwMe95edc6NSqVA1lHNkoOOvZTsRAmJ4FKr5lnhO3u1FTqwv
         tAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790183773; x=1790788573;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qd7c8sCPSTVG4sj8Jdv+Q7gffaqRcr+/MUM/BeQpcX4=;
        b=ygndD1EtcwtPut0B9pBVH+yuzw6ldjd8VU565ubEbnh1vcLNC43cJW2ToiNqZk6xvE
         bKChIW9LZCQuBrr2v53ZElcZjzXymX2ggJQDqE9XCS/TBF7nJhFxZmE5MfsSeZhIQR3o
         Mk7Gmra+lxxoyIawJYzrQxcJE0rMtvFC95InyD2KWrWDfU4YTRLEWotgsz2fJYRv3heU
         /Y5KCSr3Z2q2ICJ5VJWVLKu6XhdrZ9RP7aVXZYu0/GY2pn1VACLLVaPFdGRy8i6C456j
         lnBihocEA86tALJv87ffyEkNiCBxc858g6t4XjGZI6j81N1VeCXjWMFGbr0KbbJB0G7+
         5m0Q==
X-Gm-Message-State: AFuF++kRTInW+EWQKTe8Q/nj42kAGzT5bOml0PclMvXA3GCF6WYE5O9P
	32JXCoTpP1E+WLDdokUlbdzCBU6kgdryz80DxnSTiDjebHWo/oum0Ioy8/IpEUWLuDWivzUIPpu
	KvyjNbbHmOA6s/SJUNJmXnzyHTq126pD+eu5QYlyIQVnKQQA1TlfxAUC1D6J+Rdb5LvRoPZ/WA3
	jErc0/q7cFAKhNJbg0lJyUOVWKsvW3kIuWCMMfKptGKggstz7u
X-Received: from pjbor4.prod.google.com ([2002:a17:90b:39a4:b0:39e:1d3:781d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:588e:b0:39e:6a81:5a98
 with SMTP id 98e67ed59e1d1-3a07e71658dmr2816595a91.44.1790183772462; Wed, 23
 Sep 2026 10:16:12 -0700 (PDT)
Date: Wed, 23 Sep 2026 10:16:11 -0700
In-Reply-To: <20260923165304.1662E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260923163721.1584779-1-seanjc@google.com> <20260923163721.1584779-3-seanjc@google.com>
 <20260923165304.1662E1F000FF@smtp.kernel.org>
Message-ID: <arQJW6bs7RRjLJFv@google.com>
Subject: Re: [PATCH 2/2] KVM: SEV: Do cache maintenance on the source VM
 during intra-host migration
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 23, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Critical] kvm: sev: TOCTOU race in sev_migrate_from causes host memory corruption
> --
> 
> commit b97586a7411bd5d8a55967b35859f6e485f10868
> Author: Sean Christopherson <seanjc@google.com>
> 
> KVM: SEV: Do cache maintenance on the source VM during intra-host migration
> 
> This commit manually performs cache maintenance on the source VM during
> intra-host migration. Since the source VM is converted to a non-SEV VM,
> automatic memory reclaim flows will not trigger the required cache
> maintenance, potentially leaving stale data in the CPU caches.
> 
> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index c9242c936a401..71923cb72d1d1 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> > @@ -2048,6 +2048,12 @@ static void sev_migrate_from(struct kvm *dst_kvm, struct kvm *src_kvm)
> >  	src->pages_locked = 0;
> >  	src->es_active = false;
> >  
> > +	/*
> > +	 * Do cache maintenance on the source VM as it is no longer an SEV VM,
> > +	 * i.e. memory reclaim flows won't trigger cache maintenance on the VM.
> > +	 */
> > +	sev_writeback_caches(src_kvm);
> 
> [Severity: Critical]
> Is there a race condition here if memory is reclaimed concurrently?
> 
> If a userspace process or kernel reclaim triggers a memory unmap (for
> example, via MADV_DONTNEED) concurrently with the KVM ioctl, it could happen
> in the window between setting src->active to false and calling
> sev_writeback_caches():
> 
> CPU1 in sev_migrate_from():
>     src->active = false;
> 
> CPU2 running concurrent unmap:
>     Since active is false, the automatic cache flush in
>     sev_guest_memory_reclaimed is skipped.
>     The host frees and reallocates the page.
> 
> CPU1 in sev_migrate_from():
>     sev_writeback_caches(src_kvm);
>     Executes a hardware cache flush (wbnoinvd), which writes the guest's old
>     dirty ciphertext over the new page owner's data.
> 
> Because sev_migrate_from runs without mmap_lock or mmu_lock, MMU notifiers
> can run concurrently. Can this cause host memory corruption by overwriting
> newly allocated host pages with stale ciphertext?

Oof, yeah.  It's a tiny window, but also trivial to fix and document.
