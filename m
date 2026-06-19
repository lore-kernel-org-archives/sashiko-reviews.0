Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92687313E2B
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 07:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781854188; cv=pass; b=c2PR0pCFXNGkxCtYYIkx0+7+hmEeRqGq+45E6RWpFEb+3R8N+ihb8VO02wvWmua7RaLDHcFrnEhOqQ8jYsqP9Er2wrrj8UaMYJT0J/RSkfQs3K69Zl6l3CgqFErxng2rhgZ8FPJeEnCMHBy1nUcughxcs5qG33V3PNJrTJnH2JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781854188; c=relaxed/simple;
	bh=DVv5Jsf7DjPFuqS8OPq6whz30sTPdSNrC/zFcXZT3So=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcLkOrjh3EsWYiZqJekU2zaPU2WxjTyqW4lYimafOFvZsKKbuM+kwELVD9Km1TNvMrxNjq2O3B1TceX/VxJbYWGDzWgCocH/Cboro24amQpdPv3aYyOkBvV8eN7eA6v+Dn6j0/H7OSCWmTNbKeiNzLDx7NdlsGMYzmGpfLFq7Y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o90ILt5v; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o90ILt5v"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51765331535so111111cf.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 00:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781854184; cv=none;
        d=google.com; s=arc-20260327;
        b=f5Bw8ukGZ0+yMqK9KKFAWApwMDkmnTmtx5FM4hB3E9rXAMgQcmY3AP2r85eKxjBBAa
         N3IJn0b0SS07YeXw72anpTka0eCbwoFUIU0ZYE2cICEDVLPzpWVQviv+Yi2oFpGp5uG/
         6R/px+fS4FprMqomeGB2wU3iqZDZz64smKs6RvToN0wMQy8Q49uiUhpSp7XlegLlPMo5
         NFTjo+MTOTjY0FONTBo88mXVguKxCZr4hhQta9J3vM1GEPUkpJaCECy56SX324BY+xjc
         E0RwDW6FbC1lc8vkvqddFZFqb0eAJxjlNFqYmh3jg+XZmcngV8TTZnShpPh23vjjcK3Y
         f4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rFt+8mgzJiyeBl/92ggs2AZvMokp6o1r/LEN2euuLt8=;
        fh=72Zv5DwALZblOpx9SPAiT2x2CC+g2u2bBNeYtrdMw5c=;
        b=BKqU96IDBFsqA/3QorScnsuH8A1A/51rFdAkwV0WkjC4QnoNbK2/FNRtaHLnmaCL4c
         HUM0vegcfOETA/YAzDJUgckGzvDgZIEBwIGclTZTx/c+RS5e7MkfAk81uOpmT/DsOsxC
         0t56A3VxlL0tioD57eOVqdV+L5UTMps03MFu+UUhCJjM9DLBno8ixkJTEO4OK+DbaxdS
         E2JWw1pI5ytc9B853C+EWdvVXVCBGNFDIR0el46D4yCQTDI9EW8OqgjJcqVdN+0Ugx/r
         zlHp1KXncjQn7AV+N/KbqHf445P1NSZSyK+Hikpwh0LV2gtG8xXDTCkNAhrhA+jJDoUM
         Vcxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781854184; x=1782458984; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rFt+8mgzJiyeBl/92ggs2AZvMokp6o1r/LEN2euuLt8=;
        b=o90ILt5vPQpzcAeOE+cwMi+q/yuor7Xwe5UH5Hyk2QPHJIodUtVz/NzPbtCgMTu8KE
         C768HmbUzgzPabMq4Cfa7E1wn0TYsTLF25Uh5+rDmrh3zPFhZJBpmOS9B2hIfdfLVpQ9
         EJd2VHpJDTXEKE5O1hIs8SUDqVY1acqXEK21RUS0hDswz9sXB7xXOjY1nLqZ36O4o9Ui
         mhBzzKJmY7+ZwYvWjH/EmRltUOEqTGTUJiAFjuN0BJTx3uczk7uof2h0PxNV7VNFVoJc
         I9ZdPzES4d9h0ilZCAvdftP0A8eSFfJBXluCXkCr3TaCmzonAFQOtDiOO/uDLWzGM2Bh
         a9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781854184; x=1782458984;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFt+8mgzJiyeBl/92ggs2AZvMokp6o1r/LEN2euuLt8=;
        b=bc8HqOj2k1bRevHnQewZDSIm8+qFTWfwacEA4gBMmc63KAf1HkyIIaIH/4Q2+13t4j
         hE8SAWO7xFdUyX55s/XTbGJz9DVlpFD2YfO1/jhDyv9DlpAHrwlcxZeDw9OoJjlFdJJA
         TpCJT0OTotuI8x2qdZ9PFKBchDZZmPRThcwsDSCFtTwT3Wb/Nf2o47PAPe+uSZHGGtF+
         NJ1omN4f1dVruCU3Dzsd40jZXwakvNntti8NNeynWg3OfSF9tEQH66avdDwZht6vkI3M
         8bEoCPJrIlMBF0eNmLH0v6vB+oqC/2p8gTBX/TzUIN2uB7Tl9cHhDdyCd6qiATQY9450
         nT+g==
