Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0483672AC
	for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 23:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780010124; cv=pass; b=bZssqba3TGdsUUTljnbK3Ac+DvFOfiJDqE4eOqBnvhjMXvCY9jLrj6jDZe8czkphOnxYI51Jq5UmzmYxIJIZKnaZ+I6VtL5XcsxL0g9vg2K7BhtnVAO10IAqSS2XGBqPigsYJXVmeNUQfywIFhlH8KXd5PHwoED1flfbQBe8ubg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780010124; c=relaxed/simple;
	bh=HhiJsNw8Tg/fmiYQa8OT8z3WQuG6J3j5or6u/0F7c0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l8Vz4NvkHTuTDyw7NIFHpSGs01k2+w8c03rQoHVK8g5Ggs/DwEHbcIHkxOE6EDuojh1PoW5e6x/5NgRQFBj7njoA4pCm3E2KxW6ItCn8qpe/dNSWG8lHHJx+6dKxPUkgUHcJMV9oYpbESLw6xZqHxJt+CehrNNFoM37fNtGq26U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vw0fLGrU; arc=pass smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vw0fLGrU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45eeba68948so741592f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 28 May 2026 16:15:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780010121; cv=none;
        d=google.com; s=arc-20240605;
        b=dRbLiG4O7dh4BtMJTmVRQTJaJTKXNIHdjxBafmwEU92872KkUb0rRieJ9IaYt1xMKM
         2iyYPC2WQ7YN9ex+kcJk5O6ngr0K1Uv2YGYhYiuUUJ2ncnuD3p4CRksG2ANHOGyspJoA
         nEEQ2YBgzoZ6LDL/vGA13nNIVonqod1p+km3u9qKOkzXpRApinaiWj/7eUq/WKy5mFtS
         LlQ491Kzn0WYDt9K1lnt1lcQzPuQWEC67l/kzI6gXeYzNq9fkRMDXxQa6xhFAiE1terk
         sgJdLfBSYHoor2a6VpQQUuIAW6+TGrYJT/9LZVvS3ID0/VsIvvGKwooRBKtAIPQrKLMK
         hH0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1DnjhO1WrJ4e/oacKLLvKINV2+Bru6BjXY46NXvZIVQ=;
        fh=6PQFRWLd/QrmVu5yLvO0f3Twx/3OnPEU9esnxEZ6q28=;
        b=es5bHfzoHvXbJsd1KTxcIr2LX8iGMETknEB1bSzCp3GRZu2a4k5ujvRaMR2gMk9boC
         WjZOQ2FknoYeKHO77CbRivrU+khkxTYAq4b6KihKFrQ/iNommBDNnSmp0+6wnDYu4lie
         5Dm1fbdcaS+k0nGs8ctcTmzm/lbnwcMIcln15Tvl6jVvANU0gkg2IaXgnCDWnOs1HMey
         A4SkzMdR3L+GUJ9KLbUKOVNi1mU8bsviTPswVUg8+Jdjj467h6DfWpF3ylZsIb75dqrl
         r07RsDaKMV+6SINGuNwdaXYNRZTE5nobgvUC4ZR5FcljH+mXjo7r8Nf0LWnCE7bF1oWw
         Szfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780010121; x=1780614921; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DnjhO1WrJ4e/oacKLLvKINV2+Bru6BjXY46NXvZIVQ=;
        b=Vw0fLGrUWj0AS7aozJ9pdFA5jgZKooZbwHGaHCmh3/uON8eSEi4FdNR/eZnsyx6rVb
         1FGdbW2U0h+/q23FVYtWe9GkL8Eq8egRYmPJMzlHA7bCUTGaX86B+MynZgttXutMtR/L
         Yf6runisTTnfpE3ADrUEtzfuUGDoRPHWfGb5CVjgbafjdy3aFwflisEKpNLlj0Ood96D
         +k3r12aPVJfGyavnmMPMVrLyC7/i6RTT/UHY61t8v/tW5xp4EREIwHNcQ7eL0DGMtxV1
         HDW18bnFncuVxr7t8ZlQzJydHQa6ttJZqRWVKz5WZkVv80guDvgqA6WlCxuOsoEZDP4Y
         3lLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780010121; x=1780614921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1DnjhO1WrJ4e/oacKLLvKINV2+Bru6BjXY46NXvZIVQ=;
        b=ViCFRXhX1WrUMUsH8prE7gLFOCaw0Wr60wetyjkDYkezZGWiXa8LiRbpEanPLtzOyQ
         lBblgb0OrrCd2YRZDX4CmpH0BkhPtnAl1fu+TQgijtYY4XUv0ec+p4TI5FaocIFcDbQZ
         2ifyj94VUXzZw45xgBWxpuHSlkWuZgeKJbYwWP3gavyxMSFuc7Qslwt45Pf5X+nbyCTx
         MA7veHFKkuE6XTrXdmmzOUdmbaIDVXaPokwGRB74XWcVkMhLAZm4sOYPEo22Qyg5S1f9
         62IS58bvpDaAVgb20zqXgQfk8Z4jpRjMnjdxwu9dG5wyg2tVGbVVHLuf7oNa/QfYJq/i
         gniw==
X-Gm-Message-State: AOJu0YxD3NUO3nukXoZ7qF1zzV9l87bxWYhHe5A5alQwjemGokTVUH+y
	8030X3Zec4Ih/LPfAIHcr2rIbaeAjzZOZLJujRFEDxPStv7ctbltEF0sfdAQayBCRK4xj81akFY
	DDpkBX2CNuzJBodE5xx3j4pKmGLEf1bDQiQ==
