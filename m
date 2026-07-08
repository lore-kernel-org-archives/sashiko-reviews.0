Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912311A6815
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 00:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783470681; cv=pass; b=tLS+5GuXlfq9DHEyIN3nUqCOsAlSk6Hu0JdkwjRaeESe7N018TC5nk52BkLiEMVo0n/+V6xii8G8LZB+5Qwm5WDqfjwDB8OsK0uzbCg3XBjEGtA/NgwK3zP1T+N7ZHwaxY/xXizNoFbrdvXK3WK8YHCS2ukqPz0u2ydGzRsk1zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783470681; c=relaxed/simple;
	bh=3GQy5XeGx5dlqKdbk+YAzFV9pAUtw+CAm7QkZ9oa7K4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Usi5wTw5GvPp5jEdnE73F+2ak/DLU0s0B23yaEez9fb65d8aNtdrS00eK5Vw6zqqYw+egi4bKUh+RaHUNcFIxYd9Lg5taP2fFB1C6OmdlipuneU2IOGutsqQnzVtZ8dN6akt0lo+bkyOh+pBSjULB4/+9y8ZmNOXwk36XXUU49Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYAam36L; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYAam36L"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ef1dc934d1so881476d6.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 17:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783470678; cv=none;
        d=google.com; s=arc-20260327;
        b=rewGWFoDiY4mO/IlgFgm4+E0zdMOWYhL1f05ZBI80xzmx6xc+qrC9e3w0kexxnr2qD
         3yf54d0vLIwr85NqoMhq6RFtyrNsfGMK7G6+wlCOGA5tzeEkDtppFl2HwWcESkXGvwVP
         kImhGxolESBM+gNZSmrVmBt/1kz/qucBQwRMfyVIKHGbYCdLqtprhaI0sHxftd/BEu61
         mIhRs3uw72fwoLhhk9e8IH9FGhR4MJ67gCr7FSWDB2yY6ZCk774ctMX/lyI0tJqKFiCI
         U5HCzD8G/jgsDb73+4RH9arN9uxZdQuH1ZJY3Rl0vqDlCB4CoeHWD1iDRCaLQNGUJKgv
         RUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7NuRayk8ACZHpU4jrCHbSE1b606laboR4aTU0FVg8Pw=;
        fh=9j3xEhedVJ77Wa0UZQAuaY8jliRZyL1ov+bfsPPad/Y=;
        b=QoyNsXvwwH31iHGU24kuS5Bh7OppQ2jPSkPGc0z12otyRgNjerSCXKkOrF8y5EqCzr
         nuoH2zIxRtLFkguY06qpAqsca5i6u+UdaR4d9RaIOt8yd0UmOxV7kAsBdqD+qJYXrPbE
         VaU2nsz6oFjcS7tGv0Dz9kh77I3ClD+aW5w7kN2u3VH5xok0bHcQcxcepKNSEXuuuyny
         BlbepCctkxlN4CyRA1+nu6AGhxiubQU8SuXMUfnj8T2Z+4pIc3ylaAHWy134y0VniG6E
         /kvg79kITJ6/CbH4Hkdrl8SJp1leX0BXYC0z6xwgEjQ/r4Ap/LvszYMr2+/SGzb+H5nZ
         2AZA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783470678; x=1784075478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NuRayk8ACZHpU4jrCHbSE1b606laboR4aTU0FVg8Pw=;
        b=mYAam36LL5jWDc4dPKE3VAU9434CmyLhsWZ1VxJVlwYMOr9RpDdPkoNk5SpuWQx0KV
         f2K3kM/I4MIttzZ/xDRmkohN4PjKftWtMUA8cyzvoECZZUMNGsnb0fXHsI/r/Sp/pe03
         lo30lTsR/ntHi4g9Pn8Caa/TLH965Q35CyPCfyf5jEY0deafeIOQEcyaXGBgDrmbjcu4
         CPi3jzHkw0G2fBCK1L40W+O5MudYro437ZwmGRIQzOmOggcoJVy3To8fEXjseOUUZqbS
         lESBqncX/amrQjK6/4LFxobqpY5yAB7k98UgHtZF3WIrA3ZZtkLSWrXvpB96OaAk0QqM
         +DLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783470678; x=1784075478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7NuRayk8ACZHpU4jrCHbSE1b606laboR4aTU0FVg8Pw=;
        b=NsFFEpOmr4u3fIiNhNGtG5FyYYXD24D49tlFxFjuCzbWQjlxx09rmTPYgWJ1JNBuGU
         2cLMjzGBSdX8FkkFYMZn7ehAW8F+3y/4WCqFi1BGUcY93F8MM5m9eBysCPwRIHA0guF4
         meLcL/Q11bsg1S8gmexhAaLq6mdlf3DCi6/kDE5EPm8Q6OtSnOsVtCIdGyxWIgFBpju1
         Cn6dGiV8I5faTGanVsxnv6hkY8jt8DoAFY/EPGxXawEyNCmZsHYJn/zoNcyshO6+de13
         GH1Ofr0/NhJhmB9o+bKDN1Sx7M0EsIb84ITNtuyuhnfNxroyAv4w00nIqQi8fRgONd6P
         LwEw==
