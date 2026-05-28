Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400AE3ECBE3
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 12:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779972575; cv=none; b=QWZGY7ZgvAmUggxhCEZ6RpcUpmFdCyL/HBDooP3SAQDmXxPfsx6i1JJIotq0zJL6gmRUmUkEODbjvp9gMRduU5eQvFPYYhDISbsD2bKS6ePRobV43odSyxVrWcCrmrHqsgUTDYUaN2G1Xn3dYmXBZ6+1RCTr+N86ELlh0d/ssHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779972575; c=relaxed/simple;
	bh=cO6gghqKZ0xUf+sm8Z9XiAstEbJFOtgSZ5IWu3J/D+U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qWfWDntVolvFLpGtQAGrU1+AcZk1R3owH7LvBHaDypKPfW61F2T5KyiTLJJU+UkCAQNJKyEsKf+ka5Ot7Gm5E6x4PRCTHqX/AxuOq2mPdyqXC12/VGYPQpR465277o2G7q3uzKcpWo/lVgyWFYc/V709MLCBpu8bmbpUKpUJlKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VB26CISF; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VB26CISF"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ba3245a43dso144394515ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 05:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779972573; x=1780577373; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xoX+HJf5CfGdFpnE/ruFvtcG1LFz14O1Rwlo2nX/hWc=;
        b=VB26CISFbRnSG9avQAiYK8AuGsuqyadrkux9+EJnTxYEdCKx+4otAUFO6u1xAkW7Ht
         O+GTNSRr24NYQdUCTTIvcgX0CF19vM5TIY9oivMJujxd2vO36hVKMVkG/89uy0gq9tOt
         iAcSlNV59zLjl2CW45NXfkJ8oZiTESx1BMJCpmSVvBsp7Q2plxUsHM5g0dbihdmTCaGj
         VaP+HWblOzV4oZkEPWotdFZSROTNum2o2ppFUT0MNRJiFPh/LGIXex/p/zbQ4aIwOVCU
         BQR0raqm8xWFnrchbWW+r0O4mSubarqDwgpnqowdnTgc3po2FMQsOtJoCFKZpImdo0WA
         Zlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779972573; x=1780577373;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xoX+HJf5CfGdFpnE/ruFvtcG1LFz14O1Rwlo2nX/hWc=;
        b=dR3rnQsFHurUgNSEfeyKVuZGUK2VAZpOqQfbjaxeSjn1xwUbwS5rQkRjStWCEqHWzh
         2vjhmUeiTbU3gI8iKbNGX5f5LrnKOfdDxuhfsJyfjNtFT+AW7khZdo8z4tHD/Cq1iOhg
         PKK4RgiZY8zGDuGWXpvPI6+mUFPWU2yxpHfyF1OnpTOlPMkkx9pmF1jFivbKRVVxzViE
         9E8xfedcsYzfZAcWjaB5fGF0uEzt4czIhuD+k1Wzp18m+dSSWtUBdV4i2ZTIVwigQTr6
         RgnEedZtthPlqY9VJKB7jb1jOVrs7iRi1/QW1vPGIy2GdiYhsG/RcUUqQvJbW0TKO3FQ
         RLxA==
X-Gm-Message-State: AOJu0YyoZktd/TdNTYUcTyl9TaBc0sDJVnq/w7XZkDNoJ49FA1IZ1JR0
	9AHX2dgHB90fFgXJ5w0QJprRulfzc2QuKMHV+bFjjYxAoMN6ZVcycBvHBcmQ6/ApXGXoyKaaF3P
	vyNbzGA==
X-Received: from plbcp5.prod.google.com ([2002:a17:902:e785:b0:2ae:3b07:ebc4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3c2d:b0:2b2:42b1:adac
 with SMTP id d9443c01a7336-2beb031af0bmr285011025ad.3.1779972573385; Thu, 28
 May 2026 05:49:33 -0700 (PDT)
Date: Thu, 28 May 2026 05:49:32 -0700
In-Reply-To: <CAG2uPc4E4mW9Rvxb7PdzRByd9teW0KcJaKHB=ZBHQWLa_6iiJw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260528032234.1322565-2-ewandevelop@gmail.com>
 <20260528034244.DC8041F000E9@smtp.kernel.org> <CAG2uPc4E4mW9Rvxb7PdzRByd9teW0KcJaKHB=ZBHQWLa_6iiJw@mail.gmail.com>
Message-ID: <ahg53BN4d0czbjDV@google.com>
Subject: Re: [PATCH v2 1/5] KVM: x86: Expose Zhaoxin SM2 CPUID feature
From: Sean Christopherson <seanjc@google.com>
To: Ewan Hai <ewandevelop@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026, Ewan Hai wrote:
> On Thu, May 28, 2026 at 11:42=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Low] The patch modifies `arch/x86/include/asm/cpufeatures.h` without=
 syncing the changes to the tooling copy at `tools/arch/x86/include/asm/cpu=
features.h`.
> > --
> >
> > commit 17e8fbfd326bc812ee6f132253d520b0c7201874
> > Author: Ewan Hai <ewandevelop@gmail.com>
> >
> > KVM: x86: Expose Zhaoxin SM2 CPUID feature
> >
> > This commit advertises the Zhaoxin SM2 algorithm and SM2_EN features to=
 KVM
> > guests via CPUID 0xC0000001 EDX bits 0 and 1. It updates the CPU featur=
es
> > header and the KVM CPU caps initialization.
> >
> > > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/as=
m/cpufeatures.h
> > > index 1d506e5d6f46a..20b33413189c2 100644
> > > --- a/arch/x86/include/asm/cpufeatures.h
> > > +++ b/arch/x86/include/asm/cpufeatures.h
> > > @@ -136,6 +136,8 @@
> > >  #define X86_FEATURE_HYPERVISOR               ( 4*32+31) /* "hypervis=
or" Running on a hypervisor */
> > >
> > >  /* VIA/Cyrix/Centaur-defined CPU features, CPUID level 0xC0000001, w=
ord 5 */
> > > +#define X86_FEATURE_SM2                      ( 5*32+ 0) /* "sm2" SM2=
 algorithm */
> > > +#define X86_FEATURE_SM2_EN           ( 5*32+ 1) /* "sm2_en" SM2 enab=
led */
> >
> > [Severity: Low]
> > Since arch/x86/include/asm/cpufeatures.h is modified here, should this =
patch
> > also update the tooling copy at tools/arch/x86/include/asm/cpufeatures.=
h?
> >
> > Without syncing the tooling header, tools/perf/check-headers.sh will em=
it a
> > warning during the perf tools build process indicating that the kernel =
ABI
> > header differs from the tooling version.
>
> good catch, I'll fold that into v3.

No, ignore Sashiko.  The perf tooling folks keep the tools/ headers synchro=
nized,
they are very deliberately not used by KVM selftests.

P.S. Please don't top-post.

https://people.kernel.org/tglx/notes-about-netiquette
