Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795118119;
	b=4P4GQTuG3Bu3Hv+5fQVHtn/AbpjEIPmxvSleaZuhKuC5RQgoAqphgW5IIRERrwIYf16i
	 N+byxpTNxPivRfvSKTn6rvkzs4qDRah2QtMSLyZbL4CtOaxVq3Vkkz6AyvwLiVzXQndFm
	 ZkzH6L4E0XZcJqn4XwyU2xVebaJKcA7YKEXQCfVmVb6YFLscNRuWVrq1ce8sH9LqpMYsJ
	 +euiFMYvuSVbukQDZGiWVUjpoSikRN6l6p5U5gx6+QtN6m0yQ4jWG7hiq78QzH0CFb/E6
	 QUW9e/UGrSc7BMUyC+0tTtaBn2PRONYbmmKd6nHECe1TkQZry8QCIZNYfsGeDPL780Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118119;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=35s+RMNvlfl/wiJfPyx4Nh4RZH0S+Tc8JWi1QrqJwTA=;
	b=hVE6yVwYkD+xuCdU+xYlWGrQqER0r1PGCLGZXQN8Fxl99OnHeDe9QDpcwCgmKJHuVr6a
	 ioKi7otrQRVW9QYfYdj/h15MkTpVa1G4VFyz6xpOXa40yRiX6iKGvDxC8jLhO3ie/3nvJ
	 5yZG7UoGugh9b2sncX04lw4pqE+N7xRCrSj4DKwqPLiEEsCwzajRoPG7rysMxTaYNnLTd
	 qltGI8TwZcrGPMbG/3Mn8XDFGPvU0X2bfz5WD87duX/z8oK+K+4qOKvijg6D7yko5urtM
	 hZt0ytHC0io28ngGQ5o5X+8Au7Ngl+FF/CP1ylBYIe3AgXfW6qjAYWmMnwK6ppkf3uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bwcuv0xv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67041606A326
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 19:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bwcuv0xv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FE151F0092B
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 19:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795118119;
	bh=35s+RMNvlfl/wiJfPyx4Nh4RZH0S+Tc8JWi1QrqJwTA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Bwcuv0xvRWIZi0iYptvepnDwZsox/yEKND3FagGiMz4tuatld5NR4iRI+8W9N2ZUY
	 C3CkKdCwjqXPHZ3ku7AkcFUb0oiBRttzNvLjp2qVhtvOMgli6e3ByYme5p54WYXg2u
	 XvkwmKZP0Y/cp/3W4Y0jDKmCcC/Cenq720CsDvD2GGdD8WSvzxSpmOLrQ+nGXOFe8v
	 T2FELSOM0/n6zKzOqb7myBaSAlf5G6h4HfJL2tZsmEB9kIrOeo42tlycrwEbXvpiZi
	 Y9n/ZZDk2gDrNrMfoSkARti5z5FAn42P0yAs0ix9tS0AA9nUj3c+fWbfn2BmCvXCKc
	 y0BgpyRoFo68Q==
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91eb46044c4so2525716d6.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 11:55:19 -0800 (PST)
X-Gm-Message-State: APuU4Z8jaIYZ/esZCnBwQKsFtzsIICWS4+HENmO687D0IeFJuSOMbYoL
	pWJmBjD654Hzlju24hfLpK2ju1ljG8KzEGl+awuYtcbTmkguQaEQxIxrryK1XapYTUEkqkyax3X
	gMyLZsnJ28OTjl7omZV0z9/lqNcjSvCE=
X-Received: by 2002:a05:620a:7113:b0:949:569a:a3fa with SMTP id
 af79cd13be357-949ba9b82f4mr119511485a.25.1795118118560; Thu, 19 Nov 2026
 11:55:18 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116081403.216452-1-max.kellermann@ionos.com>
 <20261116081403.216452-2-max.kellermann@ionos.com> <sashiko-outbox-218403@kernel.org>
In-Reply-To: <sashiko-outbox-218403@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Fri, 20 Nov 2026 03:55:04 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xFy98uy8bdM0Oc2jo70+8qRMWZPxVLEH=OrR1PHWvArA@mail.gmail.com>
X-Gm-Features: AclHuK9Qup0UNXttQIZa-5UUXq9oMnVeJ8Iy2VNwgLrdULffcmF_q6zw6AuOpWA
Message-ID: <CAGsJ_4xFy98uy8bdM0Oc2jo70+8qRMWZPxVLEH=OrR1PHWvArA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] include/linux/rculist_nulls: add hlist_nulls_add_behind_rcu()
To: sashiko-reviews@lists.linux.dev
Cc: Max Kellermann <max.kellermann@ionos.com>, akpm@linux-foundation.org, kasong@tencent.com, 
	qi.zheng@linux.dev, shakeel.butt@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, baoquan.he@linux.dev, 
	baolin.wang@linux.alibaba.com, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, hannes@cmpxchg.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 4:14=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] rculist_nulls: commit message mismatches
>   hlist_nulls_add_behind_last_rcu()
> --
>
> commit 8be860a8b1d9e4863e4165df073c841c355f9d25
> Author: Max Kellermann <max.kellermann@ionos.com>
>
> > include/linux/rculist_nulls: add hlist_nulls_add_behind_rcu()
> >
> > Move some code from hlist_nulls_add_tail_rcu() to the new function
> > hlist_nulls_add_behind_rcu() for callers that already know the last
> > node of an `hlist_nulls` list, to allow constant-time appends.
> >
> > Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
>
> [Severity: Low]
> The commit subject and message refer to hlist_nulls_add_behind_rcu(),
> whereas the helper added by the patch is named
> hlist_nulls_add_behind_last_rcu().

With the commit message fixed,

Reviewed-by: Barry Song <baohua@kernel.org>

I recall that Paul also gave his Reviewed-by tag earlier. Should we
pick it up as well?

https://lore.kernel.org/linux-mm/7037ee68-5dcb-46ed-a73f-ed6ea58915f4@paulm=
ck-laptop/

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116081403.21=
6452-1-max.kellermann@ionos.com?part=3D1