X-Gm-Message-State: AOJu0YxJSJno9lnVDbJ5ADv5wj5Tg0iT0dDDF4b3KLjrMSD6NWxet0Zc
	HTlW+/TH2tqZ3LvVV2g20KqiIhTeMmgOtVqSXFJt+3hfGu71f2QnK1DUSEYVJzmPgVoU64miwS2
	JFZpx3G/a+AeaSVLJp+FVs7np4cVpx9bQhx6j+Pg=
X-Gm-Gg: AfdE7ck8LMINCsvNJPIEqYB9nFxu7jB0nONXx26Uaov4ysEUsQkZu71FmiiBA9OLjjx
	Ne8etx9cfu0J/GLifD9G7A8gqlyUlPBiwUWF5XhLKNnDo7C2O9Vgp1j0R7RxsQEIaB0kEkMK61M
	Oib1gmzkB1i8mz639dDMZCXzBJ5M0q1kAzZPtAZfIF2QpbNrq4fGaaAhKILnFaLytB9zx9ms6dS
	j6DRZbSE5aFUkLXdlwaLO536uX35brSwSN1WoLg++zbHJXiolZPrwLGZO3g0I5LYtieEDfZbq9/
	L6h59dCcP1Vmw+kq9DnuDfShvDA=
X-Received: by 2002:a05:6214:554a:b0:8ef:8533:9651 with SMTP id
 6a1803df08f44-8fd3d111ae4mr65102316d6.36.1783470678614; Tue, 07 Jul 2026
 17:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260708000956.46138-1-dwindsor@gmail.com> <20260708000956.46138-2-dwindsor@gmail.com>
 <20260708002030.53D9A1F000E9@smtp.kernel.org>
In-Reply-To: <20260708002030.53D9A1F000E9@smtp.kernel.org>
From: David Windsor <dwindsor@gmail.com>
Date: Tue, 7 Jul 2026 20:31:07 -0400
X-Gm-Features: AVVi8Cfeu7iTLKV4sdczNvssWGTRJZ9W34OAQImna28tK2X9fG0WUboNzUfP1yk
Message-ID: <CAEXv5_hyXHEKTfFCb9sSi=Z6B3W-PEue=x07sh_-Y56M7V=esA@mail.gmail.com>
Subject: Re: [PATCH v5 bpf-next 1/3] security: rework inode_init_security
 xattr handling
