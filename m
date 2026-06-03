Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF84C35676D
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 11:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780487282; cv=none; b=XZ5faz++SHy02fqdS1oZsgmYs/UIbXkMmVzcIY/mUrPmmfZtrnmV5lokDxgETqNbrfzgSyvHJCp0LI649GZnQ+Bsl37IT2hDz/m/0+NHvhylSvo1d8Z5jLG0zvGYKTPJ3/ZwCx5UP7otFGVAJpUrvVd0epkv0MbkXmL8lCRN1zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780487282; c=relaxed/simple;
	bh=lKbj8Fii4ZKlUX/jvOQQ5A0Tevxh3L1P/3qq5zYe1xw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3PWNE9CsYHDAL21/5r+/mSwGl8gHUKlf/baAqDrNsy/LRm8O7rpAUPArWWFBkoIU4Awv9E7QRJk8Vp3nrC72Hei8mcn5SeBu+jLI3lW7kv6aNleBExS+76AeqTX/zk1UndvJL/WE4WGh5wJDuQwRw9zEbpeqbDnGV073Yy8yC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c6PSzyiR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c6PSzyiR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780487280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cyOLuzmjCrrVWycF+vR1+0ZMAWknGnaLw9YihpoorQQ=;
	b=c6PSzyiRTYdVL4NcEIASblkMYY/kNuuWxNxan/fjWoeODy9rcxJ2xxzATy+I0uMaoyvu2L
	6vh587Mfpw9lrWuXnssvupxJoPwgmsBOQaZn9l9X18+QuvP6nxGC2h9ajDzRSRXFaSewmu
	NTBrLT/nLQR9Xlal7SosZrtDhFnHM2U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-Yt5oQkyPMM-9Dr2jTj9cqg-1; Wed, 03 Jun 2026 07:47:58 -0400
X-MC-Unique: Yt5oQkyPMM-9Dr2jTj9cqg-1
X-Mimecast-MFC-AGG-ID: Yt5oQkyPMM-9Dr2jTj9cqg_1780487277
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490b9318944so4310635e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 04:47:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487277; x=1781092077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cyOLuzmjCrrVWycF+vR1+0ZMAWknGnaLw9YihpoorQQ=;
        b=SHAt9oLlqiAD+2I0aBxbFR5ezVhTj3upBZNKxscl/BClxUGT5FjBNCefKKgbgmKEMj
         MsoZxqFU8VluymH2yzJRAY0ieWeoOgkd30c/4ViQYUfPaKwf4jdw92p0ash0QPb+x1Kh
         6B+ernEgw3QaEQi707p8HfJoUnzohP/ECtTp4YTwhdpeJa8nVtby76fOY0YPlfLoEWiT
         ZgPDZEESgQ5OK3XOBAJ3rHRd7vVZmKXDkTnQ4Rl2C1aX2I4wK5Sn4Y32yBa1zQ0At4S9
         0hnJdoEJvjvnk5aDhAaJ+IgEx/tHArRFRlIo6lRuzPap/+WiPpA0ymk+mxL3c5XAt7tg
         hX1w==
X-Gm-Message-State: AOJu0Yz4+9iYVeh2O+Ab8cCwCoqCd3w92y49Yszd5iSYuHNNuGtK5A9v
	NPu5hiNvhMwDEMRlenS6BRCdZJ3T7KjlzXhQBL5AA0rWDYnBqki6WjCvr5TNbjVnfLrIpLuzwJb
	6L1OtjBwd+PsAvmQ97VtKn92wxqyGqKnoUbFLjXm6wsMr2tb9QgBuLcOdP8O+OTh9TelJ1CKSTM
	yMSOTKh013BfbwLw9dmstJadzjq+b8BWZRe/ck3gIiC9SrZd9kkss4WtQ=
X-Gm-Gg: Acq92OGXj4o2idJ/k9ymb+vesNqzyA/XWOA3ZkZybswpGbBooKchRyrpIUnQbnHd5u7
	BQQtbOA18UxX0QdRQMiMETV+/3FQcI7OVSZyz3n6HNimHMcKeej+UoLpkiePOdP2+wzTBJLUHaQ
	WjHXuST47ur22eyecekjlOAJWom0JH9NEA0ee6LviZ7gMHNlGnxw5fAYR5RQ7akhWmmB2mNTs3A
	nmlBJfsjQlk2gvMPlZ6YUN/aZUjc+CTgmJGAWDb3SDi3LUhjqKX/WItTWULF1vJr4vi1IvVe55L
	rECfyP678MVGFaE6
X-Received: by 2002:a05:600c:5288:b0:490:5191:6e26 with SMTP id 5b1f17b1804b1-490b5ecbd41mr49759825e9.18.1780487277400;
        Wed, 03 Jun 2026 04:47:57 -0700 (PDT)
X-Received: by 2002:a05:600c:5288:b0:490:5191:6e26 with SMTP id
 5b1f17b1804b1-490b5ecbd41mr49759325e9.18.1780487276971; Wed, 03 Jun 2026
 04:47:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603105814.10236-19-pbonzini@redhat.com> <20260603112429.6E35F1F00898@smtp.kernel.org>
In-Reply-To: <20260603112429.6E35F1F00898@smtp.kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 3 Jun 2026 13:47:45 +0200
X-Gm-Features: AVHnY4Idh32ugck1G4tYpwxpaM-xZAMObaLqn8RdAOKK9GLvIcRCH1mKGlKqAQs
Message-ID: <CABgObfZHeoJ2v7U8guw0jG+Cs=28iBAOJdT3OS_Uv0pOMvO8wA@mail.gmail.com>
Subject: Re: [PATCH 18/24] KVM: x86/mmu: make gva_walk a value
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x9uh2MJAcfuo-zmJ37oucYxTMnaH4CWfOLvkuCN4Tm8_1780487277
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 1:24=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >       /* It's actually a GPA for vcpu->arch.guest_mmu.  */
> > -     if (w !=3D &vcpu->arch.guest_mmu.w) {
> > +     if (w =3D=3D &vcpu->arch.gva_walk) {
> >               /* INVLPG on a non-canonical address is a NOP according t=
o the SDM.  */
> >               if (is_noncanonical_invlpg_address(addr, vcpu))
> >                       return;
> >
> >               kvm_x86_call(flush_tlb_gva)(vcpu, addr);
> > -             if (w =3D=3D &vcpu->arch.ngva_walk)
> > +
> > +             if (tdp_enabled)
> >                       return;
> > +
> > +             mmu =3D &vcpu->arch.root_mmu;
> > +     } else {
> > +             mmu =3D &vcpu->arch.guest_mmu;
> >       }
>
> [Severity: High]
> If kvm_mmu_invalidate_addr() is called with w pointing to
> &vcpu->arch.root_mmu.w, this pointer check will fail and fall through to =
the
> else block, assigning mmu =3D &vcpu->arch.guest_mmu.
>
> Since guest_mmu is inactive when not nested, mmu->sync_spte would be NULL=
,
> causing an early return. Does this silently skip both the hardware TLB fl=
ush
> and the root_mmu shadow page invalidation, potentially creating an infini=
te
> page fault loop?
>
> I noticed this behavior can be triggered due to the changes in paging_tmp=
l.h
> and x86.c, which I've commented on below. I also see this is fixed later =
in
> the series by commit 9a1a629159ef9003 ("KVM: x86/mmu: pull struct
> kvm_pagewalk out of struct kvm_mmu"), but it seems this intermediate comm=
it
> breaks bisection.

Hmm, this seems correct. It's relatively easily solved by swapping
this commit and the next.

Paolo

