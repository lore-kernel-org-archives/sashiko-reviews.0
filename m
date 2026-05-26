Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E128B3E024D
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 11:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795381; cv=none; b=QE5wXsut1+E4RmQerEw0olhxDuDnugZklxFvBNmVzPBm9L1tDhj3d65hjP3199h7HeUPlkct6lNwLe/7jBxcsEW6QF2+RCYDcDmhONrv15gvpg0IVFv5IoDuJvCJICcRG7S0uKAw4W9WYqOQ7CU5g6ShA3O15I4xnTtyw5R1YiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795381; c=relaxed/simple;
	bh=48ZOm/J6zWoeqUgIJA3LzrUJq1+NIshXbTP6kgylFeU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jWQ2MtOC0bsFw9Th8TrhspRkrSLidLZBo2JmOfzyvpfsHUlxfdFQcNQZRcniJ2dX9qt/aZn185X2FM9cp20k/XkQ5vJxxqwFty6fcaC7sJhakuM3hEORuIKKYyG6bSyM+I+FWCOChAB1OizVHbezhFpSgyWCmUp5LfuDjLt+bV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDstFOXp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDstFOXp"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so109243405ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 04:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779795379; x=1780400179; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3QMqVG2BWpzjQXys63IkGaZ6EBzQtpiRrcY9CBj5v+Y=;
        b=kDstFOXp07q5NZbDGJCAtCc8nvrQ7+2J8QkKJDOEemtjhLsa7qLEa7OvgZsgq4E3rU
         ulSi89qB2cqFc0yuJTRJe/iLCn4PVf8qxzLT9aDoQNdNgUNpVEQQxruQkx6WukZAFyVC
         J2ZNURcHI3RZXJ2CHvEwT3CdW19+I1pF8uRkyblfcMLLDW32BcnIofLkmozyNhQPq48l
         GWZBPnuSJwOKR8SYRSHze5m0zbdzqa8LKK1irGEeK7YCHhk1rLyueS/DuRsG8X+fQgtX
         KrOcvtxNyF3TdNgZrYHTHvX/tB27W1lQZ51V5cmtaSZ/YBKYi4I4HzDI38XJDm5Traqg
         bb1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795379; x=1780400179;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3QMqVG2BWpzjQXys63IkGaZ6EBzQtpiRrcY9CBj5v+Y=;
        b=lYvY7+XGA4TjzFEtnq9PymIr4JyGpOIElKZSfFUw1970qXfXKw2AXBkcuFAIXYa7rX
         YL8FTSmWojrnHMDpC60dSUSbZ6vqUmN1fmYAa+nSD9JBN0lRfB+cw9VQ6IJAdawb6wjY
         6viTB+knyBDk5U6gdOvqGf8I4byLin2fkmow26SyN/dE7j9brJCFWqWHgI8kkAIfdk2f
         gVEDEj9Novan37508ubmhjR5RApNY9dpjhcSuG49qIE8XDmzeHu95OZmlvl2ZT9Hlyxq
         DMp8ILTdMXjUFfv1F3/l42eSK0a52Yq/CKPQBBqeVLHd5TM1lKfuxepXBHM7Sir6HNp8
         l4SQ==
X-Gm-Message-State: AOJu0YzWo+bkXUTA4hoGsJgeN9Z070K85JVLz5VClFphRATvEo02La80
	XYUllR+4AJs71hSOIoDDd70psUcmFcAIIiWUtFg/w1gzKEdSZzGkv12QnTXNNwy8wPM=
X-Gm-Gg: Acq92OHPzekVHdONT8BFZcdJGzlLdxCIsjLZUeRO/Ab9XU2vWOuuELsGFcBHFogKAcN
	hMI+SrZEI+PpFRtGyykOSDYOcROao0SIqrD+OqwARj64JDk/j8us6EYFss7GMrzXmHTtnsaxsQQ
	gKyIhZU8ERjXGViavROgjBvWMlyqApWSk6S6lxXgu0VtSiYPitvz+EsuQeaIKK9qdjuF2ie6dmR
	SX/2EgYJlNOKm8p9fQkur+H1ooA0K5TnySVgcwumo76LzS881tUsWy+apD/oGJFj8ak7X9w1cDY
	S4ypaCduqndj0lXuM2ILzAuQ3HQ4ICodrjQFtJFQZMOylOhzEFLVj+/qZ8SHDEd402Zk6J7xUrj
	ZM1JhYsU6mYry1HXywefJ4zLdpt67so5I+H4xJUbF4zVBVFKeNCfckalYyq2pwygXs1bRrY+2Dl
	Jl5zxSRcKH7lz8ZtREGd09si4/lnkzBxT/BMf//3GzIHoTOAZwbc8=
