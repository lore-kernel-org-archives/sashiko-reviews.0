Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731091;
	b=Eo52X9A1SOWTWLhXgNxtO+JBXndhqvvLC4GjxT5mO5zRvdKEPBsu58GN9PA++FocBWLr
	 LUbvqndyQUmPRiUS07bq/ZrCpgh8S6TvA50OPdy5eUySINBKq/N3GJp8dd+uKmIQ2/vdA
	 ka7Elg135GVIXQ10AHuo8cyWesEQ/kN1Tyzaq44mBioHN71S9t7EPGtyojKZi93mXXrhk
	 RFzXk1HypNCnZbSxh+K3ntud8KitpOExBv41K5wBZk8zidU2CWPZnsNGymXg/ra7TwrJ+
	 P6zDJlWnPUUOyhAi24K33QjCDFD/66dE2NQK61V4pDqa0MpzLTezWntTnMX7rHZnAwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type:Content-Transfer-Encoding;
	bh=CGbm9EJEB5hNXXRNfY8Hb9YZuJsenYM7BZIV4eVSx/k=;
	b=1GnKJtd3ir8kGBiY+mm5TF9FPRuhvPp9zNVeibUMRVKGLty3pKqj3kjHIeTcAnwbQYrR
	 uqix+LSh7Q34sJbBqhyrO3VC5IiaJv86/bITQMqNR0gta535TZ1JQaZr7PEEAbGSlpjv0
	 LQ2R8J3t6xJNEpmcsAPYol/7zTgpZgzGoDe4Xg6tExt9uj/yLSo/kQBpiyVZ04VrsTyKf
	 CUmYX8k2RVerc18dyv4NHRl2E6SZQdqyYpbE3gBiqF+zUfAUZyx8dzwb6pEh5EE9tUZdc
	 uSEswRrI10Uzccto93TM5xcEGxo83CESSESsbZfxenN4+LGNtrKge8kKAziCsr4e3LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NtJ4tyae;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7E7606A330
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 18:38:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA7E7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NtJ4tyae
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso5567636eec.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 10:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731090; x=1794335890; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CGbm9EJEB5hNXXRNfY8Hb9YZuJsenYM7BZIV4eVSx/k=;
        b=NtJ4tyaeenBhCqXJ4eJYb/piSdVaoDbonBSq7BWULnKVIZ6kbEwS6wp/Jlw/DEKD4D
         jK1GwJZSaVAgpVdsv6xT87l5uIWxzRM571zXeq7bsW/BVhstQsJDVraa3oZehmdGNW+9
         lScNbU+7D0L9JRKPukNqBZVFaltgr377w0AnB8bw8Iy3vZayLgfDcb/yBwGk2SWg5d5d
         +u87C/aTw7pw7JRae6ETlEzi/7ZapRxi38lGMEv9kd6qTEINwE+NrYy1dnU7x+ssLCkB
         HRBfUMvRmNKwrCu9UzzyphftitnHuR3Rvx4FrxAnOF31Mn23G/79zKEQWvIM4LZaodYH
         wcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731090; x=1794335890;
        h=content-transfer-encoding:content-type:mime-version:references
         :message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CGbm9EJEB5hNXXRNfY8Hb9YZuJsenYM7BZIV4eVSx/k=;
        b=21YdH12W0niArdJsRIC9PSFRB9jajXMA6Yc8zGxxnNGivKZsg0K3un8IMNEo4ZCeGN
         lJfz5FgM5872TmXgl0VLgrPODASr+twF8MsFahOxV52OgqFpSlfoGY+uUzi0sJ7ixUEo
         qaqfID1VLEd333zzL1DdiX935qoDzX20KYR0AP6oHlLer+j0FG7wVlOdRCAlExh3qglV
         GHShP6GrqPjb0I45rxUvJheZKu+pk5FoNm6uNWo/d/3eO5duZclqU3KoHngxl2odGCUc
         spC/PNoFOSWB4H6sFX14w4K6BmLCmhPYSTGkDXXdLmCZvQytj/9auxKxMUnF9CaBF8KS
         3FnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOKNZ3CsVHxi9SD9N+dh3CQqmHu3uEFJLCpgHw0PfNk3QkBSix2D0XC/MS1cJV9HD2MctzQ3fzxNmDl7YB8Ug=@lists.linux.dev
X-Gm-Message-State: APuU4Z9lY4bDEHGgijwfagMG6kFuauJcrzmjXzWOtJCMObIBM1FcUnWU
	BQGd36kn1Ntxiq2kKaO+cQx59JACwqKoFYlbGC15uhJGrsouZ9O0Ktox
