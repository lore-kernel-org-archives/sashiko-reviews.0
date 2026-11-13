Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794611405;
	b=ReUlNfyp3iGp3PNAuiMAKjTOg/LYGgDIKJxWxD1VFFW8IXYE1Gry+0PfH35G22kLdTKi
	 tKjEvgOo0M8FWgFBqZRAEfnkzusqbSSLehlqkE6mahxi8gpY3aCVB8TTOlU7vRIx9g9zC
	 9iZspTORk8e06xM0u02dJUxAHbIfyckeqyoIGmKf/IT9JurTU8aoZRsrfuAaXgge+ly05
	 WzMX9TBhvd/6Pr4+oi5J0Gy5Es1R5mLc0Lobpsx6lkrV6O8y1savMpl5IyLX6LwUHATRJ
	 At+NQgRKwiMFSlMMkihgva8sqpUEqH9gvRTL/YJDNi7tfpublO6NKbgZ6eM34VIRxQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794611405;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 User-Agent:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yXeMiIlzLQ0R7siTBRkfiZ7NvU2B6iTFcdfu0ymlIxA=;
	b=y4lOi+mT1KmkdxoHiQnIbtJxvNSeJXmzs7v+I6UG5P0uHfvuTpWOhPHBRtcKuYj7uOHk
	 kWfE8nF0a8YyD8LlXhVrPM6spFI5KbXVnxluRLIQQj2Hu8OB2SW7EvSeLjBP53QUeYoGt
	 Hmrt1XrQuGDRfPogSIytZtPuq4GqiW3I0pgGlHoERr4mjMXlxpovKT/OjOfflsDGkceds
	 xSZh9Z2OMDJGJwUFPA2AkCYllPnQSblbph8e35aNDX1T2Zp7QXpLjennPjkQ+FxUYBvPk
	 /WHqEno07u8xCCtljkb9FuIZxIsQuKVqF+MU3kzCLwztIJhqDe8eglORiDkWsflPTAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=dL1pZOXq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3D7606A333
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 23:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=dL1pZOXq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909961F000C4;
	Fri, 13 Nov 2026 23:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=korg;
	t=1794611405; bh=yXeMiIlzLQ0R7siTBRkfiZ7NvU2B6iTFcdfu0ymlIxA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=dL1pZOXqRkUI/AQR14f8O1vveyz1yyus6WljBOIDKiTMaE0pDdB4sJEle17ZXshJY
	 uK20eK/lv7QdNDBWVgn/t22tu2dzGFW6aPCMQN5F9c8iZKeVkU9sXmtnZ48VQYjViY
	 JCWKfbso5n3lcZdES6ZPHZQ8+92phKQ5CIPKL2zA=
From: Roman Gushchin <roman.gushchin@linux.dev>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Roman Gushchin <roman.gushchin@linux.dev>,
  sashiko-reviews@lists.linux.dev,  David Hildenbrand <david@kernel.org>,
  "Liam R. Howlett" <liam@infradead.org>,  Vlastimil Babka
 <vbabka@kernel.org>,  Mike Rapoport <rppt@kernel.org>,  Suren Baghdasaryan
 <surenb@google.com>,  Michal Hocko <mhocko@suse.com>,  David Rientjes
 <rientjes@google.com>,  Shakeel Butt <shakeel.butt@linux.dev>,  Andrew
 Morton <akpm@linux-foundation.org>,  Jann Horn <jannh@google.com>,  Pedro
 Falcato <pfalcato@suse.de>,  Matthew Wilcox <willy@infradead.org>,  Jan
 Kara <jack@suse.cz>,  Nhat Pham <nphamcs@gmail.com>,  Johannes Weiner
 <hannes@cmpxchg.org>,  Zi Yan <ziy@nvidia.com>,  Matthew Brost
 <matthew.brost@intel.com>,  Joshua Hahn <joshua.hahnjy@gmail.com>,
  Byungchul Park <byungchul@sk.com>,  Gregory Price <gourry@gourry.net>,
  Ying Huang <ying.huang@linux.alibaba.com>,  Alistair Popple
 <apopple@nvidia.com>,  Usama Arif <usama.arif@linux.dev>,  Kairui Song
 <kasong@tencent.com>,  Balbir Singh <balbirs@nvidia.com>,  =?utf-8?B?SsOp?=
 =?utf-8?B?csO0bWU=?= Glisse
 <jglisse@redhat.com>,  Kiryl Shutsemau <kas@kernel.org>,  Yu-cheng Yu
 <yu-cheng.yu@intel.com>,  Dave Hansen <dave.hansen@linux.intel.com>,
  Dennis Zhou <dennis@kernel.org>,  Tejun Heo <tj@kernel.org>,  Christoph
 Lameter <cl@gentwo.org>,  Peng Fan <peng.fan@nxp.com>,  Josef Bacik
 <jbacik@fb.com>,  Chris Mason <mason@kernel.org>,  linux-mm@kvack.org,
  Borislav Petkov <bp@alien8.de>,  Mark Brown <broonie@kernel.org>,  Dennis
 Zhou <dennisszhou@gmail.com>,  Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH 10/13] mm/migrate_device: refuse to migrate shadow stacks
In-Reply-To: <avdveCV9uW1zwXXd@gremlin>
References: <avYJ-CxBEpdO1Wmu@gremlin>
	<816E22E2-C7DD-4DD1-AAC9-F51F4D1ED71C@linux.dev>
	<avdveCV9uW1zwXXd@gremlin>
User-Agent: mu4e 1.12.12; emacs 31.1
Date: Fri, 13 Nov 2026 15:10:03 -0800
Message-ID: <87jymg5nw4.fsf@kernel.org>
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
Content-Transfer-Encoding: quoted-printable

"Lorenzo Stoakes (ARM)" <ljs@kernel.org> writes:

> On Thu, Nov 12, 2026 at 02:53:44PM -0800, Roman Gushchin wrote:
>> > On Nov 12, 2026, at 11:03=E2=80=AFAM, Lorenzo Stoakes (ARM) <ljs@kerne=
l.org> wrote:
>> >
>> > =EF=BB=BF+cc Roman
>> >
>> > Roman - see below - I was under the impression mm was not supposed to =
receive
>> > 'unrelated to this patch but' reports? Did something change?
>>
>> Yes, sashiko started reporting pre-existing bugs again, but in a better =
way:
>> strictly once (per bug)
>> only for the first non-rfc version
>> somewhat related to the proposed patch
>> not more than 1-2 per patch
>> not exposing security-sensitive stuff this way
>>
>> Obviously the goal here it to increase the chances for the problem to be=
 fixed.
>> It=E2=80=99s global, not mm-specific.
>
> (Sorry only just saw this!)
>
> Ah, I thought it was an mm opt-out.
>
> In general they're spawning a lot of AI sloppers to go off and send ever
> more fixes and causing ever longer days for us, it's quite a noticeable
> impact unfortunately.
>
> And often they're duplicative of already-sent fixes so you can see the
> conundrum with this :)
>
> So ideally we'd like a way to embargo these or have a maintainers-only vi=
ew
> of them etc. so we can figure out a way of reasonably getting to valid
> cases.

Disabled for mm. Maintainers-only view is available in the database.

Thanks
