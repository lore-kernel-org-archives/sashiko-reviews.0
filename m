Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B64D2264A9
	for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792055793; cv=none; b=eqegc67iuqrSyyV/jOHbtyAwLdxRxySWCp9wyU4PrE68kzUeaOx+PV45k4/ai81+YUJMl3cnBs0sawGQgOBDsMlTDUYEg9iStFSV2B18vpnQ+47EK6oSBtAIbliSsduhWEtsyESCwi42SGQy9fhLcpgEuQ2L2VWrASserhqUe5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792055793; c=relaxed/simple;
	bh=Ipa/IDF0CONphFufrDn6odjM7p/ev2Ux5p7STQvynxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VN6fNKSXerZyt4JEc1SJu9f4JFowsr4vtpa6xkAQZFp7SUlCQSJGauC65RLoWET0zM4ZWAlZQnBeTV5OBk4dx/RWQP0dYbZhDksAqHdPllZW5YfHcbfQPL7jhBjuaPyIYECOa+A8NdRWFxQrVNrywDurwVxsZXfkcLqA1ouDvtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QJ/Xkoyk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QJ/Xkoyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792055787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N5fPgirNcjNimepZTvB5AtXWg/xRGRxyRHFM6E7rGoY=;
	b=QJ/XkoykmWWJ7f9ogqdhZHdZFM274xdMKYn4ar45qUq37kMbYslZlvkLhHrYijX8C4iEOW
	RLUPNFCvdPwaDVH1A9r4z6MMLLldIvj6cNGdWlaq6F9d8+vKlwdvYCbz7NAUQp9Uo3ep+i
	jBM+35dsC4G7BoPRxVavwt07nQlQdfg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-80TKtqG8OZGMF0pir7yk3A-1; Thu, 15 Oct 2026 09:16:25 +0000
X-MC-Unique: 80TKtqG8OZGMF0pir7yk3A-1
X-Mimecast-MFC-AGG-ID: 80TKtqG8OZGMF0pir7yk3A_1792055784
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a013ea30c0so35912565e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 15 Oct 2026 02:16:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792055784; x=1792660584;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N5fPgirNcjNimepZTvB5AtXWg/xRGRxyRHFM6E7rGoY=;
        b=uqwHWR0+zHfNxKcj987XEBldXk7K8SqcTYE4QYSzfFISnOWIUQU0f9NbVExoN3+4su
         zsdNwXxbfB9p/XzTTKRQtHspPpYa6+k6wACagkOoydxsygZQip0SoO9BajdKKUQ73Css
         N3O4Oy/INhxVxEAXDsYDjcnevwcU01PfocGDEM3+9iekOA7ZdP9j54FW2NjwOmiNAQT/
         ehFCUoY00/6l/rnQGcidMNN+p6GXWC6hWWT4GX2YTZWAXL3XDbBL5W5WxTfrgoRviHcc
         leAY8lPHcpLxnD5R2uTuK/15rAZQZO2ZdmNV4mLvQES/jky76ufBs5ua453yZVwzO3mK
         3q8g==
X-Gm-Message-State: AFq9FYJ2xZVfhPoSIghrx8WBz40R/m9jPMglh5nPVK/sdEpfymU8c4tC
	CUspFvQ1eWkovuBtNFb8MV1hxgvbU7fPnIHsz7mRZqFyxKR9OPAHzbIxvmgCcB6LeZX0ThU8tyq
	LQGfmpQa/vuDg97hGEE/8jFvo6bQ6LulDxaI48EB4MRzBixkP1mhz2kqviSrw4Si7F/thaHi/vT
	UWgsiDlenEJAbVmDQFP7qXr8JC24qYcdN7LlEDJ91HuhFR2kkowDnf
