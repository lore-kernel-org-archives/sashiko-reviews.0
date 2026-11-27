Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795779466;
	b=DjrZGCvaniMuNn86D8HnW4Ic0gxUPdLXrbbhxc94F0jKimD2E5XQyb65o9E8W8jBV1ks
	 LNIGxPY6T8bMLmw0gBfBLMI1QXKKgt3TE6sy4dLqGtsvD0sEe6va/EuSUJ9dwJ/sOsRCP
	 j9fm2ehcY6DwqT5Zv5EtsXtSfvw7ta8DiWIPdpHebUAfVDzTmsE9RI69TJ5fluAt3tWxe
	 OV6eF7e7yfhOkm5R2UWqAmMfInZviyKC5JmC4VUWjygP4lUvTTYjUua0y+kqhHXLcPy3v
	 zUQpv0Lmw9ZoqnQfCfVBSuwejSltyqyZCqZPy6J3b/urjCRXPGnBQHiwOHbkuHXx4Cg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=BOOvIArGpv/xQKQD0TfZwhU1E1OVLGOADwgBsYj6a+w=;
	b=FDQSM6L9wqb4l/owHLfzOHTNhJOvKZwRD5tSljsOycX8NMniMh76Pr7oAVk9Mr31SU0o
	 dWRRRP2/Am0EKPsEFWxb+UUWS+C3GHVai+oP9ukxg+EeCrs3LbkWjh5d1ULgKSFv2tANd
	 Hw2iozkFhAMHqGiIFhigLO8PiXqm/fPDPdqfubn5d3TVxv3JPEGRT+8Y23HD0HSdOA+6o
	 x/RcF5Q+JCBB0MBMbF3pZHKQa2oE9Koa8RwTa8Ed2sizHbWjtd1TdHkP9YkuHHOBNVrTC
	 PW8jH+saaU26Bhff3/E46zXYrFmyOfcRBobhyTJb4/0aTvVWq/KpAf4+blfybh1Kq5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axP1M21H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CDB606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 11:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26CDB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=axP1M21H
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so9584147a12.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 03:37:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795779464; cv=none;
        d=google.com; s=arc-20260327;
        b=M7Qbvgpt/Q3CQ/hUTGke6zEIuQtg+vhcIX3/8w+aiI1GEMXdiEZ7y1Kv335rwf9vwg
         D/SFI0661g53Wi4Yo33jCufOW0CZgCjIm5qre6YORM23I0q4peAq+gBPx4QiEwwwmM9K
         PipF2he2GTgRVQMg9ysHSMZIMznde/021iifiABVvSBuZyRnjoPzTPZgVkFcc8pTu5HE
         CYgj6WF5PZyBNRWwrgrMNVupZX7lVB/pdHyM+KnkLiJhsLJylzDVG3wKy9lGdnclWYK0
         CMoIxWgVjJu62zF50GdClhk7YSH7UfgL1l2tqHKBT76419o5m3+J54baKsbdxMX2bGFe
         EI3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BOOvIArGpv/xQKQD0TfZwhU1E1OVLGOADwgBsYj6a+w=;
        fh=IwwuMS5aMV1iKZQqRdGP1P6yxpgJs/0OmlDFVoXHpdE=;
        b=JOATgsgojPFThkkHVRNK+uJulK9Dew2AmfowKrJoxFBtpyDqLcFbq0UkC2Tw9xWF3d
         SzN+pdsyssIK3BJvjPi0nm+qARHvA5Rc9JzGyhADCbWkQDgcDMcak7WTof4rwFWA32oS
         ciVt4IKGy5ax/YilT/Fsfj4X1keIFRDecYh5+6EG7w5pq8lxpcJfJYGNISeRTTiv1KaZ
         RhGb2vAZLuENAFxlTVnwlQZVn6tlKKG1lsqbcyZOxUs4+j2Po22sx3OskmqptRhkWya0
         NcqUJFwxXAjSFQryVjYHCOjm+h/VIs27jyWsWtOhs37ej4S1Y93FUmcbW5Wkn4jiwJH9
         crvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795779464; x=1796384264; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BOOvIArGpv/xQKQD0TfZwhU1E1OVLGOADwgBsYj6a+w=;
        b=axP1M21Hhl1VNL6AkrDF/cSfqpyg5BG3iGlpzRgQxNKPyem7Yy/eWRct2agWj3ItzW
         W8oofYIMQ0CE6NM5mgfgnAfC8H6gIAe78vTYdf3L0CqavtEUX95cevAwv7Ndbb69s+6g
         SVCqKKOFfrd63O1MJE+1RCvaIpmhziZ4raCknxmHQPTPNySggziwxvQE0v81RD/b1J18
         5zr/vcvPhDN301PjyTNZBGXWYiMEgPV3ul8sQWpsWK6kHSfnZDHWaaa7y6+rGIPar1th
         wbNrsNGm1ARgr4DY4IMEnfp6goid325UYlrVF9WqB+I9+hf4OiuRzYwe7tAc0SEiJA/x
         OWMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779464; x=1796384264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BOOvIArGpv/xQKQD0TfZwhU1E1OVLGOADwgBsYj6a+w=;
        b=Iy8/Lrs4a9YqFwkk1QOt2ARYJE6yz76D/Fd7I7UqtzFSmKCxRqtaDRYbsyvy3Hzetl
         VudQu6yoJU01NIAHZRFRI36MPQzTDl7TtX6E1f62F8LM+EKzj8+jbmmfP2ZuwYeoQPzr
         JbIb4UetUVMGO0opnIWNYeNL1YUz/X5VDtXgvhd6JdYYI9W4CdiO3r2zXZ+6F9DerPUb
         SaTKLppQETD7bSvx5TUhua3ishUzLPr4NDcGlHW1XdWyxYkR5OG9/Ps+frCYzEKiKZJS
         D6WZq0ipKyOIyv0Td7ZhdS747z9nhbjNSgoZSXBWlgrK8I1k7dK/DWEPSmvo3hI0GWhm
         upJA==
