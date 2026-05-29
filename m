Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335E437A488
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780079040; cv=none; b=cBKlYM5YSkDCitOSM0clo7X9MLz6i3n+LH7ee7nDZF0TLFM5aSIiqwZwyHLzEQCLES7Q28WENySIU2WtI0qR1S3iLOuveghmbLimbDP/thGUdQn0n9MVxV5WoXvLqfnkZFZXNkj+PiOTQUkCZhIhRc3/9O+m1XGf00KipeIsgYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780079040; c=relaxed/simple;
	bh=G0zmhU1iLu794HmVyNXLwX+Mb88CKrpHGaPhKOFmix0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T5T7ee3DgmWqIv2eEVFwxsplVTFeKFKpqrZ/k/XUef4VLMO9GzFrJHeP+rELlhuMfqfFm4sY7e9h3LztmxU4rPKcWLxCO1RRV7FKcIw9Imprj4M6lSPPGc5D7TzkgCOHcVJS11eXhy+KIfTnBvRFEyaTu7L5rHbzkUM+kIyDljg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SkuOgYqz; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkuOgYqz"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304df7ff4c2so1151643eec.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 11:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780079038; x=1780683838; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DRS8HG/oHO794H+uRGaokOiUrHw90s1jfosUOUrSAkY=;
        b=SkuOgYqzPuh356A3yJFCHQdPb2Ldq0k738t1I6r1y3zA8dir6itQ4awV0+j5qqScHW
         0xgdBICy5uU31agnHzuZipQsjv13aHpUGNWo0MjohvnMBmgZjkgwAMwtiP8l4lqR/Rn8
         rF1CqEhzDgvIX/rCnBbYtiZ6G7bikTc3i1n6myP/HfqBB0k4B7UxphK3/Wu8xNQCj7St
         kALIJbM1RULChtIw1J78FZnZ/UYfYBbKH1AuEtVN5aTKad9ZLOn0c1DMym7L2w6V58p2
         pVYVM8ZdcMryyUqul/U6UBOU80hfkRgRaAlZA9v0vZqTphXr5cXCjpGVq1/xP0nDR5Kl
         Fy7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780079038; x=1780683838;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRS8HG/oHO794H+uRGaokOiUrHw90s1jfosUOUrSAkY=;
        b=Kt7hXUKVqOXrmxQjbeowWTzgBeti7aQN5+T+k765tk5Jl5A+jPp/8jpJQJl4fQPtl5
         QiETCRMqLhMUI/O2cp5EkEqUvyo2w0pFkewVGSsKbKGrjWk8o5hkoK1Ee50dQWaF8Z6g
         50q9ja7oE3b8Zx6UwNYtcOT7pQ4431nYExpZDXFrvstnKBaDTa8brfYZ9qBCX4Iz0RaF
         lzk4oNYFbRCLigbYtRGjhJ6+d+rHBrIqVgENFlEiJL06ijDtk9aMTni+86dqjs8zvJC6
         ltR7PwwdSJ5cLvZRfyEs45NsFXbB4PAGoojWx6rpOWcg+AFJoliEbAok6U/fo0XYqUY5
         1Z3A==
X-Gm-Message-State: AOJu0YyFCg2+sZNuNc2Sdo5xELjbALY1ksU7wv7YkNv6MwT+XMwC3aK8
	TDQLeVBemV/1NtCUshp0iXMkuPsIhGZQDWVoVqA+68ZJjiQNProMjJMXa+qbfD7L
X-Gm-Gg: Acq92OFpCnqGChHzypcsaO2B7lbH1UhB7UftK/pMNemPkgVNgaH09/F95SMb3twHO/2
	4gwcXPgLkIFQfOHWyyWYsxSeOHGSiQpf83m4LDLiYsXrg17Jjqauk8Idj7KGZarfOkG1pcFv8r8
	wIv+YaMSJEywILv2jQNnt7CR+fSPm+B+fJG6F6dEXNWoLnRV5lgi96jPGoQ83kC9Cx9v5HnVBKe
	9KkYAA8rZA4DS6U9HEkv7d3wSfOhk0ru1t07ruA1OnM5OkCgbes0pgbJQJl7sk7Kw6CQ/WAY1lx
	oMEtRzIOTW5Hth9bCLE+MkyMn6vZtvANjDNI6aLCWxQCCLryvJTqjCdCbg9difuTEWQgqBaKh5z
	zIY+3hl2l7SRd2Hj9F51cuxW8smHsWpBACFrUkAZ3ZvgyewSvPDUE5O94eaZwnpOudR1g55uyfp
	OeEZQW/9oc2HJDrNHROecfqb3A5rt7ZyrZ/SlZ+oVwZNci9+Gx0HG4z+67Vhn9ecgyMWwjcSWz+
	yP9REY09kzhVMPEfTg=
