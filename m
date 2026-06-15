Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE1022538F
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781527746; cv=pass; b=uq8FSwkbUtLGR8G0m3VGEAxSTn7j+6fhrj52OeJ+VDzVy92AToS3+Zswj0xSwJ9Ddzr+oqRKQQXoLdvIS38oxIfbQIy0VVeNLpG4+tawCgZteotpFL9igtv4wbtuUKjhzwgkgHGdgZe8wclLrpXqpmmQ5vfqeqWzKjEYnZgAe34=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781527746; c=relaxed/simple;
	bh=LJe15JjUek5fw6XKFzJA+271/vt7M6VL9YSeUdshYcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mk0PXcPpVTb+H8w1RegjT9Crz1J8rAV7+0mbZLjKUEKTF2gTMS7+4XYA1a1lHaUptkMX2qucJT0qNufpPWMY5p6B31hD1AyjRaPk9MowEVQ6cCnBvSOLAf0d/HezLdlBbN6h6Ovz27HsWXGljlsqsEm4hRS78mEiXGtRjs7kUhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VYUTMcAH; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VYUTMcAH"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51765331535so934751cf.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 05:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781527743; cv=none;
        d=google.com; s=arc-20240605;
        b=GliEPrLmfY9de+aBZAGSPJ5hF630ebBg+BiVA4nn//Goi3/MYVs2xUlSxqDcdnIvQA
         X1/dC2WLYXAqJqrhX2TScDPeQPkj/ByB/VjTZH6pdPoZG6Mc0I2Z3Ka4jWq5gme5PFR8
         NT6T5WjiqcUxsKn4ozQX5QFE2UCyV1+KorNFUQqOAG1jzm6gNQxxugcBJ7GJ7swm4oh6
         R0CZkFB7e/EjN5nu3Zxn4PZEh4ZuEpQ9sbyzgneYCEpj8tTsjqYGpTsP6xC30b2EABgs
         ydFTn6/egfJIBHDpR37H6GBSO6o/+fBLVk5xjZOKKcU3kS6jnAUwfB7IHle0GaJ08g5d
         /+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFCZ8PiCdles8sGmomIgyqjJQ3JYp7FDY2a/owznabc=;
        fh=72Zv5DwALZblOpx9SPAiT2x2CC+g2u2bBNeYtrdMw5c=;
        b=lwp2kaIOQdlS6gk0dYn92QqutddK3KF35Sw8qo6o9ltSiU440w/6iJCOP04CU2ZjwT
         DoSfKKXNM/09VoEms+drbeJGHCODwmTX15Ad1U1loiXmd3YrZa9gsfSLKiLLS7rjy/NY
         oBaBvo5XIuOrYJNJ+j5Sv9LP/sptJeI0F7u2Kkpvsy0bPNuEWRe1qu+9f5aFxuFBt0ap
         /JDGOfUqdhpMiHQ3ZZTKPN2f8rDlMpWucPp5n917rg33/hxSwMobOppgPsPY2nGT3uP0
         zyG3VXng5wmVqfG27zvXcqYvd/epYrEFEPgAhS5Qec1xSTWuDAduf0+4B3rg/JySYP18
         ytHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781527743; x=1782132543; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFCZ8PiCdles8sGmomIgyqjJQ3JYp7FDY2a/owznabc=;
        b=VYUTMcAHA1q4lmUxOwxdXjawgEeZX13g3mrK2jjd9AxYVBDs0wD8QO9Q8o1vHlZ0rQ
         4WagY5qy3geWbU30F+zYYDZJXP10heZdSdHV+FOLiSxe2y73HWLFcnEQ+ILd9tiaBmG5
         AZHA9UhJuWCi8m0SYO5nyD33zynfg2YDLmCkC9oR1FKW3bZk1J7PqhBU2m9nvjouf6dy
         E23wiM9/gIltglgmmMoUd++rYrYhZQDED5l3stM7xTqx1wR0aOTB5muUrdDb2pBBE8sH
         h0h8ocBn4Qm7gmRAhkeOymO/hCzhcR4Pb7lshFSkcZZ0qC1romvEc9VI7AOSKRss2uv5
         Vd6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781527743; x=1782132543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zFCZ8PiCdles8sGmomIgyqjJQ3JYp7FDY2a/owznabc=;
        b=BJNFbBBk+3sNpoAdls8DSR1qTdOincMyBeFoTANa3wH/bUfuVFmqa3fCKsCqi4mUad
         TUlysbVqwnvMpaVuVSrMtPMpUhuMlumiSLMUFX3HbfZVNVh+b6tBRKsST0VVpE158IpR
         guWm2SxCQ3wES9YOnYmQWThFPux3YWE93I+txwJwGVSJ0IYqAZAxQzx4EGZxw8SAzqgX
         fsSIjxiF0z6qjSFTmJDyR4M2Qi673p/4VxectIPA/V57Htdm8nWZFVmQDgOwHC7JiQ0q
         pM2v2rgZ0rB4RWElLMhXqiJtw7kgqgTu6j3WNDrur4UU6b/zuPoNQ90UMTnKMoU+6JUM
         jcsg==
