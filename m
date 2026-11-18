Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794973822;
	b=1I5RoxemgrUSh4uRk0zCbbU9qoVTvft9+lmm/ts6Y6lO7VkNovCiec5cMAR8hKAh3W+d
	 Yo2ieQ5K4Q29HLAGfyrxM3XbYfFkJXVjLzaCSSEXtCQtA30nxNSSGxaXbp/7ez3tCL0A3
	 ftk/tYrlG8IMD1Usze0aD/UCsC0mmPmyfH4G92L42zr7SKeheS+X6ypeG8SGIpvA+TqYg
	 ll7/a5gSuQY2XYZmkZ7pFatNwecyAxLDRjGt06YrjKFLFuow+7R8Lr3Z4bSvHjQK6O0CP
	 ziKpNXV+jitkYST1uhjSIxE2brDT0MvAPWy/RqMDyuhoO7UnFXkCBKVASksIZ4aBvwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794973822;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=tPp6yMO3qB7Qdjiew2LVyPuo9JgIAUgd1wm/VlErX4Y=;
	b=y1Dc73nKjDtINEqVqpjavM6vvRLwCN95Dy+gq2fIDbyShF3wS6n3a30udYSnt+WU7WdR
	 DouqSKz3K1ZrjSFuJC2OQqwfq5V0R8chtPMeh+kgLCiX5Y2wayNIUrsVkwpOIds7OGL/+
	 ihMkzyVudU+ruszDVN06mWrsTW6nv9qDKIE75BLGJ6/gXRVK2sTebN8CtTP8JNrUvcKB1
	 1I5yWXuD0ZVTTSX0xVqT5fzzlv4375VsK3sH1DZwACy9/iZB51eNPrvFD6D3gn7dsOcEz
	 MQ2N+Gfk3EQPlUKr9RpJT/Oq+2oia7BCVza5HT43qzt4TScSHh76mediw+P49+4guqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eFu5UteV;
	arc=none smtp.remote-ip=91.218.175.20
Received: from mta0.migadu.com (out-20.mta0.migadu.com [91.218.175.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A45606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 03:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A45606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=eFu5UteV
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=emwGL8FoGqLBe0pmI54NoXvhFi3KQgtC2jbN57YvmiM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794973819; v=1; x=1795578619;
 b=eFu5UteVAW8Ahc57dVTtMwNK1zCFukvNQedGSBaHgpzNDUORnmp9bbKjVexP5SerpvGja58F
 lULd4hVnWvfthClQLYwtn3y+Edaa2Zb6r8NXsp8PTeOMkaHO8JENZ3qYuRzaBq5dlHKwOT1ugBe
 DTOl1QJt+we3PzUoNqGVuVbg=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 614c7474aa1088e3;
	Wed, 18 Nov 2026 03:50:19 +0000
X-Mizu-Trace-ID: 614c7474aa1088e3
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 2/7] mm/page_ext: fix client data alignment
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261117114635.37d4c1f7f1b38cc4ce7fb886@linux-foundation.org>
Date: Wed, 18 Nov 2026 11:49:58 +0800
Cc: sashiko-reviews@lists.linux.dev,
 Sashiko <sashiko-bot@kernel.org>,
 Muchun Song <songmuchun@bytedance.com>,
 Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Chris Down <chris@chrisdown.name>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Zi Yan <ziy@nvidia.com>,
 Joerg Roedel <joerg.roedel@amd.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>,
 Ketan <ketan.kishore@oss.qualcomm.com>,
 Mostafa Saleh <smostafa@google.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 kasan-dev@googlegroups.com,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4EDF1D2-D02C-4339-AA30-422D576B735A@linux.dev>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-3-songmuchun@bytedance.com>
 <sashiko-outbox-219498@kernel.org>
 <20261117114635.37d4c1f7f1b38cc4ce7fb886@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 18, 2026, at 03:46, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Tue, 17 Nov 2026 19:36:23 +0000 sashiko-bot@kernel.org wrote:
>=20
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue to consider:
>> - [Medium] mm/page_ext: 4-byte alignment cap in
>>  page_ext_data_alignment() on 32-bit
>> --
>>=20
>> commit 4ecca9da35d7e4448f4270965043775293174eda
>> Author: Muchun Song <muchun.song@linux.dev>
>>=20
>> mm/page_ext: fix client data alignment
>>=20
>> This commit aligns page_ext client offsets and rounds the final entry =
size to
>> the largest active client alignment.
>>=20
>>> diff --git a/mm/page_ext.c b/mm/page_ext.c
>>> index b679a8c1f7d7e..dbc1bfa258f15 100644
>>> --- a/mm/page_ext.c
>>> +++ b/mm/page_ext.c
>>> @@ -116,8 +116,22 @@ static int __init setup_early_page_ext(char =
*str)
>>> }
>>> early_param("early_page_ext", setup_early_page_ext);
>>>=20
>>> +static inline size_t page_ext_data_alignment(size_t size)
>>> +{
>>> + 	if (!size)
>>> + 		return 1;
>>> +
>>> + 	/*
>>> + 	 * A type's size is a multiple of its natural alignment. The =
lowest
>>> + 	 * set bit of the size is therefore at least that alignment. Cap =
it
>>> + 	 * at unsigned long alignment to avoid excessive per-page =
padding.
>>> + 	 */
>>> + 	return min_t(size_t, 1UL << __ffs(size), __alignof__(unsigned =
long));
>>> +}
>>=20
>> [blah blah]
>>=20
>=20
> Yeah, but the whole expression is quite reader-hostile, as min/max
> things often are.
>=20
> How about doing
>=20
> 	/* comment */
> 	if (this1)
> 		return that1;
> 	/* comment */
> 	if (this2)
> 		return that2;
> 	/* comment */
> 	if (this3)
> 		return that3;
>=20
> ?
>=20
> The code generation will probably be just as good and it's __init-time
> stuff anyway.

Something like?

static inline size_t page_ext_data_alignment(size_t size)
{
        /* No client data means no alignment requirement. */
        if (!size)
                return 1;

        /* u64 has the strictest alignment required by page_ext clients. =
*/
        if (IS_ALIGNED(size, __alignof__(u64)))
                return __alignof__(u64);

        /*
         * A type's size is a multiple of its natural alignment, so its
         * lowest set bit is at least that alignment.
         */
        return 1UL << __ffs(size);
}

Thanks,
Muchun