X-Gm-Gg: AYBFou2kXusvW7WJQtZZxuZLP8WrhIAKB+3SYLGGa6WEp03aU7X66WX5f4xrMdQL2j2
	54K1WISMqiYG/jBcxAcmYkxr1sJ9PHz/aNfEQzuUpK6TsAl22TGr22xureSFIB4UN1zfY0MQW7t
	sWdqiDc9Rb5iWll2UHe5uvkBqPhVmLHsCFcCJ08a56HdcP/3fAtKcqOtYRIWP0noG6C0R1OuqVe
	kfrMUNxq5Q/gwy1xSY6d0HXuNF75+SanmGri5vkzkXjuZB/Isod4Ob1EFjw6Ty0Q2J1Vxjh3Gba
	h81IWAvdJ04jQLQZ7OZ51Yzv/Ec3Qk8ZAbU1FJ4Tex9V+R3YcSseXbJGL14ilASd9txHjTX4tp9
	XZN+eSccELe01NpWXWzeYyWCGNJN3Hyko1JPMimnfdosvCo3u96gOmrs/WTnsMcMpQMIIDTIy0i
	Sw1McPCJU0FNsbiyO9HrCGu0tP6z3Pi36ujDQJxwgMzLRlrDGXMsDnx9HYk24qG6v+h2XHZEKeG
	A32b0YpCqHzTpHvCe03sN8BJu2U7BqcDLPFkOczrt2HojgYAqpGHB+UPzFAKMy+q7XOTpv/K/vH
	LgMbrEZR8hrN2XSQYeRSkMq8mXM=
X-Received: by 2002:a05:693c:4153:20b0:358:8f02:e0ca with SMTP id 5a478bee46e88-36a4236903fmr21434174eec.9.1793731089637;
        Tue, 03 Nov 2026 10:38:09 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm58473902eec.25.2026.11.03.10.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:38:08 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 12/23] KVM: Destroy memslots immediately after mmu_notifiers are unregistered
In-Reply-To: <auitWWkOopYYbBH3@google.com>
Date: Tue, 03 Nov 2026 23:38:34 +0530
Message-ID: <se1h6b4t.ritesh.list@gmail.com>
References: <20261030212112.2598640-1-seanjc@google.com> <20261030212112.2598640-13-seanjc@google.com> <sashiko-outbox-191627@kernel.org> <auitWWkOopYYbBH3@google.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Sean Christopherson <seanjc@google.com> writes:

> +Gautam and PPC lists/maintainers
>
> On Fri, Oct 30, 2026, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] KVM: PPC: Book3S HV: rmap_nested memory leak in kvmhv_release_all_nested()
>> --
>> 
>> commit 9c25a1b4a76e8526eb8a2b11e1b9e63893b0de80
>> Author: Sean Christopherson <seanjc@google.com>
>> 
>> KVM: Destroy memslots immediately after mmu_notifiers are unregistered
>> 
>> This commit replaces active memslots with an empty memslot set and frees all
>> memslots immediately after unregistering the MMU notifier in kvm_destroy_vm(),
>> prior to calling kvm_arch_destroy_vm().
>> 
>> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
>> > index fa548b12228ff..2eda12a52bf4b 100644
>> > --- a/virt/kvm/kvm_main.c
>> > +++ b/virt/kvm/kvm_main.c
>> 
>> [ ... ]
>> 
>> > @@ -1310,12 +1329,10 @@ static void kvm_destroy_vm(struct kvm *kvm)
>> >  		kvm->mn_active_invalidate_count = 0;
>> >  	else
>> >  		WARN_ON(kvm->mmu_invalidate_in_progress);
>> > +	kvm_destroy_memslots(kvm);
>> > +
>> >  	kvm_arch_destroy_vm(kvm);
>> >  	kvm_destroy_devices(kvm);
>> > -	for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
>> > -		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
>> > -		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
>> > -	}
>> 
>> [Severity: Medium]
>> Does hoisting kvm_destroy_memslots() above kvm_arch_destroy_vm() leak
>> struct rmap_nested allocations in slot->arch.rmap on PowerPC Book3S HV when
>> destroying a VM with nested virtualization enabled?
>
> I don't think so?  Patch 3[*], "KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()",
> should free the rmaps in response to kvm_arch_flush_shadow_all().   From what I
> can tell, the page tables have to be in radix mode, and so the rmaps are freed via:
>
>   kvmppc_radix_flush_memslot()
>   |
>   -> kvmppc_unmap_pte()
>      |
>      -> kvmhv_remove_nest_rmap_range()
>         |
>         -> kvmhv_remove_nest_rmap_list()
>

