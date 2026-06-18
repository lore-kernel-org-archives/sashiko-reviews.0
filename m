Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB853F58C8
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 15:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795211; cv=pass; b=Il3g6k2GTb+clA2jmrSNdHzpSpsj0Znuq4WimqATWfYvhGCfqysa/qjXnG0AXNIBVFQWXhUGha/YXXE8KOBElkilxaosS6VXbRbe4nroNPE73Rc/LwqmHjkmhcsFj/iNM/VEV2p9Omd8AaLLoANpJaHfJheaZkZe37cZV3EcHGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795211; c=relaxed/simple;
	bh=OAxAzmYwdcy7zd8tpPxqe24/aSqWkYNzOFXNAJfuqwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=amIlT4j6Wz1HuGInZPFKOO0yzwtOmpWX4PL9gtGcxCnrerdL8xzGhXUth7GF4M9EPAqOPn/L1LdZqDf3L+vE+wqi9azFCAldYtgAEiB8MoamHQ5adIcEPlAks/rlYB0pOTW8qm+LZU6W8nTms3BfKRk8BSBk4UlHTqgHtmXn9yI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K3VqO5Wu; arc=pass smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K3VqO5Wu"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ad4d840d43so7748e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 08:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781795207; cv=none;
        d=google.com; s=arc-20260327;
        b=fPwvoOm31/zjykKqVXy+jFXjEqqrqTu+kZ9B7CTofckezMQvUaglrv8qlGzdjZxwpz
         dh8vSjy7ig0o5xvaVhZVqukr2MKbgbAY+54j/JoR8JX/sfEMG3WFpFRvpLVcNNvmiIzU
         eAYkdUSrQZfsMH7u6ttEQ8H/+96W3ZNLGkxvAr88CkYY44KwDRQ4yVAHzRkfyYphBce1
         AM/WAE/UOgluQbSR/iIeN4KE+w/pQvANlIpdrjiFfKiOglYxiga/GaROWFQMaz57RCd4
         HJIJAolU/5FwJYit9EiNAJSy22pWE3bVzNSX0bYBUpyXLEO6do2JvPqhbyyUasnDMMVT
         m0Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B+Kk4p+Z7Ji+kLPZDyM/vRpxyN8zCW/MQSdfnLHPQPE=;
        fh=vxFxEzPfV2TVZiF6T5th9UokvWy0tGwKR5SSoD4lX+g=;
        b=pjbnbZyHBTDpioNA0r2/DFi8eB3HkYpFJJ1KMii17CAmXmyimeWcmWlo+kqs1B4I/E
         kbxm1ur4/lmMXL5WU2ybZBx92+yfFb3RxqSlc2rmeXFQtIW0d7h95NhDgy1Lr9CpE0AH
         jkDeqvsUOIlnXM72kAyJ1s9IjXwDXuRQDFohbDlHPP+Du5vRY/Umhx4Dun2jWmDy651/
         9DXzeVg/Y4+YgNM62Dwb5s7FrN8llshCGvvcqKwzriFZ2chY44o2cOzG0eJE9vy1Ki6E
         gr0CFwQ1U4kIPo+bRT3toNcPxFst+t7ANnoIvquLy/a73bgI66s0DQAIS/nsNKLNx73K
         ekBg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781795207; x=1782400007; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B+Kk4p+Z7Ji+kLPZDyM/vRpxyN8zCW/MQSdfnLHPQPE=;
        b=K3VqO5WuIlVAaP7D4cx26aeI75UQ8WpbFR/6tagh7MWzAf2JnDJ4TlRUQS/ROgsz0/
         jcrCyI1pQ2/yzVitqcaINbQAZ6NwlWMvRJXaLI2FnTaLrwOyjG5/m9CGyUclPBK+mqfd
         1aika+Uxg65kJfvFiJ4WwHpzVCa7LR1ddstAyoEOWytYRtQH5VKybT1hc3TUMrveY6q0
         zIVSGZ24qW0QLB4WSY2Ur1kYQhpRV+gHFgv8l2XNTuq/2JzxCnxisggoRob/3qisyiRm
         iVgtoc3tdwA2su1VTsbeGYgrih2i+Cf3fcIq8TWkpnn04mjIX5L98xk0cPnRvcPL4yP3
         Ga0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781795207; x=1782400007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B+Kk4p+Z7Ji+kLPZDyM/vRpxyN8zCW/MQSdfnLHPQPE=;
        b=TNWGH3ubTAAb4CFxeAh1NzVgdiQIfyvpXEYlhgy2B0xfP2VC6jUehA7DKLUM2xs9iD
         iTpIthcQyFmfEOkPEzd0LRvn5lS4Chd6qK7qgR5PihX4Oum5n/Nwbd7Tah8q38uBVNwI
         bWOKMfNvMygDPrRkFjzTLzBgNFVGloAPRN21tSJk0FCRIFLb2+Pa1r0D9eUarCetvjTh
         6m3HXy1tvcCm20Iov1u6gIp+xCKpJeJNlovRYpzBCweVsVkXHG05j2IgfO5eN8HTEnNb
         cKZtTZ75DSgMt1uY3gBlqnWt9lHqOggRpeiBDrIdL8EfMN0rbOflBysF0ThUKe85V5qI
         cEiw==
X-Gm-Message-State: AOJu0YzElVrnmcHv6uAZsljf7rVzcXL4JpN+kMuIVlxUjU1kcKZCZh3h
	ugnKb3IHxRTAPBTNw/+tIqiWLS/qgt7ZfMqu2GDBLfIYsluSh2qDe+SytlHRclcvubsLMC2kSrl
	gSAWKgqBo6KUjF35RykHwJnSD4YqElzlu2mgfxGgZ7Nx7fVmKqNd6MQEZ2Bc=
