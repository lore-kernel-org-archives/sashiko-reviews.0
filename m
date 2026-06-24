Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD2351C34
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 17:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782321884; cv=pass; b=px1myTWm59kHPD6l1bUSMffMInupWGErK2oP/e5fk/2ZoEEQ2xhK6kqBL3szLTAllK/MXv2T9HiVrA0uyFR9WLwlPhXa5fS1gDj8vYKkrBW4Pb6yGvUEuE8MSH8xfhqiEsHueOY5c7mDI+7LlHgGWBRuRB/I0XwKiRTPZj/C800=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782321884; c=relaxed/simple;
	bh=CgaZvZGY4e/EKVwuFfxFMZAVMcCg1E+jJOW3/B10q0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8bWnB4zSmPjN5kPqNgJ8RtUa1VWcRxfZiVUc6B6GvEQ02dUdEzzhkAvJyxh3gd4nDW3cVnUoyffoKEUNK07huhhozLb2Y3jxA5a31xkn2ffmv+1ZH6s6oALVFEAzSwM9+9CtWajYJXD6MqsoRZnTxWhqG2lYASwgIE6RDSSHcE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bWkECmb3; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bWkECmb3"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-662bb8b1f93so1380876d50.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 10:24:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782321881; cv=none;
        d=google.com; s=arc-20240605;
        b=lZGINCvbor1giuZsW3qLOeva12gpBwAFTbNcyoRxxptAChD1QQstw1RsfxW5/ZRubt
         M8D4eC9uKUauzXo67XKWQ8S7k8C28lJPIZqCIlvLRSTk5ZwB+2dj62IeBalFwVwV0LE3
         bjZTSpk+SLVvzORjdlWWODZ0JcsCkNz9u5OXJRVQ8p1ETPVr3tAhL3DpuRAj1O3VpH4w
         z6fAFrYOgdDuPFeJUVQY6h3+pSv3gj0ql8plmWra1AJpnd/EN9HKrRcH9xbsMLcWSMUj
         9kGzaJCj0oDU5mDExubtyOv950VdM3pMEKQnWMfIaAGjJaGeU5KsjTpfus3IssbHjwYS
         TeqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E1wkuHZkbsib5kIV/a5Yk3B4Y1qMn1xPyrOQ/gPCTXM=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=jdE+8V8NXN4nYbpXUUiZ3t7e7845F/C97TCBmHNEKHeVRCjhi/iEnXJIGDV7tXl6OT
         rhU0tatTLDx7boGGZyxNK9aR3BWwZlP38xTlg4zkPt6hTw+ACezhcivZSy9XPmI7nbNm
         gui/SDp7A6wdXJQ0NQtUhzCn7k9dajBqGi7f3CuS40q6CYgVw38n+yz99L1c+ZPKfjaN
         n8vpqli+4MY7TExxbYh0wqrYtr3Mgd8FfZ3P6SU4VGICjsFwBw6PJOfzjruKOdY+jkK/
         1684FxYoOE58mnJUKasd8cpeBLI+Vgq7mXG2MbRoXbopPQIwF8hJuVnKnhBdrur5OUqi
         846Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782321881; x=1782926681; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E1wkuHZkbsib5kIV/a5Yk3B4Y1qMn1xPyrOQ/gPCTXM=;
        b=bWkECmb32rznqNSFLdrvTf1ERC1KNCdt8HHZnC1UagvmUiMVeBT8KDgqas4E35gFIP
         Nq180inft2ErfPinTb2OxKI9ZrsMkridel/X0xuSCbOrHY5mXDytY8gkC7P35ScCztCC
         Vcdxihn97smlIg7oKsgrYI5lSmxzFDQjOePv0SybEmMjnXi9s2dyAeGlrIKqVQTz7PSd
         qSGPchLPLfS07mlWUrNCe4s6UPviwNY+H37SWKycrgn/dLKQmGK238hoasC7BldGOj7e
         JGCyqWvtbnYq4at9YBjVNfIPz+/33KOsVvlFSXtEK/znv8sKV+mp/TkraRBipFu/Mg+N
         NJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782321881; x=1782926681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E1wkuHZkbsib5kIV/a5Yk3B4Y1qMn1xPyrOQ/gPCTXM=;
        b=Ltw4mbHIH33vUqxhE8WAp3lHqX2cvNooDQBIZV4RceJvXJz/aWumxs4evwkHbWbkP2
         grHWuA2O/6oC4ZXWILBNw5FOLZLVsN45dBQPw4VLgNDeuGVKizzSBx3WcBKnsZqx3DXn
         m6irqlzi7Vpa7IhIE0nFb0yhKZfrsqhWoSW5iDbxuepfjyuydK59fYOTMY0FiUglsj17
         qhlZj+e8FTAeoIET11iMUIhXJ3O+nSVGMpycyU3usDMiUqCrfjSUVkKRqz4Ia7Vsb6pN
         8ey6m23bImrQEcm37aCDW1HOaLX1d7UR/3tfSqDnUXfEAeNs3xeWqNCBBZ+snrVtvVP4
         wq9A==
