Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561EB286417
	for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781792698; cv=pass; b=aIIUl+v2ntV8IFLH+hzp4nPYB7whJMQQapmLty9hL0z0yED8QEDIjzrQLNqj+lWijFS8XHv2oQY5pqDJJuXUCO4UXo4LwmYB4V7tbR14T+/UM8jNCpBC74MFIwQcwQHtzhZFJG/W3fS0zmFoVW2buszyrgL+EjsEf9OouHOBUx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781792698; c=relaxed/simple;
	bh=IcUDRh8Om3ZmpHU8OKEmFDWjuWTvs4Y7QkwArrvhnwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBEVw20CvJRssiSHbYR4cGMFfk08l4iqb5EKIrqjHOtUjpp8opE5QI99a7UCstloUkoQQ+xFRC6P37S4qaubV6/BUOx6DvSFH6drzlWdw4XhN0mJ9N7pdiIy/esM6gXyDYbzLYgQ837J3ocLy2JocWbQDIaGsI3LyVgHdRwoL4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZKH1kH2A; arc=pass smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZKH1kH2A"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5ad4ee260b0so7127e87.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 18 Jun 2026 07:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781792695; cv=none;
        d=google.com; s=arc-20260327;
        b=bCtXqzEKTkQnzoylRAy9EU43GNQ4vFn4h/ep0ixnqD3ub/d/UYsMgos4XieaVSMKyu
         OZh3pnkp+FgZwGcQX6QCJQ8b62/IFohWetsadcSiJNrHR+qd1prJzgcUMEatt7kcsoux
         nS1+hH8h2t7BGlwN8jDcYXayN5G3uV10xhxpguVYpbI75qGg3Y9m8xeXSK7GnDXIPJVL
         Gwu7Vxq9LBxrcxkpZIg1hHVAMlwGQr5k6TDqJfqmlEK5S78xUcKzzHZ2ZSVE2wZkmOAd
         oFSTRM/VllLL7X/txL+gS5CTpqpd6M9GR1fxHWt5wyGj2KlE7p4u81BO20j5b1A7vC9+
         jnjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6ZkTLznup++j+ETiI3q7N04K3XjTDaIw/OGbmI0KOEA=;
        fh=Qo1snKJerNHX4mUeXQzzlujO7aTb9JnYoBqg/4neaLM=;
        b=h3AQLLG2VLKsAZtDcf+V0vSc6/2PQf0OwcX5sNiywc8pQ0lczjsEZkYKK5Ah0A0fR1
         f7GmFKWM7WWRy2b0+3j42Vbt1V4xBqreVT/LSLpAqbH3me0OzvIj35JxCyx1XW3IPIMN
         LlB21NBO/HLdPr1YhnHwPhFv45HerPA+IG/1fRorDxL7JTGDpz0jRhhrhI9GAaGAGgc8
         hioCbxD3FSGRK2ewmNynJGYC/2SKU4OqPUpUuckPuvSFXfh2fB9X7MPDu3EHJ/rHW2Tm
         trdBXVUA0b2xs3KmXf6Vys2WA3+CBQxisySDnZW0vHGzr30/3oOjHOB83LKg3nQpvv9B
         9BGg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781792695; x=1782397495; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZkTLznup++j+ETiI3q7N04K3XjTDaIw/OGbmI0KOEA=;
        b=ZKH1kH2A52M6r68Fzc66zlWRWEpVuq80lzjHavEJeBtX4bHy3dOXojuknB42PhqHFw
         lgOSStblD4DBycy7P0G08L71jUdsmOaeWRA4Z1aiIvmB98onsvAhiKhiaRHPTuLuWqll
         ApBi6h3Rt9sqM9k8+qFQH5PizUnHThIZ3U3r1h9Y+GOSWjoXS8048ALLxNd+TOulhxwX
         wC1NKmuR+vpC3mKhXLB1YmOhbcuAE8fEz0wMqS0kxQ1IJEjR759ZHZbkLlWpsjLBr51E
         ssY8uuTZwjKj9Zt5jLT1A5Wkp9fD8ZgSqAmDb3q1RMWzp5YKSYA/7cwChnLZyN6bnqwS
         sF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781792695; x=1782397495;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6ZkTLznup++j+ETiI3q7N04K3XjTDaIw/OGbmI0KOEA=;
        b=SbT6o+NgqzCf/DIMBYUT+NOBony4m4SWlB53ZiisTtCAbUUSBxKLcvok3tlfB04SPS
         mA9neL40tnIVdKKTamVashIxcHAYXAUFG/7RYPkER8qnFA1BgYUTesRDAaRjTXjx0cBM
         bv/xCw2xa6UHE3qEKiFLBzCL9x/AknOdi0tnneb11/+0GcIG/BQlNIBqjphF5ytTrr8J
         jQfuX1rK6Yen000Kj8pFisqJ88qIxeQt1S7f5yNq74iDi6zRcKXDDMpJetyZFnGOnDu+
         aSLdPDZdwYnt+8QE3CW5UTF7JJvwc4BBoKZ0/blbOkc7MGA/WLfII7w68ahb+EC5+KjJ
         D+jA==
