Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D190732694E
	for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 07:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781855200; cv=pass; b=ujLPD7K+QqrKbdsIUeVTzW0OAeIIlMBNZw9miaenwCON5TWWqAGIre15NI5VkltJ98Fyol11bb7icAnOvYwzi7Q32O34HVzqz+ff7frU1SFV44TLi7rzOCp5SJXXQdohlLHhxSY/d+9H7Xzrmj65CHuZFgfq/yKEMv75xudtD0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781855200; c=relaxed/simple;
	bh=xcty0z9UhnNB36J/7EuELFPBfvGhxlFASPGjSU2sjM8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FxB52hJbF+QKuEpvlgaKIiSEIixFuLC/xDw6w4f9Q1rqtvWiEuDRKHC5XXnhnXvXAOp5IIulpACewZi32SfJpXBXwcUb9SB5fGJDEEAwMjx/L0OugNE4+viLRsJETShVhHGvSgbvGbexObNReqA9iBHPsYfQ0Tubtf/+/FOPxsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TjfTyaqL; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TjfTyaqL"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51765531803so188611cf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 19 Jun 2026 00:46:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781855198; cv=none;
        d=google.com; s=arc-20260327;
        b=MCHrHMheTeaOWnBAKCUVt/B/hR8JPoqo53rxTIhGkl81Hp/UQekK+0LAnvVG97KQ4p
         77DMc6wMmB4YyDX/ZhO0G5OTppT8yVZY40JbI5E/mgfBq6jJHhF6GkfMVX4rju0HMbmQ
         ES1NYEcSqEgX0Z2b2datDTvTwp5d63mNyHocXOIRzrAoJfAmkznzxKx1/dSbtkOq7wig
         u8qvECX4U+s2vASiDvP1/j+24yiu9G0CDqIiIGPS6poBfBJLBApVo38mMZpt4Qi4KcOK
         Ura0nKIwfEh0A6PxRrfhu34Ier9iQM53veLbzVs3up2qqDglImnG7o0Qzjqj5uK6G4hZ
         h5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uoBb9RhhJXeg2IBb64GG0HTmaW92lKQM/iFsDpm0ln4=;
        fh=Qo1snKJerNHX4mUeXQzzlujO7aTb9JnYoBqg/4neaLM=;
        b=EkF31iPz33ooDe90CRt2jAr0ynrpN3gA1FImymHpFXKZzxh98lWUpf+DkdxlBSDOLZ
         nNUEqH9u/bmAnrKpOiajKud3MsIcG80k2jtTwA+DlmEIhc5GxfjwWAzGUBOORFdPFAMF
         oqu3PrSXRMgK65VRtQ2Vv+s0NDSE6UTkt+hKErH3unBovV9sEDl2snzBytn6Es8y2Fxq
         WsO4I39mvYrzq+WBLdt3B/KLAjmgGODOStVtzHSxxWj0L6wErjw8H/jJyfZS36/EekCg
         i2YlRiE7byU2+uAYucmy78L3ImjT7Q2PpsiyrGi6H4CXLLxZ9af8eQ96Mk7aES5eQIVl
         /Mdg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781855198; x=1782459998; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uoBb9RhhJXeg2IBb64GG0HTmaW92lKQM/iFsDpm0ln4=;
        b=TjfTyaqL8AlP5Nvnq3sPodiUfRmVIaSuY0vWJKKMysXKTy3bTDNHm7317cCzBFA1jI
         pQtzGzKwV54Itldn0pGqQLp9t5ttRyc8lcVL51aiSLcyaoLdeMryGaxTOo1kqQsbhe5k
         CNy7cbEIcsnflV9YCDtSY1GMCYREeIjZTFe6OSxnURS/m2MpVL56FwqvjIdfEUr6BQ4t
         2HyZ85IzzW8/ac2NJY1fwIZrRssxmRA7mpF2qS+/S3TJ0XeSGfxcNgFtMfeXYtk0t79h
         I5DHEHlfE0YaNa4EGmKGbrc2Hv+mprxICslB5Bod6pYUKm4CriPvx+OexNZY0xA4y96h
         YWvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781855198; x=1782459998;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uoBb9RhhJXeg2IBb64GG0HTmaW92lKQM/iFsDpm0ln4=;
        b=Tx7lDyR4KVjn1lZvEGWLBWdaxIBFHnY3f6Yk7Y+Fc8EGURRhK1bAnOIZ8FvS/Yhupd
         5sKedJcmB+ZIw8TOgxuGFVEZONMd2XW4U48SX7Q4v0Gbko9AQTfSJeIg2Gd+75EKQkIb
         UOrN7zSQhOqypfMDTUPUiFdTqOMvu3dxJa/LtKQpBDgxTFtEwP/mrWqRtMJvTDMwhHNF
         5a9cKtndQMhByBREoWmYkklyLFrw8ksM9HP5d8XVGx/u0Ku8BxM/2KSSz1R5/1KQTMbB
         zVrarZA46bsjhKX82UuM/h1Jn19DdyLbdWBL2eJ41p4Fsfl8A5bHe1YOihr0a86TxTb/
         Kw1Q==