X-Gm-Message-State: AOJu0Yy2zWmxrtv/UB7B/4rl0SlsZNQOdXkkOiEyUb+Dl6w/s9SHE48s
	P8BVLGarAb+9bzTfl9N40EBJZ7X58OsjJHncD5zoXJmdRmElwxfSHZpr31+/Z0xOYikZImx1hYA
	7baOmCbglypGngI6gp0CzzR6kuhvEulD8gQ7cT0psnNuhTnwuQ6pOH5FGXJs=
X-Gm-Gg: AfdE7ckIS/Ft6VqFyx8hd1wPkNyEaMHNLwEVIC7+DeU5jywq7PKS28S7Kb0Gryo6zKI
	z4uKKp6VJKG2oAORRd+hRaZWkLHDe5Ye/k11Qw6QIF2RRBD3H9UaCEeki6LVEtFS+SjUxcP/TUt
	VlFmrJDLfzJC8/4hJcYQ6Bsk2vKQp/qPagWn0Knb8iIZysd59C1T2BWmr/UpToK4XeDDjFjq7Z1
	SmriL7Xsd83RoT4Cm7H/lxiteSEpu5CnpJ/Tvc2h1u/aLyI33yKeUVjf4p8qwi6GmpFnbjcrg==
X-Received: by 2002:a05:622a:1b88:b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-519e891c801mr4376661cf.7.1781854183912; Fri, 19 Jun 2026
 00:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260619070508.802802-1-tabba@google.com> <20260619070508.802802-7-tabba@google.com>
 <20260619072238.CBAD51F000E9@smtp.kernel.org>
In-Reply-To: <20260619072238.CBAD51F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 08:29:06 +0100
X-Gm-Features: AVVi8Cc94G4NP6TmL5kUBsJUSfswAVcJeIUWMgnLj1_eZF8iuuFoZoPhTHjqtlo
Message-ID: <CA+EHjTxSZOwDBwVidTnjkNCzS-F9x=YXfZFQs0pB0OyJWcby7Q@mail.gmail.com>
Subject: Re: [PATCH 6/8] KVM: arm64: Minimise EL2's exposure of host VGIC
 state during world switch
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Jun 2026 at 08:22, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Missing trust boundary validation for host-provided pointers=
 in several hypercalls (`handle___vgic_v5_save_apr`, `handle___vgic_v5_rest=
ore_vmcr_apr`, `handle___kvm_adjust_pc`, `handle___kvm_tlb_flush_vmid_ipa`)=
, leading to arbitrary EL2 memory dereference.

GICv5 is not supported in protected mode (is_protected_kvm_enabled()
gate in vgic-v5.c skips device registration entirely), so the v5
handlers are unreachable. handle___kvm_adjust_pc and
handle___kvm_tlb_flush_vmid_ipa are pre-existing upstream
unvalidated-pointer hypercalls, not introduced or modified by this
commit. They are fixed as a group in the subsequent series.

/fuad

> --
>
> commit 5fa49efc0aabdcdf925969737165624792f92f6c
> Author: Marc Zyngier <maz@kernel.org>
> KVM: arm64: Minimise EL2's exposure of host VGIC state during world switc=
h
>
> This patch minimises EL2's exposure of host VGIC state by recovering the =
host
> vCPU from the supplied cpu_if via container_of() and copying only the
> necessary registers. This avoids directly dereferencing the host's
> vgic_v3_cpu_if pointer.
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nv=
he/hyp-main.c
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
>
> [ ... ]
>
> >  static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
> >  {
> >       DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
> >
> >       __kvm_adjust_pc(kern_hyp_va(vcpu));
> >  }
>
> [Severity: Critical]
> This is a pre-existing issue, but while this patch fixes the trust bounda=
ry
> for the VGIC v3 aprs hypercalls, other always-on hypercalls like
> handle___kvm_adjust_pc() still unconditionally use kern_hyp_va() on
> host-provided pointers.
>
> Can a malicious host provide a crafted EL2 linear-map pointer (for exampl=
e,
> the address of a protected VM's vCPU) here? Since kern_hyp_va() is idempo=
tent
> for linear-map objects, it leaves the pointer as-is.
>
> This would allow the host to dereference this pointer, potentially modify=
ing
> protected guest state via __kvm_adjust_pc() and bypassing pKVM isolation.
>
> [ ... ]
>
> >  static void handle___kvm_tlb_flush_vmid_ipa(struct kvm_cpu_context *ho=
st_ctxt)
> >  {
> >       DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
> >       DECLARE_REG(phys_addr_t, ipa, host_ctxt, 2);
> >       DECLARE_REG(int, level, host_ctxt, 3);
> >
> >       __kvm_tlb_flush_vmid_ipa(kern_hyp_va(mmu), ipa, level);
> >  }
>
> [Severity: Critical]
> This is a pre-existing issue, but similar to the above, does this allow
> the host to pass a crafted mmu pointer?
>
> If kern_hyp_va() leaves an EL2 linear-map pointer untouched, could the ho=
st
> use this to load arbitrary values into hardware registers like VTTBR_EL2 =
via
> __kvm_tlb_flush_vmid_ipa()?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619070508.80=
2802-1-tabba@google.com?part=3D6
