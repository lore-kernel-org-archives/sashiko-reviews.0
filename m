Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897992264D6
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 23:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779837862; cv=none; b=ZBZmrXKiL+p1TUsZ2hWkQ7GA3JDz7SA/mbHQ1xq3cx0sWNj/gI9dYFJSwE82gUcskvtjS6R73SosGHEcKC2iKe/wp8oJaoyRDsgF7G6Pq+SBVtZiswMKftznpd8KyGT39CIgrjXzpeHHvhP096ORLvliohIQdoF5jIT/7lRSHWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779837862; c=relaxed/simple;
	bh=3YXe4tKqtYF0/XbcvHavmTsJL4yATn8Ji+zo9UMpqWc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tnEOnjvT8AuV1FF11irkeMq3RTbRWX6s9/tPAzUl2ffnzVANKUjXp0J+pkEsYWArteq9iIkroJmcSLqVUBrcZOY8Jto5/Luo/AKLb+FWgO0NJs0Gm1YwcSQzez6HrJJaX5FoR7M/mHDumq0CNs59P5kWC7R77wiiVrgheWPcta0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jx85ruUH; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jx85ruUH"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so116121205ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 16:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779837861; x=1780442661; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=un0ID1tpd6t3gsza6ApAmJVWeKkWeohw9H58j4ribhI=;
        b=Jx85ruUH2/msVchTToUu2FnMaj3zk3rYJZqTusCO7/o+1+PAZvuUr7Y86u4mRdIa1o
         NSix52BRZqPe0zhA58blmJ9oBuzFQbrTUJR5b8u0rWMM3DL7TIEXuqbRFEO2W+2gbqm8
         tyLvUCJ4IhIR9/LYztNhEYZ1/6S6Mkap4bpqWHjsi2BHNIsSDOEaq9m1vATTTmU8aazH
         C+T9A2XjlMz5KplwkAf/xM3RjFZYNgZvOoYqZvr+zLneOxyYPSUDHlpFUY/ENUVZBnqd
         /3W4X1XgMF3c955adtofK1XRvPPZylQPsRor7/M3+cDXgrE8gUplOJ3W9BX5h8OpDs7R
         /J9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779837861; x=1780442661;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=un0ID1tpd6t3gsza6ApAmJVWeKkWeohw9H58j4ribhI=;
        b=MJc1U8Ku4/rwl4DMzGE7cy06Sh6Xq919S7AulptdItTq/scKThreVizPhscqTcwsCn
         Nwbtcd6d7Gx3gQhns5jPs2TkA6Es5mOKsqQSMWm0EtFOGRQDLNtJF8f1Xsb2gmBnprE3
         /ndYCOxZqoWBosf1iAXqyNyPcGUfAfuaVYJDAdLP8J1UkeUojOyWuq2PTCbf32A4laZd
         I1iklLpXBJm3fG+f3HqCjn6m7mTa50DtILOuagTyMzrltQbp2lApaJ4oxjp1/2596ovF
         ty8buja8ZLNmX9JkKIMXy58vc8xKxZxrCqy+OExpkrNQpfZPf83Jj0WbL9nM5K9yoEo5
         Bj7g==
X-Gm-Message-State: AOJu0YwW9b+6jhQz9FoAqWcuP06Uzt87u7Z+/sVd3l7WWouFmSPrIPfj
	rI270uclGRKx5yrdDRl3cB09QP3fdUqi6jV9yE0Y3W7YPvDKhcB2R7JbZw8pYuSv4/0=
X-Gm-Gg: Acq92OG6WtmJsIwkDou9pw9TlWX+ilbyA2+TVrgl9oZgiRZkdwzcGNIJvPrNvQQwOyg
	iLm98NdxX0DUfjhwmrAUN0Kjcxod9UQ7KT/l75hRAvFjTaFsF+n55mBQofAcptz8bhjuFC6N/Sv
	/YtBolkBg6N7Tf2rPABnMNd2FjgFfGjwv9hAArYeesuN1voLoNnavPetgB7zFUYhi4SkQ5Bbk2/
	75ImrHE2Xxzf/HOTaTDxu3qxXfKvNVCyi0pe87quN3LuOd0H34Ci2KY/LzZp5Xek9iz3gaNDyL0
	JzlcECyFeoNkMmaK0KX7dGSGSDcJJkV25/j/sa2g8vW3fn8QNLTa7Y8A9d8fDW5rzCzKG/7+W6s
	ZK3mKAGYoCJjwxOcqY2TWANGtlaig5bz4IUw3NZIPkqp4nUhlXyuczHiHbB4H0vxkzsG/ws+8r9
	Y9Vsfmb6DwM1YKuCADjcgj066qMdYJpLBpbV1pz/MLuda6JFE27CrDC1RUhbIAwA==
X-Received: by 2002:a17:903:3b87:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2beb05d9f8cmr230667045ad.19.1779837860825;
        Tue, 26 May 2026 16:24:20 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58fa422sm142133355ad.72.2026.05.26.16.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 16:24:20 -0700 (PDT)
Message-ID: <8a5b6bb66a6e2011fcba82f29a8d4eac03f2d191.camel@gmail.com>
Subject: Re: [PATCH RFC bpf-next v2 5/6] bpf: report register diff summary
 for hot callchains
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Tue, 26 May 2026 16:24:17 -0700
In-Reply-To: <20260526213137.382441F000E9@smtp.kernel.org>
References: <20260526-better-1m-reporting-v2-5-e7ec61c45d41@gmail.com>
	 <20260526213137.382441F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-05-26 at 21:31 +0000, sashiko-bot@kernel.org wrote:

[...]