X-Received: by 2002:a05:7300:2388:b0:2f4:d190:37bf with SMTP id 5a478bee46e88-304eb1f59aamr1948101eec.16.1780079038106;
        Fri, 29 May 2026 11:23:58 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:cc2c:f0b5:a02d:c0fb? ([2620:10d:c090:500::2:a9e5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed30a012sm2155845eec.10.2026.05.29.11.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 11:23:57 -0700 (PDT)
Message-ID: <ac73ed389e823187e972df061e8cfe9627fc11f1.camel@gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: fork state when comparing sign crossing
 ranges with zero
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Fri, 29 May 2026 11:23:56 -0700
In-Reply-To: <20260529085933.A3B101F00893@smtp.kernel.org>
References: <20260529-cnum-split-at-zero-v1-1-986c03752226@gmail.com>
	 <20260529085933.A3B101F00893@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-05-29 at 08:59 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Inconsistent verifier state and bypassed linked register synch=
ronization.
> - [Medium] Missing scalar type check applies zero-comparison workaround t=
o pointer offsets.
> --
>=20
> commit dc22ab232b73a45e1aacc8d291fb5640c3a0d950
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> bpf: fork state when comparing sign crossing ranges with zero
>=20
> This commit introduces a workaround for the verifier when evaluating a
> comparison of a sign-crossing scalar against zero. It forks the verifier =
state
> to process negative and non-negative branches separately, restoring preci=
sion
> lost in the cnum-based scalar representation.
>=20
> Link: https://lore.kernel.org/bpf/96c4a1aa4333d10b882a9b5093d2d982f9f106e=
3.camel@gmail.com/T/
>=20
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index c8d980fdd7099..7998e8da5e554 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> [ ... ]
> > @@ -15965,6 +15965,73 @@ static void sync_linked_regs(struct bpf_verifi=
er_env *env, struct bpf_verifier_s
> > +static int maybe_fork_cmp_with_zero(struct bpf_verifier_env *env,
> > +				    struct bpf_insn *insn,
> > +				    struct bpf_reg_state *src_reg,
> > +				    struct bpf_reg_state *dst_reg)
> > +{
> [ ... ]
> > +	if (!is_reg_const(src_reg, is_jmp32) || reg_const_value(src_reg, is_j=
mp32) !=3D 0)
> > +		return 0;
> > +
>=20
> [Severity: Medium]
> Does this code apply the scalar workaround to pointer types?
>=20
> It appears that dst_reg is not checked for SCALAR_VALUE. If dst_reg is a=
=20
> valid pointer with a variable offset (e.g., PTR_TO_MAP_VALUE) that happen=
s=20
> to cross zero, and the program compares it against zero (if (ptr =3D=3D 0=
)),=20
> the verifier might artificially restrict the pointer's offset and fork th=
e state.
>=20
> Since valid pointers are not zero, both forks will follow the fall-throug=
h=20
> path, meaning this doesn't create a safety vulnerability but could lead t=
o=20
> unnecessary state exploration and semantically incorrect behavior. Should=
 we=20
> verify dst_reg->type =3D=3D SCALAR_VALUE here?

Should probably restrict to SCALAR_VALUE.

> > +	bool cross_sign32 =3D is_jmp32 &&
> > +		dst_reg->r32.size < S32_MAX &&
> > +		cnum32_smin(dst_reg->r32) < 0 && cnum32_smax(dst_reg->r32) > 0;
> > +	bool cross_sign64 =3D !is_jmp32 &&
> > +		dst_reg->r64.size < S64_MAX &&
> > +		cnum64_smin(dst_reg->r64) < 0 && cnum64_smax(dst_reg->r64) > 0;
> > +	if (!cross_sign32 && !cross_sign64)
> > +		return 0;
> > +
> > +	fork =3D push_stack(env, env->insn_idx, env->insn_idx, cur->speculati=
ve);
> > +	if (!fork)
> > +		return -ENOMEM;
> > +
> > +	fork_dst_regno =3D swapped ? insn->src_reg : insn->dst_reg;
> > +	fork_dst_reg =3D &fork->frame[fork->curframe]->regs[fork_dst_regno];
> > +	if (is_jmp32) {
> > +		cnum32_intersect_with_srange(&dst_reg->r32, S32_MIN, -1);
> > +		cnum32_intersect_with_srange(&fork_dst_reg->r32, 0, S32_MAX);
> > +	} else {
> > +		cnum64_intersect_with_srange(&dst_reg->r64, S64_MIN, -1);
> > +		cnum64_intersect_with_srange(&fork_dst_reg->r64, 0, S64_MAX);
> > +	}
>=20
> [Severity: Medium]
> Are we leaving dst_reg and fork_dst_reg in an inconsistent state by not
> calling reg_bounds_sync()?
>=20
> Because dst_reg->r32 or r64 are modified directly here without syncing,=
=20
> the bounds are narrowed but var_off and the other bounds remain wide.
>=20
> Additionally, because the dst_reg bounds are forced to be strictly negati=
ve=20
> here, is_branch_taken() later in check_cond_jmp_op() might evaluate=20
> the branch statically (pred =3D=3D 0). If it does, check_cond_jmp_op() wi=
ll=20
> return early and completely bypass sync_linked_regs() for the current bra=
nch.
>=20
> While this makes the verifier strictly more conservative for the linked
> registers (since wider bounds fail faster), it could cause linked registe=
rs
> to lose precision and lead to potential spurious rejections.

Missing reg_bounds_sync() is a good point.

> > +	return 0;
> > +}
