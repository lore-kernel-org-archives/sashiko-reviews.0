Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E48330662
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320002; cv=pass; b=B+eoDawx4zesxnTo5Ihdfim8Mbl/bR1mdF9jLrrw87dLNNClX+OB+CAzdE7ni39kTDKqSFH0Sps2W8TvcSgyQ0k9Zs0RSbm+9jL3ESFIRAlH8QA4DkHJPhnl6VxtrBt5EL0Z0LpkNUE41LM/uY2vFqT4sbKwoeHw4SeqtFn59NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320002; c=relaxed/simple;
	bh=1YKOn6iykGR+PpfgAmVKfnTkua3jmSo3nJ/j1AVT4Gk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FmV//ZHazZsCsxSGi1EO3nKxAEcT8t/A8wC6ib9onnzlreXPuECGc5dDklIJZnl+e25u+mHqU6olJV+A80neBPMqHEVzgALu1wzQlTh0aTsyEYmO2pXBOg4cgmapdn3g6ofMo8XJFGHpLiaelm9xui3kzVKXGlyGzru84iRY3Bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AN41GLqM; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AN41GLqM"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c7cfa17fedso10274435ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 09:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782320000; cv=none;
        d=google.com; s=arc-20240605;
        b=TR4mq4hi0eXwQE0/s+7/6fWimFla826OXTHIDCcKXYFbjjr4OvpxrWcIYEnfo4N/FZ
         /RPf+0rLL8yXB4qzSlQ5D+rlcGP1ZBWHrIyaKyGuR4VozZ4Pun6c/LLixILThCa85PDs
         x+kMP36J6pnz7MrcdA9DCj/gVW0pALW1Q4MzCsS++hTzWtP7I7UoHhvOk2x2/1aTDeWU
         o1cJcHVkYtKtl5ulHBp2SuvIgB+NBoOkgtsqy7IrV6hgtnvo9g6O36N7ttj/4r/eSpt9
         U8gAhxwQP8g+/pooF1UKlvtQ0/I0nmwKAegX6wxR5CBj6MCYuM++r1PEPdMlv6A/kYvL
         QUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8BIRn0WlxcOKwd3gT1ODjWCiP9As9Dq4sSxam8CvvJo=;
        fh=mTP6TkWV1IhQRgyhsEpYqIpiXvhDlZKdHAfNRdOTDjk=;
        b=CzRChLFAVztfjtiTEpGEWllZereGc3iRyiX8fD8NJlWGLpz0v+is3Y1/oax2qZigk2
         uSF9/6TpLiSamboDa03WXadcrJpLOG1NC9TR0DgQdQrIHkQmHn3/LUBdQkBQLXyHd1lc
         egl+VwkWoX2M7jVoVXoiUQVux88VVnmveDd+qGzwngEfFLXqfuItBON59iD6FUt7WKt5
         6KOMxAe7+ksX7h3+JCFmgLWB1RhMjLD/lyhj8fwxcwsyNVysGW8vZeB87Cp8GliFnsxS
         6vLh9AsQPUzptAeIz1PXOJXQS1N9F9m+VMylgJ5mEDISQcoz50HAQTDxzZt40NVLb+jX
         U7hw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782320000; x=1782924800; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BIRn0WlxcOKwd3gT1ODjWCiP9As9Dq4sSxam8CvvJo=;
        b=AN41GLqMQ3kb8intMQYz8r0kAOI+QDbtxeXsF+H/67UjGAktkrEdZRekxkbNS5aWYK
         nW7jBQCi0VDBSbbWh/qsSLYXlRzT368SX/gc0Fn5SrxtzYk0fWVvg29Yy6WoGqXrplEt
         DQL2GH+cFRgxLpQEl+/1aX7YVbSpxK6qOktnVQsJzKk3nivWebzqaqRhZJ48ER7DPKWp
         6HZFMXy68PHLXtQ8H9DAJA/zggMqunt4V6hf0LZaOtAOzvGfSs3GbkhjgDUHCuqrH99u
         UAnRWAqX7l00oV5d83qOHPe1Gu5jh3sBP1+c5gG7gr0zJB6Fbmm4gbDrkWlYNiS12wQl
         HmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782320000; x=1782924800;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8BIRn0WlxcOKwd3gT1ODjWCiP9As9Dq4sSxam8CvvJo=;
        b=kTkAcNsBu0cyXpb5gI+d4a+1l2rbJbdSiKJGaBSXtq8ztF8XXEVpsBIkqjdhg08GuO
         UXE2hVzWCpW0OEx5pUbM4XshNDfPwXrqyca98d5PPnezOM7C0TmKYKfRpvGaSRcLINOk
         XlUuqLkCvwlKOre0pd88askHD76qZOeeGTX7th/sQ3KDFWDvnMGMRqKoaH7qHaIGRRWW
         DHLpQ6rt7xLNoap7OV10KWto3AHy9GeQBP5cXRCJz1PKnJtvzB+RWO8NrzOoh+Hpi+h+
         /teFea6lgKw492F3FgMOMto0yA1V4Zc1llqpDf5dgoLPY1aTuF/fHJduhowvef3CqEDb
         m0rQ==
