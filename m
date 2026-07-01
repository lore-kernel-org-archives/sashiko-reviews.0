Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933AE386450
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 22:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782946483; cv=pass; b=UtuIxQP5XlvE1iV6+E3cu0wvsoFzX/uKkoZoUYamhK8G70zqI8TflTBBoUq6/9WlbEfMnqh2tihy7M0CfDR7dka9H9MSUhnzgw0Ttqb7Adz7+GGKYhVwmM7fiq9ODMKO7iszKE5RgA4EJhitEAalSAfa/sRQiJl4dOhpFoTdVRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782946483; c=relaxed/simple;
	bh=YrHz8YZ43CxSfARfvrAgifJB6HE6igo+tpoQ1A+WQNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rh+sxZKWNwqKYj8l27ukG6f9jlXY7AGUfnCTO8AWmT1GWdHsPfTJ0rYeD9jfEpDD45/Ixc3FcdDP97QMm2+ze/yicgGS6WSOTvBE+Ia1CS1wEKMDzMrCaZuTBBf+RgVG5MLgdb+xGX/PVR8GLxq5s2XilyexRjOPLQ/ZT64bFZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ep6sKYNV; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ep6sKYNV"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8f032b47e3cso7405556d6.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 15:54:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782946481; cv=none;
        d=google.com; s=arc-20260327;
        b=XTkWzpLR4p9J2qdAL8nINPnyEHD+tlsOdH+vJRBY5Q0akPzfH5n/fcr10x1S96gqYO
         K9VLhfszbmQMqwVshvFndNsK+XtcqLxJilZkN+2PIdP3rYx4BwNH+nSDHe4bn+QiPWPI
         IfpQsGxzkm2+nn+dIqktgW0IYqKbplWG2bcNfIMGPAp7jCcyoaH1yh7j1ZXhd9FHaBGm
         5O08lhAI1/Fl+SNxCkst9L9LcqZibYMUJ13/bczAc9KutU8gzILO36QLzgB/vdHaPZP9
         1/EqGWglaoRJfM+ZT78EKnhZIGabU2/djfTUJa66/P6cg41Iv7x1KqCqMKpFL8XlROLh
         DzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FdFRIxxhmjTBAY4g/1wOYGYHr9cH8lfvdG8YM/zsTzo=;
        fh=S6DDseF5h3+g4zAU2M40h9tycaIPHDMVdwvfM/5iAnk=;
        b=lBbtackJhkzZ1rp5Zlz+xKLzxhpTkU3rey2dCRDDnz1nrMxP6d2Pt3fi9sTyVjlrX3
         IAPcd9lamFVN9srj+aPbsyp77ErmTvGNvWE6pf1t12TcjCz4YgoQHa/qkHuLx3m4T4je
         6gNMRNDrFDXc+gDSMoAAvE5o1ddvbmIuQLEhJJOcrD36KyiF82SVtTmpQ+QjX+v7cDUV
         c12zkSr9JAdgQmNXxG5E07UBfde8632Q6UCTWrC8MQApaJJf1GS+55JS2fJKNPa+xIQt
         zklSPD3/LCdIYkoAH0Dvcom2VmG2tN25M4+NVSvaIjaKM6g49pMcLULWkz3hkXzGGTsh
         EHAQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782946481; x=1783551281; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdFRIxxhmjTBAY4g/1wOYGYHr9cH8lfvdG8YM/zsTzo=;
        b=ep6sKYNVRuRVesYS8RaV6n9BXwK2UQ5oQanhrSV+LZ0Ducv3IHhIWUMHPC2DnraS8E
         gVQ0VCXJ1fDPUfU3z/iThP12OkaUL6efMVvoMuXzaiNE8EOk8//Szb02CCmMy+svrCgj
         wBWy/ZHkzLK5mvn/Z3jx7HEnRt5e/871Mo27GcYa2xax4d4+6LBcjEF+MijU2Pampcg0
         SR9Xd0LZ5YGxsOS2xihGFxHOAoRMldAYkNmHCk50YWlBTsOpffEnK5JEh1Rv+Iftig0d
         XxqLMw32anXKwAHOTMAmC1FoYxtDLd1bp3d+xRkvGrNYYl4+IeZWMd0c5jFofS1QxPzl
         +v8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782946481; x=1783551281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FdFRIxxhmjTBAY4g/1wOYGYHr9cH8lfvdG8YM/zsTzo=;
        b=duvPimBFoY/qhnc0aPwqvuA6edEkjAqblTL7HrbUaUOcROy3u/ZVYh0eMdnoYybK7c
         4b64x6Zjz2ILpuS4/WnbX/jwTisdz9kUpou47ZBiQWpfSb1nQtyWKLR3nP3Lek+KWcxm
         CmDN26UVEwqH1RCuyDBCXMCx4BUub+Ty8ETqmPMqmO2l6kGATR48H+4POPU+sEjDor3M
         f1UhDIGA45w0y/ks2pg/LOWmKMEIjafTtH1RLCDKWbKGTO2HWrEH6AlXMaqnTdTH4Gnw
         PXiKpnihTu4wTAGFprOB5yagJLHDaylWgieM443dNw9uEGWocpUsDCdoTOOdFnv7IgeW
         LJBw==
