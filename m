Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDE7405C44
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 20:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780087469; cv=none; b=iJJVvYDgjD87KDFlou+HgdRm2WnEyBcO3JMky+pBqYpCIa8JoRP20Eb6kfnnLdiyIq/CtswpsFpcu2bA9IzLoSF8rEU0HmMnK7aqw+MhGg5vDkVBCtMsuDd5WJntq5HDlSif6/8xNB264oyCiw+akWjLYdeO/4fJKORVR51RIwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780087469; c=relaxed/simple;
	bh=X7ToM56irJtg2Jolki+zcIFTD4EePOgDnNseuPDjuBI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=taRGpDvEnaqyt+/u5tDsSPWD0vAQGxnjITYnUnlypIxqdekebaOni2eDx/5Si4SDBD0Nw3jRNvwkx0NOG21KRQixvZHxAml9Gxz8534UJzyM7L11YqQFghtIQBa4y0aHIY/fnBFz5/uACi8DP5Zbb2qJhMi4T75xDtkZRlAYdD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oQz36UhM; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oQz36UhM"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so3850915ad.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 13:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780087468; x=1780692268; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WQS7YMdO6nDpRo3dtOS7KCTUy9/WLmbNeezECkxyxIU=;
        b=oQz36UhMDxsDqyQacuWx3vjr7pywOZPyzxf7GqZNPHcKI9liPAifHxEet2zhp+xf1C
         YN0FvBLWB4VX52qpGMoFdaYHyVUkEIsLVOw1J1APkjm9dSHg8hkQaIpU6XRQECWeTcSi
         SVynibLXpaGf9ASrTMdTn023cR+wAh3RwDlN5WI0WJjr7ekonM1Y5wcfEL+hszbXSIxA
         8W5KpzvR4f3Zs9WKHWycilqnrLffk5gUTiUmGf3m1euo+TKZCVKULTVDhJE77srwtYkQ
         LcGvViW9u8J+ho2vxW8BeB2u70bztaqnQa6z9kII227vmyMP4YgW+Z+IO8b0hnAQ/UQw
         D+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780087468; x=1780692268;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WQS7YMdO6nDpRo3dtOS7KCTUy9/WLmbNeezECkxyxIU=;
        b=EPl5Jj6JkXj2w/X70yGrL0vyLy6SIFIXGyG3Q2vyiR0KpBMjvLurMuDhzq8ThQnjeC
         U21n6E1UbG4MhBtls8rOpPHLtwBFBqpZr1ya8ycfd8O6vOOzBRt1Ko2Zds/lpporrLva
         fR0Btx0d5/RkxBCL5MBVAK+kkno/OOefvyKS4DMqW2/qU05NTAae4eQ6y+0+tonvL75d
         IsKoT/60I19r+Xnp7JpAcG0G2cqHkPOB/0ZAy2Czu13s1bB1WFLIIxq3yLiGwtEkgRTl
         8Ak+LpEA+K/3+kbp2HGm9LVYP7ohIIaCbuG5syp1dXMecVXz/sT1KF1NPElPLYv7e/ts
         /3jA==
X-Gm-Message-State: AOJu0YyvpubVLNqKF1aSsvGDGaRp6Gor4xCy+AviSP+VhInqY5iorf18
	IrHAr9qlqApQlttPIra/hFcKCai8LuJ/hGMAzuqGBUPbv2RfmoR0AYRrqW5yPBTnrOQtaw6PIAj
	TXIriQQ==