X-Gm-Message-State: AOJu0YwRWAImXFW6XPqX/yyX2plMIbrgmVbqZgvmbrAd/W4zu1wc9Slw
	c5QeHs2RMdECwfbVBaNbw2A8o4e/UGaoLR1/UmsePUlYxNnxqSs9J9g4MDhoFzXDOOOdA9ewxGw
	3PM5yifeHwOfE0Lcfhf2Ikjd7bgE304zht7WgfaWg+w==
X-Gm-Gg: AfdE7cnHCqToUOsX4tmrcZdbMRVQ2T4LL++7KFu7RytXj5gxjuA4SR24SzXeVx/AFMT
	ozjm+g88jYYZ7fpeJgoaZ7/6sMNbVvx+onqJ1VuABdB2iQet0tvQbvtn090azj59lQQuvWXjij4
	enVytYgIiOn8NrTZGwMBGmrjMWPQJnXpb/y73fM9e5DZ/7PsUZAKZkk4lr1kujQ6C9kMbKd4glD
	Jcg78qkr1xJCegTV+wrtxoCwfiVDcEqAjn3S7vihBtXEiexzh6MZSgPfK/P9dXU4XBv+8TiXHFl
	O2srq4VqWp4xeHagSFFSBJnqKYhMhc3BPkTPXPmldTOZuq+Jlo1vKDSGJRYytS9TFM7kb9Ai1F5
	8tj7UEbcFOgv7IEvP6eXQzh4=
X-Received: by 2002:a17:902:ea12:b0:2c6:a76c:3c6a with SMTP id
 d9443c01a7336-2c7e1465892mr46323745ad.9.1782320000213; Wed, 24 Jun 2026
 09:53:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624155452.211646-1-nishidafmly@gmail.com>
 <20260624155452.211646-7-nishidafmly@gmail.com> <20260624160726.2B9161F000E9@smtp.kernel.org>
In-Reply-To: <20260624160726.2B9161F000E9@smtp.kernel.org>
From: Hiroshi Nishida <nishidafmly@gmail.com>
Date: Wed, 24 Jun 2026 09:53:08 -0700
X-Gm-Features: AVVi8CdzUzUpWfTZUjvJHGvAckn35Sku1BaU2R15oqRJV6Hh0aAtw4sO4uhAZmM
Message-ID: <CAE1ksKTBHgcUqb-qw8N5FYc895sniwNqesW9AsPYJ-xeqe_DkQ@mail.gmail.com>
Subject: Re: [PATCH 6/8] md/raid5: allocate worker groups per NUMA node
To: sashiko-reviews@lists.linux.dev
Cc: linux-raid@vger.kernel.org, yukuai@fygo.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> [High] kzalloc_node(size, GFP_NOIO, i) -- i is a sequential index, not a =
node ID
> [High, pre-existing] worker_groups sized by num_possible_nodes() but inde=
xed
> by node ID -> OOB on sparse NUMA

Both are valid.
The kzalloc_node(..., i) is wrong on sparse NUMA node IDs -- i runs
0..num_possible_nodes()-1, which only equals the node ID when nodes
are dense -- and it rides on the pre-existing assumption that the
worker_groups array (sized by the node *count*) can be indexed by
cpu_to_node().

