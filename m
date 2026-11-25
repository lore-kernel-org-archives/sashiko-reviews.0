Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599838;
	b=pwmb+b5u5xinpduXSK9d2EmbCb/RRhOLy3CMAC4gskQPA6KDO0VMfnBDsC45cADesUec
	 TebeCDZwf+LJloMXy66kl3kGRRETrfjw8sILP0gs0cEnXIJkdp8Hwm3IS2hkCyl8oP9lC
	 futpitf32WBIABkkukm9a1IwmZBmjgTt6Un8WQSxfrkH94kEl1SBSJUncv3opn+uri2Pj
	 dqe8C/tgtZPEPU79P3Q2z9bT0u+S2WCHZa8o7EB+VPKHqMVdL23gT/AzBeBQIGvYURonP
	 Jo4oLFUfxFLr9FrfoHcgPOzgY7z75QrCP5Wd+/G+on3EJwpgUT8XfvnonPQDH4hXz9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599838;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=zwkuh38kqQPWjrw5sO6Ui9U4FrRZxi9iAdmh8XWT6AY=;
	b=LqxfUBrVgh5Om5xPH4+jl6hS9vqrISAH+85qJxa+4nP49vJNRSZRBdw0T7q8rKG26dAT
	 lGDu36Dlfi9crMhirai/0D90Lh8IZcQX+bQXN+tO5V5zrwMneCAWnvsqtJ+3fqZgE/PWW
	 tIlbqJVFS+bc/lA/5fN6WAPJaGFkVEDf49yEfQyjIlLcg44nLoHYGctoL1YLlSKpqiFKS
	 PJ5Bk9yoE8IMYXV+N0HRhHMt0Y1FHtFKSxvFgVSVmveYBHfFT4Lhy44yqVvPt1Nz2o2XH
	 UPEYK34GY/5JlrmnF5OjIqmcHRTorKMldTbseSMFozgy8T5DCCZGN/jGxgaM6cumQ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hnA8Claz;
	arc=none smtp.remote-ip=95.215.58.147
Received: from mta1.migadu.com (out-147.mta1.migadu.com [95.215.58.147])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5F5606A335
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 09:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F5F5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hnA8Claz
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=lp9Na6yrRCFt2uMGIt1uFGfQ40jg/3cfzehQNSW8iak=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795599836; v=1; x=1796204636;
 b=hnA8ClazjFqbRXyIFkrYAEehIQ5Mi/Y7gsNO2vlzm1fK9Bo9MQoikC2r8NAm4bhQy6XEVX6v
 alE/V++ltuEmUox1q4dO7cD50Jh/rgX6C/yG2VZN3ytdP+G0AuPVpmSHlPb++zmqIcBDV8M4DjV
 3dAcBwXgCra8TOsS+LgGRWLQ=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 8b77d8fc15c5aee1;
	Wed, 25 Nov 2026 09:43:56 +0000
X-Mizu-Trace-ID: 8b77d8fc15c5aee1
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 02/19] hugetlb_vmemmap: Always flush TLB if needed upon
 PTE remapping
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <CADrL8HV0artLopXqsRyEfxRd5FrAKKXnSotwrTYV+7Wcd=D9mg@mail.gmail.com>
Date: Wed, 25 Nov 2026 17:43:40 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 sashiko-reviews@lists.linux.dev,
 Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Nikos Nikoleris <nikos.nikoleris@arm.com>,
 Linu Cherian <linu.cherian@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 David Hildenbrand <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Nanyong Sun <sunnanyong@huawei.com>,
 Yu Zhao <yuzhao@google.com>,
 Frank van der Linden <fvdl@google.com>,
 David Rientjes <rientjes@google.com>,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <EEFDA411-4490-46B0-A245-6DBC1F6C0FE6@linux.dev>
References: <20261122184453.2668189-1-jthoughton@google.com>
 <20261122184453.2668189-3-jthoughton@google.com>
 <sashiko-outbox-228631@kernel.org>
 <CADrL8HV0artLopXqsRyEfxRd5FrAKKXnSotwrTYV+7Wcd=D9mg@mail.gmail.com>
To: James Houghton <jthoughton@google.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 25, 2026, at 00:37, James Houghton <jthoughton@google.com> =
wrote:
>=20
> On Sun, Nov 22, 2026 at 11:08=E2=80=AFPM <sashiko-bot@kernel.org> =
wrote:
>>=20
>> Thank you for your contribution! Sashiko AI review found 2 potential
>> issues to consider:
>> - [Medium] mm/hugetlb_vmemmap: unnecessary TLB flush in
>>  vmemmap_remap_range() on error
>> - [Medium] mm/hugetlb_vmemmap: partial HVO state retained in
>>  vmemmap_remap_range()
>> --
>>=20
>> commit ec5d75eb023f87eb7c8518a7fd62d721c52bb9db
>> Author: James Houghton <jthoughton@google.com>
>>=20
>> hugetlb_vmemmap: Always flush TLB if needed upon PTE remapping
>>=20
>> This commit removes the early return on error in =
vmemmap_remap_range() so
>> that flush_tlb_kernel_range() still runs when =
walk_kernel_page_table_range_lockless()
>> returns a non-zero error code.
>>=20
>>> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
>>> index 09b9fd83c1985..7be08c68c2f18 100644
>>> --- a/mm/hugetlb_vmemmap.c
>>> +++ b/mm/hugetlb_vmemmap.c
>>> @@ -163,13 +163,11 @@ static int vmemmap_remap_range(unsigned long =
start, unsigned long end,
>>>=20
>>>      ret =3D walk_kernel_page_table_range_lockless(start, end, =
&vmemmap_remap_ops,
>>>                                                  NULL, walk);
>>> -     if (ret)
>>> -             return ret;
>>>=20
>>>      if (walk->remap_pte && !(walk->flags & =
VMEMMAP_DEFER_TLB_FLUSH))
>>>              flush_tlb_kernel_range(start, end);
>>>=20
>>> -     return 0;
>>> +     return ret;
>>> }
>>=20
>> [Severity: Medium]
>> Does this issue an unnecessary broadcast TLB flush across [start, =
end)
>> when walk_kernel_page_table_range_lockless() fails with =
walk->nr_walked =3D=3D 0?
>>=20
>> With memory_hotplug.memmap_on_memory enabled, every runtime =
single-folio
>> allocation via alloc_fresh_hugetlb_folio() -> =
hugetlb_vmemmap_optimize_folio()
>> hits PageVmemmapSelfHosted() in vmemmap_pmd_entry() and returns =
-ENOTSUPP
>> on the first PMD with walk.nr_walked =3D=3D 0, triggering a full
>> flush_tlb_kernel_range(start, end) despite modifying no PTEs.  When a =
walk
>> fails partway through with walk->nr_walked > 0, this also flushes the =
full
>> [start, end) range rather than [start, start + walk->nr_walked * =
PAGE_SIZE),
>> and vmemmap_optimize_folio() immediately flushes that prefix a second =
time
>> via vmemmap_restore_range().
>>=20
>> Should the flush be gated on walk->nr_walked > 0 and bounded to
>> start + walk->nr_walked * PAGE_SIZE?
>=20
> Yes, I will do this in v4. Thanks!

If we don't allow vmemmap_update_pte to return an error, we don't need =
patch 2,
3 and part of 4 at all.

Thanks,
Muchun

>=20
>>=20
>> [Severity: Medium]
>> As reported by Muchun Song on v2 [1], does this change and the =
follow-up
>> patches in the series still retain partially optimized vmemmap states
>> instead of preserving all-or-nothing HVO semantics?
>=20
> Yes, this is intended.


