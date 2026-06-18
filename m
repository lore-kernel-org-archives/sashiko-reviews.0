Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960862D97A6
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794074; cv=pass; b=II8pJnRzlBfVvtI8H2pDyxUqRKos8BBGsYlxb/mslC8SO8Ob+8l2bygiZkjjUNNr9uK/J0Wfs2bgI+6Us0biFJwCyAQp5yg9Q/snVL077KQ2CNAD4EUfmC9/FITNyTa9QJ5xZBLLAI3HongaLgPWIvAU96QUOLbecrnO1uDntEU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794074; c=relaxed/simple;
	bh=LzQ/2P+hOP+suzGipZPy+apY9BEJgJZMJcc/piGvcxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jk2kJDYT06/i4/0W9pEsKxOg9ZXv+bQm+YrjY+fOPpz+CzAkmcjUFr1TEModT7buuq7KOR1MkikB9jVIrIB7vkmtpf5SORI0v8fIu3Zl775cnhzoVMqFlUK254G3VdrcDVyoT2qbPhCDw3uH4FrSA3wMf1IaG0llbJdz9Pw0SIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bx+4inOX; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bx+4inOX"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ad4c101545so9176e87.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 07:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781794069; cv=none;
        d=google.com; s=arc-20260327;
        b=K26x6Kuvr7KpqRpMzup2XFrnD0zxXSfC191ExDhB9bZzFsuTOqHo8z/GqOuZCD9lf9
         2d2Nv5nvuhNOSPL5G4/2TV5Dffu7HcD935dFLyK4E89hANXOM5eyg5tJCcNX8QQDav79
         R8GDmRXa92pclyDJL9MFnt+80I5hXStMz3lnXx9oD/TWvZ+jTda4W3HOFxsPlD5sNplQ
         4h9LXwpNNSxtVggNpAl8JnqjLFftQngabQRgIgp5kEk3UtZxn8Gw0N45nQ96Jji/5jyJ
         MS9XJ9ul8K7tYGBDP1frwaL2JK/j14CZ3rWZDKJx6TZnaSL8fw9YthHmbMsnlQACrM9j
         wy3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dmN9nS4vJ3TKXwg/LI1WEk/6tZyzDcctWdh0WqJnNg4=;
        fh=5NVIgO8D/OOrmMGizBrG+5Z6zuKo+gTS/PJhUJkF/vU=;
        b=f/z3AkhRTmjXERBHWrD7eMhyQi8cDNsRoSjFrctG70IDq8Kh7gJ1iJJ56Y87uNpqwr
         b1369zehtBFdPMB2T6Znfy5E6gDF451bHI56fIrbVseoAYAxWcD/K6j7iBefLkzV2zIm
         se2QHh8T7d7EyXIhJ5QFUTZ0r5vtCCRDOIIFfT0sFbkXwDkktl91dtL6qWt8VK/9hxxS
         GRNCtOyQjFU8O0IQaGd4B7DDFzfEzzNh44ucn1K234T9Qq/a7bhFZFef++vNRp87gTkG
         plu46KjQJpkFqEqcpwgsfF8iH1BoURcCFv+LI+mEghJoiq0e79BqFAf22rRqIVWIMc30
         L0Tw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781794069; x=1782398869; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dmN9nS4vJ3TKXwg/LI1WEk/6tZyzDcctWdh0WqJnNg4=;
        b=Bx+4inOX87FQayAqGFN2YEY+dhjy7+/TWqhh1YoAfSmPBWsqrcGHx+og6toYwyUh3L
         AKNcVh3U381m9YbHWQBPFOHXTj5cC4CtP8U61SyWaT9/lubhFseuqo422zZ8K0B1fuuv
         UW6M4v7XgeX/5sUW2swYk/ATbs2iNdUciRIrPs/rngAkZZgspXTV5ZVCIIB8Wqkl8EYI
         JxdF0/q2kucOQB4MuvL4G4jzAXwMpwBQC0557cJCGcFLZYq2LsCQc4LweP1mKz3E3TD0
         mcLgaI3CzrTxxqJ353jyUrSPj2U0dV6I1uHq321g3NZdA5Gfd1WnEqCWXpQgLUnI/6yp
         S1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781794069; x=1782398869;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmN9nS4vJ3TKXwg/LI1WEk/6tZyzDcctWdh0WqJnNg4=;
        b=Unz0pJvoqG6dTq06XQLCF7MfqVzj7TpJckxJrfolciQxyEk3hEvWmp7/ZhF2xSYlKF
         WXByGF+hY9twgz2J+PoyBPhgmp2ZO+FB4UNJqEHgbX6DvYSpoIhY0qHzQQc3XN8f/UXh
         k+PDzm+EvBdsuTndiM+1uCBWB7a0VpLns0m//e9eOolh/t3u1/axwXBrs+DZUmdkVkyI
         Fl5echz6Y01gID8752jrTG84bBvAjRBfB2EOPAdra++hNHw5cqKgtxxGhkAGIU9XlRR9
         X2pFSCoyqZWMWdc/ET3j1+GagU4l6wdd6cS3LrpydIYLLAyGGcr7JTCkBWNfps3JNEJL
         ZY8w==
