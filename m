Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083F523ABBE
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 23:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785369445; cv=none; b=Q8rdXyHs7cb2/xVL2vBfrSRSwzg+k3WCz1qIyf5YPDdXJsB4lRISeOaaaRASixiLAN0lVQMy1cnJxjrCBlc5gTWIN73VhTjhmbVOMH1jIP0lNb1RqQKEOW2pP1PyfAzUumTcZYudz5fm20EdQDybMzXoMuNgNKpXZNlpoQmuC6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785369445; c=relaxed/simple;
	bh=x40rpiARFSh3T5lEfW7U0Jp2NGDYvCg2rqs+FMxdw1I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=osKHKJK+wXERCaHLy8KLab0F9noaAzIuJp0VNc1jPpr/jmcMEcwF36hhvmWLTBG+yIrdXZ71TvI0Hfx+GcoVe54hlZsrQc9IyQFj9AHJ6K0mLnS2gFaW0X+aP9v8FMnZHTYLvPFZnvk1+KQnX+NvPtJEijep4YEEWLbA7FWALLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=clJtWGuB; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="clJtWGuB"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cd01a14e81so19913345ad.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 16:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785369443; x=1785974243; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ht1aTs4pO9WHnQaSF7pKvIACIeVphUGRPBFrJ5uIv+8=;
        b=clJtWGuBIQrQjI9XkXD3GuGrzdnxCF80MHPqvyK+A2y4EXw/f001jjhC331qk2XZG+
         38AQHArxu1Dp3dFxNma84IdMzahgTVbT3DILh8IFsKFy4qWp1x33em4E9AEmiyGjHSYG
         OOyLV6i3070K5LBHaOtyctY9I1ZznbYE6Y15ZKcgSg2mICYRi9HLo0LZfBceoguHjHTE
         mFBDLdaoeevQJP6LDCW/284TU86fZrWWBsY+pxT1XacBWZL7mx51I3NBRWdHQmRnmf95
         YvF1a7KY1p2lo1y0pB+wthBWjFHHeCwbmxwdWT0aff5N/zJrhKE+juBbaQWdJLiTUcBW
         16/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785369443; x=1785974243;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ht1aTs4pO9WHnQaSF7pKvIACIeVphUGRPBFrJ5uIv+8=;
        b=ZGXTN1SvrqcuP0Y7tbdakf5GPme3Rh+CVPQCLeIS5sfAVXcYf/ak/vzBNV/00EwPIL
         A720T68mUNK6vqT4kREVdYfogxTlMXJyzbkzYTX0gU4WCimhKSBiCfijc2JnxV7rRTf4
         rFbBLgX93oinaE6wosvgjsghxnERN01d9jTTOnpKk8hDjDq3qxh4CIxP514VxKfEpSRc
         lA8BPqrgsG1/+8leoRwyLONRoqJMJTXX1IeJqP1maF6ryF0u9AR4PYNAPIdSukRAavKf
         zsg6/lx3kHrRIakeW0qq6fDW51iyTBGtWvV9jxwBKSh04O/XNxhkZgjWATarB/DIHVB4
         flng==
X-Gm-Message-State: AOJu0YyAmb7geaHO+/9QGipt3aGZoNH4STG5gq/V/W+gfNjgudaC4eIu
	hjk38ZAt8lKz3pCJec258cybWO2M9tAbOZjXio8leupL9nzMiOhii8SWZIJ0opVoK2iLYGUMfiB
	GnIj83Q==
X-Received: from plpw13.prod.google.com ([2002:a17:902:9a8d:b0:2cc:fd6c:c5d3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d591:b0:2c9:da58:17dd
 with SMTP id d9443c01a7336-2d035e4b61amr3750695ad.34.1785369443197; Wed, 29
 Jul 2026 16:57:23 -0700 (PDT)
Date: Wed, 29 Jul 2026 16:57:22 -0700
In-Reply-To: <ampBJrSSas_XISim@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260729170621.308809-1-dmaluka@chromium.org> <20260729170621.308809-3-dmaluka@chromium.org>
 <20260729172831.5BDE71F00A3A@smtp.kernel.org> <ampBJrSSas_XISim@google.com>
Message-ID: <amqTYv4LtlI4SKcj@google.com>
Subject: Re: [PATCH v2 2/2] KVM: VMX: Fix stale PID-pointer table entry left
 after vCPU free
From: Sean Christopherson <seanjc@google.com>
To: Dmytro Maluka <dmaluka@chromium.org>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 29, 2026, Dmytro Maluka wrote:
> On Wed, Jul 29, 2026 at 05:28:30PM +0000, sashiko-bot@kernel.org wrote:
> > > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > > index 6b96f7aea20bd..ebf26ea84a50b 100644
> > > --- a/arch/x86/kvm/vmx/vmx.c
> > > +++ b/arch/x86/kvm/vmx/vmx.c
> > > @@ -7572,6 +7572,9 @@ void vmx_vcpu_free(struct kvm_vcpu *vcpu)
> > >  	nested_vmx_free_vcpu(vcpu);
> > >  	free_loaded_vmcs(vmx->loaded_vmcs);
> > >  	free_page((unsigned long)vmx->ve_info);
> > > +
> > > +	if (vmx_can_use_ipiv(vcpu))
> > > +		WRITE_ONCE(to_kvm_vmx(vcpu->kvm)->pid_table[vcpu->vcpu_id], 0);
> > 
> > [Severity: High]
> > This isn't a bug introduced by this patch, but does clearing the pid_table
> > entry alone prevent hardware from writing to the freed pi_desc?
> > 
> > According to the Intel SDM (Section 29.1.5), the processor caches PID-pointer
> > table entries in the VPID.
> 
> I can't find this statement in the SDM, and I'm not sure what it has to
> do with VPID, apart from the acronym similarity.

Yeah, I have no idea what Sashiko is talking about.  The PID table is physically
addressed, AFAIK it doesn't have a TLB entry of any kind, let alone one tagged
with the vCPU's VPID.

> > Because KVM immediately frees the vcpu memory into kvm_vcpu_cache after
> > kvm_arch_vcpu_destroy() without issuing a cross-vCPU flush (e.g., via
> > kvm_make_all_cpus_request(kvm, KVM_REQ_TLB_FLUSH)) to invalidate the VPID
> > caches of other running vCPUs and synchronize with in-flight IPI deliveries,
> > can other vCPUs still send hardware IPIs using the cached pi_desc pointer?
> > 
> > Could this result in the IPI hardware writing to the freed vcpu memory and
> > corrupting another newly created vCPU when the memory is reused from
> > kvm_vcpu_cache?
