Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339AB43E484
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 12:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870178; cv=pass; b=AwcClwPpGUH9Jo4eU/CFceANInAUMIlPOs1enykZ+Z0PFwJ1XJb2J6wNtEXU2fR+nmrhaOD7j1qjjuA1DJGNy6dsO445MvSNfhEP2o01OIw+6b1PJGPd5VLXS64VskEbwEmDxmaiGTCt26sajTX7mySUWlwLZDC7EId9ZBYf6Bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870178; c=relaxed/simple;
	bh=jNKMxx0MOdU8RjRdPogMBdpEV9wM37Jz7FMCb1o4W3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBDoi6lewz0kUq1HoIwnlRR7aLzqxLjOsQhLKQZZow/pmfDAg3U5GgIb5swfw4CWsPxeb9x1PlW2hJkC4a21rtA6fExYz/DXuJqt50typpQgTNYZ1DFA23BQT8+VfFT2JzVePZ9Z/qxfuQGCVdAHRIY2F5mAabxb5HX9sqg5LLg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRzpEQ7j; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRzpEQ7j"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c25420fe973so792140166b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 05:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788870175; cv=none;
        d=google.com; s=arc-20260327;
        b=BcNXkz9xPQ5ISgTPcr6L4YXOk0jvV7VVu9QxFL5EVk9QaoqOPPoPIiVYFMh0KKHLdB
         +8omrN9JctHFazRnpfMjJtkZrWfm4T74fxtJ4cCqHOXtHdUG5pcRa2q7bMOkrPDhSyUf
         rdqRGCmMJ7dn1IjNBvEM6vO2boAwB0v13WiYR7DqZXwRchWy3IPEtoEu5CkUgwYCVwDe
         dSpeVtCHtIlkJv7uY9eh/dBTMmIRgpItnDIILKJCt3dN3XXVETp+6qVb1YeRnKp2TWMk
         4ny/MOTYxgosYoHltVyyxh1LcZQ/LXOlqtwV6hAjh9jvxU0tKS7a2k5JI/CC3srSmBLC
         RO8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SOTX3LhGaqV8k/2U8+BV0Xzd4XXbDTqUOYRoKAoVoyM=;
        fh=MwAi/5DKc2ZglTguM9FLI4ELM6x9cS67TGfSCdkhRFI=;
        b=U0pCIZyEQNr0i9WN7EUYY6bNmV02YqR+CkghkiMgPI87sZEcD5TvMnfavHttTJizla
         SkegoA92n6ZFkP4EdfGIaLCePG9iARP/rPDeoEJ8276I3iNKC1o+0MxG4bQb/mY8ycuk
         spCJydm5KkRJN8qwUUarUqxTb1M4BrXuhKZDeuFVp5dAFDakRk/EZ3UEifhwsdzTFj/x
         gZLzVXNW0/tAV53uWU0pvjZTCBCevkoPO65sACkAevc8um+p0uXgV0B9LmoS6IOcozu4
         PHc7vP5VbCUCRo5XDQhN1sYZREg1gQk6UlH9BR7zxTvHP91/+KrZ3Aw2QinI6ENgTh6U
         MWJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788870175; x=1789474975; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SOTX3LhGaqV8k/2U8+BV0Xzd4XXbDTqUOYRoKAoVoyM=;
        b=nRzpEQ7j/vKDG2ErB62+CeyeeD7/X2fuYWYvZzNnaILSdTS5F6O0BhfQaTAFdQjI99
         RZA98+QeyR3Poz8bgFunsdMLIrtDj19/aa20J3JOn+6lgWApJ4G1n/gn+8MOi58ummmz
         6iYTEbE9IFUIoZNkEdq0Dn/fly7KZgN0s0uHiNJGc+NOXPh1BEHHUIahVFwldtWFrns0
         Ui4v6JnLoh/rLPD5LCavAMbCkV0jrkq2B+kIESN0LrD3LLNfUpS9Q9SYBh4KZCm0NCuP
         jZvNWuBwP48rXt4OCtwCpU1nWIvUGCaAG1pbHXdXTjgasz/Qx9WtewyKOXHNWfOMM1P6
         ordQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788870175; x=1789474975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SOTX3LhGaqV8k/2U8+BV0Xzd4XXbDTqUOYRoKAoVoyM=;
        b=XWXGnRCbwJjflX6PRala299p55FE6sxm3aOguf5+aQOZTFRPEk5batrNHWPc1ZiC7a
         DQTXdtGWLfGBQvc9wtsTwIZx96MAlmt14B7cWB0SxvIh5UVIa0Ct3VridbhuIK9C8reB
         Ce7s4aiQUd7XN84LnasxDca2FBTZnwD28q/Dz50RwwX/PdTa6ZmNbvLybrhM9nnT7tRd
         3U92O53xS9h8QmFX7JoVmXr7ZKV3KQ79oYg0//xuGyQoBrs440fMnys2znobUP2USRJ4
         +Ac8/zwccCvfNsrQ7HkjMaYTPYUysCzK6NAQHlAhs/vjbdfBXarGyGQl1K4C8h6fwt0D
         oldw==
X-Gm-Message-State: AFuF++kTsYk3AaCYkLBK/Z7FPaY/jozSMtEj1FWpWtG06bCp6OPITL1i
	74VpDTHpOqIAfNDdvRYs3ckAi0lATJUvNEAIUfpIw3dMUnDmRW43t/lujoUmlToKzJl5SulTS1+
	ANEwf82bQlO5o4shbCgF1dIauvxGqFuw=
