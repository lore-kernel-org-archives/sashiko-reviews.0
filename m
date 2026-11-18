Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794991534;
	b=Niog/9CwdtI/2rTUhDILUy4m2TLZlrKzQDNM02vRkEApyjWCtWPLo/siDzWqppddeL2W
	 M40hp1fCnXcqbmsm6w1RUCtmhlJNf7GOABKjlKnKY9U3/395OVkVBMhseIh4oQ3Y8YFyo
	 CkodVccqB3Upw9Gr0iFA2D/B0jEC8zeuMDLmYPdn+t91EC6QO/CFNnBHdzK0Zia/SdqRA
	 dC/IH0uVd4SqNpxTp5nXCxEAOf5VJhmQk4iJRQPr2LhRfdQP/gQM1iI9eKRm5iyj52rMy
	 q0zClGukghkn+0PjT2c2KzCJkudQU6Oh+2oL5HQe97d4zK5VHBi03gUSG9zApX+/EbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991534;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=CL1Kb+/j64ntc7xw8JHIyID3bJJ/doyvWUN8+vUnQ9Q=;
	b=golutx4tpkxcb2nPdlS0wWrPaTmJFjGa0SBcp+Resc4pw93RLqNXbRYuaqq0o1o5ZqJX
	 qgGcaYDbpi84tWQX3sPyqMQjo0Txnp2+TztJcGTEqESnXUKNmGx+O3Z4bDGCsr4gOZiiL
	 75uP3hmyBuIAQHWU6ZyShdqbxiunFK2CcmnlNXanosmOUsP7etG5Xgkf6GmnHizkX94tE
	 IPWWgwabWxVpJoVFaajhJ34sh6Bh7QYZb7A4apR1PAv9k8ajhZ7/nQ+87hleilOSBplAQ
	 s76q+MthoIYCsTKrUczm+7agBvfQ2yThoQyKPL98Kdy8qamkJAa+IJCGhl2GGH7HGmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=SUB4oc9H;
	arc=none smtp.remote-ip=113.46.200.225
Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1000F606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 08:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1000F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=SUB4oc9H
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CL1Kb+/j64ntc7xw8JHIyID3bJJ/doyvWUN8+vUnQ9Q=;
	b=SUB4oc9HwMnPHmTzpOhpKHD7saGp4F2pDd1vz3kEEdREGmKKTeDzHrc6qPoGd7XPhmfj+NCQB
	MXwaag+Lva7rO7gKYjNUzUAXiTNeh4WV7t4B1AeVXeDe/qUIbHv7dLRKrgQ1m180eAYpcO4vfk1
	wtxJ3lmi6rrrwkfd8zxJHSM=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4jTwCb3ddhz1K970;
	Wed, 18 Nov 2026 16:45:15 +0800 (CST)
Received: from kwepemr500001.china.huawei.com (unknown [7.202.194.229])
	by mail.maildlp.com (Postfix) with ESMTPS id 21DA84056A;
	Wed, 18 Nov 2026 16:45:29 +0800 (CST)
Received: from [10.174.179.68] (10.174.179.68) by
 kwepemr500001.china.huawei.com (7.202.194.229) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 18 Nov 2026 16:45:28 +0800
Message-ID: <0ca5bbc1-2101-4a13-971d-b5a14e56e5ef@huawei.com>
Date: Wed, 18 Nov 2026 16:45:27 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] mm: add spurious fault fixing support for huge pud
To: <sashiko-reviews@lists.linux.dev>, <akpm@linux-foundation.org>,
	<david@kernel.org>, <ljs@kernel.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <ryan.roberts@arm.com>,
	<peterx@redhat.com>, <dave.jiang@intel.com>, <linux-mm@kvack.org>
CC: <wangkefeng.wang@huawei.com>, <sunnanyong@huawei.com>
References: <20261117020237.4037980-1-tujinjiang@huawei.com>
 <20261117020237.4037980-4-tujinjiang@huawei.com>
 <sashiko-outbox-219925@kernel.org>
From: Jinjiang Tu <tujinjiang@huawei.com>
In-Reply-To: <sashiko-outbox-219925@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr500001.china.huawei.com (7.202.194.229)


在 2026/11/18 10:03, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: mm: unaligned address in
>    flush_tlb_fix_spurious_fault_pud() flushes 2 PUDs
> --
>
> commit 89132c364112921acce9427dab367c258f86db04
> Author: Jinjiang Tu <tujinjiang@huawei.com>
>
> mm: add spurious fault fixing support for huge pud
>
> This commit adds spurious page fault TLB flushing support for huge PUD
> mappings and implements flush_tlb_fix_spurious_fault_pud() on arm64.
>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index a06b0f5c34111..3c1c000cc5dd1 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -107,6 +107,10 @@ static inline void arch_leave_lazy_mmu_mode(void)
>>   	__flush_tlb_range(vma, address, address + PMD_SIZE, PMD_SIZE, 2,	\
>>   			  TLBF_NOBROADCAST | TLBF_NONOTIFY | TLBF_NOWALKCACHE)
>>   
>> +#define flush_tlb_fix_spurious_fault_pud(vma, address, pudp)			\
>> +	__flush_tlb_range(vma, address, address + PUD_SIZE, PUD_SIZE, 1,	\
>> +			  TLBF_NOBROADCAST | TLBF_NONOTIFY | TLBF_NOWALKCACHE)
>> +
> [Severity: Low]
> Does flush_tlb_fix_spurious_fault_pud() flush two PUDs instead of one
> when the fault occurs at a non-zero page offset within the huge PUD?
>
> fix_spurious_fault() passes vmf->address, which is only aligned to
> PAGE_MASK.  __flush_tlb_range() then aligns start and end to stride
> (PUD_SIZE):
>
> arch/arm64/include/asm/tlbflush.h:__flush_tlb_range() {
>      ...
> 	start = round_down(start, stride);
> 	end = round_up(end, stride);
> 	__do_flush_tlb_range(vma, start, end, stride, tlb_level, flags);
> }
>
> Whenever address is not PUD_SIZE-aligned, round_down(address, PUD_SIZE)
> and round_up(address + PUD_SIZE, PUD_SIZE) span 2 * PUD_SIZE,
> invalidating the adjacent PUD range on the local CPU as well.

Yes, confirmed. flush_tlb_fix_spurious_fault_pmd() has the same issue, which
is pre-exist. I will fix both in v3.

