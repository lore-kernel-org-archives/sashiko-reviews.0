Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793635695;
	b=XGvXAPHREBR+tLwmMG2hzKdbB+25cLHasUSnZODxDVph8yFNomU/K+GeytAOrgP7QKoS
	 vOR2LQrHBBTwU+Gdy04+4AtAqIhKQjR5AKNzJSNZblOd7dcSxD+2EhQgFo0sJyPCop19U
	 qU2dO1qUJWyJUXExE9wJXAX1Sw5HS0/NTKJQqTRkpLqeNcWEnc27rs+9RXqmwU/I9CWj1
	 vfCr8XWBEqC7SbjH//CJh/3PojtayMcVmsFMcS+nKzqDYyJE8zppqDh3gUIAxw/oZ3e5P
	 SaaDEoaxsr8ILGjnLyF/xY2l3TuiTvfYnuHX6RIPbkqZWhx9HJcKHk3yxqWEQwrLeIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793635695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=xnYP2kl3oXU+8Wscp7gvUSQVPhbXp/NrXcsdPdJbRyI=;
	b=wNymJX8vx9DzFamH/W/ygXyhIJb+R0BHQ9NMYmvCTC6MDMps+UvK5NHLY1s5oM8daQXt
	 5G1oIj1XTlm9NRPugXR27lMflFUktcctxo1tb5TD0KUqiT3Bp/sfBokCiL0qUhKTQvaN+
	 NJVKUaJTtdVwsY9JQaqpitquZ9UEn0cVjQerkwS/9C24oaJW76g9McakwwiFl8AMMqEIr
	 tltqSsb+FT9cZF3H2s78El38pUthjYeJWFWZrNhsa/yjar43JJETozhnBsIWSKNKOgYdz
	 dwRrP0tchCWGa0kGRVBV5ulW4jKpNtmoUaN/P2fvMvWvxsMCkZ6QwuLKeAxgCKuUvAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AJZnZcwo;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9E160703B2
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 16:08:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9E160703B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AJZnZcwo
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e987ec84afso27272665ad.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 08:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793635694; x=1794240494; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xnYP2kl3oXU+8Wscp7gvUSQVPhbXp/NrXcsdPdJbRyI=;
        b=AJZnZcwo+hAIfZsqGTC9IrsssWTiOvP2uIwEpkUqLi+mZAPhf6t/zpstq6zYmzBAVe
         h7McN4MZqkNYEzi/RwnU0kNzso0+CSzI6fqw0suO+Xv5qN+7b0f2CAvGWR+KNaEsxtQa
         HGdw/yTMRh8yRAM6IYSyUCV3XMueJTUVFbNJ3zo5mBY/D1qqwKumXGIlWqSTgP2a1Z1x
         Bzw0Syng/cvK+NE3+lPQfIu3XVANoPRwootrD6FX1yfcey0Sl/+4Ly0EgUjV7DQKdnP7
         cuDKTJxNNYso7odkS+FJaAAY5h5lpUXmYQF6Sb8mzBo+CrjMva356u/vf1qFv9rgPShR
         BoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793635694; x=1794240494;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnYP2kl3oXU+8Wscp7gvUSQVPhbXp/NrXcsdPdJbRyI=;
        b=PQfn8GxYCt31Rx26J9QeHBQ773JeJ4YjtX6CLQoU2H9fbw0SoCRJ8xbXQhLWoMzrCC
         728mnIxrM+vEOrf2fM4tfihbDZV1lmMAohSdu40IWcf6gP7HRCt3rEMoh1kyqIpp1l6U
         LghnyjL0OqsEVG66hhkv3vQ51nD8zfRLLTBZoTQ9eJsIRhTlZXSB2BAorRwYtVPRWaJn
         Cc6U856ViieHeQdcpK/Y/CBV6IPn+o57H8INT+3FqqDPSAQAbIxZSl5HwDbhgdqUpe2Q
         RmR48jX5svOglvMUk8ae3vqxo0HZrMBtRRsEGQUSHdjcLDo0eKtqaOLADOkvkQZaQTsC
         gb8w==
X-Gm-Message-State: APuU4Z9Qcf+vsCJzh4HYajAp2zt+Ih6cnS7mWwW2cuD8nlxRd0/GVBVu
	XKAvksCCwqBx/TNp03Bzk6H+77KBby0vjJE17Mt2scUX4psW5X+W20y0grlw9sYZ5b2CINC/G2K
	00lau3PpIwAQ9mv3IMffhoWygvOPHNoAY4epcxx5Uu5IUlDV9X97bkutr15tWKcIaidF6aFQSqv
	zAw03iS++YPuzAyvn/BzI3BlJ788r1rqXTGnS6B+68TWMKA/G4
