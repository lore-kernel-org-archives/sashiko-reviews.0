Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510206;
	b=yNBQ5ijds+28pq1F6YOu1qP15Q9iWZr6yuHpmpup3L/OLbqajiTPxUvgE++bUKXEadju
	 yWsoUMSM1YoX1yblDN6teVGPFCorPSoy87sXXdCncYHZipg6+32M/l6OpIleaIrKDEANi
	 DEJnNjdPnD3ait5ZdCJJp5samHw2y1EjH5rlE/CYMQNtLXa68Z6PdN6IPtrX++5fspXrn
	 cpi9bWCflVGNFui5NrjbIK72/n22uxHND9G1aOboVa8zY4B0dLbrfZ2L9OpJbiGxbFu0Y
	 Vw9qnY4rtmOcVYVbjdyIuNy0ZRxRyDCAU5Ly80k9AxjAxGkhj2/MGXUN78WZ7wPjg0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510206;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=BKmPHjD7F+lAu5Y1PmUklxdmbSrVzMFLB6y7wwm9rn4=;
	b=bnJ9aix64ZwsiWBCyjfbi8hiuPiH4eXUUgm04rsLhVd/O94fNuagQCJnyO72L38D9VuD
	 TV0yhIRf2uyrQ/ZYNGm65ORHQV+BQ0CZZUT3w1pFlpXOT9WB9b2ggPdDs9k3d79gpcpue
	 ASCa6p7+Or5bnUGh2APjoP0mWZRtmwL3rnUHOvsJEtlr5TRLdlEmcpb5d+VyxYsuJTcUe
	 mAVzv8thYkphruXWcOtbiGMVeFuC9kcbxnx285J3ixVGwzjJF/OI4gEohqm5Uup3btXmz
	 MV4GD8KNV657u4E0lheDqY1d0nisS4VcsGQAMYqwnLBUNLkfI6hHSayvh3lXsOPpTTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUA8Avn0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED59606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUA8Avn0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3621F000C4;
	Thu, 12 Nov 2026 19:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794510205;
	bh=BKmPHjD7F+lAu5Y1PmUklxdmbSrVzMFLB6y7wwm9rn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jUA8Avn0OjggNIl/nRhZLsftG1CcIsE+P07qqfFSyNsEQTVpwK0yFjIsaw9V+7rk4
	 i7S3HPu3az0GPuU9xPZzMQBHQQr1nbT2UsRxik+CnjdlyZxOq+1XDs7tzT78aPPKpG
	 7bJnBFcXUMXzoEBBMDroROB8HmzksqS/gmG9vmOaxHNz91DXBwz06sMNkD2KXVe/Af
	 +r3SD42o6nZLXHKB2Ze/w/ZUePNrC5Gr5fOlM3gqBuvYU7iZ/jLKLGtD5jIYuPZ5hX
	 oFS2PKujVTNdUmnXUYpniuAoB2acN92bEYS+2D0wJXcdaGfISyfJfLHpcsCJ74fxye
	 WYPVlA8ScGQuA==
Date: Thu, 12 Nov 2026 19:03:13 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>, 
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Yu-cheng Yu <yu-cheng.yu@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>, Chris Mason <mason@kernel.org>, 
	linux-mm@kvack.org, "Borislav Petkov (AMD)" <bp@alien8.de>, 
	Mark Brown <broonie@kernel.org>, "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: [PATCH 10/13] mm/migrate_device: refuse to migrate shadow stacks
Message-ID: <avYJ-CxBEpdO1Wmu@gremlin>
References: <20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org>
 <20261111-mason-migrate-et-al-fixes-v1-10-3d2454362e8d@kernel.org>
 <sashiko-outbox-211681@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-211681@kernel.org>

+cc Roman

Roman - see below - I was under the impression mm was not supposed to receive
'unrelated to this patch but' reports? Did something change?

Thanks!

On Thu, Nov 12, 2026 at 06:16:31PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] mm: out-of-bounds write in migrate_vma_setup() [1]
> --
>
> commit a0bf8430c5e68cd904038ab8081c7bc9a9b0f7de
> Author: Chris Mason <mason@kernel.org>
>
> mm/migrate_device: refuse to migrate shadow stacks
>
> This commit rejects VMA device migration in migrate_vma_setup() when the VMA
> has VMA_SHADOW_STACK set.
>
> > diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> > index 0f2a2832e0bd1..c27f513ee46e3 100644
> > --- a/mm/migrate_device.c
> > +++ b/mm/migrate_device.c
> > @@ -759,6 +759,8 @@ int migrate_vma_setup(struct migrate_vma *args)
> >  	/* The migrate_vma page walk has no hugetlb support. */
> >  	if (!vma_is_mm_backed(vma) || vma_is_hugetlb(vma) || vma_is_dax(vma))
> >  		return -EINVAL;
> > +	if (vma_test_single_mask(vma, VMA_SHADOW_STACK))
> > +		return -EINVAL;
> >  	if (nr_pages <= 0)
> >  		return -EINVAL;
> >  	if (args->start < vma->vm_start || args->start >= vma->vm_end)
>
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can migrate_vma_setup()
> write out of bounds on args->src and args->dst when given unaligned
> addresses [1]?

I don't like big buts and I can deny! As above, I thought we disabled this?
>
> mm/migrate_device.c:migrate_vma_setup() {
> 	const struct vm_area_struct *vma = args->vma;
> 	long nr_pages = (args->end - args->start) >> PAGE_SHIFT;
>
> 	args->start &= PAGE_MASK;
> 	args->end &= PAGE_MASK;
>     ...
> }
>
> nr_pages is computed before args->start and args->end are masked with
> PAGE_MASK.  For example, if args->start is 0x1fff and args->end is 0x3001,
> nr_pages is 1, but masking rounds the range to [0x1000, 0x3000), which spans
> 2 pages.  When migrate_vma_collect() walks the aligned range, it writes past
> the end of the caller's args->src and args->dst arrays.

This is silly. It's not critical. Nothing in-tree does this.

If internal kernel stuff does incredibly stupid things then incredibly stupid
things happen. We can't nanny everything endlessly.

A monolithic kernel means that the function and its callers are considered
together.

If an out-of-tree module does it then it's your fault for using an out-of-tree
module (ugh EXPORT_SYMBOL()'d).

>
> [1] https://sashiko.dev/#/bug/linux-ca91ac03-4056-4cf8-8afb-0e516e08797f
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261111-mason-migrate-et-al-fixes-v1-0-3d2454362e8d@kernel.org?part=10

--
Cheers, Lorenzo
