Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794609798;
	b=Frbu743pRgk7gNEr7crUvq8BWeHMxcUcLr1PEc+EWUcXywlTxE4vuj6+/3R3WvIIvPKN
	 64APp5NqHqywTfrdes9rDy+MA9N+XbGQXg26fpOtercrJb5miwkL0dJUJPRmZhdW8ev6c
	 up0jNzjAEzKDoel7mRZHRt6Z8jxkBuUPN65k3snF/dz4dKO6xiyeyc5J+rcGX7iCEWMaN
	 3HHbXfp7uTTV+4/Ih8j0o56qRJxRLMETjZYPQhH2OXpxYL67sWIPHEPjiO3fUz9hQY7Zj
	 19T9N+ZpUMLCa5XlBaRynvRTh/MwUczjHsjZFVIKVt/4k1d4hKHPz1TYbEL9zH6bkVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794609798;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=AV0Au8QBelDJjxw6Cr2O9VNvKQKnOvtzVap3a+AAzd8=;
	b=lqgd6/Qv4d0M6O6UQQPfeJnfZU4dZBKgXdAFk6H8jFVOl/MBt0for48YbNGPt9921V3u
	 9kZZCPaNdd6X8A63N+Ofr07ie4C+EjQS0eFPgRS4vWe98/k9IvZsNPMzFiAYi7coVwiuE
	 8JeCpYd7RtLRI9ZbcqErsDVxmxUF476NHwY67+2uiPu8mQnLp0ehLWIUecxLlAgUnTvJp
	 vbo+ea5rEe5Rk0kVzRUkSafVRiDDCGqnTtgxUdX/k6bFXNSzX67Rxaert5fK2SmMFDZN+
	 E9X27S5pib4feXTFUUXP6rDfbgLgk1tUwVvsv3WhlAtzBsUX5h9HpesshhetF6IgABA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=1CBzsMzp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A484606A548
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 22:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=1CBzsMzp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D5D1F000C4;
	Fri, 13 Nov 2026 22:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794609797;
	bh=AV0Au8QBelDJjxw6Cr2O9VNvKQKnOvtzVap3a+AAzd8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=1CBzsMzpCICjs5j6eDtHq8t1cEfqzBvtc9lGjgI1+IyXUv2H1631WtgfyIQBCdvzV
	 zISHw8Yrd2rmW54POF/RKoYHcSRZGhasj94Gbft7w2/PfcWLfb7qcr0ABgoUWDELoj
	 xP/PQlWzaqIvQZirgI6H07h5Phi6ysTz3InJu1i0=
Date: Fri, 13 Nov 2026 14:43:16 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Zi Yan <ziy@nvidia.com>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Roman Gushchin
 <roman.gushchin@linux.dev>, sashiko-reviews@lists.linux.dev, David
 Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren
 Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, David
 Rientjes <rientjes@google.com>, Shakeel Butt <shakeel.butt@linux.dev>, Jann
 Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Matthew Wilcox
 <willy@infradead.org>, Jan Kara <jack@suse.cz>, Nhat Pham
 <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>, Matthew Brost
 <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul
 Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Usama
 Arif <usama.arif@linux.dev>, Kairui Song <kasong@tencent.com>, Balbir Singh
 <balbirs@nvidia.com>, =?UTF-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>,
 Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Peng Fan
 <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>, Chris Mason
 <mason@kernel.org>, linux-mm@kvack.org, Borislav Petkov <bp@alien8.de>,
 Mark Brown <broonie@kernel.org>, Dennis Zhou <dennisszhou@gmail.com>, Rick
 Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 10/13] mm/migrate_device: refuse to migrate shadow
 stacks
Message-Id: <20261113144316.57192d4ab088e7fc64eee47a@linux-foundation.org>
In-Reply-To: <F185BA4F-F26B-48EF-AB3C-848D72FA630D@nvidia.com>
References: <avYJ-CxBEpdO1Wmu@gremlin>
	<816E22E2-C7DD-4DD1-AAC9-F51F4D1ED71C@linux.dev>
	<avdveCV9uW1zwXXd@gremlin>
	<F185BA4F-F26B-48EF-AB3C-848D72FA630D@nvidia.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 13 Nov 2026 15:20:45 -0500 Zi Yan <ziy@nvidia.com> wrote:

