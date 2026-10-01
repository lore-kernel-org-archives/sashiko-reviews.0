Received: from mta1.migadu.com (out-111.mta1.migadu.com [95.215.58.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F595208B0
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 15:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867257; cv=none; b=K8HOevgM+w3vZIAy9VPHmDLqtHdd+n7DqK0DDzho6y5SU6R7C5hIRsR3saoN0nTvn3w/1YP1K/irEW+iEEt9AmcEE5i7Tia5q8ungMgFvEQXde0A9Mf+vTswQynTm92XJP6Qvr+07wJIRrhbJ+oDhTZIGhKOEIPbc2xs8QyFRSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867257; c=relaxed/simple;
	bh=nAtQiDApLhCPVgj7Yq1VbX7po3hVPR72jdU3V8V1SDA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dxssZGyRYsdvJv+gN93MHFLzQcpgN10SxDN28Mq0FEPvcY5u1UOc65Q90c066RC8qFUxnwTaR8dLRzBCR0XfP/GZ6HN4DsDFMlXvqUalSqfqeWu5D8no7XWkakMli4pLR7r5/C84Sqk9epEtW3N6MV/l43q1StFFGgib3XTjZ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YPkypYOB; arc=none smtp.client-ip=95.215.58.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YPkypYOB"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=nAtQiDApLhCPVgj7Yq1VbX7po3hVPR72jdU3V8V1SDA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790867250; v=1; x=1791472050;
 b=YPkypYOBT1PaykTWekCbFcHPnbAQYB04h/4OAIzjGIbS+f8nWhh05EalXMlN2zJLjJoMlT3i
 MKZchcHod3D5DHQnQvztGo2kEtfuAadEG/4aetIEJKl+kOpnvvE6UAcqcmhBHdpsVJNgKMi8NAp
 32zo6xhcD//AEgXg+h4wcKPA=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 8ec8368bf06887dd;
	Thu, 01 Oct 2026 15:07:29 +0000
X-Mizu-Trace-ID: 8ec8368bf06887dd
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ba40832934so8471e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 08:07:29 -0700 (PDT)
X-Gm-Message-State: AFq9FYLx4529OTYWavtIt5wRLyr5MK+3nvYLl98J30mgQ8x8samfTMKj
	S8BSPpXMPc4AKkyQUbFn3gYmwqxU5HjQQ/nhg4NrYmS+plpwFiW8W5NOOimESSuAsgnUNAiFaFJ
	0CTd6stIMrO2JAUBD0IQFExZOyoB01mYh5pKY5eKk
X-Received: by 2002:a05:6512:3089:b0:5ba:3534:fb8f with SMTP id
 2adb3069b0e04-5ba4419623dmr146718e87.15.1790867248689; Thu, 01 Oct 2026
 08:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261001135711.1640520-1-fuad.tabba@linux.dev>
 <20261001135711.1640520-7-fuad.tabba@linux.dev> <20261001141928.87F621F000FF@smtp.kernel.org>
In-Reply-To: <20261001141928.87F621F000FF@smtp.kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 1 Oct 2026 16:06:52 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyLOCBmFwFDK130U8unjA2V2vBqWT9WCNmVEC=40t=LZA@mail.gmail.com>
X-Gm-Features: AclHuK9-pshdeMgQIYlcNOB37uw3lYCk14jRj8TLlRSlJOhoHmYnuHcNwUeiPGY
Message-ID: <CA+EHjTyLOCBmFwFDK130U8unjA2V2vBqWT9WCNmVEC=40t=LZA@mail.gmail.com>
Subject: Re: [PATCH v4 06/18] KVM: arm64: Skip fixed-feature state flush for
 protected vCPUs
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 1 Oct 2026 at 15:19, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] kvm: arm64: host hardware breakpoints leak into protected guests

No hardware breakpoint/watchpoint support for protected guests yet. A
protected guest sees DebugVer as 0.

/fuad

> --
>
> commit 678dfb9fd1576272693dba360820510bcb1ec938
> Author: Fuad Tabba <fuad.tabba@linux.dev>
>
>     KVM: arm64: Skip fixed-feature state flush for protected vCPUs
>
> This commit moves the mdcr_el2 and TWI/TWE copies into the non-protected
> branch. It returns early from flush_debug_state() and sync_debug_state() =
for
> protected vCPUs, as their debug registers are hypervisor-owned, and
> configures HPMN at vCPU load.
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nv=
he/hyp-main.c
> > index e3f4bbb623492..b7b9f5afb673b 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -200,6 +200,9 @@ static void flush_debug_state(struct pkvm_hyp_vcpu =
*hyp_vcpu)
> >  {
> >       struct kvm_vcpu *host_vcpu =3D hyp_vcpu->host_vcpu;
> >
> > +     if (pkvm_hyp_vcpu_is_protected(hyp_vcpu))
> > +             return;
> > +
>
> [Severity: High]
> Could this early return cause a regression by allowing the host's hardwar=
e
> breakpoints to leak into the protected guest?
>
> By returning early here, the hyp vCPU's debug_owner remains VCPU_DEBUG_FR=
EE (0)
> for protected VMs.
>
> During the world switch, this causes the hypervisor to skip context-switc=
hing
> the hardware debug registers because kvm_debug_regs_in_use() evaluates to=
 false:
>
> arch/arm64/kvm/hyp/include/hyp/debug-sr.h:__debug_switch_to_guest_common(=
) {
>     ...
>         if (!kvm_debug_regs_in_use(vcpu))
>                 return;
>     ...
> }
>
> As a result, the host's physical breakpoints remain active in hardware.
>
> If the guest implements DebugVer, MDCR_EL2.TDA is not set:
>
> arch/arm64/kvm/hyp/nvhe/pkvm.c:pvm_init_traps_mdcr() {
>     ...
>         if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, DebugVer, IMP))
>                 val |=3D MDCR_EL2_TDRA | MDCR_EL2_TDA;
>     ...
> }
>
> This gives the guest untrapped access to MDSCR_EL1. If the guest sets
> MDSCR_EL1.MDE=3D1, the host's hardware breakpoints could fire inside the =
guest
> at EL1, circumventing guest isolation.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001135711.16=
40520-1-fuad.tabba@linux.dev?part=3D6
