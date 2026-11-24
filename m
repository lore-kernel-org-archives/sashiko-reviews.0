Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795541755;
	b=MccWroAW4ZR9yH6QsOfWJuuQaqu2Hi8Wk3/t7fqflcLP+IYTZbU9CMqYv2Oz7nQLmmlZ
	 pPsCqm/aEWIxWQImxawuyjGg2EKe3L1O3iR8vrskS6XQfeN8I7NyztE3UxMuceyKTHCgW
	 kPS4OmWOG/ntaE1tGdFWdgFEcesdaJjMFWnqmy3XZMaCe2n5VcAmw3Co0NIoxeosfqMtR
	 MhNhlRhWZO3JvmL7zjJThrrAlcN6sxQGwSwJz7ICJ+xjz+6zisVP4BhKlGBbEZVbFoldc
	 A9GlycErcDwj3JnqjK57r/yCXC9a0ACHYHdnh/9vS800rvjX3Y25b1//05cb/HPTKjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=/wAkO2VIXgEXGO/81/dkTBjdiCoL5B7xqkyttC27AeQ=;
	b=cdeboSByB0VDkMLbSdX0xkWr7rTrbVjM083UNtO+OCyCO9UOsODfIvjmoNOh/dduHtVR
	 IBO4kS6KKLSWkniYLpOo0iqsDfpDt/cM8QBTcHyUJ3ar2LwB+2lPFCfmf1Aca3TxNqgm2
	 sUkeIhR+0OxawcOniIRhaOP+IVnOLUNmq1+CSXCzrbMaTL49AgaA2+/cGx6MO4eRxmo5g
	 9KdKWhUTGtFriQZ8vdi5i95x3C8BCiiDGiK5sIaVki8swYELxfRmErtzynpu4/KOBtc/Y
	 LXy6M2kq4IHZSyHsQDj/cyGQH/jYCcqieL5wPewpfT3qok/FN6kWd3OEfcPHzvdjdSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NkZPg74i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A52606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 17:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A52606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NkZPg74i
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d28f75d62so802614766b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 09:35:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795541754; cv=none;
        d=google.com; s=arc-20260327;
        b=AWAcHJaS3SBZhij960i0Vb4A6EhharZpyw8VTlUFEGLsrgH93Q5GVR3Mybw/iOUmzD
         /ZOn3YO+b+2qxCQuwtGqSGDWM6NQ+de/YWoCJuSkMO5YiwQmBMt+3Z2D/Pk9s7E3LZrd
         HCkXzrz604kk9131RM4IJB/SJHXUT79vR0aDyrHe6G+mT7nLrjSXbW9DJl8JDyd/IgbW
         GeQ+C7OXDquVjMHTAFvjUCplWxEPQi6CZrvYfyEkwBGN4iPMRmRRPSCmVmsXervzRKC1
         oxkOGA0hLipJGYtcKQhw/FeIGZKVXnuy76+WJSIlfy7pY2dH1vaSNiqjUVLQmCcgIPsR
         RINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/wAkO2VIXgEXGO/81/dkTBjdiCoL5B7xqkyttC27AeQ=;
        fh=yG0GPR0QiT6n4FwClexevtHuIFSRQ+sxjflZXF2i7Wc=;
        b=Z7C9jqbMW+Qcr7mWghKoALDzjgv+GZW5HF4/CUwZjRz8qhYzdzeH3PldtxiXPpR6qP
         7cLXKZvnEyNorQl/UJPCQnlcvtpzghaX7Gq4QvAQtnvcypddBiB0boj1ZZEMvNFtr/Jb
         ojTdHAmrA9nSQs3xaVlb44+M8Jgl+CCLSnFl2V/y6M60I2U2yJPRegJXxdct3XdqTaSK
         KmZSx0cvSP0DbhQ6EbVuRW24yThBynRYOhmdNVzh0NCd3xu8l0mieGu4G65ToKHLY6Fa
         QAAedZfo8PbQMI7NgYFWUz6XhQFDm1C0t8R5Y40gH+guGvz9jPrW7LtYyCPx21mPSGM0
         I3JA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795541754; x=1796146554; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/wAkO2VIXgEXGO/81/dkTBjdiCoL5B7xqkyttC27AeQ=;
        b=NkZPg74iVNOeqCu0avdQAbX+fAzj/CjP1of/h4bR2WjkCUbtPv/sVo8OdlkpddBLeV
         YjaAH9xhBWl3N3Rq2FG9k/V0BUcPmzm5G6BKSJR5L7RXo/84rWaXOhQsxocKj77yRSGp
         0cKbtiGI8wYqQqbd5/T9FqsyHJjiWQYdiqc02L/ZCN4wPDuaDPI7sjqMo6izpZ5c2moq
         S1D3i+V3oLuViiHWpbSF9UrFoxdzFWHKbGUuUF+1xMBBhv/gAs0EP3jJbD+iDCt8E0u/
         yKubjEsoUPWQeUFvIXnxMZS5QIhp1ti9Kw+gyekWJXOV5AR34DrMgXSqhRcQ72onKC15
         hwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541754; x=1796146554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wAkO2VIXgEXGO/81/dkTBjdiCoL5B7xqkyttC27AeQ=;
        b=ci1/MI9g5m3m4xOLrN72D++5MVcStU80knmF9p7qRfaNfb4LC2pv2z1YzRTY4C2RL6
         J2hjAGA54KZpa29vdDbbgsdtQkhpq/r2B9ZzdeolqBWHoX7AZubN80zzSTusO4F3FDl6
         H2k9L8rOH6v4dAUEkcR+FgAsfVvp6tEZUGme3DbE48h9jTxarmFf8+qa5XyDEb/CjuGo
         hiPI4y5zR3baPdH1bTED4Wv9lOz2nfGYaL/O3/RJ2gl6AdPUe4cD/MwJTSWtFcQw/TAN
         dZryhsbf+OyZJAKNW/n/fdkLdVSA4Gc3eRmoibdo1kZ/IgdViB+mTXjrb/2SlDSt88bf
         eSDg==
