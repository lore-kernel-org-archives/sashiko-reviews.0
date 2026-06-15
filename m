Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586C03F1ADE
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 13:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781529211; cv=pass; b=SVF/NQz3vne2a+kZwFUMt8VYDZdJ3vmNWIxNi0wLpiERtrP24xIdRXycnd5cLuPn7vW/H7h/0wjBGIx+PIDJgW2fL9bGp1J75QJSEbEo5QvkYrJuu2PCTqVZVhu3YaCfqgOFod9Xi5MwTUAf+Mr0bbfqU2XJRfi2yFPDbnFIs4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781529211; c=relaxed/simple;
	bh=JFSXX89TRMF0cmJ1cK7Y0aUHUQ3U5IIYGQ/no+czA+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PuXFMdo+mmf8QVPCBPoKEnUlrr7lzzrrrYJToChV/cUttjGXorcydvbYytLO1FlbszxwGbmTAe95bu8vJc1ksLrGcjhZb8uHnBxUQMQ9hZurl27LBlbrYA5FMdAzb3QNruavMFe2jMnzbVX1wylwC8zTX0BSn3XFjfQ6+OsjXtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LD+vSaph; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LD+vSaph"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5175d339e8bso999931cf.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 06:13:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781529209; cv=none;
        d=google.com; s=arc-20240605;
        b=kJdaLtuKdw7VVcD92mArxp4UWcn//bZZPRlMuY6/8BZ0HyJTGcNCRD53ecSgoBWxRn
         NikGKUuxQlAHB1uCgEskVhcWOq0oqpZAbDNrk21wIyfyLfE3YnTd8VCRf/MgH8xPH6hK
         gO55DMpB25i97CBI4zhcEUYkIOneBBCdFJ00MWfUd6QAXpDuevCpUjkjehq9TcudMzjE
         4TyNfSVkIQzrunCq4ETk/dxOdETUeMW4Vrtwf1zCFdUXFxleXcx5HhXBUChnyNUrsQh9
         B9ayL7mxEgR+7UnU+TYMQuZ2oDRZFXEi90HJ/3LrNI2rQvWkqVfQ5pmEAWDdAWguj/my
         fzlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2In6AGzrSURwEbShzRwtRfVTt7zDjTYOHDQU3MzBeLw=;
        fh=i8dP7DtcVdcEwXLR4YFks8kJGWomNyz8GNHm/+LeWHs=;
        b=WF8pxoA8C9uLjN91L4hH3JKys2gGGAEARAMznlEAebpFbVsCzZC23qJdcWbaug2YuE
         ZHYgcUOYTMg8So+zBDnZAkBfWLzk5+jD1RTQ80A3c7pN+mq0fDbtVgGZgJasyoHpFOR4
         glir1ORkVSNDRrqHVAFkZ8HW05frOoF22TgOPDtkVC4O9WwmG467mr8hD/ANU0K0d1bh
         DENvUiomkD0YJsGBWjGr8m9cUtbn51Pxn3dswYoQqcIcoGb2q2a/EGDPx5RQEYCe7jk4
         6f4LnaLNJjnsvKvX5e++0VM+o9pTVSrBO7eYr6ky6uhLeE22Jcqq1/kvKOEj7aCUnwWm
         ypfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781529209; x=1782134009; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2In6AGzrSURwEbShzRwtRfVTt7zDjTYOHDQU3MzBeLw=;
        b=LD+vSaphrhJfopfM9hRC12Lj2m8vjAu6J0eDmb6MK3enxFlOB2t1gB8ZV+jfUwwOgC
         gznXN3ZiFTOIlScIlRSqnKEKymBVR9FK+axf3RMwe2xwdrErp6eKZlKmMKSOR8O70xk1
         2m3LldtWl3LZFRxtW7j/9+WkkKmARvT4Cy90IV06928CKY0YRqWAwVGUDQgnHLqKwe72
         J02g7vvN5uFj9bkw3yZBwaQa1kxBcRF0dm1S+XFhzbKgQZgwRVV+CVAjrruU1rKefgag
         ohLynfATHcLojaXzQc9bjWbVzabtRPS47gGbU3cbBSFnpUuMIodcPFn6t1uusfNAW7zs
         LLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781529209; x=1782134009;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2In6AGzrSURwEbShzRwtRfVTt7zDjTYOHDQU3MzBeLw=;
        b=Ie9Y8VZOs+/LO9TindTKV3a/ms2G8nURA4AzhyqQd8cDR8uQFnMCS0V/cbbfyC4GTL
         7W3CQF22ka2soBIgX9NbvX62yOadgVDVk0M5g3P6RHrtsDK+n7nI8qCHcdQ6w86a52EG
         1p9Kup3kCCnZMNt4G7Df9OIVbiTNeVXL5c1zXWf0sc7KxsM5c4X6QzAjitW0BjNVxrJA
         8+kHCSAMqPn4IAnXIAeYe9B2r/jYBaTsyzrWhpX1sv9swMKlSKElROa4dFDxPD9a5xhz
         871g42plpiLuoNQ6thaT5+0gZG8CpT0MFBT3VLVR8AVTO74YTkKNNnaVaKnVwPVYRMiV
         3OxA==
