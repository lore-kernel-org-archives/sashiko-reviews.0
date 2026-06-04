Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F0B4C954A
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 20:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780606188; cv=none; b=mdedrGzROxlY29amkuZdYMzgeBQl5QGjLuPUgUF4C9kDuHfeZHHk1HDy/DhnqEzhZUqUrbzpS4priiDJmIg3zbAD19WgMZ2pTfwuhREakMu03dmNfpTQ3sBExX9bvCMYjFeCBzkxupH1m3LOmTrvdpauIuG6rU3jDG2g1CVAmY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780606188; c=relaxed/simple;
	bh=uIklUXV51d8RquIWwwE3NON+irFc3H3uTxWkwa+xH/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o2Oh9GNIsTOdqXlCPINAMhA+GL6Jd+HEnCEl8gtnMmQZ2lJci8imTYIHqzbltm75ghBKZo2Dqj8skRzx3Nt2AyfubaENsvceByuQSXRCwJoW34zwbYRtmvXzCjMaJySEDzqD/FYrtOlK/CgPYV6plhRH2GL2s1qyNE00PmJ3GZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQq9wulA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQq9wulA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEBA1F00893
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 20:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780606187;
	bh=IPwWzkIAjXMXQSh2BTTtiq1p1znEItmiodJvDT2k6wI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kQq9wulAR6keoS5H+tis9U4TjfXWLqKpokZEIdgEcfxqpDGaBqndgv29qcdZWyxej
	 qRpWM9SjJIMbV8g+Jd8qEPJ8mt7EeHL47U1EiOwoYgXlfDq/d5VL9qAo8mtdiKNwLd
	 vsfShOe4fWLGALA9YtAyr/nSiZQJ72x9ReLp7tL3SHgM/ChZAq3dpfj6GOs5a6IVIV
	 Q3cXgCodH+s5XGZ97YAG1VVsFYSfkF5XgpxVNaYxSBccO/jS14DlbBjU+5T6zg434H
	 KPMJfJZfwWmrd5yaCh+6QhCZ7XFoeKSJUl43yi8tx3WadMPLnt+fAJBMYw69fn1yYI
	 xfTAq46RbSCxA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-68d232ed3f9so1815057a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 13:49:47 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxl9POmZtwd9XRTDjBpJTtkkBFFU6erxLTe5n3+RgEyi/ybDoYt
	v/BRDVim5KBIX0o57NLnuAVrjtiUb8wlqoBRn590ScYUqoknlLVVmlrOafkS7Q93S0Azc0HEIaB
	mpOOhwb0HCAzcLH2rQ652pF8aOkys3P8=
X-Received: by 2002:a17:907:180d:b0:bee:426:87ec with SMTP id
 a640c23a62f3a-bf373406e26mr13410566b.23.1780606186446; Thu, 04 Jun 2026
 13:49:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604203546.365658-4-yosry@kernel.org> <20260604204415.9FE0F1F00893@smtp.kernel.org>
In-Reply-To: <20260604204415.9FE0F1F00893@smtp.kernel.org>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 4 Jun 2026 13:49:34 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMQYYkjW6oxDOPvH9PO173RPfWSpNWdw4oLz=Z9Zns3ww@mail.gmail.com>
X-Gm-Features: AVHnY4KB1MiIcQ_qS72eTt7fV69hadxr5sHAaBDEYM3FJggAfooou7c2OPcJAd8
Message-ID: <CAO9r8zMQYYkjW6oxDOPvH9PO173RPfWSpNWdw4oLz=Z9Zns3ww@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] KVM: selftests: Use an array for guest_regs (and
 fix offsets)
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 1:44=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The `guest_regs` array is under-allocated by one element, lead=
ing to an out-of-bounds write that clobbers adjacent memory when swapping t=
he `r15` register.
> --
>
> commit 2b93b9d75a4b05f37bd5b56a9795d649f317160b
> Author: Yosry Ahmed <yosry@kernel.org>
>
> KVM: selftests: Use an array for guest_regs (and fix offsets)
>
> This commit replaces the gpr64_regs struct with an array to eliminate
> hardcoded offsets. It also renames the SAVE_GPR_C and LOAD_GPR_C macros
> to a single SVM_SWITCH_GPRS_ASM macro.
>
> > diff --git a/tools/testing/selftests/kvm/include/x86/processor.h b/tool=
s/testing/selftests/kvm/include/x86/processor.h
> > index 513e4a1075fac..ff0b270bfe27f 100644
> > --- a/tools/testing/selftests/kvm/include/x86/processor.h
> > +++ b/tools/testing/selftests/kvm/include/x86/processor.h
>
> [ ... ]
>
> > +#define GUEST_REGS_R13       13
> > +#define GUEST_REGS_R14       14
> > +#define GUEST_REGS_R15       15
> > +#define NR_GUEST_REGS        GUEST_REGS_R15
>
> [Severity: Medium]
> Does this under-allocate the guest_regs array?
>
> GUEST_REGS_R15 evaluates to 15, making NR_GUEST_REGS 15. However, there a=
re
> 16 registers in total when counting from index 0 (RAX) through 15 (R15).
>
> >
> >  struct desc64 {
> > diff --git a/tools/testing/selftests/kvm/lib/x86/svm.c b/tools/testing/=
selftests/kvm/lib/x86/svm.c
> > index f9ea1a2aeb8bc..1bd111e8bed26 100644
> > --- a/tools/testing/selftests/kvm/lib/x86/svm.c
> > +++ b/tools/testing/selftests/kvm/lib/x86/svm.c
> > @@ -13,7 +13,7 @@
> >
> >  #define SEV_DEV_PATH "/dev/sev"
> >
> > -struct gpr64_regs guest_regs;
> > +u64 guest_regs[NR_GUEST_REGS];
> >  u64 rflags;
>
> [Severity: Medium]
> Since NR_GUEST_REGS is 15, does this array allocation leave out space for=
 the
> final register?
>
> [ ... ]
>
> > +#define SVM_SWITCH_GPRS_ASM \
> > +     GUEST_SWITCH_GPR_ASM(rbx, GUEST_REGS_RBX) \
>
> [ ... ]
>
> > +     GUEST_SWITCH_GPR_ASM(r14, GUEST_REGS_R14) \
> > +     GUEST_SWITCH_GPR_ASM(r15, GUEST_REGS_R15)
>
> [Severity: Medium]
> Can this write to index 15 clobber adjacent memory?

It's ironic that the changelog says:
  Also, the last offset in the struct (R15) is 0x78, not 0x80, so
  the code actually saves and restore beyond the end of gpr64_regs.

Yet I reintroduced the same exact bug lol.

Obviously NR_GUEST_REGS should be defined as GUEST_REGS_R15+1.

I also failed to document why an enum cannot be used here, which would
have been ideal to avoid such problems. The preprocessor doesn't seem
to be able to use enum values, passing an enum value to
GUEST_SWITCH_GPR_ASM() causes compilation failures.
