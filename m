Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5283ED5C3
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 13:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779975366; cv=pass; b=MpAwbjSN62yRBFAg9m/XtzSeJHHeRpoaf3jqeGCQ5oyOnBO4eYKW/sM9GCW9Gi2OIhpvLfXjvCa8I0vEui2xgQLkVjGSJcJ5rPRxHOtvS4GI/3GlWd4UOwpz5GjsR2iqOxfztkdoyLnYBYPH3hUlle/dAGAuVS7Ss94sXXiCnhI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779975366; c=relaxed/simple;
	bh=P3IrmMXLL4fCFKTzkSjp/aO/dyw4SFgXHah2BzkaNuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XrDBFnqltEkOy5shNgOtMEwAG2eOWnBdiWQa5Waeww8isNuxerP4WOtVtpknxWqV2wVd/ggt/nwXoG2/HooNar5EUtDbZL8Em1v7VQsY03I/0XcAt+7TdkSpMHaJtzr0SO0cDf7ZK+Sswi9ZCcEQHouZyFHDWG4pK/piIougTXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=keJBkOlr; arc=pass smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="keJBkOlr"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5752b27958fso4335257e0c.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 06:36:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779975364; cv=none;
        d=google.com; s=arc-20240605;
        b=Db8L1mG9skAmFg3wi9adiQcpElvyaEkwqFfSliipVGF3SEY+71nsZCQ8cRS5M8VSul
         2nu3zkkBqREBelpbo1BWaokjrytqYoXY9KACP70f7UqgFC9Hxxh219BD5dAKv89k6/40
         OkVhiUm/x/4tYBFr7g1Rz8LEeqY3fNakEWXRAJD5O6f+LnbC21+YcmxmGeijxSPJoZOE
         jkn9EitT+YBdquFv8u146eWvsNDaQHvzYYad51hbj4KbllS5IiPue8zT4WMh1J8d/Siq
         z9967E6N0ctFoHZBS5D/hFEYFnS0blcxJv5OAYrE3xN4+W3Owzq9fV/ar5ATWsJ41avg
         5sbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mPeJHskhd3lDys7i6trkIEfX9tWtfy1Nmsn6Xgo+Gyk=;
        fh=9lL0hF0NMGethsOlsxoDeLBT8jtu7UHbhiekQ8TuZEc=;
        b=fi1ADW34Vex4QK6RRqn2Ok8fCpyXc6T6I2vooKwVJ8gw15KYbxhomWODaFR8BrO+dI
         jGgkqH6o5J+IVDXzyhKEo7YRxFpwG7KX9daDRlEvCb7RPmmUnRPEPRq+cJI8IZIdDM/l
         rl89ocxJoP27SB/Fb6fIMq/sddLADXsYe5bTpQ+QuToqwSzQijDl+XvELSBbTypyNSGf
         phafLImqO3UaCnG7mD7zToamsdT/BSoOtVsPGhIrBzXGk3i8pofaVZqGveHcO2z7ILTt
         b0UscQT+lPlXlZTqmRTB6KGY0NDp1yNim0ozsq2VlJwRUyi4hSHd8Z4Suq/FDebU/FUT
         smzw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779975364; x=1780580164; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPeJHskhd3lDys7i6trkIEfX9tWtfy1Nmsn6Xgo+Gyk=;
        b=keJBkOlrM0l1NsaTDbsCGAieHeRH3WsG2Ek8fHHf2mb8VgQrMfme1px37735pn55h+
         VapaSMFk1cTsCk8QNQz2jOZAPcJboYXHM1Fx8rDpsJmHuO2rRxZXy8632JqrLuLpuRqp
         9tkwXKEX3PvPlk9Ddbx7hIJv/yEYHA+j21kFNKVFhHxxlq9Lm+0Jwf6feWx+Zv1wx+Zw
         f+4zGL+G+xhilsADfQmT6JGjaoTZuZtyZTTSwyO2E3YLadOtgDEnH+2gizWlKm8ULiEt
         G8kEF2dy3vZ225r0sZ4KleGzw7RyDwAKc/n1xyPKu8hUt+qJ2DLCZ9n+yoQuytcFogkA
         a5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779975364; x=1780580164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mPeJHskhd3lDys7i6trkIEfX9tWtfy1Nmsn6Xgo+Gyk=;
        b=Ens/aSjV80EWfWRTgM7bt3OF28IsR7+8tly0bJ7SUKid2HPXiDA5f00AegA33jhqYa
         vR5lxspdNOUpzsws/pD6IBlCxCTxYg7vyLPmB42rlpmHAjK34LEfvPh0OG4KWzPNplq1
         9z6Zenn4DNcWpTmkBU8iPK9aIBrtTIytRzxbSarcJf/yR39OYj9aOrIGDnEkNqP+NkB2
         RpYkk6JIFizRxWMbIEwJXjN1JZcknF6vI7aHD/V/epCtJu+OKYvF69MSgprsrITwZObv
         PFk39z8YcJuBWXWPRKfNY6wJep4YeKlFSAQ4NqL2p/1v1k+fcw3kFFTCbs9WIIKc78gV
         YgYg==