X-Gm-Gg: AfdE7ckwA7366haKNASDGk1fL9T97HI4DhUTm3V/0/k4A+gBP90+ON3Vqm8GGP1cIeA
	klCRY36Y1XbafQnAXQEjS+xNiXrBPI3QXPzQplh3S+rwVdpCzEGsDvRfpwy5dR/iloUsoVqm0aw
	zXSNMeMaWrVoOyLQrv4JAtZncFWRTy4xS1x7RF5HPJiFlecf1KbK1O+EM7IWoS44b3flVvd1taP
	i0J9wc1gB7VIEvtS75OLCCXlW/HmXp2sFxIQB0YhkwsAyZyNiwuiCidc1udNmNxxm4XEpl69hib
	AYBq8b0v
X-Received: by 2002:a05:6512:1287:b0:5aa:8842:241f with SMTP id
 2adb3069b0e04-5ad4dba1941mr161077e87.12.1781795206552; Thu, 18 Jun 2026
 08:06:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618121643.4105064-1-tabba@google.com> <20260618121643.4105064-7-tabba@google.com>
 <20260618123349.1F2ED1F000E9@smtp.kernel.org>
In-Reply-To: <20260618123349.1F2ED1F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 18 Jun 2026 16:06:06 +0100
X-Gm-Features: AVVi8CcxJ-IsB4OvmQz77gg32emdl0ycJsg7W-qphmraRq1ydJgHihXlkYAdfEE
Message-ID: <CA+EHjTzAXQYZ9XYEXxihZOsx0AN3HBKXtZJcndCS=i+UYQzznQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] KVM: arm64: Set IL for nested SError injection
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Jun 2026 at 13:33, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The SError syndrome constructed by `kvm_inject_nested_serror()` =
(including the newly added IL bit) is a dead store because the downstream i=
njection logic silently drops the syndrome.
> - [High] When a Synchronous External Abort is routed to an SError via FEA=
T_DoubleFault2 (`EASE`), KVM incorrectly populates the ESR with an IABT or =
DABT Exception Class (EC) instead of the architectural SError EC.

https://lore.kernel.org/all/CA+EHjTyJUrHZJiM9e2r20_1JLzWQg-+TAr9g720njugLMW=
TpGw@mail.gmail.com/

Cheers,
/fuad

> --
>
> commit 889dc0193654a25a0ce52006ebe91e58fc4c4ed8
> Author: Fuad Tabba <tabba@google.com>
>
> KVM: arm64: Set IL for nested SError injection
>
> This patch modifies kvm_inject_nested_serror() to unconditionally set the=
 IL
> bit in the SError syndrome, as mandated by the architecture.
>
> > diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-n=
ested.c
> > index b74369e9ad7ff..6f12496cae815 100644
> > --- a/arch/arm64/kvm/emulate-nested.c
> > +++ b/arch/arm64/kvm/emulate-nested.c
> > @@ -2938,6 +2938,6 @@ int kvm_inject_nested_serror(struct kvm_vcpu *vcp=
u, u64 esr)
> >        * vSError injection. Manually populate EC for an emulated SError
> >        * exception.
> >        */
> > -     esr |=3D FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR);
> > +     esr |=3D FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) | ESR_ELx=
_IL;
> >       return kvm_inject_nested(vcpu, esr, except_type_serror);
> >  }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does the constructed syndr=
ome
> value get silently dropped downstream?
>
> Looking at kvm_inject_nested(), it forwards the esr to
> kvm_inject_el2_exception():
>
> arch/arm64/kvm/emulate-nested.c:kvm_inject_el2_exception() {
>     ...
>     case except_type_serror:
>         kvm_pend_exception(vcpu, EXCEPT_AA64_EL2_SERR);
>         break;
>     ...
> }
>
> The except_type_serror case doesn't write esr_el2 to ESR_EL2 (unlike the
> except_type_sync case), and downstream exception entry code doesn't write
> it either.
>
> The constructed payload appears to be entirely discarded.
>
> Would the nested hypervisor observe a stale ESR_EL2 value when taking the
> SError, rendering this fix functionally ineffective?
>
> [Severity: High]
> This is a pre-existing issue, but when a Synchronous External Abort is ro=
uted
> to an SError via EASE (FEAT_DoubleFault2), does KVM incorrectly populate =
the
> ESR with an Abort Exception Class instead of SError?
>
> In kvm_inject_nested_sea(), if SCTLR2_EL1_EASE is set, an SError is reque=
sted
> using an ESR constructed with an Abort EC:
>
> arch/arm64/kvm/emulate-nested.c:kvm_inject_nested_sea() {
>     ...
>     if (__vcpu_sys_reg(vcpu, SCTLR2_EL2) & SCTLR2_EL1_EASE)
>         return kvm_inject_nested(vcpu, esr, except_type_serror);
>     ...
> }
>
> Similarly in arch/arm64/kvm/inject_fault.c:inject_abt64(), the ESR is
> populated with ESR_ELx_EC_IABT_* or ESR_ELx_EC_DABT_* before being writte=
n.
>
> Architecturally, all SError interrupts must have an SError Exception Clas=
s,
> even when representing a routed SEA.
>
> Does supplying an Abort EC violate the architecture and provide the guest=
 with
> a malformed exception syndrome?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618121643.41=
05064-1-tabba@google.com?part=3D6
