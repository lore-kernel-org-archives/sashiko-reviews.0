Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199DD29C35A
	for <sashiko-reviews@lists.linux.dev>; Tue, 11 Aug 2026 00:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786408816; cv=none; b=F/lMS2dEBMGCN574pmG6UFp/0+FGhsp5nnBlNFn/LfVmZdKkfABUp21zeEreZ6xjzo4coBQ6lAdnQWdIU1hOl8PnVPcud4GhrdzZLW8+cI3DDnGl5iNzhNpEB7J5e3eJb2Bgzxi0zVKep9flu+gxsny3WkjXTRJ4RP2j8Zgx6Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786408816; c=relaxed/simple;
	bh=gPQX7eKDjF4fZq/GhWCuXhtZgyhr/sWawWqdyrYXkio=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qE7IQ9Q7CpDuujlwiIQfNMvx9VAwxwns/Iu7sGVNSqbSzfXH1/e8OjBnuwqm2GS/olVjRJ8VjOSTKw3KhOvs0QBNghnSHe5+2mDEsA2Z+InM9kfFxQ3U39w5JLBuWGt20NMdu6E2kSvrdw3gPMPky//RaajI+LfzaZXtxRXNtWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SvA/6fK1; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SvA/6fK1"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so4024727a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 17:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786408814; x=1787013614; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JyMT57kWt1PHWoThOFjq7MhJaHyWUBNbFvppiukGfjo=;
        b=SvA/6fK16/8SD0wxThpzB8LuG5ualr5TTz4I79jVuTQSms0I5fBanCIAmfZQgX5HvO
         LeVwx5qagO3gHM4HPchmkXOYvlPQIiQuR6DQ4A3knmED4SLl1P3inj2k/v2e653yEllw
         /+7ziWvqM7W9VFM0YvLyWypXi58mAmj1FPIOaxZPcTn/hH7Pd93H6M0kphpJmjg+XWJJ
         sk7GNZl6QW4K2B2SyFf8s68jxmLySb4wWk9Zv3/+rBYZsj82wocdA00/dDrDSWory0b5
         zLG0g76LDx4OpYt8xumrG2QewD7sCPZ0eqxNv9jYT5K4S30m8pnIJE355HFMO955OQ9P
         GTiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786408814; x=1787013614;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JyMT57kWt1PHWoThOFjq7MhJaHyWUBNbFvppiukGfjo=;
        b=Rq5zEnb8Vklq8dSlTPjWwMyviZD55nF514nLwBzII6N5mj20Gj7T4cbNaWRrgJGZaz
         8+mQ9g3Z+iveVN+aCmWpT6gpYKjGEY2BynW2puko/XI1hZNW8WDasc3WZ9bZ0APBe0Kg
         ovf9LmPw09RjLta67ougilLsU1sy03T0UL3Y1EJP9XP3z+ZZQQcMwosElrkl/1m6Bf9a
         i7hyVbI8liP5NhP25CM8ACUTdLQQ2oXdXA+LdAgqV2UoxasvD935dKpsrXtcUZOAcUv2
         FjiJe7hr9JEMtpLW10aqiig6zN8Hb1WtMlKs4OzxDSSbHdgNdW6tu76wpZG2VVP0xMeG
         K7cQ==
X-Gm-Message-State: AOJu0YwBr2UtwdRhTwk67tUNw4/1bqRphJc1eLAa+qaJr/WmBido718F
	SfmTaQi4bG2YTV7clPfky5y4KUqzttwO1XnVQMAZL1xvMVpY9/LsSjVmrJWQHyz/rrMOzjEli12
	2oPqcgA==
X-Received: from pgbg16.prod.google.com ([2002:a63:5210:0:b0:c9a:2800:5ce6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d10e:b0:3b4:8f18:33a
 with SMTP id adf61e73a8af0-3cc1a0bcd09mr6439126637.1.1786408814121; Mon, 10
 Aug 2026 17:40:14 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:40:13 -0700
In-Reply-To: <6adaf312-84ff-4fea-b072-61588fd73b40@amd.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260713105033.15405-1-sarunkod@amd.com> <20260713105033.15405-6-sarunkod@amd.com>
 <20260713111119.EC35E1F000E9@smtp.kernel.org> <6adaf312-84ff-4fea-b072-61588fd73b40@amd.com>
Message-ID: <anpvbdzUIE_JtVoL@google.com>
Subject: Re: [RFC PATCH v3 5/6] KVM: SVM: Add support for AMD IOMMU Guest APIC
 Physical Processor Interrupt (GAPPI)
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Mon, Jul 13, 2026, Sairaj Kodilkar wrote:
> On 7/13/2026 4:41 PM, sashiko-bot@kernel.org wrote:
> > [Severity: High]
> > Does this lock ordering create an ABBA deadlock?
> > 
> > When a vCPU is preempted, the scheduler executes kvm_sched_out() while holding
> > the runqueue lock (rq_lock). KVM then calls __avic_vcpu_put(), which in turn
> > calls avic_add_vcpu_to_gappi_wakeup_list(). This acquires the
> > gappi_vcpu_wakeup_list_lock, establishing an ordering of rq_lock ->
> > gappi_vcpu_wakeup_list_lock.
> > 
> > Conversely, when a GAPPI interrupt arrives, avic_gappi_wakeup_handler()
> > acquires gappi_vcpu_wakeup_list_lock and calls kvm_vcpu_wake_up(). The wakeup
> > path then attempts to acquire the target task's runqueue lock, establishing
> > the reverse order: gappi_vcpu_wakeup_list_lock -> rq_lock.
> > 
> > This inversion will likely trigger a lockdep ABBA deadlock splat and violates
> > the scheduler locking hierarchy.
> 
> For this condition to exist, Following two conditions must be true.
> 1. avic_vcpu_put() and gappi interrupt handler() must be on same
> physical CPU.
> 2. GAPPI must preempt the __avic_vcpu_put() once it has acquired
> gappi_vcpu_wakeup_list_lock().
> 
> The second condition is not possible since __avic_vcpu_put() disables
> the interrupt while aquiring the ir_list lock.
> 
> Hence ABBA deadlock is not possible

I wouldn't be surprised if you need to tell lockdep that, e.g. see commit
c0b8dcabb2cd ("KVM: VMX: Use separate subclasses for PI wakeup lock to squash
false positive").
