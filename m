Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AAF3FFFAB
	for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 09:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785404220; cv=pass; b=fWdYfSipApShZCP56p1W5GmgAAbMSlhJOp7QS3quGHKQ+KoPBGpddIHABhVwul+NgGnQeW5unencWWy7+W4DzPBQvSAo8+nteDCK15VAtJ+nYBCIZnzmp+OoN/lHE/JIlEJGAAEvNFWx2eXRg1xNkS6+mem6ThayAsY4Yxs/Mu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785404220; c=relaxed/simple;
	bh=ILzfmwUXg3GMOH2fNnwuPr2GE5O+eslWBv/w4b4Puz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FKxYfqoB34OwpBSYQ3OBsUDG4dE9iSRyQYE3hpK+5hRYnCWjcJGcypex81hA25qPmv+4bJWSBOS3MOSwA17bqhYquqiKlcd5rL/B71XQYU9XTo32SVvJCRD+frpmhbo95jGNUW+sadCzdLJScKNFT5cEbv4PbA6R0uJyzRINAyc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rkmSNpOM; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rkmSNpOM"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a051b73866so2666014a12.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 30 Jul 2026 02:36:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785404217; cv=none;
        d=google.com; s=arc-20260327;
        b=c5rISoYAYMmAD6DQ/jcmMZeJpl9Yoi710Ee++1tQJQJq7lYC5sTKviLAZKBiSUV1cr
         hPyVg6QankOUQWa6/ZsbCvHtIdJ09gCbEvBtBp2y4ctFPbl87ia7ZgdSgQWNDf1X0RfW
         qlNlUzYXkNhlFn1LYqsB4lVj30pWbibW4YUtkOHrKlGnkxvF3bgbZlOkdJcW4vh/A5ca
         0A4LaDr+q/0qFmU7yh6Xb3u3SLGqnDPIysrjGJzzg1rk9zw7T2IfUy9AL1KQqIdGYQV+
         8j6Yt4hJoShasxda94DyRHZprj6W7qvua/MvPsmSLhvhqdxp4S7iTV8dQu6vJ5KCCjGZ
         iUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ozUuSmNdhlKHiyOphMBueEUOvz/5sgYbLE8fquvwg+4=;
        fh=fItrUtV5UsY1KSNx1ZNnzv3miYMbODbRRQWQ18AP5Zc=;
        b=iHZjZWRSuy95spNf5++KOl/W+041l1p3r8sRDFXc25suxZjzSgPQE4gGCCsHBbw4WE
         6OX+boXiEQzmIGzTOCgZqqHbgGxuBsgvBMhMH01KVa5z2Cnohr1KVNKSFSJmkyJCBhIw
         1vAnNP2oYjDxg8hTbU8NLexZHDQ0YHHjop7h7+IpVKeHq3zGJo1KyHmQpr4rdKPJd2fx
         wkInP2TMWqOw9XsOgkii2UID8YkXrr5YAiXFMB/zBZ4q49uBKhGynm7W9N96NurFUWdE
         qvrhbQIzqw+/mXga1NKyBkVOphjmWipW6UjwqGf7fLLpcCx4n8jiHmqIZwvJNXz9KEYO
         eTRg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785404217; x=1786009017; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ozUuSmNdhlKHiyOphMBueEUOvz/5sgYbLE8fquvwg+4=;
        b=rkmSNpOMQqBOQceedCTXnesbjLzI61pFyYLx4sXAwvGliLKgISfLTUHVaxO6Vs0BJX
         6/KrKvFvolKHbgbna6NqGQZfJJJAZMQvHN1FLSjGLJsFCggMBKVvCk8Jq58oYte1M3bt
         HP/3ouUJrQbZgw1fe+UC+P2K7JiU0UU8z9EtlfmPxFTM6HfB6js1wjIonb4RA/gT43v4
         YVTj7V0wd0BnGO+lRp+qLhqbBVFDHeiqg98g6k+IBpLMFfL4qOsa/3ym9GldNHLXEWzl
         JtvrZSlYvSQVOiES5ZA0xyi+U6fQTT7fveRznpDyImwJlw5N2h71RNtU8EJLCZof4KPs
         fY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785404217; x=1786009017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozUuSmNdhlKHiyOphMBueEUOvz/5sgYbLE8fquvwg+4=;
        b=hF5zOvNzYXSa0RqUSosuH4+zjNFV3wwI8PVscAAJxxERr0DLV2ACN+dpP4/f+968q8
         ztSFf4SVfkXI7Gk4DKLYFjl1nd9VnjywV7VLXbotlysxGGXySrzl8pBgsG8EiynYVyp2
         gLWz31O6fRIKvTjjKGNKvR3GZEAvaYGlGUt+LPPf0tMgukf8NL7j3rcDiOjHUe/ef+v9
         U9RHFe5MyCPpp5CTbHYub5SK11Y8cxPmKvGz0AQ5SZD5lnfEQiLIdiNjmcgzAWtHl2Cm
         Mq2y46ViX258x45o47Uic71X+GE2UTRWbo6D7u4d8u3uRH0LOwzFd2Zrf++TVmwLydE3
         q+3w==
X-Gm-Message-State: AOJu0YxpfZIHp7XC4wtUMO96cVxR7lZDRKjEXghHtJxLlYhJKwpVb8gY
	AO0F1srKzClt83BlJBro1F1lMhLaQX8kW6Cr/i+82RIafxY6uG4qvtql1O85Gmn6dKILHI69kuw
	O4n0KgMtwU1kzggTlsAOeLHdzMHos1TAVJ+vUE9g=
