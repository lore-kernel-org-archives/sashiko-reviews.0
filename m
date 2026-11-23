Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795461790;
	b=KjZKXF96HgXatqwZCVLlQFyDRI7qh3X+B5sq0YXHzE6+SFxoYZf9EydDh3UlDf3VImbw
	 8LT1i9j7BzKInb7w9M2BUaenPNegScHNEPTRMHnFUmvsQmK2oF4EIM16CNFkHcjwYnF7j
	 YlxZXUUN67bhaMeVKGT4Pw11MzLwELS+vmO5ABSE76HH3tScx9pSg2g/O/SxwVkcRT5Sm
	 2t0R23UGXtYDIcw6/k0Y1HUTYJo6Uo0i6BAbVzX6KL4rEkzUrWs6+QS85CnyJ5bH89h2u
	 3CDj231+qKDWMyGG+igQ3WJqweYhJ7bK3Pv1zYHK5k3EbPrhVRDP2cFnqcJmUzuFURQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795461790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=7Jpgt2iZSg+qW1jdf4hbWvk6weM53GPvK5N4UzQlask=;
	b=cxXqqlHkHMaWdOAA/qZk7Pf0A9bEQLvHRD78c0TGmhh+gPN0KGcrVWEohyVihzv04FCL
	 7sNohBjUXXf3DizQLC+1MYL1u09AyYz0p79AjzWb8xnb/ZTf6NuC8SS/U6mSSoXTf4zO2
	 Cd5W97SdtVXtHKkrjfMs2VWm5kq9TRx+71Sb9C51GDvbVQYkzs3yaMm2Pv7j96pG5pfVB
	 DpRQQvYVzkxROo8s7raLTJ9JS8jUfF64X3AtyIgareYPYu7A7u+RnoHwFVXxBuVQPBUgC
	 JUwwSfq121TC8SjHHwjVFzynIsUyE6O+Tpimcpuxg//JPDoQuE8t4kQ6wb2hqwWvCoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O9Q5UBpV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6039606A338
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 19:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6039606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=O9Q5UBpV
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so607516066b.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 11:23:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795461788; cv=none;
        d=google.com; s=arc-20260327;
        b=hZGCxTELxOQGM08zfDlPlpzu4C7mQO+nAHRnGRPf631H6lF0N8WVrbC0WhcVX9bB+4
         1ZEHne2tWrIISne9emrYgNyavV8BQIfoGuLvYOe2Wyzm/koOkdRn2BcD4QBEZ6F5I9as
         62xQtZsF+l/fy6dEaRPhHJ5/F4MuO9HYP15mPq/bqG+cvHJhKMUXnXkpyg6yKjwyLVMV
         j5MF1BLDAOLWApQqBVMRpMpfs5s3QKWgrm0+/UbaduThVhY116iFi9+auAUCwZ7tSsMR
         vzy5zVjUDSaqEYI3zIxzIkWWkre5xVd/6uMForVzAIEy4t9kvX5hDHrSVCFkdqjlxJla
         pLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Jpgt2iZSg+qW1jdf4hbWvk6weM53GPvK5N4UzQlask=;
        fh=yG0GPR0QiT6n4FwClexevtHuIFSRQ+sxjflZXF2i7Wc=;
        b=HWHVOz7yoewzKrphrEJpQb8E+jA6YNtCGZHtu/qIGu3DaA2SmIC2TnxEaXQFbxNqCc
         jqB2c+wEnu/h06zhGbOhlOZnfE7JyKpI0QcviNwgfsaNmoegPqiW9+HjJlyI8yW70/JC
         OpGG3Nu+g/1Su8GYnH7rf5aE0RfM55Iwa0GNRJQIVbw5lgPaWg6gwxf78U1oOjOrn1uH
         nEnOhLAom3AXvUC3CwUEeJyDL6PO75mk13iAXEHLZUXcO2vZJySxoEsvVSnHG+W8Hg60
         g6unv/LpnkIbBzPnZ9yA/KMcITsbDSOv7O4TWZy4wgzIKfWYD1E97oD7UdYw4ODGC0i+
         TrSQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795461788; x=1796066588; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Jpgt2iZSg+qW1jdf4hbWvk6weM53GPvK5N4UzQlask=;
        b=O9Q5UBpVDYkGC1WOnGJFUG7FQmiWrwauUf33yXXz3fx7WKIgPs2zgLARsDYJBLB7Qa
         InJIrU6FAqMyCefIAbsW4Qir9ucU01ZTyombRGfx8P4NRSozpGVE+2MnRmzkx08zLILd
         x+zvFe0Z8VgSiK5XXfcRivIem0HLmGNJI33UsS04VoJRpNJ4gDPojt7mPxAylv+KVdj7
         1g2Fpb9eMOarQUa6zaIndcl5LGPLBUxbTDcdnB6PsiPwO6FlECgsVCGaOgARS8IdMAqU
         jSau273vONWupPz3U6LWW6sD45HWBSNxy1L0+ju5uEilWJpwQeYd9z1yjcNz4TTCt1mD
         wfDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795461788; x=1796066588;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Jpgt2iZSg+qW1jdf4hbWvk6weM53GPvK5N4UzQlask=;
        b=SoQGMwdurkXd+rgwQhLCT0P8e1ODUgQ0Dx3j3HIRsTZkERV8eMzSL7s6xJCVKp/rgT
         VJ5MbGxb5PfmuB0tH1ehyW+e0Z0t2D3Ly6n7RNdFzU2+pKRtYIaf5Mum5cxaHPvThMBP
         eYQJT/khFPAvQ4Y3XPQwE+nLOUq9FwydwAE3NjMQO8KagC+7V38vT/G8kJbgKSMrqglc
         4DmoI7QItJQ0mQgso4wlNaDmjpKl4qhE0zjP3x+qsFa6mMoqqRDa9k+D80YKUd6Au8LM
         mMrK7AnbOWByaiqhULhlBl20GUJH0kOBvSaJolLJgiAELywI7XvVARw5ZNRetTvZOijX
         3Qrw==
