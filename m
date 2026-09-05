Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79EB36C0C8
	for <sashiko-reviews@lists.linux.dev>; Sat,  5 Sep 2026 03:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788578803; cv=pass; b=CfNymlPf4h/HpJQdU3YmxEbcu4TekV3OHj4pwSH/KEvDXVZ8M/Upke960aX43QDrONiAgkNV4cuAE3w44t/DQ74V14xe2XdzCDegcNkZFAULWIufY4hpvlNKqY8STCM3BVKUX/wAUd5BYsIQ1j1g+hxxCoozHiwF6LXx6QmZGzo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788578803; c=relaxed/simple;
	bh=Ro5WQFnUyuX6c8ZMaP/vKnPsUVwk4Al6XZOewowjF5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1OiLqr+09XPY68/l/DGz+u4qXVkZGIjFzXqkm9Sbxu2sQQwA2/7WsxV2BTr6pLyN+b8wu1g5sKPf5t7o+Zc27lZgr+arjALxBRH1xa/dC9ozkaa50LP2++31ICB6nhesBoyxiw0MQiofNFptxP0cOin0yd1Q3S0NcEqWV1GwIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=LbCfMHIa; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="LbCfMHIa"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8565d77c277so23669627b3.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 04 Sep 2026 20:26:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788578801; cv=none;
        d=google.com; s=arc-20260327;
        b=KVw07qaDFMeLIZimnsZs20TlcsAobiMvRnUXzo4tqKxfkzRQwKdjM9WvfGkA8jV41w
         Xj879FJZMHF3Pc2CIFrAKfXM7Am0W+3JWktqu4BOKppV1kpZHevU0z1YaIbhOnS1G/86
         0d4QmPRM1VEhHTAfpQ+dYM+Tc8Uqx5YNAoVYjyFO3Qp3UF8faiTIwTEIlrvCV/2Frprc
         fxXiW3lOIOM+vuZpYXoy69Dz7a82PecLp3Wxjl64Y78Dw1jT0x5COCJtrjrL+fop7Axt
         20E6rAoqjIptjLU+o23WDkspRtq7dk+F3nNse1FvnyPjmd/NsZSCTkmji1Ps6uHzQ+9D
         cPzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/nulUh8YNeX+n+nn9HvwdNzcBQLH+YBQeOJSncThU38=;
        fh=+EqZIQ/Z0eTPY3bjRaHymGh5YecU+3rv2c1KGcdjJQw=;
        b=d19gL2MPP7iwG0FZlBptLBNyuYezaMcsr/9MK0lOVwII1tHtDS4xwsFk6Luh++9Xpv
         A55PH6KS/gZYVNtzECEvKkSh7E47MVYH38xFTMdtIPvQRHLKMzv61naMKDAPdyVYTd/5
         MiNQCNzqriOjNJkt1MKdCQNdo7Ss8Q1soCS2zNQVbYvtJ0Gv12js3BgAmVo1dhab6QLw
         TYcsub5BcEbUQOXrCqNlf6Cc2y4OcBVWnztqHTQ4C7uAp43QnU2sH9nJbBTwNTxXGjup
         deoUfHJxnqp0VBtW0xKYAyOvGlagzjZAT+bNlIianBvNbZ/W5iQanSm4ajMQN0kL3aiR
         nx2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788578801; x=1789183601; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/nulUh8YNeX+n+nn9HvwdNzcBQLH+YBQeOJSncThU38=;
        b=LbCfMHIaZXigUvsaViLQhbwGGrxgXbOE3DgpyPyaB7FJwzA8q/FdZph5elM1YMFp1a
         SstwbPqVWXNThuXlnbbShWxU4BhNAIbKm/lQw3OgS1ymNTtjQEZWmbzBinWj1EvzzxHm
         Kr3K0Uxm0HWPo00zK9x62HMcYJYnkdmvUfBhohFGj+GSyuh+yXGOdQLtZak/g3adeYBB
         QU82iLVTjBeZoJzlS2+Bj0DE4bRiML0SZFyxAswIIAMA05BttYtXQDe4p8aOvsVzwWKa
         2ajsNm5saqCce8ZTtapk80z69cI71tLL2CCimChXmsANj4W5ccNnZjay515bpH0RKjBy
         4pIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788578801; x=1789183601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/nulUh8YNeX+n+nn9HvwdNzcBQLH+YBQeOJSncThU38=;
        b=mdQonBcH3WEQP3kvO5/7l9h7LjOIkl3RH19gFlmKayFUjDshaFGp3U+tXP3rsirPbm
         qDG9Z7RH4TAICf2ynyYnkHSqxcygqpDLB6HjHM+LwArL839xvfmixKwTcq17SEu7hF5w
         P1973EuPzeAHD1JystsXH0O/L7idn2T3xE9DZpvO5cUUvSVxhtTg2EZKXcqcjGfMuL6I
         Fwj0oQqdyGNlLvslpaxfaA1/4vjsdJc4K6Wn0WvNssb59+ZtNG1+QHsXDPm23JGKfWyi
         QQYUkicrFirBhc+6GpcSBHU5hznhh6LvaCXHjcKszO42drNs3xreC0L3fW1wc4RMZ8fx
         XF6g==