X-Gm-Message-State: AOJu0YxmafRbTFwvsJty3vjyH2dCjPt8YUAlVeDlK2fiCegZPSsEl74s
	BpSd0DK79B6t+fDJcuNWc51kp/8Ly2MCoq2R4yc4eUsb8izkxIEC9dNsL5yH059IIkOiLXCaxVi
	hUV+BfCU1t00H8yz0rwtkv0u/XN1g05U=
X-Gm-Gg: Acq92OEtB9er8Om8P0S9TwPi05jZ7kB+O1P//K3f94kxwD+rot42B7TWEw9CG6gaHL8
	yFRg9tjq85o4vhE/sKsq02NcUrs9z2HiT/n2MrqqHjlV1GWQVqVV9OEbBslA7gktk0/hqt2+fjh
	D65Utkqb1abWq5nt9sHvi74PP270jqNKIzz8O8vjuozXxtx+WivSb8lgNK/e3FB/05W6nJskAVd
	/Ne7a9YksPhQOU+6mwuMcAL5bZJSf/jCLMDvnGL4JkSnRN+whUmeKBUPDiShux2e96ZRS3zd36E
	ZjmFWA9NpoLcsncAVOTAvRBF31uroV5nuSbdMoy9ZVrtl99TCe0L6e9cqv8=
X-Received: by 2002:a05:6122:488b:b0:56d:9e98:4676 with SMTP id
 71dfb90a1353d-5866357db32mr16295687e0c.13.1779975363787; Thu, 28 May 2026
 06:36:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528032234.1322565-2-ewandevelop@gmail.com>
 <20260528034244.DC8041F000E9@smtp.kernel.org> <CAG2uPc4E4mW9Rvxb7PdzRByd9teW0KcJaKHB=ZBHQWLa_6iiJw@mail.gmail.com>
 <ahg53BN4d0czbjDV@google.com>
In-Reply-To: <ahg53BN4d0czbjDV@google.com>
From: Ewan Hai <ewandevelop@gmail.com>
Date: Thu, 28 May 2026 21:35:52 +0800
X-Gm-Features: AVHnY4LJsniyqGtalKkBuOM_W9C5cFOO2ChbZ2YbxUmgshSdSRhpK_snLHS2uBU
Message-ID: <CAG2uPc42aof-csbd7ZEyof79UG0A_8vvTtMhJx0cdmmGq+YDRg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] KVM: x86: Expose Zhaoxin SM2 CPUID feature
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 8:49=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
>
> On Thu, May 28, 2026, Ewan Hai wrote:
> > On Thu, May 28, 2026 at 11:42=E2=80=AFAM <sashiko-bot@kernel.org> wrote=
:
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > > - [Low] The patch modifies `arch/x86/include/asm/cpufeatures.h` witho=
ut syncing the changes to the tooling copy at `tools/arch/x86/include/asm/c=
pufeatures.h`.
> > > --
> > >
> > > commit 17e8fbfd326bc812ee6f132253d520b0c7201874
> > > Author: Ewan Hai <ewandevelop@gmail.com>
> > >
> > > KVM: x86: Expose Zhaoxin SM2 CPUID feature
> > >
> > > This commit advertises the Zhaoxin SM2 algorithm and SM2_EN features =
to KVM
> > > guests via CPUID 0xC0000001 EDX bits 0 and 1. It updates the CPU feat=
ures
> > > header and the KVM CPU caps initialization.
> > >
> > > > diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/=
asm/cpufeatures.h
> > > > index 1d506e5d6f46a..20b33413189c2 100644
> > > > --- a/arch/x86/include/asm/cpufeatures.h
> > > > +++ b/arch/x86/include/asm/cpufeatures.h
> > > > @@ -136,6 +136,8 @@
> > > >  #define X86_FEATURE_HYPERVISOR               ( 4*32+31) /* "hyperv=
isor" Running on a hypervisor */
> > > >
> > > >  /* VIA/Cyrix/Centaur-defined CPU features, CPUID level 0xC0000001,=
 word 5 */
> > > > +#define X86_FEATURE_SM2                      ( 5*32+ 0) /* "sm2" S=
M2 algorithm */
> > > > +#define X86_FEATURE_SM2_EN           ( 5*32+ 1) /* "sm2_en" SM2 en=
abled */
> > >
> > > [Severity: Low]
> > > Since arch/x86/include/asm/cpufeatures.h is modified here, should thi=
s patch
> > > also update the tooling copy at tools/arch/x86/include/asm/cpufeature=
s.h?
> > >
> > > Without syncing the tooling header, tools/perf/check-headers.sh will =
emit a
> > > warning during the perf tools build process indicating that the kerne=
l ABI
> > > header differs from the tooling version.
> >
> > good catch, I'll fold that into v3.
>
> No, ignore Sashiko.  The perf tooling folks keep the tools/ headers synch=
ronized,
> they are very deliberately not used by KVM selftests.
>

Got it!

> P.S. Please don't top-post.
>

Apologies, won't top-post again.

> https://people.kernel.org/tglx/notes-about-netiquette