X-Gm-Message-State: AOJu0YzNZ6tk8UB8RuGJ9gUxGgkm7JbdYzkaoADeXe8sXbDd7OJxI3+q
	HU6GGL7zZyQeVM9T9IXZDmQSovtldJ2MQT6v/7rBY/VZuACTTJ6s6FnbPl4A6ttjpKOXPTohdh0
	Gfc3XALqsOG0R9BiaJgw2OaPZDOvgv670bMTM3NwNbRy7p64KjGCT/XUQWAk=
X-Gm-Gg: Acq92OEIsFvxK3k5juUbT25NEJfBLXrvKdc65+M0PVKJZEY1z9tgZkNFZJoNLexSha4
	QZ8d0DOTW1xLBgXR6rt+C3XvkshMq9X1oySiIuXtIpeoOqisJtFv7pBHZrR5Urm8WsJu8YgMGaN
	t10q9Wx6rCdIQKCfyMHivLgM4EzKM4eVeX1R538pUSPTFHi01xDX1dKCelvUkIeSkNJSSZBJZPj
	qTMugHCLVI051RnHhMc5u9n3TSLnc6A6HFYqDZ6gChbFMNftMAMUwTt57ySCMTZ2toS7QMtGjmG
	ghPP4mb6
X-Received: by 2002:a05:622a:1cc5:b0:517:6010:7c71 with SMTP id
 d75a77b69052e-519872e72c6mr1555771cf.4.1781527742564; Mon, 15 Jun 2026
 05:49:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614163336.3490925-6-tabba@google.com> <20260614164640.2C2741F000E9@smtp.kernel.org>
In-Reply-To: <20260614164640.2C2741F000E9@smtp.kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 15 Jun 2026 13:48:25 +0100
X-Gm-Features: AVVi8CdTpojXp5Rg93zTw6F_4PdLKLBfJzTQdQahYiR_o2rdoYlbw7YfqZYAuPQ
Message-ID: <CA+EHjTyq7YG4zap3uRYOm7CRs=OToH65iSZ2bPjkvaSpgUm=QA@mail.gmail.com>
Subject: Re: [PATCH 5/7] KVM: arm64: Set IL for emulated SError injection
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 14 Jun 2026 at 17:46, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The patch series attempts to fix SError syndrome IL bits, but th=
e constructed ESR is silently dropped when injecting a nested SError becaus=
e `kvm_inject_el2_exception()` ignores the `esr_el2` argument.
> --
>
> commit 3adb0abe8b63984396e6d2ad4fb963bab5512c79
> Author: Fuad Tabba <tabba@google.com>
> Subject: KVM: arm64: Set IL for emulated SError injection
>
> This commit updates kvm_inject_serror_esr to include the IL bit when
> constructing an SError syndrome. It fixes an architectural compliance iss=
ue
> where IL must be 1 for SErrors unconditionally.
>
> > diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_faul=
t.c
> > index 444d219b02174..d6c4fc16f8795 100644
> > --- a/arch/arm64/kvm/inject_fault.c
> > +++ b/arch/arm64/kvm/inject_fault.c
> > @@ -381,7 +381,7 @@ int kvm_inject_serror_esr(struct kvm_vcpu *vcpu, u6=
4 esr)
> >        */
> >       if (!serror_is_masked(vcpu)) {
> >               pend_serror_exception(vcpu);
> > -             esr |=3D FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR);
> > +             esr |=3D FIELD_PREP(ESR_ELx_EC_MASK, ESR_ELx_EC_SERROR) |=
 ESR_ELx_IL;
>
> [Severity: High]
> This is a pre-existing issue, but while we are ensuring the SError syndro=
me
> is correctly populated here, does the nested SError injection path drop t=
he
> syndrome entirely?
>
> When injecting a nested SError, kvm_inject_nested_serror() passes the
> constructed syndrome down to kvm_inject_el2_exception(). However, looking=
 at
> kvm_inject_el2_exception() in arch/arm64/kvm/emulate-nested.c:
>
> arch/arm64/kvm/emulate-nested.c:kvm_inject_el2_exception() {
>         ...
>         switch (except_type) {
>         case except_type_sync:
>                 kvm_pend_exception(vcpu, EXCEPT_AA64_EL2_SYNC);
>                 vcpu_write_sys_reg(vcpu, esr_el2, ESR_EL2);
>                 break;
>         case except_type_serror:
>                 kvm_pend_exception(vcpu, EXCEPT_AA64_EL2_SERR);
>                 break;
>         ...
> }
>
> Unlike the except_type_sync case, the except_type_serror case does not ca=
ll
> vcpu_write_sys_reg() to write esr_el2 into ESR_EL2.
>
> Will this cause the guest hypervisor to observe a stale ESR_EL2 value whe=
n
> it takes the SError, effectively rendering the syndrome fixes ineffective=
 for
> nested guests?

Yes : https://lore.kernel.org/all/ai-DsLydd7ry0RpS@kernel.org/

>
> >               vcpu_write_sys_reg(vcpu, esr, exception_esr_elx(vcpu));
> >               return 1;
> >       }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614163336.34=
90925-1-tabba@google.com?part=3D5