X-Gm-Gg: AYBFou3G0QuJ5ANGOzSsaZqQ7ODcKO93FJKX/m5YFqwTX2E/obdokw9Z9w+6G1hJFFO
	VApmTiBBX+kZf8dLp//F743uD0yZr61yVU452kC4kcuGCSwpLQL7Jlaweb/UaEwB+PZ+c1iLWzR
	CLGDcjDkOe3JcOXw8IkFxyCgRpty9FVjfrSxfDfHQN0Gq+Li3b91Br5AgoytegAPHdh1/xPRc+4
	K2e/QrIRzvjo3cWtD4sTaOLic4S/vGG3uS2w2IpPvAoDGMtHSqw/ockA5hiM5G0WoMq/rKidl6L
	aAghfGLet3E92IX/6T9/OUsJu2n4QknIC9QnLWfdC5tZGLTo669x/GjENEVk
X-Received: by 2002:a17:907:d01:b0:c26:19de:913a with SMTP id
 a640c23a62f3a-c2619dea224mr932569166b.45.1788870175001; Tue, 08 Sep 2026
 05:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907134552.1772405-1-puranjay@kernel.org> <20260907134552.1772405-2-puranjay@kernel.org>
 <20260907140642.B02581F00A3A@smtp.kernel.org> <CANk7y0j33fmyQyTvL37Tx6Ua_bGfT5n_=Smw44u_H7G6rMcr_Q@mail.gmail.com>
 <CAADnVQLeCzCAF1Ku2Ri=PUfespAKPMEO_qQLJ1XEhAtLERgeBA@mail.gmail.com>
In-Reply-To: <CAADnVQLeCzCAF1Ku2Ri=PUfespAKPMEO_qQLJ1XEhAtLERgeBA@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Tue, 8 Sep 2026 13:22:40 +0100
X-Gm-Features: AcwNN1VRXI7Dc37t9BPlMRYUgwE1HIP92RRwvyEJXlseQFtzU6l3-Rs3wMRGzow
Message-ID: <CANk7y0gizeJe9tx12a+8VzBAAgzAh1G3N+Ru9mJ+4GJwW1CW+w@mail.gmail.com>
Subject: Re: [PATCH bpf-next 1/4] bpf: Add bpf_call_rcu() kfunc
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 1:19=E2=80=AFAM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Mon, Sep 7, 2026 at 7:39=E2=80=AFAM Puranjay Mohan <puranjay12@gmail.c=
om> wrote:
> >
> > On Mon, Sep 7, 2026 at 3:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> > >
> > > Thank you for your contribution! Sashiko AI review found 1 potential =
issue(s) to consider:
> > > - [High] Calling `bpf_call_rcu` from NMI context causes a raw spinloc=
k deadlock because `call_rcu()` is not NMI-safe.
> > > --
> > >
> > > commit 3385037afe11a72dffbb6db99b4174626596c231
> > > Author: Puranjay Mohan <puranjay@kernel.org>
> > >
> > > bpf: Add bpf_call_rcu() kfunc
> > >
> > > This commit adds a new bpf_call_rcu kfunc that allows BPF programs to=
 defer
> > > operations using RCU grace periods.
> > >
> > > > diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> > > > --- a/kernel/bpf/helpers.c
> > > > +++ b/kernel/bpf/helpers.c
> > > [ ... ]
> > > > +__bpf_kfunc int bpf_call_rcu(struct bpf_rcu_head *rh, void *map__c=
onst_map,
> > > > +                          bpf_rcu_callback_t callback, struct bpf_=
prog_aux *aux)
> > > > +{
> > > [ ... ]
> > > > +     rhk->callback_fn =3D (bpf_callback_t)(void *)callback;
> > > > +     rhk->map =3D map;
> > > > +     rhk->prog =3D prog;
> > > > +     call_rcu(&rhk->rcu, bpf_rcu_run_callback);
> > >
> > > [Severity: High]
> > > Does this code risk a raw spinlock deadlock if called from an NMI con=
text?
> > >
> > > Because bpf_call_rcu is exposed to tracing programs, it can be invoke=
d from
> > > NMI contexts, such as when a tracing program is attached to a perf ev=
ent.
> > > However, call_rcu acquires rcu_node raw spinlocks and is not NMI-safe=
. If
> > > the NMI interrupts a path that already holds the same rcu_node lock, =
the
> > > system will attempt to re-acquire the lock, resulting in a deadlock.
> > >
> > > Should the verifier restrict this kfunc from being called in NMI cont=
exts,
> > > similar to how it uses btf_record_has_nmi_unsafe_fields for bpf_obj_d=
rop?
> >
> > This set is supposed to land after the rcu changes that allow call_rcu
> > to work from NMI have landed. Please see the cover letter for the link
> > to that patchset.
>
> The patch would need to be updated as s/call_rcu/call_rcu_nolock/ ?
> or more will be required?
> If the former then we can land it now.

There will be no call_rcu_nolock(), we decided to make the standard
call_rcu() be safe to be called from anywhere, so no change is
required to this set. But it needs to land after call_rcu() changes
land, or maybe rcu and bpf tree can co-ordinate somehow?

>
> Also notice how your LLM doesn't know about your earlier work ;)
> + rcu_read_lock();
> + migrate_disable();
>
> that should have been ...

You mean rcu_read_lock_dont_migrate(); right ? Will change in v2.
