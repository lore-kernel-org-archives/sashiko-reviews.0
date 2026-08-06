Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E986499F0E
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 22:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054363; cv=none; b=tKdB63/KlCXW0VZwNIIMVbiRJVAN14Fxua6U1LTUmt3q+W9Pg0sN1dcqIWzbES/3KPk7m5Me06jRRXBKRTJikkJeLuIodU5wvFjfZP4Oy1nmemXeIx59Ryqg9YqvZQTwMH2+zJuVFUm+nkpjW9zsFz24ademY3xnmp7Pu4jNusM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054363; c=relaxed/simple;
	bh=8sEymD7/iSSj0zqv1j4ytxb+UfXFkVV71wnKB9b9NYw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IdZC9mwYi7O9k4NsBbnd5R2pptOOz8ANMhqgCxAzFxxUGiGm4g4IoZjKYpp9cnfEjaFDuAUSk0hyCpf7MlkL4qYa3OC+aiDrgux0MUL3gzNWm3ng5RXI195rxTmzWyKGPaLy5z1Bf9G7y1r1qTQ7PNu3MDWCAAR1CCnMqnNT9R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tuVsHPJJ; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tuVsHPJJ"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84859a64079so4663436b3a.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 15:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786054362; x=1786659162; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IORhJ7SeI2tydBbG1Ara4ZQQzv+zNe3W2hPHM+KctrQ=;
        b=tuVsHPJJfzfzk9JtFPF9leXqFl3ybq+zQeUhZvV7xIRTP9aiWXRotlP20c773hGAW7
         VUOuU4O/ibqZcD2ESiYsPzQLScGYSp5L0eJUN3GSwRVlZZI4AA1Ys37wnM3zkZU5t6NZ
         u5tXGyY8m1xNxeiB38XpMM4uBl4TBGHdBpgrzIoSKUHh/oAkyMVIPbmGX8jsMj+DllRg
         2h8cKdVoQXqHA6Wh1UO8+FZ6o1YWCtrdThXtDgzqtec7SY0Yr9UZKeuaI+JFC7Jg9IG7
         t2kOJcA1x10ACOyPbPNBEFIn7UkmJR3fv147TSulCzENGg8K3NbrIplu5I3fIvbny+Vz
         QIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786054362; x=1786659162;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IORhJ7SeI2tydBbG1Ara4ZQQzv+zNe3W2hPHM+KctrQ=;
        b=poAWTrsf46ptlutRFcetgYJISjWkrHCAk3smJYdGYczPoP+S+eW1pv2neN4/zYke88
         fuRWZhtmhy2T0LEBcSGOnzmDWVn79JLutx3amyRH+YS+rm6C5xik/zn4y8mJyHxAyVnT
         WZZDpgU4OKvQW/X5d5BvzYH9DNqZS2jG7UzWe35NYiQfSG2xW9gxrUZ+eeGgb85nzQ8M
         fDSDnWjRfJuhORObm2CWCTj/nvcHZnvuWJ4FNZVVX289tJfBQEHluX3sqcKm/kiupzMq
         ipXSOB+OdGdlhgaJC/WiPl3a0rZ/wsbXFW54boAdgmpp2UWHm5Q9pQq+ml+zJbzrGHZ5
         xUyg==
X-Gm-Message-State: AOJu0YzLEL2Tcd74i4ilnkL4VAId7dB/Typ3XyeofmnSHINF7T0EzeTM
	dFjfy9DvvTjHxcxw8pw3JwlZXA+AIVnImZRTJWY0DxCGuM7mCKaBZjHTub1SZ9MY+cfBEAyzBiX
	BG52artT5Y+dPPG2lpCVS+SsD82Xvt4suuUOtlTWBoiCZ5BWR/oU+51xXQbpliqssiAt5+Kefp1
	7Cd5ZhPW7ttoq4foDPcyg8W7JYXINhtZCWEW8sPyiydcujcn0T
X-Received: from pfh25.prod.google.com ([2002:a05:6a00:12d9:b0:845:c4b8:9730])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:986:b0:848:2a71:a48a
 with SMTP id d2e1a72fcca58-84f2dfcfac1mr19558136b3a.13.1786054361372; Thu, 06
 Aug 2026 15:12:41 -0700 (PDT)
Date: Thu, 6 Aug 2026 15:12:40 -0700
In-Reply-To: <20260806215413.537841F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260806214050.78058-1-seanjc@google.com> <20260806214050.78058-5-seanjc@google.com>
 <20260806215413.537841F000E9@smtp.kernel.org>
Message-ID: <anUG2D2jrXatibSy@google.com>
Subject: Re: [PATCH 4/4] KVM: x86/mmu: Add sanity check to detect stale page
 faults in "map private PFN"
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Aug 06, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 379f570ef04f8..76e3cd717324b 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -5210,6 +5210,16 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> >  		 */
> >  		WARN_ON_ONCE(kvm_test_request(KVM_REQ_MMU_FREE_OBSOLETE_ROOTS, vcpu));
> >  
> > +		/*
> > +		 * Snapshot the invalidation sequence counter after acquiring
> > +		 * mmu_lock, as guest_memfd guarantees the validity of the pfn,
> > +		 * i.e. any concurrent invalidations are guaranteed to be
> > +		 * irrelevant.
> > +		 */
> > +		fault.mmu_seq = vcpu->kvm->mmu_invalidate_seq;
> 
> [Severity: High]
> Does capturing the invalidation sequence after acquiring mmu_lock violate
> the KVM MMU invalidation retry protocol order?

Yes, see the comment and changelog.

> The sequence is explicitly captured inside the mmu_lock critical section
> after the PFN has already been resolved by the caller. This bypasses the
> mandatory generation safety sequence (capture sequence, resolve PFN, acquire
> lock).
> 
> Additionally, could this still cause false positives since
> mmu_invalidate_retry_gfn() checks mmu_invalidate_in_progress?

Yes, it's possible, but it would require zappings GFNs on either side of the GFN
being mapped, such that the target GFN is contained by mmu_invalidate_range_{start,end}.
The odds of that happening in practice are low enough that I'm comfortable eating
false positives even though strictly speaking they _should_ be irrelevant.

> > +		if (is_page_fault_stale(vcpu, &fault))
> > +			continue;
> 
> [Severity: High]
> Does this continue statement inadvertently exit the loop without retrying?
> 
> In C, a continue statement within a do-while loop jumps to the while
> condition evaluation, not the beginning of the loop block. If r is not
> RET_PF_RETRY when this continue is hit, the condition r == RET_PF_RETRY
> will evaluate to false.
> 
> Will this cause the function to exit the loop prematurely and return -EIO?

Doh.  And this is why I'm more than happy to deal with Sashiko's paranoia :-)