X-Gm-Message-State: AOJu0Yz1+D5gebBH7s8UOXckii1vqkx9dh1yXUddf1bTAUfh7tpKNpta
	sB7N3ZupL6050fKW7r93Djjww2MjLmlBt7dgwse+SkdT2q1dMPfl0zcOqjTHc+oo57uCDFAfXGd
	iuHLEEDh1BqNHAgyorpQZLxwtmpKUAP1BgwgI
X-Gm-Gg: AfdE7cl+PQmyWwRuf97dHPLpz45gdsH3kjehBugYA1afgg6X+AkfqQicvwKPKgbGe6e
	O6QAQ4Y0l71w27gfC3Z0JTjVi1aXdzC6Kyrrx9nr72vgYgFfIr2lciRtauqt6G30YVY5JJVuf4F
	Cf8aK2jnU8miL3yOi1h9wKIyGtDkeKGpQ1ZUvsU97+KGo0z7bZ/MiTwGISgVRpZ++b1zpQZA/tX
	qlr5LZStqc+OhR8BQpCtgZyieIm+xibd3R352YhG3ukilo+B6UXORUASKTkvDP0F1plU3ZV
X-Received: by 2002:a05:690e:130d:b0:65c:2208:8c6a with SMTP id
 956f58d0204a3-6635a305368mr7227481d50.42.1782321881331; Wed, 24 Jun 2026
 10:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260623175006.3136053-1-ameryhung@gmail.com> <20260623175006.3136053-10-ameryhung@gmail.com>
 <20260623225359.77EE31F00A3A@smtp.kernel.org>