X-Gm-Message-State: APuU4Z8fskdmHs8YdrtVIunlp/mVJnn9yMUBXDw/LhsKb8cWuV+WMyIw
	SWmRivjJ+nBHo3oJXgcnhA1TTwKuetIcltuKuZQY96R/99T4YvQa0TYZ15C8Crj6gjTGQClWPvu
	ZOua66pXHoQGPNy6xI4KN5BOozem4iJNgswyKqSNaw/KQll3I0rZUCmsazF8=
X-Gm-Gg: AZFdTZdch8MwAbCuGhzMNaon4mkwMYBeTZij90KuvF8UyFEV3HFyJc5WPL7Dk23JDHf
	yzNlaCv573z0d0gnT2rnwRxvSIZ+pGbmEmpQiUrdPudB4cltY0/YnSv9RUSjl7I1aoeVaUrAo/X
	QXYd1lfw9pLEXHcxqpviBD3OXrainhROWg9r9FDUZmmq48ubGd9Vf51kCrOkppoQpC6/Hcvi9F0
	3VrclA48qJQLj8yXjh+VA7wGrNS8H9XH/sMkqLvApchHwOEWEFH7dsv0rvMaoeTbnBKHl1Ly53x
	UpO9ZoKN51827pjw5bD3h6mubJCgMlo4dl8nbCEuQZ9CM/X+9+S3w3qDIRTVOhS1bz5hm5K3Dc6
	Hb0iIgkOTn3doG5kDWIzTOdystHlgI/ysL0dA84RJ2amagssJkh/8KEoAymx5Tg/NOv9V5uUqCB
	JSnDbE2HXNhqmUERXxFkMo0Y7C98vmm5kBeUCVIdrkp7NCfY7x1Ec=
