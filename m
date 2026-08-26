Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C1E48551A
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 21:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787781374; cv=none; b=s60gXFxZqRcq/n9hV2eDV6E23m/MloVxD34e6SP9lO2TRsoxMKzpVoE4f3qGZUU3bWRus9m7HGpTRHib2NwdcM7KI4MJ93G+YcML1ACVnffZoFAgOaaPqRNc5uKFjHmerhCn9K0/30P2lGQcnfbfuDzit+fsnV1U9JQPTLEdnT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787781374; c=relaxed/simple;
	bh=sU+Q4g/pVzWeY7//8CsskTgcUXrCPa9PzzQF1WlOdjI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lcVO7SW2zbx91L89gpMPv38LYXbXy33Q17NYn6/nNjIAxc0u3uNkL6xOW9PNICSgJffh2ZUlAZ3w4OdoJ2qJA/Fr1hYwb7XssDa8uHS70kH8puQkqN4DvSg526aZzP3c3FuCLFMMC8JOncGnkBFsuwSIi5sPnziBSA+u87DOeDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pyH3jkxz; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pyH3jkxz"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d54187d8b0so34987705ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 14:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787781373; x=1788386173; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=is+fk7S2hTSHxPwtMEFfacfrRyTeQfS5m4vtXdJKY74=;
        b=pyH3jkxzxcaBpt2oW214iD21eszs3HVZHtdBa3qeVL3BfUwO2+m4YCCi8nygaAbxEC
         /FElgKmiQfTAQdQf4arKR6i1zb9RknYvRWU2/+XfmrwBlr5uzl+Qe8AUoS8euM3Z4fhH
         7E90DD+o8ZKROOlKrBiEf5dfdjXX+XuBLhOlKaEZAHO+Vu4ZiLYAtw7uHrHRdaF8h69Y
         evFL/z8UTojMHlJmZu3p6Dgf/EU7Thg8EHjBX6vDP744ied7KaTPXw+mn3LGwhhSGS7K
         JYOcwNNBk3BplA2K72Ew4jgcS6/ui39gTmufAnSG6u3wMX7pO66ttiGHpP3M5c3J0yV9
         Dybw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787781373; x=1788386173;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=is+fk7S2hTSHxPwtMEFfacfrRyTeQfS5m4vtXdJKY74=;
        b=Ix37/PidfsKX89VWC52TVTnCYgE+RngIpnhzQVZVQkKH7AH+FzVbf3YxYcBAnR7dpf
         nhSzeeaqM3C5CtKra4k749pVvw6jsoXamhqLkQxnnTzEpdPy1/V+qJniWNfgykYTGHLs
         qm/JzJnCb/4m4FgHj+OFpEx/DPYf7q3s22L/Ul5x7OlExIHMG/AiXdI7Wh4W97HkX/VR
         Hje+av85Ro7euVgV2G6M/3txNQjeTlNFPE6I+zaaUvlR0orw0dqnzpVaRZtvxWb5XZQ+
         Z+eUUtiEYVciT00riZbquRXo4C4Qrc+uw6Ggz935tPtMZx3iN6kUlc88mhkPvXvfvG3B
         m3ew==
X-Gm-Message-State: AFuF++n6paWSf9ZVUgPa322PHPkEx48NYeqyKM6xbDpDY2cpm0SHwIBn
	sNur4ZsarCsxAmg319YPesDw4nxy5JdXDEd3G84JMDpERbTjeJdwRBkxCTI1xTJW1Z100VvOInv
	VkpFnYRDw102wzHujQAiBYKFAadEQy+I+CSGxkIWT1d8/MZG588zoQd+E1/4i4w963xESJs+oDk
	eGnZy/+BRUKIbWcsJJdBrKByoSpg6O5Cwahciornj7AVWQU59a
X-Received: from plbkr5.prod.google.com ([2002:a17:903:805:b0:2cc:cfa0:3117])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4c7:b0:2ca:6d87:cda0
 with SMTP id d9443c01a7336-2d7079fa6d5mr151579565ad.6.1787781372474; Wed, 26
 Aug 2026 14:56:12 -0700 (PDT)
Date: Wed, 26 Aug 2026 14:56:11 -0700
In-Reply-To: <20260826214101.CE1681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826211844.884951-1-seanjc@google.com> <20260826211844.884951-3-seanjc@google.com>
 <20260826214101.CE1681F000E9@smtp.kernel.org>