In-Reply-To: <20260623225359.77EE31F00A3A@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Wed, 24 Jun 2026 10:24:30 -0700
X-Gm-Features: AVVi8CfocQt9hWr32v2QEQ80f9bKIfkVHJv2cXBIKPpLa-2WNtpQNV5_4ic1_XQ
Message-ID: <CAMB2axMA9GuQDitxDQiirPDD3pbw2z1U=pM2P+=8hm_WF8HJWg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 09/15] bpf: Add infrastructure to support
 attaching struct_ops to cgroups
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 3:54=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The `bpf_cgroup_struct_ops_foreach` macro does not filter out du=
mmy sentinel elements, leading to type confusion and kernel panics.
> - [High] Strict `rcu_dereference()` in `bpf_cgroup_struct_ops_foreach` ca=
uses lockdep splats or panics for sleepable struct_ops.
> - [High] Array truncation during `purge_effective_progs` if the struct_op=
s type was registered without `cfi_stubs`.
>
> Pre-existing issues:
> - [High] `bpf_cgroup_array_copy_to_user()` incorrectly returns -ENOSPC wh=
en trailing dummy elements exist, breaking userspace queries.
> --
>
> commit a3bccbe6dc639128f470580a5e6281248194eb4e
> Author: Martin KaFai Lau <martin.lau@kernel.org>
>
> bpf: Add infrastructure to support attaching struct_ops to cgroups
>
> This patch adds necessary infrastructure to attach a struct_ops map to a
> cgroup. It reuses existing cgroup bpf structures and logic to handle the
> attachment, hierarchy, and ordering of struct_ops maps. It also implement=
s
> a separate struct bpf_link_ops for cgroup's struct_ops link.
>
> > diff --git a/include/linux/bpf-cgroup.h b/include/linux/bpf-cgroup.h
> > index 4d0cc65976a14..8a75a6cd73096 100644
> > --- a/include/linux/bpf-cgroup.h
> > +++ b/include/linux/bpf-cgroup.h
> > @@ -110,6 +112,18 @@ struct bpf_prog_list {
> >       u32 flags;
> >  };
> >
> > +#define bpf_cgroup_struct_ops_foreach(var, item, cgrp, atype)         =
       \
> > +     for (item =3D rcu_dereference((cgrp)->bpf.effective[atype])->item=
s;\
> > +          ((var) =3D READ_ONCE(item->kdata));                         =
 \
> > +          item++)
>
> [Severity: High]
> Does this macro fail to filter out dummy sentinel elements?
>
> When update_effective_progs() fails under memory pressure, the kernel fal=
ls
> back to purge_effective_progs(), which overwrites the detached link's poi=
nter
> with a dummy sentinel value (struct_ops_cfi_stubs[atype]).
>
> Since the macro yields every non-NULL element to the caller subsystem,
> including these dummy sentinels, could this cause type confusion and kern=
el
> panics if the subsystem accesses data fields on the dummy struct?
>

Already replied in v1. Short version here again: cfi_stubs are used as
dummy struct_ops. They are safe to call and not filtered out for
performance reasons.

> [Severity: High]
> Will this strict rcu_dereference() cause lockdep splats or panics for
> sleepable struct_ops?
>
> The patch introduces free_after_mult_rcu_gp to support sleepable struct_o=
ps,
> meaning a subsystem executing a sleepable bpf program must hold
> rcu_read_lock_trace() instead of the standard rcu_read_lock(). However,
> rcu_dereference() rigidly enforces that rcu_read_lock() is held.
>
> If the subsystem holds rcu_read_lock_trace(), lockdep will splat, and if
> it erroneously holds rcu_read_lock(), the kernel will crash when the
> sleepable bpf program actually sleeps.
>
> Should this use rcu_dereference_check() or similar to accommodate sleepab=
le
> contexts?
>

Already replied in v1. The macro is only intended for non-sleepable
struct_ops. A sleepable version can be added later when the new
struct_ops is added.

