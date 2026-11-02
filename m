Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633628;
	b=hHH+mf+itHm0MES5Jdk3pkQ3xOyx0KP9L1js+bKqFu5ubF4N1xurckjsJbZwHulHXq35
	 VmerqQCFr5Y5W/AiYU7HU4dFdI7YT/lC7VmfeTy/xAXVFcNQIqprU8eYMXwaCnf9BclSY
	 v7Y+WinUG/4/bDQ25cMFYBkN1Grns4xNtBlgzFeFB329FVE9WYLpzJ3ifWGWsjYxJHoH/
	 do3zFH4v8W8LU1FqTEGeAa3e4B6OoMPz9ZTQ8tH7DHHp5HaXarK4PSJa3JXb2mp1nWbGw
	 x39eKl7sQhWg99YOlri5W+3Ah3Baw2ThoFzXbRdLwpRyjx6d7FeVYt+nT03K9vBkQmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=TUC01fxFkyGA6yFwHL7rirhUUtJ+C7CbbSnK6VkA0MA=;
	b=QsUSt8+oy39Kac0SlghKxMf8yCbWWQH2j5SQ7D6OEJ/PMFrSs2wDukpK4m61p7qFanEL
	 WzKfUwqLlhhsk7Zn9Mciq5vWwvuvni5nmOqd8VOhS/oIUmNlrCnjc0EW+WnoWGed1f3tH
	 bayjlTC5GxFqnrVyp0FqvJE0bA6NqLT0/y0BN6Ds9wb8RTw/8xd87MdscE/3fHMjq/Eyc
	 tlo7WNrNtkZbGQhV1CFjnkJLf9pF7AzU83JXL0Vzl3Pc9gq487ByZFBuC8SNATUFu6nZI
	 Vqm12jfkvLx+TwLav/Uw7+PN8G/ALtjpE0nwWCXW0qAYKibYWKCQD60lWag+iBbP6lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qFIXkK6W;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2165609FD9A
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 15:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2165609FD9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=qFIXkK6W
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e601800e58so51251705ad.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 07:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633627; x=1794238427; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TUC01fxFkyGA6yFwHL7rirhUUtJ+C7CbbSnK6VkA0MA=;
        b=qFIXkK6WWNyJpn9mU6LRqRK2qTAkvz+t7OHdQ6c7r8+kqc8RIxX0JLtJGodbw77Akm
         ML4N80VN0kcTNEUO3nYYjgYTKtky9bg3HUaedJsrnfERSSaNjkYw+qrDcF6AlxnnucxE
         aagVvqTkXjAFcoRDsK6nSruMjLh8UfNk27bvHjD/xtViuxW3sr6nyrp4TJ8192Cy5qv1
         BijV0zbTrqI+PXyViPMc6qNRfcDy+wiGaPPcJv9MGdtV0XMGukUkN6sf4Yn9SzXWHE3Y
         DkGZ6FmllVXi3Ci3Z/C2zxRnBzqXTfsOqOX1hZDfJXq4od/yKbluqRAoT/MSswCESSX2
         ek/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633627; x=1794238427;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUC01fxFkyGA6yFwHL7rirhUUtJ+C7CbbSnK6VkA0MA=;
        b=AnKCrM2NwJ1JaxHx18hdHs0/vcdPjmD8X3EKg5XwjUsOSfPnNE1i1kI1ZYWZqnl+fl
         TIxylqFDI8b13yB47YFEjU6hm+OgEx4oxlC7OyDqRwy9aR08tEX0oFJP5Jfn0qIq8nIi
         HcoRlmMUROMug4GOiPhVSzs1AuFKFiVcM49D/yvc9u7IDdu/7HyjRjM2h8D3u0FtQw7P
         TkmbeRkJLzkuqr5cyEXmlgRH58EkfXz9pxH6I3NPh2Aal9+otqZzU5x9WISZ0bVH41Aq
         BXtgVlzTCkFcB7Fam1BZajtjn8SYtlXd4/8fD7XgDV/vcVSf7o5KGVXbAlp0qDXgurBU
         e8Ew==
X-Gm-Message-State: APuU4Z+BisZegQLQZbqCRHo/dYc68m4thD61GE3O06Rr4AgFuK/R9XMB
	VN0dzJo5aFjhrbo+c1CLTZLMQJMj881u+m8HMwbVKAU+XRY6lrHUaKXLFHJwsrftnQux5wRPc0H
	uYujxNzples3fBuiVoXcnNLjijFKKIhYSlV1CjuDfkgSGx4gYhYX87ybcAe9MmtcT5rhRXuG9SV
	gwVX5Nd3etSCwnXinzKrl6ehk1rO20qXSgrlYxHP0cxMaefWCj
