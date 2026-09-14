Received: from mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9079E495058
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 18:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408926; cv=none; b=eQJgLQwWOyQ+kdL4unIroAAah+K1LFLyWhjtnk8ppmGz6CpPaYpareD1T312wKY3xmgWZePyppcphmcw0b/OM4zLUIYtmS4ZpjFGiA6094OKFhdqz20kzP7UUuo8LUJ5MpykzsvqlQrePsKQi8CLeB9RuX0uUb3XcIJ56jytdak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408926; c=relaxed/simple;
	bh=y9eqvfsDTPXQi0GHqe/fBv2xSL9pQtw7tDS/Cqr0/po=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANylZXb/nvmlmcnt0zyFNiOwkKQX0lKEXp8aqbg1e4TRmGDZTa/fY9rTqmm26pSJmj25Ez3PwVBV9Set4q+FugkZ/04GCL6IwKVLygRmJxuHzPAiQSb2VZJ9Clj0GzOnSRkSaD1r8oOl0TBv3zz4jOk7LePjNk2on20Owa4fu+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nRUBiDZw; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nRUBiDZw"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=y9eqvfsDTPXQi0GHqe/fBv2xSL9pQtw7tDS/Cqr0/po=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789408920; v=1; x=1790013720;
 b=nRUBiDZwoGGHFtMQdFcUY3ZYlKupLRHTzSX9RAgA/3qncvBVxt9Vpfo9lhVWzCWYYLXjR8Wu
 CbsP/hHXOZXfp/mS28oQ9dD5hK4oOcsLwtkvlv2ueZqluhGYIZnB+dzL0UHdHglgzegQ8evNpaF
 CQiCVGO7AKNVE6GmqvlM9lls=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 1506610bf8c195ed;
	Mon, 14 Sep 2026 18:02:00 +0000
X-Mizu-Trace-ID: 1506610bf8c195ed
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so11080e87.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 11:01:56 -0700 (PDT)
X-Gm-Message-State: AFuF++mWFya6FK/iYNKKfr6dzQ6Oe6SvqVK6JUPI3RqE7bo4iGl5R850
	pKH5l7dkXWhKTyUkJGev5zbmiIcrQhfdw0P0dToe1ektRIDxh9WiwtK9pszCgMsGH4OYbyk+AS5
	1Q0TUPyZu0JbccFsllEn7BnVBniwXh80QZq1r4nJJ
X-Received: by 2002:a05:6512:404b:b0:5a4:ec:53d9 with SMTP id
 2adb3069b0e04-5b8b2d5e14amr11546e87.1.1789408915087; Mon, 14 Sep 2026
 11:01:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-18-fuad.tabba@linux.dev>
 <20260914162305.0054D1F000FF@smtp.kernel.org>
In-Reply-To: <20260914162305.0054D1F000FF@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 19:01:18 +0100
X-Gmail-Original-Message-ID: <CA+EHjTx9egrMcGQqgXY4zKsZe0pFZfT83TSCzeCdoQg8ZQE93A@mail.gmail.com>
X-Gm-Features: AcwNN1XrTUr8Z4mImmnPh-loYc9bYSSx1rtXQFp9E1BccYNJRe3r9FNkMgEoW1o
Message-ID: <CA+EHjTx9egrMcGQqgXY4zKsZe0pFZfT83TSCzeCdoQg8ZQE93A@mail.gmail.com>
Subject: Re: [PATCH v3 17/18] KVM: arm64: Advertise the capabilities that
 protected VMs support
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 14 Sept 2026 at 17:23, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Software SError injection via KVM_SET_VCPU_EVENTS silently fails=
 for protected VMs and permanently leaves the host vCPU in a degraded state=
.

[...]
> Pre-existing issues:
> - [High] Software SError injection via KVM_SET_VCPU_EVENTS silently fails=
 for
> protected VMs and permanently leaves the host vCPU in a degraded state.
[...]