X-Gm-Gg: Acq92OFoYooFGLUxKN/F6CB4Rai5kJiZZI2BfKyza0Ey1sjQSXZWT5H6RRwUqs0SWhw
	VFt+A445W9q685ubXNXaD7ME9sWn/6YLBstWKk2HD5yHe+T5BMqDCGcadK/gC095srBPRUxrrVQ
	EfuBL0jq49YRrPao1WbxZM5PWHVK927ZGBxGgs3dRfsdRCzIivihyNi/KRQkCtsxJ82oFwWLSE/
	VFF+ptcfMc/8DjZVHcvsihafTZxgH5JIUVnlratkvTN1CyX8nLpL0Z+KrsUfjevUGDSz7Aj4oFG
	BnbQ73jm9A2Uk3hkZJ0cd52sZ6xs1aiK63Avuf4E3U0iU72BJLvLcVDIPt6f8eMRrrf31ProxPh
	17gG8teCp5NrMYhCO43nLw4ES1xi4tYmcOSwc
X-Received: by 2002:adf:fd85:0:b0:45e:a0ab:8bcb with SMTP id
 ffacd0b85a97d-45ef1413aa3mr441938f8f.15.1780010120552; Thu, 28 May 2026
 16:15:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528222014.38980-1-alexei.starovoitov@gmail.com> <20260528231103.DEC921F000E9@smtp.kernel.org>
In-Reply-To: <20260528231103.DEC921F000E9@smtp.kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 28 May 2026 16:15:08 -0700
X-Gm-Features: AVHnY4KKEn7Km14qgoNoivEwWCS96fFsKwers_Sh2Z0A-5YreWU2m-zEZ_aWNPk
Message-ID: <CAADnVQJMuaFYVkYEGnsR43Bp=J0yvkaz_pd8+tCG=-zgnqOiVA@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf: Take mmap_lock in zap_pages()
To: sashiko-reviews@lists.linux.dev
Cc: bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 4:11=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] zap_pages() can enter an infinite loop if userspace continuously=
 mmaps and munmaps the arena, stalling the thread indefinitely.
>
> Pre-existing issues:
> - [Critical] zap_pages() can pass an address range to zap_vma_range() tha=
t exceeds the boundaries of the VMA, causing the kernel to unmap memory bel=
onging to adjacent mappings.
> --
>
> commit 5e7dd96eaa4e65e290f989d52d5ebe8450def72a
> Author: Alexei Starovoitov <ast@kernel.org>
>
> bpf: Take mmap_lock in zap_pages()
>
> This commit addresses an AB-BA deadlock between arena->lock and mmap_lock
> in zap_pages() by dropping arena->lock before acquiring mmap_read_lock().
> It introduces a zap_gen counter and a zap_mutex to track processed VMAs a=
nd
> serialize callers while the lock is dropped.
>
> > diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> > index 1727503b25d84..9b2dea229b385 100644
> > --- a/kernel/bpf/arena.c
> > +++ b/kernel/bpf/arena.c
>
> [ ... ]
>
> > @@ -746,12 +751,60 @@ static long arena_alloc_pages(struct bpf_arena *a=
rena, long uaddr, long page_cnt
> >  static void zap_pages(struct bpf_arena *arena, long uaddr, long page_c=
nt)
> >  {
>
> [ ... ]
>
> > +     mutex_lock(&arena->zap_mutex);
> > +     mutex_lock(&arena->lock);
> > +     my_gen =3D ++arena->zap_gen;
> > +     for (;;) {
> > +             mm =3D NULL;
> > +             list_for_each_entry(vml, &arena->vma_list, head) {
> > +                     if (vml->zap_gen >=3D my_gen)
> > +                             continue;
> > +                     vml->zap_gen =3D my_gen;
> > +                     if (!mmget_not_zero(vml->vma->vm_mm))
> > +                             continue;
> > +                     mm =3D vml->vma->vm_mm;
> > +                     vm_start =3D vml->vma->vm_start;
> > +                     break;
> > +             }
> > +             if (!mm)
> > +                     break;
> > +             mutex_unlock(&arena->lock);
>
> [Severity: High]
> Can this loop run indefinitely if userspace continuously mmaps and munmap=
s
> the arena?
>
> Since remember_vma() unconditionally sets vml->zap_gen =3D 0 and adds the=
 new
> VMA to the vma_list, concurrent mmap() and munmap() calls could repeatedl=
y
> inject new VMAs with a zap_gen of 0 while the lock is dropped. This might
> cause the loop to repeatedly process these new VMAs and stall the thread.

Nope. Cannot happen.

> > +
> > +             mmap_read_lock(mm);
> > +             /*
> > +              * Re-resolve: while we waited the VMA could have been un=
mapped
> > +              * and a different mapping installed at the same address.
> > +              */
> > +             vma =3D find_vma(mm, vm_start);
> > +             if (vma && vma->vm_start =3D=3D vm_start &&
> > +                 vma->vm_file && vma->vm_file->private_data =3D=3D &ar=
ena->map)
> > +                     zap_vma_range(vma, uaddr, size);
>
> [Severity: Critical]
> This is a pre-existing issue, but could this unmap memory belonging to
> adjacent mappings if the VMA was partially unmapped?
>
> The uaddr and size variables appear to be bounded by the global
> arena->user_vm_start and arena->user_vm_end. If userspace partially unmap=
s
> the arena using munmap(), the vma->vm_start or vma->vm_end shrinks, but t=
he
> global arena bounds remain unchanged.
>
> Since zap_vma_range() relies on the caller to provide a range fully
> contained within the VMA, passing an un-shrunk uaddr and size could excee=
d
> the current bounds of the VMA and inadvertently unmap adjacent userspace
> mappings.

Nope. Not an issue.