X-Gm-Message-State: AFuF++ljen0DObFkVtw54YLY8V7xlaP/a5xHTwH7bBZbv+jMpitimtRi
	ICuVbTuVGNOsJMYxQinhsy9bChjYB8GKnpJmusjNCwCmNONYUhfdQb3WO7vGJWSVAR2kVD44laF
	Xf5/y+rL7V4BCXxuxKW3UXItI+75eMV0CX8f7KNXLJ3enBXzLKY1cJ3h08w==
X-Gm-Gg: AYBFou1P8UiC4CaoqnVoxmUgxGy5TOF1UAtrxwRLta67hGqhxewrcnumMfCbcGnozST
	DRGy9cKn7Zp238RSM/ZeVOY+GImqNITVbXLw0D6GE8hQI2cMpIYgqu1P42AeXJoHthuvCAtJW1T
	5VAnfV2gHT49XyrGARZXSmKKoZxluhs2QwqtPA2x4vwIxXoliLIfUeapB05c3cCIXluJ9Z1cvz2
	zhh58Qt2x8i59qEq1+8IU0VKon6Db/UAH/SnjboESxfx6FqGqPyTxIZL7644nTRBZkWKHxghOoH
	5UOWpqkgblRXVQYQLheCsxZ28kguKMIB7AeiYS/FZE9oAhQ=
X-Received: by 2002:a05:690c:9c0e:b0:85e:6840:4ea5 with SMTP id
 00721157ae682-87126e97f78mr50237547b3.26.1788578800363; Fri, 04 Sep 2026
 20:26:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903122128.12264-1-songmuchun@bytedance.com>
 <20260903122128.12264-5-songmuchun@bytedance.com> <20260903125312.16B761F000E9@smtp.kernel.org>
In-Reply-To: <20260903125312.16B761F000E9@smtp.kernel.org>
From: Muchun Song <songmuchun@bytedance.com>
Date: Sat, 5 Sep 2026 11:26:04 +0800
X-Gm-Features: AcwNN1UeHEvk3zYctxqOtU6UT64a-Esa9ORnfEzCr_q1R1rkedrEbgma7jX-zEo
Message-ID: <CAMZfGtVhb8MMTJGPgsfo7a2VFEGS84VP--_dA5ffY_KykEV53A@mail.gmail.com>
Subject: Re: Re: [PATCH 4/4] fsdax: materialize pmem vmemmap metadata on faults
To: sashiko-reviews@lists.linux.dev
Cc: Linux NVDIMM <nvdimm@lists.linux.dev>, linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 8:53=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [High] Global TLB flush broadcast inside global page table lock causing=
 severe lock contention.
