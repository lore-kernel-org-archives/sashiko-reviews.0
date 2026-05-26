Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E72421896
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 17:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818054; cv=pass; b=AjrMGWkvxbEo6pBJ/3WzJG5IELYXLURf10pVITZaJv6TMB5s7Eb3AjhcSOjJgIp0J2PLy53s+qBtBHS8fvcR+O/Jv03NhYxNPeFPcmlfTnf5MA7tHvrKKIr5i5KLuAInF8/GE+aRaK36yfFipdgB1XoUTaee5mORunAR3FurU8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818054; c=relaxed/simple;
	bh=mo51nLE6P1wJoADFxd9GxwL23mh9JvgaYmz4OryT76M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDxvzDqYAteghVjeP5vys+zfg2xOYOR1KoMH3aWGnGp6yBO6VOz9eBD/K6pXGVXOmyRD6a6cR4SHhLjUHJ1pjRqS1gHaV7/QYVI4sXtDQMZxxePz0GCFKKO4aTnwwNN7ctDh4kcTkO0QjqB8aW7jkNCwftfGMPqrWHkZ11xKi6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l2MA4qNH; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l2MA4qNH"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-7c0de780bf1so92939397b3.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 10:54:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779818051; cv=none;
        d=google.com; s=arc-20240605;
        b=fDkrWnAwWomv8jE2AoI4M0ZgMK8q3YZsRuDiQic03IzBLdGLFeYH9erA1Mzj8MB+5i
         febCkGLiy1bD2tZVhoPJFH18rgh7k1HnqyX3F+gsAWpcKs09pnXcKoj6nHvjdfcYkGE8
         kXYQs4hDtgsEOnTGlW20VZxWFLKYu9Kr6Ae7teD9SNp1JNAQ350IdPMunZve3cvlgGzj
         PByR5vCwfgZZ07hg8ZrfhvJlUsbgrPi4IxjYINJ9+W6/WFmqKfCHXnSO93OraJweSvq0
         EFHSLLhSlv1EPoeRpU+KufA71EvsbcptsAjSYTtbPHKZsnouislR4jnxmcgFXbxvZDkW
         f2sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aLSY4XkeDLqds8/zCxtUpFNC/XRt0rRFn6Ll8whM7pc=;
        fh=IHoi2ePnp3QxbSquT4jfrj4BvruY2jAvEeD9KGDE+lE=;
        b=XpoFkFr3UkJNPXsKkU+rQuAV9OTg5ZGjLoIXp4rwY/al1UglrCJRNUbtO2g3Tzb+tm
         +TXznnYk1z12QqtpSNrHyUhVQQg55jmE47QX1gOIUyWyJqmhzG5kS5lcfQsdJrUPi9sq
         tFrM+ndgopwtsHi9Wd9leNQ3P+dm21G7LhsDxFvBHTn2N1h5lHoP2KFDgKqd7c+0stvQ
         US2w+ZPGP2r6sm46ZFIaBW87YzlupA69PrV5d0Xp4S2lg/nDJQ2kR29udIcVoh27EInQ
         bXDM5DctxK4rVYqmXDTWXho46+wrUQU+14fwtIkRiLkZWBwWf1bTooGdvzDEVMD0dVeA
         XDtQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779818051; x=1780422851; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLSY4XkeDLqds8/zCxtUpFNC/XRt0rRFn6Ll8whM7pc=;
        b=l2MA4qNHJrfjbsJ03T0BeEZLs9qXDRsiANHRZ0kLG8P8whROhj6DsJ7mRWdrw3O94r
         o9P8dCUrSrEu5HpepKhpb4D6p6zRjkVIhQaIt8W7d8ydAXfCNUktZk+G5clDT9I3ANPN
         K0/kdKx0YEBAG9HmSq8mx9iNeCnjvAIJirhpaL3x+boGCqRivwaJratNSmWbSO1inqP1
         WJXhg0qkQgNOezSQ4nmZSAbaYGFQl1Q6Cm1qGO6+DwxxLDcOwuM0CvdOzzghsiDao9p+
         yC63WhPT4Ckjm7XUNzUlqn9yVQvSlDxs0hieKphm/Kdvq3i4Tb77x+HzhK1VCgy2ZxuB
         9LFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818051; x=1780422851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aLSY4XkeDLqds8/zCxtUpFNC/XRt0rRFn6Ll8whM7pc=;
        b=JnXSnRsnyFmU58RoxFmrEeGx16AzS69ZCi+SqD2A0yCXwc4Mzzjfqap9WghVL4ZQmu
         K2gApiJBh2SLPHxbRMa6fJSW2Af8sgeuYdXKMdNsrk7KR4D03tpU/V/MjOn1X7VBS+n4
         X0CGEGdgt0FVwFnv+TmYD2cR07z0PLkLG5etrEkQnj87dn1ZmWfw0iEefLzJ1M9B6Ox9
         clDEa4NL7B0uJTtxoMUOedHxGYe/UIVVO8CI0Tj+rh1v6dWTW+rfpd1ML6uUVM7vzTvN
         KjR8QFF97LbRXVeGH1ShoYV0epxno8S6nhhH2W81PtH3BUOUVap9tbXUXa5MGrqRV0nh
         Trvg==
