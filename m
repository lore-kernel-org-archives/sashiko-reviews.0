Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681899;
	b=m4Ta0yFG8QbF+o3BcLakYE1lU0a0kuTWvTMuNiDc5B1v+BdcmlFwkDM3SE9HqRlbI4T/
	 5VgSOqFmNcNFJQzJAKlVzB2xKgKXQMGJu1680+XvhnEVR0XVICe72sF3WCtl8CCsKbsoi
	 Nbhsq5WI5XGCm/BFqLwboVEOrBsMu9hkEjCpPlHcUL4lJZeEBEdC+w8tIQbyYODq29s9a
	 ymrk/mFYHUnd63nJNpDm1hHy0LDWqZnlTISbT0/403AjCly5hVMvj8KrzFM8vuhBgHePW
	 Kg+n1BXFu3Nd49OyLHlw4IpSokq8F2bbWj6IqOsVTf0Um51r0GGm8GO/TIdPgidsjBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681899;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=o3+nwKvgJC1gbMyJT4vyBOO6HuG+8MwwsJLmmSTGtP0=;
	b=lKxJJNpyn9JS9ILpblV6GrH7ST6ZBjAvnpfovruBoJckaGivpDEfMHssijySTtDYa6Ub
	 B9lbjovZbqshqMZYOgIQy4X73u+wEhE3yHuAkz431GMSq7pharwxOSzeAImPzVtzyCSLu
	 Q85h/BoMUpkaw/Qp3CYQh6lJ6ngfz0v/ef8x9S+jmDVBJAhTLSp2bbKdO4unDYZAG96Ns
	 9tQ7QRsB6+aZmrfsRlq9LT165KT1o4sJuSAkGVCsrj6icHOXPO7X3RudY2pYroXw868mz
	 MiqQ3xRFgkrGP93Qo7SQP7DBeyqgIU7VUhVPgSCu8EVvr7ACI3Nnr3bFeCkRhCCZexQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=NOv0yfLx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C676D606A329
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 18:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=NOv0yfLx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13D81F000C4;
	Sat, 14 Nov 2026 18:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794681898;
	bh=o3+nwKvgJC1gbMyJT4vyBOO6HuG+8MwwsJLmmSTGtP0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NOv0yfLxR99T3ZlPVWmiZ8UVimsrFAJeRIz25yN6bwZnp/bTkMaWxheIOCZ/KhokC
	 WgfnyrfkQYdf/R1kWfl+D/R4NMi2KQJsSQBcoF24yQafJ9r7BvPvD+NQAqdYBrIDEe
	 c0KOWhjsC+r8v8z2t3JvKwiyQjq6UqCHB3B2GzuM=
Date: Sat, 14 Nov 2026 10:44:57 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org, "John J. Coleman" <jocolema@redhat.com>,
 linux-mm@kvack.org, zenghui.yu@linux.dev, david@kernel.org,
 liam@infradead.org, ljs@kernel.org, mhocko@suse.com, peterx@redhat.com,
 rppt@kernel.org, surenb@google.com, vbabka@kernel.org, audra@redhat.com
Subject: Re: [PATCH] selftests/mm: allocate nr_pages based on pmd size for
 uffd pmd_move tests
Message-Id: <20261114104457.6b3247d9abaff0497a9ae545@linux-foundation.org>
In-Reply-To: <sashiko-outbox-214133@kernel.org>
References: <20261113040045.1439391-1-jocolema@redhat.com>
	<sashiko-outbox-214133@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 04:01:42 +0000 sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] selftests/mm: build failure from calling removed