X-Gm-Message-State: AOJu0Yyv2QpNK8MaBb+ggFl2IuosfWX+0hvQuCFPsTOutowwGZnblNOn
	R+JfPCqx1SD5vqHD1hJ1AO/C1M1QYPXE3ZyUQIe6BP0CMTOUUVjHnUIrQn7Zars1owCh4qdRVqS
	WQkp81MCzoXaVYItqw2bjNIsbj98gRK+/159qNWgo8uvZk9Y4GlSYfWl2LdU=
X-Gm-Gg: Acq92OGJ3srePxQdeeON0x80Rzzmg9aUa+KGqvO9lOO8nf+H1D3aensLQIhxMnZEMwa
	6jG/gVJ1THAez+Uc9NV6NObmhuCF0TOy0ou9c1WYBC+9B2cWSTIs7yc8pFqJaS4YD/Y8kcaDFG4
	8tLFjr1S2G3tjNJlLeSfOahp6M7GiszJZaVxnqikY0GUKICpqZ3SA7UYjRbqagTou1Sg67hHZ9s
	Qc3/u0+v6ktwgHlwYcnz9ChOPrVoO55AxLeOhTpO5HkHMbhZqlNFTGHgsogg3c4lGJ288U6W+5w
	s/9hB8un
X-Received: by 2002:a05:622a:4cc8:b0:516:9871:9a37 with SMTP id
 d75a77b69052e-519872e7661mr1495431cf.3.1781529208275; Mon, 15 Jun 2026
 06:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614163336.3490925-7-tabba@google.com> <20260614164416.D37E61F000E9@smtp.kernel.org>
 <ai-DsLydd7ry0RpS@kernel.org>
