Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73002EEE7B
	for <sashiko-reviews@lists.linux.dev>; Sun, 14 Jun 2026 14:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781448385; cv=pass; b=pQUUonUHSOL337XkeN//YE8nAdDWVc0hnmPf/27rz8mh5Tt82+bukxDeJE3YMUjYFsVsJXMUKO8II0eGPAJK+v08pE45NXBRwxLfBlRE/DqdAoQxD3xW/DDqD6PnAksp0oBSmH3Jj1qopXPpmwZ9DA7MT3XH54AUtSUiprXLOA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781448385; c=relaxed/simple;
	bh=2Q3Gmrvzmq5g0KgbCK921fwbHOfDSFNnhYBIbs+uioM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KqoYtFHEVXpx5cWImcTUXwbqbNSxE9IdDXxjQGiseswiinZQ1Ih4TGJc24hU1Cws+9pu+0XXLouZy2e9nZQKTPh+gQWLbtQHxhi2UtpK8Wb5URX/c5Jpz/jEMlCQX0+mXzwrjRlWVgYh5dtPMBI3LLpQAdY1RIql6GY4CgGuOjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DnX07AI2; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DnX07AI2"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7e2f3646c10so27380807b3.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 14 Jun 2026 07:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781448382; cv=none;
        d=google.com; s=arc-20240605;
        b=YD4De8xtU+LkK2EiW1ujZC3+S5Ynoz80hTsMwZM1iUK9fPcB625TKieT6SHTyDVg+f
         MKWkoOnlBnH2KJJOAhtQ+UcCNNbKw3GWuQ4BHXcBf2jeJXzuUPd5sU1IFIS/+3alqO82
         kFlnXBwQuZtPMA/W8HPFywLOudkL0/zPEYCAie0V0luuqNerEjTH31gh8I7fzT13uPgI
         lMPA2CLQWQ+LQWVkPqJdVqdtBsoHDCHkfj91dGA/FeKnflkp1E+Co4NhAP102mHqWP25
         xpan4nd5sH8ws6NvAHqKumI4zLwtb9A/dA9Wsxc50j0uJvh+Pj5sofC0aOInzvEq5hgp
         V70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+/n6Ztw9j4lBHgOeYByo7kNKAZf5o9zTt9xSxYBEC0c=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=HWX7dOdPXkF7vErM3zUJlxME6grSPaSCXVlEsztk90WtxPLb0TC7wjwvfmTLuOC5MQ
         2IGoAUl6Mmv+cpnVP29BUYIDO2OiRsdM3xE3G/hKOGIQzTqylBiJ2xmGZ4Y9MIxcy6e0
         /TBA6Hsk6LwwnIH54mnRPmDWH7/3kSKLIQb69l/+CYdMV10GOY8xSkxoU5rdnwNmW4fQ
         j8J9PHKp26D6SuR9vMLaHlQhvFlc4XRbYSyJ1rwhSgwxUv1ymfWSLOamOilcuOCF1Vo9
         4q9nNwoFa/x3D6sJWx38lw+ljZX1lUTqkQZ/MLdMx3Gl8vLdw9bgcF3jLpJokmjPFCod
         WbjA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781448382; x=1782053182; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/n6Ztw9j4lBHgOeYByo7kNKAZf5o9zTt9xSxYBEC0c=;
        b=DnX07AI2c5yj07d+At+zn9xxy8w+zQKzQ4+idJOETqYRHet8oQ7s/uNwnZN1mFjmGW
         ce07O6DHYAWpBZM220IwyEJIaoab7p4j3sNCBSqH/gOtbm040ouJy3eLXiEqA8ZA9l9k
         D/Ig+X8RKrRD10Te7BKd/bjem6xfkh8jfRsZUm1IIv9K4Aa7S0xC59rikfVGgtXzbEp2
         ECv7+r5cuiAN2iWrSHDsFAus3Mv5u1cN17jtbgzGOieHAo9496jwRacbxPmvL6qQ0QKO
         9BTpjjisH19bCDrlq1694cxSFa2Iyjug0dldDe5tet6ynC2lHq2g62IPtnIW6vIJZj4r
         XqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781448382; x=1782053182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+/n6Ztw9j4lBHgOeYByo7kNKAZf5o9zTt9xSxYBEC0c=;
        b=HAxglIVDgXESiogoiG9IXYWcmuAmyY55mY+xclb9CeqFJk86KLq8swDDSq2Od140t5
         m5w7YVgaNB6RVruvwPAYQtMeirlMG6iH50UDQ4w8gC27zsZKi2DUEfxHMSbGc8uKMKVk
         ZURja3zgYo/JWsCuonw0xUkTQZj9alJkn1pq3byve+jdkgIL2qo6zZHY2oAk/nTkzl76
         np555nTWGtP9/sykUKofDf/sFE7LyCo0iRaFpIYdAopgQPYFLKeYV1whycRCGzimVJjs
         gKaLpByFNVq4eUAFN4bdKFlWTOYNisrCRDWVe8bi5bwBYFGJlw49MG/SXntAtHS8bXUr
         Odsg==
X-Gm-Message-State: AOJu0Yx/sDoM2uue6c4CaFNPxn7B+7OqawvOeYwJJkob1g74xeC/O+kw
	YIYskBLF04pCl1Fs1lFuZkx0sfzMNiNm9xGRPptkMbp3Xv1iOwVKqu/J1ucjJPjAAJ6K6QULvaV
	VsmRo1blJjgJUQCyDHmUMhMpyS+Bg3DxSrK5M