X-Gm-Message-State: APuU4Z8aCbUgsGUVlHeiORz3pet/7A+QFwvc7nGccg0m3uVAmzaG+/X8
	4Y+0PcKt90aR9THcDHLDzeVHD04fhxmWsCuocJjLiR/Wt2b05FHBkk90XTBHOdiD79+A9/zfNPp
	EAszVJl+278SzPjBrcHHGz5zAyTorOWJ5+2ck
X-Gm-Gg: AZFdTZf8RCR/VdQzeo5VWbNjYTYyhLllvO8Jdjd84sTnjWvs1XIhxKnjidMSyFU8zSQ
	yicYIAdr9tf8gz1x65ZnI29LbkR/cS36ZbXPH78IitrajZzuZDe7afx+uNTtCPs6K1Pu5vgkn4v
	sd4JAXzG/bzi+mo2FR3TH2PsgbQChTVnFxaR6vDcamXLfuAwlpM33yXlTjzTbdsDdDCRqEVEx6r
	GTgwlWnHfOh8kcEVzZ2XRk5Sjoez6gduKW7eeMN2vjIKGlAj6tiTN+Hc1/Q78iV17WVhwlk2A6b
	+xCLU7hkmxDzVut2Gp1azqAGwl76o7satUYOrysvy0ZEBxRJFdtKD9IDQdIfPsUaoYlXmArGway
	glroV8JeRGvkD7UM6fH3z0HaRL9BvVUywK01HR0Wj/3M69/VPR3wMV5dNXFA+NKpNBf/dOw==
X-Received: by 2002:a05:6402:1f07:b0:6b6:e808:9711 with SMTP id
 4fb4d7f45d1cf-6ba37eae2f5mr16871407a12.29.1795779464348; Fri, 27 Nov 2026
 03:37:44 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261126093106.1345825-1-linmag7@gmail.com> <20261126093106.1345825-3-linmag7@gmail.com>
 <sashiko-outbox-235154@kernel.org>
