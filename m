Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.238
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795519114;
	b=ojdZCUgBcy4Rv5mDvKl24rjweHR/C/bZcec+tRHtH/q+GPKDW8YJw8PFvmGpeuIXmdgs
	 WkgpPuNnSVxaj1BQWqou4QYjpooJnienEX7aqu31Z0ymvLAkr2TC5/tBbsBtEhQZDRLU0
	 7/BnNWyTl9YZptSnntPhMW2XrzWZHj2TEmFSyhchYMcD41ZvS2QjMGTjZ/GJlwP9jMhAn
	 jnPONXprxtu4Wc9CfsTVIA+r1cd5S62X4tyh7fA4avKFLKnUcC3Ck5OwZ4QKEaVgx6wQx
	 XWjLwrN6dsRgIUr+gdAGi5+zGOfyLTi5QGdjEDiMbd40gEyWWx9nnXkdK1RmH1WOwxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795519114;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=EFTAQXzJPmG7VROXVdiQ9pfVfbpHSsS1PwNgCR+b54w=;
	b=rhjliSqbfDStnFboATIIovW3sxf4vOvIix25E1P4EAPC1/5eD3CZ7fuvN8LmI6fQFg1+
	 vfNgAeqTazPFCd1ce5/C8iT/d485KGk93bmA9RJDou6brJMO3YFSAjNg33JPdDklugjm1
	 FoXu30k/GaJ4zCel/WtuZslfR++9+v4eyPPrWzz6rfzNrrGMHywiCkvEtRbgvGDtla7A+
	 4JI0tqIYNHByFlmHdKi0tExl54jXW0mPef0nZXf3ixxFusmm/HQBZwrpm4V2nEob6oyNb
	 BOAGtijdCoiwHvim2BsHyyx7/L/tAo3/MznJAqu9XbSU+kCd5Ge7WepIEx6rD9GXvjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Oa+csrF1;
	arc=none smtp.remote-ip=95.215.58.238
Received: from mta1.migadu.com (out-238.mta1.migadu.com [95.215.58.238])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB4606A689
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 11:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEBB4606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Oa+csrF1
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=y42ceMjaFxWiqxybsUmhWAVQHVb2z+bt3IKEjNc/dFs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795519105; v=1; x=1796123905;
 b=Oa+csrF1n5Yyh8f3PsL9glw9oeBdqz/+gmbzMwXcj5YwEIlM3ahV9L3N2ChYCfP30juPcwBS
 v+6NlgcPXebs4IZjwpzJ5lbawEHW7mVuT3cfg/bMHkyB/V25+af4c+An2QrKMG7PKD3AsMUYiU0
 j8sqmwNIWG2e9YnYoTzTq/YM=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 2c945a36ab831988;
	Tue, 24 Nov 2026 11:18:25 +0000
X-Mizu-Trace-ID: 2c945a36ab831988
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
Subject: Re: [PATCH 1/6] mm/hugetlb_vmemmap: remove the vmemmap savings boot
 message
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <sashiko-outbox-231028@kernel.org>
Date: Tue, 24 Nov 2026 19:18:09 +0800
Cc: Muchun Song <muchun.song@linux.dev>,
 Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lance Yang <lance.yang@linux.dev>,
 Qi Zheng <qi.zheng@linux.dev>,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <72671D69-0C65-4C1F-A685-2DEFEE1E9FC5@linux.dev>
References: <20261124110530.3004071-1-songmuchun@bytedance.com>
 <20261124110530.3004071-2-songmuchun@bytedance.com>
 <sashiko-outbox-231028@kernel.org>
To: sashiko-reviews@lists.linux.dev
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 24, 2026, at 19:16, sashiko-bot@kernel.org wrote:
>=20
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm: missing const in !CONFIG_HUGETLB_PAGE huge_page_order()
>  stub
> --
>=20
> commit 852c6ee3c3138346a4a6991f35b8658e23f3cb65
> Author: Muchun Song <muchun.song@linux.dev>
>=20
> mm/hugetlb_vmemmap: remove the vmemmap savings boot message
>=20
> This commit removes the boot message reporting potential HugeTLB =
vmemmap
> savings along with hugetlb_vmemmap_optimizable_size(), and updates
> hugetlb_vmemmap_optimizable() to check vmemmap_optimizable_order() via
> huge_page_order().
>=20
>> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
>> index 0d5414392d870..b5b877ed5b92c 100644
>> --- a/include/linux/hugetlb.h
>> +++ b/include/linux/hugetlb.h
>> @@ -812,7 +812,7 @@ static inline unsigned long huge_page_mask(struct =
hstate *h)
>> 	return h->mask;
>> }
>>=20
>> -static inline unsigned int huge_page_order(struct hstate *h)
>> +static inline unsigned int huge_page_order(const struct hstate *h)
>> {
>> 	return h->order;
>> }
>=20
> [Severity: Medium]
> Should the !CONFIG_HUGETLB_PAGE stub of huge_page_order() in
> include/linux/hugetlb.h also take a const struct hstate *h?

Yes, and easy to fix.

>=20
> hugetlb_vmemmap_optimizable(const struct hstate *h) is defined outside
> #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP and now passes h to
> huge_page_order(h) behind an IS_ENABLED() check.  When a file such as
> mm/memory-failure.c includes mm/hugetlb_vmemmap.h with
> CONFIG_MEMORY_FAILURE=3Dy and CONFIG_HUGETLB_PAGE=3Dn, calling the =
non-const
> stub triggers a -Wdiscarded-qualifiers warning (or build failure with
> CONFIG_WERROR=3Dy).
>=20
> --=20
> Sashiko AI review =C2=B7 =
https://sashiko.dev/#/patchset/20261124110530.3004071-1-songmuchun@bytedan=
ce.com?part=3D1