X-Gm-Gg: Acq92OGKgpaMJJQydE4M6G1MBCb23S/49mcsN+7mcZNdwxrpFQhxbWcntwOfk1mm+Bh
	APodSPZ0I3kcluZM1FhGB2R7edPd7LfamRkK03gRwevwvby6R8ccdPFzc066m6eRDo9TTin8JAu
	muYFUyN0mHp4ib7zyCE6MlrRBVToXb74ypMfUY+rC0NseeiwaxEE4MSWZHh3mY3rpD9C34OLxZx
	kZ3UyFWQb6AivnaUz1i9Bw1NvrlCuTCd1IsqqMbHto2nmg341lJHY73pHFIo9PEv7Ozc7HoB8lr
	Ll6/
X-Received: by 2002:a05:690e:4146:b0:651:bf58:446b with SMTP id
 956f58d0204a3-66277f5479dmr8835081d50.10.1781448381613; Sun, 14 Jun 2026
 07:46:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260614133807.2165124-3-ekffu200098@gmail.com> <20260614135041.D944B1F000E9@smtp.kernel.org>
In-Reply-To: <20260614135041.D944B1F000E9@smtp.kernel.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Sun, 14 Jun 2026 23:46:10 +0900
X-Gm-Features: AVVi8CcBo1nTDfvjkovV-__M8a02nNzFI7DIjnYIoWPk9xTRUu7QjWwIjJiydSI
Message-ID: <CABFDxMEhOJ1nrmWcyO6FVfxQHbahKiJ_O_QKPf0Q-VMzT5pdEg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] of: reserved_mem: print skipped node name when too
 many regions are defined
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 14, 2026 at 10:50=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Out-of-bounds write to the static `reserved_mem_array` if `membl=
ock_alloc` fails during dynamic array reallocation.
> - [High] Ignored memory reservation failures allow unreserved memory to b=
e successfully registered and handed out as exclusive reserved memory.
> - [Medium] Dynamically allocated `no-map` reserved memory regions are lea=
ked from `memblock.reserved` if their initialization fails.
> --
>
> commit f95986ab58870e3d79cb320c6dc73ef80982357e
> Author: Sang-Heon Jeon <ekffu200098@gmail.com>
>
> of: reserved_mem: print skipped node name when too many regions are defin=
ed
>
> When too many reserved memory regions are defined,
> fdt_init_reserved_mem_node() logs an error and skips the region without
> naming the node.
>
> Print the node name so the skipped node can be identified, matching
> fdt_scan_reserved_mem().
>
> > diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.=
c
> > index 499b769e98096..df3d90cb8dbe1 100644
> > --- a/drivers/of/of_reserved_mem.c
> > +++ b/drivers/of/of_reserved_mem.c
> > @@ -623,7 +623,8 @@ static void __init fdt_init_reserved_mem_node(unsig=
ned long node, const char *un
> >       struct reserved_mem *rmem =3D &reserved_mem[reserved_mem_count];
> >
> >       if (reserved_mem_count =3D=3D total_reserved_mem_cnt) {
> > -             pr_err("not enough space for all defined regions.\n");
> > +             pr_err("not enough space for all defined regions, skip '%=
s'\n",
> > +                    uname);
> >               return;
> >       }
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does alloc_reserved_mem_ar=
ray()
> fail to reset total_reserved_mem_cnt on error?
>
> If memblock_alloc() fails during dynamic array reallocation, it returns e=
arly
> without resetting total_reserved_mem_cnt back to its original value. When=
 the
> bounds check in fdt_init_reserved_mem_node() is reached later,
> reserved_mem_count can increment beyond the statically-sized
> reserved_mem_array limit, potentially causing an out-of-bounds write:
>
> drivers/of/of_reserved_mem.c:alloc_reserved_mem_array() {
>     ...
>         new_array =3D memblock_alloc(alloc_size, SMP_CACHE_BYTES);
>         if (!new_array) {
>                 pr_err("Failed to allocate memory for reserved_mem array.=
..");
>                 return;
>         }
>     ...
> }
>
> [Severity: High]
> This is a pre-existing issue, but does __reserved_mem_reserve_reg()
> unconditionally return 0 even if early_init_dt_reserve_memory() fails?
>
> If memory reservation fails, it logs an error but returns success, allowi=
ng
> unreserved memory to be successfully registered and later handed out as
> exclusive reserved memory:
>
> drivers/of/of_reserved_mem.c:__reserved_mem_reserve_reg() {
>     ...
>                 if (early_init_dt_reserve_memory(base, size, nomap)) {
>                         pr_err("Reserved memory: failed to reserve...");
>                 }
>         }
>         return 0;
> }

These areas are affected by the ongoing series [1], so it might be
better not to touch them until it is merged.

[1] https://lore.kernel.org/all/20260527032917.3385849-1-chenwandun1@gmail.=
com/

> [Severity: Medium]
> This is a pre-existing issue, but does fdt_init_reserved_mem_node() leak
> dynamically allocated no-map regions if initialization fails?
>
> If __reserved_mem_init_node() returns an error, the cleanup path for no-m=
ap
> regions clears the MEMBLOCK_NOMAP flag but skips calling memblock_phys_fr=
ee(),
> which permanently leaks the physical memory from memblock.reserved:
>
> drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
>     ...
>         err =3D __reserved_mem_init_node(rmem, node);
>         if (err !=3D 0 && err !=3D -ENODEV) {
>                 pr_info("node %s compatible matching fail\n", rmem->name)=
;
>                 rmem->name =3D NULL;
>
>                 if (nomap)
>                         memblock_clear_nomap(rmem->base, rmem->size);
>                 else
>                         memblock_phys_free(rmem->base, rmem->size);
>                 return;
>     ...
> }

It should be rare, but looks correct to me. BTW, it is not directly
related to this patchset, so I think it is better to fix it in a
separate patch.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614133807.21=
65124-1-ekffu200098@gmail.com?part=3D2

Best Regards,
Sang-Heon Jeon
