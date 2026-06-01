Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463AA2D3ED1
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 16:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330695; cv=none; b=ZMs1DjaNDyyw0TVhY5rZ2rIVEnfPZOw8iICBMP4xdbfq+LoxRxEYvqPNhAI+G+Ca9EIdq7nGx+yh0aMXDz4OzFEIFo9CnAgEH3nZJZnUGeWP7EMjN/lUQhTgypNuEZHbBk/Z9eMUcoFd9LRUTU077EW+y8aMO3Vb9dTNZNoZohw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330695; c=relaxed/simple;
	bh=66rLSXQZ6sV2ExoP3kIQsj8deF5TsolFkL0qsgSbVe0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nv7i22a4z5Rrr0eBNcArsCv2yB44w6sGJMOgNdflBk9bUw6HGxPQLuTSXHwZ5EjqRwSrdC+TN/I7wcnTiNrss18GHCLcV1CZCpssReCAShLcte64k35VFrOm1d+ka3Y+yBFbyeTxSgqjgxKwxgJo3HOl/kGfe0ijpEbbVVhVkKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YkYpuIc/; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YkYpuIc/"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bf30576aa3so18526485ad.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 09:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780330694; x=1780935494; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NnCGGbI4RQKFz/qkCw166U8lw1qB/t/53dFCr4FY9AM=;
        b=YkYpuIc/2VOiMPl+uDXJfnID3yQs5BjuuQYmJn8bqSgoYcMtACAQo+YkSGAjpVjmuX
         345ioCm5BvO1054Mg9D2vuLs/OGmkraHb+P3BNYlkM384FcVuUhwgmBTien+UrS/Wyxo
         fH2w1bi+MEnB1gzqtWlCKYQqhmWvFlewnIZgcf7ju0mIA63Blv+/O45K510OEDOHReGm
         m3bmbyAc0FahkRepJxxtZiQ7GyTUjPD0aD4P5bTVxzh9V8gWaPRIeymExsJdDNpQwpAN
         GXmSvzk8uRxA4EefZPmju+EshMmkV/s1Ei2Emsb/CWA6xaQFoYNqTxTESM+A+8X23ijT
         wKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330694; x=1780935494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnCGGbI4RQKFz/qkCw166U8lw1qB/t/53dFCr4FY9AM=;
        b=Dj+/h+rniQfIsgsP1v/jpInsefL630CO1dfgaoRiLyezfIWvMUr2Ze7uj+UHPG8uNP
         YIy+yHYccbhkfMopkYR6D5GINt477+ipPl5/LwGRUBQUoWf/Zxf6EWzGdHkKERRDGQVV
         2NSYvYAZ6XM4aZx7mL78EBl7Sauc34Y/jwTawm0didw3YKq+m1dj1B7BJ6HfIQLZKyLW
         SuB9YxugvXXNjspXLg4Lg4va4ZhpPVpo9xz4LomSSW+Z3/T0M1Fy7pBTzdz+0jW3h2NJ
         cd8tVZZ65NnhRgQCXrW1vVH2WwofvPpkHWifk3XPv5HOVnvKM9tBQdT16yebkTUUquCD
         t2Yg==
X-Gm-Message-State: AOJu0Yzt7fQJBMzNgHiLosymngD399QC/6QHJkXA25EBKv9INl/qoo98
	fNLAK8JzZkZ8wC08LSoyin6GKdGGD1NITLG7YB6IN9Rk8ymO/Fs4WdrS1Kkl0R8+JNZmTbFFQde
	pvvx1SJ25AQxGoxR26PQFxyyq0lDeLYP7t77t3g0n3JHT4izqPdd9DQojGy8JIkdT4q2WXwgjvS
	KZbioYFIZhtCENH705lXyzig0h+Bh9aomQPDP62IrreNog1nIi
