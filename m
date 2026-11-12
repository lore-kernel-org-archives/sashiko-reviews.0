Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794522150;
	b=MpFGmJI2bzo7Mp8OAOjwbrdtaqs++Le6FifqVVhn9M6Q91qLQCFT9Nd87cv26kyCSPO0
	 xKN57Z3UuRE2sS+oUPpJJjDjOS7UdDKzN9RcJ3m2a4CbXQGIlIOewD/GpheRkY+9aQCky
	 g3BtL4gxtH/qtKOgxpyK1g28cL1Jmz772jDMehuvPMjbYS7GnZ7A4Ym9ylEhdd/GC5hQW
	 mY0EDHXhNVqypBpASlj64HYm61MMhpdDsIv7ke5gzWtjRJDoZavHDTCgo/QrP/i+ZPf5G
	 T23WhGreySRc2xbznAhU5VbgB5AStZgiYxImZSW99HR4XSzi5YRX28pmywCD53qmtqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794522150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=QrgIfCS7YStc9wryNUO5eUzghFQY2XE+PPHAxJEeCS4=;
	b=k/vqSqDqcVFjCRgVmNiMPgpBfXO61SRYcsPEqvyP2StWAoYEB2zzHrXYYyCy1wSGDvGL
	 fvNUUQvUiGHwP0d+KUrqoAvTk5bpvPLW2NKcvVQJz/KbFWmZUWamONDXHW1/uJOJADUI1
	 NaXvOQS1sjl2F3CBGQo2ttAi4jKKCE6kWOpDKMnmFwOeT/mUfOV0w5wy0ImksK4f+JdLr
	 bnr8c+Z90FTICoqZXyrFhpRkpyr3aCUOwIrVhLN6pIQ0XtLIriime7/CfsGDHA9cfEM4e
	 mPtP9yW9+hxeyHdC7n42Vsz7MQuOYzRZ6JYkOYdVkKOUiy2KMMpknHzio7GoItDiuHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ceh7wgQb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D0A606A321
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 22:22:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D0A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ceh7wgQb
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b56c90b38eso2424a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 14:22:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794522148; cv=none;
        d=google.com; s=arc-20260327;
        b=Jyo8/B6gu9uZLVhXRmay2+KY/H2O6zM/8B7YREZLIWop+q6+zZw0TsDEfSsjyBNJ3d
         dBcX0v4CZkFBDuXWOhB/3g1PZW1cp5nd1fi+mbPA7z9SUdiG2+Y48royNi3QB8ZR9Uvj
         5HtjpJLlJDThW5xAiAtxfN95dbHH6EkRwPHwj5ZSIna+DrWGn3iT0+Iut+I1FfzZ1rk2
         Mq8B4FSbvK0WQcJqtDOu2okd7PPRFsT/qM31oYwL9+n6GbuKdiN4gaKE/wv7xBmg8c/o
         PY8Mp3HWVJUdRnrYnA3Me2rHwFQz+2eG4RBMjyXEqez2bBEd8hKs/vOKtkanHbUL2IgE
         6JAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QrgIfCS7YStc9wryNUO5eUzghFQY2XE+PPHAxJEeCS4=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=sbD8BLS8Tr1Nly2eB0+Yf8w09eoLhudc9JS2HDVDI6r8QtgAuGh+MRy6Or+LHfrs66
         LwqUXBdNiwSCGj0scHssosOgzqucJtEFEkklkbjmmXqoa8Vw65xMqyG7HY55oLcA8qJ0
         R5dJCuF8vWZd9Xw/cGpuNl6zbK8xUQt3gzde+GkBqxT5vLQjqJcRThgLY7GgLcpn0pxG
         x22sycdzFd1aIvEzAJ6VM4/VhqoQsmJON0rcqLFLg397UY6xBb0VszNjXlPN2AlxO0CB
         8eg0CQP8FCfWaBdyqN+4I2Bk+Dc1yONyZj7pYYv+3Tf/mq2a0fq2jox+/Bt4OKDodoNt
         aSCg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794522148; x=1795126948; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QrgIfCS7YStc9wryNUO5eUzghFQY2XE+PPHAxJEeCS4=;
        b=ceh7wgQbb1lGMPgDJudrjwHznj0z9f4XtG/oFhnDWc9UDntVlGYujZoUIu4tcxIpIQ
         MhHj6PfGqv2TXuXTUKBw4VY26rVlmaZCthXjU6VGnuh9YLA0pFjSDp41E2ycKjnzLHGd
         alIlpWdM1Uf1w/pAZrqmnEWejGQhNBa+KC5U4SeEiAgJnQ5FnFmhtP1NecTOxx/1xzPF
         ByIMc6fZo+hYo+BVqTcIzDI5RzvVQYNr834qBd3lKc4bwmJwb332slUXsEhMPwH4DUVq
         ldzriszJgPPIOceCsPt/YG5PZYUssZWtMVDzyPzryfb0Y4ef3VKbzas+pyudWrGXoyA2
         codQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794522148; x=1795126948;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QrgIfCS7YStc9wryNUO5eUzghFQY2XE+PPHAxJEeCS4=;
        b=k8z8BCKBInrdqMhhU64CJaMprVMX1bqRIL+QmM8H9bwvYLsNaHO5PDZnqwiu3uzeEE
         e12ohMQj6tcgUh4oQ6T7pqLG8CAcEzns7xUNhotB5F9T3GLSHWM7P0l6YZqvQVMNTUM3
         IIzLQE94ZL18JFSlbYmEUqX96lpJ5SemdXR2ouTSpku4jnF5CrBAZoavLcDAuNeharyR
         m3V8tLTanIn3kMtDMbWvImaaVd9qV+yY1Dp65GabFEyiuoOmNFGC5Tf5KfQBjuur0PV1
         617MtqQcgCbQTkZB3zt7GMmixPStX+Iyv5rtX/rANEhXwnwshAAz91Sb8StoDkCsNw87
         2A9w==