X-Gm-Message-State: APuU4Z8WLW7lxnXIV3jZSBNGhk9zX//6vTfh2nFISRMrFVP+m2TI6wg/
	QhKuQlolBb+bCavM/5nSzwhfJrDk+WccrD12JsnUVeB8CgpGvTnm/RcPGOZjP0p+ZzIGvwPkN+l
	myZv8hYdQDYvuWgItH0+T1UDlRA6mzpE0uiN1UyjPMKt2JoS+HFVqUKZS/04=
X-Gm-Gg: AZFdTZd3XWW4v0YSZ6TIO3co8ksqs0n80NDYJXJXjpHfZgpLNTbv/thlPpTh7uCX/xq
	2EySSWY0jzQ1MaCYKzYAjv05jd64Qjg1btFVCdVhl6Vff6Eof/wfiyPqL+9YT3QZFVRbzx7jkTW
	SwbnAYNTN2WG85xqeJpSi2TgiLXjoUgT1cMXyrLrQs/QMRjEbEXtUVfhxO4qbr6YIZfnmWXwwH4
	rD7ZBaavAHibTlRkbcr0b2yX5IC0qTZl/LNfMsxlvh4hpa8IQYLHk8t9OonmYPJqUxZRGyJqWme
	Aik3cDy3x8tg17toFGdnUgYoT1MORfkO10zXE3mneNP72svanMIwzga+koWdHVA+YvmXkGIU5Ma
	pHtHfxVUJ6BS9Th+59i/J/iCxLDtFgfVICRPUx1+eZceUNh+sYoHIOUZNq2BRqiE9oWGsPNNqHj
	yneTokWaPdzNYZWVJEuw6ECVlSHEXC6un3rM0p6B9nKZzHPDeqnz4=
X-Received: by 2002:a17:906:9555:b0:c50:52b5:e17 with SMTP id
 a640c23a62f3a-c513a5e1d53mr861981366b.13.1795461787407; Mon, 23 Nov 2026
 11:23:07 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-10-jthoughton@google.com> <sashiko-outbox-228638@kernel.org>
In-Reply-To: <sashiko-outbox-228638@kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Mon, 23 Nov 2026 14:22:29 -0500
X-Gm-Features: Aa3M54osq-kJxtT4Y9atQQYQnCb_YAmdhHC0kxgMwEHE4_dxYTiiSl6LpxhomO4
Message-ID: <CADrL8HUgo0zAHe7_eF1+hfTR6jBbZ=UKB1qPpMWpksvqbNHsyw@mail.gmail.com>
Subject: Re: [PATCH v3 09/19] arm64: Add bbm_through_af capability
To: sashiko-reviews@lists.linux.dev
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Kefeng Wang <wangkefeng.wang@huawei.com>, 
	Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 11:08=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: cpufeature: has_bbm_through_af() checks BBML3 only on