X-Received: by 2002:a17:907:80c:b0:c31:7495:e57 with SMTP id
 a640c23a62f3a-c513acc24abmr1257134866b.44.1795541753145; Tue, 24 Nov 2026
 09:35:53 -0800 (PST)
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
 <20261122184453.2668189-13-jthoughton@google.com> <sashiko-outbox-228641@kernel.org>
In-Reply-To: <sashiko-outbox-228641@kernel.org>
From: James Houghton <jthoughton@google.com>
Date: Tue, 24 Nov 2026 12:35:15 -0500
X-Gm-Features: Aa3M54qM2bzzQR-P_rcwCCOMyq5mZyshNYBv8SLMy30_0cDsEPQ8yIqkgAXCpq8
Message-ID: <CADrL8HVaMx9r0kjm3LngCG61kNmK6OekexiUAvayoqO_fdykhA@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] arm64: Support hugetlb vmemmap optimization
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
> - [High] arm64/mm: arch_support_vmemmap_remap() only checks BBML3 on
>   boot CPU
> --
>
> commit d9205a2d3f06bed3d56fccb15aefe364db523337
> Author: James Houghton <jthoughton@google.com>
>
> arm64: Support hugetlb vmemmap optimization
>
> This commit enables HugeTLB vmemmap optimization (HVO) on arm64 systems
> that support hardware access flag updates and BBML3, disabling early
> section-based vmemmap optimization in vmemmap_populate().
>
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/=
pgtable.h
> > index 7421c0a048ffe..5dadaac54bef5 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -1931,6 +1931,12 @@ static inline void clear_young_dirty_ptes(struct=
 vm_area_struct *vma,
> >
> >  #endif /* CONFIG_ARM64_CONTPTE */
> >
> > +#define arch_support_vmemmap_remap arch_support_vmemmap_remap
> > +static inline bool arch_support_vmemmap_remap(void)
> > +{
> > +     return system_supports_bbm_through_af();
> > +}
> > +
> >  static inline int try_update_vmemmap_pte(unsigned long addr, pte_t *pt=
ep,
> >                                        const pte_t pte)
> >  {
>
> [Severity: High]
> Can arch_support_vmemmap_remap() return true on heterogeneous systems
> where the boot CPU supports BBML3 but secondary CPUs do not?
>
> ARM64_HAS_BBM_THROUGH_AF (added in commit "arm64: Add bbm_through_af
> capability") is registered as ARM64_CPUCAP_SYSTEM_FEATURE, so
> has_bbm_through_af() is evaluated once with SCOPE_SYSTEM during
> setup_system_capabilities():
>
> arch/arm64/kernel/cpufeature.c:has_bbm_through_af() {
>     ...
>         return cpu_supports_bbml3() && has_cpuid_feature(caps, scope);
> }
>
> While has_cpuid_feature() checks the system-wide sanitised
> ID_AA64MMFR1_EL1 value for SCOPE_SYSTEM, cpu_supports_bbml3() only checks
> ID_AA64MMFR2_EL1 and MIDR_EL1 on the local CPU running
> setup_system_capabilities() rather than checking
> cpus_have_cap(ARM64_HAS_BBML3) across all early CPUs. If a secondary CPU
> lacks BBML3, vmemmap_split_pmd() can still perform live in-place PMD
> block-to-table transitions via pmd_populate_kernel() without
> break-before-make, risking TLB conflict aborts on the vmemmap region.
> (Note that commit "arm64: Drop BBML3 requirement for HVO" later in this
> series removes the cpu_supports_bbml3() check, though that part of the
> series is marked DO-NOT-MERGE.)

This is the same issue as in patch 9. Please see my reply[1]. This
will be fixed in v4.

[1] https://lore.kernel.org/linux-mm/CADrL8HUgo0zAHe7_eF1+hfTR6jBbZ=3DUKB1q=
PpMWpksvqbNHsyw@mail.gmail.com/
