Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C463EDE77
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781270391; cv=pass; b=sE5pDmbpP1wsG5BT1Kru9lH6K8A03FigX8sUZi5sHpiIgGRzCV8fHkETTL6YWXZ2FS0XCNw/Vyp0wEOvlfeB/Pdld6hKoDqbvCKIEujucoWIQdih1qiqZCK8qkJOIHJGGhbv4fF2o+p/2M8l3EnWJMZbl2YoSjhWKoa0Qr6/UzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781270391; c=relaxed/simple;
	bh=nFyh8t7EajDFt4ntCcUZcAhFL09Lu/fiOAfEpgamjcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZpEvJTToengi3ISNv4e/bdRY2swqRxWlGlXrVxIMuBv44HTHwWUKq8F70dirqhHCJJ635Lh3C6cTMksH7wdkKZVLA60EX0gQr4+Qp0tHmvgCbEt5S7KdDC2wwEIF1n67a5do5P3InHcem+ywMMiP2UwZCzjixVlu2P1LOZL48NI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=auhoh0Ee; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="auhoh0Ee"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-51765331535so428631cf.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 06:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781270388; cv=none;
        d=google.com; s=arc-20240605;
        b=GiGuQsCOvv4PN1Z7d3xNLqrvy6hJHWTNTmwU1Lmy/m2whV4x1WIQC9Dj8Fuj/6AOuE
         sxtgogszY8bvDuZPytHHK9o9agmNXxHRiU79TXgc6jvxpGsqyXaC68+OZBDAqymBGVah
         CdKGslqBGRKNeywMykkulY3x7wW3jVulr1FN5ZrfsRk723iUjyyELBgZFtB2c3JA8OEQ
         WAc2cYPLaKT5LzRLEiLmgDidtwkBWYvV05FUs1TUaYGDoMg0I1SFd2AvyTACPIcWgNT0
         H0677n82UMuspHOmlaNG3MoSMmVX/jUJ9HSfRb5xEV3p9PX3xHXf+dQNIeqwDTyx48H1
         yejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jeBSFCbpglspfyD74FVX/lua1owJC/8kPxNkA+8dxq0=;
        fh=h+WE9q7lgZFreOaywdXTa1MCUSslC04cjSpn0jGc7Lc=;
        b=E8Shj6O7uMt53dJPL7S2ov8pJk1REIxwVXpVHdGkeZSRiP7gaUjmST6HhGMVfGjs77
         pGGDWSvXgrkew456M19yALUDsydM6MENFom+IyzkyKuKVI76i82sY7qXkumn97NTL+V1
         AOnpCrfavSc9JXuFacSrcLNKImr6ZHju5QJLQCId0HHF++FZGHmo5Tm25KWucyg6I7SC
         wKrdMzUR6MxnooxCS7x7f6TP9/Qh7qvcKyIWNxkg7RDGapIESwSpx/swIcxqxL3XVz3E
         SFi+uqQ0ja1OkW+M9ke0/xrSOi0VQg5ybCGpoCn+dLVCNDQKhiokZCSls9E3JnVfuqI9
         TzsA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781270388; x=1781875188; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jeBSFCbpglspfyD74FVX/lua1owJC/8kPxNkA+8dxq0=;
        b=auhoh0Eecl3WjzlOLIe2JN5a83kxLm6XuipO7A9Z0ZQ14dAHLi7d5iikX+z5PMaxqL
         e9+i+WHuQiSbtKxNujA47Gj+G9tuCLnB7kVJ8JgxA5OUoX61edm/3K1r5H/4pEXNnR0K
         sYoGxSOHIC201J8amU3JxUHo7xH9KgnlX1fEI7u3ws3auKvw7f3LnLetXph0C6stb32R
         Dx9ljw5ov+FDExodedph/ggOBg4A1TAISWYGSDwXTXaeq0x54LBH+sZsEtcUxzc2nQBh
         bNVXnpBe+0YiwLqP+oLC8ZbbGJWch3P7lQvlJxt+QVHs9LB87c0sJZUw/v3IoC38WpVz
         rsTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270388; x=1781875188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jeBSFCbpglspfyD74FVX/lua1owJC/8kPxNkA+8dxq0=;
        b=WQrh28Eh2H+rpxdSxhDbiJGQs2+W0AnkpbJIx0W3qYYJQWCoqATOSqihmbcc5XcbgZ
         BwNWsprjr/47CHGzm796dXqN0GF2lLrdfOrOvZc7lCkxIkh59UwxYbN0wTOgi8LLnoV6
         iCuSDDH6REc3HySnr/AQ5JjfntohXU2FStENbE9i1R/fgtbS1XJ6WO3YLj7/bTY5Nukp
         t3jLD2JwcLWhUhuOEclAjqP83wrPde7hiW551KguJ7zGuo+2myWJqxCaKv4r1txBedby
         /qgzriwgjecWp8CjjeYhf6NjTpU9wKlAvpMo4QVgKbCA68mQDshW7Uq+M4bVJAs5CrBo
         XZdQ==
X-Gm-Message-State: AOJu0Yw409o3zP8WMqXBOnsX9JRjh34DzDTQT6tXZj2dl5IOVuNW7T2S
	SjGU0YIIde1QwB3t39t1UYVOxgv7fIY17yqk/mu9w0rS320Ubyl+GZAApql+OTK25utVU7Ube1K
	YQ3BryYytagyKRcy6HAtK/EKbDjEjWCobLV217xpdBFKGnyWsN+7zP1E0b9o=