X-Received: from plgv20.prod.google.com ([2002:a17:902:e8d4:b0:2ea:3bc:770d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:24b:b0:2e9:776f:66b4
 with SMTP id d9443c01a7336-2eb364f6eafmr93325065ad.44.1793633625745; Mon, 02
 Nov 2026 07:33:45 -0800 (PST)
Date: Mon, 2 Nov 2026 07:33:45 -0800
In-Reply-To: <sashiko-outbox-191627@kernel.org>
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
 <sashiko-outbox-191627@kernel.org>
Message-ID: <auitWWkOopYYbBH3@google.com>
Subject: Re: [PATCH v4 12/23] KVM: Destroy memslots immediately after
 mmu_notifiers are unregistered
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Gautam Menghani <gautam@linux.ibm.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

+Gautam and PPC lists/maintainers

On Fri, Oct 30, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] KVM: PPC: Book3S HV: rmap_nested memory leak in kvmhv_release_=
all_nested()
> --
>=20
> commit 9c25a1b4a76e8526eb8a2b11e1b9e63893b0de80
> Author: Sean Christopherson <seanjc@google.com>
>=20
> KVM: Destroy memslots immediately after mmu_notifiers are unregistered
>=20
> This commit replaces active memslots with an empty memslot set and frees =
all
> memslots immediately after unregistering the MMU notifier in kvm_destroy_=
vm(),
> prior to calling kvm_arch_destroy_vm().
>=20
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index fa548b12228ff..2eda12a52bf4b 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
>=20
> [ ... ]
>=20
> > @@ -1310,12 +1329,10 @@ static void kvm_destroy_vm(struct kvm *kvm)
> >  		kvm->mn_active_invalidate_count =3D 0;
> >  	else
> >  		WARN_ON(kvm->mmu_invalidate_in_progress);
> > +	kvm_destroy_memslots(kvm);
> > +
> >  	kvm_arch_destroy_vm(kvm);
> >  	kvm_destroy_devices(kvm);
> > -	for (i =3D 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
> > -		kvm_free_memslots(kvm, &kvm->__memslots[i][0]);
> > -		kvm_free_memslots(kvm, &kvm->__memslots[i][1]);
> > -	}
>=20
> [Severity: Medium]
> Does hoisting kvm_destroy_memslots() above kvm_arch_destroy_vm() leak
> struct rmap_nested allocations in slot->arch.rmap on PowerPC Book3S HV wh=
en
> destroying a VM with nested virtualization enabled?

I don't think so?  Patch 3[*], "KVM: PPC: Flush/zap all memslots on kvm_arc=
h_flush_shadow_all()",
should free the rmaps in response to kvm_arch_flush_shadow_all().   From wh=
at I
can tell, the page tables have to be in radix mode, and so the rmaps are fr=
eed via:

  kvmppc_radix_flush_memslot()
  |
  -> kvmppc_unmap_pte()
     |
     -> kvmhv_remove_nest_rmap_range()
        |
        -> kvmhv_remove_nest_rmap_list()

And if that doesn't work, it means memslot deletion on an active VM is comp=
letely
broken.

However, it means the memslot code in kvmhv_release_all_nested() is dead co=
de, so
this as follow-up to patch 3?  Or maybe folded in?

diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_=
hv_nested.c
index a6ff42d7666c..27985210f972 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -802,8 +802,6 @@ void kvmhv_release_all_nested(struct kvm *kvm)
 	int lpid;
 	struct kvm_nested_guest *gp;
 	struct kvm_nested_guest *freelist =3D NULL;
-	struct kvm_memory_slot *memslot;
-	int srcu_idx, bkt;
=20
 	spin_lock(&kvm->mmu_lock);
 	idr_for_each_entry(&kvm->arch.kvm_nested_guest_idr, gp, lpid) {
@@ -820,11 +818,6 @@ void kvmhv_release_all_nested(struct kvm *kvm)
 		freelist =3D gp->next;
 		kvmhv_release_nested(gp);
 	}
-
-	srcu_idx =3D srcu_read_lock(&kvm->srcu);
-	kvm_for_each_memslot(memslot, bkt, kvm_memslots(kvm))
-		kvmhv_free_memslot_nest_rmap(memslot);
-	srcu_read_unlock(&kvm->srcu, srcu_idx);
 }
=20
 /* caller must hold gp->tlb_lock */
		=09

[*] https://lore.kernel.org/all/20261030212112.2598640-4-seanjc@google.com

> In virt/kvm/kvm_main.c, kvm_destroy_memslots() replaces kvm->memslots[i]
> with kvm_empty_memslots and frees each memslot via
> kvm_free_memslot() -> kvm_arch_free_memslot() -> kvmppc_core_free_memslot=
_hv()
> in arch/powerpc/kvm/book3s_hv.c:
>=20
>     static void kvmppc_core_free_memslot_hv(struct kvm_memory_slot *slot)
>     {
>             vfree(slot->arch.rmap);
>             slot->arch.rmap =3D NULL;
>     }
>=20
> which frees the slot->arch.rmap array without freeing the linked
> struct rmap_nested entries.
>=20
> Previously, those entries were freed before memslot destruction via
> kvm_arch_destroy_vm() -> kvmppc_core_destroy_vm_hv() ->
> kvmhv_release_all_nested() in arch/powerpc/kvm/book3s_hv_nested.c:
>=20
>     srcu_idx =3D srcu_read_lock(&kvm->srcu);
>     kvm_for_each_memslot(memslot, bkt, kvm_memslots(kvm))
>             kvmhv_free_memslot_nest_rmap(memslot);
>     srcu_read_unlock(&kvm->srcu, srcu_idx);
>=20
> With kvm_destroy_memslots() running before kvm_arch_destroy_vm(),
> kvm_memslots(kvm) now returns kvm_empty_memslots and the memslots have
> already been freed when kvmhv_release_all_nested() runs, so
> kvmhv_free_memslot_nest_rmap() is never called. Any struct rmap_nested
> entries remaining in slot->arch.rmap at teardown (for example, when
> KVMPPC_SECURE_INIT_DONE causes kvmppc_radix_flush_memslot() to return ear=
ly,
> or when 4KB PTEs were replaced by a huge page in kvmppc_unmap_free_pte())
> will be leaked.
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030212112.25=
98640-1-seanjc@google.com?part=3D12
>=20
