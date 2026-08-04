Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6260B466B01
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851115; cv=pass; b=TjRwHjjpvrj6/+//8RnPNqMv/dBnPIzq4cXXl9t8lp3hzR/fg9plVfg3QIZh2kEbjp/IJanlVKEhVZDy7yQQAN33mjVXalEZeIoTFyIhsm1vDd+5J+Rp7fyKJv/ZjLY4J9FlU+xa4/AzIpWhyEuDoLxBY5uTQOGVK4P2stFK9rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851115; c=relaxed/simple;
	bh=jY/ByS4tqFU4dJiCtxJB5bkQFqEJDaqnFTT04kvfxeg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVOXYNsDPvNV5uzvN90+c2JeB4x3tMbHHef7S/Z2Os7kwK8iXDA7z6GUKMuZGv0ibbpUmrI+ScKre/PBnU4S+KIX1jaoEmZAG2cE43APzjKLLz0PiE03/+foCjfWnDObdZwvWq5X8SRRrFIFwx+BsxystgxJ3KP8yQNCoGWgzfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X85fexpe; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X85fexpe"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38115bbb83dso184246a91.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 06:45:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785851111; cv=none;
        d=google.com; s=arc-20260327;
        b=Ebm8h7Hc87Vylmxsp83x99O12szYoAgAO5R1oupUbSolA4tjGLYQv7qpXaGdLzb6Qn
         CmY8wuj5LocqbKMa/3rhLMmDeC0j+MOjHvnkAGfibN+vM+6rL1NcAqp9PcpPADpBv3BU
         Eqz6vUmGgj9yNFFs35iRbulnOeV3aXEAkSZJH5xKE6+B64JZGlwtLqz9qH01kA3W5Mtu
         JGjFpCJAe/EIgwtHaLK4os2w4QxdpeumF51+h8xXpkmbnpNcc74HturHR5jJZK36ZB5e
         qftQ+nmjsUH+8i7DKh/IJqBEXQPtjm78rZ9tEoUL9by893Yz4hs5BRDY2CAZiSv94Hir
         blbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6KLSkQQH2H4b9RLq8BMZeOvATgLTkZiGqz35LpzOs3k=;
        fh=bYy1gdffJzDCrIK7z4EL5b/4iCdagfa/eUW4B0maKQ0=;
        b=SAU7JtwSx8BXqcRgfUuuiJzdUWCTAl/rB1XxNUIb6P9h+0c1iGtZel0/rEc+U6Uyw1
         nLRkfrH2KEN+c2H/7xAvwV+5phx6LjFB2KtRj4wXK0Rb4jo5KLKDozrcu4rEiWFfLb/I
         amYb1FmtIzdiV1FCJCN/1S0y4fuMdh5eqkrMlzR+EtyXQxVkixa49wahWLjU60gssEZN
         bHH6thuy5pQotH5MXoQua8OLQmFooC2JS5u0EFwjO62i/crpsa0o5QPQqlR234ajfqsW
         /EzofMW1uTBVForW1TgGBMWghu+QvFLL4VcWO9QOdwm7rqIh8S/gGsDvl1K3fgwJzQ5n
         TKuw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785851111; x=1786455911; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6KLSkQQH2H4b9RLq8BMZeOvATgLTkZiGqz35LpzOs3k=;
        b=X85fexpeTpnhA63GIy6hsPjGtgkTtxYNomAlwGZc40itWPos1th2McBvtvDYxBvm5s
         VeySlZRBzoy8mDqinJ2N7BmYSzKOo4hYhDNRJ/UDmMYcpJjHPehf5Bt9m3po9JI0axVA
         BKMBKbqPTeDbEqxsMyh/yQvUBwn+LPjaf/V0iCgtijx4FJA4mMKSMpYJSjt6rBwAa/1Z
         0chrsl6iCB6QV+Rqq9PW2CaZe9DlOcxIsYCfuL+9XfnqFGphCKASKVX6sxOYKdg4rRR+
         DNvQHfqLOORbp6J2rPSc/VOlHoZcAJ5tlvgS8T8+Mmq9StdWY166KzTEDkGAUGZWh6Ex
         onyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851111; x=1786455911;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6KLSkQQH2H4b9RLq8BMZeOvATgLTkZiGqz35LpzOs3k=;
        b=MZLkF8ohW8HgdH+hL3nhxI0mPKNmrefJT24o7YS/OaorTozo1YyVeu46OQ9XVQDkQ7
         fzLtwtL/pjuXil9lFlL/Awy8rg+p6U2AOJGX8/p7QkvzF/lk2PV0gGDkcoXe7wluY+dM
         QPtUZWs4/E+Fr1vM0pzi/Pssh7eeK0myZ8qjSknnP3PKOTBNpIgxb2Ohq3swG1WHjIYs
         DXf6BORRXNDibvZyS781TZDXX/HIqUgR24smkJCY1XkisVrE23ye8GMjeojnHI39puVu
         cmQfkZkh6Zda6L3UQUXvgtLTc3fM2nh1KEscDOFTS+/39ZmZfMuGxe2HaECgAOTqXvpe
         Hxxg==
