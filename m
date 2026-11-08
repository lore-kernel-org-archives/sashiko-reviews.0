Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122437;
	b=EY/TVcAmu25zyDVamscqDIyCU0f6Ovsu5LmRJ/Tr85ISn8dpyLkYBzuXAfL3JCMh9q9E
	 NmEJIJy+6aYKv0kKUjM0u0TBY8JWToI/ULM9vqbTBYHpKDnsGvpg+S2JEzUcCYkv6mRiv
	 vxP1CmAoOqkrHH/tkHW0FSi7yfXVzeRi2LheMi6RZVWmFicMgfkByLzcMgdvD+4+c41qW
	 eGaCJfW3LZ5A9SXDsgJ0J6SaeAB7fwOONxMUw1hFAaGELrg1wEa3JxL1OsFVU77ssW7u0
	 eCUWCYxt5qXtWCPiVQRllsLVEWSM/iEKPmuqLk1ZdrsgL0H43T3ts/vQB/04bjQyjaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122437;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=j18geaHLD1uUk2z5k4sfYhqgD5g0IHFNcch65ifUnps=;
	b=GOwZWrTfZ5mW7G2Nu/DNjmJAiOLOW1mqzd4Wd/qGXhX8VzNOXinnRPqlFhe8HHDW0FLF
	 PId7yfVFNa6AZijiGJ9peqKscppuWvO3hvz71Q83q7ZXnpTHiS2ToGprrFOZV6Sw+rVn4
	 BtQBUT2oUTrMSGd2vYVst/9KZDjU9ZU+WxV9Z3zdwifcq7G5bsRGH9p4b5TSLaBpULdCr
	 yeeV58CCYAz9zO3xB9e978446jFvSiOW2ymUa+k+TZMf+eTaQof86Vw1z/CsULTVALs7I
	 +Uc412tvHCTG1n+erwJUSg+8GiOjtvJZYSnLUiB6uXBmB8DuXlVQNHPIwXKNayAewcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KmJIUAhz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5089D606A33A
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 07:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KmJIUAhz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE8F1F008AB
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 07:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794122436;
	bh=j18geaHLD1uUk2z5k4sfYhqgD5g0IHFNcch65ifUnps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KmJIUAhzlXwokVNzWv/F9AS1K5ad/V3iA5gCDilArxv5sraR14AMZ3OisCkmU9z2/
	 +hveOf474SCUSXPWj7zxl7XJ9RzQ7WeSF9L0Bl364CiIbARQ4Znd6bcLivij9U1k/R
	 6rQGU4+xhKvVF1b+OITPrKaZ1yalJJ32KziKNDUXbQzOBwrQF4aFQAfZ3bJpwkmHaw
	 O46P1YIISs4v1quulJkA6mVomFWEhPAc26ZaFduBxX0q5uVcG1Jwz2QQJCfWI8hDuu
	 FIIox84hfeP0KXjYkUdZrvTPhzlZv4cQm+/I0FFWz7BTVnQm1m4/XLIbyHEy9aCp2q
	 6NxoX0U3Tn8cw==
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-943e8d35f74so21119185a.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 23:20:36 -0800 (PST)
X-Gm-Message-State: APuU4Z+LT8yPxkucrRW6eD2pNVma6/ypb2aFkFLqS19RVGG+yBa/RfEn
	JcLEEXm4oObjMvmFA6jmvjA/ZE99ftoqhAIQkmJhnNPnpp2gl9tbyeYj2BGvCta0ft6/eEhokK3
	VqFR/JtCYMEFYm+ToHokyjwGnAryAau8=
X-Received: by 2002:a05:620a:6190:b0:945:d7a2:4b58 with SMTP id
 af79cd13be357-9478427d0f5mr101426485a.65.1794122436125; Sat, 07 Nov 2026
 23:20:36 -0800 (PST)
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
 <sashiko-outbox-200257@kernel.org> <au2_PPpdAMgRJZtX@gremlin>
In-Reply-To: <au2_PPpdAMgRJZtX@gremlin>
From: Barry Song <baohua@kernel.org>
Date: Sun, 8 Nov 2026 15:20:25 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yWQom=cG5vw2B-FR8+7wNU+rwZkvghjAxusym+3OH96A@mail.gmail.com>
X-Gm-Features: AclHuK82gk7ruViNEj2rccGK1fXvxCJcs3PhbZ9Er7PSONJ4wRSmOw3bXHmiVAU
Message-ID: <CAGsJ_4yWQom=cG5vw2B-FR8+7wNU+rwZkvghjAxusym+3OH96A@mail.gmail.com>
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

On Fri, Nov 6, 2026 at 7:53=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
[...]
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-late-2=
026-vma-flags-v1-0-0d3cd15ab75f@kernel.org?part=3D2
>
> It seems these are valid, oops!
>
> Andrew suggested a fix off-list, and I agreed to this as an in-place fixu=
p to
> avoid respin.
>
> I have also updated the series locally to reflect this change:

Seems like a reasonable fix. maybe_unlock_mmap_for_io()
could have released mmap_lock, leaving the VMA
unprotected. but  ra->size *=3D 2 is still going there no matter
if the vma has disappeared

For the original patch combined with the fix,

Reviewed-by: Barry Song <baohua@kernel.org>

>
> ----8<----
>  mm/filemap.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> --- a/mm/filemap.c~mm-filemap-convert-fault-and-readahead-logic-to-use-vm=
a_flags_t-fix
> +++ a/mm/filemap.c
> @@ -3410,6 +3410,7 @@ static struct file *do_sync_mmap_readahe
>
>         if (force_thp_readahead) {
>                 unsigned long folio_nr_pages =3D 1UL << thp_order;
> +               const bool random_read =3D vma_test(vma, VMA_RAND_READ_BI=
T);
>
>                 fpin =3D maybe_unlock_mmap_for_io(vmf, fpin);
>                 ractl._index &=3D ~(folio_nr_pages - 1);
> @@ -3418,7 +3419,7 @@ static struct file *do_sync_mmap_readahe
>                  * Fetch two folios so we get the chance to actually
>                  * readahead, unless we've been told not to.
>                  */
> -               if (!vma_test(vma, VMA_RAND_READ_BIT))
> +               if (!random_read)
>                         ra->size *=3D 2;
>                 ra->async_size =3D folio_nr_pages;
>                 ra->order =3D thp_order;
> @@ -3438,7 +3439,6 @@ static struct file *do_sync_mmap_readahe
>                  * pad that might exist between sections, which would be =
a waste
>                  * of memory.
>                  */
> -               struct vm_area_struct *vma =3D vmf->vma;
>                 const unsigned long start =3D vma_start_pgoff(vma);
>                 const unsigned long end =3D vma_end_pgoff(vma);
>                 unsigned long ra_end;
> _
>

Thanks,
Barry
