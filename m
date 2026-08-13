Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8FC43F0A6
	for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786608630; cv=pass; b=U1sfrKgQWtgcLKGFR9NciClLmZNANgxI6tTMAKzzO6f6plToyyaw8zEjrSrq/fSM9mESgRavVCFcWQDPqDiz5UMeXJS8nagXkdOmwibz4vZBIaPV395B0YH21kmYte8F6Np4/FZWLCMcWzbm3stcxu8ZVXxxKXuzUFjpEardr6U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786608630; c=relaxed/simple;
	bh=niJTrQimvgcND0qsT4lU4KxAPaq3dvYplsB6A+l+Zog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ea1BQr6jX49W+t8yCb7BpJf0/xD4HunAcZ/hvFJyaJ/tMcGmFz52RS3BAgkdHmr3ipQ1QrYUOlBKL+2DVt8ffvxrTpqFl7Tg2g0sBkp1AqolgGiQZj47zxJ/IPdQ1IYEQZfn1iNmpJJ4XmCw1hEgM2X8K8UHSWnAImOMKlS4Qj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPHULMYC; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPHULMYC"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7ff05e5d009so20203497b3.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 13 Aug 2026 01:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786608628; cv=none;
        d=google.com; s=arc-20260327;
        b=eeHugRghdzyFg0lVHgj/gxvgw1QTi5KWyV7+NW/f4Xze71b6symczR0RiGcBLFGwGB
         R7t50Of93ZSuzmDLsB3rLDixaUWE835L1ky3YIEbDo2iAMXCUAziAKSBOY+wjoq12UUo
         d4/DMg6bO0Jd49F4ybrMpNmyYGB2vsIMEiuee9aUhbC9NmNFGcqQ3xfAO71bh6UtPTrY
         1E244A+0V+oZDv6CcNXPYVmv/10uLLRX1H7XI2Ta9Pg+rF4CaMixlQ7mgQKUphATWO3M
         giCoCBIzQ1xUOz5JLTp1hPUYzqFxKkYVDNN4LcLanUCtG39B2cPmKTR73GBEqbUSWkZT
         Xztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oKtx0i4elGHzS/TrpdIRihoilG6TmZJLuqjz3TSb5KI=;
        fh=FonJYf1ANnisU4uqs4ZRAk47a6DggmByevp78CSlRTE=;
        b=DGjVpEs13095b9pHIyef6Y5MaSsaQazAGv6Siq1UIHmsJZ/B3DgBrfO+fh6DElxUgB
         DlgBtZ7CTwkFIJzBVdPA4Q6JdfWX08oKYYfoB2tKavWPiHfrN5rBPW62r3z0LaCnfehs
         +Ww/l0MJzu3Q4l+XPJj9qosltJFJ8D10C1LQyS4KRYDPXjSIr4yXSMJ+4IK4E+wL2LyJ
         Rkj/3mf9DiV3CagXAKo6dwxOJ39ck5g8N9JbM3siGXPNLbpvR16YVgOalfmuXTHea6yc
         Ezkh66hIiFUhYEWoawhV1d4lEE5tA4BOgpTA4SzDHdiXtNN7RzCdUgWW0BArml+VqTuD
         4h5A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786608628; x=1787213428; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oKtx0i4elGHzS/TrpdIRihoilG6TmZJLuqjz3TSb5KI=;
        b=pPHULMYCdYMYE4zqb5OjGHuMfFMxn85pwKO/McE9NSUZrdF5jPiWlMLY0ArOExKAJM
         NtAt1Q76zIw2e7e7jsyRLVYo112+96n4S7xQ++a/9Q5CEmGBx6EE/Plrg/RSgu+EKbpd
         o5T5GFyHc6JkaUjXbLuwogGc+Xpk92x94Lnn7nF0iJomRHSTpwZWObAFZWV1LRmpWnED
         n50en4KYdDs+BJcCIjRFS/B19Lka9Yfi3nEB2jkgoSyLb7AlpMQvo8DN1p1OAOKUzHoC
         FtRML9mq1+INPYgLvz1hrtZhfklarc6HBBQ1pkOKCRmqW57bImckCn7fY31tMEfhGYkF
         0ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786608628; x=1787213428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oKtx0i4elGHzS/TrpdIRihoilG6TmZJLuqjz3TSb5KI=;
        b=oWpTINuy/iD4STV1HlqNHLDIBNMZA1kUI00aIJCe33eIQpArEgASvbYgqbV+TeVWVj
         ypICEk1OUPg0YziIS+ejNZ/qUQlVtM54IvsJb63Nb4k+10/lVpf7cB14sDOIrH3ZqW4P
         iJUxSZozanzYAp8Q19UKXLE6nAD2bstyenqfq5eWx9hNnsw+PRRPV9UCVMikoWZjsmmG
         UhdzvdUf6Dz2Y9eB9eQeVlHmHApstcIK7jZh3IwJGTVOkmWYCqgHVsLAGt8bvu3aW6iy
         /OjlVv5ygTdZ+UPR4i5Lxq6fxxX3cZEJ4WKp601scxfmjZWJeGnmfUtIIEwd0slHfUMM
         Zr3Q==
