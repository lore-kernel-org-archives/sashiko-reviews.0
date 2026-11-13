Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794543039;
	b=S6srN+397626pg7KWNhhgVK5P1Cru9uoQqi+DuTMNlgGhd/5uDDtUlR7ny7BuiSuFXqk
	 7VBaNIwtc1lxyU7fktWaZ0WkXCgRP4LpgXvRrw7HFHoWjGSJjh32vvapdicOm+O73wnyJ
	 6Eheh6OW5/a6JQzo1pON6Zb81JgxdSIVE7woOu3RWCQEhEmVEqTvJr6CkwHB2uFiFi4Ir
	 oJRv/B5pfig+9j/nCRPJIaGI7S5Gq1tTDMBh1cW0yGI2l/cXfgBqKWR7TDyiHdqvmK4dz
	 T6qAvLGLNN9sUHpLptO+bp2mO6qJMSAIjUx7ih3lRasL1x8Z1UUmPBJ9KbBZhOVpZ8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794543039;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=vPOPOrVJDtbv3g8f3odyGjF+HpV+rwXLNAe2t5z1/I0=;
	b=kNADuwIkFN9FrI7pjEcET9FhK8vjc9UJiS8xvmBcrkEtGwACKrjeZJDQ/ipRDP/n6MPd
	 +ATmRs8ltO3HXQuCvlL41KHbQLfMTui5kBKKOMGy1jutVXdzUwvX41DcXutBUj6kw8hU8
	 SZcz5QkLxwEg14SqQrHuBZnpGREl15MkPdTlJB9Yuluc5Z7him6FxpaYTVjiT4x3jDTxQ
	 ZadsWsBczPv9kXA/pkCvr/C0XfLrmOvrdCJ7uloAxge1XM++X6AMS455HskiJE/ChJlU8
	 NX/htCK/IGF9npyAyy0LOgFV8ADAWtbei1d5ak/zPJgjSComnAscARKpqQX168UIY9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="R/zqJBmT";
	arc=none smtp.remote-ip=95.215.58.145
Received: from mta1.migadu.com (out-145.mta1.migadu.com [95.215.58.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4071606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 04:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F4071606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=R/zqJBmT
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=RbVZ7SIC7l2VU0WGvHLgOHP9LnYSWkJv2RkUhwjLIXg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794543037; v=1; x=1795147837;
 b=R/zqJBmTExbNsY0t8Buk+NikFPvqJt3PPUbo2rRqvFYE0wlSHA6E+0Nvt3j9pRXLPVrOJD3A
 ycPqAb+7p34ezBObLOCB15fY2SK+WXMCX5RMc/mT9UBXLQtVo0k1sue4pnwpSiHZVAc5G+ywmc/
 rsT4+q9O7mAD3bIIAqBOVinU=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 135ab794c57a1a37;
	Fri, 13 Nov 2026 04:10:30 +0000
X-Mizu-Trace-ID: 135ab794c57a1a37
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
Subject: Re: [PATCH v2 02/14] mm/hugetlb: optimize bootmem hugepage tail
 vmemmap init
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <sashiko-outbox-212147@kernel.org>
Date: Fri, 13 Nov 2026 12:10:13 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Li Zhe <lizhe.67@bytedance.com>,
 Andrew Popple <apopple@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 James Houghton <jthoughton@google.com>,
 Lance Yang <lance.yang@linux.dev>,
 Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D1F34237-066F-43E8-89F5-2D7A6217D72B@linux.dev>
References: <20261113033442.62970-1-songmuchun@bytedance.com>
 <20261113033442.62970-3-songmuchun@bytedance.com>
 <sashiko-outbox-212147@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 13, 2026, at 12:07, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] mm/hugetlb: commit message mismatches
>  memmap_init_page_from_template()
> --
>=20
> commit 7cc97c08b2296fc2518d9ae6da5950cb731c48eb
> Author: Li Zhe <lizhe.67@bytedance.com>
>=20
> mm/hugetlb: optimize bootmem hugepage tail vmemmap init
>=20
> This commit speeds up boot-time HugeTLB tail page vmemmap =
initialization
> by seeding a template from the first tail page and initializing the
> remaining tail pages with memmap_init_page_from_template().
>=20
>> Initialize the first tail page normally, then initialize the =
remaining
>> tails with hugetlb_init_tail_page().  This copies the already
>> initialized first tail page with memcpy() and refreshes only the
>> PFN-dependent fields in the destination page, while avoiding the full
>> __init_single_page() and prep_compound_tail() sequence for state that =
is
>> identical across tail pages in the same huge page.
>=20
> [Severity: Low]
> This isn't a bug, but the commit message appears to describe an =
earlier
> version of the patch.  hugetlb_folio_init_tail_vmemmap() copies the =
first
> tail page into a stack template and calls =
memmap_init_page_from_template()
> (which refreshes the template before copying) rather than a
> hugetlb_init_tail_page() helper.  The commit message also omits the =
change
> in memmap_init_page_from_template() that restricts =
memcpy_nontemporal() to
> ZONE_DEVICE pages and uses memcpy() for other zones.

My bad. I forgot to update the commit message, the corrected commit =
message
is as follows:

Boot-time HugeTLB allocation has to initialize tail struct pages itself
when HugeTLB vmemmap optimization (HVO) is unavailable or fails.  For
gigantic pages, this can cover a large number of tail pages.  Most state
installed by __init_single_page() and prep_compound_tail() is identical
for every tail page in the same huge page, so repeating the full
initialization sequence for each tail page is unnecessary.

Initialize the first tail page normally and use it as a template for the
remaining tail pages.  Before each copy,
memmap_init_page_from_template() refreshes the PFN-dependent fields in
the template, avoiding repeated initialization of state shared by all
tail pages.

This extends memmap_init_page_from_template() from ZONE_DEVICE to normal
memory.  Keep memcpy_nontemporal() for ZONE_DEVICE pages and use
memcpy() for pages in other zones.  memcpy_nontemporal() was also tested
for the HugeTLB path, but did not provide a similar benefit; on x86-64,
memcpy() performed better for this workload.

The fallback path was measured on a v7.4-rc2 base with a temporary
jiffies-based printk modeled after the existing timing in
memmap_init_zone_device(), using 4K base pages and 64 boot-time 1G
hugepages.  HVO is unavailable on arm64; on x86-64,
hugetlb_free_vmemmap=3Doff was used to exercise the fallback path.

  arch    base      with this patch  reduction
  arm64   360.8 ms  256.0 ms         29.05%
  x86-64  171.0 ms  165.0 ms          3.51%

>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261113033442.62970-1-songmuchun@bytedance=
.com?part=3D2