X-Gm-Message-State: AOJu0YwIm7mmKfPFJWo7RQiUwxIJ38vWvMZgCeE10sviLnXPc/Jp6hwj
	Ah1fUX0ESJTridaICb5Ylyx2PnLHXyx1GC9Vb9BYrWMvXmwju6APAkHeLqBMm9vNo34wanbYfCI
	22tiLiW+4FJtuaTizWCGar2BhPwHhmZ01wBb3
X-Gm-Gg: AfdE7cnxvf60HlDDYCOsgi3qYJ4V69JyiZPOImLqY/ucHoMmh5dmVr7AM+vRh/I5PSx
	SDGBjY81QxXivDTCSYT/JcQLe4qEzN3iQdsd9fWve76Oo03DlRmYuAVZRFhHn9vW2VlxyeC0Qqv
	TYvoQyaRNZOfG2IacyLkLKIqitoJIsUjfkicjRRzB6Ko8gmjGfaWPKavQf5ZkVl1jv1ZBo1Dn++
	ZAP6gQ7gNyz8mI+qmDpYdj1TkI08gK0fMviFBQ+yfkFStfTxTKYP597CQXMWoT+jSuaPVxBgesV
	t06D1QqgvHMzPS+lOUlWVwp4hy0=
X-Received: by 2002:a05:6214:5703:b0:8c4:edb4:a44a with SMTP id
 6a1803df08f44-8f3c73b6003mr55971746d6.23.1782946481604; Wed, 01 Jul 2026
 15:54:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260630183956.281293-1-dwindsor@gmail.com> <20260630183956.281293-3-dwindsor@gmail.com>
 <20260630185420.96A6B1F000E9@smtp.kernel.org>
In-Reply-To: <20260630185420.96A6B1F000E9@smtp.kernel.org>
From: David Windsor <dwindsor@gmail.com>
Date: Wed, 1 Jul 2026 18:54:29 -0400
X-Gm-Features: AVVi8CfjKMOaPkHqrop8tSk9s7QdUaQXIvtbHpp2DcyirtgW-I3jIDr4KPnWk_s
Message-ID: <CAEXv5_iqNay39fp_2jJjxWUpfzBtfiUgpfo5-TYysrLMGEfNGw@mail.gmail.com>
Subject: Re: [PATCH v4 bpf-next 2/3] bpf: add bpf_init_inode_xattr kfunc for
 atomic inode labeling
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 2:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> [ ... ]
> > @@ -385,6 +463,7 @@ BTF_ID_FLAGS(func, bpf_get_file_xattr, KF_SLEEPABLE=
)
> >  BTF_ID_FLAGS(func, bpf_set_dentry_xattr, KF_SLEEPABLE)
> >  BTF_ID_FLAGS(func, bpf_remove_dentry_xattr, KF_SLEEPABLE)
> >  BTF_ID_FLAGS(func, bpf_real_inode, KF_SLEEPABLE | KF_RET_NULL)
> > +BTF_ID_FLAGS(func, bpf_init_inode_xattr, KF_SLEEPABLE)
>
> [Severity: High]
> Does marking this kfunc as sleepable create a risk of deadlocks?
>
> Since the kfunc is only callable from the inode_init_security hook, marki=
ng
> the hook as sleepable allows BPF programs to trigger page faults
> (e.g., via bpf_copy_from_user). When a file is created (e.g., ext4_create=
),
> the filesystem acquires a transaction handle before invoking the hook. If=
 the
> BPF program triggers a page fault, it will attempt to take mmap_read_lock=
.
>
> Concurrently, another thread doing a write page fault (or mmap/mprotect)
> might acquire mmap_lock and attempt to start a transaction (e.g., in
> ext4_page_mkwrite), which blocks on the transaction handle held by the fi=
rst
> process. This creates an AB-BA deadlock between the filesystem transactio=
n and
> mmap_lock.
>

This is real. We can eliminate the deadlock by removing KF_SLEEPABLE,
which is fine here once we change the single allocation made by this
function to GFP_NOWAIT.


> >  BTF_KFUNCS_END(bpf_fs_kfunc_set_ids)
> >
> >  static int bpf_fs_kfuncs_filter(const struct bpf_prog *prog, u32 kfunc=
_id)
> [ ... ]
> > diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
> > index 564071a92d7d2..1c3f84a924203 100644
> > --- a/kernel/bpf/bpf_lsm.c
> > +++ b/kernel/bpf/bpf_lsm.c
> > @@ -315,6 +315,7 @@ BTF_ID(func, bpf_lsm_inode_create)
> >  BTF_ID(func, bpf_lsm_inode_free_security)
> >  BTF_ID(func, bpf_lsm_inode_getattr)
> >  BTF_ID(func, bpf_lsm_inode_getxattr)
> > +BTF_ID(func, bpf_lsm_inode_init_security)
>
> [Severity: High]
> Is it safe to add bpf_lsm_inode_init_security to the sleepable hooks list=
?
>
> As mentioned above, marking this hook as sleepable permits BPF programs t=
o
> take page faults from within a filesystem transaction, which violates
> filesystem locking rules and can freeze filesystem operations.
>
> >  BTF_ID(func, bpf_lsm_inode_mknod)
> >  BTF_ID(func, bpf_lsm_inode_need_killpriv)
> >  BTF_ID(func, bpf_lsm_inode_post_setxattr)
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630183956.28=
1293-1-dwindsor@gmail.com?part=3D2