X-Gm-Message-State: AOJu0YzRVusyRP78O0/foXroM8w8AAGiPiJFBbTLoGd+zj0z+qdtnAZt
	mpzBId+ix52UbNkydvJxlwfNeKrCNXs8+Yl3R+uHk/0bMKLTN86Zr9jP4nFs3LX0yN3fpS5UecO
	umlxrXmjTqPf5uw58LS+r5GM2MrufZWs=
X-Gm-Gg: Acq92OH0tPF07yKn5Eg8TDY71G7moJXFXcT6Nvk7moalVgOTu1F9JCurT/1INBcl1e2
	z3JOkr3zbb7XsKtq70582LVGKQNNEkMzEE664CGSmGEov559ZIioMQ+nhfkgaz68Qc3IwkalOCa
	Ym+x14lEUDKIVjjBvCqH6adh+9x5r9nd91rUmolwOat+4PUy7wdk+JgAO84nAJMa4GY7GFjrCeE
	JuDQ75zhBdLXAqQ1SxhB5jHjaN2LTuKc0TAGEL4Lcwlu0N6b7xL/CogbWnDYpG4QAkcZV3aH0lH
	LKUapTdkHGI7wmoM7dmz7jnxSLg+LEzuhw==
X-Received: by 2002:a05:690c:2608:b0:79f:b903:88c4 with SMTP id
 00721157ae682-7d33b348725mr203522267b3.46.1779818051399; Tue, 26 May 2026
 10:54:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260519215841.2984970-10-martin.lau@linux.dev>
 <20260519225002.986EB1F00893@smtp.kernel.org> <2026519225454.By6y.martin.lau@linux.dev>
In-Reply-To: <2026519225454.By6y.martin.lau@linux.dev>
From: Amery Hung <ameryhung@gmail.com>
Date: Tue, 26 May 2026 10:54:00 -0700
X-Gm-Features: AVHnY4KQI0xvn76Ojfwqn5BJzEfVnS3IaHKSZ2mEix5eW3t_R7baX6yhDJhmSvc
Message-ID: <CAMB2axPDDom8sD7u+2Fgo9dZO1ereX-unai8EW1SmsiDrnzzwQ@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 09/12] bpf: Add infrastructure to support
 attaching struct_ops to cgroups
To: Martin KaFai Lau <martin.lau@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 4:58=E2=80=AFPM Martin KaFai Lau <martin.lau@linux.=
dev> wrote:
>
> On Tue, May 19, 2026 at 10:50:02PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 4 potential is=
sue(s) to consider:
> > - [High] bpf_cgroup_struct_ops_foreach does not skip dummy items, leadi=
ng to unintended execution of cfi_stubs.
> > - [High] Using a loadable module's cfi_stubs as a dummy sentinel causes=
 a Use-After-Free when the module is unloaded and reloaded.
> > - [Medium] The macro bpf_cgroup_struct_ops_foreach uses rcu_dereference=
(), which is incompatible with sleepable struct_ops programs.
> > - [Medium] cgroup_bpf_struct_ops_register() lacks concurrency protectio=
n and global uniqueness enforcement.
> > --
> >
> > commit bad29e4e0d1357905491993ee45063766d0f7705
> > Author: Martin KaFai Lau <martin.lau@kernel.org>
> >
> > bpf: Add infrastructure to support attaching struct_ops to cgroups
> >
> > This patch adds necessary infrastructure to attach a struct_ops
> > map to a cgroup. The initial need was to support migrating
> > the legacy BPF_PROG_TYPE_SOCK_OPS to a struct_ops.
> >
> > > diff --git a/include/linux/bpf-cgroup.h b/include/linux/bpf-cgroup.h
> > > index b2e79c2b41d51..8080f4a5c14b6 100644
> > > --- a/include/linux/bpf-cgroup.h
> > > +++ b/include/linux/bpf-cgroup.h
> >
> > [ ... ]
> >
> > > @@ -110,6 +112,18 @@ struct bpf_prog_list {
> > >     u32 flags;
> > >  };
> > >
> > > +#define bpf_cgroup_struct_ops_foreach(var, item, cgrp, atype)       =
       \
> > > +   for (item =3D rcu_dereference((cgrp)->bpf.effective[atype])->item=
s;\
> > > +        ((var) =3D READ_ONCE(item->kdata));                         =
 \
> > > +        item++)
> >
> > [Severity: High]
> > Does this macro need to skip dummy sentinel items?
> >
> > In cgroups with BPF_F_ALLOW_MULTI, compute_effective_progs() inserts du=
mmy
> > sentinel items at the boundaries between cgroup levels. For struct_ops,=
 this
> > dummy is the cfi_stubs pointer.
> >
> > This macro appears to iterate over all non-NULL items and fails to skip=
 the