X-Gm-Message-State: APuU4Z9by1lQUhAD/YgkwdJjMReTnG/L22R2m02oHHgsSZN78k178bvp
	5Uo8znbGlOF97Xe2uxaFuYBp7FjK/qdYAHFMajzcNbj1xAUp/2MHMg6EyIPnBr9xqxvQCkhYz4S
	KzEtda8O++a5pg/ux/rblbcxiJdoyaXZQ23fPuL1yRIK/w7XD616LybelDTs=
X-Gm-Gg: AYBFou08PCwVTQKgO0LeC/fr3bfai+M6EQLX4PZke9Z9gncHU9qui6TQt4cq1NWncjY
	KBy64/w1ws8Gmfvdmwv2yVXCQPsrKPYkQ3tx1HLVHyAT9XOwyqU7AuYqhbZRqb4DboBdf8WHDGb
	0IZrcCVHeAZ4F3UhQ4fezYMcN3M17RjfHxN0kxST0VEybKI9+RoCigggXmmOAN9ctUEarGlmc+B
	jGYboNMZNJQzW+T4KnjeHVEEH5ZukEGD03JhawcNEg4FyC0DV6wuk8k4xu5TQavBHTmKXszYYbk
	UD7Ms5GR+hfKtkcvEV8L+v3RB43ibv5CJBpZmx7mSLXVmtFbWxV8f4Pa0HcYe34JTJD7mo7PRzz
	2VonBjVHFRkUOWCEWwKQFdVhqtWYW+elHBhER34YoX+3Dnz69jYFDGtrf6q0JKrg+yts0OwDS
X-Received: by 2002:a05:6402:a306:b0:6b5:5d24:5d90 with SMTP id
 4fb4d7f45d1cf-6b7c33b4044mr33238a12.3.1794522148143; Thu, 12 Nov 2026
 14:22:28 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112212628.265262-1-jmattson@google.com> <sashiko-outbox-211867@kernel.org>
In-Reply-To: <sashiko-outbox-211867@kernel.org>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 12 Nov 2026 14:22:15 -0800
X-Gm-Features: AclHuK9ee6Z7MEJHoBdy4dj0b2KNlvJa6JYEsQ4nMaHf-mKBUBV3DO4EK52PSLU
Message-ID: <CALMp9eQWBoeroBs1oXCYVH59ZX0P2kEaWxOYeLFHMN1vjPESfQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: nSVM: Gate CET state copy in svm_copy_vmrun_state()
 on guest SHSTK
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 1:32=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] KVM: nSVM: undeclared vcpu in svm_copy_vmrun_state() breaks
>   build
> --
>
> commit 11b89023661c173dccf1cc07088879a6b4ff0bef
> Author: Jim Mattson <jmattson@google.com>
>
> KVM: nSVM: Gate CET state copy in svm_copy_vmrun_state() on guest SHSTK
>
> This commit changes svm_copy_vmrun_state() to check
> guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) instead of
> kvm_cpu_cap_has(X86_FEATURE_SHSTK) before copying CET shadow stack fields=
.
>
> > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > index f9090b601efaa..2a1c279bd54a1 100644
> > --- a/arch/x86/kvm/svm/nested.c
> > +++ b/arch/x86/kvm/svm/nested.c
> > @@ -1218,7 +1218,7 @@ void svm_copy_vmrun_state(struct vmcb_save_area *=
to_save,
> >       to_save->rip =3D from_save->rip;
> >       to_save->cpl =3D 0;
> >
> > -     if (kvm_cpu_cap_has(X86_FEATURE_SHSTK)) {
> > +     if (guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK)) {
> >               to_save->s_cet  =3D from_save->s_cet;
> >               to_save->isst_addr =3D from_save->isst_addr;
> >               to_save->ssp =3D from_save->ssp;
>
> [Severity: High]
> Does this fail to build because vcpu is undeclared in
> svm_copy_vmrun_state()?  The function only takes to_save and from_save, s=
o
> its signature and callers in svm_set_nested_state(), svm_enter_smm(), and
> svm_leave_smm() need to pass vcpu as well.

I should have mentioned that the base-commit is
dea4f6380f4ec96e8f3b0aaf2343764bd0d25ef4.

Commit cd0e6f4d7cec ("KVM: SVM: Add a vCPU-aware helper to get
supported DEBUGCTL bits") changed the signature of
svm_copy_vmrun_state().

Odd that you quote me as writing:

@@ -1218,7 +1218,7 @@ void svm_copy_vmrun_state(struct vmcb_save_area *to_s=
ave,

when, in fact, I wrote:

@@ -1248,7 +1248,7 @@ void svm_copy_vmrun_state(struct kvm_vcpu *vcpu,
struct vmcb_save_area *to_save,