Message-ID: <ao9g-y3F_6Sswfl8@google.com>
Subject: Re: [PATCH 2/4] KVM: x86/mmu: Bug the VM if KVM attempts to walk more
 levels than the MMU has
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 26, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The new bounds check falsely triggers KVM_BUG_ON for valid PAE page walks on 32-bit KVM hosts.
> --
> 
> commit c8c785606f8b5ac435db8c42d576eaf8f88c2fcd
> Author: Sean Christopherson <seanjc@google.com>
> 
> KVM: x86/mmu: Bug the VM if KVM attempts to walk more levels than the MMU has
> 
> This commit extends the paging levels check to ensure KVM doesn't attempt to
> walk more levels than the MMU template provides, preventing out-of-bounds
> array accesses.
> 
> > diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
> > index 27427e7f22fa0..46a0f7796e55a 100644
> > --- a/arch/x86/kvm/mmu/paging_tmpl.h
> > +++ b/arch/x86/kvm/mmu/paging_tmpl.h
> > @@ -368,13 +368,14 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
> >  	pte_access = ~0;
> >  
> >  	/*
> > -	 * Queue a page fault for injection if this assertion fails, as callers
> > -	 * assume that walker.fault contains sane info on a walk failure.  I.e.
> > -	 * avoid making the situation worse by inducing even worse badness
> > -	 * between when the assertion fails and when KVM kicks the vCPU out to
> > -	 * userspace (because the VM is bugged).
> > +	 * Queue a page fault for injection if any of the below assertions fail,
> > +	 * as callers assume that walker.fault contains sane info on a walk
> > +	 * failure.  I.e. avoid making the situation worse by inducing even
> > +	 * worse badness between when the assertion fails and when KVM kicks
> > +	 * the vCPU out to userspace (because the VM is bugged).
> >  	 */
> > -	if (KVM_BUG_ON(is_long_mode(vcpu) && !is_pae(vcpu), vcpu->kvm))
> > +	if (KVM_BUG_ON(is_long_mode(vcpu) && !is_pae(vcpu), vcpu->kvm) ||
> > +	    KVM_BUG_ON(w->cpu_role.base.level > PT_MAX_FULL_LEVELS, vcpu->kvm))
> 
> [Severity: High]
> Does this new check falsely trigger KVM_BUG_ON for valid PAE page walks on
> 32-bit KVM hosts?

Argh!  I missed/forgot that KVM only configures paging64 for 2 levels.

#if PTTYPE == 64
	#define pt_element_t u64
	#define guest_walker guest_walker64
	#define FNAME(name) paging##64_##name
	#define PT_LEVEL_BITS 9
	#define PT_GUEST_DIRTY_SHIFT PT_DIRTY_SHIFT
	#define PT_GUEST_ACCESSED_SHIFT PT_ACCESSED_SHIFT
	#define PT_HAVE_ACCESSED_DIRTY(mmu) true
	#ifdef CONFIG_X86_64
	#define PT_MAX_FULL_LEVELS PT64_ROOT_MAX_LEVEL
	#else
	#define PT_MAX_FULL_LEVELS 2   <=========================
	#endif

I tested a 32-bit PAE guest, but only on a 64-bit host.  I didn't test a 32-bit
PAE guest on a 32-bit host.  Lame.

  ------------[ cut here ]------------
  WARNING: arch/x86/kvm/mmu/paging_tmpl.h:378 at paging64_walk_addr_generic+0x422/0x950 [kvm], CPU#3: CPU 0/KVM/2511
  Modules linked in: vhost_net vhost vhost_iotlb tap kvm_intel kvm irqbypass
  CPU: 3 UID: 1000 PID: 2511 Comm: CPU 0/KVM Not tainted 7.2.0-rc7-cc46e34b6df0-x86_nested_npt_lma_pae-pae #7 PREEMPT 
  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
  EIP: paging64_walk_addr_generic+0x422/0x950 [kvm]
  Call Trace:
   paging64_page_fault+0x51/0x870 [kvm]
   kvm_mmu_do_page_fault+0xfc/0x220 [kvm]
   kvm_mmu_page_fault+0xa2/0x770 [kvm]
   kvm_handle_page_fault+0x6c/0x130 [kvm]
   handle_exception_nmi+0x50f/0x610 [kvm_intel]
   vmx_handle_exit+0x18f/0x5b0 [kvm_intel]
   kvm_arch_vcpu_ioctl_run+0xc71/0x1c00 [kvm]
   kvm_vcpu_ioctl+0x2c5/0x960 [kvm]
   __ia32_sys_ioctl+0xff/0x960
   ia32_sys_call+0xad5/0xc30
   __do_fast_syscall_32+0x5b/0x500
   do_fast_syscall_32+0x2b/0x60
   do_SYSENTER_32+0x17/0x20
   entry_SYSENTER_32+0x98/0xf9
  ---[ end trace 0000000000000000 ]---