> > diff --git a/kernel/bpf/states.c b/kernel/bpf/states.c
> > index 8773381360095..79e76bc2d1712 100644
> > --- a/kernel/bpf/states.c
> > +++ b/kernel/bpf/states.c
> [ ... ]
> > @@ -1588,3 +1629,98 @@ int bpf_is_state_visited(struct bpf_verifier_env=
 *env, int insn_idx)
> > =C2=A0	list_add(&new_sl->node, head);
> > =C2=A0	return 0;
> > =C2=A0}
> > +
> > +static bool callchain_matches_state(struct bpf_callchain *cc,
> > +				=C2=A0=C2=A0=C2=A0 struct bpf_verifier_state *st)
> > +{
> > +	int i;
> > +
> > +	if (st->curframe !=3D cc->curframe)
> > +		return false;
> > +	for (i =3D 0; i < (int)cc->curframe; i++)
> > +		if (st->frame[i + 1]->callsite !=3D cc->insn_idx[i])
> > +			return false;
> > +	return true;
> > +}
>=20
> [Severity: Medium]
> Does this function need to verify the leaf instruction index=20
> (st->insn_idx =3D=3D cc->insn_idx[cc->curframe])?=20
>=20
> States for different instructions can hash to the same bucket via=20
> (insn_idx ^ callsite) % env->prog->len. Without checking the leaf
> instruction, a hash collision could cause states from different instructi=
ons
> to be incorrectly matched, violating assumptions in func_states_equal()
> which relies on live_regs_before for a specific instruction.

This should be fixed.

> > +
> > +struct state_diff_cnt {
> > +	struct bpf_state_diff diff;
> > +	u32 cnt;
> > +};
> > +
> > +static int state_diff_cmp(const void *a, const void *b)
> > +{
> > +	return ((struct state_diff_cnt *)b)->cnt - ((struct state_diff_cnt *)=
a)->cnt;
> > +}
>=20
> [Severity: Low]
> Can this subtraction overflow?=20
>=20
> The cnt fields are unsigned 32-bit integers, and the function returns a
> signed 32-bit integer. If the difference exceeds INT_MAX, the subtraction
> will overflow into a negative value, resulting in an inverted sort order.

I don't think overflow can happen here.
But I'll rewrite to make the robot happy.

> > +
> > +static bool state_diff_eq(struct bpf_state_diff *a, struct bpf_state_d=
iff *b)
> > +{
> > +	return a->frame =3D=3D b->frame && a->slot =3D=3D b->slot && a->kind =
=3D=3D b->kind;
> > +}
> > +
> > +int bpf_sample_state_diffs(struct bpf_verifier_env *env,
> > +			=C2=A0=C2=A0 struct bpf_callchain *cc,
> > +			=C2=A0=C2=A0 struct bpf_state_diff *top_diffs,
> > +			=C2=A0=C2=A0 int *nr_diffs)
> > +{
> > +	struct bpf_verifier_state_list *sl_i, *sl_j;
> > +	struct state_diff_cnt *diff_cnts =3D NULL;
> > +	struct list_head *pos_i, *pos_j, *head;
> > +	u32 leaf_insn, callsite, hash_idx;
> > +	int i, cap =3D 0, nr_locs =3D 0;
> > +
> > +	leaf_insn =3D cc->insn_idx[cc->curframe];
> > +	callsite =3D cc->curframe > 0 ? cc->insn_idx[cc->curframe - 1] : BPF_=
MAIN_FUNC;
> > +	hash_idx =3D (leaf_insn ^ callsite) % env->prog->len;
> > +	head =3D &env->explored_states[hash_idx];
> > +
> > +	list_for_each(pos_i, head) {
> > +		sl_i =3D container_of(pos_i, struct bpf_verifier_state_list, node);
> > +		if (!callchain_matches_state(cc, &sl_i->state))
> > +			continue;
> > +		list_for_each(pos_j, head) {
> > +			struct bpf_state_diff diff =3D {};
> > +
> > +			if (pos_i =3D=3D pos_j)
> > +				continue;
> > +			sl_j =3D container_of(pos_j, struct bpf_verifier_state_list, node);
> > +			if (!callchain_matches_state(cc, &sl_j->state))
> > +				continue;
> > +			if (states_equal(env, &sl_i->state, &sl_j->state, NOT_EXACT, &diff)=
)
>=20
> [Severity: High]
> Can these nested list_for_each loops cause a CPU soft lockup?=20
>=20
> A single hash bucket can accumulate tens to hundreds of thousands of cach=
ed
> states for a single instruction in complex programs. Without cond_resched=
()
> calls within these O(N^2) loops, billions of states_equal() comparisons
> could execute, monopolizing the CPU and leading to a local DoS.

I'll add cond_resched().

> [ ... ]
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 54b7ad65b7fc1..d09c014462f13 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> [ ... ]
> > @@ -17527,7 +17564,9 @@ static int do_check(struct bpf_verifier_env *en=
v)
> > =C2=A0		insn_aux =3D &env->insn_aux_data[env->insn_idx];
> > =C2=A0
> > =C2=A0		if (++env->insn_processed > BPF_COMPLEXITY_LIMIT_INSNS) {
> > -			print_hotspots(env);
> > +			err =3D print_hotspots(env);
> > +			if (err)
> > +				return err;
>=20
> [Severity: Medium]
> If print_hotspots() returns an error (like -ENOMEM from kvrealloc()), doe=
s
> this mask the primary -E2BIG complexity limit error?=20
>=20
> Returning err directly will skip logging "BPF program is too large" and
> return a misleading error code to the user, who might attribute it to sys=
tem
> memory exhaustion instead of hitting the verifier complexity limit.
>=20
> > =C2=A0			verbose(env,
> > =C2=A0				"BPF program is too large. Processed %d insn\n",
> > =C2=A0				env->insn_processed);

Replied already.
