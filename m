Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4410A345CAF
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 07:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779952483; cv=pass; b=PqAT3GKvUZ/vX8TKJQFJ9whmspi4X2ruMLaAicqs/V9FRh2H9/yMybQXDDws44VLo3WxbjCW4RhgSmDfbBPMDS/halgbMCQx8SwUH0ZjE2WMvY4QbAjGAnFYsf9Y4Aa9oyD59gq5+BiMJKKIUYG+D1fTKPf7CByph1rU4nlMjuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779952483; c=relaxed/simple;
	bh=G1nZiVxK6KsIv3edURQ3ycnOVP2d1ytBjsVMlQu7lDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYBNyqJ2YpBrTOa4gU+TRTj7VA4zzb23Xf/KDsP6HMwCYEP19HP8EXmc5mXBT3s1ojKnqXO8PxMvftgt2ITut0l6Ca7jy7UUgFe5f08azzbWqvshtLabBrHqWbm3gm9eWGpbrvM760pZuNQhZ9HaL1s1p8vUEEsn6g3+sN7uGfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNpA3jvA; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNpA3jvA"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-516cbde40f2so73651791cf.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 00:14:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779952481; cv=none;
        d=google.com; s=arc-20240605;
        b=PNf0C9/M6GNYkcvcvzRyNR5nzwMO3oOjcgdUWTnOEjyt79d47qb95nf2teU3e/fw8x
         ZecDqs3H+qxPFFNawcFZnWl9AXmHDeB8L9+TVvdld6wuSc15JaAeUYlexY+PEjlQibzD
         d4PSSB1rh/wmBIxRf8RiIwy1S4+nrZbVbfjc2nZUb2K3tsuFwP1pHJ3Hs+ioFT+TvjjR
         N+vwdmuCqOa3GHFgD/1AOAPLIpBwZiOXnt02FcmRcABjLKeQPsBo6klJopaGrU4rOxtl
         cWKPAddlSID7IZM6JziwHTLfCq/6loJhMZJ2Wytjlj0ufgta6B0hfMPSeiuc3qZCORKF
         OZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LGhOSOmxTbuWi+nnww/A8UZLJEjIJIbn4M+RZzE3DR8=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=ZDYVqW1jMA6I/V83eFR3c6R80M8ac7XMPxJzVmxZm6730hxptOfftpiCEBL0ptx3Jm
         SLlhjmjdxeZ/LpP70I8hlsE6heltOst06nO89R0M7NjjNAY6SejCWFQAUYl/MAcOI+LY
         Mr+mCoY3xASRpzYCNX1FnNtJocQN3NFU+1dqL3iGALPoPX4s7RLSiqqzoXtFQGwBRQJ0
         JqawkxvsOkCv3SvARiF+LYSieK0PJusX8tQmc5GQ2FUqkpwUDJ6zWica01uaT0mHmHYK
         DzvzUHfulNDVMAw2bBhdWVcdjKDWU6qPfGil5xBy7FqoFP2+BjWgelt3UBfZXa657Fxl
         U6vA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779952481; x=1780557281; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LGhOSOmxTbuWi+nnww/A8UZLJEjIJIbn4M+RZzE3DR8=;
        b=ZNpA3jvAFC8TnYaSuFMBSFaZ5wC30SUfzvQbeL6FHsAjQGECEWjujDjrvdfrd0pHJb
         C1ShBFHyEQ/zPkheLolIBno54ggGPvQjG5TxncW9d2Ne8cO6TK7xF6SH6Ejx0bfDXd6v
         +SqTV5v9D9p3MK4Zcn2ejYeARSC/KzAazFpAVqxZH+oHUSNRAgAdE/dv3VkhnT/1l24z
         UxlHI5MFoAka5J4vCAuPkNdQRwmQetQI8vBjALNM7fhqja+/jvZ0Bks79GLkJWqRMuWL
         r9svQruHpgJeBhlexCR4f+00cT8+mE5VaBUmPjALzqYgyIUuaq58Zlv2D6/duk0sNeRl
         qGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779952481; x=1780557281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LGhOSOmxTbuWi+nnww/A8UZLJEjIJIbn4M+RZzE3DR8=;
        b=RBVx2wxuZKkkRIGuUS+mv4r8pe7g+DaBHjp5bIi3YpnuaVBg1EKXN0FIVnPLobAUev
         EGrx0aFbHR3pZ0lVtt6lInukH0p2t1ntv9Pj12CI9hOE/4TgmR3lMxH8a7Y3Tad6/0Jq
         N24hYHlCZXk4t6rLzDlIhHDo72LERLNhcB2iTQwix6DWKx5D/V+/sWZCAEY4NfFZXg7b
         qvOjmCmfcc6rAsTh/xZvuTXOtOTBsts5skn6r/eg2vSKw/UxXSVHElso+yW4OcRcNOs8
         1/SiiddanCUA98+gQD1zJeNHelhgKXa8rl+dkFYnFK2+TbjwgRyQ66CFSEz4jW1N7V20
         FJJQ==
X-Gm-Message-State: AOJu0YxqTzEvZU3Y02kKloczAAZZL5qgRMuR5EfDFFtbCzuWpOfmoHn5
	sBEs8tId96jBotZs5+VkWrEuTnVTpfxDL/N2/mZSbDXnxnGeIvrxLL8HKThsecb3A+OHkjp2M/L
	ZXiCFwo/LrRgO4qwnBT6osTzUXGejj9upDReKyac=