X-Received: from pjbfh3.prod.google.com ([2002:a17:90b:343:b0:3ac:7545:d82e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b51:b0:39e:6795:f7da
 with SMTP id 98e67ed59e1d1-3ae897c7d22mr8880600a91.19.1793635693550; Mon, 02
 Nov 2026 08:08:13 -0800 (PST)
Date: Mon, 2 Nov 2026 08:08:12 -0800
In-Reply-To: <auitWWkOopYYbBH3@google.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com> <20261030212112.2598640-13-seanjc@google.com>
 <sashiko-outbox-191627@kernel.org> <auitWWkOopYYbBH3@google.com>
Message-ID: <aui1bOy-PwIgKOFk@google.com>
Subject: Re: [PATCH v4 12/23] KVM: Destroy memslots immediately after
 mmu_notifiers are unregistered
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	Ritesh Harjani <ritesh.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

+Ritesh as well

On Mon, Nov 02, 2026, Sean Christopherson wrote:
> +Gautam and PPC lists/maintainers
>=20
> On Fri, Oct 30, 2026, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Medium] KVM: PPC: Book3S HV: rmap_nested memory leak in kvmhv_releas=
e_all_nested()
> > --
> >=20
> > commit 9c25a1b4a76e8526eb8a2b11e1b9e63893b0de80
> > Author: Sean Christopherson <seanjc@google.com>
> >=20
> > KVM: Destroy memslots immediately after mmu_notifiers are unregistered
> >=20
> > This commit replaces active memslots with an empty memslot set and free=
s all
> > memslots immediately after unregistering the MMU notifier in kvm_destro=
y_vm(),
> > prior to calling kvm_arch_destroy_vm().
> >=20
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index fa548b12228ff..2eda12a52bf4b 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> >=20
> > [ ... ]
> >=20
> > > @@ -1310,12 +1329,10 @@ static void kvm_destroy_vm(struct kvm *kvm)
> > >  		kvm->mn_active_invalidate_count =3D 0;
> > >  	else
> > >  		WARN_ON(kvm->mmu_invalidate_in_progress);
> > > +	kvm_destroy_memslots(kvm);
> > > +
> > >  	kvm_arch_destroy_vm(kvm);
> > >  	kvm_destroy_devices(kvm);
> > > -	for (i =3D 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
> > > -		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
> > > -		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
> > > -	}
> >=20
> > [Severity: Medium]
> > Does hoisting kvm_destroy_memslots() above kvm_arch_destroy_vm() leak
> > struct rmap_nested allocations in slot->arch.rmap on PowerPC Book3S HV =
when
> > destroying a VM with nested virtualization enabled?
>=20
> I don't think so?  Patch 3[*], "KVM: PPC: Flush/zap all memslots on kvm_a=
rch_flush_shadow_all()",
> should free the rmaps in response to kvm_arch_flush_shadow_all().   From =
what I
> can tell, the page tables have to be in radix mode, and so the rmaps are =
freed via:
>=20
>   kvmppc_radix_flush_memslot()
>   |
>   -> kvmppc_unmap_pte()
>      |
>      -> kvmhv_remove_nest_rmap_range()
>         |
>         -> kvmhv_remove_nest_rmap_list()
>=20
> And if that doesn't work, it means memslot deletion on an active VM is co=
mpletely
> broken.
>=20
> However, it means the memslot code in kvmhv_release_all_nested() is dead =
code, so
> this as follow-up to patch 3?  Or maybe folded in?
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3=
s_hv_nested.c
> index a6ff42d7666c..27985210f972 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -802,8 +802,6 @@ void kvmhv_release_all_nested(struct kvm *kvm)
>  	int lpid;
>  	struct kvm_nested_guest *gp;
>  	struct kvm_nested_guest *freelist =3D NULL;
> -	struct kvm_memory_slot *memslot;
> -	int srcu_idx, bkt;
> =20
>  	spin_lock(&kvm->mmu_lock);
>  	idr_for_each_entry(&kvm->arch.kvm_nested_guest_idr, gp, lpid) {
> @@ -820,11 +818,6 @@ void kvmhv_release_all_nested(struct kvm *kvm)
>  		freelist =3D gp->next;
>  		kvmhv_release_nested(gp);
>  	}
> -
> -	srcu_idx =3D srcu_read_lock(&kvm->srcu);
> -	kvm_for_each_memslot(memslot, bkt, kvm_memslots(kvm))
> -		kvmhv_free_memslot_nest_rmap(memslot);
> -	srcu_read_unlock(&kvm->srcu, srcu_idx);
>  }
> =20
>  /* caller must hold gp->tlb_lock */
> 		=09
>=20
> [*] https://lore.kernel.org/all/20261030212112.2598640-4-seanjc@google.co=
m
>=20
> > In virt/kvm/kvm_main.c, kvm_destroy_memslots() replaces kvm->memslots[i=
]
> > with kvm_empty_memslots and frees each memslot via
> > kvm_free_memslot() -> kvm_arch_free_memslot() -> kvmppc_core_free_memsl=
ot_hv()
> > in arch/powerpc/kvm/book3s_hv.c:
> >=20
> >     static void kvmppc_core_free_memslot_hv(struct kvm_memory_slot *slo=
t)
> >     {
> >             vfree(slot->arch.rmap);
> >             slot->arch.rmap =3D NULL;
> >     }
> >=20
> > which frees the slot->arch.rmap array without freeing the linked
> > struct rmap_nested entries.
> >=20
> > Previously, those entries were freed before memslot destruction via
> > kvm_arch_destroy_vm() -> kvmppc_core_destroy_vm_hv() ->
> > kvmhv_release_all_nested() in arch/powerpc/kvm/book3s_hv_nested.c:
> >=20
> >     srcu_idx =3D srcu_read_lock(&kvm->srcu);
> >     kvm_for_each_memslot(memslot, bkt, kvm_memslots(kvm))
> >             kvmhv_free_memslot_nest_rmap(memslot);
> >     srcu_read_unlock(&kvm->srcu, srcu_idx);
> >=20
> > With kvm_destroy_memslots() running before kvm_arch_destroy_vm(),
> > kvm_memslots(kvm) now returns kvm_empty_memslots and the memslots have
> > already been freed when kvmhv_release_all_nested() runs, so
> > kvmhv_free_memslot_nest_rmap() is never called. Any struct rmap_nested
> > entries remaining in slot->arch.rmap at teardown (for example, when
> > KVMPPC_SECURE_INIT_DONE causes kvmppc_radix_flush_memslot() to return e=
arly,
> > or when 4KB PTEs were replaced by a huge page in kvmppc_unmap_free_pte(=
))
> > will be leaked.
> >=20
> > --=20
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030212112.=
2598640-1-seanjc@google.com?part=3D12
> >=20
>=20
