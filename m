Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620494;
	b=EHfVFsOz2BzvnAgEX8D0549hbTW3/fw/tHPqrVi3QaA5/e6tO6251D5TVVU7zImSHD3B
	 cKByl/AqRkeFL7NwQelC5m5LavDNyfGSPm25tQZ9cpvCje4lrRRZNCErMxjM3n+RnA0Ck
	 2oYuunwAb+yjMWqjg4dXBfqPUfthYjr3hJUosD6hY3JzoURHbIpTcl1txquJYhJwDIGMO
	 E68iJCztpXmKzFx4vXWuIqmJ2y2N0iDRcizrkX3USU1x1kYHjuGeQoE1FrPlqaTDqQtHb
	 yOY59I4E/58XsFKaYY1UTxdYJUgN0RTTzjX2yV+/NDIV00a9/bA5ES0my1sX3CzA3yA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620494;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Subject:From:To:Date:In-Reply-To:References:User-Agent:MIME-Version:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Transfer-Encoding;
	bh=6e0kgqYoRnp3cMC7OFOQzuO7jlerZmpYB1GLjuhaqkY=;
	b=qGYVJ9fO8tFzDeekfGnC75rUKMmIn088UFICtjmfheTAXAz0jyJezwn35KH7rHXvJpSB
	 GJQ8dnbNzsf2eZvqGqIqCGyFu5jSmfn21jxJobsYw3h4iilE/ansUHx6I4iqjD+br9J+c
	 CwB1Pm9wOF92vp92HFtWzazIRk3D0cPvOq4uDY43rhTExbIHJ4k4Mw9ubBfddt6qeD6BK
	 RkStoOQUx0QBIh+nfcABzqlnaT00zqnaSmOKolpHBkoeWWOqTD6lFW54ZLGEfoYFkSUH7
	 Ruzs6iLEfzYQ+lqkd+AG591ycibGjWGYzo7Ex/OWPsef5JJ/QtyU1feqXSP527PnMKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mad84X+m;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E90D606A329
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 15:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E90D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mad84X+m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795620492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6e0kgqYoRnp3cMC7OFOQzuO7jlerZmpYB1GLjuhaqkY=;
	b=Mad84X+msdGtJBS14+FtqNKzerqprnnBKK3S5EYRRiaLLSpckphn7PlvCJrWoNHqbR+e/d
	ICWXfCPDEAzBTKSl6nUd/fCM1pmxTd+fh+FKczGvwHbnKAxIK8O1OiHpRgOGQu45OWHyay
	KMHxnxglkBctXkTg5t78+tn4oFTrtKA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-yQNt8_58MgSisWX_d39_Mg-1; Wed, 25 Nov 2026 15:28:08 +0000
X-MC-Unique: yQNt8_58MgSisWX_d39_Mg-1
X-Mimecast-MFC-AGG-ID: yQNt8_58MgSisWX_d39_Mg_1795620487
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6bb067d094fso2232019a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 07:28:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620487; x=1796225287;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgIANs+qLIIOzj/H2zLJZm2Lmsm8CkjE/+alsxp6LU0=;
        b=XXKtkBkheAPPLVC6ZgP49Ez5i6/sINnxHNHgu+o/3orJjSBshMP32TZxXq3/OLzkd3
         KI7hnxENwscLSDlzUlMMeQHBwX3/s2V2pVCb20iY0kOFy4aUv9ABJ8j5qmXx0vqrxW79
         k3qetegtU6xLqA8UM8p6+6Ba61CclOh0eOiZAylI7p8FrPBvpmh7OqkTEeZfV45J5WF/
         nsGmAkTannx/AjAJOkmsP/3qjsQOCEsYN/Eb4OvBjXFrJ0LB1lHoJSO98dPZ44Fg55Zo
         qhclAB6xxjSX5M38PQqbHJW9r6JZ4KlANjZopxGoJvZE8Hv7xho+y5HKEe+JgPYndXmc
         XQdQ==
