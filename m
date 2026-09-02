Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B374B4AC16C
	for <sashiko-reviews@lists.linux.dev>; Wed,  2 Sep 2026 19:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788375641; cv=none; b=DT2rmfxA/0OUMAQD8X5uyZWv3v7m085EGznM7CIIj0KPb2WSAcCNb9H6NG+RxRWxZihPzDsPXAqa4ZS9j3K5QREDy8LWBR/C8jaajn9wsb4C/dDQKOaaep+iOPKm0luEix3WPtdQNzlRoovms0so/M7aIZQsLkBlgCr9kK1vWGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788375641; c=relaxed/simple;
	bh=9+PtoNWtYvyeFwm3scPlfJtr20of9eAKhZzlkDiBk6g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mslk3Zy+SGhaW0IeJ7hDzrbAFSXbXy+vPoKFXKyjhz3HoTVRTKpXxpo9nkmc1rwhvsEchdFiDtq3t29lTFOA98m6bqVN7FNgA3wF1z+kEuQy7pJn2eZf5NLX/4QngDurKZ5V3OA0IG/Xsz/MDn9Sud1mwAjOVq/HvB2wNGzZWUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SDGz+fmS; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SDGz+fmS"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso1783779b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 02 Sep 2026 12:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788375628; x=1788980428; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bnqlH6sbBHV8BzHgW7BD+Nz3+m4Dg1ukrAP/BXotBg=;
        b=SDGz+fmSPcDfEuZNQ1X8qnKgJQRxID99DU1thWDMKKPzMGFlczo2OaoSQZvXyONBUi
         ofTAooXDnGmwZB7uz1wyjimtce723IJ5q3aPr1oXqNe9NsyDNX2VtFcy+jNthH5HhrXx
         tiPXMo82jT3tA99SOtyNYldj8OwKX99dT1W4tQQDRxC3hqdz7auvAIndtXcvh5TwA9QM
         DSFWfZ2c8r+maXMdZ1wr12Rl3wK0lwB+pIwIRBpzEhbt1RG/PDmqM5aYnMOzKLtH4YX4
         y45dAVYS/o1IJ4YQTjUrLWD0LhrlSXS4rDs7ToPiQpGaLWW2tyvxK3RjVqhP1+N8qHi5
         maQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788375628; x=1788980428;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bnqlH6sbBHV8BzHgW7BD+Nz3+m4Dg1ukrAP/BXotBg=;
        b=jz5Drb6r5094bfwelbgh1Tf3Yj3dJfl5lw17QIrVveUNY2+9uD1JfZd8K9mZb2juSn
         nRCbZeGWMdfQku+zmxjp7Pr12XdGvR5vtDdS+eoUg9xSe8OTC9b+yke3Ov23RobcUCiU
         3DtiwGtKynfx+xL0aCK8pvJWpTDg8OK7c7eWThhaCYT62EkrnI1apCuAP0lwfc90VJPg
         5LCUWfLs7aUweS+UMn8/0vCT2M/Ue7+GPCQmm89TWUPSslS+R8R8P2nxO2hXxe1ciTnj
         /tL3qZn9mpaVPpaLa9o549vlE9ovwc1RF1UDeRPYsYTq7zNxvZTuaEFvWVbJJpSfaxeq
         Xe1Q==
X-Gm-Message-State: AFuF++mKKYILF776zx3YRH5CzeggEm/LSAPj6wCp7O1LNQEcXHIRzk4S
	8S+L4WyvHxmB4mmpXJoHuBjawvihCqg4omil5/8q0LSarueTJb7+HeLV+3ZhGO4vxafrSuOWESv
	elThIUoaap/s68ODUiT5HLZ015/cnUF5nsM9K06Zngl3Bd+rpHs6gbcgCCWOdSuUIJ/iQR69wLC
	mTjK5ncuJWKn6b/EfMSCB3MgYk8x88zl47rUcTXsYaMm/ba1Ns
X-Received: from pfcp10.prod.google.com ([2002:a05:6a00:a24a:b0:84c:2e68:a493])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:409a:b0:84f:dfa8:57c5
 with SMTP id d2e1a72fcca58-85ed398aec5mr10724755b3a.13.1788375627681; Wed, 02
 Sep 2026 12:00:27 -0700 (PDT)
Date: Wed, 2 Sep 2026 12:00:27 -0700
In-Reply-To: <20260902183634.9E9711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260902182020.2615443-1-seanjc@google.com> <20260902182020.2615443-5-seanjc@google.com>
 <20260902183634.9E9711F000E9@smtp.kernel.org>
Message-ID: <aphySzgAce0I1Cox@google.com>
Subject: Re: [PATCH v2 4/4] KVM: guest_memfd: Drop superfluous WRITE_ONCE()
 when binding a memslot
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 02, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [Critical] Modifying the guest_memfd xarray outside of filemap_invalidate_lock on the error path causes a Use-After-Free and permanent MMU invalidation lockup.
> --
> 
> commit c377e9963148427885842d70319259945c649a8a
> Author: Sean Christopherson <seanjc@google.com>
> 
> KVM: guest_memfd: Drop superfluous WRITE_ONCE() when binding a memslot
> 
> Drop the superfluous WRITE_ONCE() when setting a memslot's guest_memfd file
> during initial binding, as the memslot *must* be inactive and unreachable.
> The superfluous WRITE_ONCE() was added by commit 67b43038ce14 to
> maintain rough "parity" with the existing rcu_assign_pointer().
> 
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index 2c8d8735de5fe..323159c9b5f34 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> > @@ -653,7 +653,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> >  	 * kvm_gmem_bind() must occur on a new memslot.  Because the memslot
> >  	 * is not visible yet, kvm_gmem_get_pfn() is guaranteed to see the file.
> >  	 */
> > -	WRITE_ONCE(slot->gmem.file, file);
> > +	slot->gmem.file = file;
> >  	slot->gmem.pgoff = start;
> >  	if (kvm_gmem_supports_mmap(inode))
> >  		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but modifying the xarray outside
> the filemap_invalidate_lock on the error path further down in this function
> appears to cause a use-after-free and a permanent MMU invalidation lockup.
> 
> If xa_store_range() encounters -ENOMEM during the store, it can abort and
> leave the slot partially inserted in the tree. kvm_gmem_bind() then explicitly
> drops filemap_invalidate_lock before executing its error path. 

LOL, I think I get the point...
