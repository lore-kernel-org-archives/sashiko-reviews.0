Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE443630BA
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 21:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582517; cv=none; b=RoQpbVhrCVdzT7ICNbENacHf7f8IRFhQqLJRcQOePgPkJgLGlzV1kSsMJ3seAzVMkPH2cBkoPV5SSH5lNAnDmFYqvzUPKO2TAmtHeoOQjszqMAu8mKx3V7e/5LBAp1ZV+F1xAEG8j1t3uvPVue/cuwvCynhgsdEDzkjerQxQVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582517; c=relaxed/simple;
	bh=AgwAttBawwe7fMjD4WDOWaQlErByDMoTSd/NvVzjRhQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=alNJ1OFbY1XxX1fwf7P72CBKZzn9mNPFnvrUA1cJNY/WY2mHx5koonlFuraZmW4Qj5OHIQm33SFZngpoz4O1DUTENQ5ZO7MSBYXKUBnp49YC/uwRxbqKJD911u6pwnBuDSsZjtVTjqsdJKWVv413NIrO6J5ljyfM6YuLsp0CEIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MPohEe/B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MPohEe/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791582513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AgwAttBawwe7fMjD4WDOWaQlErByDMoTSd/NvVzjRhQ=;
	b=MPohEe/BMNkiBL0k60KW2DXOL5TaGHWwr7yeQOz21prhktbwQLumezPEIMLEw/VA2uHB0d
	MwdfeHWWmrc1vNRD68cMkKapKsMrF91L2mvnDbR3L8HD68VZGCyDQRl9QjwdI58S9xWGzl
	o5xXsJRYN8r0U6EBC8kmmWzOC786i5U=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-OH2ClYtrN9SfwWA9OjGTiA-1; Fri, 9 Oct 2026 21:48:32 +0000
X-MC-Unique: OH2ClYtrN9SfwWA9OjGTiA-1
X-Mimecast-MFC-AGG-ID: OH2ClYtrN9SfwWA9OjGTiA_1791582511
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-917bab67568so8666886d6.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 14:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582511; x=1792187311;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mGgqFDCfD+EtiLU0tPlWyAake8xNIynE3W4jW4V1afM=;
        b=SIkfpTTbQYMtKUpm7jiEj6f32KWMc/nWeRYt48bxCvio8/3hNKHvkDLfxoRVq16/MQ
         et2PmqvM2h+szbOdkVKDAZRgd87jIR+1PF9YLizCqigdi7gmr9o8rEyQac/FwFXhQvzO
         XT4r4v9HTeUUMBh9eLy9jBqSI315rHxStqVOkyuQn+p/SQIQ31v18GVQevWRulOIZiVQ
         tMLsZbVSTjA9qsJ9bV1I3z4pQGZxf9wZSw58amvZipDdY9IOoRnRoxPngj04Z2HZzkib
         /SxZIreMvo89vtnn54ix3nzeLbHOjN2FtsUj6nJHDWx10XzUL9ODTQqaRT2lSe4MACgz
         Xz8A==
X-Gm-Message-State: AFq9FYJYcp87o1LNLOwHiqJi8rqsezQR9VRnobmYzA7DnT7kMoa75j8k
	VsWPFtkMNw+L1DS4rG8RJ5PWCxlLj7pmAsrPJ/LVXRx55Bqbu4HJ3fNZH03yp4T6fOsOQRdmeD6
	D2nm39crQiEMZ0vS9e2HRDHggnn+BFIxmRgDFevqpYm1MGInff99vbRm6wd4UgQAZrt6F5QimOI
	mDnWSMY73ddzNvcRkbNCn5UtsJ8zxb26jzttvZ8uSUCTcDN0Yr027kBg==
X-Gm-Gg: AYBFou08Xg8+YQyVVI4tBQHOHPsluiqF0yMdIAx11dwyWgyYTcxVCI9zxH9EcR9w+SD
	6kWIsqf3TfYnzv+TgOwOp8ziNWmLXmUEoClHQ5rpUgvpWYydBlsy20CdvxDNHpO8sQ46U5TEsvP
	hBuPuAdo6gdPtC28uo/4X8Gnfkydbz/IeX10d2iuGPPYQukppj+J2MaGiHGiPPONtPZTE0qUHCX
	VLe3MFPlReczQ1w8RWpKNZfVn/knq/gL1xg8QA/Bvo9kFshjo7qC2O50pWlJMLsx4Q2JVdbvur4
	dOQPNe/JCLwHGq5Y9s/ftAOuUIKS+wiK22CyuJf7bXyOwbxNb7tgILEzL5UfZPxMhirPE/HHCVY
	2AdL1MDipjunsCaDRZPtD7xdF2Egw5hEd9tKsdh1PPfiQJv4MXyUfj60y9p9ExMtul2SWdBt4fk
	W28nHEQ9Yk
X-Received: by 2002:a05:620a:468b:b0:93c:6fa0:9813 with SMTP id af79cd13be357-93ebd24ba2cmr594926785a.43.1791582511477;
        Fri, 09 Oct 2026 14:48:31 -0700 (PDT)
X-Received: by 2002:a05:620a:468b:b0:93c:6fa0:9813 with SMTP id af79cd13be357-93ebd24ba2cmr594922085a.43.1791582510880;
        Fri, 09 Oct 2026 14:48:30 -0700 (PDT)
