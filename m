Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E46351C1E
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 18:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781115941; cv=none; b=p7RcHPZdhp4kTvWi+5cZFg13TA/QA91yz8ivZvamn/mD4665tF4YLjPb3+i4fsyXnlSZ38Exvo0he5itC94T3uFJ+SimrcMWdW25HBdwEaTMqb9U2ZwCoA4UepPsDBhLCgM0xUO/A2646x/myWB5Zqnr1q7m6k5oEApfNTpLrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781115941; c=relaxed/simple;
	bh=yKq2Ui00JXDy2Up9TpO1zuormhAd0uRGnQ1pNcg5FBk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nM3BCs15f2HlIxiGhr4dt6IO2AtMxZwb2MQxB8JzW1nPKw20GNi6OkcUoVpwtAik308VEtvvSqqWRYqe7IxRF14f5hFLBt96lvNfLJnpnqShI78kj8rfgJvoOl6mNTzeGVlNGq7QbVIqdq1MDgh84RuTgGjMBElo6XTeBbzoQgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cCXmpKdn; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cCXmpKdn"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso117357425ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 11:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781115940; x=1781720740; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kB5UUPePlwgpE8nklgBfMtK83uf+7umzGBRIUNT+CTg=;
        b=cCXmpKdnbj2TlkPu0sHu519njX37QDawZbxnpKZth+0BpWqwYem6fOlMT4PUFuAT4q
         nF4tflSk9BzLcvPuVFlP/pI5GJi7OCEAarFc8nGIWdJURyfRNJVN1H4g3rBOVzEvWLhU
         pUg4BK4zOxqC3e691ksyJsvMa5DEBhuE3zzUj0o2DrPcFbLS9mQbVxeZLLVr1+NDs6Pv
         +Fbr+R7LTsZvJhOYRYVxK/QeBknba6np5heMhUjWjIzkew1Rtc3A8xW9o+voMzb7tEwD
         5/3gW5aRhrveaZn1QzV6wRmCJkMswHkFtyLDAsJ+HjM5W+oLexVLnbPCEYgjxGOdT+nI
         g8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781115940; x=1781720740;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kB5UUPePlwgpE8nklgBfMtK83uf+7umzGBRIUNT+CTg=;
        b=Nox5EfN9ANdCeQ1fyAg3MtY0cyTxsK0Z4W9uXcOdkneumUBwfT2cLYtt/GwoRznjeg
         fJpz7omywDT32kZQRgV0ven1Qxj3xj6KBVj4fpFYtcfXpUcUyRsS0l8JYLCEpIyWOKrX
         qhjVP4Maa7qUExyjToWGtxC2la6r4G7ig9Qg+PnBfcjpPsbIIsM7BEbuwxELSnmpOZUh
         7XBUuxtBJRLrD5irrPStDA8Hk46HZAT83m06/W6FmVpkTzw3M5clTYqi6TNPT0aOUW6E
         d1/NFf7QtIpmuZHTL+tw77esE7SnMKZ6VV89F7nZhXEqmD4JVlOQzDJFgQbwbVErhm2b
         CaiA==
X-Gm-Message-State: AOJu0YweMKwpRuX5OnK9SjzEZFchbxq4fxFD47UJod7rY+AydH6jFa2v
	iqY4maCScjV5W9gq6ngGXu1MXlnHn3mhI49YhWotn7qNVPYWz1JeGzZ/aWNk0WS+4drLHxYca4L
	8bpcnKxDebUaVK0ry8nzKiwDzxI+ErhZPHJOMgh8LDNuOieLiMQHvK3oav6ht/A4S+opX4Ob7lY
	HTE6BM9J1pqIGgAv58eJPEhPa+MRZijJOYjVJ2AaOhlqMts0HY
X-Received: from plbmp5.prod.google.com ([2002:a17:902:fd05:b0:2bd:c925:e1dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1247:b0:2c0:b35d:ed54
 with SMTP id d9443c01a7336-2c1e85e04c7mr306277645ad.35.1781115940004; Wed, 10
 Jun 2026 11:25:40 -0700 (PDT)
Date: Wed, 10 Jun 2026 11:25:39 -0700
In-Reply-To: <20260610162623.061BA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <aimMWzAf5b3luM0b@v4bel> <20260610162623.061BA1F00898@smtp.kernel.org>
Message-ID: <aimsI-8mcO9oCq_q@google.com>
Subject: Re: [PATCH] KVM: SEV: Don't return a still-assigned gmem page to the host
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Hyunwoo Kim <imv4bel@gmail.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 10, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index f59c65abe3cfa..dbde6dce79b76 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> [ ... ]
> > @@ -5036,8 +5036,12 @@ void sev_gmem_invalidate(kvm_pfn_t start, kvm_pfn_t end)
> >  
> >  		rc = rmp_make_shared(pfn, use_2m_update ? PG_LEVEL_2M : PG_LEVEL_4K);
> >  		if (WARN_ONCE(rc, "SEV: Failed to update RMP entry for PFN 0x%llx error %d\n",
> > -			      pfn, rc))
> > +			      pfn, rc)) {
> > +			/* Still assigned to the guest; pin and leak rather than freeing. */
> > +			folio_get(page_folio(pfn_to_page(pfn)));
> > +			snp_leak_pages(pfn, use_2m_update ? PTRS_PER_PMD : 1);
> 
> [Severity: Critical]
> Does calling snp_leak_pages() on a pinned guest_memfd folio corrupt the
> system-wide LRU list?
> 
> Memory allocated by guest_memfd is added to the page cache, which
> unconditionally places the memory on the global unevictable LRU list. When
> guest_memfd memory is freed, the folio has been removed from the page cache
> but is still actively linked in the global LRU list until its reference
> count drops to zero.
> 
> By calling folio_get() here, the reference count is elevated, keeping the
> folio on the LRU list. Then, snp_leak_pages() unconditionally links the
> page into a tracking list via list_add_tail(&page->buddy_list, ...).
> 
> Because buddy_list and lru share the exact same union inside struct page
> and struct folio, modifying buddy_list silently overwrites the lru.next and
> lru.prev pointers of the folio, severing the global LRU linked list.

Yeah, trying to prevent a folio/page from being freed from within ->free_folio()
seems like a fool's errand.
