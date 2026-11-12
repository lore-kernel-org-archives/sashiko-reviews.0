Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794462479;
	b=nVE1xWDIhiapvIQae4cpaM0zW+N6ygyLEa6NBgCZhDaWN1yJFuPcNXZ6Nq0iYzuh5q9F
	 KI0i9sXo1rEkXxXjf/bY0yZdKM3FQlWz4uoXqt8ReHdLICKvC+/55US2PTXJPB1UfcRNU
	 flAYJ0lJLyzsxXhIHm8Qqnb98wYXJIWUq1IV/Ho2hR6QcGpmdOTvS3rSru74vvBef+iVq
	 GR/OgVPlxzEncoQCJUpvZFCJ6dpUsXlHnY2jH9BveuaCYqt0053IsIUDW/G8BkJQVYaQY
	 IgTe9gkP33l4kIZ7zflMyVdaP1hvJSggWuQJg0f2pTbKn7GPFr3udx73ufeFagOO8Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794462479;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=YUA91tQZCWZqcmBzWPF8HIacecdJUnqUabvXTPPTHkg=;
	b=h7auACHLZDnfGvPlOqLSvrupoxvlMV8yLXRR/sd7xTx8moEmYbqj39JYN7Fx3nm8eiFx
	 o80G0mHjQ/vPMCJt4xWAQk5iYANWvYnjtOIaTgNR0zNx04ZV7Je4vp+KcumG7/kCogIvK
	 Fc3FI4DhLp0VXhZGI7BpTA9kicWgiydoRRdnPaBmZngV+bhBzp3IiK7W6wanhdabpLYXQ
	 so7oQC4/STWOOR+qshPLb3+QrMhZN5aCRlkgfdTkxH7CcgIk+zsvcftDs/p9PFXk3U6Oy
	 8tcn+nVD1wcqjJ5dhwTtOwFz5j7pdbFYjn1z+cHJBw9y+HD7jcHpJS5fNII6OCNpKZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fht3FoDv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDC0606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 05:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fht3FoDv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68CCE1F00AC7
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 05:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794462479;
	bh=YUA91tQZCWZqcmBzWPF8HIacecdJUnqUabvXTPPTHkg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fht3FoDvB+q049SLtodYssmQY0Qxo+AuNKRxdlljYSHxQEtdWHhCIm5KrI4d22404
	 blFpCgXbtyIsQOnTyvmLe1btup4T/xoaOoUctYbnj608YZ+OpRZxw4I5MwGIcUqmJM
	 4VFSeSVRdmIoctMNI7N0vlb50hvbY6ch+3a4/h77QgjO12Fd8CWBlN1EB+OG/5K+xX
	 ZiIsROYqx12XWIaRxEEHD4Z5dUsKcxu5nPEivP3LYjY+SG++dwpc47kZu0jmC78RhJ
	 8ceRK4aGI6S6rJ2GgAWSM1pBYiZ8BgxW52HltZLXyH91ZDR0kyLHaDwftGi0ptBCxl
	 j8b4caTG92H0g==
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93cc1ab5f6cso494256585a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 21:47:59 -0800 (PST)
X-Gm-Message-State: APuU4Z995lNba+6w+q5aYB5Vs4g+K/RBj41LWwAZJYeD1yABzvEMazz9
	7gUREyF2g44/9lqDzUjVbaaylOlCe8xXiDLq5/Y1sK2CTrNvUhUm2k49AMoqJvn+OCEaUWJGi0f
	FuQcVC6Jho+5iLvNR2LuSFfta42XFjGE=
X-Received: by 2002:a05:620a:294c:b0:93e:c12c:fbb7 with SMTP id
 af79cd13be357-947b0051f3emr811615585a.68.1794462478686; Wed, 11 Nov 2026
 21:47:58 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261111232603.9934-1-baohua@kernel.org> <20261111232603.9934-11-baohua@kernel.org>
 <sashiko-outbox-210418@kernel.org>
In-Reply-To: <sashiko-outbox-210418@kernel.org>
From: Barry Song <baohua@kernel.org>
Date: Thu, 12 Nov 2026 13:47:47 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4w43aNBSyeSPFkrh0fz-cjj6c-CiQaecAhEev2=RAXHQA@mail.gmail.com>
X-Gm-Features: AclHuK9H902EhM6rH5pgcuZ3RxLool5O2usQFiRRey20oLFUrjntUL0oCOYz3Yo
Message-ID: <CAGsJ_4w43aNBSyeSPFkrh0fz-cjj6c-CiQaecAhEev2=RAXHQA@mail.gmail.com>
Subject: Re: [PATCH v7 10/16] mm/mglru: Run aging when pages are rare outside
 the youngest gen
To: sashiko-reviews@lists.linux.dev
Cc: akpm@linux-foundation.org, axelrasmussen@google.com, 
	baolin.wang@linux.alibaba.com, baoquan.he@linux.dev, hannes@cmpxchg.org, 
	hui.zhu@linux.dev, kasong@tencent.com, kunwu.chan@gmail.com, 
	liam@infradead.org, lianux.mm@gmail.com, linux-mm@kvack.org, 
	liuxiang.277@bytedance.com, lyugaofei@xiaomi.com, mhocko@kernel.org, 
	mhocko@suse.com, qi.zheng@linux.dev, ridong.chen@linux.dev, rppt@kernel.org, 
	ryncsn@gmail.com, shakeel.butt@linux.dev, surenb@google.com, 
	wangzicheng@honor.com, weixugc@google.com, yuanchu@google.com, 
	zhangbo56@xiaomi.com, zhuhui@kylinos.cn, sidchintamaneni@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 1:01=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] mm/mglru: single-word handle used in commit Author and
>   Signed-off-by trailer
> --
>
> commit e3df19968a61ac9c4f39eb92e538d862f157c5ad
> Author: lyugaofei <lyugaofei@xiaomi.com>
>
> > mm/mglru: Run aging when pages are rare outside the youngest gen
> >
> > Run aging when the total number of pages outside the youngest
> > generation across both types falls below 1/MAX_NR_GENS of the number
> > of pages in the youngest generation. For extreme swappiness values
> > such as 1 and 200, also consider the balance of the corresponding
> > type.
> >
> > This improves reclaim efficiency, especially at extreme swappiness
> > values, while reducing system time.
> >
> > To avoid the overhead of aging, we only allow imbalance-based aging
> > when the reclaim priority is low enough that we might reclaim the
> > youngest generation.
> >
> > Signed-off-by: lyugaofei <lyugaofei@xiaomi.com>
> > Co-developed-by: Barry Song (Xiaomi) <baohua@kernel.org>
> > Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
>
> [Severity: High]
> The Author header and the first Signed-off-by trailer use the single-word
> handle "lyugaofei" instead of a full real human name, which does not meet
> the Developer's Certificate of Origin requirements in
> Documentation/process/submitting-patches.rst.

Okay, let me change it to

Gaofei Lyu <lyugaofei@xiaomi.com>

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111232603.99=
34-1-baohua@kernel.org?part=3D10
