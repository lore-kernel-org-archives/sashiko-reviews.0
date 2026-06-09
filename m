Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAE6230BDB
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 00:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780966439; cv=none; b=dHj6RrTLPPzytq59Dp0EkbNG5fkWhn88B/xqkEUFqpGAX1fowr9nAuyz3uz9+f/7mtddQMxXCA7K7MGBVUYtxX1WTNMOhDQSxfWoCBfKjqGOn7+7wmDjXcbVESIFGOUn4AAL4JBypSAWnqfbMJHMIGgOz6M6zm0C/Y9kzyYbXKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780966439; c=relaxed/simple;
	bh=7JwlSzAVR32H6EGmI7D2l2G8oqBDvYp4ymX0ONAMWZs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DqIfxk5s9GdnFuPiB0MHzubQeUdlhwhpsTldwNY5W4HSDrL5aVx8Oi7gbY1quJ5YlLbF0XJRw2/2zVI+sYwfavNph7zXvW7bHOXQAJgQ+o/VEZQODieB8ku7m2NlIEJ0QWlhvWcprVZASnNXuNbAOKaKPc1QMAD/1+b41Kftu/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ufkeCLVa; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ufkeCLVa"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-36d979441eeso4208399a91.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 17:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780966437; x=1781571237; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=l2ofoLVe/pRkC2ffnmIMpARfn+9F9I5mIrOiklVpQ4A=;
        b=ufkeCLVaCAzQ9BaKYAj2jY7xnnrBrwfvCgs8LyfwM5oyWjq3P7kqLhebJI1vFpZ4XW
         O3r+KjqaXyzPI0/mozbSCBzm6GsDa0/HmnqzbsMz0ePaAbFGKz0GUL/RXKnFCT/G8Xgk
         8Mh+2qUoqG6SiwfeO4sHx2PvQqtfhA+DvPg3ZVYliyp6a40RxPW2MHpO4IRUG8JC5y0v
         fj6yzYAa/fFpT8DscDnw3dsESxDwiLA9lTYlE7nwxHy4dk4w7UTgHfK1nw5d1WiCJob4
         ekfK9hsFfNuci71zwGJvQ4ZSAxaBXdnEI9wGRyLQ47cTecCUZYMt8ktaP5/ijZ0RqULf
         w/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780966437; x=1781571237;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2ofoLVe/pRkC2ffnmIMpARfn+9F9I5mIrOiklVpQ4A=;
        b=qQUWw7U8LjUfh5kzAjnOmnPpQZ76OYRi0EpMBIZUQX3xYG5GdPjqtd/zXhToCUnZhG
         oGjCq3JBl8pp8uddodbOOWvPOr98zaw8hSggXEG+vMbNAYi8HwzkOyCfz3CAXdKlJ8FF
         RJRC7ijqiJnLUbZvXCS2AoYnIT/U8F/v+OoenF7da8/uQnDvGjqevtBX+X9Yht3Rb266
         wT0a97q/02gnozoBpBYSIAMfElSOZ6bytqZLsU7Ug2SL+WJmN/c/EHAXEisArY4hXKJ9
         y7l39GfT4szEvyO2Gn+cYS7CXRn/yJQbLamIsy6sG+W8y/r82zqZza1q9lwlJMBWZGgf
         eslg==
X-Forwarded-Encrypted: i=1; AFNElJ+8ZLYqNZPZScFMEFeNzsno4bGkmhfqKX3KwlMAx1gWaRKN11ykErK+kujb5whMXRaLpIKXlfaLpfwgFQU3UZA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDVvRValaVlDhRPsaIvkLfrkqmsIc4oW1cyr60smwmtObmpmcR
	nkOq3hRMcIXPmGa4KSCt6YWLEpU1paOKdOzLxfNP9n3GDcGgzq247UNL1o/dlDL5K26n1R/BYcf
	najaHKg==
X-Received: from pjbbg24.prod.google.com ([2002:a17:90b:d98:b0:36b:d701:c030])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:540c:b0:36d:b680:3036
 with SMTP id 98e67ed59e1d1-370ee447882mr18737160a91.4.1780966437250; Mon, 08
 Jun 2026 17:53:57 -0700 (PDT)
Date: Mon, 8 Jun 2026 17:53:56 -0700
In-Reply-To: <c1f0dee379e282ffb35296da4b666d93025f1c95.camel@infradead.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ahnk6cBLuuPIAwmA@google.com> <c1f0dee379e282ffb35296da4b666d93025f1c95.camel@infradead.org>
Message-ID: <aidkJJesvO9vE77j@google.com>
Subject: Re: [PATCH v2 15/20] KVM: x86/xen: Convert kvm_xen_set_evtchn_fast()
 to gpc's CLASS() APIs
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: pbonzini@redhat.com, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev, dwmw@amazon.co.uk
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 02, 2026, David Woodhouse wrote:
> On Fri, 29 May 2026 12:11:37 -0700, Sean Christopherson wrote:
> > On Fri, May 29, 2026, sashiko-bot@kernel.org wrote:
> > > [Severity: High]
> > > Does this unintentionally hold the gpc lock across the IPI kick?
> > 
> > No, it intentionally holds the gpc lock across _sending_ the IPI kick.
> > 
> > > [Severity: High]
> > > Does this now hold the VM-wide shinfo_cache lock while calling
> > > __kvm_xen_set_evtchn_fast() and kicking the vCPU?
> > > 
> > > Since shinfo_map is a function-scoped CLASS() variable, its destructor
> > > won't release the lock until after __kvm_xen_set_evtchn_fast() returns.
> > > This creates a nested locking dependency and holds locks over expensive
> > > cross-vCPU operations, potentially serializing event channel deliveries
> > > across the entire VM on the fast path.
> > 
> > __kvm_vcpu_kick() is neither expensive nor cross-vCPU.  In the wait=false case,
> > which is the behavior of kvm_vcpu_kick(), it sends IPIs via smp_send_reschedule(),
> > i.e. it's more or less just __apic_send_IPI(cpu, RESCHEDULE_VECTOR), which is a
> > single WRMSR on modern harware.
> 
> Hm, if we really are going to use a raw rwlock then I suppose we should
> take care not to spend any extra cycles with the lock held unless we
> actually *need* to?
> 
> In which case I wonder if we really need the scoped CLASS() thing (that
> encourages people to run to the end of the function under the lock), or
> if the helpers you add for that are sufficient on their own?

Eh, I would argue that "the code is easier to read" is sufficient justification
so long as holding the lock for a few tens of extra cycles doesn't cause problems
in practice.
