Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF583EC6BF
	for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 13:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974395; cv=none; b=p/L5ZUUqNSnPpkguiVlAlwoh/PGf7SvY2FpQG9pbd451YGBIwEXohDz3kjH0Q9ahbtjXiAK1IvOOuMf7v2V9vhdaAD3i1AInA/4Osb/AlW3DYax9bdnWj5at6rxDxMs6zEyCCWn0NmkGQ7vLzMs36of40Tm7Hlpxo/lLdrL2B8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974395; c=relaxed/simple;
	bh=BNA2bJ8izQU+zHo+wKDbWbBqe6iF/JZhi8seSQQ2KMg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ja7jOl3pUF4jaIcfuoDMSPb7lC0GAw5Sx/tPQvVLYkNF1vWmk3iWa6F2VaBIrkOohusATK52GUKlQdcacFNjxe0jzH+zsDEJbMv6t5JxCyGR+FWxeviwejCGgikHiA9lvPkECFPr6Fxu4lGHObPWbem1/WwhmUL6h4xgzrmXMko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QihgVAfW; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QihgVAfW"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so6406689a91.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 17 Aug 2026 06:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786974390; x=1787579190; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G5psuCp/phg+ycu2xLFTJu6xbtt7uSiAktxc7KtLUx8=;
        b=QihgVAfW6c8ZNqJbDruS00IKdj40KOcm3nm8tsUhfE/4r5dipVa3d3m/UtKBcOg2Bw
         FqUOM28/cYlTTEweI9t0uy23DeblOSu21cgl/6rXzApsXN5Ncbm2JTvfc8kDe9nHMvUY
         4lwWnto/9ok+VKtOiPUg7x5DqtbYj8Ih7pKx0IQ4wnvQKUGKji7oFTIH78x87j+/JyEY
         U6dI69SVKNsTYQwASTXfRtfoMufGzfls07GkGS26CSQHKpJrGZiugTB+fCFWU9v/sjoC
         JIbRBI6kqNbGwZIlmPgqtNdl+vK6bmf7KFhfXwyL9l/65hebOf58+HcVXuVj5rHEjGr2
         wlcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786974390; x=1787579190;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G5psuCp/phg+ycu2xLFTJu6xbtt7uSiAktxc7KtLUx8=;
        b=eB5qiD2l44h/uEF1otBeMm2M10u0aXSsaUPJr0Cb1zT3LimmKew4/C+RG7gWoE1Zdi
         554xcaTmfgQ57AG3pKokpqnqTDZ5pPGDRHZzr4C2IgckpmVY53hE4s3Zez03bilSWW1i
         R9xP/4y7gPQ2BM3RdETrfEIIeGHiXk2wcjCEgg2HSr3NndGxZ5gshyIS4ejwRXNfWMIv
         U2w6GJJfCiLhReKbxZvd3UUZHaWqqqnwuG8BbyCH1jxVYc8KGPYxd/i6E3Xa1jhP71Su
         aASYAFj0cHomddoSQAT0ch8B4Fm9lokF4eNi6Fqo5StxqsUBOM+a/zSUmCbA34VYZLeZ
         fiSw==
X-Gm-Message-State: AOJu0YxHeUAPyScSjzKn7thDqIuPZVDNIgrkwRU6AvcJsmlhf5NMPnqt
	ctUHy22A9vqqlj6+B4zdinUtqyxvJp6NW5TMA7q5tihsahzrZCK9zZTV6Ky7nzIbfVQwaaYtlda
	onM+kCg==
X-Received: from pjje11.prod.google.com ([2002:a17:90a:630b:b0:38d:f003:cd24])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4f:b0:38e:ad9d:1161
 with SMTP id 98e67ed59e1d1-3933b833613mr29799421a91.0.1786974389518; Mon, 17
 Aug 2026 06:46:29 -0700 (PDT)
