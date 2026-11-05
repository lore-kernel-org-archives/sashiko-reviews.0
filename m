Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793903965;
	b=pkaUHvbfRipJ288usvLcEIBiYYiDZIb0kjwgghIozDYYE/y5ctb5FmrIOGhnYzqYPVbe
	 P9chgo++AL3FmGZIzb4UV33f4Idyi7+HL7BQl5FYk7+8hLKvnCDAUScyvDvfQRtG23mHl
	 +VZE0//9BaC0eIsRBE32fk5aFhyd50eXcFYE+N1FlqT5lMKrEuSgl5fL6EPvwLPgvXm4V
	 pjThi1Z5x4tct2SQHAa7jTUKnzereYhYZZhd5Pg7E8gavw6BhzZV7TylUpxEY1+CA8d07
	 osVJ41VROxe5Vz8v6wafsgUkyXTNl1cVQOuPi8xZ21U0wZWiwWJ06EphF0RhHoql2vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793903965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=EdX+hrQFFp3Ef43cGYEEIMpLtyOAGxMQqiQQxVrhHxE=;
	b=Lu6u7zRFSnfR32v3IkqicuFEbZQQTRnKNk09RfMJyWzuax8QYhH9qbmuF1ESwpj0JeTl
	 VdzU5UWB9qsnaEWh5BdEnAdKut4OQPl2a8muJCoYKTJsrZOW+a0Yd/Y/knRQfT+MjO3bq
	 dP/VafzsC0z4PopcxiUgBwc4KUEtuP9RHm5RWvgHofr2TBtpZEXqAlGTXAaN+an3+zsGG
	 dG+EDckC6evkCIwOH5KJEWbqzw8C/WN2RxOlfVCGMTdq4efas7moWkS5lnJRQg7N7kTaR
	 6aCJ5b2NxpRPBqxgyJZ1WOQBH+fFSdveQSFK5g9xqSLdhcF/xK+vwTJLzL63v2r7uWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R4taE8yX;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F97606A32C
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 18:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2F97606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=R4taE8yX
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb4c49e52fso1969600a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 10:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793903964; x=1794508764; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EdX+hrQFFp3Ef43cGYEEIMpLtyOAGxMQqiQQxVrhHxE=;
        b=R4taE8yX1CnDEpWDZHmtuyAFNpImJI5ojVyfg4q3IcEoHgBlxXeH9EXtl4XyjI7jtZ
         5/5MTJLqYkEmij9As7mSFn8YDkoIMIi8RotdqNkqK/vJvChgWs+77BuTL6RgjRzphJUU
         PSmI0gks5XSYiL3IyDzxfNp+3v3c+JP1MvfUvSMHf5scRekYcLKeXC3WpGxYJobq/XK/
         tALyQgM2hXqcLPieD4sieUDvvrNwqXXIneGHTqmYcyBlSDHyanoJUglg1XbYmZNWMadg
         4dkNSikKdfWLTJ5R1/WWIZ0WjVsQysRcjvGsIxVdHY9h9QZUWyEvMuJejAel3TVbqMyB
         esMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793903964; x=1794508764;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EdX+hrQFFp3Ef43cGYEEIMpLtyOAGxMQqiQQxVrhHxE=;
        b=GF1lhrzFnaU18UTDHgO1W840dte87y91zxJf41uJNuM9QLszUGqQJh6UZnrQn8aRQU
         WHrVFmumQzgyKct0Gjl3Cxfu3xqgKhz7uSaz36bKW5XlnFIrkRjXI0foL2DUPv2ZVu8S
         1xvRZsEOBfDAePvr/XaocRSvMkfySP/2UkulZx7jvpqoB0uT7At6GENfZWgLhLZBzA7j
         I0RmssAmc9VTB9zU61ynS1CpTTkVGM8H6Kj8Sg0sbcJEhM5YBt5/7TESKClGIoN8pVZQ
         B4rBknvgGtNkGqIZuux81M/LgNtUMBVoJM5IjLhxGoG6RjFFPTUDV5RH9rrDY2teP2OF
         Njfw==
