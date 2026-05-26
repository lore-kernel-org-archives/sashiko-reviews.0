Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E193C38C43A
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 20:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779827593; cv=none; b=u3kzPh9eABXkM8DYNIQJRZjQdX0lRQSqWH+kFFplfQKpciB43cGfMd/4sWp2YxNYZrWYLLVRmNTPWgtrXazVfywFg2474cbJkZqoXRJJUAWz45eCmfvdkrl19FxlJAQ15LbN5glD7y0zw95SGzhA4HvB9vNRA8ZM5NLfjneB24c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779827593; c=relaxed/simple;
	bh=Bnz/9cuwUbinKEmevDoJPNbz8nZ/7/TM4Z+qkzwCzM8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UtHqD7sMJzXkwoeyPfdsk9iuW9EGb4tHu5KveCse1gEKYWMRzffeumqX4LzJLXRnssSo42MeA4vff8+fDDhsAinyy7FNp31B7ZUtET7honI7U6qKCwv4+DYaX39o+Smj6altYtxEn0zWnEchULaHWbAtE9AJkuSCAeH9YL29Cgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YnppUkm4; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YnppUkm4"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-365d8e43759so5569026a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 13:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779827591; x=1780432391; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cv9bHQTyuADxNVgBJ3k2ar2bjjFr5T1pZrUy6kLd1tM=;
        b=YnppUkm4XakuWcJFMVEnc49UuS+Wr16YhUiaHliRE06v9YMJHmojgOZUGsWEcRPYWK
         rWizWKO3kFgGciw7OfQFJO9c3f9MLwdtJIFghWUxr+1sFVy3eFUWWGjacjdx7OsKni6R
         XsoWXp0Lguvrwf4+I04hHrjDBacZRVAiqDXFpeC1r7CeNeuFETky7zTI6yd3TMBUqIpp
         Edw7FpiVzim3hM6NtxTjRjW41DhoSrhdyR15BPbpIXk7qvBVeaJIOY0/YDboH6Yvaam3
         /p43gef2s/dljnKRH6F2j5fBLxiUF5Ea8LVusUWHNtL9tUqPXYULOkLShL7HgKlPmC6i
         xsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779827591; x=1780432391;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cv9bHQTyuADxNVgBJ3k2ar2bjjFr5T1pZrUy6kLd1tM=;
        b=TmI/oNdY+7VZXjiUdOCxcWwm26u3RGz3gtniSWCCWCZ1tYviq8WdT8tsgNmfQbtycz
         04RTcbWMPcRUdQRGhQibStf25kWJj0LBQ0K3yUW/FXA9zyHI+WVPbuGj5XcGsUhBkpdm
         Fy1W0jcaTOBx92RtR++w//9B4s9AilP1XTorXqgIYiFIvxMPjD5IUpWiB2MpsWOEDQQL
         df1TJkir+b+pygFnx0zC5IR0DIcztfTvJeyFCjPE9Lj6dTYrfnWSENimc9d/pzxtXx8v
         DjkiyhLf8od/U6HH18I1q103b/u1B08Ol+uulR00znKDGCqw4ZnyBf59wkx1UAkx+Ya1
         eHXw==
X-Gm-Message-State: AOJu0Yye0arZZRnHCkF+UK4bpAo7JsJ6MxXODQOtVWHdPwzJbsRcSnCy
	pC2yMuQb+uWq3iMqEVJSZ5QELh0Geh1DIHd03YBKIcSqdbQJDWRIPUSlnffQJtDTZig=
X-Gm-Gg: Acq92OFf/uq9pnl80wYdBKxZKuulfJ5NkDzXZ1Xhlu34IudKuDotcbDQQHM8ODAbyOQ
	xQgBVcKPHtYiHs9jgweIQ8O81PCo9sR6vPP9CCfHbpUvVkpFaneGADyfaPXOX4GNX/odw0X/Y+S
	CqGFw7tLSD0MAad4MH4z35Y1pfwnGRWJtLfPtbccEslHP+WWRbdBrjwTaVmVxIVhZhlETJSWIWW
	pZoz/jVa4jKZdQ/aZMsiS+cP2G5Y5rvBoIaOz8ERLthanqdJOhiASWE56itLNxwd7uvvcKTepcv
	/T0W01tWHxOk/dle9N2aH8ETQg9TdI0W5mscCU9Ljj4lgnX5qQRl5qk/WGnr9JHOq2ZSQY9oz7z
	+Lqa0LxkeC6Yi4Q/DRLNE5RwxsxENeqJL1wYwiYIad54X37m02YoZD8HZl6+W6MoC3Wz7u8OXo4
	yZMnCVVuY2/XepNSLDrsQyoSAI5k81jVhk2EIGYK0fk4mTQCNg91lY
