Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2E437DEAA
	for <sashiko-reviews@lists.linux.dev>; Fri,  5 Jun 2026 18:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780683277; cv=none; b=ZOy0pAXUR4daIlsMP3VLGkL/T9awxmhH+2+/fYiIvqF1Yr3rqcPo7TtFPz6l/4iJ2XsSZqTiPsdJvtnUwO7G2F+xTtXMsJMH1A9LHWWS1Fjs+RuvKDtp6+BtXGgQcibrJgiLQaY4hrpkLGG7EFDkIYu7pCUMCKDDW45jeLNaShw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780683277; c=relaxed/simple;
	bh=xxvtzaNKnyLrHob8HID9MbR/obHYgCNgsxkSJATtNWk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ajpaxLc2G32y43FIbAZ3/LEuMJBnk3Bj9hQ6WA+WXZIqKrfzgYq+M9D9uBA6tR4ro4N3cgw278pBxEeVZdABaWqccJHA0EfR/ns3pNn++lQcDqKynDOY3ggQBXe1Io4Qn36r6VRbnIF1gvQTYwf7NZYmMWKgSWZrQFTu35WKTMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iJvQEfcA; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iJvQEfcA"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c85a2f19558so1411475a12.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 05 Jun 2026 11:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780683276; x=1781288076; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DjJ7de1MemmKpp/4CANs5HHA++5sJk2rNlJjP4akQbk=;
        b=iJvQEfcAct0psGDJHkY3LKlIEE6xD0rZHdqcv4KxIigCNqyEliktkLPvNkkiztVTfw
         0cbKjnskSxHxR/YI4tFqDQS7HSQhnZvfnHJ4Fvrmy58IUQPX4tve+sC++wgWWD8TMdel
         YjMiHLD0V5TFZ9voWOziqFTOWi7vTYxKTzy1aN0mYJfcJ1mmaIO51qqkzQM86JzDPp3q
         1KM1mDDapdonZNCiGnyPTQwiVdCsKtVEypc4kcwMrrAzdateATUcL2xLbkK+sTPEoCjv
         Zsi1GgtcWxCD/dkBT3cIn/gg8WTsi1blC37nVvPGAX6ACM6Kgutmv/K7h2o1XLWnzunk
         neTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780683276; x=1781288076;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DjJ7de1MemmKpp/4CANs5HHA++5sJk2rNlJjP4akQbk=;
        b=h50qYIKWqhMPxAgkZQWrrUKBcSYEw8Z2HOupdQL0WHw4w+mTe1nDlPJE51HTz9SHFy
         7SnNSyx+/GIIfan5d9mCY9Jw+dWnLXGm9Ma692PMrGZer8wPTzutNjCIpmBp0tvjQ0/B
         71KSWDP3aTAth/8upjeenlqGXSxa+mSl9ckf59aerGKyJnGitUo+ICF3YuuvQmFZmW/9
         OJHiYwhjZbgnR71gzBgtnsyyjRg/tgNDGxxl7Q3qMymHK3i67jhWxBRqAQTb4pV07Ysl
         lCjKTgo9LmqnxQUhuDxfKOyxZAEOjDG2Zh3lqTFC23gryYG4Ul6t6TXRzEERoFLBiZcu
         lbYQ==
X-Gm-Message-State: AOJu0Yy73HBPH8gutcSyoyX4QTDTuRwD+hfcZYfR4mXSwHBsPtpZgVut
	QhcIO0OsFbk5fKfpqIJVVSfQbexu2fA/dfXKhUJNlG8jir1HQLiYXYGnYNBAHxhKHQj7jwTDXo8
	JuvG30l+1EuWENivISWjNQnfE/UmmhiW3XJMHuLiKfCixcITVjcps/8myNIgVVbj8zAvFipgV1H
	kUm3PyAqmfirjEdFNn4m/p6+4WTKAu17hQBJx+CsAXcsmqojHV
X-Received: from pgac28.prod.google.com ([2002:a05:6a02:295c:b0:c85:9a33:baf4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1609:b0:39b:d5f1:4ff
 with SMTP id adf61e73a8af0-3b4ccdc2fafmr6024851637.20.1780683275729; Fri, 05
 Jun 2026 11:14:35 -0700 (PDT)
Date: Fri, 5 Jun 2026 11:14:35 -0700
In-Reply-To: <20260605180617.5B4B01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260605174611.2222504-3-seanjc@google.com> <20260605180617.5B4B01F00893@smtp.kernel.org>
Message-ID: <aiMSC-EPsCstfZrz@google.com>
Subject: Re: [PATCH 2/2] KVM: x86/mmu: Expose number of shadow MMU shadow
 pages as a stat
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jun 05, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> > index 3886b536c8a57..be84e4d2405e0 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1701,6 +1701,7 @@ struct kvm_vm_stat {
> >  	u64 mmu_recycled;
> >  	u64 mmu_cache_miss;
> >  	u64 mmu_unsync;
> > +	u64 mmu_shadow_pages;
> >  	union {
> >  		struct {
> >  			atomic64_t pages_4k;
> 
> [Severity: Low]
> Should n_used_mmu_pages be removed from struct kvm_arch in this file?
> 
> Since all usages of kvm->arch.n_used_mmu_pages are replaced by
> kvm->stat.mmu_shadow_pages in this patch, it appears the original
> declaration is left behind as unused dead code:
> 
> arch/x86/include/asm/kvm_host.h:
> struct kvm_arch {
> 	unsigned long n_used_mmu_pages;
> 	...
> }

/facepalm