Received: from mlevitsk-thinkpadt14gen3.ibmmarkh.csb (pool-173-33-204-162.cpe.net.cable.rogers.com. [173.33.204.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb984845csm282095385a.14.2026.10.09.14.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:48:30 -0700 (PDT)
Message-ID: <a836b841e730db8ded250a34748bef7573e8932c.camel@redhat.com>
Subject: Re: [PATCH 2/2] KVM: nVMX: avoid losing the posted notification
 interrupt when exiting L2
From: "mlevitsk@redhat.com" <mlevitsk@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Date: Fri, 09 Oct 2026 17:48:28 -0400
In-Reply-To: <sashiko-outbox-166067@kernel.org>
References: <20261009205036.672523-1-mlevitsk@redhat.com>
	 <20261009205036.672523-3-mlevitsk@redhat.com>
	 <sashiko-outbox-166067@kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: paro-wNrqTuS8bHoi3sRLXuRmrRvVg0UKfcsU4pY18M_1791582511
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2026-10-09 at 21:03 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] kvm: x86: out-of-bounds write in kvm_lapic_set_irr due to u1=
6 promotion bypass
> - [High] kvm: x86: guest-triggerable WARN_ON_ONCE and pi_pending state le=
ak
> --
>=20
> commit 00e061d66b6985b4612f371acc0c5f41a6c597b6
> Author: Maxim Levitsky <mlevitsk@redhat.com>
>=20
> KVM: nVMX: avoid losing the posted notification interrupt when exiting L2
>=20
> This commit detects if a posted notification interrupt is pending during
> a nested VM exit. If the target vCPU is about to exit to L1, the
> interrupt is injected into L1's APIC to avoid losing it.
>=20
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index 11362aad2bc8a..66c4cf7f6e00f 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> > @@ -2445,7 +2445,7 @@ static void prepare_vmcs02_early(struct vcpu_vmx =
*vmx, struct loaded_vmcs *vmcs0
> > =C2=A0=09=09=09 ~PIN_BASED_VMX_PREEMPTION_TIMER);
> > =C2=A0
> > =C2=A0=09/* Posted interrupts setting is only taken from vmcs12.=C2=A0 =
*/
> > -=09vmx->nested.pi_pending =3D false;
> > +=09WARN_ON_ONCE(vmx->nested.pi_pending);
>=20
> [Severity: High]
> Is it possible for an L1 guest to maliciously trigger this warning and cr=
ash
> the host if panic_on_warn is set?
>=20
> Since the patch no longer clears pi_pending, could this state leak occur =
if a
> nested VM-entry fails early after enter_guest_mode() is called? For examp=
le,
> in nested_vmx_enter_non_root_mode(), the failure path
> vmentry_fail_vmexit_guest_mode calls leave_guest_mode() and returns to L1
> without executing __nested_vmx_vmexit(). This would leave pi_pending
> uncleared.

>=20
> Additionally, could there be a store-load race here? During normal VM exi=
t,
> leave_guest_mode() clears HF_GUEST_MASK, but there is no memory barrier
> enforcing visibility before pi_pending is checked further down in
> __nested_vmx_vmexit(). A concurrent posted interrupt delivery might read
> guest_mode =3D=3D true and set pi_pending =3D true, while the exit path r=
eads
> pi_pending =3D=3D false.

Then I'll clear it on both VM entry and VM exit to avoid these cases.


>=20
> In both cases, pi_pending remains true when returning to L1, triggering t=
his
> warning on the next nested VM-entry.
>=20
> [ ... ]
>=20
> > @@ -5151,6 +5151,14 @@ void __nested_vmx_vmexit(struct kvm_vcpu *vcpu, =
u32 vm_exit_reason,
> > =C2=A0=09kvm_clear_exception_queue(vcpu);
> > =C2=A0=09kvm_clear_interrupt_queue(vcpu);
> > =C2=A0
> > +=09if (lapic_in_kernel(vcpu) && vmx->nested.pi_pending) {
> > +=09=09vmx->nested.pi_pending =3D 0;
> > +=09=09if (!WARN_ON_ONCE(vmx->nested.posted_intr_nv =3D=3D -1)) {
> > +=09=09=09kvm_lapic_set_irr(vmx->nested.posted_intr_nv, vcpu->arch.apic=
);
>=20
> [Severity: Critical]
> Does this guard actually protect against injecting an invalid vector?
>=20
> Looking at struct nested_vmx in arch/x86/kvm/vmx/vmx.h, posted_intr_nv is
> defined as a u16. When it is assigned -1 in prepare_vmcs02_early(), it
> truncates to 65535.

Yes, the fact that vmx->nested.posted_intr_nv is u16 wasn't noticed by me, =
because
it set in several places to -1.
I''ll switch to a more robust check.

>=20
> Due to C integer promotion rules, the expression
> vmx->nested.posted_intr_nv =3D=3D -1 compares the u16 value 65535 to the =
int
> literal -1, which evaluates to false. This bypasses the safety guard beca=
use
> !WARN_ON_ONCE(false) is true.
>=20
> If pi_pending was leaked as described above and PI is subsequently disabl=
ed by
> L1, wouldn't kvm_lapic_set_irr() be called with vector 65535? Inside
> kvm_lapic_set_irr(), calculating the bit offset for 65535 falls far outsi=
de
> the 4KB APIC register page, which could result in a severe out-of-bounds =
write
> into adjacent host memory.


>=20
> > +=09=09=09kvm_make_request(KVM_REQ_EVENT, vcpu);
> > +=09=09}
> > +=09}
> > +
> > =C2=A0=09vmx_switch_vmcs(vcpu, &vmx->vmcs01);
> > =C2=A0
> > =C2=A0=09kvm_nested_vmexit_handle_ibrs(vcpu);