X-Gm-Message-State: APuU4Z9ibeu+l1ksgXA1uWGnQxMSXToOxCfEJ+9d105IT8e6/jTnyNQB
	P4ptf2uHE9amMa/1JVWst6url+NsbiRlnr4NpjlkYhF7/2PrgrCc4mCj+3egiWeFd3zNYkU0hU5
	J3dlfMasev3/vmQHR6fILIE8lBJRtpvc+/qOY7o/OM4qKYHvJgMRWBFvzeivQZFXyTpFbvBW2/h
	oITY7AwWXvcoUgnomkVyGhxYkiIX9tyXlUFT83b+fs078yZqu5
X-Received: from pghl2.prod.google.com ([2002:a63:f302:0:b0:cc7:8e37:71bc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:9e95:b0:3e9:290d:9774
 with SMTP id adf61e73a8af0-3ebb2a7e5dfmr373500637.44.1793903963836; Thu, 05
 Nov 2026 10:39:23 -0800 (PST)
Date: Thu, 5 Nov 2026 10:39:23 -0800
In-Reply-To: <sashiko-outbox-199772@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261105181742.3718448-1-seanjc@google.com> <sashiko-outbox-199772@kernel.org>
Message-ID: <auzNWz75JLF3VmV1@google.com>
Subject: Re: [PATCH] KVM: VMX: Re-pend KVM_REQ_APIC_PAGE_RELOAD if getting
 backing pfn fails
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Nov 05, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] KVM: VMX: stale no-retry comment in vmx_set_apic_access_page_addr()
> --
> 
> commit 635b83243ce9cf39c9f2bbd0198d7730dbb21505
> Author: Sean Christopherson <seanjc@google.com>
> 
> KVM: VMX: Re-pend KVM_REQ_APIC_PAGE_RELOAD if getting backing pfn fails
> 
> This commit re-pends KVM_REQ_APIC_PAGE_RELOAD in
> vmx_set_apic_access_page_addr() when looking up the APIC-access page memslot
> or faulting in its backing pfn fails, preventing the vCPU from running with a
> stale vmcs.APIC_ACCESS_ADDR. It also adds a WARN_ON_ONCE() if the private
> memslot is missing or invalid.
> 
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index b341af4c6057a..13dcf9c12c83a 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -6923,8 +6923,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
> >  	 * APICv is enabled, but paranoia won't hurt in this case.
> >  	 */
> >  	slot = id_to_memslot(slots, APIC_ACCESS_PAGE_PRIVATE_MEMSLOT);
> > -	if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
> > +	if (WARN_ON_ONCE(!slot || slot->flags & KVM_MEMSLOT_INVALID)) {
> > +		kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu);
> >  		return;
> > +	}
> >  
> >  	/*
> >  	 * Ensure that the mmu_notifier sequence count is read before KVM
> > @@ -6941,8 +6943,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
> >  	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
> >  	 */
> >  	pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &refcounted_page);
> > -	if (is_error_noslot_pfn(pfn))
> > +	if (is_error_noslot_pfn(pfn)) {
> > +		kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu);
> >  		return;
> > +	}
> 
> [Severity: Low]
> This isn't a bug, but in vmx_set_apic_access_page_addr() in
> arch/x86/kvm/vmx/vmx.c, the full comment immediately above
> __kvm_faultin_pfn() still states:
> 
> 	/*
> 	 * No need to retry if the memslot does not exist or is invalid.  KVM
> 	 * controls the APIC-access page memslot, and only deletes the memslot
> 	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
> 	 */
> 
> Since both the invalid-memslot check and the is_error_noslot_pfn(pfn) check
> now retry by calling kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu), and
> VMX does not delete or inhibit the APIC-access page memslot while the VM is
> alive, should this comment be updated or removed?

Gah, yeah, I'll fixup to this when applying:


	/*
	 * Retry if faulting in the page fails (or the memslot is unexpectedly
	 * invalid) even though KVM controls the APIC-access page memslot, and
	 * never deletes memslot for a live VM when running on VMX.  Userspace
	 * can modify the underlying VMA, and while doing so is beyond crazy,
	 * the cost of supporting that behavior is to simply retry the reload,
	 * which KVM should do anyways to avoid carrying a stale pfn pointer.
	 */
