Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592904;
	b=RWHu9WwA6jWVNJSF02gIjCPGpUVLEauOqUj20A9C0NhRxTLhk3fJFFys30uVk9zOT/D+
	 0mjxHdhm3INJXpzTcCnsrbeKmDJzqA6NNyWqWzFAgCcsCO9lcvAsQ8ETf/sZqQlEmruOy
	 ts6Y27og5OOhuuvmQ2BVqafoxwyFIYkdgkR4jbKJXHu2/EM0cdXeTJzHopnOxyQHYnx3H
	 /iuUMUcWJmQ1oGnocMaNFAScknApFB1wb6ggkTf7AxmLCx7uWRVosO7Eu2Tes6d96zMFY
	 V6CWMWrW85Yb7WCtysFsSSjAWJREOdNe+SJoLU13prwfcqIT2K1J8nwAZxyMGjXB1EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592904;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 User-Agent:Date:Message-ID:MIME-Version:Content-Type;
	bh=Qx5F2tDerzQZ0lB87zR6bUAyzgyChxqTyHYx/YjImmk=;
	b=MWevIf8I6vIZPSN6gWHyajv8m0yvOH2ua0mpiN2Ul8ICXsBW5tf5Dud43rIoyz4NVYCN
	 A4fhDDkpB1J4w12D+YinKSJimxiJam6ERmM99gj4udDEvxlbucuM8/kWqtlr8EHMIGoI1
	 txCUMjqvaBMXdXU+Co6RwjVidj0LZoH238O3cKiNvryIYmzdqGoVwxK3wJj0tu+OkOQnN
	 wNHpZ7lnKMogfsICVphqk5dad7QcOvYDF7Y4FATw+6EqFpAMCmPU6wot2qj4lj3rupl3g
	 g9QLlKj46VR+D2xZOBG84kout6W9PDVvol8bwFObQfPsQfu0V4MDYEcluRsbM/s6Xhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XIZrg6Vi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC795606B220
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 18:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XIZrg6Vi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1691F000C4;
	Fri, 13 Nov 2026 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592903;
	bh=Qx5F2tDerzQZ0lB87zR6bUAyzgyChxqTyHYx/YjImmk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XIZrg6Vit3aXlTCbNDJ6Bkleo1yuoSB7+fWp3kHJTa53ecRgCLhMt3g9g+U92W4iM
	 jA18lJH8ZnoAFzaOWGRf9BHF8SeE5YP1pIbpQH3S9mZj59QNmlkgN1seK9w1bJou90
	 JfZCcD6MxBKHIdSgp0LHUN/Grw2sSDR1ydbtHV6aQ/8lmWCRthsjT+0moV2KSflruv
	 hjPYcTz3LXXYFyX1NZenudmNpDbnXblvmqclpT/pMtreQaY4ucr2WX9dzzpCG2Iv2n
	 /0yVGd/yc1U+2oZEN9VprWzywovAfhvE1UQ4VrBhs2d6VoVJgxb4iUC/zAvApDZ1iz
	 3j2fcfgb07B/A==
From: Roman Gushchin <roman@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,  =?utf-8?B?SsOpcsOpbXk=?= Jean
 <Jeremy.Jean@oss.cyber.gouv.fr>,  Zi Yan <ziy@nvidia.com>,  Roman Gushchin
 <roman.gushchin@linux.dev>,  Baolin Wang <baolin.wang@linux.alibaba.com>,
  "Liam R. Howlett" <liam@infradead.org>,  Nico Pache
 <nico.pache@linux.dev>,  Ryan Roberts <ryan.roberts@arm.com>,  Dev Jain
 <dev.jain@arm.com>,  Barry Song <baohua@kernel.org>,  Lance Yang
 <lance.yang@linux.dev>,  Usama Arif <usama.arif@linux.dev>,  Kiryl
 Shutsemau <kas@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,
  linux-mm@kvack.org
Subject: Re: [PATCH] mm/khugepaged: reject shmem collapse ranges beyond i_size
In-Reply-To: <79c3445e-623e-46ac-a09a-0a5d21f117c9@kernel.org>
References: <20261112142335.2749597-2-Jeremy.Jean@oss.cyber.gouv.fr>
	<sashiko-outbox-212974@kernel.org>
	<5f3dec4f-0416-4550-a980-b464a90aeb11@kernel.org>
	<87y0aw8x7y.fsf@kernel.org>
	<79c3445e-623e-46ac-a09a-0a5d21f117c9@kernel.org>
User-Agent: mu4e 1.12.12; emacs 31.1
Date: Fri, 13 Nov 2026 10:01:42 -0800
Message-ID: <87a4nc7gqh.fsf@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"David Hildenbrand (Arm)" <david@kernel.org> writes:

> On 11/13/26 18:20, Roman Gushchin wrote:
>> "David Hildenbrand (Arm)" <david@kernel.org> writes:
>> 
>>> On 11/13/26 15:25, sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found no new issues
>>>> in this patch, but noticed 1 related pre-existing issue it does not
>>>> introduce:
>>>> - [Medium] mm: xarray node memory leak in collapse_file() [1]
>>> Ignore this shit from Sashiko.
>>>
>>> Roman, make it stop.
>> 
>> David, will do.
>> 
>> But also it's not how I want to interact on mailing lists tbh.
>
> Roman, just to be clear, I am talking about preexisting issues. We get bombarded
> with preexisting issue reports. Having more duplicate reports posted to the
> mailing list does not help anybody.
>
> It creates more work for everybody. And the least I need right now is more work,
> believe me.

Totally understand.

>> I understand everybody is stressed and overwhelmed by llms etc. Including
>> myself. If sashiko is not appreciated in mm lands, I can turn it off,
>> no problems from me.
>
> Sashiko is great. The embargoed sending of mails to the list is great. I
> appreciate all of that.
>
> Posting preexisting stuff to the mailing list is not great, at least
> not right now.

Yet I've been explicitly asked about it by others. So at least there are
various opinions here.

> We were very happy that preexisting issues went into the private bugtracker. I
> want to delegate stuff to people in my team to screen them and see if it needs
> fixing. Well controlled.
>
> Now either:
>
> (a) it was never really gone, and we were in disbelieve that preexisting issues
>     are no longer posted publicly.
>
> (b) Sashiko maintainer decided to re-enable it without consulting us.

The correct version is b*, it's indeed back, but in a completely
reworked way, as I wrote to Lorenzo yesterday.

Pre-existing reports are now limited to the first non-rfc version of the
patchset, they are limited in numbers per patch (1-2), they are
_deduplicated and posted strictly once per issue_.

Re consulting the problem is that there are several hundreds maintainers
with drastically different views. If we'll wait for everybody's agreement
each time, nothing will ever move. So I have to make some decisions like
this on my own. And, yes, some of them will be wrong or not perfect.
I do fix/adjust things constantly. But some patience would be nice.

Btw now you can delegate access to bugs to people outside of MAINTAINERS.

> I'm sorry if I made you angry, but I hope you can see how I suspect (b) and why
> it would make me angry.

No problems. I understand the problem with the maintainers load right
now.

Thanks
