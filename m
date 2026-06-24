Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EF5305E28
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 19:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782330863; cv=pass; b=UdAEazo2s0cajtYQLFbRY95WUmBy0Jp5a/CEJZq1EG1F18HyzTUQoo9E3GL+kbku8ic6JJXP7VPMO1Cqksqe4BIxyRxGnKby9w8DU+i2krXWpzI8yR1/zy0AF/UqnMgAt4zGtEoH+DHoL3nf6EjWkZNAIj1D70ASDFw63RE3CGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782330863; c=relaxed/simple;
	bh=yGW+rfVoYBJACn5bz7D625MSTBsjlPbEBqkQTyAh0S4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMBJbR4ty3QCmzs8BPZE/QI3llTppYZYtE8VVRbZEuDrGHIZ42CAaAjK9mUJ8WWeQhV6pIHA35nSKXhxVsu5qPaU3XF46Jyjd7cSyHtenL3aUu8byJV8mh3McrNI/V9i+E35f+rQdgIH0h5Ex1tEfmprDJutAibsu01QeIEddiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oltChB0G; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oltChB0G"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-662dd616cdbso1520525d50.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 12:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782330861; cv=none;
        d=google.com; s=arc-20240605;
        b=aGfPCLIwfAxKlDW28vXxL9seiWKZUUB0i6AnjQLM28q5DoThxiw+AqfYPI+/Fjr/Co
         ny4By3TEtkbLlnKaHuLN6HLBabPzXwMUJ2VdOp7JKdrx3w8//5E6ajUHEYEfAPIcYKEP
         Gfo5nsrERs9ShWnrq0e4jXpITXoHu3pNUIHNyXvjY67BYWTnO80jXyWNZF+MEeoK0zlR
         zinQJZP3lwXaT3n2YfywR56L6eD/HIiqp4NUA3PIF2tDFAqt3Kxsc1Psf1Q8iaWakGUm
         8P9u7AstHLffKl1BJA8TZmeHYmRkV5kISbOykF8VEyCnZb140rkGNtDRGEie6snXT1nd
         cwTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9zi8vt2Jkqw/BXMyJ0QyA2n/KwDWooYawhwWLuXdEns=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=g8ueh3+rtfXRYITAt0C7gp+lHc2v8WNbZrtPq1xF2kgSzHgZAKrKCMHEVZGqOKoc/g
         LBIaFeTCGfy6iKE10tnllA4nzLLcXZsexqUvTYxgg80LfkjeCDNFKOF7uas8lW/AE4Zl
         3dQ5PDEcDBh15gbgNoHpYz0TQlcZS0ggmojk7KLu+vyGMOtYsCVeCUeQIU9z8FD6SFzF
         iu14AEC3lfEOeM8ZPBBEherOe5nkPUEg6oGwgTbC1pmGP8wX+oyRlccL1kQj6SEWhPzw
         mWveGoR++maeBy4KUCcTXV8mpME88OiBk+aZ7fsc84mFfH2M1cLW2eb/09UxEF9dl3vP
         oQ+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782330861; x=1782935661; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zi8vt2Jkqw/BXMyJ0QyA2n/KwDWooYawhwWLuXdEns=;
        b=oltChB0G6SCzA2sAhsj1IY7JgQaJxpBeBM1eO4XrWHjV1YrDnSyPvVaUGVitN8Z4tS
         zLeBFHSJ7ochC3UsKL6OgX73lecyyciH8FAPK1R3/rwg6FHhiqUQwgIytx5jfbMEnRmF
         IV/lZVxgB1bj0r9i5BCCu+YURGMd+HOP7uDbiM2iK0g8wWh3CkpptbDFBgEZVn807rGM
         QFdafi1vjQpEaLRTYLf+B6hvKAjDvVV/tcU856+R15R0qyM2q1in/JRmyo0eMd8bkDkK
         ga5FunFX7h6Jy3bY+L8c/zHKrvU6yorVSqFlMcDaRcJCrfxE8Z0+paSAEtsU7hzxTGMH
         Deiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782330861; x=1782935661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9zi8vt2Jkqw/BXMyJ0QyA2n/KwDWooYawhwWLuXdEns=;
        b=En/SHWdEKhR3sfLppvt35haPdKvTZGmAsD/GsfZxizGOodR4DHW2wB9jEKIKV6GG1V
         uqDZ8WIANJVOxgbzZM2oU2Jo7NC5+oyShjS6oxQ17t1jUTZKHM/WI1RISCYkSInNHyBW
         JBJQp8PkLxErG+DOCYvl653l7Eyq+/xEVstvh2UsoQpGyJFfK0wVqD6KdV8W0fybZVVr
         Gjx7BHg9v2Iq0FVGMiOtNTWmRtd+ydxXfcMx17dxlk59pegyCl4aI/y1yZQI4RSGtdKG
         J+fenmD62p8nXnEdZ0IactvogxRmlkA1drjJjnJvxo5JtZFx+bpF7DcTraSf4hWkBGae
         CaHQ==