X-Gm-Gg: Acq92OEjpYLtRXHWw/xVqj1S0x4r+Z1ANsI4gPGya0sxAge3HWvUeWo+f7D6wV0030n
	SrlEWpJmrPLW4T6AmZP8BEkK5fLqInBnRVrkKNTZKitg2VIEcsjTCEgJf5eZeVaueNTegrCOB6C
	3TVCTJCSWoh0SLWRK8QoAI1VID812PoCERm0QL7fkuoWiaDfKhmBhnRrsE/Bb2nI2Pi4teHeDUw
	XOBt1pSjkRI3VRxGGkf4cYO0AJWAJ6rh7w5rm0yfHj0MHNiOTQiefKJlNrfdFVVjzsdDk47kPGH
	Q7Tf3XV6
X-Received: by 2002:ac8:5c84:0:b0:516:4f62:85ee with SMTP id
 d75a77b69052e-517fc539337mr7163811cf.19.1781270387386; Fri, 12 Jun 2026
 06:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612113414.1022901-1-tabba@google.com> <20260612115044.16E3B1F000E9@smtp.kernel.org>
In-Reply-To: <20260612115044.16E3B1F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 12 Jun 2026 14:19:10 +0100
X-Gm-Features: AVVi8CeZAvlVseat-uw7HL7_ZEkG6zTq14eM1kOd7oylk537wMpvUkPkSyGidyQ
Message-ID: <CA+EHjTyFFf__9iGFAyAkechiX+gaiK9ksdfgxLSFe8RcAY=HGA@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Sync SPSR_EL1 when injecting an exception
 into a pVM
To: sashiko-reviews@lists.linux.dev, Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 12 Jun 2026 at 12:50, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Stale `SCTLR_EL1` used during synchronous exception injection in=
 protected VMs leads to incorrect `PSTATE` computation.
> - [High] pKVM's `inject_undef64()` injects an undefined instruction excep=
tion with the `IL` (Instruction Length) bit cleared in `ESR_EL1`, incorrect=
ly indicating a 16-bit instruction to an AArch64 guest.
> --
>
> commit 5157ad995c29fa359271604075525691515c2f95
> Author: Fuad Tabba <tabba@google.com>
>
> KVM: arm64: Sync SPSR_EL1 when injecting an exception into a pVM
>
> When pKVM injects a synchronous exception into a protected guest, it
> re-enters without restoring the guest's EL1 sysregs. This commit ensures
> SPSR_EL1 is written alongside the other exception registers to avoid
> restoring a stale PSTATE on eret.
>
> > diff --git a/arch/arm64/kvm/hyp/nvhe/sys_regs.c b/arch/arm64/kvm/hyp/nv=
he/sys_regs.c
> > index 8c3fbb413a06d..1a7d5cd16d723 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/sys_regs.c
> > @@ -268,6 +268,7 @@ static void inject_sync64(struct kvm_vcpu *vcpu, u6=
4 esr)
> >
> >       write_sysreg_el1(esr, SYS_ESR);
> >       write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but since we are fixing sysreg
> synchronization in inject_sync64(), is there also a missing synchronizati=
on
> for SCTLR_EL1 before pending the exception?

How quickly you forget my AI friend. I submitted a fix here, when you
flagged this very issue:
https://lore.kernel.org/all/20260612102347.914994-1-tabba@google.com/

>
> Earlier in inject_sync64(), VBAR_EL1 is explicitly synchronized to memory
> because traps are handled early:
>
> arch/arm64/kvm/hyp/nvhe/sys_regs.c:inject_sync64()
>         /*
>          * Make sure we have the latest update to VBAR_EL1, as pKVM
>          * handles traps very early, before sysregs are resync'ed
>          */
>         __vcpu_assign_sys_reg(vcpu, VBAR_EL1, read_sysreg_el1(SYS_VBAR));
>
>         kvm_pend_exception(vcpu, EXCEPT_AA64_EL1_SYNC);
>
>         __kvm_adjust_pc(vcpu);
>
> However, when __kvm_adjust_pc() eventually invokes enter_exception64(), i=
t
> reads SCTLR_EL1 from memory to compute the new PSTATE:
>
> arch/arm64/kvm/hyp/exception.c:enter_exception64()
>         sctlr =3D __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
>
> Because SCTLR_EL1 wasn't synchronized from hardware like VBAR_EL1 was,
> could the guest's exception handler end up executing with a stale PSTATE.=
PAN
> and PSTATE.SSBS?
>
> > +     write_sysreg_el1(read_sysreg_el2(SYS_SPSR), SYS_SPSR);
> >       write_sysreg_el2(*vcpu_pc(vcpu), SYS_ELR);
> >       write_sysreg_el2(*vcpu_cpsr(vcpu), SYS_SPSR);
> >  }
>
> [Severity: High]
> This is a pre-existing issue, but looking at the related inject_undef64()
> function located just below inject_sync64():
>
> arch/arm64/kvm/hyp/nvhe/sys_regs.c:inject_undef64()
> static void inject_undef64(struct kvm_vcpu *vcpu)
> {
>         inject_sync64(vcpu, (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT));
> }
>
> Does this need to set the ESR_ELx_IL bit?
>
> According to the ARM Architecture Reference Manual, for an Unknown reason
> exception (EC =3D 0x00) originating from AArch64, the Instruction Length =
(IL)
> bit must be set to 1 to indicate a 32-bit instruction.
>
> Unconditionally leaving it as 0 by only bit-shifting ESR_ELx_EC_UNKNOWN
> exposes an architecturally invalid exception syndrome register to the gue=
st.
>
> Could this cause the guest kernel's exception decoding logic to fail or
> panic?

You're right -- the architecture mandates setting IL here. Like you
said, this is pre-existing, and I'll submit a separate patch to fix
it. But first, Marc: was there a specific reason for not setting it,
or is it just an omission?

Cheers,
/fuad


>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612113414.10=
22901-1-tabba@google.com?part=3D1