> On 13 Nov 2026, at 15:17, Lorenzo Stoakes (ARM) wrote:
> 
> > On Thu, Nov 12, 2026 at 02:53:44PM -0800, Roman Gushchin wrote:
> >>> On Nov 12, 2026, at 11:03 AM, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >>>
> >>> ﻿+cc Roman
> >>>
> >>> Roman - see below - I was under the impression mm was not supposed to receive
> >>> 'unrelated to this patch but' reports? Did something change?
> >>
> >> Yes, sashiko started reporting pre-existing bugs again, but in a better way:
> >> strictly once (per bug)
> >> only for the first non-rfc version
> >> somewhat related to the proposed patch
> >> not more than 1-2 per patch
> >> not exposing security-sensitive stuff this way
> >>
> >> Obviously the goal here it to increase the chances for the problem to be fixed.
> >> It’s global, not mm-specific.
> >
> > (Sorry only just saw this!)
> >
> > Ah, I thought it was an mm opt-out.
> >
> > In general they're spawning a lot of AI sloppers to go off and send ever
> > more fixes and causing ever longer days for us, it's quite a noticeable
> > impact unfortunately.
> >
> > And often they're duplicative of already-sent fixes so you can see the
> > conundrum with this :)
> 
> I wonder if there is a plan to make Sashiko identify duplicated fixes
> and send an email to point out the existing patches. So maintainers do
> not need to do that manually.

Yeah.  That might be judged off-topic for Sashiko but it would be a
useful addition and it'll be cheap.  But as usual it'll find every damn
thing and flood you with semi-on-topic info.

I've been training my thing to do this - fighting fire with fire.

The main issue is teaching it how to get reliable, high-bandwidth
access to git and to mailing list archives - LLMs are often blocked for
<reasons>.  For the mailing-list problem I gave it last-resort access
to my local 100GB of email archives.  Gulp.  Dovecot's indexing helps a
lot!

For this particular patch it went nuts - indiscriminate information
overload.  It's usually more useful than this!



In: "Check this patch.  Has anyone else attempted to address this issue?"

Out:

: Subject: Re: [PATCH 10/13] mm/migrate_device: refuse to migrate shadow stacks
: 
: This looks right to me.  I looked for earlier attempts to prevent this
: and found fixes for related paths, but no earlier shadow-stack check in
: migrate_vma_setup().
: 
: The original shadow-stack series taught migrate_vma_insert_page() how
: to install a shadow-stack PTE.  That handles migration's insertion
: path; it does not decide whether a page may migrate to a device:
: https://lore.kernel.org/all/20230119212317.8324-20-rick.p.edgecombe@intel.com/
: 
: 6beb99580bc0 ("mm: Don't allow write GUPs to shadow stack memory")
: blocked ordinary writable GUP, while retaining FOLL_FORCE for
: debuggers.  It does not constrain the permissions handed to a device:
: https://lore.kernel.org/all/20230613001108.3040476-23-rick.p.edgecombe@intel.com/
: 
: 3c58f641e813 ("userfaultfd: prevent registration of special VMAs")
: closed another route, where UFFDIO_COPY could inject chosen contents
: into a shadow stack:
: https://lore.kernel.org/all/20260618095017.2553004-1-rppt@kernel.org/
: 
: Nor did the recent VMA flag conversion remove an earlier safeguard
: here: the old VMA_SPECIAL_FLAGS test did not include VM_SHADOW_STACK. 
: So the proposed Fixes: target looks appropriate:
: https://lore.kernel.org/all/20261013-b4-mmap-prepare-vma-flag-sanify-v6-36-1aa3c9b139f9@kernel.org/
: 
: Alistair's hmm_range_fault() question deserves a separate follow-up. 
: That path also turns pte_write() into a device-writable HMM_PFN_WRITE,
: and nouveau uses that flag when mapping the page.  The proposed
: migrate_vma_setup() check does not cover HMM mirroring:
: https://lore.kernel.org/all/avT2FNTZoEuijEZP@nvdebian.thelocal/