X-Gm-Message-State: AOJu0YwqRJ8EftafXtQiqsi0fPwXEdAO2Mrr4uS3APi3COkYlaPGCR4g
	tux+ltybXfl2n2yZp9lHaWBdtTjE/JDtMkqRFiqWELQKmqRIUMUDX3GfHPVyiHacrQhYh8IpQdl
	IoJar/sCC/dWKDYdVl4fEuc6XU1UBm7oOEhOz+mnn
X-Gm-Gg: AfdE7ckYw+nTuo5fPA/mqblkHMij+AUzKoL/LSjbJ36+E3c/3IqELCLCECCd47Ulo76
	fa3Vi3pcjv3y0VoTKL8qioug/GujeJ1TCP/jOI+2zILpCxKviIQvMKcI4JQ9Hh7QGYN5g5RUueJ
	od1yLHLheF0EtcH5PU4nWIfMR+An7c7GPr/ZfkCrikBtf6k45hZjIA9PSILI4foK1fGovSPz1yi
	RVqeyN2h+CGYfW1hTKT7fbLsxeVmV7LoN54ygG5qPrvhkidLQ/S1hiGtjUolVHD9gwXobiKDw==
X-Received: by 2002:a05:6512:3b21:b0:5aa:6b27:89f5 with SMTP id
 2adb3069b0e04-5ad4db85135mr171416e87.8.1781792694725; Thu, 18 Jun 2026
 07:24:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260618121643.4105064-1-tabba@google.com> <20260618121643.4105064-5-tabba@google.com>
 <20260618122808.1369D1F000E9@smtp.kernel.org> <86cxxorp3e.wl-maz@kernel.org>
In-Reply-To: <86cxxorp3e.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 18 Jun 2026 15:24:15 +0100
X-Gm-Features: AVVi8CeoopBIbTYaE09ZeamUAMFNzrsBfsl77QFwZoOcgFL63sxSgwLaI5ejrmY
Message-ID: <CA+EHjTxJOXussAoOpBMCD8Y7WXf_zvcp2K-JaajrtvS88O3-ag@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] KVM: arm64: Set IL for injected FPAC exceptions
 during ERET emulation
To: Marc Zyngier <maz@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Jun 2026 at 13:48, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 18 Jun 2026 13:28:07 +0100,
> sashiko-bot@kernel.org wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] The constructed FPAC exception syndrome incorrectly maps the ERET ISS encoding directly to the FPAC ISS encoding, resulting in malformed ISS[2:0] bits being injected into the guest.
> > --
> >
> > commit 27996a8004c4285e2d114067b3fc644f3f649d64
> > Author: Fuad Tabba <tabba@google.com>
> > KVM: arm64: Set IL for injected FPAC exceptions during ERET emulation
> >
> > This commit sets the IL (Instruction Length) bit for the FPAC syndrome
> > constructed during nested ERET emulation. Since ERET and its authenticated
> > variants are always A64 32-bit instructions, the IL bit must be set to 1.
> >
> > > diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
> > > index dba7ced74ca5e..b74369e9ad7ff 100644
> > > --- a/arch/arm64/kvm/emulate-nested.c
> > > +++ b/arch/arm64/kvm/emulate-nested.c
> > > @@ -2776,7 +2776,7 @@ void kvm_emulate_nested_eret(struct kvm_vcpu *vcpu)
> > >              * ERET handling, and the guest will have a little surprise.
> > >              */
> > >             if (kvm_has_pauth(vcpu->kvm, FPACCOMBINE) && !(spsr & PSR_IL_BIT)) {
> > > -                   esr &= ESR_ELx_ERET_ISS_ERETA;
> > > +                   esr &= (ESR_ELx_ERET_ISS_ERETA | ESR_ELx_IL);
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but does this mapping of the ERET
> > ISS to the FPAC ISS result in malformed ISS[2:0] bits being injected into
> > the guest?
> >
> > For an ERET trap (EC=0x1A), ISS[0] indicates the key used (0 for ERETAA,
> > 1 for ERETAB). For an FPAC exception (EC=0x1C), ISS[0] is the Instruction
> > Type (must be 1 for a branch/return instruction), and ISS[2:1] indicates
> > the Authentication Key.
>
> No. Not at all. ESR_ELx_EC_FPAC (0x1C) defines ISS[0] as BnA. Which
> matches the definition for ERET. On purpose. See ARM DDI 0487, version
> M.b, D24-8777.
>
> >
> > By retaining the ERET ISS[0] bit and clearing the rest, it appears KVM
> > inadvertently maps the ERET key type directly into the FPAC Instruction
> > Type bit, while leaving the FPAC key type (ISS[2:1]) always at 00.
> >
> > Consequently, wouldn't ERETAA be injected with an FPAC ISS of 0 (wrong
> > instruction type), and ERETAB get an FPAC ISS of 1 (wrong key type)?
>
> Yes, and that'd be correct.
>
> I don't know who told Sashiko about the ARM ARM, but it doesn't seem
> to parse it correctly.

The problem is that it _doesn't_ have the ARM ARM, so it hallucinates
it. I'll reply to the other ones, and then see if I can write up a PR
to review-prompts to fix this.

Cheers,
/fuad

>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