X-Received: from plbmv7.prod.google.com ([2002:a17:903:b87:b0:2be:f9c0:8cd4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:986:b0:2b0:608d:d8a8
 with SMTP id d9443c01a7336-2bf36795211mr16688475ad.1.1780087467675; Fri, 29
 May 2026 13:44:27 -0700 (PDT)
Date: Fri, 29 May 2026 13:44:27 -0700
In-Reply-To: <CAEvNRgH21BoKT1mOQzgmKHKpDi4xbwtbMuenGv5U1ZUSENrJmg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260522-gmem-inplace-conversion-v7-16-2f0fae496530@google.com>
 <20260523010607.CCABC1F000E9@smtp.kernel.org> <CAEvNRgH21BoKT1mOQzgmKHKpDi4xbwtbMuenGv5U1ZUSENrJmg@mail.gmail.com>
Message-ID: <ahn6qysOGfa74A2E@google.com>
Subject: Re: [PATCH v7 16/42] KVM: guest_memfd: Determine invalidation filter
 from memory attributes
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, May 27, 2026, Ackerley Tng wrote:
> > In __kvm_gmem_invalidate_begin(), the code iterates over f->bindings using
> > xa_for_each_range(). The retrieved slot pointers are protected by the kvm
> > srcu, but the read lock doesn't appear to be held during the iteration:
> >
> > static void __kvm_gmem_invalidate_begin(...)
> > {
> > 	...
> > 	xa_for_each_range(&f->bindings, index, slot, start, end - 1) {
> > 		pgoff_t pgoff = slot->gmem.pgoff;
> > 	...
> >
> > When a memory slot is deleted, the code calls kvm_gmem_unbind() and
> > kfree(slot) after synchronize_srcu(&kvm->srcu). If the read lock isn't held,
> > could a concurrent memslot deletion free the slot while it is still being
> > accessed in this loop?
> >
> 
> The issue here is between __kvm_gmem_unbind() and
> __kvm_gmem_invalidate_begin(). Since f->bindings is protected by
> filemap_invalidate_lock(), I'm dividing the analysis into two cases
> where accessing slot through f->bindings with and without holding
> filemap_invalidate_lock().
> 
> ## Holding filemap_invalidate_lock()
> 
> If unbind happens before invalidate, we have
> 
>     filemap_invalidate_lock()
>     __kvm_gmem_unbind(), would have removed slot from f->bindings.
>     filemap_invalidate_unlock()
> 
>     After this, slot can be freed.
> 
>     filemap_invalidate_lock()
>     __kvm_gmem_invalidate_begin(), which iterates f->bindings and doesn't
>        see bound slot.
>     filemap_invalidate_unlock()
> 
> ## Not holding filemap_invalidate_lock()
> 
> In kvm_gmem_unbind(), __kvm_gmem_unbind() can be called without taking
> the filemap_invalidate_lock() if !file. The only places where NULL is
> written to slot->gmem.file is kvm_gmem_release() and __kvm_gmem_unbind()
> itself.
> 
> kvm_gmem_release() is prevented from racing with kvm_gmem_unbind() since
> kvm_gmem_release() holds slots_lock, so since kvm_gmem_unbind() is
> called while holding slots_lock, it should either see a guest_memfd
> memslot with a file or no slot at all? Perhaps I'm missing something
> about get_file_active().

The comments in the code pretty much say it all:

kvm_gmem_release():

	/*
	 * Prevent concurrent attempts to *unbind* a memslot.  This is the last
	 * reference to the file and thus no new bindings can be created, but
	 * dereferencing the slot for existing bindings needs to be protected
	 * against memslot updates, specifically so that unbind doesn't race
	 * and free the memslot (kvm_gmem_get_file() will return NULL).
	 *
	 * Since .release is called only when the reference count is zero,
	 * after which file_ref_get() and get_file_active() fail,
	 * kvm_gmem_get_pfn() cannot be using the file concurrently.
	 * file_ref_put() provides a full barrier, and get_file_active() the
	 * matching acquire barrier.
	 */

kvm_gmem_unbind():

	/*
	 * However, if the file is _being_ closed, then the bindings need to be
	 * removed as kvm_gmem_release() might not run until after the memslot
	 * is freed.  Note, modifying the bindings is safe even though the file
	 * is dying as kvm_gmem_release() nullifies slot->gmem.file under
	 * slots_lock, and only puts its reference to KVM after destroying all
	 * bindings.  I.e. reaching this point means kvm_gmem_release() hasn't
	 * yet destroyed the bindings or freed the gmem_file, and can't do so
	 * until the caller drops slots_lock.
	 */

On a related topic, I posted a patch a while back to clarify exactly why the
release() code is safe.  I need to get back to that, but in the meantime, more
eyeballs would be appreciated.

https://lore.kernel.org/all/20251113232229.1698886-1-seanjc@google.com

> Would like Sean to check my understanding.

You're not missing anything, Sashiko struggles with scenarios where thing X
makes thing Y impossible.
