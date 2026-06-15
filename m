Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589F821D596
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781545637; cv=none; b=q8bYBZSnbSd4rxZRkCXZDRbIWgQaQBj+efB6t6D0qRfScLUGlq+GN3dLwP2Mz/GY5hA9KHfrXERkpcRhJFXwJN5kQ4zNs8sigPCZ3Qwb7KFLGCmaYHzA2x7BFPtLcfmfx0dhZHRGqhvup2ZVz6y8WR6MxLb2Nbux12vk7+NFycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781545637; c=relaxed/simple;
	bh=2wv4DrmR9rVmtjiewqbUMk/LFbbWJqr8zKExRv8iTCc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Arh0s1m2qZCo8J5Ut6qc2p1RdA1TCyk1eyFt2U40fy8ZjtaEQzJDJGRnFojRszqKGWtBTamPUV4FD5uwFhexTGEa6Hpc+naAOOIeES6MflCJebx0kZ2rEinYl5EwrMN4ubKvHkJlCByGg06Od7yEGx/nkF1Jo1mMbI3/058jN4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uEinF0BX; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uEinF0BX"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c85a366b61fso2136095a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 10:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781545636; x=1782150436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VDX/a34KwI6qjOxB+SOsUTAEqmtLSVOgiOVOtsI+2Y=;
        b=uEinF0BXF5RAdv50Z+o6i3ofrTKvUIhQEOQn6gntzyIC1GmFYC/fPprp+QJpq4HNUj
         ZCY7o59S6zNZ5Uojwjock9uA7ZMJcZHhN/EW68Q39FWFYcZ+txSriOZkXsZcLXRATEon
         i1nQsdmN1BE0qG5rurJFESw65KEZpyNuejaXbw1vACbliXYGpv0aV1dYUB/3gcSUbaPb
         4JI/sDR4uqoZIjzZ25ermS0rLukhwu3CCXI55LiZWLTAKIdLkMcSHQ2aByevIvYieM66
         N9QfACGB4zZKFoTTIoshAaWZGrpANlj6N+niKqprcWOJTElFtQ/vXtlEhJpvicHpz7JR
         TnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781545636; x=1782150436;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+VDX/a34KwI6qjOxB+SOsUTAEqmtLSVOgiOVOtsI+2Y=;
        b=WaYz5HG781P1c/1pmkAvc5RE1Fry2WlXOOFih4xEwZMZFMpj3cRgj4VFH82vx89Wqn
         N3XCgKEVP9DUg/2P2oeiTP4VRSHXUv7iOPrnBLNTefnNMIWtrnW+4sDz0kSRxq8523rx
         ilb5iUi7XSc6YeQ/wL6VNwo28ctPAkH8lQQbJo/jOad821UVikc+4y62SjVuX/rJ9C36
         6hc6nAmBQTGrut8ZsGjjo4WyDq5CoffzJxT1WCIZZ8gIFxJacju/objWKBKIwXfAhUfn
         l6TnqLh3qRcvpNDuZBiiT56/wvfigHCJQoB0xfHCz/jjcdb071X3/p4yoGwo0BNl3oiH
         KqZQ==
X-Gm-Message-State: AOJu0YzGRQTnEyGYjckHPFaAUSWcCPyAwYdtBNMYVT5/h6dR8z6HY3MF
	+ucV7TMZsIPNdIY8bOt6gWvd3Xd6YJKY28lSSZ/fK9Wvl01JDuni/ylujyxJke3lSJUxZ5+Y3ET
	uvDR38t9CLrBBoW3oQv5Z0hlJ1AZ5jJeX24TUOffC7IiQ3TNpNoNL8nc5Ld8LQPB0Vmiry1nxeX
	Zfgch4cQb1yapNZSING540SIMDoiVXM5vgVqRMnkVK/MuyTJxi
X-Received: from pgaf19.prod.google.com ([2002:a63:3813:0:b0:c80:2656:4e70])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3c89:b0:3b3:241f:66c6
 with SMTP id adf61e73a8af0-3b7e4cf86b3mr95295637.26.1781545635135; Mon, 15
 Jun 2026 10:47:15 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:47:14 -0700
In-Reply-To: <20260615160901.9A1A61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260615155244.183044-1-alexandru.elisei@arm.com> <20260615160901.9A1A61F000E9@smtp.kernel.org>
Message-ID: <ajA6ogaNiI3KDv5i@google.com>
Subject: Re: [RFC PATCH] KVM: Ignore MMU notifiers for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> [ ... ]
> > @@ -592,6 +592,10 @@ static __always_inline kvm_mn_ret_t kvm_handle_hva=
_range(struct kvm *kvm,
> >  			unsigned long hva_start, hva_end;
> > =20
> >  			slot =3D container_of(node, struct kvm_memory_slot, hva_node[slots-=
>node_idx]);
> > +
> > +			if (kvm_slot_has_gmem(slot) && kvm_memslot_is_gmem_only(slot))
> > +				continue;
> > +
>=20
> [Severity: Critical]
> Does this change inadvertently introduce a regression in the pfncache ret=
ry
> protocol?
>=20
> Looking at the pfncache framework, it maps guest memory into kernel space=
 and
> explicitly drops the page reference after mapping it:
>=20
> virt/kvm/pfncache.c:hva_to_pfn_retry() {
>     ...
>     kvm_release_page_clean(page);
>     ...
> }
>=20
> It appears to rely entirely on KVM's MMU notifiers (kvm->mmu_invalidate_s=
eq)
> to invalidate the cache when the page is unmapped by the host.
>=20
> If a VMM defines a guest_memfd-backed memslot with KVM_MEMSLOT_GMEM_ONLY
> but still provides a valid anonymous user mapping as its userspace_addr,
> could this regression lead to a use-after-free?

Sadly, yes.  To land this, we would need to first teach the gfn_to_pfn_cach=
e code
to be able to pull directly from guest_memfd.  I forget if anyone is workin=
g on
that.

> By unmapping the anonymous memory, the host would trigger MMU notifiers, =
but
> this new check skips the memslot. As a result, kvm->mmu_invalidate_seq
> wouldn't increment, and KVM might retain a kernel mapping to a freed phys=
ical
> page.
>=20
> Could this allow the guest to read or write arbitrary host physical memor=
y?
>=20
> >  			hva_start =3D max_t(unsigned long, range->start, slot->userspace_ad=
dr);
> >  			hva_end =3D min_t(unsigned long, range->end,
> >  					slot->userspace_addr + (slot->npages << PAGE_SHIFT));
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615155244.18=
3044-1-alexandru.elisei@arm.com?part=3D1
