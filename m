Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6478413D8E
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 22:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780527435; cv=none; b=RiI0esqQpARtim4XYV/Z04Pi9RWzH3L0mXb8VsNmIoJ+AH74SwNt/b77BrCbZwJ/mEJIzPrlVA2PWyj9Kk5G37rmRkvs3tRTPhbwF1q3CQtDGWzF2aQ3O5y7/yofR4qUKhkjklupdpMgUP96kBXhA0vGCAVKWwns70RMDPvk+Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780527435; c=relaxed/simple;
	bh=FzQIgMSWbhyIokUzOxSXs5X+eFiWlOeFpIZ5377y9MM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TzszkR3NEDxtQGsaKlZxG2SRQzaf3LkJ7DclDpK2RZSQnTBIkmSNxbDgveS140sGRXN2c9rNL1MIAmXqJGTPidM90ma6FI7gecf/XPLl/UzBJFQDR/1mPDgOiVdd/bLn87bYICC5CdH3nde7yymqHDtaE6+rDhBHeSuNLUkXnz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g+y+QEG4; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g+y+QEG4"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c0c3315d31so703615ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 15:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780527434; x=1781132234; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=r7fQ0iZNCgyRYhbqZYljEyuSeGi7dGwcSQsPSC7GyyU=;
        b=g+y+QEG4FT5JHBmMOFALqt6VLEn6mOlrrfg9Py2OtWyDtpXJpLTBRzg3zJ0yck9PP5
         ipAYMwteycqq6QDOnIyWx6d2473PYO3LzH6ZJEiRF4ClHQc8v3XGj1JvyzioSsCPNY5u
         ZKXF0q/Ha6bpvry99LT9ZOVf4oHEDF9Cg32Tt2DHsqcwgxcQw5LrrZs91ZM236uSflW8
         884wIu4W2kGJTg8fws9g2HJiohI8DvrTcGTNUbQdsI7zURQ7uBEKdLVbKj+OyBEKPux5
         a+TsTmH8K97BHi2trrCxy9ZCkifeZuurW4WVUtLzbYxIFL8101v8RQ4qnPU4hscQP+Xr
         6NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527434; x=1781132234;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7fQ0iZNCgyRYhbqZYljEyuSeGi7dGwcSQsPSC7GyyU=;
        b=ZbmZYVV9UhRtiQK3p2yVpPas5KQo0xMQTGvP/2g40jbEqxkRLNZ8Ek6axbIngUwHE2
         JeyqewJS5nUH9JyS9Dwt3WW7sIV1ND0vicxK8pGkKneB/HfTTFRFK66DRAyyY+MeUhlX
         DtejxoL8jCIpEwzvph/kROdUiFEYmepAKxtll/NXmrOqQkWfI4MiIcBOKnuxXSFuwswy
         vL0qZ1a/iMv5OpGZ55r1lNHnDU1DAYJoB/7L017AzsH3/0tIHLu48A5JUTryJjHGslzt
         IAv9nmVfIP1ZZTkIBuS3rwjYAPhctm8V0YppYkMVPs1C57ShgCzJrdd3ALAZ3Kd3zhKU
         giQQ==
X-Gm-Message-State: AOJu0YwHNDPBpYOu8Ox/TBcc1yVfeMyAag+sKht/9QRDXL6JBwc+bZsr
	va7AmslQmaGHfXL6FEzXoNuC6eMTKude4Vf/wlqAhpA0t1+zojujKBCB3dJcPffp1jEPvhqgZ48
	TzZkL/AAcaHZzWxLaoiTo4TP5um563ReyFGvO0623TvspyYORffKLJfwLfWJNRu8ggv639D70OG
	xIDE2rJOuO93KtVMqU4qzNEKIRbeY7LGD+zCtfQ/FiBGQDfHAq
X-Received: from plgm12.prod.google.com ([2002:a17:902:f64c:b0:2ba:34b1:ff5d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2ece:b0:2bd:4b8c:fd30
 with SMTP id d9443c01a7336-2c1644dbdfbmr52249425ad.41.1780527433545; Wed, 03
 Jun 2026 15:57:13 -0700 (PDT)
Date: Wed, 3 Jun 2026 15:57:12 -0700
In-Reply-To: <20260603225013.99E151F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260603223418.1720035-3-seanjc@google.com> <20260603225013.99E151F00893@smtp.kernel.org>
Message-ID: <aiCxSL0rEkUFTW06@google.com>
Subject: Re: [PATCH 2/2] KVM: nVMX: Don't use vmcs01.GUEST_CR3 to snapshot
 L1's CR3 when EPT is disabled
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 03, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> > @@ -3651,19 +3651,14 @@ enum nvmx_vmentry_status nested_vmx_enter_non_root_mode(struct kvm_vcpu *vcpu,
> >  				    &vmx->nested.pre_vmenter_ssp_tbl);
> >  
> >  	/*
> > -	 * Overwrite vmcs01.GUEST_CR3 with L1's CR3 if EPT is disabled.  In the
> > -	 * event of a "late" VM-Fail, i.e. a VM-Fail detected by hardware but
> > -	 * not KVM, KVM must unwind its software model to the pre-VM-Entry host
> > -	 * state.  When EPT is disabled, GUEST_CR3 holds KVM's shadow CR3, not
> > -	 * L1's "real" CR3, which causes nested_vmx_restore_host_state() to
> > -	 * corrupt vcpu->arch.cr3.  Stuffing vmcs01.GUEST_CR3 results in the
> > -	 * unwind naturally setting arch.cr3 to the correct value.  Smashing
> > -	 * vmcs01.GUEST_CR3 is safe because nested VM-Exits, and the unwind,
> > -	 * reset KVM's MMU, i.e. vmcs01.GUEST_CR3 is guaranteed to be
> > -	 * overwritten with a shadow CR3 prior to re-entering L1.
> > +	 * Stash L1's CR3, so that in the event of a "late" VM-Fail, i.e. a
> > +	 * VM-Fail detected by hardware but not KVM, KVM can unwind its
> > +	 * software model to the pre-VM-Entry host state.  When EPT is
> > +	 * disabled, GUEST_CR3 holds KVM's shadow CR3, not L1's "real" CR3,
> > +	 * and so simply restoring from vmcs01.GUEST_CR3 would corrupt
> > +	 * vcpu->arch.cr3.
> >  	 */
> > -	if (!enable_ept)
> > -		vmcs_writel(GUEST_CR3, vcpu->arch.cr3);
> > +	vmx->nested.pre_vmenter_cr3 = vcpu->arch.cr3;
> 
> [Severity: High]
> Does directly reading vcpu->arch.cr3 here capture a stale value when EPT is
> enabled?
> 
> Because KVM does not intercept L1 CR3 writes when EPT is enabled, L1 can
> update its CR3 without KVM immediately tracking it. On VM-Exit (such as for
> VMLAUNCH), KVM invalidates the CR3 register cache by clearing the
> VCPU_REG_CR3 availability bit.
> 
> If nested_vmx_enter_non_root_mode() directly assigns vmx->nested.pre_vmenter_cr3
> from vcpu->arch.cr3 instead of using kvm_read_cr3(vcpu), it seems this would
> bypass the cache refresh and stash a stale CR3 value.

Gah, yes.