X-Gm-Message-State: AOJu0YycX2cE1Qp4wxbzpDnPhtEVnFU1LXdUv1gZbPT6wgZQ/VFlJJKl
	wJoIvdM9z+nc0PH9CHft9f5OP13Jwrt9ThjHOXst/oz/108czhXFed0tFL0QwZy49J9kI8O+JCO
	IXp38UEc+PVGkBv2JYQXCkoiaIgZzAK7p3GONdrL5ykg7Gpz6AuRaT82aNXA=
X-Gm-Gg: AfdE7ckIk7vcol2M+5iaiG8tqXOHS/JtuezSvZgZbVqw9x/qjpLWMsnOD6mOSbrS7cM
	6bgBM40yjCAGxK+Vf50hqoPoJFqM6vusk63vGPA2OpgkbOKeZVx84F9na3HgZLMJYUSPaOHlgnh
	ZQVD3tRTWPFST4tPzW6oqN1mm4d8WuHRNq9BLElMDKC8kNLWdPE3+ytphPdz0P6FNbpHB3EzhRa
	LOc7su0rd5z6BxH6cHwi/3UXMxHrrcojDlAyr3I6NZmV4Oir2/JNEufKIU1oJW0MKORUK/PmA==
X-Received: by 2002:a05:6512:2254:b0:5a1:43ca:1ff5 with SMTP id
 2adb3069b0e04-5ad4ee99ce0mr156755e87.3.1781794068379; Thu, 18 Jun 2026
 07:47:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618121643.4105064-1-tabba@google.com> <20260618121643.4105064-4-tabba@google.com>
 <20260618122921.F224E1F000E9@smtp.kernel.org>
In-Reply-To: <20260618122921.F224E1F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 18 Jun 2026 15:47:09 +0100
X-Gm-Features: AVVi8CfxFGxHU2xBsoMAmS5XZRDUWTuQLVUDaNJBJNQ9Q3veP4V7v9kkWA_RbOc
Message-ID: <CA+EHjTyX7+n_F85PnScTZeqQChh9m16PwGUr5QNEjiRDOuHpSg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] KVM: arm64: Unconditionally set IL for injected
 abort exceptions
To: sashiko-reviews@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 18 Jun 2026 at 13:29, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Unconditional IL=3D1 in inject_abt64() creates invalid ESR state=
 for Address Size faults.
> --
>
> commit 5d93cc0ddb43cdfa88e555d446e07e55b7334637
> Author: Fuad Tabba <tabba@google.com>
>
> KVM: arm64: Unconditionally set IL for injected abort exceptions
>
> This commit unconditionally sets the ESR_ELx_IL bit to 1 for injected
> aborts, assuming the FSC is always EXTABT or SEA_TTW.
>
> > diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_faul=
t.c
> > index 9dfae1bcdf992..444d219b02174 100644
> > --- a/arch/arm64/kvm/inject_fault.c
> > +++ b/arch/arm64/kvm/inject_fault.c
>
> [ ... ]
>
> > @@ -138,11 +138,10 @@ static void inject_abt64(struct kvm_vcpu *vcpu, b=
ool is_iabt, unsigned long addr
> >               pend_sync_exception(vcpu);
> >
> >       /*
> > -      * Build an {i,d}abort, depending on the level and the
> > -      * instruction set. Report an external synchronous abort.
> > +      * Build an {i,d}abort, depending on the level.
> > +      * Report an external synchronous abort.
> >        */
> > -     if (kvm_vcpu_trap_il_is32bit(vcpu))
> > -             esr |=3D ESR_ELx_IL;
> > +     esr |=3D ESR_ELx_IL;
>
> [Severity: High]
> Does this unconditional setting of IL=3D1 cause an architecturally invali=
d
> syndrome for Address Size faults?
>
> If a guest executing in AArch32 EL0 issues a 16-bit instruction (such as =
a
> 16-bit LDR) that triggers a Stage-2 Address Size fault, the IL bit should
> accurately reflect the size of the trapped instruction (0 for 16-bit).
>
> Looking at kvm_inject_size_fault(), it injects the abort by calling
> inject_abt64() via the __kvm_inject_sea() call chain, and then modifies t=
he
> FSC to 0 (Address Size Fault):
>
> arch/arm64/kvm/inject_fault.c:kvm_inject_size_fault() {
>     ...
>     /* inject_abt64() forces IL=3D1 earlier in the call chain */
>     ...
>     esr &=3D ~GENMASK_ULL(5, 0);
>     vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
>     ...
> }
>
> Will KVM now inject the Address Size fault with IL=3D1 instead of IL=3D0,
> potentially causing the guest OS exception handler to incorrectly advance
> the Program Counter by 4 bytes instead of 2 during fault unwinding?

See https://lore.kernel.org/all/CA+EHjTyiyCNV40z82=3DYTTMrx3BoR5gn5uh-xP80g=
FxX2PSUMAg@mail.gmail.com/

>
> >
> >       /*
> >        * Here, the guest runs in AArch64 mode when in EL1. If we get
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618121643.41=
05064-1-tabba@google.com?part=3D3
