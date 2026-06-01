Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347EA2BDC32
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 16:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329780; cv=none; b=KNnOIEwedHt8VM1bpBCzjYlHvhrcSFoNAoyV3Dq12EPBoYca5sUYZb/7Jx0TPvcrIhjVvwnvtltQvWW2d3qPsEwAf20J7QYXU4OKx59ZUakruXA2xwU9DzgdBzWg1XgtOg1kUwr20jGr1iGGclod3yKHmjb21GyYHAAI7amSFjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329780; c=relaxed/simple;
	bh=r21VC/QO+Cm/jEoZLF9kBRN/xDqJx1mIkwsADo9V/kc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gfIK3i0TwTSOs1obyzdC1qHTJy0bRL1smqQKrr9Dl6WbGeJaFcIRxTr6V9utr6rVGDqKD94JUG4X9FtiSNq1bU2DIWRmR4xPSWlbBrPZEx6aPaHoj6579z33Qc6LY75sHD3S+O5gcLwTtrvbi3EFVXDqbP9pX15fb4ukwtgdj0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h0ilkgxp; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h0ilkgxp"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2bf0b7425bbso79042475ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 09:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780329778; x=1780934578; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7UFbuJuGr2mJB706k3sMJIDSg8zK0y7ivtbLm8CNu8=;
        b=h0ilkgxpSfmbardTp+r3Bagw8UBzLWoxFIPg1hsg++EXNqy6A0LXBNmsDMrAqSg6dn
         hNgZ+avVB6e2z2+aZbweC1VDlbaNLIwNg+rsMpajOsK/8vfzhX1dHFapoGdXaDAainYZ
         wxSdOD9kXNtGD3HX7B/qzXI1lwfgEkI5Fht+ihCYGH0yRDXvr1vPiL2LXDbofyifdvA0
         fkraiYAZ0ILjSBtFWAryjiFWnAADERhcjB4H6SxbjNC5vAkErSzPcR87uHJsjQINmwAJ
         Ory2eXT9VwlbzmA4lCo2tstpW8FxZCs7J37hdfd0f+2vCmbQKrxBPGDIZ+JbnPFD5pzZ
         RUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780329778; x=1780934578;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7UFbuJuGr2mJB706k3sMJIDSg8zK0y7ivtbLm8CNu8=;
        b=knVkgA9+TtlQDlYEWjgUYIz8K7brB1+Pt48yXpFpqVdm48YJ/FsShqqRbHs/Vs/EIC
         Z4+6ThMcR5GAzmDIs7xdcA27LDwAYEnNYUx34B9SbOAfjaBDC1cPFJejOqe3dTQETjY4
         EKApQB02bBYpXrGaYaanXUtJvNrS0dxK/1VnFlpNsvtqIP+/4LYzI1Sdor5AIH95NzHd
         3wji6Q/C36wxuiqHAHMVa1F5EjTUQmkPA4AKhaGP8nyO4fRRfefGpr8rKSd6pq7ZIbkr
         TpLOgbejikrA534bBvh95our7UgGEd88PDHo1SGWiUheTGzJtOYJCuugP+LzhhD9JFnm
         4RLQ==
X-Gm-Message-State: AOJu0Yx1Za/114EM/OWIGt717uWzMwMppRLEsd8T0ZDliQpxn1MhZTDh
	ETh+ULDzq6Rm6ifCEUlATfd2+l4PjDOyHwlHlZxnPeNH8vA9ZelgHe8W4K+vPK1yez6ZeZ69Koo
	ML0siJ40tzbBY0UOLcNXTbur0tWW5d8HX4kieVgb8golcbVwBDfVD+EAbjeIBHsqBUQCsWn06QA
	19VythT+CqVQ2newFCnNecZskXGz//tyRfmQTa0hS/u9IhCC05
X-Received: from plho10.prod.google.com ([2002:a17:903:23ca:b0:2be:3026:1d0f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:fc44:b0:2c0:a711:534
 with SMTP id d9443c01a7336-2c0a71111b4mr106190555ad.13.1780329777919; Mon, 01
 Jun 2026 09:02:57 -0700 (PDT)
Date: Mon, 1 Jun 2026 09:02:57 -0700
In-Reply-To: <20260530085043.927231F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529183549.1104619-17-pbonzini@redhat.com> <20260530085043.927231F00893@smtp.kernel.org>
Message-ID: <ah2tMbMLPNUQyXrE@google.com>
Subject: Re: [PATCH 16/24] KVM: SEV: Decouple the need to sync the GHCB SA
 from the need to free the SA
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, May 30, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index 437282f0ea943..11d46600cbdc0 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> > @@ -3560,20 +3560,17 @@ void sev_es_unmap_ghcb(struct vcpu_svm *svm)
> >  	if (!svm->sev_es.ghcb)
> >  		return;
> >  
> > -	if (svm->sev_es.ghcb_sa_free) {
> > -		/*
> > -		 * The scratch area lives outside the GHCB, so there is a
> > -		 * buffer that, depending on the operation performed, may
> > -		 * need to be synced, then freed.
> > -		 */
> > -		if (svm->sev_es.ghcb_sa_sync) {
> > -			kvm_write_guest(svm->vcpu.kvm,
> > -					svm->sev_es.sw_scratch,
> > -					svm->sev_es.ghcb_sa,
> > -					svm->sev_es.ghcb_sa_len);
> > -			svm->sev_es.ghcb_sa_sync = false;
> > -		}
> > +	/*
> > +	 * If the scratch area lives outside the GHCB, there's a buffer that,
> > +	 * depending on the operation performed, may need to be synced.
> > +	 */
> > +	if (svm->sev_es.ghcb_sa_sync) {
> > +		kvm_write_guest(svm->vcpu.kvm, svm->sev_es.sw_scratch,
> > +				svm->sev_es.ghcb_sa, svm->sev_es.ghcb_sa_len);
> > +		svm->sev_es.ghcb_sa_sync = false;
> > +	}
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but can this call to
> kvm_write_guest() trigger a warning

Yes.

> or cause silent guest memory corruption?

I suppose in theory, yes?

> In arch/x86/kvm/x86.c:vcpu_enter_guest(), KVM disables preemption before
> calling prepare_switch_to_guest():
> 
> 	preempt_disable();
> 
> 	kvm_x86_call(prepare_switch_to_guest)(vcpu);
> 
> For SEV-ES guests, this invokes svm_prepare_switch_to_guest() ->
> sev_es_unmap_ghcb(). Within sev_es_unmap_ghcb(), if svm->sev_es.ghcb_sa_sync is
> true, KVM calls kvm_write_guest().
> 
> Since kvm_write_guest() is a sleepable function and preemption is disabled,
> this could trigger a warning in might_fault(), potentially leading to a host
> denial of service if panic_on_warn is set.

LOL, yes, for all of those production environments that run with panic_on_warn=1,
CONFIG_DEBUG_ATOMIC_SLEEP=y, and a preemptible kernel model.

We (Google) have an internal patch that we've been carrying for a while, but it's
a hack.  It's basically:

	kvm_x86_call(prepare_switch_to_guest_early)(vcpu);

	preempt_disable();

	kvm_x86_call(prepare_switch_to_guest)(vcpu);

Given that the external scratch area is deprecated in v2, i.e. now that we know
it's not going to be a super common operation, I think the proper way to fix this
would be to have kvm_sev_es_mmio() and kvm_sev_es_{ins,outs}() sync and free the
buffer.
