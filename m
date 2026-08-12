Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC71379EC4
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 19:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563557; cv=none; b=rbxq8W7Xj1bQpPZIFkCUyjd+N79aH1Ezh0YkhxyYA8qeN+ed2OgyKfaRnhnIDN1IB3uq/ldvRqhoD+zlLbDMGuCnUDyp1YwLni/UcdvJzymoJxTqdiwd1aoh2EtlGAWOWBUHnDXAI2tymmWBm7LCHPqA37haK6uPWZVqkikHblI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563557; c=relaxed/simple;
	bh=Jxlbn2kEWy8HeStc6KfR7KYADvRNrzF0gC1nZSpv45U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=j/j8PKLLBnvv+0w6uAS8JZ7fVYoWhsMVkO8iMCLx+tUkKtHtHyCD5qH/0Iv+y490LO3R8H+KKT9OmrMnBuhI53dJD01/NWmcs6y7xqUynMSeagguDrdyddHX/AR2siB0rQVDvJo4s1+EfK9426yir9nScuj9an/eMACMiZnUWIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=syXNCe4y; arc=none smtp.client-ip=209.85.210.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="syXNCe4y"
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848568a6f62so1835466b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 12:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786563555; x=1787168355; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3na27S9dvXCrzn4sNrcA7VrHo71pojsv2T9Iii/MivQ=;
        b=syXNCe4yzrV7AhAkAlO0Jyw6NbMtzuqcRAXR1TUYHl3/xABd+RqMPrBBokKwnKMEXB
         H7oYqkHLr6NBPtDV5VHOG6D+1PM9X38otN9jtlIE5ypTCdaMvdhv+bt8tJMeT3wn9JOJ
         WwbrcLF92Z1oc+Ohqy4cSA4aXuaCUkBcE+cHzhANxLdHtQkPJMQElHQxSC84L0PHN1b3
         MrUc+2g2Nu5COT5Owk9Zsc+pr5yim8c3UQj4fFcIbB7Q2yEbjQoP4ZRgcW6o8uWa5zBY
         cSPtod/6RvCp/ATYBG5i6CTcASVEx159hIeGJADrWt8jTwxWP9hz+rGx5cXfozihNKHv
         W+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786563555; x=1787168355;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3na27S9dvXCrzn4sNrcA7VrHo71pojsv2T9Iii/MivQ=;
        b=gdfjdAq3PbG7tkl6vtvB2Rhu1iVp8ft6boq6BsEDmET/FnJ513IDyGbdPstytpaoEF
         zfTFQMSHh5Cc/eQnBNl8VU1t/UF2s+b9G5Y9s+SwMdLnMI8OuABmlkylbrYWna1JfZU3
         +C0K+i0zj96F0mL53wwUTJLtRtzp5L2BE2+XuM20xrbvdiZaDnhVrdqwszyoE3CKWmju
         QydgBxvt51sUqK4Dp6oNgXjcHPyvuYC3K7oCSEKJVvOR7pTyL1ksm8+B/RE8sCcKWPR/
         qBBd6gyayPiLzgdH3JUiK+WMk0PjLfhPtXgxCfwKYXTAqyiga8v4JJXSmaVRmmrfP2Wm
         0Q/A==
X-Gm-Message-State: AOJu0YxpJRCjyW+YejeDZ1fQ/gVDcDJ8A+BfqszNV/eYKZDNvx5SA1mh
	rN7zJoSACY8cEWS/b4bFI69VwDYkm8YmVnnFBqb58kBGzh++gKTD5hWpGePLpcY5fmfdyuRxZg7
	guhTnsI6CdYHsQLi94jWOIdS9guDdTIXf6Wk1NDQKxXsxk2iwJ9QsGXdIo4DmHy4afTvz60Qj5U
	Fxgl3EQR4EEk/+WZvi3TEnHclZhAAgqkPdtZa+9APUesjdgwtV
X-Received: from pgbr17.prod.google.com ([2002:a63:5d11:0:b0:c9e:a22d:15c5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:cc8:b0:845:e41f:9696
 with SMTP id d2e1a72fcca58-84fc75f438fmr176338b3a.25.1786563554512; Wed, 12
 Aug 2026 12:39:14 -0700 (PDT)
Date: Wed, 12 Aug 2026 12:39:13 -0700
In-Reply-To: <20260812192319.BF41B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260812-vfio-v1-1-5cfe0b1fa4e7@linux.ibm.com> <20260812192319.BF41B1F000E9@smtp.kernel.org>
Message-ID: <anzL4YiN7QozkrN9@google.com>
Subject: Re: [PATCH] vfio: Use file-based reference counting for KVM
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Steffen Eiden <seiden@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, kvm@vger.kernel.org, 
	Christian Borntraeger <borntraeger@linux.ibm.vom>, Vasily Gorbik <gor@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 12, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
> > index 7e8195a311bb0..98f133e4f0b32 100644
> > --- a/arch/x86/kvm/mmu/page_track.c
> > +++ b/arch/x86/kvm/mmu/page_track.c
> > @@ -237,10 +237,11 @@ static int kvm_enable_external_write_tracking(struct kvm *kvm)
> 
> [Severity: High]
> This is a pre-existing issue, but does kvm_enable_external_write_tracking()
> need to hold srcu_read_lock(&kvm->srcu) when iterating over the memslots
> array?
> 
> Looking at the function, it retrieves and iterates over the memslots array
> while only holding the slots_arch_lock mutex:
> 
> mutex_lock(&kvm->slots_arch_lock);
> ...
> for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
>     slots = __kvm_memslots(kvm, i);
>     kvm_for_each_memslot(slot, bkt, slots) {
>         r = kvm_page_track_write_tracking_alloc(slot);
>         if (r)
>             goto out_unlock;
>     }
> }
> 
> Without holding srcu_read_lock(&kvm->srcu) or the writer-side slots_lock,
> could a concurrent memslot update swap and free the memslots array while
> the loop is traversing it, causing a use-after-free?

No, because the part of kvm_swap_active_memslots() that performs the actual swap
runs with slots_arch_lock held.  