X-Gm-Message-State: AOJu0YwpmIyuzbjp5MQkY0etC5sINSrUiiRnoYKoop0I8827xRTPEVlY
	I37o95CcQjRYTLZB1+BkgZujcJxJYbVPGijuj+sK+/7TPDXLrV5qwQgaSWk0N3d3tnpEFLtssUj
	O9hKoO0kPskIs9Cr5S40PwOyT3oAES9KUcYW1cCU=
X-Gm-Gg: AR+sD10hgShzzSR1hiIWv53YvDddcbZGn+4exLkpbHvdeLHZAGI8Jvy9wXIRxA4fYw+
	u+xmvgXDZUeN6pADFbne4wDlc+toDXv4kLpAP6fz9T+kExQAUhbKxK8eRz32lObQ1AI5v9Gd6tF
	ErQXVujSrTPAuEOIM+LH8d9nSOOLptjTziBH85L9uKZGg6Zkd2SbVdCgoyUwCjj4ED5D8AJW+sd
	dEwOQNPHzXVYWJOkNDkJKNqk2p3YIytCwvtHY1tz/fL5GTgElQA1p2nrHc3VlHYz7iuyWxpq7mE
	wa70QM9bOIdIiJxCN439XSyAC9UYkcdxcwP8WJLR2vT1HmIYOgGkfPmbXxDzzcv6aPU0jdRx/sw
	F
X-Received: by 2002:a05:690c:e0ce:10b0:826:8d41:897a with SMTP id
 00721157ae682-83471a15e8emr15505347b3.13.1786608627750; Thu, 13 Aug 2026
 01:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813043932.3214460-1-rkskek9254@gmail.com> <20260813045727.903981F000E9@smtp.kernel.org>
In-Reply-To: <20260813045727.903981F000E9@smtp.kernel.org>
From: Jinwoo Lee <rkskek9254@gmail.com>
Date: Thu, 13 Aug 2026 17:10:14 +0900
X-Gm-Features: AUfX_my7pDDZdtOGVM6xAlmp3xb5ZCqcno-jeV0YYXEDFl_sKpw6E4hQlOTbqJ4
Message-ID: <CALz4YMQa4h0oHxrpsiFsPd2qWZO1Q-pE2mbDwvT2wV1b+ukZdg@mail.gmail.com>
Subject: Re: [PATCH] KVM: nVMX: Re-arm the vmcs12 pages request if mapping the
 pages fails
To: sashiko-reviews@lists.linux.dev, seanjc@google.com, pbonzini@redhat.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Resending as plain text; the previous copy was rejected by
kvm@vger.kernel.org because Gmail included an HTML MIME part.  Sorry
for the duplicate on lists that received the first copy.
---
Thanks for the review.

> This is a pre-existing issue, but should the same re-arm be applied to
> vmx_get_nested_state_pages() and svm_get_nested_state_pages()?

At the request-lifetime level, yes.  kvm_check_request() consumes
KVM_REQ_GET_NESTED_STATE_PAGES before get_nested_state_pages() is called.
If the callback returns false, the request needs to remain pending;
otherwise a later KVM_RUN can skip the deferred setup.

On further inspection, re-arming the request in
nested_get_vmcs12_pages() is too low-level.  That helper is also called
directly from the normal nested VM-Entry path, before enter_guest_mode(),
and that caller switches back to vmcs01 if the helper fails.  I will move
the retry to the KVM_REQ_GET_NESTED_STATE_PAGES consumption path in
vcpu_enter_guest(), or to an equivalent wrapper, so that the request is
re-armed only after it was actually consumed.  That will also cover
failures returned by both the VMX and SVM get_nested_state_pages()
callbacks.

The eVMCS path needs additional handling beyond a generic re-arm.
nested_vmx_handle_enlightened_vmptrld() releases the old eVMCS mapping
before attempting to map the new GPA.  If kvm_vcpu_map() fails,
hv_evmcs_vmptr is left as EVMPTR_INVALID, whereas
nested_get_evmcs_page() retries the mapping only when hv_evmcs_vmptr is
EVMPTR_MAP_PENDING.  Re-arming the request alone would therefore not
necessarily retry the failed eVMCS mapping.  I will preserve or restore
a retryable eVMCS state on that failure path in v2.

For SVM, I agree that failures in load_pdptrs(),
nested_svm_merge_msrpm(), and kvm_hv_verify_vp_assist() can lose the
consumed request, and that L2 must not resume until the deferred setup
has completed successfully.

However, I do not currently see evidence that the SVM failures have the
same unpinned-HPA/UAF mechanism as the nVMX APIC-backed VMCS02 fields.
In particular, nested_vmcb02_prepare_control() initially copies
vmcb01's KVM-owned MSRPM address into vmcb02, and
nested_svm_merge_msrpm() switches vmcb02 to the KVM-owned merged MSRPM
only after the merge completes successfully.  Losing the request after
a failed merge can therefore allow L2 to run without L1's complete MSR
intercept state, but it does not appear to leave hardware pointing at an
unpinned guest page.  I will describe and test the SVM impact separately
instead of treating it as the same UAF without supporting evidence.