X-Gm-Message-State: APuU4Z/rswhzznuiXcs+HXm7DA8hRTxkrptWaHmObWKcYP72VqBFNnJi
	YBBKZNAgU1u3pRFlFVsO2m6+b29EuR4HcLUP4cR0gFd3dFSOCcGK7q0vVq9gKFDVAabTNV0Kx1Z
	BSZnMnbfpHOI6dKq/438tzA9MxQwzs2U2bvvIvJt3jqB+T8UI6Wh3BBwtpoS/did+YbGHZTKme3
	O3v+mbXVQAOlnk3ReI0b2KuPgXuuiyQhQHICk9mVApou3QETjAzQPyAA==
X-Gm-Gg: AZFdTZfwDL/OXf8Moy22j5/w+a8UnFe4To/lxdsZJU4iRG+rvR5GnhI5MNX9mexa8/f
	zBNBj3E5hiVXYG6afN37xX44X1IoxpAvKE4gAHKViOYXpJvICiSk0+KvG53pyP9TAIuK4Q21nuF
	azQOSs8gv7MPqyznj9JiJ65NQeXSQhvuyoU1LUs9VyYSNWJLzRiSkiDl27ssT0l5EMLlXmhoL+2
	SzzR7VUtNjz+KEtU4KFqhdWoGWMURLjT6vcFvHpSNAaUnaSGReZy2ZAP3De9xpKgGPTNt154PNt
	ujp2Q1o8Stev4OJfxUH46XvOPHmKuad5N8uvJokvfzVoDSVcyrrUsHKQOwoWYCthS7X7Iv+6Pvf
	R6U5SGVY82e+rPjDzkvPz6/8/iTjPIeZGqohUTjMvVoTNVEK2yg6Xs685Nj5guCrdv4eZImqq4W
	U3U4pGiLk=
X-Received: by 2002:a05:6402:3212:b0:6ba:31be:edc3 with SMTP id 4fb4d7f45d1cf-6ba31beee34mr13288293a12.6.1795620486667;
        Wed, 25 Nov 2026 07:28:06 -0800 (PST)
X-Received: by 2002:a05:6402:3212:b0:6ba:31be:edc3 with SMTP id 4fb4d7f45d1cf-6ba31beee34mr13288273a12.6.1795620486165;
        Wed, 25 Nov 2026 07:28:06 -0800 (PST)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb ([209.103.33.216])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1d49d992sm1496168a12.26.2026.11.25.07.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:28:05 -0800 (PST)
Message-ID: <19aa03249ef85403c23a8d0287c9324fb02ab00f.camel@redhat.com>
Subject: Re: [PATCH v4 5/5] KVM: x86: nVMX: fix races in delivery of nested
 posted interrupts