X-Received: by 2002:a17:90b:54c6:b0:35f:c5b8:ef6d with SMTP id 98e67ed59e1d1-36a6ba28e46mr13920506a91.3.1779827591114;
        Tue, 26 May 2026 13:33:11 -0700 (PDT)
Received: from [192.168.0.226] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71dbc38fsm13684297a91.5.2026.05.26.13.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 13:33:10 -0700 (PDT)
Message-ID: <7e1941bb9ad328ffdd417764d1d97bf9168e2ef5.camel@gmail.com>
Subject: Re: [PATCH RFC bpf-next v2 2/6] bpf: compute loops hierarchy
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Tue, 26 May 2026 13:33:07 -0700
In-Reply-To: <20260526202635.6FBC91F000E9@smtp.kernel.org>
References: <20260526-better-1m-reporting-v2-2-e7ec61c45d41@gmail.com>
	 <20260526202635.6FBC91F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-05-26 at 20:26 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Worst-case O(N^2) algorithmic complexity in assign_header() lack=
ing cond_resched() leads to soft lockup.
> --
>=20
> commit 5ba437ec70f22b36c162a26467753448539086e8
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> bpf: compute loops hierarchy
>=20
> This commit introduces an analysis phase to the bpf verifier that compute=
s
> the loops hierarchy using a non-recursive adaptation of the Wei et al.
> algorithm. It records the innermost loop header per instruction to be use=
d
> as sampling points for callchain profiling.
>=20
> > diff --git a/kernel/bpf/loops.c b/kernel/bpf/loops.c
> > new file mode 100644
> > index 0000000000000..1f0b10c57957a
> > --- /dev/null
> > +++ b/kernel/bpf/loops.c
>=20
> [ ... ]
>=20
> > +static int assign_header(struct bpf_verifier_env *env, struct loops_df=
s *dfs, int n, int h)
> > +{
> > +	struct bpf_insn_aux_data *aux =3D env->insn_aux_data;
> > +	int *dfs_pos =3D dfs->dfs_pos;
> > +	int err, nh;
> > +
> > +	err =3D mark_header(env, h);
> > +	if (err)
> > +		return err;
> > +
> > +	/* Don't encode self-loops, otherwise can't reflect loops nesting str=
ucture. */
> > +	if (n =3D=3D h)
> > +		return 0;
> > +
> > +	/* Make sure that loop headers up the chain are sorted by dfs_pos. */
> > +	while (aux[n].loop_header !=3D -1) {
> > +		nh =3D aux[n].loop_header;
> > +		if (nh =3D=3D h)
> > +			return 0;
> > +		if (dfs_pos[nh] < dfs_pos[h]) {
> > +			aux[n].loop_header =3D h;
> > +			n =3D h;
> > +			h =3D nh;
> > +		} else {
> > +			n =3D nh;
> > +		}
> > +	}
>=20
> [Severity: High]
> Could this while loop lead to a cpu soft lockup under specific pathologic=
al
> conditions?
>=20
> With deeply nested loops and cross-edges, it appears possible to force
> repeated O(n) traversals of this header chain for O(n) nodes without
> actually modifying the chain. Given the 1 million bpf instruction limit,
> this worst-case O(n^2) algorithmic complexity might result in a massive
> number of iterations.
>=20
> Because neither this chain traversal nor the surrounding search algorithm=
 in
> compute_loops_in_subprog() seem to call cond_resched(), does this risk
> stalling the cpu core long enough to trigger a system soft lockup or a
> local denial of service?

This is a known algorithmic trade off, favoring implementation simplicity.
Neither paper authors nor me hit the pathological case why testing
with real-life programs. Some safeguard counter can be added if people
feel paranoid.

> > +	aux[n].loop_header =3D h;
> > +	return 0;
> > +}
