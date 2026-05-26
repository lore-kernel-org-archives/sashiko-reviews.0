Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D33DD863
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 11:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779795103; cv=none; b=iGXt+4OlA6OwzsPXbKD23Rdr69DRoXYotowJkSbgHaTbw1cWbP457RLJEJnrbnt3IYu392/b7e8TK6HSATbUdIQ4cLIp9oWhHj7RN2Aks1mZ7XmWyfG2SHmN7u7JcYs+lnHC6gNqc+3mLbhSiE9ttZzt4Hbl5r+xKnhsMH4MEG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779795103; c=relaxed/simple;
	bh=mWtjN31+HpWQbXr/ByrXO2BhARDbhAbOiP36mdhtc4M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hUnlSFBDAv4upN7YeErIk89djyyWnbUg4q9k2F7j2GrpZahkFFjHc8pmE0rEImyGy3yb0dlfTPCdgyHUzh40D+vIKQZB7Fjo2mGJUqgVnzZQJdR/qTkPSdVl4iaiMMRJTL54vaN1ux28O5fnYRT4McEJkpOEyDJOk1OFHK2gJAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sgQGCjdb; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sgQGCjdb"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2b9ea536877so68462645ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 04:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779795101; x=1780399901; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3+NnTbX3WOMBPM0bNRlsEsXdX+ZRunPRKytXuUTgz8Y=;
        b=sgQGCjdb/hsgPmkesdbBzg05PPiaSu6LhTS2CmsV+kdEdEcyzGH8Wk4J4zA9ok9ywE
         0QhnehXYUF209HgMiukyGKjW1Db6ToSLmcLXz3NblOPVZDoozTvqjnNZ4XFyCc4JU21m
         RX3YJ8qpCG/GmgTOGGeB01f5tcNI8Ig/klKU58VgXL9b20MkIxH4fxftX69Hm7d4fFPf
         1G4s67xAy6O3VB0mlDg00uQdr9oppCzhEd0qe9J4dQph4vQ3TjsC1nNmGGYXhQqLK5LF
         vBOZvKfv1Blx5CugPe52Cum9j8AncdDF3OAlLPcOTbYtY3oribf4yRZXa8MK4hlZmNJW
         726Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779795101; x=1780399901;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3+NnTbX3WOMBPM0bNRlsEsXdX+ZRunPRKytXuUTgz8Y=;
        b=FLaJ5fpnwX4umOCp3C1oMKhY75zKXorX9+bs8iyUNN7jNVWvy7zs4NeNCilLusvfN+
         XUIwiW8Jyih1FzQX1aKVrwCZxGP79GRSeZWAHcHwGuA0jAuHG+7car1pjhFuWxYE7UkM
         2xSKbNvYs1c8zYgNeeYsAfazjtaFlVG8ar9CPA/Nt2KVfb3KNEe7Jj118jp4L7lSQeLT
         dLRIjdw4xblq/KMucTqETfDKnN8Ge5yRZsHcA1ges/P4s32OL3dWDLvuGzyZXT8O7zS8
         ZRaGtD+b8zK92aj2rrbqRjztsgg22x1juodE+hUqPRV1DJSOAhAKHm6vVPNAMyZHXb87
         L6rA==
X-Gm-Message-State: AOJu0YyqBLuAjLm1Rf8/oN6P4ZrAcLFhzNnpxiV8Tj+9B37xdtgkoL9j
	GY9H2byXjuVHqDpWmHEmA3vhLVE0RFKP7iOxS0iIEPtlmGhHpuJNvgqsNR9f2dnWm2Q=
X-Gm-Gg: Acq92OFjyhdOEk42u5sP9sOsJp54SejRqwB0UQy6Vzt4ubCVPEHYCNV2RjtCiVh5ttJ
	HfG1DNqo+2WGgmKHXWYFs0VodUu6MdIh0qDFKY/DG3tv6zAAao+teZ9ba9NhB2YRQa41PEWk82y
	rIGBEyE7pCto1ipfN7A7g35xQR5KHt89LP8AswEwKCWVjo49F9EUhe4SfOlIgG+NpHEugGQzwek
	I6BUH6iq7DhXY61UkGcS5PIbr5g6K4dkJWbM5k+nYJYUA1ruBb3fflHZaPrupZVsW0wrCMR1wot
	WwwZeTMm87ls4rT79IZc2vBDVBuhUP0uLOdjtFj840cutwA2xaImntkU6cYDldN6zXGEpRoU9Lw
	h/4RVFD6qZxVM+J2P3AQe5fUxKvgHXJ+ncH1V9Koxy/zacN8OF+kBXOg/BXkgcv3ewvXkMyew6E
	FdoGWAN7XqCaeWX373WfdAAT+ypp9Q128NBqeNd3MNOsVbC+TFSZN3xJ2Xm7VHRg==