> > +
> > +static inline bool cgroup_bpf_is_struct_ops_atype(enum cgroup_bpf_atta=
ch_type atype)
> > +{
> > +     return atype =3D=3D CGROUP_TCP_SOCK_OPS;
> > +}
> > +void cgroup_bpf_struct_ops_register(int atype, u32 type_id, void *cfi_=
stubs, bool mult_trace);
> > +int cgroup_bpf_struct_ops_attach(struct bpf_map *map, const union bpf_=
attr *attr);
> > +
> >  void __init cgroup_bpf_lifetime_notifier_init(void);
>
> [ ... ]
>
> > diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> > index 64572f85edc83..d591f306ace52 100644
> > --- a/kernel/bpf/btf.c
> > +++ b/kernel/bpf/btf.c
>
> [ ... ]
>
> > @@ -9868,6 +9872,23 @@ btf_add_struct_ops(struct btf *btf, struct bpf_s=
truct_ops *st_ops,
> >       if (err)
> >               return err;
> >
> > +     if (cgroup_atype) {
> > +             if (!cgroup_bpf_is_struct_ops_atype(cgroup_atype) ||
> > +                 st_ops->reg || st_ops->unreg || st_ops->free_after_ta=
sks_rcu_gp) {
> > +                     bpf_struct_ops_desc_release(&tab->ops[btf->struct=
_ops_tab->cnt]);
> > +                     return -EINVAL;
> > +             }
> > +
> > +             /* There is no need to unregister from cgroup when the
> > +              * btf_free(). No struct_ops map and its cgroup link
> > +              * can be created once its btf is gone.
> > +              */
> > +             cgroup_bpf_struct_ops_register(cgroup_atype,
> > +                                            tab->ops[btf->struct_ops_t=
ab->cnt].type_id,
> > +                                            st_ops->cfi_stubs,
> > +                                            st_ops->free_after_mult_rc=
u_gp);
>
> [Severity: High]
> Does this path accept st_ops->cfi_stubs without validating that it is non=
-NULL?
>
> If a struct_ops type is registered without providing cfi_stubs (e.g., if
> CONFIG_CFI_CLANG is disabled), struct_ops_cfi_stubs[atype] will be NULL.
>
> Later, if a link is detached and update_effective_progs() fails due to me=
mory
> pressure, the fallback bpf_cgroup_array_delete_safe_at() overwrites the
> detached program's slot with bpf_cgroup_array_dummy().
>
> Because cfi_stubs is NULL, it writes NULL into the middle of the array.
>
> Since NULL is used as the array terminator, won't this prematurely trunca=
te
> the array and silently bypass all attached bpf programs that follow the
> detached one?
>

Seems like a false positive. bpf_struct_ops_desc_init() already
rejects struct_ops registration with NULL cfi_stubs.

> > +     }
> > +
> >       btf->struct_ops_tab->cnt++;
> >
> >       return 0;
>
> [ ... ]
>
> > diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
> > index 081d81de18163..a808d2a31f11d 100644
> > --- a/kernel/bpf/cgroup.c
> > +++ b/kernel/bpf/cgroup.c
>
> [ ... ]
>
> > @@ -355,7 +407,12 @@ static int bpf_cgroup_array_copy_to_user(struct bp=
f_prog_array *array,
> >       for (item =3D array->items; item->prog && i < cnt; item++) {
> >               if (item->prog =3D=3D bpf_cgroup_array_dummy(atype))
> >                       continue;
> > -             id =3D item->prog->aux->id;
> > +
> > +             if (cgroup_bpf_is_struct_ops_atype(atype))
> > +                     id =3D bpf_struct_ops_kdata_map_id(item->kdata);
> > +             else
> > +                     id =3D item->prog->aux->id;
> > +
> >               if (copy_to_user(prog_ids + i, &id, sizeof(id)))
> >                       return -EFAULT;
> >               i++;
>
> [Severity: High]
> This is a pre-existing issue, but does bpf_cgroup_array_copy_to_user()
> incorrectly return -ENOSPC when trailing dummy elements exist?
>
> If a cgroup link is detached under memory pressure, it leaves a trailing =
dummy
> sentinel in the array.
>
> When userspace calls bpf_prog_query with an exact-sized buffer, the loop
> breaks via "i < cnt" exactly when i =3D=3D cnt, leaving "item" pointing t=
o the
> dummy element.
>
> Since item->prog is non-NULL (it is the dummy), the function evaluates
> "return item->prog ? -ENOSPC : 0;" and erroneously returns -ENOSPC.
>
> This breaks userspace queries, causing userspace tools to continually rec=
eive
> -ENOSPC and attempt to allocate larger buffers, eventually exhausting mem=
ory.

This issue is pre-existing and the severity should be low. This is an
unlikely path when the system is under pressure. Can be fixed later
with bpf_prog_array_copy_core() if really needed.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623175006.31=
36053-1-ameryhung@gmail.com?part=3D9