In-Reply-To: <ai-DsLydd7ry0RpS@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Jun 2026 14:12:51 +0100
X-Gm-Features: AVVi8CcO8m7JqCdVLIloH1KAihfPBodYuoCe0_y-y0JfcVg7oXzuQgANsW62kFI
Message-ID: <CA+EHjTxn56a-NsNhYns6RSNkqTO+oujM9qnK4JaV0wJmchT43Q@mail.gmail.com>
Subject: Re: [PATCH 6/7] KVM: arm64: Set IL for nested SError injection
To: Oliver Upton <oupton@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, kvmarm@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jun 2026 at 05:46, Oliver Upton <oupton@kernel.org> wrote:
>
> On Sun, Jun 14, 2026 at 04:44:16PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] The constructed SError syndrome (ESR) is silently dropped during nested EL2 exception injection because `ESR_EL2` is never updated.
> > - [High] When SCTLR2_EL1_EASE routes a Synchronous External abort to an SError, the ESR injected has the wrong EC (IABT/DABT instead of SERROR) and an incorrect ISS format.
> > --
> >
> > commit 09fd06d56ab3236a0e7af03e0d026ed6725ad6d6
> > Author: Fuad Tabba <tabba@google.com>
> >
> > KVM: arm64: Set IL for nested SError injection
> >
> > This patch modifies the emulated SError injection to unconditionally
> > set the IL (Instruction Length) bit in the generated ESR, as mandated
> > by the architecture.
> >
> > > diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> > > index 4b39363cf8911..4262d4c17a877 100644
> > > --- a/arch/arm64/kvm/emulate-nested.c
> > > +++ b/arch/arm64/kvm/emulate-nested.c
> > > @@ -2938,6 +2938,6 @@ int kvm_inject_nested_serror(struct kvm_vcpu *vcpu, u64 esr)
> > >      * vSError injection. Manually populate EC for an emulated SError
> > >      * exception.
> > >      */
> > > -   esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR);
> > > +   esr |= FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) | ESR_ELx_IL;
> > >     return kvm_inject_nested(vcpu, esr, except_type_serror);
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but does the carefully constructed
> > esr value actually get written to the guest's ESR_EL2?
> >
> > Looking at kvm_inject_nested(), it passes the esr_el2 argument down:
> >
> > kvm_inject_nested(vcpu, esr_el2, type) {
> >     ...
> >     kvm_inject_el2_exception(vcpu, esr_el2, type);
> >     ...
> > }
> >
> > However, in kvm_inject_el2_exception():
> >
> > static void kvm_inject_el2_exception(...) {
> >     ...
> >     switch (type) {
> >     ...
> >     case except_type_serror:
> >         kvm_pend_exception(vcpu, EXCEPT_AA64_EL2_SERR);
> >         break;
> >     ...
> > }
> >
> > Since except_type_serror only pends the exception and doesn't explicitly
> > write the esr_el2 argument into ESR_EL2 (unlike except_type_sync), does the
> > nested hypervisor observe a stale or uninitialized syndrome when it takes
> > the SError?
>
> Oops, this definitely needs fixing :) OTOH...

https://lore.kernel.org/all/20260615131116.390977-1-tabba@google.com/

Done :)

/fuad


>
> > [Severity: High]
> > This is a pre-existing issue, but since this code deals with fixing SError
> > syndromes, what happens when SCTLR2_ELx.EASE is enabled and a Synchronous
> > External abort is routed to an SError?
> >
> > Looking at kvm_inject_nested_sea() in the same file:
> >
> > int kvm_inject_nested_sea(struct kvm_vcpu *vcpu) {
> >     ...
> >     u64 esr = FIELD_PREP(ESR_ELx_EC_MASK,
> >                          iabt ? ESR_ELx_EC_IABT_LOW : ESR_ELx_EC_DABT_LOW);
> >     ...
> >     if (__vcpu_sys_reg(vcpu, SCTLR2_EL2) & SCTLR2_EL1_EASE)
> >         return kvm_inject_nested(vcpu, esr, except_type_serror);
> >     ...
> > }
> >
> > Does this result in an SError being injected with a Data/Instruction Abort
> > EC? According to the ARM Architecture Reference Manual (D8.2.5), shouldn't
> > an SError always have its ESR_ELx.EC field set to 0b101111 (SError)?
> >
> > A similar pattern appears in inject_abt64() for EL1, where a DABT/IABT
> > syndrome is constructed and actively written to exception_esr_elx(vcpu)
> > even though an SError exception was pended. Would this incorrect EC format
> > confuse the guest's exception handlers?
>
> This is confidently wrong, down to citations of the Arm ARM.
>
> While I couldn't find an explicit rule to cite in my cursory search of
> the manual, the definition of the bit describes this as "External Abort
> to SError Vector". On top of that, AArch64.DataAbort() just changes the
> vector offset (but not the EC) based on EASE.
>
> My understanding is that the exception syndrome of an external abort is
> preserved despite taking the SError vector.
>
> Thanks,
> Oliver
