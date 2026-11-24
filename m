Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543231;
	b=e2ppAC86qfDw1tx7Drs0BYaOVGpRutvsx0NjvPUBJaL7KfJVi70hOLvf87EVa/CjByco
	 FrnEp0u04i0bfw3P3lz2fhT8QjTAOkWilvMkGKg5MljPH96jOZR6fRi3BpwrOfM+KN3C9
	 OvpTiXHYLXfkLAokDZYjRUzs5Org3kcE93qqhLHjUS92dVEEHVXehPcq7z2qiAELsL8Qw
	 pTjKNBDWk7W5pMwSi+wX/zTksVKL166pcCP1SNso1JVO2ZGW+e97Uopwtxky+AQwBQVGU
	 ttZlBMXR6MpWJQb6bqeX5l9Zjwq5C7dHwjUYx666D5b4n5pQmi5Vs8FpeVjIpzWT4aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543231;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Subject:From:To:Date:In-Reply-To:References:User-Agent:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Transfer-Encoding;
	bh=DGteh9A13SwKf9DoOFbIVit9+Yy0hw7e/jraHRWTsv8=;
	b=yLhNBdwMRZhEGu7jL+3rPTS62t8vlkruoU49F3QqVu/NmV3kizyfd/pJbJ7Qfn+9XmWn
	 zQ4g7dAJ4p7oJ6iuh8gQF98JCatxB2yB3LFIE3F94RJXyRwehThLTqWZNckxc5/X8hRga
	 5E0C5O1aGSd8MImd98Iv3yRG8+B1ONltNjQIbIjWJNZa2Xz29YfPhY0j0yku0vygJ5lqS
	 xV4BQ8jnYNYh8yADblm7pVpbfdK7lWmA1SoQEiiWChoBkEyZ8ocYxLKxxAO5pOK4KhRsC
	 RycUIvXDGKe1lMm6XLWYoQFPOUy3IfrOxDhCRx/JywX/ETFXmynxz2aw2j/9pjixT1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eue4h8U0;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BC4606A326
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 18:00:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38BC4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eue4h8U0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795543230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DGteh9A13SwKf9DoOFbIVit9+Yy0hw7e/jraHRWTsv8=;
	b=eue4h8U0ri+r9myUdKxeLY1bUJFRwJLykfSDTGYqjb2gCK2peHmShutpsU7NqAMpOPI3rr
	6eIImM/D8a0Y1t0OjEAry9BsuJ3YNbTmuhOxToD4OxUsP/ReUzdmrqAqtsB9+DdaxPMaFI
	gR0VNLFU4WrT9K1EYeBji17tPC0zdVg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-mhOeT5bAO7ebaOGCtjwBZw-1; Tue, 24 Nov 2026 18:00:27 +0000
X-MC-Unique: mhOeT5bAO7ebaOGCtjwBZw-1
X-Mimecast-MFC-AGG-ID: mhOeT5bAO7ebaOGCtjwBZw_1795543227
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d3232fso695950385a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 10:00:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795543227; x=1796148027;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aBPFZif7OQNjM5QKYDwZZgIncRfMVh/lXXAldLLFMNQ=;
        b=xd6305qce7U/OsKgzJAAF1978OOTFWhPwwe+TH+X36e191Zvak53Kla3sDazNH2BI6
         3ErGO3Roe/69+0KmhHf05O+8TWUqLRP/bCKH+c/1nTKIx7Z3iL42VM7jeHIB5WmGI2Cb
         pCuK70NPtWJnbA/wtJ6ObcnYlV0NGtNbgymZseypXO/RLv3ZQ+FN1o5IpiSxzXAXtFE1
         mBZYUl3sv45JkRE3w7w0g+lcqE7rrC6Dop+hq9EptlX89c30CREN4rcCA94emh7TCqdb
         NVgPqjrDX5yhv75G9+LPzVPmC6GDLtwAymbtTEzL5p/bqzQX5oFUnA5F79+RPnIjYHw/
         kf4Q==
