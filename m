Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601054;
	b=cf/ohGibmO8jEjhJQacXfTLo6LhHZ00HOD/1YDBCGnRO5YeCwfm7o6x1R2466EXArGUl
	 9Q2rgPKUPkIwnxMAYRuSzlBb1sk0u3mkf906A+VwgmfudrmphbqSinnYa8zPJ8/cZBrgP
	 F3unRbeByQXEHWGn+r1nXqUxp6qSMtOewjGOAUDzMwriof+6h+pTlPu+cny2WRfJjVFWX
	 tiiGnp7x/wGJ+2UEd14VbcFAvPZO6gKVAz12klmVs/iYco42gvTC6ha+jb2Kw5/l0k7fU
	 WB4y0dF34YOC4bTkdbm4jG0Zi9ggvfu3COjZV4u9kUX4UudvbIWDAavgGETjVMPGx/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601054;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=KMgyZIG0LH+AzucSoXIEUf07GbSesuvgObEN4MQKmJA=;
	b=TevI241SYDO5VMPWHbvCWyRc74JEcXcjgayMw2f2u6eLqyYtSKOe8RZ4ugQpCE4897An
	 75C4/OcXbawvdUMGXMtC1wSrIdHsCv7qNSxnaDIPTziUFESSq90IrHWYwXBb0cvmObmPY
	 c5B0c3yFf8N28LOZ/JHuwU3gl/WscoSN+afz6AukWbfBIBbVu7Gtk5W85weXOrzzN77ff
	 S9zEPX+hEgq0+hBnQ/RAJbPL+OIYdz+ZDf/kP5JhELC6iZdlsplRifCcOV9AaR0Gn26k0
	 yVF5srGrNjjhfZ8u6VQmx8pwadbcOo2GjxdAA7RqsvAwQPnFYb/x9EvlBGJ/18NpIdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ksqi3hNT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF8A606A323
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 20:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ksqi3hNT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B491F000CC;
	Fri, 13 Nov 2026 20:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794601054;
	bh=KMgyZIG0LH+AzucSoXIEUf07GbSesuvgObEN4MQKmJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ksqi3hNTqNIsecm151Mv4zSREdF6VM4gl6f8ebPK6i7vV0hrw+/+FObf1VxUFmbpi
	 umsaygAIzu3XejhtNSTV0Z/s9bDVREmw5UkYREtqjHCOhxGefLP550uo5bFjSYYT5d
	 Q0RmM9fQJBQozX73fsKKRg/23UmLZw9xYshKQzu+vaGI1ZzcXoUOkJhJFVkfp6q+N5
	 4B+2plORdoYB2HDLR7B9G7jOJSbByw0nX0iHmd+zM/JA6G82WuxemUZuEPUDpbLpTR
	 3a+r6bImtnlsekCk0Xxi4ulszOGd1FAkrN0DdrnW8h1cdSj62j0799TsuYtKnErrAF
	 vgJqz7bboW7MQ==
Date: Fri, 13 Nov 2026 20:17:22 +0000
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
Message-ID: <avdveCV9uW1zwXXd@gremlin>
References: <avYJ-CxBEpdO1Wmu@gremlin>
 <816E22E2-C7DD-4DD1-AAC9-F51F4D1ED71C@linux.dev>
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
In-Reply-To: <816E22E2-C7DD-4DD1-AAC9-F51F4D1ED71C@linux.dev>

On Thu, Nov 12, 2026 at 02:53:44PM -0800, Roman Gushchin wrote:
> > On Nov 12, 2026, at 11:03 AM, Lorenzo Stoakes (ARM) <ljs@kernel.org> wrote:
> >
> > ﻿+cc Roman
> >
> > Roman - see below - I was under the impression mm was not supposed to receive
> > 'unrelated to this patch but' reports? Did something change?
>
> Yes, sashiko started reporting pre-existing bugs again, but in a better way:
> strictly once (per bug)
> only for the first non-rfc version
> somewhat related to the proposed patch
> not more than 1-2 per patch
> not exposing security-sensitive stuff this way
>
> Obviously the goal here it to increase the chances for the problem to be fixed.
> It’s global, not mm-specific.

(Sorry only just saw this!)

Ah, I thought it was an mm opt-out.

In general they're spawning a lot of AI sloppers to go off and send ever
more fixes and causing ever longer days for us, it's quite a noticeable
impact unfortunately.

And often they're duplicative of already-sent fixes so you can see the
conundrum with this :)

So ideally we'd like a way to embargo these or have a maintainers-only view
of them etc. so we can figure out a way of reasonably getting to valid
cases.

--
Cheers, Lorenzo