X-Gm-Gg: AR+sD12FlOx2JoIEAshW9WE0hzkEE4pPt8VGMQK2VZfMLRD/1U5t4uj9Fp4IumhVu+i
	NdakNSPxcM+pFvnAuHYYxZc3sn2aKa7Hdry0ylqObL8FSRHhD/IO07V72EeKka3pk1zDetNom6j
	KLmnasbVM4fQdhcEJBc5OVdxyX7pzzP0ekfHsqXVnRehrsKFWYKAILsOq7g/WdxKmZhkTmkQVJe
	4tah6dyXH3fezch5Jmh1Rdv387i+LEGfEr2y1wxGpyT3TWJxoLE6cK+zaeHqL0b+aQ8LaJdf+Zv
	4gTxdvPYINwY/9Q8Ardn6jYrJfwOiiXtp36tldLYn5I=
X-Received: by 2002:a05:6402:2b8c:b0:69e:a9ca:58fa with SMTP id
 4fb4d7f45d1cf-6a07b89314bmr800887a12.40.1785404217141; Thu, 30 Jul 2026
 02:36:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718153620.829378-1-2045gemini@gmail.com> <20260718154914.891C81F000E9@smtp.kernel.org>
In-Reply-To: <20260718154914.891C81F000E9@smtp.kernel.org>
From: Guidong Han <2045gemini@gmail.com>
Date: Thu, 30 Jul 2026 17:36:22 +0800
X-Gm-Features: AUfX_mww5oBvzltvKFLOTW_sUsjC1AZV-2L7Cj7yijTdZWDWVjDQXhzvW5gwQWE
Message-ID: <CAOPYjvb63kHmba4JFgsNjMcjbei-wEBu7oRCiZZQC6-XApsvEw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix PMU event info array size overflow
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 11:49=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Guest-controlled large allocation lacks __GFP_NOWARN and __GFP_A=
CCOUNT, allowing host log spam and memcg limit bypass.

You're right, this was helpful. Fixed in v2. Thanks!

> --
>
> --- Patch [1]: [PATCH] RISC-V: KVM: Fix PMU event info array size overflo=
w ---
> commit f0a5b0643b60a1981804276ca1f91780cd681469
> Author: Guidong Han <2045gemini@gmail.com>
>
> RISC-V: KVM: Fix PMU event info array size overflow
>
> The patch prevents an integer overflow when calculating shmem_size from
> guest-controlled num_events in the SBI PMU EVENT_GET_INFO handler. It
> introduces check_mul_overflow and rejects sizes beyond KMALLOC_MAX_SIZE.
>
> > diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> > index bb46dcbfb24da..8b489fc3051f4 100644
> > --- a/arch/riscv/kvm/vcpu_pmu.c
> > +++ b/arch/riscv/kvm/vcpu_pmu.c
>
> [ ... ]
>
> > @@ -479,16 +481,21 @@ int kvm_riscv_vcpu_pmu_event_info(struct kvm_vcpu=
 *vcpu, unsigned long saddr_low
> >                                 unsigned long flags, struct kvm_vcpu_sb=
i_return *retdata)
> >  {
> >       struct riscv_pmu_event_info *einfo =3D NULL;
> > -     int shmem_size =3D num_events * sizeof(*einfo);
> > +     size_t shmem_size;
> >       gpa_t shmem;
> >       u32 eidx, etype;
> >       u64 econfig;
> >       int ret;
> >
> > -     if (flags !=3D 0 || (saddr_low & (SZ_16 - 1) || num_events =3D=3D=
 0)) {
> > +     if (flags !=3D 0 || (saddr_low & (SZ_16 - 1)) || num_events =3D=
=3D 0 ||
> > +         check_mul_overflow(num_events, sizeof(*einfo), &shmem_size)) =
{
> >               ret =3D SBI_ERR_INVALID_PARAM;
> >               goto out;
> >       }
> > +     if (shmem_size > KMALLOC_MAX_SIZE) {
> > +             ret =3D SBI_ERR_FAILURE;
> > +             goto out;
> > +     }
>
> [Severity: High]
> This is a pre-existing issue, but is it safe to allow a guest-controlled
> allocation up to KMALLOC_MAX_SIZE using kzalloc() without __GFP_ACCOUNT
> and __GFP_NOWARN?
>
> Later in kvm_riscv_vcpu_pmu_event_info(), the code does:
>
>         einfo =3D kzalloc(shmem_size, GFP_KERNEL);
>
> Since the allocation uses GFP_KERNEL without __GFP_ACCOUNT, this memory i=
s
> not charged to the guest's memory cgroup. Could an untrusted guest coordi=
nate
> concurrent SBI_EXT_PMU_EVENT_GET_INFO hypercalls across multiple vCPUs to
> temporarily hoard host memory, potentially causing a host OOM?
>
> Additionally, without __GFP_NOWARN, won't allocation failures for these
> high-order pages on a fragmented system generate rate-limited page
> allocation failure stack traces, causing host log spam?
>
> Since these allocations can be large and are guest-driven, would it be be=
tter
> to use kvcalloc() with GFP_KERNEL_ACCOUNT | __GFP_NOWARN so it falls back=
 to
> vmalloc() if physical memory is fragmented?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718153620.82=
9378-1-2045gemini@gmail.com?part=3D1