X-Received: from pgbcs9.prod.google.com ([2002:a05:6a02:4189:b0:c79:3224:837d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:4765:b0:2bf:23c3:34ba
 with SMTP id d9443c01a7336-2bf368463d8mr150005845ad.28.1780330693361; Mon, 01
 Jun 2026 09:18:13 -0700 (PDT)
Date: Mon, 1 Jun 2026 09:18:12 -0700
In-Reply-To: <20260530092947.490971F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529183549.1104619-21-pbonzini@redhat.com> <20260530092947.490971F00893@smtp.kernel.org>
Message-ID: <ah2wxOMC1lqyJ5UD@google.com>
Subject: Re: [PATCH 20/24] KVM: SEV: Return INVALID_EVENT for SNP-only
 #VMGEXIT from non-SNP guest
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, May 30, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > index 880a2acd77bff..b59adddfdbccb 100644
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> [ ... ]
> > @@ -4527,6 +4537,13 @@ int sev_handle_vmgexit(struct kvm_vcpu *vcpu)
> >  		return 1;
> >  	}
> >  
> > +	if (is_snp_only_vmgexit(control->exit_code) && !is_sev_snp_guest(vcpu)) {
> > +		vcpu_unimpl(vcpu, "vmgexit: exit code %#llx is SNP-only\n",
> > +			    control->exit_code);
> > +		svm_vmgexit_bad_input(svm, GHCB_ERR_INVALID_EVENT);
> > +		return 1;
> > +	}
> > +
> >  	ret = sev_es_validate_vmgexit(svm);
> >  	if (ret)
> >  		return ret;
> 
> [Severity: Low]
> Does this consume the GHCB sw_exit_code field before verifying that the
> guest actually marked it as valid?
> 
> By moving the is_snp_only_vmgexit(control->exit_code) check before the
> call to sev_es_validate_vmgexit(), KVM evaluates the exit code before
> kvm_ghcb_sw_exit_code_is_valid() is checked.
> 
> If a non-SNP guest provides a GHCB without setting the valid bit for the
> exit code, but the uninitialized memory coincidentally matches an SNP-only
> exit code, will KVM incorrectly return GHCB_ERR_INVALID_EVENT instead of
> the required GHCB_ERR_MISSING_INPUT?

Super duper technically, yes.  We can't simply swap the order, because exits
like SVM_VMGEXIT_PSC shouldn't exist for non-SNP guests.  But I guess it would
be easy and safe enough to do:

	if (kvm_ghcb_sw_exit_code_is_valid(svm) &&
	    is_snp_only_vmgexit(control->exit_code) && !is_sev_snp_guest(vcpu)) {
		vcpu_unimpl(vcpu, "vmgexit: exit code %#llx is SNP-only\n",
			    control->exit_code);
		svm_vmgexit_bad_input(svm, GHCB_ERR_INVALID_EVENT);
		return 1;
	}

Hmm, I guess the other option would be to split out the "always mandatory" checks


	if (!kvm_ghcb_sw_exit_code_is_valid(svm) ||
	    !kvm_ghcb_sw_exit_info_1_is_valid(svm) ||
	    !kvm_ghcb_sw_exit_info_2_is_valid(svm))
		return false;

e.g. end up with:

	if (!kvm_ghcb_sw_exit_code_is_valid(svm) ||
	    !kvm_ghcb_sw_exit_info_1_is_valid(svm) ||
	    !kvm_ghcb_sw_exit_info_2_is_valid(svm)) {
		/*
		 * Print the exit code even though it may not be marked valid
		 * as it could help with debugging.
		 */
		vcpu_unimpl(vcpu, "vmgexit: exit code %#llx input is not valid\n",
			    control->exit_code);
		dump_ghcb(svm);
		svm_vmgexit_bad_input(svm, GHCB_ERR_MISSING_INPUT);
		return 1;
	}

	if (is_snp_only_vmgexit(control->exit_code) && !is_sev_snp_guest(vcpu)) {
		vcpu_unimpl(vcpu, "vmgexit: exit code %#llx is SNP-only\n",
			    control->exit_code);
		svm_vmgexit_bad_input(svm, GHCB_ERR_INVALID_EVENT);
		return 1;
	}

	if (!sev_es_are_required_ghcb_fields_valid(svm)) {
		vcpu_unimpl(vcpu, "vmgexit: exit code %#llx input is not valid\n",
			    control->exit_code);
		dump_ghcb(svm);
		svm_vmgexit_bad_input(svm, GHCB_ERR_MISSING_INPUT);
		return 1;
	}

Hmm, and if we go with the second option, maybe rename sev_es_are_required_ghcb_fields_valid()
to sev_es_are_ancillary_ghcb_fields_valid()?

I don't particularly love either option, but I think I have a slight (very slight)
preference for this?

	if (!kvm_ghcb_sw_exit_code_is_valid(svm) ||
	    !kvm_ghcb_sw_exit_info_1_is_valid(svm) ||
	    !kvm_ghcb_sw_exit_info_2_is_valid(svm)) {
		/*
		 * Print the exit code even though it may not be marked valid
		 * as it could help with debugging.
		 */
		vcpu_unimpl(vcpu, "vmgexit: exit code %#llx input is not valid\n",
			    control->exit_code);
		dump_ghcb(svm);
		svm_vmgexit_bad_input(svm, GHCB_ERR_MISSING_INPUT);
		return 1;
	}

	if (is_snp_only_vmgexit(control->exit_code) && !is_sev_snp_guest(vcpu)) {
		vcpu_unimpl(vcpu, "vmgexit: exit code %#llx is SNP-only\n",
			    control->exit_code);
		svm_vmgexit_bad_input(svm, GHCB_ERR_INVALID_EVENT);
		return 1;
	}

	if (!sev_es_are_ancillary_ghcb_fields_valid(svm)) {
		vcpu_unimpl(vcpu, "vmgexit: exit code %#llx input is not valid\n",
			    control->exit_code);
		dump_ghcb(svm);
		svm_vmgexit_bad_input(svm, GHCB_ERR_MISSING_INPUT);
		return 1;
	}