>   local CPU
> --
>
> commit 65766d54bb753e1e16346fb12f4bb107c66114eb
> Author: James Houghton <jthoughton@google.com>
>
> arm64: Add bbm_through_af capability
>
> This commit adds the ARM64_HAS_BBM_THROUGH_AF system capability to detect
> when all CPUs support BBM Level 3 and hardware Access Flag updates for
> HugeTLB vmemmap optimization (HVO).
>
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeat=
ure.c
> > index c9c9a6889455c..d241638b51435 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> [ ... ]
> > @@ -2044,6 +2045,31 @@ static bool has_bbml3(const struct arm64_cpu_cap=
abilities *caps, int scope)
> >       return cpu_supports_bbml3();
> >  }
> >
> > +static bool has_bbm_through_af(const struct arm64_cpu_capabilities *ca=
ps, int scope)
> > +{
> > +     /* The kernel only enables HW AF updates with CONFIG_ARM64_HW_AFD=
BM. */
> > +     if (!IS_ENABLED(CONFIG_ARM64_HW_AFDBM))
> > +             return false;
> > +
> > +     /*
> > +      * BBM-through-AF is only needed for HVO. If HVO is not in use, d=
on't
> > +      * penalize systems with mismatched support.
> > +      */
> > +     if (!hugetlb_vmemmap_optimize_enabled()) {
> > +             /* Only valid if HVO cannot be enabled later via the sysc=
tl. */
> > +             BUILD_BUG_ON(!IS_ENABLED(CONFIG_ARCH_HUGETLB_VMEMMAP_OPTI=
MIZATION_SYSCTL_RO));
> > +             return false;
> > +     }
> > +
> > +     /*
> > +      * We need BBML3 to support Block -> Table transitions without ta=
king
> > +      * faults, and we need HW AF support to support changing the OA w=
ithout
> > +      * taking faults. has_cpuid_feature() checks HAFDBS >=3D AF, read=
ing the
> > +      * local CPU's register when verifying a late CPU.
> > +      */
> > +     return cpu_supports_bbml3() && has_cpuid_feature(caps, scope);
> > +}
>
> [Severity: High]
> As reported by Catalin Marinas on v1 [1], can has_bbm_through_af() falsel=
y
> enable ARM64_HAS_BBM_THROUGH_AF on systems with mismatched BBML3 support?
>
> ARM64_HAS_BBM_THROUGH_AF uses ARM64_CPUCAP_SYSTEM_FEATURE, so
> setup_system_capabilities() evaluates has_bbm_through_af() only once unde=
r
> SCOPE_SYSTEM on whichever CPU happens to run smp_cpus_done().  Unlike
> has_cpuid_feature(caps, scope), cpu_supports_bbml3() ignores scope and
> reads the current CPU's local ID_AA64MMFR2_EL1 and MIDR_EL1 registers.
>
> On a heterogeneous system where all early CPUs support hardware AF update=
s
> but only some CPUs support BBML3, running setup_system_capabilities() on =
a
> BBML3-capable CPU enables ARM64_HAS_BBM_THROUGH_AF system-wide.  HVO will
> then perform live block-to-table vmemmap PMD transitions while non-BBML3
> CPUs are online, and re-onlining a non-BBML3 CPU via hotplug will fail
> verify_local_cpu_caps() and call cpu_die_early().
>
> The later DO-NOT-MERGE commit "arm64: Drop BBML3 requirement for HVO" in
> this series drops the cpu_supports_bbml3() call, but if the BBML3 check i=
s
> kept, should ARM64_HAS_BBM_THROUGH_AF use
> ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE (or check cpus_have_cap(ARM64_HAS_BB=
ML3)
> when scope =3D=3D SCOPE_SYSTEM)?
>
> [1] https://lore.kernel.org/r/aoRnMRZ0jE0ycwcT@arm.com

Argh, yes Sashiko and Catalin are right: how I am detecting support
for BBML3 here is wrong. IIUC, cpus_have_cap() (Catalin's suggestion)
is right, but I think I prefer Sashiko's suggestion to use
ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE instead.

Leaving the new cap as a SYSTEM_FEATURE and using
cpus_have_cap(ARM64_HAS_BBML3), late CPUs without BBML3 are rejected
because the BBML3 cap will reject them (if BBML3 is enabled on the
system). I think it's better for bbm_through_af not to rely on that
and instead *itself* reject late CPUs that do not support BBML3. A
minor thing.

Sorry for missing this feedback, Catalin. I'll respin a v4 soon-ish
(next week?).

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122184453.26=
68189-1-jthoughton@google.com?part=3D9