That's correct. Maybe, I think Sashiko didn't consider patch-3 of the series
during review of this patch-12.

> And if that doesn't work, it means memslot deletion on an active VM is completely
> broken.
>
> However, it means the memslot code in kvmhv_release_all_nested() is
> dead code,

Not really. I do see a caller of this, for when we switch from radix
to HPT. So we still need it.

INCOMING CALLS
- f kvmhv_release_all_nested
  - f kvmppc_switch_mmu_to_hpt    [arch/powerpc/kvm/book3s_hv.c:5591]
    + f kvmppc_alloc_reset_hpt    [arch/powerpc/kvm/book3s_64_mmu_hv.c:144]
    + f kvmhv_configure_mmu       [arch/powerpc/kvm/book3s_hv.c:6330]
  + f kvmppc_core_destroy_vm_hv   [arch/powerpc/kvm/book3s_hv.c:5930]



So FWIW patch-12 as such looks good to me from PowerPC perspective,
since those rmap entries will get freed up as part of the
mmu_notifier_unregister() (after patch-3). Agreed that Sashiko
comment does not look correct.

Thanks for looking into this.

-ritesh


> so this as follow-up to patch 3?  Or maybe folded in?
>
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index a6ff42d7666c..27985210f972 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -802,8 +802,6 @@ void kvmhv_release_all_nested(struct kvm *kvm)
>  	int lpid;
>  	struct kvm_nested_guest *gp;
>  	struct kvm_nested_guest *freelist = NULL;
> -	struct kvm_memory_slot *memslot;
> -	int srcu_idx, bkt;
>  
>  	spin_lock(&kvm->mmu_lock);
>  	idr_for_each_entry(&kvm->arch.kvm_nested_guest_idr, gp, lpid) {
> @@ -820,11 +818,6 @@ void kvmhv_release_all_nested(struct kvm *kvm)
>  		freelist = gp->next;
>  		kvmhv_release_nested(gp);
>  	}
> -
> -	srcu_idx = srcu_read_lock(&kvm->srcu);
> -	kvm_for_each_memslot(memslot, bkt, kvm_memslots(kvm))
> -		kvmhv_free_memslot_nest_rmap(memslot);
> -	srcu_read_unlock(&kvm->srcu, srcu_idx);
>  }
>  
>  /* caller must hold gp->tlb_lock */
> 			
>
> [*] https://lore.kernel.org/all/20261030212112.2598640-4-seanjc@google.com
>
>> In virt/kvm/kvm_main.c, kvm_destroy_memslots() replaces kvm->memslots[i]
>> with kvm_empty_memslots and frees each memslot via
>> kvm_free_memslot() -> kvm_arch_free_memslot() -> kvmppc_core_free_memslot_hv()
>> in arch/powerpc/kvm/book3s_hv.c:
>> 
>>     static void kvmppc_core_free_memslot_hv(struct kvm_memory_slot *slot)
>>     {
>>             vfree(slot->arch.rmap);
>>             slot->arch.rmap = NULL;
>>     }
>> 
>> which frees the slot->arch.rmap array without freeing the linked
>> struct rmap_nested entries.
>> 
>> Previously, those entries were freed before memslot destruction via
>> kvm_arch_destroy_vm() -> kvmppc_core_destroy_vm_hv() ->
>> kvmhv_release_all_nested() in arch/powerpc/kvm/book3s_hv_nested.c:
>> 
>>     srcu_idx = srcu_read_lock(&kvm->srcu);
>>     kvm_for_each_memslot(memslot, bkt, kvm_memslots(kvm))
>>             kvmhv_free_memslot_nest_rmap(memslot);
>>     srcu_read_unlock(&kvm->srcu, srcu_idx);
>> 
>> With kvm_destroy_memslots() running before kvm_arch_destroy_vm(),
>> kvm_memslots(kvm) now returns kvm_empty_memslots and the memslots have
>> already been freed when kvmhv_release_all_nested() runs, so
>> kvmhv_free_memslot_nest_rmap() is never called. Any struct rmap_nested
>> entries remaining in slot->arch.rmap at teardown (for example, when
>> KVMPPC_SECURE_INIT_DONE causes kvmppc_radix_flush_memslot() to return early,
>> or when 4KB PTEs were replaced by a huge page in kvmppc_unmap_free_pte())
>> will be leaked.
>> 
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20261030212112.2598640-1-seanjc@google.com?part=12
>> 
