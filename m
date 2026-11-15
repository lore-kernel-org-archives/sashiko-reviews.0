Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749362;
	b=BO299cS/uYapHZGiEppkSoVN0w2MJZegbMcAvQWfbgS0knMA2nIuNDRAz2qxDnQM08qD
	 8YXK9lQqZYAVT3X0AhQWEesTLH2yFQ2XflS4kB2yGz7y4/h6/0MUKnSHuYdHACY+oz02d
	 7VYdVLbsqzU98CsXOIlXaua+liTr69INfFidEsdsGk7+o9j75uWpkRByiqSxNewM5fhyS
	 Jsy+h0B+00X5I/w9WhzliIbHBJhqB0huTcEhXCmgQpl8o8flcyGGAZW7WgwpEo9a4zsOt
	 DB/DVxynn3pDUlCI7xzEU2SU3wwWpXf76zAxGWsWqjQith5L3C4nQgiol5WEtyKMNaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749362;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=haKBzBVUyeOg2UlQIK/o1YREIWI7nnzJdfaBt7YGCHc=;
	b=dYSnQ2Gjwz9CwQRatmvZq5RcEqMzErTjajfUnUV3anNPyT/RkhYCdRPVAQaj3BEu1bGb
	 cCJHV2pWfuBydYfmBPGGDSybHcGycP3V+qW4SCw+vOPXj98GsfAgQmkqpye+ieI9sB8XI
	 56y0hQe9sUlCEmNWah1kva2ouI7Jg47RDk6EVXCpwlWufHStEZQ1o0v7IUggTMQaA6nSQ
	 KPUsYq4wy8XfJnQes/rh9xSEZ9TRrJve/sjzbPdG7L/safa66ejthaY5Ifw555BC7Uy72
	 DZJIDTsMYgxx37d7Nli5ClG9WPFMGEiAkPvwna9b4ZSYntPPBZJsbjKSpxrgImH9Xgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rh7ng2gX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A1D606A31E
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 13:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rh7ng2gX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38DA81F000C4;
	Sun, 15 Nov 2026 13:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794749361;
	bh=haKBzBVUyeOg2UlQIK/o1YREIWI7nnzJdfaBt7YGCHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rh7ng2gX6LGpoL4B/eKnAUvR9+Qv1MJLctQkDigGNoNU5XZnIkVlhmWoJnBq9GiYj
	 rb3CkFCe1w7gNhzayJsmuSxkMrtkzWcytamvMuKwOvLx98sxzcSO/5VWGTYRrEy0mq
	 +a22u9vhD+cvawrYoEH+Bjm9p3+5bK3AAytIxCN5h793gIJpVUiHF+wiqwIX2HUPny
	 wjoag71LTkhTcaj6jPZrVW/cBMaacW2D8TeOYX/NvIvc48eGd6KIGI5VG/o8Tb3Mr8
	 HfcmhVfQSohjeEISG2VM+bJuFKpFOcvCSyURQ71UC34SBtCBi9gMjFZE9N2+4scqeB
	 QRC7Op36HeMAQ==
Date: Sun, 15 Nov 2026 13:29:12 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, David Rientjes <rientjes@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Nhat Pham <nphamcs@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>, 
	Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>, 
	=?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Yu-cheng Yu <yu-cheng.yu@intel.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>, Chris Mason <mason@kernel.org>, 
	linux-mm@kvack.org, Borislav Petkov <bp@alien8.de>, Mark Brown <broonie@kernel.org>, 
	Dennis Zhou <dennisszhou@gmail.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 10/13] mm/migrate_device: refuse to migrate shadow stacks
Message-ID: <avmzn53l8fdCQsAP@lucifer>
References: <avYJ-CxBEpdO1Wmu@gremlin>
 <816E22E2-C7DD-4DD1-AAC9-F51F4D1ED71C@linux.dev>
 <avdveCV9uW1zwXXd@gremlin>
 <87jymg5nw4.fsf@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87jymg5nw4.fsf@kernel.org>

On Fri, Nov 13, 2026 at 03:10:03PM -0800, Roman Gushchin wrote:
> "Lorenzo Stoakes (ARM)" <ljs@kernel.org> writes:
>
> > On Thu, Nov 12, 2026 at 02:53:44PM -0800, Roman Gushchin wrote:
> >> > On Nov 12, 2026, at 11:03 AM, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >> >
> >> > ﻿+cc Roman
> >> >
> >> > Roman - see below - I was under the impression mm was not supposed to receive
> >> > 'unrelated to this patch but' reports? Did something change?
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
> >
> > So ideally we'd like a way to embargo these or have a maintainers-only view
> > of them etc. so we can figure out a way of reasonably getting to valid
> > cases.
>
> Disabled for mm. Maintainers-only view is available in the database.

Oh great thanks! Much appreciated :)

>
> Thanks

--
Cheers, Lorenzo