X-Received: by 2002:a17:903:390d:b0:2bd:7bec:f0d8 with SMTP id d9443c01a7336-2beb0381519mr210980435ad.13.1779795379177;
        Tue, 26 May 2026 04:36:19 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2ebcsm124159885ad.49.2026.05.26.04.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:36:18 -0700 (PDT)
Message-ID: <30875aada61a6dc3354c05c5b3bcf57234215432.camel@gmail.com>
Subject: Re: [PATCH RFC bpf-next 5/6] bpf: report register diff summary for
 hot callchains
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Tue, 26 May 2026 04:36:16 -0700
In-Reply-To: <20260526111112.06B541F000E9@smtp.kernel.org>
References: <20260526-better-1m-reporting-v1-5-51e4f2c59780@gmail.com>
	 <20260526111112.06B541F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-05-26 at 11:11 +0000, sashiko-bot@kernel.org wrote:

[...]

> > @@ -970,7 +1004,8 @@ static void reset_idmap_scratch(struct bpf_verifie=
r_env *env)
> > =C2=A0static bool states_equal(struct bpf_verifier_env *env,
> > =C2=A0			 struct bpf_verifier_state *old,
> > =C2=A0			 struct bpf_verifier_state *cur,
> > -			 enum exact_level exact)
> > +			 enum exact_level exact,
> > +			 struct bpf_state_diff *diff)
> > =C2=A0{
> > =C2=A0	u32 insn_idx;
> > =C2=A0	int i;
>=20
> [Severity: Medium]
> Since diff is initialized to zero by the caller, will early returns in
> states_equal() and func_states_equal() (such as mismatches in in_sleepabl=
e,
> callback_depth, or refsafe()) fail to update the diff parameter?
>=20
> Would this result in falsely attributing state mismatches to register R0
> and producing misleading profiling statistics?

Don't expect this to be an issue in loops, but yes.
I should add DIFF_OTHER as a reason.

> [ ... ]
> > @@ -1588,3 +1627,94 @@ int bpf_is_state_visited(struct bpf_verifier_env=
 *env, int insn_idx)
> [ ... ]
> > +int bpf_sample_state_diffs(struct bpf_verifier_env *env,
> > +			=C2=A0=C2=A0 struct bpf_callchain *cc,
> > +			=C2=A0=C2=A0 struct bpf_state_diff *top_diffs,
> > +			=C2=A0=C2=A0 int *nr_diffs)
> > +{
> [ ... ]
> > +	list_for_each(pos_i, head) {
> > +		sl_i =3D container_of(pos_i, struct bpf_verifier_state_list, node);
> > +		if (!callchain_matches_state(cc, &sl_i->state))
> > +			continue;
> > +		list_for_each(pos_j, pos_i) {
> > +			struct bpf_state_diff diff =3D {};
> > +
> > +			sl_j =3D container_of(pos_j, struct bpf_verifier_state_list, node);
> > +			if (!callchain_matches_state(cc, &sl_j->state))
>=20
> [Severity: High]
> Does this nested loop traversal result in processing the dummy list head?
>=20
> Because list_for_each() iterates until the pointer wraps around to its
> start point (in this case, pos_i), the traversal will inevitably evaluate
> the dummy head (&env->explored_states[hash_idx]).
>=20
> When container_of() computes sl_j from this dummy head, won't the
> subsequent callchain_matches_state() dereference an invalid pointer and
> cause an out-of-bounds read?

Good point. I should iterate starting from the same 'head' and just
filter out 'pos_i =3D=3D pos_j'. Surprising that I didn't see KASAN splats
when testing this on scx.