>   read_pmd_pagesize()
> --
> 
> commit baaff8c2bca44f86cbdf0bcae24ee9317be43974
> Author: John J. Coleman <jocolema@redhat.com>
> 
> selftests/mm: allocate nr_pages based on pmd size for uffd pmd_move tests
> 
> This commit adds a pre_alloc callback for the move-pmd uffd unit tests to
> size nr_pages to twice the PMD page size divided by the base page size.
> 
> Link: https://lore.kernel.org/all/20261103202049.499206-1-jocolema@redhat.com
> 
> > diff --git a/tools/testing/selftests/mm/uffd-unit-tests.c b/tools/testing/selftests/mm/uffd-unit-tests.c
> > index 9641f4730a355..9668dccc11599 100644
> > --- a/tools/testing/selftests/mm/uffd-unit-tests.c
> > +++ b/tools/testing/selftests/mm/uffd-unit-tests.c
> > @@ -2484,6 +2484,20 @@ static void uffd_mmap_changing_test(uffd_global_test_opts_t *gopts, uffd_test_ar
> >  	uffd_test_pass();
> >  }
> >  
> > +static int set_pmd_pagesize_nr_pages(uffd_global_test_opts_t *gopts, const char **errmsg)
> > +{
> > +	uint64_t pmd_pagesize = read_pmd_pagesize();
> 
> [Severity: Medium]
> Should this call pmd_psize() instead of read_pmd_pagesize()?  Commit
> 3fe017016527 ("kselftest: mm: rename read_pmd_pagesize() to pmd_psize()")
> renamed this helper, so calling read_pmd_pagesize() breaks the build of
> uffd-unit-tests.

yup, that's the sort of thing which I get to fix.

my reviewbot said:

: The pre_alloc hook fixes the sizing problem. But on 4K-page,
: 2MiB-PMD systems it shrinks each test area from 32 MiB to 4 MiB.
: After alignment, move-pmd usually exercises one PMD-sized move
: instead of about fifteen. Please retain the existing minimum:
: 
: 	gopts->nr_pages = MAX(UFFD_TEST_MEM_SIZE, 2 * pmd_pagesize) /
: 			  gopts->page_size;
: 
: On arm64 with 64K pages, source initialization touches 1 GiB.
: The test also does not verify a huge PMD mapping: MADV_HUGEPAGE is
: advisory, and UFFDIO_MOVE can use its PTE path. That coverage
: limitation predates this patch.

So I came up with the below addition.  John, can you please check it?

From: Andrew Morton <akpm@linux-foundation.org>
Subject: selftests/mm: retain move-pmd coverage and verify huge PMDs
Date: Fri, 13 Nov 2026 20:35:51 -0800

The move-pmd tests need room for a PMD-aligned range. John J.
Coleman's patch [1] provides two PMD spans, but replaces the 32 MiB
default with 4 MiB on 4K-page, 2MiB-PMD systems. With unaligned mmap
addresses, that reduces the test from about fifteen PMD-sized moves
to one. Retain 32 MiB as the minimum.

MADV_HUGEPAGE is advisory. If the source is PTE-mapped, a PMD-sized
UFFDIO_MOVE can succeed through move_pages_ptes() without exercising
the huge-PMD path. Collapse the first aligned source PMD and check its
mapping before either PMD test. Report a skip when a huge PMD cannot
be obtained, rather than reporting a pass for a PTE-only run.

Link: https://lore.kernel.org/r/20261113040045.1439391-1-jocolema@redhat.com [1]
Fixes: a2bf6a9ca805 ("selftests/mm: add UFFDIO_MOVE ioctl test")
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
This is a fixup on top of John J. Coleman's patch [1].

My LLM-driven live-kernel runtime testbot said:

Result: PASS. On a two-node x86-64 7.4.0-rc1 guest, all three
move-pmd selftests passed with and without the patch. A kprobe
recorded 3 entries into move_pages_huge_pmd() without the patch
and 17 with it, confirming the additional huge-PMD path coverage.

A targeted allocation failure made MADV_COLLAPSE return ENOMEM;
the patched test skipped as expected, while its no-fault control
passed. An independent UFFDIO_MOVE partial-progress and cleanup
probe passed. No test failure was observed.

 tools/testing/selftests/mm/uffd-unit-tests.c |   25 ++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

--- a/tools/testing/selftests/mm/uffd-unit-tests.c~selftests-mm-retain-move-pmd-coverage-and-verify-huge-pmds
+++ a/tools/testing/selftests/mm/uffd-unit-tests.c
@@ -2124,8 +2124,28 @@ static void uffd_move_test(uffd_global_t
 	uffd_move_test_common(gopts, targs, gopts->page_size, uffd_move_handle_fault);
 }
 
+/*
+ * A PMD-sized UFFDIO_MOVE can also move PTEs. Make sure these tests
+ * start with a huge PMD, rather than passing through the PTE path.
+ */
+static bool uffd_move_pmd_ready(uffd_global_test_opts_t *gopts)
+{
+	unsigned long pmd_size = pmd_psize();
+	char *src = ALIGN_UP(gopts->area_src, pmd_size);
+
+	if (madvise(src, pmd_size, MADV_COLLAPSE) ||
+	    !check_huge_anon(src, pmd_size, 1, pmd_size)) {
+		uffd_test_skip("could not obtain a huge PMD for the source");
+		return false;
+	}
+
+	return true;
+}
+
 static void uffd_move_pmd_test(uffd_global_test_opts_t *gopts, uffd_test_args_t *targs)
 {
+	if (!uffd_move_pmd_ready(gopts))
+		return;
 	if (madvise(gopts->area_dst, gopts->nr_pages * gopts->page_size, MADV_HUGEPAGE))
 		err("madvise(MADV_HUGEPAGE) failure");
 	uffd_move_test_common(gopts, targs, pmd_psize(),
@@ -2225,6 +2245,8 @@ static void uffd_move_pmd_huge_zeropage_
 
 static void uffd_move_pmd_split_test(uffd_global_test_opts_t *gopts, uffd_test_args_t *targs)
 {
+	if (!uffd_move_pmd_ready(gopts))
+		return;
 	if (madvise(gopts->area_dst, gopts->nr_pages * gopts->page_size, MADV_NOHUGEPAGE))
 		err("madvise(MADV_NOHUGEPAGE) failure");
 	uffd_move_test_common(gopts, targs, pmd_psize(),
@@ -2493,7 +2515,8 @@ static int set_pmd_pagesize_nr_pages(uff
 		return -1;
 	}
 
-	gopts->nr_pages = (2 * pmd_pagesize) / gopts->page_size;
+	gopts->nr_pages = MAX(UFFD_TEST_MEM_SIZE, 2 * pmd_pagesize) /
+			  gopts->page_size;
 
 	return 0;
 }
_