The NUMA-locality win here is multi-socket-only and I don't have a
measurement to justify it, so rather than grow this into a sparse-NUMA
correctness fix I'll
drop this patch from v2.
The pre-existing worker_groups sizing/indexing issue is real and
separate; thanks for catching it.

Thanks,


2026=E5=B9=B46=E6=9C=8824=E6=97=A5(=E6=B0=B4) 9:07 <sashiko-bot@kernel.org>=
:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] The patch incorrectly uses a sequential loop index `i` as the NU=
MA node ID parameter to `kzalloc_node()`.
>
> Pre-existing issues:
> - [High] The `worker_groups` array is sized using `num_possible_nodes()` =
but is indexed by the raw NUMA node ID, leading to out-of-bounds accesses o=
n systems with sparse NUMA node IDs.
> --
>
> commit bce08bf6ce446b00da625ff4028f5782b756e17c
> Author: Hiroshi Nishida <nishidafmly@gmail.com>
>
> md/raid5: allocate worker groups per NUMA node
>
> alloc_thread_groups() previously allocated all r5worker arrays in a
> single kcalloc() block, assigning workers for NUMA node N from node 0
> memory.  On multi-socket systems this causes remote memory traffic on
> every worker->work and worker->temp_inactive_list access.
>
> > diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> > index 8e9edaaca667b..c8787ab7b309c 100644
> > --- a/drivers/md/raid5.c
> > +++ b/drivers/md/raid5.c
> [ ... ]
> > @@ -7336,7 +7340,6 @@ static int alloc_thread_groups(struct r5conf *con=
f, int cnt, int *group_cnt,
> [ ... ]
> >       *group_cnt =3D num_possible_nodes();
> > -     size =3D sizeof(struct r5worker) * cnt;
> > -     workers =3D kcalloc(size, *group_cnt, GFP_NOIO);
> >       *worker_groups =3D kzalloc_objs(struct r5worker_group, *group_cnt=
,
> >                                     GFP_NOIO);
>
> [Severity: High]
> This isn't a bug introduced by this patch, but could this array sizing ca=
use
> an out-of-bounds access on systems with sparse NUMA nodes?
>
> We size the worker_groups array using num_possible_nodes(), which is a co=
unt.
> On systems with sparse NUMA node IDs (for example, nodes 0 and 8), the ar=
ray
> would only have 2 elements. Later, in raid5_wakeup_stripe_thread(), we in=
dex
> into this array using cpu_to_group(cpu) which expands to cpu_to_node(cpu)=
.
> If a CPU belongs to node 8, we would access conf->worker_groups[8], excee=
ding
> the allocated size and corrupting memory.
>
> > -     if (!*worker_groups || !workers) {
> > -             kfree(workers);
> > -             kfree(*worker_groups);
> > +     if (!*worker_groups)
> >               return -ENOMEM;
> > -     }
> >
> > +     size =3D sizeof(struct r5worker) * cnt;
> >       for (i =3D 0; i < *group_cnt; i++) {
> > -             struct r5worker_group *group;
> > +             struct r5worker_group *group =3D &(*worker_groups)[i];
> > +             struct r5worker *workers;
> > +
> > +             workers =3D kzalloc_node(size, GFP_NOIO, i);
>
> [Severity: High]
> Could passing the sequential loop index i directly to kzalloc_node cause =
a
> NULL pointer dereference on systems with sparse NUMA nodes?
>
> Since num_possible_nodes returns a count rather than an upper bound on ID=
s,
> on a system with nodes 0 and 8, i would be evaluated as 1. Passing an
> unpopulated node ID to kzalloc_node without validation can lead to a cras=
h
> when accessing NODE_DATA(nid). Should this loop use
> for_each_node_state(nid, N_MEMORY) or similar to get the actual node ID
> instead of using the loop counter?
>
> > +             if (!workers)
> > +                     goto out_free;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624155452.21=
1646-1-nishidafmly@gmail.com?part=3D6



--=20
Hiroshi Nishida
nishidafmly@gmail.com