Date: Mon, 17 Aug 2026 06:46:28 -0700
In-Reply-To: <32c405c0-a05d-49e7-9cc5-3e5918c27df1@amd.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260713105033.15405-1-sarunkod@amd.com> <20260713105033.15405-6-sarunkod@amd.com>
 <20260713111119.EC35E1F000E9@smtp.kernel.org> <b50b3535-eaa1-4944-914d-0eea8dac0e06@amd.com>
 <anpwS3C2UIHFz_Uf@google.com> <5149127b-32ce-4409-a443-02b5a9600e14@amd.com>
 <anzsptZlkU4VOKGi@google.com> <32c405c0-a05d-49e7-9cc5-3e5918c27df1@amd.com>
Message-ID: <aoMQtL8qx_P69NTk@google.com>
Subject: Re: [RFC PATCH v3 5/6] KVM: SVM: Add support for AMD IOMMU Guest APIC
 Physical Processor Interrupt (GAPPI)
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	Vasant Hegde <vasant.hegde@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Aug 17, 2026, Sairaj Kodilkar wrote:
> On 8/13/2026 3:29 AM, Sean Christopherson wrote:
> > diff --git arch/x86/kvm/svm/avic.c arch/x86/kvm/svm/avic.c
> > index c5b1d294b15a..c9a6da646c8e 100644
> > --- arch/x86/kvm/svm/avic.c
> > +++ arch/x86/kvm/svm/avic.c
> > @@ -1020,6 +1020,9 @@ static void avic_update_iommu_vcpu_affinity(struct kvm_vcpu *vcpu, int cpu,
> >  
> >         lockdep_assert_held(&svm->ir_list_lock);
> >  
> > +       if (ga_log_intr && gappi && kvm_can_use_device_posted_irqs(vcpu->kvm))
> > +               kvm_pi_enable_wakeup_handler(vcpu);
> > +
> 
> I am not sure what you mean here, because pi_enable_wakeup_handler does
> more than just manipulating the wakeup list, it also updates pi
> descriptor which is Intel specific, 

Sorry, got ahead of myself.  I was envisioning a helper that for just the common
part, e.g.

void kvm_pi_enable_wakeup_handler(struct kvm_vcpu *vcpu)
{
	lockdep_assert_irqs_disabled();

	/*
	 * Acquire the wakeup lock using the "sched out" context to workaround
	 * a lockdep false positive.  When this is called, schedule() holds
	 * various per-CPU scheduler locks.  When the wakeup handler runs, it
	 * holds this CPU's wakeup lock while calling try_to_wake_up(), which
	 * can eventually take the aforementioned scheduler locks, which causes
	 * lockdep to assume there is deadlock.
	 *
	 * Deadlock can't actually occur because IRQs are disabled for the
	 * entirety of the sched_out critical section, i.e. the wakeup handler
	 * can't run while the scheduler locks are held.
	 */
	raw_spin_lock_nested(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu),
			     PI_LOCK_SCHED_OUT);
	list_add_tail(&vcpu->pi_wakeup_list,
		      &per_cpu(wakeup_vcpus_on_cpu, vcpu->cpu));
	raw_spin_unlock(&per_cpu(wakeup_vcpus_on_cpu_lock, vcpu->cpu));
}

> We have following two options:
> 
> Option A:
> Adding a new x86_ops
> 
> avic_update_iommu_vcpu_affinity
> 	kvm_pi_enable_wakeup_handler
> 		list handling
> 		kvm_x86_callback(configure_pi)
> 			IOMMU callbacks
> 
> 
> The new x86_ops makes sure that irte and pi descriptor are configured
> correctly.
> 
> Option B:
> Common list handling
> 
> The svm and vmx will share function for list handling but IRTE/PI setup
> code will remain same.
> 
> avic_update_iommu_vcpu_affinity/pi_enable_wakeup_handler
> 	kvm_add_to_wakeup_list
> 		list handling
> 	IOMMU callbacks

Definitely option B.
