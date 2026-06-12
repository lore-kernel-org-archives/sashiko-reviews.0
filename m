Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9295137F724
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 23:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781307637; cv=none; b=C3vj8C08cpUbnqD8Qo6VndXgzu3n72YrsUE7whDeHlhWR68gmaVvmx9uI5sIkwF5kj1Fwsm+5vaYtd1QxbK0fqJaf4RZ1JBeqz4LaUgGas6DRM0Hs5HJc17mcC760RUruodwMoE3CRWEGXLPlmEm6XSurubjT8mSdpYIn3+KPQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781307637; c=relaxed/simple;
	bh=eFVon+YrAf/45BuPV6opnTWBUUGU9yfkQLoDYNuFbsw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rlO5dYmMFrPERdHG/cFHfPyNjVJWAgI8RjaAu0vZ77oOpBqHP6/1D9jIUy5eZkPyRlmfD6djqA/YIvO1bdxQdZAMi5t+sdT2b6yHLdon4DLBjXPc7TNTa6ucSuXFRs/CwGNZ0wTOe8TimwPjOgbNhcDcXsQ6LmrJsQLKxcNKQUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SCFqul5w; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SCFqul5w"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c354050c34so13774155ad.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 16:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781307636; x=1781912436; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GWZML54WsHhSWALuTAkkqMxUQNYB4KRizlsryuenX/M=;
        b=SCFqul5wofky+iKosObwAcJ0yjVishS6Nfc4IfhYT5M/RjbgeF+7kz7E/Q/kUYWOnZ
         GOUOQ7hu3PDKcEfxPXBJ+9t4uruAD3ASmzkFqRtw9CEHQC4hfG8P0lhr8wE4UiyC4Q14
         c7hOkJeFq+esvmh4iBSK9a4IJNz6+ubJaKmlC3hwrhh/gaSiPnF5Urd38nzkEczYfBx9
         HdXZ/zZiwOwdpOxvZGAj5QvIJTe+9/kybT4IdPJ8oweYlFnqPHrjoz8eok7KceCx1uNP
         CVOfJUJ1FAg/wVnlk95VFam2wJlqoP2aO3uiQ3SmIZ/eXP70Et/N2TYf+4dpYvm7MYSB
         xgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781307636; x=1781912436;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWZML54WsHhSWALuTAkkqMxUQNYB4KRizlsryuenX/M=;
        b=dimHH4K2xioT2hAH4bX3/Aa3HMX6oxCYSyK36m11PavjzoQR8w9bPllxTroNt2EKcG
         xfEaqMgJpH/jsAEVDAh24MEDUDYhu+jt1xEalTE4VYWJ69/4x2vcxAeDjmIs1I59b2An
         bFdRM1l0pFLCKuVO+NB5mHox+tU8cfxxD4N80TEweP4vkVCxTg0VJ1tw0XRPaSD1X/b1
         3vc3AtqFWuk/E3JJkE8JmYoCKNXiImnU0vZMY+w4dGTCRgtjKkwPMNtTzpMQMVC/ZUvG
         DB7w0KzmW8V+yujH9TXKZuy5GaODwxlniEWdeEMC694zyc9hBbDPgGRZgRtmv2FsHKEX
         vtCQ==
X-Gm-Message-State: AOJu0Yxv2KbASdGB0IiTxqbL34i0JR+HVuT6k1b87TahySczNxNC5D5n
	YUo5YfLzAp1q4Wz+8H3p/37UIQ7HNnwebPv5iqD+yXuy6oXvvX1d8NnhutGsC7cvWe3PIHLmUeV
	q6O8UWq/kmCxmqhOiAe69F4SGqvkP3lMkiesAIgpcxlL3lte6WS549kCPHcKuEISQdahLNRxHhd
	vgI2t8ARI667BCS1vh++oEh3LGtnFLYvEiAtmB3dKTJzsvhItP
X-Received: from pldp20.prod.google.com ([2002:a17:902:ead4:b0:2bd:52b9:305e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2cb:b0:2c1:c899:1d68
 with SMTP id d9443c01a7336-2c6642b6650mr17080225ad.33.1781307635482; Fri, 12
 Jun 2026 16:40:35 -0700 (PDT)
Date: Fri, 12 Jun 2026 16:40:34 -0700
In-Reply-To: <20260612233017.1F9771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260612230622.687665-5-seanjc@google.com> <20260612233017.1F9771F000E9@smtp.kernel.org>
Message-ID: <aiyY8twOOlRKgQre@google.com>
Subject: Re: [PATCH v2 4/8] KVM: Initialize a vCPU's index to '-1' while it's
 being created
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, Paul Durrant <paul@xen.org>, 
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"

+David and Paul

On Fri, Jun 12, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index e44c20c049610..b3d2a678210c3 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -4188,6 +4188,8 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
> >  		goto vcpu_decrement;
> >  	}
> >  
> > +	vcpu->vcpu_idx = -1;
> > +
> 
> [Severity: High]
> Does setting vcpu->vcpu_idx to -1 here inadvertently change the default
> initialization of Xen's vcpu_id?

Gah, I spent the better part of an hour going through various architecture code
to make sure nothing consumed vcpu_idx in the vCPU creation paths, and still
missed this.

> Because this is set before kvm_arch_vcpu_create(), the architecture-specific
> creation code will see the -1 value. On x86, kvm_arch_vcpu_create()
> eventually calls kvm_xen_init_vcpu():
> 
> arch/x86/kvm/xen.c:kvm_xen_init_vcpu() {
>     ...
>     vcpu->arch.xen.vcpu_id = vcpu->vcpu_idx;

I don't see how the existing code can be correct.  David/Paul, is this supposed
to be vcpu->vcpu_id?

>     ...
> }
> 
> Since the actual vcpu_idx isn't assigned until later in
> kvm_vm_ioctl_create_vcpu(), this leaves vcpu->arch.xen.vcpu_id as -1 instead
> of its previous default of 0.
> 
> Could this cause guest hypercalls, such as VCPUOP_set_singleshot_timer,
> to fail with -EINVAL if a VMM relies on the previous default of 0 for vCPU 0
> and doesn't explicitly invoke KVM_XEN_VCPU_SET_ATTR?
