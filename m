Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AF4339362
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787675718; cv=pass; b=D1cxxY2zFD2ta1gYO5q/G7GGGhZJHBVKJk/oQuv7QxCSm9hXiHgz9dLgMlLXDgn4jc2GObvX1+Z0UqAQUmdlk/GqqVBber3LPQ+g7SF+9iT0FSd8rEJt6nfO+aGrZiTkyJ0TDJ82pNPVAk3Sp+f5z7eRXgc7JCoFXM7l+zsSvI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787675718; c=relaxed/simple;
	bh=XEFaONL8xYC/7ZTJ7N0jE0D6XCHhZNztG+W53n6kkco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PcJfYY7JVAsNMK5hWFgIrEfHLfziY0BbvB3GWzKODjg2DpH/VH0tdpHTCpzCBOuiA7ich62MHfhbRhpgbyYW5xNLNpjKEZh3YYjoGE3x9GtaI/KVwWF+m4uaIIw9T/F1Y9zcCGxtaeNh/s9/9OG9d5CWn2LOdsrTOb4qWe4AWqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIwL1bq4; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIwL1bq4"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8525efa7274so35937b3a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 09:35:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787675716; cv=none;
        d=google.com; s=arc-20260327;
        b=S0sJviFsBC2VRwDNrB79lvDxVYcZdqWeSCSC6hIUYF9a+wVga4R1cKqtmvz1jdINws
         Q5XTph37Pks/9tfvsWSAa8fVsoG83CJi6+ASvfUr9SFzvK3IAhIX50AXvN93KFjXJ4SZ
         8PH74/SLtV8wii3m3IH+jv367g5t9cUogxeUTTbMb7KnpGoypS/+eL5dLizMC13swE91
         NsGFV672EWcYqAtr6ZtD9QGDh/lT1xrNIVzExI3E+bMD7Lt+MwKdwieL+hTIgJIW+Zwv
         MSdCIEVBFq84fzLdlRJZE8SFwQ/4InF92qKTbkYdaGe9Hwypc3H3Zay0sZTWuWqOpbQ9
         3t8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H0MU9SiN4cYunR3HktWWkcncktf+nU2XpGwFxF8Xzfs=;
        fh=sHSwKhqh6iGF3nFukHD0Uc9l2ekH8AYEQ5T+YJecXIE=;
        b=fmw+Eh43B0QlMTH4IfCJs/MGLn7G2rdTacoR6FfZrWNatK7u+EZXbUCcBoYzXB4B+B
         MDcwQz0s337/hI6BorFAEVtiwvp4ahulOYxTJwH7PSNFsyMyG+T9+GJ6nrJ1elJwl463
         4C8z/oyIcbITyac1PERQPIkj0QrVUHHj0uQ/NRtih+Zf0TEuvoWEb0zaFVQKhhTgS49M
         xrXcTVmrWW2s6SokYtQxTO81aE0F7EzBO89raR7mD/8hgB+QgywztXPvgyOlNQMkHCuR
         zdpWKv0NZBqmgy7LFLd2Mz9IzFgx37B0twT6LliE2rQSwV5Ebxf+QyQXHPtqA7nPr7xT
         dsyQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787675716; x=1788280516; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H0MU9SiN4cYunR3HktWWkcncktf+nU2XpGwFxF8Xzfs=;
        b=YIwL1bq4zDbon0g0pFK1au206A/6xrhpNTJpU9PPzj0QVtttWO/ZN366HckpatRRvX
         H50ljXPd+YhJCG1ll/jy34NKEP1dFHxhOxjrWoJ5CJc0ONPCznCEEwsnIwsQDz4CYJPL
         qZt44010n0H92wuJdJHgdiKAVVXnBAanGxYa+HWh3LeISaT00NWCBuzszfE45dDQv7fl
         IcK/yF9+eeoKMM56bS3I1Kaunb/aJ+sKz0xlOztQa6gQ6GCpuHkRV4p1/RT+Oq3xb0uR
         bLr1mxYBoFQOobvXBTW3q1VxLqkO9hjmmxHz6yOzsxgukdX4gD9/HgUsEnapoJdQVbL8
         UvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787675716; x=1788280516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0MU9SiN4cYunR3HktWWkcncktf+nU2XpGwFxF8Xzfs=;
        b=jYkY31/PGG5mDI9Utdu0MdP8W+dEdcMWrxCF/O+8ngqt/GYzslEHpfkzUokZQVYyR0
         WyAe08jaBfA4AOg1aD9M0764bRritNXovAVqNRAXqo7DP0lf91rS/OnhEaXBmt0rtBGK
         XbXw3vFEKdu85EXdZ9VrhiDgJ+0zuG2xrNmJ0Z0w4sa/mBMihBBroUG2O8zecuvPjbDF
         wBmU+R/iKGh6W7EvchiaP78DF7gsDT1HrMiKGWbIxI9gbktxUbKLELDqic4QkNSPoXFG
         CgrQmuNUCwAP5aSVD6p6pM4LKbWoZgR5/NJFNZWgAWOo8DPvD6VYKhRksmA5sytDv3sq
         SQfw==