The host's copy of a protected vCPU's PSTATE has PSTATE.A set, so
serror_is_masked() is true and kvm_inject_serror_esr() pends the
SError through HCR_EL2.VSE, which flush_hyp_vcpu() carries into the
guest. The emulated entry you describe isn't taken.

Nothing is left behind either. The NULL return from
pkvm_adjust_pc_get() clears nothing, the request stays on the host
copy for the next entry, where the entry handler applies it, and
sync_hyp_vcpu() clears PC_UPDATE_REQ at every exit of a protected
vCPU. Marc asked the same question on patch 12 [1].

/fuad

[1] https://lore.kernel.org/all/CA+EHjTy6F9tG=3DeRLMuykc12P-Oc2pjMoQqAz34iG=
R+Q5GzV2jQ@mail.gmail.com/

> --
>
> commit 3a73d995c015585fa4c9bb7392c4fb3d6d828c9c
> Author: Fuad Tabba <fuad.tabba@linux.dev>
> KVM: arm64: Advertise the capabilities that protected VMs support
>
> This patch updates kvm_pkvm_ext_allowed() to explicitly allow a list of
> capabilities that are expected to work for a protected guest, including
> various VCPU event and IRQ line capabilities.
>
> > diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm=
/kvm_pkvm.h
> > index fbea052fa3e16..a165af0d75689 100644
> > --- a/arch/arm64/include/asm/kvm_pkvm.h
> > +++ b/arch/arm64/include/asm/kvm_pkvm.h
> > @@ -42,6 +42,15 @@ static inline bool kvm_pkvm_ext_allowed(struct kvm *=
kvm, long ext)
> >       case KVM_CAP_ARM_VM_IPA_SIZE:
> >       case KVM_CAP_ARM_PTRAUTH_ADDRESS:
> >       case KVM_CAP_ARM_PTRAUTH_GENERIC:
> > +     case KVM_CAP_ONE_REG:
> > +     case KVM_CAP_MP_STATE:
> > +     case KVM_CAP_VCPU_EVENTS:
> > +     case KVM_CAP_VCPU_ATTRIBUTES:
> > +     case KVM_CAP_IMMEDIATE_EXIT:
> > +     case KVM_CAP_IOEVENTFD:
> > +     case KVM_CAP_IRQFD_RESAMPLE:
> > +     case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
> > +     case KVM_CAP_ARM_INJECT_SERROR_ESR:
> >               return true;
>
> [Severity: High]
> This is a pre-existing issue, but advertising these capabilities formally
> exposes a bug where software SError injection is broken for protected VMs=
 and
> leaves the host vCPU in a permanently degraded state.
>
> If userspace sets an SError pending via KVM_SET_VCPU_EVENTS,
> kvm_inject_serror_esr() in arch/arm64/kvm/inject_fault.c attempts
> injection based on a stale host pstate. It sets PENDING_EXCEPTION
> and writes to the host's ESR_EL1.
>
> For a protected VM, this is mishandled at EL2. If the VM traps on an MMIO
> access, handle_pvm_entry_dabt() in arch/arm64/kvm/hyp/nvhe/hyp-main.c see=
s
> the PENDING_EXCEPTION flag left by the software injection and incorrectly
> injects a Synchronous External Abort (DABT) instead.
>
> Furthermore, EL2 does not clear PENDING_EXCEPTION on the host vcpu. When
> the host vCPU returns to userspace, kvm_arch_vcpu_ioctl_run() in
> arch/arm64/kvm/arm.c sees the uncleared flag. Because pkvm_adjust_pc_get(=
)
> returns NULL for protected VMs, __kvm_adjust_pc() returns early without
> clearing the flag, triggering an unnecessary hypercall loop on every retu=
rn
> to userspace.
>
> Does it make sense to delay advertising KVM_CAP_VCPU_EVENTS and
> KVM_CAP_ARM_INJECT_SERROR_ESR for protected VMs until the software SError
> injection path is fixed?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914113338.15=
9227-1-fuad.tabba@linux.dev?part=3D17