X-Gm-Message-State: APuU4Z+RcNOezQpg8AIXbgQoRHE1CigywFxy2xQ9hDMjXRaC4gWontV2
	GLXXFzejvBgfQs98wDu3vYgGIgGL6blOyAU/EDs2UwEcTLyqDAWjPx4zksbnYpnF3RI6A3fRbuh
	Jiets5Sjkq12wVs8kTmew2Q8mNNrFhD9AfZhsp33JpMJgyNk5VXEo/RHOhynjH+T3hSBOjV3L3z
	f3SEo0NP+WCLa1gttFMVQ5iiY25HlNinosk7iE5vY5+2kjFEWam9HdvQ==
X-Gm-Gg: AZFdTZe9mYDUuMj6kMmpNzpuY8NUzH7QGUKV8cBUeo3sNHu9HBokeXCx0XBXYc1qYNU
	MuhlHZ+d1jZy2MBUnoFikEAIllpIYlqtdhAgEQ6DeTYe6djyn0MxewTFSbeCEFRyS4chtwUSVfG
	Nh653kwsJDTTj9NMvA4/fys/HVHTIXQv+ERCoLVswZ97mbV1KVCW8v1hc2pOvfGNeXtlbMEwGZf
	0o8CBzy9nHpwhn8H7M+mGdmxSibw+/MN8CNMjq04r8vEDlResU8ZNwyYMS1kkVnwyvYnAgnTtGI
	n5AHwSgQvc+P3yzkhmJ1PUoOLfaaCnXNZO3PCp/NRBIsdNKq9zVkOzfnmigdBNQmk7DCwqiMYyQ
	qtKlnYHv8lxVZU/x9otWum8RDuxWUH8njzUoit4bddDVrezHqPgRaCZO8utk+RAMOm954xJVk4g
	RdmxAHo5M=
X-Received: by 2002:a05:620a:371d:b0:93f:3e39:efa1 with SMTP id af79cd13be357-949ba9c6d0fmr2938816585a.23.1795543225791;
        Tue, 24 Nov 2026 10:00:25 -0800 (PST)
X-Received: by 2002:a05:620a:371d:b0:93f:3e39:efa1 with SMTP id af79cd13be357-949ba9c6d0fmr2938776385a.23.1795543224025;
        Tue, 24 Nov 2026 10:00:24 -0800 (PST)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb ([209.103.33.216])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb427388sm1088866085a.42.2026.11.24.10.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 10:00:23 -0800 (PST)
Message-ID: <d699e5865a19a199d9044d815d3428a74c46f6c8.camel@redhat.com>
Subject: Re: [PATCH v3 5/5] KVM: x86: nVMX: fix races in delivery of nested
 posted interrupts
