Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529356;
	b=NGYIyN/3mXq9d6MqCarOlufvuJhASjsqSdg5Ok8PO40MyqvR536s5P0T/VvPneq7+scw
	 c7NQluO5J+JdcZW83SAP67OR7Nb2fkL0Lj7VCae2hl/UOlFfe6CWubQfF8FOtWVs4mG5+
	 a/CI6Q9InKN+PgvpopYEFISu8oqS6Wk3Nb1ru43mrCYltv5AwqiABMztQ5ZbNcFLAA4WO
	 wXQsjijPNT+6LBK3Jk57UzZN/XYXAf66PUOFbuiQ3fpwqvuJJT/5mGlC5RtQ0xCWN0Evq
	 Vwu4LoQ6itPOJqSTe30qgb9/pIgY2TMfRalsBrWiA3PJBMbuB70D7apkjjVd0pDvsRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529356;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Content-Transfer-Encoding:
	 Mime-Version:Subject:From:In-Reply-To:Date:Cc:Message-Id:References:
	 To:X-Mailer;
	bh=D1OPI1lt34LpA9BkY3H/uvJw7+nIzQc2Xct83tHpWEg=;
	b=AhWydlez3kZAGKlF589VCDr8FA6eCngtT1NpCh8GZWEmFdV6oeJywuwjy3yqM23Wq4Js
	 6Gk0Q10mFgYHvZWw19h1asIiugSlD4GMJXBXAPlJpM8mQBbMs4xw7IsQSCF5t+h8w5CAs
	 nK1VgSuZLep5VKRsnODdAdX8gjOKmh4X8BoEthMU0tl5GqMgActgyxPGiMe+U6+dJYPyK
	 xEViO9xQztGMp0fv5iy8d9EP8WbJl+pbHGmPYD4O580siHvaPJoh/N4Fy8062tl4oyU/V
	 RhjNul+Qwz1xm2QF8+AdrsyOiuKnVtxXAn89WFeRuzvZ34aiAYvyVay87OuVx3xbmEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wnw5eaEj;
	arc=none smtp.remote-ip=95.215.58.194
Received: from mta1.migadu.com (out-194.mta1.migadu.com [95.215.58.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1C2606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 00:22:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C1C2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wnw5eaEj
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=rmnnRyoTz6AZdPc0e7253Fzuu1lAJK2/CJLVmW/V7xA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794529353; v=1; x=1795134153;
 b=wnw5eaEjDX4SOVvlN5a2q06C6ZyJ4+ICxgto5Z0/9HGEnB8rANbrm0KgYeWFnwoIZYIYfqhi
 EKwmv+UslA04SCijWxJw/FLz9VSaSXUmtnBSfRarZ9+zZroJgkVCLU8YLngsJMEZl6hqAicFhDQ
 MBJw5AVU2m3YTaBYM6SvjNyY=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 04ff1534b9e29b12;
	Fri, 13 Nov 2026 00:22:30 +0000
X-Mizu-Trace-ID: 04ff1534b9e29b12
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 10/13] mm/migrate_device: refuse to migrate shadow stacks
From: Roman Gushchin <roman.gushchin@linux.dev>
In-Reply-To: <avYJ-CxBEpdO1Wmu@gremlin>
Date: Thu, 12 Nov 2026 16:22:18 -0800
Cc: sashiko-reviews@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 David Rientjes <rientjes@google.com>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Matthew Wilcox <willy@infradead.org>,
 Jan Kara <jack@suse.cz>, Nhat Pham <nphamcs@gmail.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Usama Arif <usama.arif@linux.dev>,
 Kairui Song <kasong@tencent.com>, Balbir Singh <balbirs@nvidia.com>,
 =?utf-8?Q?J=C3=A9r=C3=B4me_Glisse?= <jglisse@redhat.com>,
 Kiryl Shutsemau <kas@kernel.org>, Yu-cheng Yu <yu-cheng.yu@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dennis Zhou <dennis@kernel.org>,
 Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Peng Fan <peng.fan@nxp.com>, Josef Bacik <jbacik@fb.com>,
 Chris Mason <mason@kernel.org>, linux-mm@kvack.org,
 Borislav Petkov <bp@alien8.de>, Mark Brown <broonie@kernel.org>,
 Dennis Zhou <dennisszhou@gmail.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Message-Id: <49B1B6F1-86DF-4472-970A-055E1DFD8808@linux.dev>
References: <avYJ-CxBEpdO1Wmu@gremlin>
To: Lorenzo Stoakes <ljs@kernel.org>
X-Mailer: iPad Mail (24B119)

> On Nov 12, 2026, at 11:03=E2=80=AFAM, Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>=20
> =EF=BB=BF+cc Roman
>=20
> Roman - see below - I was under the impression mm was not supposed to rece=
ive
> 'unrelated to this patch but' reports? Did something change?
>=20
> Thanks!
>=20
>> On Thu, Nov 12, 2026 at 06:16:31PM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found no new issues
>> in this patch, but noticed 1 related pre-existing issue it does not
>> introduce:
>> - [Critical] mm: out-of-bounds write in migrate_vma_setup() [1]
>> --
>>=20
>> commit a0bf8430c5e68cd904038ab8081c7bc9a9b0f7de
>> Author: Chris Mason <mason@kernel.org>
>>=20
>> mm/migrate_device: refuse to migrate shadow stacks
>>=20
>> This commit rejects VMA device migration in migrate_vma_setup() when the V=
MA
>> has VMA_SHADOW_STACK set.
>>=20
>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>> index 0f2a2832e0bd1..c27f513ee46e3 100644
>>> --- a/mm/migrate_device.c
>>> +++ b/mm/migrate_device.c
>>> @@ -759,6 +759,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>>>    /* The migrate_vma page walk has no hugetlb support. */
>>>    if (!vma_is_mm_backed(vma) || vma_is_hugetlb(vma) || vma_is_dax(vma))=

>>>        return -EINVAL;
>>> +    if (vma_test_single_mask(vma, VMA_SHADOW_STACK))
>>> +        return -EINVAL;
>>>    if (nr_pages <=3D 0)
>>>        return -EINVAL;
>>>    if (args->start < vma->vm_start || args->start >=3D vma->vm_end)
>>=20
>> [Severity: Critical]
>> This problem wasn't introduced by this patch, but can migrate_vma_setup()=

>> write out of bounds on args->src and args->dst when given unaligned
>> addresses [1]?
>=20
> I don't like big buts and I can deny! As above, I thought we disabled this=
?
>>=20
>> mm/migrate_device.c:migrate_vma_setup() {
>>    const struct vm_area_struct *vma =3D args->vma;
>>    long nr_pages =3D (args->end - args->start) >> PAGE_SHIFT;
>>=20
>>    args->start &=3D PAGE_MASK;
>>    args->end &=3D PAGE_MASK;
>>    ...
>> }
>>=20
>> nr_pages is computed before args->start and args->end are masked with
>> PAGE_MASK.  For example, if args->start is 0x1fff and args->end is 0x3001=
,
>> nr_pages is 1, but masking rounds the range to [0x1000, 0x3000), which sp=
ans
>> 2 pages.  When migrate_vma_collect() walks the aligned range, it writes p=
ast
>> the end of the caller's args->src and args->dst arrays.
>=20
> This is silly. It's not critical. Nothing in-tree does this.
>=20
> If internal kernel stuff does incredibly stupid things then incredibly stu=
pid
> things happen. We can't nanny everything endlessly.
>=20
> A monolithic kernel means that the function and its callers are considered=

> together.

Agreed. Let me try to fix this to stop reporting problems like this.