In-Reply-To: <sashiko-outbox-235154@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 27 Nov 2026 12:37:32 +0100
X-Gm-Features: Aa3M54qFm0mLIHxqNl3bhCQ5Cp_bYsIXCWqA1F-Us97uON6bz3IR5vS7Z2fpzhs
Message-ID: <CA+=Fv5QXKSDLv_T1av-p5Vkd=xx_a5bRf+1VR1sOh+QejOe3ag@mail.gmail.com>
Subject: Re: [PATCH 02/18] sparc32,leon: retain SMP TLB shootdowns
To: sashiko-reviews@lists.linux.dev
Cc: sparclinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi again,

On Thu, Nov 26, 2026 at 10:41=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] sparc32: missing preemption disable in smp_flush_tlb_mm() [1]
> --
>
> commit 20d5675eb7a3d5e5a3910745d8ae9ac1da8711f2
> Author: Magnus Lindholm <linmag7@gmail.com>
>
> sparc32,leon: retain SMP TLB shootdowns
>
> This commit retains the SMP TLB flush wrappers on LEON instead of replaci=
ng
> them with local operations, and updates leon_switch_mm() to invoke
> leon_flush_tlb_all() directly for local context switches.
>

This makes sense, I'll dig deeper into this and maybe this could go in as a
separate patch in this series when preparing a v2.

Magnus

> > diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
> > index 145a63a5fda91..fb95865d7ddd5 100644
> > --- a/arch/sparc/mm/srmmu.c
> > +++ b/arch/sparc/mm/srmmu.c
> > @@ -1746,7 +1746,8 @@ void __init load_mmu(void)
> >       /* El switcheroo... */
> >       local_ops =3D sparc32_cachetlb_ops;
> >
> > -     if (sparc_cpu_model =3D=3D sun4d || sparc_cpu_model =3D=3D sparc_=
leon) {
> > +     /* sun4d supplies its own SMP TLB operations. */
> > +     if (sparc_cpu_model =3D=3D sun4d) {
> >               smp_cachetlb_ops.tlb_all =3D local_ops->tlb_all;
> >               smp_cachetlb_ops.tlb_mm =3D local_ops->tlb_mm;
> >               smp_cachetlb_ops.tlb_range =3D local_ops->tlb_range;
>
> [Severity: High]
> This problem wasn't introduced by this patch, but can smp_flush_tlb_mm()
> leave stale TLB entries on the original CPU if the caller is preempted an=
d
> migrated mid-flush [1]?
>
> With LEON now using smp_cachetlb_ops.tlb_mm, flush_tlb_mm() calls
> smp_flush_tlb_mm(), which runs without disabling preemption when invoked
> from preemptible context (such as fork() -> dup_mmap() -> flush_tlb_mm())=
:
>
> arch/sparc/mm/srmmu.c:any_other_mm_cpus() {
>         return cpumask_any_but(mm_cpumask(mm), smp_processor_id()) < nr_c=
pu_ids;
> }
> ...
> arch/sparc/mm/srmmu.c:smp_flush_tlb_mm() {
>         if (mm->context !=3D NO_CONTEXT) {
>                 if (any_other_mm_cpus(mm))
>                         xc1(local_ops->tlb_mm, (unsigned long)mm);
>                 local_ops->tlb_mm(mm);
>         }
> }
>
> Aside from calling smp_processor_id() in preemptible context (which warns
> under CONFIG_DEBUG_PREEMPT), the cross-call excludes the initiating CPU a=
nd
> re-enables preemption before local_ops->tlb_mm() runs:
>
> CPU0                                  CPU1
> smp_flush_tlb_mm(mm)
>   xc1(local_ops->tlb_mm, ...)
>     sun4m_cross_call(...)
>       cpumask_clear_cpu(0, &mask)
>       ...
>       spin_unlock_irqrestore(...)
>   [migrated to CPU1]
>                                       local_ops->tlb_mm(mm)  <-- CPU0 mis=
sed
>
> CPU1 is flushed twice while CPU0's TLB is never flushed, which can cause
> memory corruption after page table updates.
>
> [1] https://sashiko.dev/#/bug/linux-faa0e34b-f932-4bee-ba78-e5a71fbc6fe8
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126093106.13=
45825-1-linmag7@gmail.com?part=3D2
