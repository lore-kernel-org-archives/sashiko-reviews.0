Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794123770;
	b=vGUW1Fwl7++ILLrFAQusbCWaR41bAY058auql2oDKluDgp/Un2pdgapLBk1WsWGhKC/u
	 2ZEPjmbOZ2BIjWO9SS7eSvD9GIpqMjZNdaotbR94SJZWYACJNFK/rwqqvV1McCRoJdU2b
	 w2KFuAuEyt2Hrh8z1MNM+VVTFLuwryCZMLCz9biqaZ7UbXV6bN5+vcD3LY/E3a3wOuWMy
	 7a8aWL/xgYKOtBe4DqsbYdWyzxZOUO6yYowLyCBzzGvm8gvdkFU/A8y0aeEqAi/HDUYXM
	 9lRvr6E4Tmv/BUIJQQCCiLwkRuQMYvmYhl+nxcUJgZgLzUww+2odISq/s8mGXjkazRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794123770;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=hq7itTvys1Cr5iB10ff6BShqs7ZRME9USZpaeDEQWac=;
	b=h//8ihCmY/ZRBPk5f2ujnUkuWScXaHmWv9P3Qp4t6w1HSLy6XAYWzfFghN2ge7Tlgjfl
	 5bA/tQz+ihR5gHCLESDak7JqcjBZHKFjg/1YWGU8koxcuAM8qggv3xu4MmDn2zGCz6pjp
	 R1yMM90SQ3KK0d+LwOkFJ9iw9YR0raOUiw4K0zgjkM6UhH8gfb2vQi9EfaMxtyflCjm0E
	 gzTCJqaVvtAYOSNdZToSRC5XFGCqRQIvI3gPB/bossS59YMfgl7/6DG+4K3N9/pdeGsNA
	 tbSVPwyDtbg6pbQcQmz0LVYbLVVjkMym2hvNMS0EYsnLBvape59DmPMVRTy1cHC+wlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYzPMZ5U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CB2606A32A
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 07:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YYzPMZ5U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F371F00922
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 07:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794123768;
	bh=hq7itTvys1Cr5iB10ff6BShqs7ZRME9USZpaeDEQWac=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YYzPMZ5UtctcPpcRnUG9P28WIDENCXgambK8yjDHypKWPFGpIe6TmQSTfVWfDmpGF
	 htL/bA+oP45fy221Tgu6ZPP7QU2vcSC93rDug/R0h+uOCBTkU1oP0mPO+pyxMd5Jhv
	 CoAb6Li7/zd1myiQ7koRfQVHWASdDYrbjZukStnwggMZVNq956usiAsIIcWfeSGjdW
	 iSMgTz9CV0K5nqhUcTrsYwq+gTQ/+nc0FgUX+3dzs0cCh5Ji3aeDIDDg7dxyAQsBEH
	 YDOylo//GrfIXsoUpwEHk900nWB9bv6omEL9JYaoBp+LZY4PiSIKEnYc2zNwFMh3Sx
	 bBGE8vXHSK+Nw==
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93efc0452b5so13593085a.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 23:42:48 -0800 (PST)
X-Gm-Message-State: APuU4Z8VFvfz6jnOm2Z4gasceaYRlJ6HgOsB0FiakUxzQNxyxGu7b3Ew
	M0sZpmNeatpcs7HVPoZkUJX+EFIFAUAFeSAo70qa/6IjzVHL9LfviVhYILqAhoj7BMyTrqrc0lr
	8mnyfnv3Vy3Gj8B14BLSKGX6aQrnUfpw=
X-Received: by 2002:a05:620a:29c8:b0:93f:6f8:9d72 with SMTP id
 af79cd13be357-947842d0ca0mr101856885a.77.1794123767495; Sat, 07 Nov 2026
 23:42:47 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105-late-2026-vma-flags-v1-0-0d3cd15ab75f@kernel.org>
 <20261105-late-2026-vma-flags-v1-2-0d3cd15ab75f@kernel.org>
 <sashiko-outbox-200257@kernel.org> <au2_PPpdAMgRJZtX@gremlin> <CAGsJ_4yWQom=cG5vw2B-FR8+7wNU+rwZkvghjAxusym+3OH96A@mail.gmail.com>
In-Reply-To: <CAGsJ_4yWQom=cG5vw2B-FR8+7wNU+rwZkvghjAxusym+3OH96A@mail.gmail.com>
From: Barry Song <baohua@kernel.org>
Date: Sun, 8 Nov 2026 15:42:36 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zvRSUSspBe_hNwTYDjK3-TLuq6Mhi5gDyOPZGDXN8gDw@mail.gmail.com>
X-Gm-Features: AclHuK8HH9jkrTpk3YGZtn3OLDvb25GlEH8O5QS1DwT0MQXSYfuXeM9FnX7dKXs
Message-ID: <CAGsJ_4zvRSUSspBe_hNwTYDjK3-TLuq6Mhi5gDyOPZGDXN8gDw@mail.gmail.com>
Subject: Re: [PATCH 02/13] mm/filemap: convert fault and readahead logic to
 use vma_flags_t
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, 
	Peter Xu <peterx@redhat.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Rik van Riel <riel@surriel.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, 
	Lance Yang <lance.yang@linux.dev>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Pedro Falcato <pfalcato@suse.de>, 
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, 
	Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Leon Romanovsky <leon@kernel.org>, 
	SJ Park <sj@kernel.org>, Rakie Kim <rakie.kim@sk.com>, David Rientjes <rientjes@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Oleg Nesterov <oleg@redhat.com>, John Johansen <john.johansen@canonical.com>, 
	Georgia Garcia <georgia.garcia@canonical.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Roberto Sassu <roberto.sassu@huawei.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
	Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	linux-mm@kvack.org, kvm@vger.kernel.org, damon@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 3:20=E2=80=AFPM Barry Song <baohua@kernel.org> wrote=
:
>
> On Fri, Nov 6, 2026 at 7:53=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.=
org> wrote:
> [...]
> > > --
> > > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-late=
-2026-vma-flags-v1-0-0d3cd15ab75f@kernel.org?part=3D2
> >
> > It seems these are valid, oops!
> >
> > Andrew suggested a fix off-list, and I agreed to this as an in-place fi=
xup to
> > avoid respin.
> >
> > I have also updated the series locally to reflect this change:
>
> Seems like a reasonable fix. maybe_unlock_mmap_for_io()
> could have released mmap_lock, leaving the VMA
> unprotected. but  ra->size *=3D 2 is still going there no matter
> if the vma has disappeared
>
> For the original patch combined with the fix,
>
> Reviewed-by: Barry Song <baohua@kernel.org>
>

BTW, one question is whether mmap-based readahead is
still worthwhile if the VMA is actually gone after we
release mmap_lock (or the VMA lock). Perhaps we don't
need to continue readahead in that case.

However, we don't have a reliable way to know whether
the VMA is really gone until the page fault is retried.
We release the lock to perform readahead, so in this
racy case, readahead might be happening for a VMA that
is being removed.

I'm not challenging this patch, just leaving a note
to think about later :-)