X-Gm-Message-State: AOJu0YzzxjEFVvUdX/qd9dniRB5roc0oNm3NZ7lzYK49gasxjSqRd0E1
	pEhdrBwY9SkFmE+cNiI2Ts4Am3TmlaeONF9FLM685nR6+MimuPe5PcTeJpzvTb0Z6NuO5jmrQTW
	lYNMl75WOXEg4WDVdho8aRzq1PQiA+JPeCFcaazmrLSmtAOHMABmY0lPqx3U=
X-Gm-Gg: AfdE7ckjdwIuHpDXNyvnpYnGwWSDykoRLZFb8THeqSEkQK7tBYYp4uof4R3HPVgcW3I
	CWnx60foIvJ5Jwjj6+ynQMe1J3UxYgyjZcyi4/CI4dApXHMzzP6C7SwffbKfwOnZM0bxcEVeJXM
	i/Trvg9cXzzkhV1oqTZcjaDLQ6unfdmbHC6IBhqhhuwn88WLU5PcAHvkpWNVHU4UY8Q0iebRxa4
	vn8QCWcon39HEHXEaCvPQ2tBziupDfskawltnD/N/kRK2N+kkJJ0709YjEAUK0pvs7SC1pXW74r
	x49bwcjX
X-Received: by 2002:a05:622a:2489:b0:519:56a8:2693 with SMTP id
 d75a77b69052e-519e4a7350amr6361661cf.24.1781855197057; Fri, 19 Jun 2026
 00:46:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260619070719.812227-1-tabba@google.com> <20260619070719.812227-8-tabba@google.com>
 <20260619072121.395E71F000E9@smtp.kernel.org> <86bjd7rn86.wl-maz@kernel.org>
In-Reply-To: <86bjd7rn86.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 19 Jun 2026 08:45:59 +0100
X-Gm-Features: AVVi8Cc5P1L4xDU-nNWT0r99gLLz_hNu_mDPa9aphJH_JNODIeQOsQU0RdoZtMA
Message-ID: <CA+EHjTw2Q=QV_oXioGeJpY9ycNAD7m5ZmFjBxiwH3vwETchh5g@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] KVM: arm64: Add primitives to flush/sync the VGIC
 state at EL2
To: Marc Zyngier <maz@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jun 2026 at 08:41, Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 19 Jun 2026 08:21:20 +0100,
> sashiko-bot@kernel.org wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> >
> > New issues:
> > - [High] flush_hyp_vgic_state() fails to copy vgic_vmcr from the host vCPU to the hyp vCPU, causing host-side VMCR updates to be silently lost and subsequently clobbered.
> >
> > Pre-existing issues:
> > - [High] flush_hyp_vcpu() unconditionally copies mdcr_el2 from the untrusted host vCPU, allowing the host to control debug trap configurations for protected VMs.
> > --
> >
> > commit 5eaa1440f7e2f022736f913bec34aaa0cbd53a5d
> > Author: Marc Zyngier <maz@kernel.org>
> >
> > KVM: arm64: Add primitives to flush/sync the VGIC state at EL2
> >
> > pKVM performs its own world switch for protected VMs but has no primitives
> > to move the per-vCPU VGIC state between the host and hypervisor vCPU
> > contexts. Add flush_hyp_vgic_state() and sync_hyp_vgic_state() to handle
> > the required copying.
> >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > index f3233ee343a39..2db56146ec493 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > [ ... ]
> > > @@ -104,6 +104,45 @@ static void fpsimd_sve_sync(struct kvm_vcpu *vcpu)
> > >     *host_data_ptr(fp_owner) = FP_STATE_HOST_OWNED;
> > >  }
> > >
> > > +static void flush_hyp_vgic_state(struct pkvm_hyp_vcpu *hyp_vcpu)
> > > +{
> > > +   struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
> > > +   struct vgic_v3_cpu_if *host_cpu_if, *hyp_cpu_if;
> > > +   unsigned int used_lrs, i;
> > > +
> > > +   host_cpu_if     = &host_vcpu->arch.vgic_cpu.vgic_v3;
> > > +   hyp_cpu_if      = &hyp_vcpu->vcpu.arch.vgic_cpu.vgic_v3;
> > > +
> > > +   used_lrs        = host_cpu_if->used_lrs;
> > > +   used_lrs        = min(used_lrs, hyp_gicv3_nr_lr);
> > > +
> > > +   hyp_cpu_if->vgic_hcr    = host_cpu_if->vgic_hcr;
> > > +   /* Should be a one-off */
> >
> > [Severity: High]
> > Does flush_hyp_vgic_state() need to copy vgic_vmcr from the host vCPU to the
> > hyp vCPU here?
> >
> > For GICv2-on-GICv3 emulation, guest writes to GICC_VMCR and GICC_CTLR trap
> > to the host (EL1) as MMIO.
>
> GICC_VMCR doesn't exist, so the guest can't write to it. There is no
> MMIO involved with pKVM, since it is GICv3 only. And the whole point
> of having a VGIC is to avoid trapping on each access.
>
> More importantly, VMCR is not allowed to change behind the guest's
> back, because it contains the state that the *guest* has programmed
> there.
>
> Can someone *please* unplug Sashiko? I've had enough of it.

I am trying to at least fix it :) Key phrase I am adding in my PR:

`## Grounding: you do not have the ARM ARM`

along with other things, so it wouldn't hallucinate it :)

Testing this now locally before I send the PR.

Cheers,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