> - [High] PMD fault materialization failure incorrectly returns VM_FAULT_O=
OM instead of falling back to PTE.
> - [High] __vmemmap_materialize_page dereferences a potentially NULL PTE p=
ointer if the DAX device is concurrently hot-unplugged.
> --
>
> commit 9e2a623911317e382af87ef795b2fc34f1686554
> Author: Muchun Song <muchun.song@linux.dev>
>
> fsdax: materialize pmem vmemmap metadata on faults
>
> This patch opts pmem FS-DAX into the shared read-only vmemmap mode and
> materializes private metadata before inserting a PFN into a userspace
> mapping. It shifts private vmemmap allocation from device registration
> to the first DAX fault for each metadata page.
>
> [ ... ]
>
> > diff --git a/fs/dax.c b/fs/dax.c
> > index 1fbba0d21c13d..89377301d51b0 100644
> > --- a/fs/dax.c
> > +++ b/fs/dax.c
>
> [ ... ]
>
> > @@ -1877,6 +1878,10 @@ static vm_fault_t dax_fault_iter(struct vm_fault=
 *vmf,
> >       if (err)
> >               return pmd ? VM_FAULT_FALLBACK : dax_fault_return(err);
> >
> > +     err =3D vmemmap_materialize_page(pfn_to_page(pfn), pmd ? PMD_ORDE=
R : 0);
>
> [Severity: High]
> Is there a risk of severe lock contention and RCU stalls here?
>
> When a PMD fault triggers vmemmap_materialize_page(), it loops 512 times.

No. It loops 8 times not 512.

> Inside that loop, __vmemmap_materialize_page() acquires the global
> init_mm.page_table_lock and performs a synchronous TLB flush:
>
> mm/sparse-vmemmap.c:__vmemmap_materialize_page() {
>     ...
>     set_pte_at(&init_mm, addr, pte, mk_pte(candidate, PAGE_KERNEL));
>     flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>     put_page(template);
> out:
>     spin_unlock(&init_mm.page_table_lock);
> }
>
> Could this cause the system to become unusable under load due to sequenti=
al
> global IPI broadcasts while holding the global kernel page table lock?
>
>
> [Severity: High]
> Is there a race condition with DAX device hot-unplug here?
>

No. The FS-DAX fault path is not relying on that SRCU lock to protect
later struct page accesses. Before dax_fault_iter() is reached,
grab_mapping_entry() has already installed
and locked a DAX entry in mapping->i_pages. DAX invalidation/removal
paths synchronize
through that entry and wait for locked entries before deleting them.

> The prior call to dax_iomap_direct_access() acquires and then releases th=
e
> DAX SRCU read lock. By the time we call vmemmap_materialize_page(), there
> is no lock preventing the DAX device from being hot-unplugged, which tear=
s
> down the vmemmap page tables.
>
> If that happens concurrently, __vmemmap_materialize_page() will find
> pmd_none(*pmd) is true in virt_to_kpte(), resulting in a NULL pte pointer=
.
> Will the subsequent ptep_get(pte) dereference this NULL pointer and panic
> the kernel?
>
> > +     if (err)
> > +             return dax_fault_return(err);
>
> [Severity: High]
> Does returning dax_fault_return(err) on a -ENOMEM error incorrectly trigg=
er
> an OOM kill for PMD faults?

There is no reason to fallback since no memory could be allocated.

>
> dax_fault_return(err) translates -ENOMEM to VM_FAULT_OOM. If this
> allocation fails during a PMD fault, shouldn't it return VM_FAULT_FALLBAC=
K
> instead, allowing the kernel to gracefully split the huge page and retry =
at
> the PTE level (similar to how dax_iomap_direct_access() handles PMD fallb=
ack
> just above this)?
>
> > +
> >       *entry =3D dax_insert_entry(xas, vmf, iter, *entry, pfn, entry_fl=
ags);
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260903122128.12=
264-1-songmuchun@bytedance.com?part=3D4