From: "mlevitsk@redhat.com" <mlevitsk@redhat.com>
To: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Date: Tue, 24 Nov 2026 13:00:22 -0500
In-Reply-To: <sashiko-outbox-229799@kernel.org>
References: <20261123175512.80438-1-mlevitsk@redhat.com>
	 <20261123175512.80438-6-mlevitsk@redhat.com>
	 <sashiko-outbox-229799@kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s_b5YED1Lw_JfNni1C9SflJWl7rtaiCBOiAeG-c10ak_1795543227
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-11-23 at 18:19 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] KVM: nVMX: unhandled error and unmapped state in
> =C2=A0 __nested_vmx_vmexit() PI completion
> --
>=20
> commit daa28df8cd412bbb1c1a76b22827fb7d30241474
> Author: Maxim Levitsky <mlevitsk@redhat.com>
>=20
> KVM: x86: nVMX: fix races in delivery of nested posted interrupts
>=20
> This commit synchronizes nested posted interrupt delivery with nested
> VM-Exit using atomic operations on vcpu->arch.nested_guest_state and
> processes pending nested posted interrupts in __nested_vmx_vmexit().
>=20
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index 61f50175ecb79..845825c018bf5 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> [ ... ]
> > @@ -5122,7 +5128,13 @@ void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, =
u32 vm_exit_reason,
> > =C2=A0=09if (enable_ept && is_pae_paging(vcpu))
> > =C2=A0=09=09vmx_ept_load_pdptrs(vcpu);
> > =C2=A0
> > -=09leave_guest_mode(vcpu);
> > +=09old_nested_state =3D leave_guest_mode(vcpu);
> > +
> > +=09/* pairs with implicit memory barrier in vmx_deliver_nested_posted_=
interrupt */
> > +=09smp_mb__after_atomic();
> > +
> > +=09if (old_nested_state & KVM_NESTED_PI_PENDING)
> > +=09=09__vmx_complete_nested_posted_interrupt(vcpu);
> > =C2=A0
> > =C2=A0=09if (nested_cpu_has_preemption_timer(vmcs12))
> > =C2=A0=09=09hrtimer_cancel(&to_vmx(vcpu)->nested.preemption_timer);
>=20
> [Severity: High]
> What happens when __vmx_complete_nested_posted_interrupt() fails or runs
> before vmcs12 pages are mapped?
>=20
> If L1 configures an unbacked or MMIO GPA for posted_intr_desc_addr or
> virtual_apic_page_addr, vmx->nested.pi_desc or virtual_apic_map.hva is NU=
LL.
> __vmx_complete_nested_posted_interrupt() then calls
> kvm_handle_memory_failure(), setting vcpu->run->exit_reason to
> KVM_EXIT_INTERNAL_ERROR and returning -ENXIO.=C2=A0 Because __nested_vmx_=
vmexit()
> ignores the return value, callers such as nested_vmx_reflect_vmexit() and
> vmx_check_nested_events() continue running L1 in-kernel instead of exitin=
g
> to userspace, while non-KVM_RUN callers via vmx_leave_nested() clobber
> vcpu->run->exit_reason.
>=20
> In addition, when entering L2 with from_vmentry =3D=3D false (KVM_SET_NES=
TED_STATE
> or RSM), nested_vmx_enter_non_root_mode() defers nested_get_vmcs12_pages(=
)
> via KVM_REQ_GET_NESTED_STATE_PAGES while publishing KVM_NESTED_PI_ACTIVE =
in
> vcpu->arch.nested_guest_state.=C2=A0 If a nested posted interrupt arrives=
 and an
> L2->L1 exit happens before the first L2 entry, __nested_vmx_vmexit() clea=
rs
> KVM_REQ_GET_NESTED_STATE_PAGES without mapping pi_desc, so
> __vmx_complete_nested_posted_interrupt() drops the interrupt and triggers=
 a
> spurious KVM_EXIT_INTERNAL_ERROR.
>=20
> Finally, running __vmx_complete_nested_posted_interrupt() when vmx->fail =
is
> true clears pi_desc->on and writes max_irr into vmcs02 GUEST_INTR_STATUS,
> which is then lost because sync_vmcs02_to_vmcs12() is skipped on vmx->fai=
l.


Technically KVM doesn't have to fail when nested PIR and/or nested APICv pa=
ge are MMIO, as stated here:

KVM: nVMX: Fail on MMIO completion for nested posted interrupts

When the kernel has no mapping for the vmcs02 virtual APIC page,
userspace MMIO completion is necessary to process nested posted
interrupts. This is not a configuration that KVM supports. Rather than
silently ignoring the problem, try to exit to userspace with
KVM_INTERNAL_ERROR.

Note that the event that triggers this error is consumed as a
side-effect of a call to kvm_check_nested_events. On some paths
(notably through kvm_vcpu_check_block), the error is dropped. In any
case, this is an incremental improvement over always ignoring the
error.

Signed-off-by: Jim Mattson <jmattson@google.com>
Message-Id: <20210604172611.281819-7-jmattson@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>



To avoid the complexity of bubbling up this error from __nested_vmx_vmexit,=
 I will move the kvm_handle_memory_failure
to vmx_complete_nested_posted_interrupt, and only note the error with the r=
eturn value in the __vmx_complete_nested_posted_interrupt,
which __vmx_complete_nested_posted_interrupt will continue to ignore.

If the guest setup one of the structures in the MMIO, it will fail sooner o=
r later anyway.

Best regards,
=09Maxim Levitsky