> Does this allow L2 to resume with unpinned HPAs and lead to a
> use-after-free?

Not uniformly across these paths.  The unpinned-HPA mechanism is the
concern for the nVMX VMCS02 address fields described in the patch, but I
have not yet reproduced host-page reuse or an actual use-after-free end
to end.  For eVMCS and SVM, the current evidence establishes that the
deferred setup request can be lost; it does not yet establish the same
unpinned-HPA mechanism.

I will also correct the commit message.  Not every failure reports
KVM_EXIT_INTERNAL_ERROR: the load_pdptrs() failure used by my RSM
reproducer returns with exit_reason unchanged, which is
KVM_EXIT_UNKNOWN in the test.

I will rework the patch and selftest accordingly and runtime-test the
fix before posting v2.

Thanks,
Jinwoo


On Thu, Aug 13, 2026 at 1:57=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The patch fixes the missing re-arming of `KVM_REQ_GET_NESTED_STA=
TE_PAGES` in `nested_get_vmcs12_pages()` for VMX but overlooks identical vu=
lnerabilities in `vmx_get_nested_state_pages()` (VMX eVMCS) and `svm_get_ne=
sted_state_pages()` (SVM).
> --
>
> --- Patch [1]: [PATCH] KVM: nVMX: Re-arm the vmcs12 pages request if mapp=
ing the pages fails ---
> commit ce93ee9654c7f639f51372bb8a7e1b25a376436b
> Author: Jinwoo Lee <rkskek9254@gmail.com>
>
> KVM: nVMX: Re-arm the vmcs12 pages request if mapping the pages fails
>
> This commit ensures KVM_REQ_GET_NESTED_STATE_PAGES is re-armed if
> nested_get_vmcs12_pages() fails to map the pages. This forces KVM to retr=
y the
> mapping on the next KVM_RUN rather than resuming L2 with a stale vmcs02, =
which
> prevents hardware from accessing unpinned host physical pages.
>
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index ddf6df7bee93b..9e9bd6c541baa 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> [ ... ]
> > @@ -3525,6 +3525,20 @@ static bool nested_get_vmcs12_pages(struct kvm_v=
cpu *vcpu)
> >               exec_controls_clearbit(vmx, CPU_BASED_USE_MSR_BITMAPS);
> >
> >       return true;
> > +
> > +fail:
> > +     /*
> > +      * Re-arm the request so that KVM retries the mapping instead of =
running
> > +      * L2 with a stale vmcs02.  Bailing here leaves the vCPU in guest=
 mode
> > +      * with vmcs02 loaded and its APIC-access, virtual-APIC and poste=
d
> > +      * interrupt descriptor addresses still pointing at the host page=
s that
> > +      * were mapped for the *previous* nested VM-Enter, which have sin=
ce been
> > +      * unmapped and unpinned by nested_put_vmcs12_pages().  KVM retur=
ns to
> > +      * userspace without leaving guest mode, so if userspace resumes =
the
> > +      * vCPU, VM-Enter succeeds and hardware accesses those stale HPAs=
.
> > +      */
> > +     kvm_make_request(KVM_REQ_GET_NESTED_STATE_PAGES, vcpu);
> > +     return false;
> >  }
> >
> >  static bool vmx_get_nested_state_pages(struct kvm_vcpu *vcpu)
>
> [Severity: High]
> This is a pre-existing issue, but should the same re-arm be applied to
> vmx_get_nested_state_pages() and svm_get_nested_state_pages()?
>
> If nested_get_evmcs_page() fails in vmx_get_nested_state_pages(), it retu=
rns
> false and exits to userspace with KVM_EXIT_INTERNAL_ERROR without re-armi=
ng
> the request:
>
> arch/x86/kvm/vmx/nested.c:vmx_get_nested_state_pages() {
>         if (!nested_get_evmcs_page(vcpu)) {
>                 pr_debug_ratelimited("%s: enlightened vmptrld failed\n",
>                                      __func__);
>                 vcpu->run->exit_reason =3D KVM_EXIT_INTERNAL_ERROR;
>                 vcpu->run->internal.suberror =3D
>                         KVM_INTERNAL_ERROR_EMULATION;
>                 vcpu->run->internal.ndata =3D 0;
>
>                 return false;
>         }
>     ...
> }
>
> Similarly, in arch/x86/kvm/svm/nested.c:svm_get_nested_state_pages(), if
> load_pdptrs(), kvm_hv_verify_vp_assist(), or nested_svm_merge_msrpm() fai=
l,
> they also exit without re-arming.
>
> If a compromised QEMU sets KVM_REQ_GET_NESTED_STATE_PAGES and KVM clears =
the
> request but fails in these setup steps, a subsequent KVM_RUN could skip s=
tate
> setup and proceed directly to VM-Enter L2 with stale control structures.
>
> Does this allow L2 to resume with unpinned HPAs and lead to a use-after-f=
ree?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813043932.32=
14460-1-rkskek9254@gmail.com?part=3D1