X-Received: by 2002:a17:902:da90:b0:2b0:ac1e:9730 with SMTP id d9443c01a7336-2bea229c2eamr224637675ad.14.1779795101320;
        Tue, 26 May 2026 04:31:41 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2ed6sm128269815ad.46.2026.05.26.04.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 04:31:40 -0700 (PDT)
Message-ID: <3693c03734bc30b8cbfb30e4f7692c7add387966.camel@gmail.com>
Subject: Re: [PATCH RFC bpf-next 4/6] bpf: report hot simulated callchains
 when 1M instructions limit is met
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Tue, 26 May 2026 04:31:38 -0700
In-Reply-To: <20260526104556.5A3791F000E9@smtp.kernel.org>
References: <20260526-better-1m-reporting-v1-4-51e4f2c59780@gmail.com>
	 <20260526104556.5A3791F000E9@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-05-26 at 10:45 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issu=
e(s) to consider:
> - [High] Missing Memcg Accounting for callchain profiles
> - [High] Stack buffer overflow when updating printed_subs bitmap
> - [Medium] Uninitialized stack memory copied to heap in update_callchain_=
profile
> - [Low] Log buffer truncation due to subprogram disassemblies preceding c=
allchain summary
> - [Low] Compiler warning on 32-bit architectures due to incorrect format =
specifier for ptrdiff_t
> --
>=20
> commit 77e8a884bb6c0c1595ff19bac7fba4cb9e4a26ac
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> bpf: report hot simulated callchains when 1M instructions limit is met
> =C2=A0=C2=A0=C2=A0=20
> This patch introduces a mechanism to report the hottest simulated callcha=
ins
> when the BPF verifier hits the 1M instruction budget. It collects and cou=
nts
> callchains during verification, printing a summary and disassembly of the
> relevant subprograms to help debugging.
>=20
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 2b3584712ad28..8eb8f1ce17c76 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
>=20
> [ ... ]
>=20
> > @@ -17247,6 +17247,152 @@ static int check_indirect_jump(struct bpf_ver=
ifier_env *env, struct bpf_insn *in
> > =C2=A0	return INSN_IDX_UPDATED;
> > =C2=A0}
> > =C2=A0
> > +static void compute_callchain(struct bpf_verifier_state *st, struct bp=
f_callchain *cc)
> > +{
> > +	int i;
> > +
> > +	cc->curframe =3D st->curframe;
> > +	for (i =3D 0; i <=3D st->curframe; i++)
> > +		cc->insn_idx[i] =3D bpf_frame_insn_idx(st, i);
> > +}
> > +
> > +static int update_callchain_profile(struct bpf_verifier_env *env, stru=
ct bpf_verifier_state *st)
> > +{
> > +	struct bpf_callchain_entry *entry;
> > +	struct bpf_callchain cc;
> > +	u32 hash;
> > +
> > +	compute_callchain(st, &cc);
> > +	hash =3D jhash2(cc.insn_idx, cc.curframe + 1, cc.curframe + 1);
> > +	hash_for_each_possible(env->callchain_htab, entry, node, hash) {
> > +		if (entry->cc.curframe =3D=3D cc.curframe &&
> > +		=C2=A0=C2=A0=C2=A0 !memcmp(entry->cc.insn_idx, cc.insn_idx, (cc.curf=
rame + 1) * sizeof(u32))) {
> > +			entry->count++;
> > +			return 0;
> > +		}
> > +	}
> > +	entry =3D kzalloc(sizeof(*entry), GFP_KERNEL);
>=20
> [Severity: High]
> Does this code allow an unprivileged user (or one inside a container) to
> bypass memory limits?

Yes, should be changed to GFP_KERNEL_ACCOUNT.

> > +	if (!entry)
> > +		return -ENOMEM;
> > +	entry->cc =3D cc;
>=20
> [Severity: Medium]
> Will this copy uninitialized stack memory to the heap?
>=20
> In compute_callchain(), only cc.curframe and the active elements of the
> cc.insn_idx array are initialized. The remainder of the array on the stac=
k
> remains uninitialized. Assigning the whole struct here copies those
> uninitialized bytes, which will trigger KMSAN warnings.

That's fine from algorithm perspective. It only uses initialized part
of the array. I can change the code if it triggers KMSAN.

>=20
> > +	entry->count =3D 1;
> > +	hash_add(env->callchain_htab, &entry->node, hash);
> > +	return 0;
> > +}
>=20
> [ ... ]
>=20
> > +static void print_callchain_entry(struct bpf_verifier_env *env,
> > +				=C2=A0 struct bpf_callchain_entry *entry, int idx)
> > +{
> > +	struct bpf_callchain *cc =3D &entry->cc;
> > +	const struct bpf_line_info *linfo;
> > +	struct bpf_subprog_info *sub;
> > +	int i, insn_idx;
> > +
> > +	verbose(env, "#%d most visited simulated stacktrace (visited %llu tim=
es):\n",
> > +		idx, entry->count);
> > +	for (i =3D 0; i <=3D cc->curframe; i++) {
> > +		insn_idx =3D cc->insn_idx[i];
> > +		sub =3D bpf_find_containing_subprog(env, insn_idx);
> > +		linfo =3D bpf_find_linfo(env->prog, insn_idx);
> > +		if (sub->name)
> > +			verbose(env, "=C2=A0 %s/%d", sub->name, insn_idx);
> > +		else
> > +			verbose(env, "=C2=A0 subprog#%ld/%d", sub - env->subprog_info, insn=
_idx);
>=20
> [Severity: Low]
> Does this generate a compiler warning on 32-bit architectures?
>=20
> The expression sub - env->subprog_info yields a ptrdiff_t. On 32-bit syst=
ems,
> ptrdiff_t is typically int, so using %ld causes a -Wformat warning. Could=
 this
> be changed to %td?

Okay

> > +		if (linfo)
> > +			verbose(env, " (%s:%u)",
> > +				btf_name_by_offset(env->prog->aux->btf, linfo->file_name_off),
> > +				BPF_LINE_INFO_LINE_NUM(linfo->line_col));
> > +		verbose(env, "\n");
> > +	}
> > +}
> > +
> > +static void disasm_subprog(struct bpf_verifier_env *env, struct bpf_su=
bprog_info *sub)
> > +{
> > +	u32 i, end =3D (sub + 1)->start;
> > +
> > +	if (sub->name)
> > +		verbose(env, "%s():\n", sub->name);
> > +	else
> > +		verbose(env, "subprog#%ld:\n", sub - env->subprog_info);
>=20
> [Severity: Low]
> Similar to the previous comment, does this need %td instead of %ld for th=
e
> ptrdiff_t type?

Okay

> > +	env->prev_linfo =3D NULL;
> > +	for (i =3D sub->start; i < end; i++) {
> > +		verbose_linfo(env, i, "=C2=A0 ; ");
> > +		verbose(env, "=C2=A0 %d: ", i);
> > +		bpf_verbose_insn(env, &env->prog->insnsi[i]);
> > +		if (bpf_is_ldimm64(&env->prog->insnsi[i]))
> > +			i++;
> > +	}
> > +}
> > +
> > +/*
> > + * Print several most visited simulated stack traces,
> > + * and a disasembly of related subprograms.
> > + */
> > +static void print_hotspots(struct bpf_verifier_env *env)
> > +{
> > +	DECLARE_BITMAP(printed_subs, BPF_MAX_SUBPROGS) =3D {};
>=20
> [Severity: High]
> Does this code overflow the stack array when processing fake or exception
> subprograms?
>=20
> The verifier allocates extra slots for fake and exception subprograms, me=
aning
> env->subprog_cnt can reach BPF_MAX_SUBPROGS + 2. Sizing the bitmap strict=
ly
> for BPF_MAX_SUBPROGS could result in out-of-bounds stack writes in the lo=
op
> below.

Good point.

> > +	struct bpf_callchain_entry *top[3] =3D {};
> > +	struct bpf_callchain_entry *entry;
> > +	struct bpf_subprog_info *sub;
> > +	int i, j, bkt, nr_top =3D 0;
>=20
> [ ... ]
>=20
> > +	for_each_set_bit(i, printed_subs, env->subprog_cnt) {
> > +		disasm_subprog(env, &env->subprog_info[i]);
> > +		verbose(env, "\n");
> > +	}
> > +
> > +	/* Print the hot callchains */
> > +	for (i =3D 0; i < nr_top; i++) {
> > +		print_callchain_entry(env, top[i], i + 1);
> > +		verbose(env, "\n");
> > +	}
> > +}
>=20
> [Severity: Low]
> Could printing the disassemblies first cause the callchain summary to be
> truncated?
>=20
> For non-trivial BPF programs, subprograms can contain thousands of
> instructions. If these are printed before the hot callchains, the
> user-provided log buffer might fill up completely, preventing the actual
> callchain summary from being visible.

That's fine, app always can pass a bigger buffer.
Humans look at the log end to see the error.
I suspect bots do too.