> > dummy sentinel, which could cause the subsystem to repeatedly yield the
> > cfi_stubs pointer as a valid attached struct_ops instance.
>
> The ops in the cfi_stubs is safe to be called. It intentionally skips
> checking for dummy in the fast path.
>
> >
> > [Severity: Medium]
> > Will this rcu_dereference() trigger Lockdep warnings for sleepable stru=
ct_ops
> > programs?
> >
> > The commit message mentions adding free_after_mult_rcu_gp to support a =
mix of
> > sleepable and non-sleepable struct_ops, but plain rcu_dereference() enf=
orces
> > rcu_read_lock_held().
> >
> > If a subsystem iterates the array while holding rcu_read_lock_trace()
> > (required for sleepable execution), this might trigger a 'suspicious
> > rcu_dereference_check() usage' warning. Conversely, if it holds
> > rcu_read_lock(), the struct_ops program cannot sleep without causing a =
panic.
>
> The proposed bpf_tcp_ops only has non-sleepable programs.
>
> The future sleepable callsite will need another version of foreach or
> rcu_dereference_check can be used here also. I think rcu_dereference_chec=
k
> is better.
>
> >
> > > +
> > > +static inline bool cgroup_bpf_is_struct_ops_atype(enum cgroup_bpf_at=
tach_type atype)
> > > +{
> >
> > [ ... ]
> >
> > > diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
> > > index a033aa479ab6e..d496db48d2b86 100644
> > > --- a/kernel/bpf/cgroup.c
> > > +++ b/kernel/bpf/cgroup.c
> > > @@ -24,6 +24,29 @@
> > >  DEFINE_STATIC_KEY_ARRAY_FALSE(cgroup_bpf_enabled_key, MAX_CGROUP_BPF=
_ATTACH_TYPE);
> > >  EXPORT_SYMBOL(cgroup_bpf_enabled_key);
> > >
> > > +static u32 struct_ops_type_id[MAX_CGROUP_BPF_ATTACH_TYPE];
> > > +static void *struct_ops_cfi_stubs[MAX_CGROUP_BPF_ATTACH_TYPE];
> > > +static bool struct_ops_mult_rcu[MAX_CGROUP_BPF_ATTACH_TYPE];
> > > +
> > > +void cgroup_bpf_struct_ops_register(int atype, u32 type_id, void *cf=
i_stubs, bool mult_rcu)
> > > +{
> > > +   struct_ops_type_id[atype] =3D type_id;
> > > +   struct_ops_cfi_stubs[atype] =3D cfi_stubs;
> > > +   struct_ops_mult_rcu[atype] =3D mult_rcu;
> > > +}
> >
> > [Severity: Medium]
> > Does this registration function need concurrency protection to prevent =
global
> > array corruption?
> >
> > If two modules are loaded concurrently and declare the same cgroup_atyp=
e, it
> > seems this could cause a data race or silently overwrite the registered=
 type_id
> > and cfi_stubs of a legitimate module.
>
> This will be a bug in the subsystems having the same cgroup_atype
>
> but (the next one)...
>
> >
> > > +
> > > +static enum cgroup_bpf_attach_type find_atype_by_struct_ops_id(u32 t=
ype_id)
> >
> > [ ... ]
> >
> > >  static void *bpf_cgroup_array_dummy(enum cgroup_bpf_attach_type atyp=
e)
> > >  {
> > > +   if (cgroup_bpf_is_struct_ops_atype(atype))
> > > +           return struct_ops_cfi_stubs[atype];
> > >     return bpf_prog_dummy();
> > >  }
> >
> > [Severity: High]
> > Can using a loadable module's cfi_stubs as a dummy sentinel cause a
> > use-after-free when the module is unloaded and reloaded?
> >
> > If all maps are detached, the module providing the struct_ops can be un=
loaded,
> > and its cfi_stubs memory freed. However, the cgroup's effective array m=
ight
> > still retain the dangling pointer to the freed cfi_stubs if BPF_F_ALLOW=
_MULTI
> > was set.
> >
> > If the module is reloaded, cgroup_bpf_struct_ops_register() updates
> > struct_ops_cfi_stubs[atype] with a new pointer. If a user then queries =
the
> > cgroup via BPF_PROG_QUERY, the loop checks
> > item->prog =3D=3D bpf_cgroup_array_dummy(atype) to skip the dummy. Sinc=
e the
> > array contains the old freed pointer, it won't match the new cfi_stubs
> > pointer, and the query loop might mistakenly treat the old dummy as a v=
alid
> > map, causing a use-after-free when calling bpf_struct_ops_kdata_map_id(=
).
>
> Agree. This will be an issue on BPF_PROG_QUERY when the module reload.
> I did think about the module reload case but I have only considered the
> rcu-reader in bpf_cgroup_struct_ops_foreach.
> BPF_PROG_QUERY does not use rcu_read_lock and depends on cgroup_lock.
> This will need to be addressed.
>

Also thinking of the potential problems of leaving dangling cfi_stubs,
but I don't see any other cases.

In this instance, it seems adding a cgroup_bpf_enabled() guard in
__cgroup_bpf_query should be enough. The dangling cfi_stubs will not
be cleared until update_effective_progs(), which happens during the
first struct_ops map attachment. cgroup_bpf_enabled() will be false
until a struct_ops map is attached.
