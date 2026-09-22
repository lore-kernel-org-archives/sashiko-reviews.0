Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87CB431A5C
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 17:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790099640; cv=none; b=mWNZqNwmWYj7tG83tSUxp1TaoBYVcPLGB7BvBddPN35TnruXgQV9pkZbYJlH8q0+d1dblOplr4czzfp+CPygQQ6+BRm3CwGYp9IgIviqznPSgZ2v/LJ8uMx7Bs5R3hlLOgux+yCUnZSkyYNIjz9mfDiWmHV63MCVRkY+iJaSzmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790099640; c=relaxed/simple;
	bh=sBNGKVaxgwd2C7MUTMhk8j+hcEEhVpjA4Z4BJR89HfU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RZFjxvs2wdTbwfl9+1UmPsvoQReupopry5xbTSr9o+r0HQ4+/2xQE4HL+5aeO/tNcTJNKlZklBRUNzTV05WtfA/pMG1Pwz9Te+TCmIRptbIjjYp7gYCpu9+AAEXrCIbU9GpQpW7nyivpuNMp7Eq5fRp0mjBC1NDrCegxbYEGMpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H9pA9ddN; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H9pA9ddN"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d55d8cd938so1526505ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 10:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790099638; x=1790704438; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OTbYsyPMAXRNeqI3frHnGnx21T0lm+5EfthrZkUZKL0=;
        b=H9pA9ddNqVXnOgshrzIztyMboF/nSblCtw0jjkgYC37EO8xHCxYZgfNTIICky7pFdH
         PMsPSRJdEClPT69wBrTmYM2GR0wBxo+fBWX4jbmKLEtk/emXOpxJXj3ROuF+Be5CCkBQ
         dnuaOXqWU1qNYTzlMJE9Mni3aLof0azpgoRJT5slb7AIGvvr0GpFB38KLawPFFHE9YK4
         p4EnOfuJGcJBgu0NezuyQHcqxHVi6KINoaUcJKc3VKkEMLrQh5EvfS2LR27/kJ8W8+Np
         utdnQei7u3L33ZTa1X8/qquoaDOmhQ/YNBtc6AM1ZEz1MZxR1uwJTxPCM9132tv6V1Y3
         7WWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790099638; x=1790704438;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTbYsyPMAXRNeqI3frHnGnx21T0lm+5EfthrZkUZKL0=;
        b=qRnSB/UortYDuwGPFMV61kenAI2RxSqBo/9+FXH1JdJHeHK4JmN/a9pCRyKdZAQXEz
         mm6lOGNYq4+Me8PuFbseWQJupci96kicY0NteevA0uCkDAtZaC7Cb3o5r33PwcgvMpAb
         6dgmFhnmseSsGIUbcV21Xx9nIqlFNjKhn9IRNJiTkAAO6g6l0/LvcNnAQ2eQ8emOtpeR
         ItvuNArRyZI1YZ1gtZenxsz0sjiheOpchxahNc69uzNR+62luMS/dso9YJos9upR3C4/
         D28shOfBzi7ILHRYLG1PL7NJVIsocNTQFO1rav7R2F2jqqXDjPvLO9avcGH6rKItRIw7
         vtpQ==
X-Gm-Message-State: AFuF++lUU8WdhRTiL/h5Qk2tDNAIylfUOrn0fM9WIZCGRAwiN8BA51nS
	dpZX0mES/rObtGEjOLo2YtDMlc/wEjP1+a6J+cW8U5d/z6VvtigVDFNGgGiWrJZeKuiADIMe4G2
	sTLk21g==
X-Received: from ploc24.prod.google.com ([2002:a17:902:8498:b0:2dd:2e1c:cb90])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2f8a:b0:2dd:c100:9440
 with SMTP id d9443c01a7336-2df69e1c9bcmr1132185ad.62.1790099637923; Tue, 22
 Sep 2026 10:53:57 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:53:57 -0700
In-Reply-To: <CALMp9eQi0gm7ojijfKDZz9oZh+BK13qUkJOFrCmxjJTr5sx3Lg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260918154530.4129698-1-jmattson@google.com> <20260918160109.E76B81F000FF@smtp.kernel.org>
 <arKJQwAPvApkeESD@google.com> <CALMp9eQboC6DTQfa3N58XCfOLf-qwJ2L7dC5vtqDerHG80eZLg@mail.gmail.com>
 <arKQJJJB8HMK0B1G@google.com> <CALMp9eQi0gm7ojijfKDZz9oZh+BK13qUkJOFrCmxjJTr5sx3Lg@mail.gmail.com>
Message-ID: <arLAtdMP7LV0r-D9@google.com>
Subject: Re: [PATCH] KVM: x86: Disallow EFER.LMSLE when EferLmsleUnsupported
 is set in guest CPUID
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026, Jim Mattson wrote:
> On Tue, Sep 22, 2026 at 7:26=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Tue, Sep 22, 2026, Jim Mattson wrote:
> > > On Tue, Sep 22, 2026 at 6:57=E2=80=AFAM Sean Christopherson <seanjc@g=
oogle.com> wrote:
> > > > Gah, I hate the negative "feature" bits, I've gotten completely tur=
ned around
> > > > multiple times trying to sort through this.
> > >
> > > Me too!
> > >
> > > > IIUC, you're trying to "fix" setups where host CPUID.EFER_LMSLE_MBZ=
=3D0, but userspace
> > > > configured guest CPUID.EFER_LMSLE_MBZ=3D1?  If so, then Sashiko is =
right, it needs to
> > > > be declared with EMULATED_F().  I would even argue that technically=
 this isn't a KVM
> > > > bug, because KVM won't advertise EFER_LMSLE_MBZ in KVM_GET_SUPPORTE=
D_CPUID on such
> > > > hosts.
>
> > > I'm trying to make it possible to run a Rome vCPU on Milan or later.
> > >
> > > SInce this is a negative feature bit, it must be retained if the host
> > > reports it. That blocks running a Rome vCPU on Milan or later.
> > > However, a defeatured Rome (which reports LMSLE_MBZ as 1) can be run
> >
> > So, a partially defeatured Rome?  Because it sounds like the CPU report=
s LMSLE_MBZ=3D1,
> > but then still allows setting EFER.LMSLE=3D1?
>=20
> No; it should not allow setting EFER.LMSLE=3D1. That will fail on later
> platforms and would block live migration from Rome to later platforms.

Oh, drat, I misread the "Rome vCPU" vs. "defeatured Rome" paragraph.  You w=
ant to
be able to migrate a vCPU with guest.CPUID.LMSLE_MBZ=3D1 between a non-defe=
atured,
vanilla Rome and Milan+ (or a defeatured Rome).  Correct?

If so, then Sashiko is right, the flag needs to be EMULATED_F() so that KVM=
 will
advertise EFER_LMSLE_MBZ to userspace on the vanilla Rome host, and also do=
 the
right thing when guest.CPUID.EFER_LMSLE_MBZ=3D0.

If not correct, then I'm even more confused, because ignoring clear_cpuid,
guest_cpu_cap_has() will only ever return true if boot_cpu_has() also retur=
ns
true, in which case KVM *will* reject the value because EFER_LMSLE will not=
 be
listed as a supported EFER bit.

		if (!boot_cpu_has(X86_FEATURE_EFER_LMSLE_MBZ))
			kvm_caps.supported_efer_bits |=3D EFER_LMSLE;

> I want KVM to abide by the guest CPUID bit and disallow setting
> EFER.LMSLE even on hardware that allows it.

Right, and that requires declaring EFER_LMSLE_MBZ with EMULATED_F().