X-Gm-Message-State: AOJu0YzbT046cCc46Wo9mdE8S42uJjiWyaTVK30l/wXi4724f9yKCq/z
	Q3wCUYNWmPL3U2bWdLM7PENLVraHj3VZh8ZQl/fatIKz6w6NNGOAwdFfy8s7tQgfzjlSV0Kt5kJ
	br4mBTGO81uwRtzgH4E5JwSSNBanzPC4Lx0iG
X-Gm-Gg: AfdE7ckVEOs3ws5MkKA+ZroW2ZOiUXDJMGIY5d/9uOmLtWlHvtcCDbHcV6Un23lv168
	9Gkr7Ab/TwbZQlU7Gl/z/FkTb/0P+8YRCMLV9CQ3U8YEx19hFGSzyuLxoqFoOkI3cPN/iF+JwaU
	4pQlzIyk39h8fBQps7FnwV2veVnEufvUTyZs39l88lVkiV3falBbg6sac27/1ymqApOhxf0i1wk
	7LZZbiiyGU8HKcF43hu6kjyuAw3ZG7/1+jXn90kxlDhWxKVF1Gu8NCGYV/qCn1CgDK/ydcL
X-Received: by 2002:a05:690e:169e:b0:660:5b90:b426 with SMTP id
 956f58d0204a3-6636e53e726mr4172564d50.46.1782330860995; Wed, 24 Jun 2026
 12:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623175006.3136053-1-ameryhung@gmail.com> <20260623175006.3136053-14-ameryhung@gmail.com>
 <20260623235342.01B1D1F000E9@smtp.kernel.org>
In-Reply-To: <20260623235342.01B1D1F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 24 Jun 2026 12:54:09 -0700
X-Gm-Features: AVVi8CfmwNMUdiauR6BDPeoAXHl3owOZ2zx-8waBBUKlemLLZK7trk5sd6GrhxQ
Message-ID: <CAMB2axMG5W+48gmPHZ=vgg_LT7YwostYT9NboV=J77XBCEOscQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 13/15] libbpf: Support attaching struct_ops to
 a cgroup
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 4:53=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] bpf_map__attach_cgroup_opts() does not verify that the map has B=
PF_F_LINK set before calling bpf_map_update_elem(), leading to unintended g=
lobal registration of the struct_ops map.
> --
>
> commit 4549a23db01bbdf38f2f884251281fc0a75a8c97
> Author: Martin KaFai Lau <martin.lau@kernel.org>
> Subject: Add bpf_map__attach_cgroup_opts() to attach a struct_ops map to =
a cgroup
>
> This commit introduces bpf_map__attach_cgroup_opts() to allow attaching a
> struct_ops map to a cgroup via a BPF link. It also extends
> bpf_prog_query_opts with a type_id field to select the struct_ops type
> during a BPF_STRUCT_OPS query.
>
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index 1368752aa13c..17f8466e33fa 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> [ ... ]
> > @@ -14104,6 +14104,65 @@ struct bpf_link *bpf_map__attach_struct_ops(co=
nst struct bpf_map *map)
> >       return &link->link;
> >  }
> >
> > +struct bpf_link *bpf_map__attach_cgroup_opts(const struct bpf_map *map=
, int cgroup_fd,
> > +                                          const struct bpf_cgroup_opts=
 *opts)
> > +{
> [ ... ]
> > +     link =3D calloc(1, sizeof(*link));
> > +     if (!link)
> > +             return libbpf_err_ptr(-ENOMEM);
> > +
> > +     err =3D bpf_map_update_elem(map->fd, &zero, map->st_ops->kern_vda=
ta, 0);
>
> [Severity: High]
> Does this function need to verify that the map has the BPF_F_LINK flag
> set before calling bpf_map_update_elem()?
>
> If a user passes a struct_ops map without the BPF_F_LINK flag to
> bpf_map__attach_cgroup_opts(), bpf_map_update_elem() will globally
> register the struct_ops.
>
> The subsequent bpf_link_create() call will then fail because
> BPF_STRUCT_OPS links require BPF_F_LINK. This results in the struct_ops
> remaining globally active on the system despite the API returning an erro=
r.
>

Agree. bpf_map__attach_cgroup_opts() does bpf_map_update_elem() before
bpf_link_create(). For a map without BPF_F_LINK that update takes the
non-link path and registers the struct_ops globally, which can't be
undone once the subsequent bpf_link_create() fails. I'll add an
explicit BPF_F_LINK check.

> > +     if (err && err !=3D -EBUSY) {
> > +             free(link);
> > +             return libbpf_err_ptr(err);
> > +     }
> > +
> > +     link->link.detach =3D bpf_link__detach_struct_ops;
> > +
> > +     fd =3D bpf_link_create(map->fd, cgroup_fd, BPF_STRUCT_OPS, &link_=
create_opts);
> > +     if (fd < 0) {
> > +             free(link);
> > +             return libbpf_err_ptr(fd);
> > +     }
> > +
> > +     link->link.fd =3D fd;
> > +     link->map_fd =3D map->fd;
> > +
> > +     return &link->link;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623175006.31=
36053-1-ameryhung@gmail.com?part=3D13