X-Gm-Message-State: AFuF++mLH3EbsLmGCxjt92OQnJIpOOuzFDcvT5YK8CoSKDriGNZ6btik
	zaJGomnwcfbZWUA5T0noi2N8qB11JjQQGOZUM7Mh0XenJfrr/TuV4jZyMf3ZgZGcBdCb0Uyrhn/
	FUsE4zy5f8JOnTOqwlzxnLMd3L8xI4mc=
X-Gm-Gg: AR+sD13jPVDKOnc7ds2wFWQQr8PmbNDApx9nldXyfE0NqZJ21QUcoGRofqE//FSlPoP
	NX1vucQnOGKsQ1yNCRAt44JL9KHAprJzmtBl242ZI8bwCxg0TKIJlh48KvVsPW3I1GZUWvwOCSf
	X1kGesUDf2TaVbs0/mKLWKpJpOQzjuNyQ9CZMGZKKJfErjNvZZcHFGM6HLq4pKaMt8uy4moJ+gG
	QQOjd2hJcJLpwrX8zSbl/lFk85T3k7VgMy8lWZfEF4mJYLqo7rsZAYX7Iv9LbnwoJyQsmXlEXoz
	YNiigJ3du5Z1Zu7Gnffxk5LWuGR5KooUK1yRv+FwRaRTGPC29mTg38xTpL/lJsEZP+833X2RRQE
	7kSDi3raq+bJ+47B0u7+OylC/0WI9UQQSzteZ7bu9k2clXwOi9dP+R8Br2eOy
X-Received: by 2002:a05:6a00:2ea0:b0:847:99bb:b6d0 with SMTP id
 d2e1a72fcca58-8523c9474b5mr12854188b3a.15.1787675714932; Tue, 25 Aug 2026
 09:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824-b4-bpf-arena-free-resched-v1-1-5c447477a64b@debian.org>
 <20260824170831.33E051F000E9@smtp.kernel.org> <ao2gP7Y6UJ2o2tUc@gmail.com>
In-Reply-To: <ao2gP7Y6UJ2o2tUc@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 25 Aug 2026 09:35:03 -0700
X-Gm-Features: AcwNN1WjlWkMaVf3-1mw13hLMnxI3KEyHvkkyPcaIqvfs5peMp6PpF-5TCuL0uE
Message-ID: <CAADnVQKP8R=1aZiDcnfkqD3mA=32R2Yrw642u3w7de4JSfMWKg@mail.gmail.com>
Subject: Re: [PATCH] bpf: arena: reschedule while freeing the arena pages
To: Breno Leitao <leitao@debian.org>
Cc: sashiko-reviews@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 7:29=E2=80=AFAM Breno Leitao <leitao@debian.org> wr=
ote:
>
> On Mon, Aug 24, 2026 at 05:08:30PM +0000, sashiko-bot@kernel.org wrote:
> > > diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> > > index 7b6847200b431..c5f6bebbb15c3 100644
> > > --- a/kernel/bpf/arena.c
> > > +++ b/kernel/bpf/arena.c
> > > @@ -364,6 +364,7 @@ static int existing_page_cb(pte_t *ptep, unsigned=
 long addr, void *data)
> > >      * the freed page. So it all relies on 1.
> > >      */
> > >     __free_page(page);
> > > +   cond_resched();
> >
> > [Severity: High]
> > Does adding cond_resched() here violate the lazy MMU mode contract?
> >
> > The callback existing_page_cb() is a pte_fn_t called by apply_to_pte_ra=
nge(),
> > which establishes an atomic context by wrapping the callback loop in
> > lazy_mmu_mode_enable():
> >
> > mm/memory.c:apply_to_pte_range() {
> > ...
> >       lazy_mmu_mode_enable();
> >       if (fn) {
> >               do {
> >                       if (create || !pte_none(ptep_get(pte))) {
> >                               err =3D fn(pte, addr, data);
> > ...
> > }
> >
> > On architectures like PowerPC64 with hash MMUs, lazy_mmu_mode_enable()
> > explicitly disables preemption. Since preemption is disabled, cond_resc=
hed()
> > evaluates to a no-op, which means it won't actually yield the CPU and w=
ill
> > fail to resolve the original softlockup.
> >
> > Additionally, if CONFIG_DEBUG_ATOMIC_SLEEP is enabled, this could trigg=
er a
> > "sleeping function called from invalid context" bug during teardown.
>
> That is a good point, I think a better approach would be to drop the
> cond_resched() from the callback -- existing_page_cb() goes back to its
> original form.
>
> Then we walks the range in chunks from arena_map_free() instead, so the
> resched happens outside the lazy MMU section (FREE_CHUNK_SZ is SZ_64M):
>
>       addr =3D bpf_arena_get_kern_vm_start(arena);
>       end =3D addr + SZ_4G + GUARD_SZ / 2;
>       while (addr < end) {
>               u64 size =3D min_t(u64, end - addr, FREE_CHUNK_SZ);
>
>               apply_to_existing_page_range(&init_mm, addr, size,
>                                            existing_page_cb, arena);
>               cond_resched();
>               addr +=3D size;
>       }
>
> Would this be a better approach?

Just to be clear.. Is this needed to backport to some older kernel?
New kernel with CONFIG_PREEMPT_LAZY=3Dy shouldn't need
this old practice of sprinkling cond_resched().