X-Gm-Gg: AYBFou1uaeEapvNUPkynCdgdxxFPRkTqPVbF5Fbg1hKMtfoP1ZUIFGnbRl1biIifvGM
	bj1O4GRQevLLxMO3MMlpO/K7qOFYl3Dz/sq91vKVjJjvn1Nm/rBw0HntCPqDjHyYl9ifiPCRhTA
	lauyOM55Q93G6YzkMJQVNx4TG3/hfSn3kO9D9jX3gKVmOnzQIFYyPWaklWkOV97+3XHpQ5d9xhE
	VjIKb7d1HsniZfW5XUcwL/zWBW2bbmnlesOZON8FeXG94uxyRFG4MwTMVrjuw==
X-Received: by 2002:a05:600d:8499:20b0:4a1:9687:bbd9 with SMTP id 5b1f17b1804b1-4a19687be3dmr229963645e9.35.1792055784160;
        Thu, 15 Oct 2026 02:16:24 -0700 (PDT)
X-Received: by 2002:a05:600d:8499:20b0:4a1:9687:bbd9 with SMTP id
 5b1f17b1804b1-4a19687be3dmr229963375e9.35.1792055783792; Thu, 15 Oct 2026
 02:16:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261015083123.790030-1-pbonzini@redhat.com> <20261015083123.790030-2-pbonzini@redhat.com>
 <sashiko-outbox-172536@kernel.org>
In-Reply-To: <sashiko-outbox-172536@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 15 Oct 2026 11:16:12 +0200
X-Gm-Features: AclHuK-TZpfQTtoNi6gGjWkZn_9BDOy9jJ5Y6zLkjax3ruQERXdVWJNnqbwioxY
Message-ID: <CABgObfboY-O-oKjPCsyfQsVptL7yCse5NcVkXB6itcofahzjGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: nVMX: Reset MMU back to the root MMU if loading
 L2 state fails for !VM-Entry
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8lsllceFszHlSBUNSrowVNxu0PWod5gO8QK6oDZKG6w_1792055784
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 11:02=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] kvm: vmx: nested state corruption (CR0/CR4/EFER) on KVM_SET_NEST=
ED_STATE failure
> --
>
> commit 55d55918900f4eae4bf7636855cdc83ba4433cf5
> Author: Amirmohammad Eftekhar <amirmohammadeftekhar@gmail.com>
>
> KVM: nVMX: Reset MMU back to the root MMU if loading L2 state fails for !=
VM-Entry
>
> This patch resets the vCPU's MMU pointer back to the root MMU if loading =
L2
> state fails when not coming from VM-Entry. This prevents KVM from hitting
> a NULL pointer dereference when attempting to run L1 with a nested MMU.
>
> Link: https://patch.msgid.link/20261001214356.3825100-2-seanjc@google.com
>
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index b252168627408..5165275128fce 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> > @@ -3770,8 +3770,10 @@ enum nvmx_vmentry_status nested_vmx_enter_non_ro=
ot_mode(struct kvm_vcpu *vcpu,
> >  vmentry_fail_vmexit:
> >       vmx_switch_vmcs(vcpu, &vmx->vmcs01);
> >
> > -     if (!from_vmentry)
> > +     if (!from_vmentry) {
> > +             nested_ept_uninit_mmu_context(vcpu);
>
> [Severity: High]
> When userspace invokes KVM_SET_NESTED_STATE, KVM executes
> vmx_set_nested_state() which calls nested_vmx_enter_non_root_mode() with
> from_vmentry set to false.
>
> This unconditionally calls prepare_vmcs02(), which modifies the vCPU's
> software state (such as cr0, cr4, efer, and tsc_offset) to match the
> nested L2 state.
>
> If prepare_vmcs02() subsequently fails, for example due to an invalid L2
> CR3, it returns an error and jumps to vmentry_fail_vmexit_guest_mode.
>
> While this patch fixes the MMU pointer, since from_vmentry is false, does
> this early return bypass load_vmcs12_host_state() and leave the vCPU's
> software state permanently corrupted with L2's values?

True, but it's pre-existent. And if the ioctl fails userspace is more
or less screwed up anyway.

Paolo