X-Gm-Message-State: AOJu0YwHTeUPTrvDfDumjghzNX8fIWUQ517MWbc29vER74oofTy9kwTl
	jn8K3a/h94rdrBUYmbFhMS60fSKGuV150quYQ5SmOr9+KPLyB5stiMFmxaWr80wFkQsDV25WW3k
	rlD24DhUK3ZjOwyYe9KFt0d7Vm1wM9aqHMw==
X-Gm-Gg: AR+sD11KMWF9bQeOURb/3tPM36sgjkXPs3pdhxTm5w3vvA7LA8uxRI9o2dfUoV+K8E3
	PGMNhXsel8Q4hc8P63wzpIdn0vq9LczqKAAArFxyhmB0Glk+f7Q2Wn9dVAFQmRN4Cc2FAvmHzuW
	VKRo/6a9s+x8ebcy2HTu/MJEnQS/Wtq1LVoTWt8OC44ftn1apy+aFcDWSmdsXb7ZzWaMlQ9is/1
	VjC96hyRS/BPVGTtrn7sOvMWZUj+iCDLJ8/tuPbTkXcjuukFIgkGAgjys1OHuMHb0+gHHsBiGsg
	S21qLyadnmvD+1hxYKLmgmcXjQKUplpN7QDes14GgGFINo1V94LsiRUhTDqcJeivGB2aGtIa03T
	hv/C8lN9c7dhl7iV96J/7HGjUgnzVxn+rX23JujZc
X-Received: by 2002:a17:90b:3947:b0:38e:549:9e04 with SMTP id
 98e67ed59e1d1-38fbc3ebbb2mr17761731a91.1.1785851110674; Tue, 04 Aug 2026
 06:45:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260730153555.15176-1-harimishal1@gmail.com> <20260730154644.226891F000E9@smtp.kernel.org>
In-Reply-To: <20260730154644.226891F000E9@smtp.kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 4 Aug 2026 09:44:59 -0400
X-Gm-Features: AUfX_mwKR1ANLuyrvYO3QQh0kig5k8rc7ey8Arj9zRakX_48umkBTtR4sxPzqCk
Message-ID: <CADnq5_MBQJ4XctXY8opW9+=iEb6PygYniwu7SLCcJOq-znD-Zg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdkfd: reject alloc_memory_of_gpu with wrapping va_addr/mmap_offset
To: sashiko-reviews@lists.linux.dev, Hari Mishal <harimishal1@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 12:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The patch adds an unconditional overflow check on `args->mmap_of=
fset`, which is strictly an OUT parameter for most allocation types. This w=
ill cause perfectly valid ioctl calls to randomly fail with `-EINVAL` if us=
erspace leaves the output field uninitialized.
> --
>
> --- Patch [1]: [PATCH] drm/amdkfd: reject alloc_memory_of_gpu with wrappi=
ng va_addr/mmap_offset ---
> commit 90e63e5cacd60faaf13c89e037955751ad085487
> Author: Hari Mishal <harimishal1@gmail.com>
>
> drm/amdkfd: reject alloc_memory_of_gpu with wrapping va_addr/mmap_offset
>
> This commit adds check_add_overflow() checks to kfd_ioctl_alloc_memory_of=
_gpu()
> to prevent integer wrap-arounds when calculating the end address of va_ad=
dr
> and mmap_offset.
>
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm=
/amd/amdkfd/kfd_chardev.c
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> > @@ -1089,10 +1089,15 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct=
 file *filep,
> [ ... ]
> >       if (args->size =3D=3D 0)
> >               return -EINVAL;
> >
> > +     if (check_add_overflow(args->va_addr, args->size, &end) ||
> > +         check_add_overflow(args->mmap_offset, args->size, &end))
> > +             return -EINVAL;
> > +
>
> [Severity: High]
> Will this check cause valid allocation requests to fail if the user space
> application leaves args->mmap_offset uninitialized?
>
> According to the uAPI in kfd_ioctl.h, mmap_offset is an OUT parameter
> for non-USERPTR allocations:
>
> struct kfd_ioctl_alloc_memory_of_gpu_args {
>         ...
>         __u64 mmap_offset;      /* to KFD (userptr), from KFD (mmap offse=
t) */
>         ...
> };
>
> Since this check is unconditional, if userspace calls this ioctl without =
the
> KFD_IOC_ALLOC_MEM_FLAGS_USERPTR flag and leaves the mmap_offset field
> uninitialized on the stack, random garbage in that field could trigger th=
is
> overflow check and spuriously return -EINVAL.
>
> Should the args->mmap_offset overflow check be restricted to only run whe=
n
> (args->flags & KFD_IOC_ALLOC_MEM_FLAGS_USERPTR) is true?

Hi Hari,

I think this change makes sense.  Can you take a look and respin?

Thanks,

Alex