X-Gm-Gg: Acq92OFjsOgYqOb4CXzI2MGU1fuAZ1+8cgwP+bAEME79FYNsO3eZb/SEgX8MfrCD0lC
	8TNFYahK8XeDDgfFXC1Z7vH7bE2f/DEh/KaPi0Uys/aAeeHUKXZ+DYDjYmv9rnxC6jF1pOV0jrh
	tTOzFd5kw39kIJHTj3gWKw9x14Z0pemT3VOuRFwf00uEI8hS4/HZkhzghuUbrXgirz0QTYk8k9+
	gGRiYrGdB7fCSG8hiYcCQ3ddqzGcviUK/MFgMKVZMqBAnNN4BuaUmuOvsvwD5pV1AemtGaX4bkj
	1PyVWTPpGSN/LFFl7PYaHVycqsg/R+qnL3o8kHv+lO7BcGQz
X-Received: by 2002:a05:6214:4903:b0:8b3:f7ad:635a with SMTP id
 6a1803df08f44-8cc7b5ddd3emr446095576d6.48.1779952481171; Thu, 28 May 2026
 00:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528032234.1322565-6-ewandevelop@gmail.com> <20260528050321.0DD3A1F000E9@smtp.kernel.org>
In-Reply-To: <20260528050321.0DD3A1F000E9@smtp.kernel.org>
From: Ewan Hai <ewandevelop@gmail.com>
Date: Thu, 28 May 2026 15:14:30 +0800
X-Gm-Features: AVHnY4JyDGkvFdQ6mowJdo2OfoTGmXlfxQAeK2554Ypeqb3E5NFpyO9ITINJWwM
Message-ID: <CAG2uPc7uHtGYONp6SxQ4opiAoo4ReVnnSZu84qippzcwP=0YSQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] KVM: x86: Expose Zhaoxin RSA CPUID feature
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 1:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Exposing the RSA big-number arithmetic engine to untrusted guest=
s creates a severe local denial-of-service vulnerability (Instruction Time =
DoS).
> - [Low] The newly added X86_FEATURE_RSA and X86_FEATURE_RSA_EN flags were=
 not synchronized to the tools/ directory.
> --
>
> commit 39b1d23089ffb8d188fc17bb71d4da69fbf1ff4a
> Author: Ewan Hai <ewandevelop@gmail.com>
>
> KVM: x86: Expose Zhaoxin RSA CPUID feature
>
> This patch advertises the Zhaoxin big-number arithmetic engine to guests
> by exposing the RSA and RSA_EN CPUID feature flags. It allows guests to
> use REP XMODEXP and REP MONTMUL2 instructions for accelerating public-key
> operations.
>
> > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/=
cpufeatures.h
> > index 3702d7a30ae61..a769c83588f7c 100644
> > --- a/arch/x86/include/asm/cpufeatures.h
> > +++ b/arch/x86/include/asm/cpufeatures.h
> > @@ -154,6 +154,8 @@
> >  #define X86_FEATURE_RNG2_EN          ( 5*32+23) /* "rng2_en" RNG2 enab=
led */
> >  #define X86_FEATURE_PHE2             ( 5*32+25) /* "phe2" PadLock Hash=
 Engine v2 */
> >  #define X86_FEATURE_PHE2_EN          ( 5*32+26) /* "phe2_en" PHE2 enab=
led */
> > +#define X86_FEATURE_RSA                      ( 5*32+27) /* "rsa" Big-n=
umber arithmetic */
> > +#define X86_FEATURE_RSA_EN           ( 5*32+28) /* "rsa_en" RSA enable=
d */
>
> [Severity: Low]
> Should these new flags also be synchronized to
> tools/arch/x86/include/asm/cpufeatures.h?
>
> It looks like check-tools-headers might warn during the build if the tool=
s
> header isn't kept in sync with the main cpufeatures.h additions.

I'll fold that into v3.

>
> [ ... ]
>
> > diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
> > index 3fb81f7a61076..94ea9abae566d 100644
> > --- a/arch/x86/kvm/cpuid.c
> > +++ b/arch/x86/kvm/cpuid.c
> > @@ -1290,6 +1290,8 @@ void kvm_initialize_cpu_caps(void)
> >               F(RNG2_EN),
> >               F(PHE2),
> >               F(PHE2_EN),
> > +             F(RSA),
> > +             F(RSA_EN),
>
> [Severity: High]
> Does exposing these instructions to untrusted guests risk a denial of
> service?
>
> Since REP XMODEXP and REP MONTMUL2 are unprivileged and support operands =
up
> to 32768 bits, can a guest user-space application force the physical CPU =
core
> into a prolonged computation?
>
> If the hardware doesn't efficiently yield to external host interrupts dur=
ing
> these massive operations, it seems like this could stall the host, delayi=
ng
> interrupts and VM-exits, potentially triggering host RCU stalls or watchd=
og
> lockups.
>

the PadLock spec guarantees these instructions are interruptible:
state is saved on any interrupt/exception and execution resumes
from the saved state on return. We've also empirically observed
mid-instruction preemption on the 1024-bit MONTMUL2 path during
host scheduling tests. KVM's normal VM-exit on host timer/IPI
applies, so a guest can't actually stall the host core beyond a
normal RCU quiesce window. The existing REP XCRYPT/XSHA
(already exposed via word 5) share the same interruptibility model
and have been in guests for years without DoS reports.

> >       );
> >
> >       /*
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528032234.13=
22565-1-ewandevelop@gmail.com?part=3D5