To: sashiko-reviews@lists.linux.dev
Cc: selinux@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 8:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Heap buffer overflow in `security_lsmxattr_add()` due to xattr q=
uota bypass by BPF programs.
> - [Medium] `security_lsmxattr_add()` incorrectly returns `-EINVAL` instea=
d of `-EOPNOTSUPP` when the xattr array is not allocated.
> --
>
> --- Patch [1]: [PATCH v5 bpf-next 1/3] security: rework inode_init_securi=
ty xattr handling ---
> commit 871b3020e8c69372708886992716ee08d2e36bc2
> Author: David Windsor <dwindsor@gmail.com>
>
> security: rework inode_init_security xattr handling
>
> In preparation for bpf_init_inode_xattr(), a kfunc that lets bpf LSM
> programs atomically label new inodes, rework how inode_init_security
> xattrs are managed.
>
> > diff --git a/security/security.c b/security/security.c
> > --- a/security/security.c
> > +++ b/security/security.c
>
> [ ... ]
>
> > +/**
> > + * security_lsmxattr_add() - Add an xattr during inode_init_security
> > + * @xattrs: xattr state shared by inode_init_security hooks
> > + * @lsm_id: LSM_ID_* value identifying the calling LSM
> > + * @name: xattr name suffix
> > + * @value: xattr value
> > + * @value_len: length of @value
> > + *
> > + * Claim an xattr slot in @xattrs on behalf of the LSM identified by
> > + * @lsm_id and fill it with a copy of @name and @value. Callers can in=
voke
> > + * this function from non-sleepable context.
> > + *
> > + * Return: Returns 0 on success, -ENOSPC if the calling LSM's slot bud=
get
> > + *         is exhausted, negative values on other errors.
> > + */
> > +int security_lsmxattr_add(struct lsm_xattrs *xattrs, u64 lsm_id,
> > +                       const char *name, const void *value,
> > +                       size_t value_len)
> > +{
> > +     struct xattr *xattr;
> > +     void *xattr_value;
> > +     size_t name_len;
> > +
> > +     if (!xattrs || !xattrs->xattrs || !name || !value)
> > +             return -EINVAL;
>
> [Severity: Medium]
> Should this return -EOPNOTSUPP instead of -EINVAL when the xattrs array
> is not allocated?
>
> During file creation on filesystems without xattr support,
> security_inode_init_security() is called with initxattrs =3D=3D NULL,
> deliberately leaving xattrs.xattrs unallocated.
>
> If a BPF program then calls security_lsmxattr_add(), it will receive
> -EINVAL. If the BPF program propagates this error, it will abort the
> inode creation entirely because security_inode_init_security() only
> treats -EOPNOTSUPP as a graceful fallback.
>
> > +
> > +     name_len =3D strlen(name);
> > +     if (name_len =3D=3D 0 || name_len > XATTR_NAME_MAX)
> > +             return -EINVAL;
> > +     if (value_len =3D=3D 0 || value_len > XATTR_SIZE_MAX)
> > +             return -EINVAL;
> > +
> > +     switch (lsm_id) {
> > +#ifdef CONFIG_BPF_LSM
> > +     case LSM_ID_BPF:
> > +             if (lsm_xattrs_used(xattrs, XATTR_BPF_LSM_SUFFIX) >=3D
> > +                 BPF_LSM_INODE_INIT_XATTRS)
> > +                     return -ENOSPC;
>
> [Severity: High]
> Can this limit check be bypassed, leading to a heap buffer overflow?
>
> If a BPF program repeatedly calls security_lsmxattr_add() with a name
> that does not begin with XATTR_BPF_LSM_SUFFIX, lsm_xattrs_used() will
> not count them.
>

Sorry, all paths to calling this function are guaranteed to have
XATTR_BPF_LSM_SUFFIX.

> This allows bypassing the BPF_LSM_INODE_INIT_XATTRS limit. Since
> lsm_get_xattr_slot() does not check against the actual allocated heap
> size, it will increment ctx->xattr_count and return out-of-bounds
> pointers:
>
> include/linux/lsm_hooks.h:lsm_get_xattr_slot() {
>     ...
>     return &ctx->xattrs[ctx->xattr_count++];
> }
>
> Could this cause out-of-bounds writes when assigning xattr->value and
> xattr->name further down in this function?
>
> > +             break;
> > +#endif /* CONFIG_BPF_LSM */
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* Combine xattr value + name into one allocation. */
> > +     xattr_value =3D kmalloc(value_len + name_len + 1, GFP_NOWAIT);
> > +     if (!xattr_value)
> > +             return -ENOMEM;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708000956.46=
138-1-dwindsor@gmail.com?part=3D1