From: "mlevitsk@redhat.com" <mlevitsk@redhat.com>
To: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Date: Wed, 25 Nov 2026 10:28:03 -0500
In-Reply-To: <sashiko-outbox-232632@kernel.org>
References: <20261125052139.362046-1-mlevitsk@redhat.com>
	 <20261125052139.362046-6-mlevitsk@redhat.com>
	 <sashiko-outbox-232632@kernel.org>
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
X-Mimecast-MFC-PROC-ID: 2x1Pyw22-JePA0Im7Vd2Nq9pPfguZmzUyOD6ymhmQJ8_1795620487
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-11-25 at 05:52 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] KVM: nVMX: delayed KVM_NESTED_PI_ACTIVE misdelivers PI to
> =C2=A0 halted/restored L2
> - [High] KVM: nVMX: gating KVM_NESTED_PI_ACTIVE on pi_desc breaks
> =C2=A0 deferred error exit
> - [Medium] KVM: nVMX: __nested_vmx_vmexit() processes nested PI on
> =C2=A0 failed VM-Entry
> --
>=20
> commit aef7be5a3f3ba4f7dee7a4841c7b946e8a11d349
> Author: Maxim Levitsky <mlevitsk@redhat.com>
>=20
> KVM: x86: nVMX: fix races in delivery of nested posted interrupts
>=20
> This commit serializes nested posted interrupt delivery against nested VM
> exit using atomic operations on vcpu->arch.nested_guest_state and delays
> enabling nested posted interrupts until vmcs12 pages are mapped.
>=20
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index eb33528619c2f..a5ef9a15e7e9c 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> > @@ -3440,7 +3440,18 @@ static bool nested_get_evmcs_page(struct kvm_vcp=
u *vcpu)
> > =C2=A0}
> > =C2=A0#endif
> > =C2=A0
> > -static bool nested_get_vmcs12_pages(struct kvm_vcpu *vcpu)
> > +static void nested_vmx_enable_posted_interrupts(struct kvm_vcpu *vcpu)
> > +{
> > +=09struct vmcs12 *vmcs12 =3D get_vmcs12(vcpu);
> > +
> > +=09WARN_ON_ONCE(vmcs12->posted_intr_nv & ~KVM_NESTED_PI_VECTOR_MASK);
> > +
> > +=09atomic_or(KVM_NESTED_PI_ACTIVE |
> > +=09=09 (vmcs12->posted_intr_nv & KVM_NESTED_PI_VECTOR_MASK),
> > +=09=09=C2=A0 &vcpu->arch.nested_guest_state);
> > +}
> > +
> > +static bool nested_get_vmcs12_pages(struct kvm_vcpu *vcpu, bool from_v=
mentry)
> > =C2=A0{
> > =C2=A0=09struct vmcs12 *vmcs12 =3D get_vmcs12(vcpu);
> > =C2=A0=09struct vcpu_vmx *vmx =3D to_vmx(vcpu);
> > @@ -3505,6 +3516,9 @@ static bool nested_get_vmcs12_pages(struct kvm_vc=
pu *vcpu)
> > =C2=A0=09=09=09=09offset_in_page(vmcs12->posted_intr_desc_addr));
> > =C2=A0=09=09=09vmcs_write64(POSTED_INTR_DESC_ADDR,
> > =C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 pfn_to_hpa(map->pfn) + offse=
t_in_page(vmcs12->posted_intr_desc_addr));
> > +
> > +=09=09=09if (!from_vmentry)
> > +=09=09=09=09nested_vmx_enable_posted_interrupts(vcpu);
> > =C2=A0=09=09} else {
> > =C2=A0=09=09=09/*
> > =C2=A0=09=09=09 * Defer the KVM_INTERNAL_EXIT until KVM tries to
> > @@ -3540,7 +3554,7 @@ static bool vmx_get_nested_state_pages(struct kvm=
_vcpu *vcpu)
> > =C2=A0=09}
> > =C2=A0#endif
> > =C2=A0
> > -=09if (is_guest_mode(vcpu) && !nested_get_vmcs12_pages(vcpu))
> > +=09if (is_guest_mode(vcpu) && !nested_get_vmcs12_pages(vcpu, false))
> > =C2=A0=09=09return false;
> > =C2=A0
> > =C2=A0=09return true;
> > @@ -3671,7 +3685,7 @@ enum nvmx_vmentry_status nested_vmx_enter_non_roo=
t_mode(struct kvm_vcpu *vcpu,
> > =C2=A0=09prepare_vmcs02_early(vmx, &vmx->vmcs01, vmcs12);
> > =C2=A0
> > =C2=A0=09if (from_vmentry) {
> > -=09=09if (unlikely(!nested_get_vmcs12_pages(vcpu))) {
> > +=09=09if (unlikely(!nested_get_vmcs12_pages(vcpu, true))) {
> > =C2=A0=09=09=09vmx_switch_vmcs(vcpu, &vmx->vmcs01);
> > =C2=A0=09=09=09return NVMX_VMENTRY_KVM_INTERNAL_ERROR;
> > =C2=A0=09=09}
> > @@ -3701,6 +3715,9 @@ enum nvmx_vmentry_status nested_vmx_enter_non_roo=
t_mode(struct kvm_vcpu *vcpu,
> > =C2=A0=09=09=09vmcs12->exit_qualification =3D failed_index;
> > =C2=A0=09=09=09goto vmentry_fail_vmexit_guest_mode;
> > =C2=A0=09=09}
> > +
> > +=09=09if (nested_cpu_has_posted_intr(vmcs12) && vmx->nested.pi_desc)
> > +=09=09=09nested_vmx_enable_posted_interrupts(vcpu);
>=20
> [Severity: High]
> Does gating nested_vmx_enable_posted_interrupts() on mapping
> vmx->nested.pi_desc break the deferred KVM_EXIT_INTERNAL_ERROR when
> posted_intr_desc_addr cannot be mapped?

Yes, I made this check to be consistent with KVM_GET_NESTED_STATE, but this=
 was wrong,
KVM_NESTED_PI_ACTIVE carries more weight that I thought.
To still be consistent, I'll activate PI regardless of mapping failure in b=
oth=20
nested_vmx_enter_non_root_mode and in nested_get_vmcs12_pages.

>=20
> When kvm_vcpu_map() fails in nested_get_vmcs12_pages(), KVM sets
> vmx->nested.pi_desc =3D NULL to defer the internal error exit until
> __vmx_complete_nested_posted_interrupt() tries to access the descriptor.
> Because KVM_NESTED_PI_ACTIVE is now left unset when pi_desc is NULL,
> neither vmx_deliver_nested_posted_interrupt() nor
> vmx_check_nested_events() recognizes vmcs12->posted_intr_nv as L2's
> posted interrupt notification vector:
>=20
> arch/x86/kvm/vmx/nested.c:vmx_check_nested_events() {
> =C2=A0=C2=A0=C2=A0 ...
> =09=09if ((nested_state & KVM_NESTED_PI_ACTIVE) &&
> =09=09=09((nested_state & KVM_NESTED_PI_VECTOR_MASK) =3D=3D irq)) {
> =09=09=09vmx_complete_nested_posted_interrupt(vcpu);
> =09=09=09goto no_vmexit;
> =09=09}
> =09=09nested_vmx_vmexit(vcpu, EXIT_REASON_EXTERNAL_INTERRUPT,
> =09=09=09=09=C2=A0 INTR_INFO_VALID_MASK | INTR_TYPE_EXT_INTR | irq, 0);
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> Instead of setting KVM_NESTED_PI_PENDING and exiting to userspace with
> KVM_EXIT_INTERNAL_ERROR via __vmx_complete_nested_posted_interrupt(), KVM
> injects a bogus EXIT_REASON_EXTERNAL_INTERRUPT VM-Exit into L1, and the
> !vmx->nested.pi_desc check in __vmx_complete_nested_posted_interrupt()
> becomes unreachable.
This should be fixed.

>=20
> > =C2=A0=09} else {
> > =C2=A0=09=09/*
> > =C2=A0=09=09 * The MMU is not initialized to point at the right entitie=
s yet and
> > @@ -3712,9 +3729,6 @@ enum nvmx_vmentry_status nested_vmx_enter_non_roo=
t_mode(struct kvm_vcpu *vcpu,
> > =C2=A0=09=09kvm_make_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
> > =C2=A0=09}
> > =C2=A0
> > -=09if (nested_cpu_has_posted_intr(vmcs12))
> > -=09=09atomic_or(KVM_NESTED_PI_ACTIVE | vmcs12->posted_intr_nv,
> > -=09=09=09=C2=A0 &vcpu->arch.nested_guest_state);
>=20
> [Severity: High]
> Does deferring nested_vmx_enable_posted_interrupts() until
> KVM_REQ_GET_NESTED_STATE_PAGES misdeliver nested posted interrupts when L=
2
> is restored in KVM_MP_STATE_HALTED?
>=20
> After nested_vmx_enter_non_root_mode(vcpu, false) during
> KVM_SET_NESTED_STATE (or vmx_leave_smm()), a halted L2 vCPU enters
> vcpu_block() rather than vcpu_enter_guest(), so
> KVM_REQ_GET_NESTED_STATE_PAGES is not serviced while blocked.=C2=A0 When
> another vCPU sends vmcs12->posted_intr_nv to wake L2,
> vmx_deliver_nested_posted_interrupt() sees KVM_NESTED_PI_ACTIVE =3D=3D 0 =
and
> queues the vector into L1's LAPIC IRR.=C2=A0 vcpu_block() then runs
> kvm_check_nested_events() -> vmx_check_nested_events() while
> KVM_NESTED_PI_ACTIVE is still unset, failing to morph the notification
> vector and instead reflecting a spurious EXIT_REASON_EXTERNAL_INTERRUPT
> VM-Exit to L1.
>=20
> > @@ -4025,22 +4039,15 @@ static void vmcs12_save_pending_event(struct kv=
m_vcpu *vcpu,
> > =C2=A0=09}
> > =C2=A0}
> > =C2=A0
> > -static int vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcpu)
> > +static int __vmx_complete_nested_posted_interrupt(struct kvm_vcpu *vcp=
u)
> > =C2=A0{
> > =C2=A0=09struct vcpu_vmx *vmx =3D to_vmx(vcpu);
> > =C2=A0=09int max_irr;
> > =C2=A0=09void *vapic_page;
> > =C2=A0=09u16 status;
> > =C2=A0
> > -=09int nested_state =3D atomic_read(&vcpu->arch.nested_guest_state);
> > -
> > -=09if (!(nested_state & KVM_NESTED_PI_PENDING))
> > -=09=09return 0;
> > -
> > =C2=A0=09if (!vmx->nested.pi_desc)
> > -=09=09goto mmio_needed;
> > -
> > -=09atomic_andnot(KVM_NESTED_PI_PENDING, &vcpu->arch.nested_guest_state=
);
> > +=09=09return -ENXIO;
> > =C2=A0
> > =C2=A0=09/*
> > =C2=A0=09 * Don't test the value of PID.ON.
> > @@ -4057,7 +4064,7 @@ static int vmx_complete_nested_posted_interrupt(s=
truct kvm_vcpu *vcpu)
> > =C2=A0=09if (max_irr > 0) {
> > =C2=A0=09=09vapic_page =3D vmx->nested.virtual_apic_map.hva;
> > =C2=A0=09=09if (!vapic_page)
> > -=09=09=09goto mmio_needed;
> > +=09=09=09return -ENXIO;
> > =C2=A0
> > =C2=A0=09=09__kvm_apic_update_irr(vmx->nested.pi_desc->pir,
> > =C2=A0=09=09=09vapic_page, &max_irr);
>=20
> [ ... ]
>=20
> > @@ -5121,7 +5141,10 @@ void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, =
u32 vm_exit_reason,
> > =C2=A0=09if (enable_ept && is_pae_paging(vcpu))
> > =C2=A0=09=09vmx_ept_load_pdptrs(vcpu);
> > =C2=A0
> > -=09leave_guest_mode(vcpu);
> > +=09old_nested_state =3D leave_guest_mode(vcpu);
> > +
> > +=09if (old_nested_state & KVM_NESTED_PI_PENDING)
> > +=09=09__vmx_complete_nested_posted_interrupt(vcpu);
>=20
> [Severity: Medium]
> Can calling __vmx_complete_nested_posted_interrupt() unconditionally in
> __nested_vmx_vmexit() lose posted interrupts when vmx->fail is set or
> virtual_apic_map is unmapped?
>=20
> When a hardware VM-Entry of vmcs02 fails (vmx->fail =3D=3D 1),
> __nested_vmx_vmexit() skips sync_vmcs02_to_vmcs12().=C2=A0 Running
> __vmx_complete_nested_posted_interrupt() before checking !vmx->fail
> clears PID.ON and harvests PID.PIR into the virtual APIC page, but writes
> the updated GUEST_INTR_STATUS.RVI to vmcs02 where it is discarded without
> being synced to vmcs12.
>=20
> Also, if virtual_apic_page_addr could not be mapped (which forces a
> vmcs02 VM-Entry failure while leaving pi_desc mapped),
> __vmx_complete_nested_posted_interrupt() clears PID.ON in guest memory
> before checking !vapic_page and returns -ENXIO without harvesting PIR or
> marking pi_desc_map dirty, while __nested_vmx_vmexit() ignores the return
> value.

While not optimal, this is not a issue, as posted interrupt is not really l=
ost,
and since it only happens once per migration, I don't think that this is a =
problem.


Best regards,
=09Maxim Levitsky

