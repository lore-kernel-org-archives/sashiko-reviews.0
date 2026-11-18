Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995318;
	b=k4yWFWyuo9cbh86zesuHG0Pf8vFrSzlzNBS4FxXN74tOcy4tDn3dcK5CZCo8R+s4IhEC
	 E1WAqsoZbLZwuEPDMw0VhfPRUYK15SpzBaW0INEYfYhGgZIm6u1Ooc7lhOQfCZCi64IH6
	 cMavJwKO211Mm66Mo76drCLQK8rYoWjSATJvNnFH4rSS8lkhMT1qXh2ITMsCEIVOso8XR
	 m0NqMxpZDEE3sXHYKVseFweXMiSYd34BUYFIvxvwjslGGjNfNQiTjAd78pCwT1Ktaocm7
	 77CVygHZ8beqcC+NRTBLY502nrDLtGTQcmWiJTo3ynaU39OQr7nZ8cDHMGGJ9gRwAHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995318;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=P3tTzRsiHEws2zlKl6166Pd8xjKFQ47hlRmRKJ7QcwM=;
	b=yil0yvNpxweo/foOYPB9QxHWArMadd0BVXm27fbgmv4h3PF9e2FY0h8c40B9fq7IYT+X
	 bWHDx4gWoXe/6lTrQ1WLapQBmxbntEfUSszUJaLll8VyLsiAcqGNOHnBH6DFP90RcdPZz
	 p9r5KarwiskCRej9fElsZ6sWjmpodHQluL1W/Q7Kpezr8P3fNWVlRnDVDPgWsHk28Q9iZ
	 7Iqen8/29mFXk+r9csb7uCSeqpdF4MsAiTzZpdy8ejHYLchRr4e8wcoi8YwpMy4l4vhtR
	 TMLlqccFEWptYdeAB4FgArvip48hXNu1eFd7zJ7ycU9B7XTkbvy3M5Gpxiqy9+VoHmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=S6WXGb+q;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LNPA9bF6;
	arc=none smtp.remote-ip=103.168.172.149
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2366606A880
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 09:48:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2366606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=S6WXGb+q;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LNPA9bF6
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id B1528EC064B
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 04:48:36 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 18 Nov 2026 04:48:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794995307;
	 x=1795081707; bh=P3tTzRsiHEws2zlKl6166Pd8xjKFQ47hlRmRKJ7QcwM=; b=
	S6WXGb+qbJjbxUTgKfFh0DTFPnWUpI9EQ+MRJzPPcNmAqRlbnpsva0qN9N+2q6I1
	dqzevcSRtCaEb476kPBOUue9URUESewonWa5r/65b9m6O0O/iv/BZrRKjKQUeHA/
	R0vKqxC0BjTzE2EcIwHO2i8nUu30LC+S6gSryejfz9wJGukJHShsIrVIjafQeh17
	xGED/AUQMmUDCk3D0TohSBicE93927kxRBa/0fS6FaGQ1EvXnywxD14LLt2cE2EX
	mXYNWp+bD5K+mGUKjoaSG+HGj4xLX+oscKmxbLTGAqv0y5tZqZCK+CKMNf25QVT0
	0qLQ0hV8FK7mrYvbtP24eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794995307; x=
	1795081707; bh=P3tTzRsiHEws2zlKl6166Pd8xjKFQ47hlRmRKJ7QcwM=; b=L
	NPA9bF6KLr5hK9v17V9Y0UTrumaVYezQw1gruXqHLxW/7cpDBatGe6yZZJeWSkpa
	/ZT6gM9NeMeUV1SEeqNmZoirxtlYxbKV4OHWwNhpXYogfJ0JKjnMhVdFmANzrYZN
	jqsRWuVSvzKHJksYX8cmZ78jNtB9QvMs1jT0Vou7k4UMr82LJyo3C30YlAjJFFq4
	cpHXw0SqSdG1A+tqCuVPCxTv4zU54hXH8x6xvarwD7lPnHZDJ4Wu3H4s4MYOV9Sw
	nwLwbtNZSHypozMZwRCIqsD2DJq6X2s3n5MS2a7Oq7NPHktYMSUyK3jJ46FJCPEy
	zKS8r9x30BI4ZpaHHe5Dw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794995307; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PHNhc2hpa28tcmV2aWV3c0BsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:AHDhWlvcrn/JR3tUekWhqJSUwWGZp95NcMin2ePlibZOeUK
	5NhWOVCm+vyLalM5PpoOL8XpekJQX+BLE75PWwgct68qnmMdoX3kDX3QRBFN/Web
	w2ruOKnGF6bSKSbDd7CY64Y/ChnNU8ZipyjD43/FxIP/+vwqLtu7d35yhTXnKy1t
	h92C2jXPxuaw3elqmpczkQSq5CfWbZ3XnuKhTJcOu0ZP4001AEu9d2Pl5/N4qp4R
	WwBHe8LmJF8bTv5jjipyzMMqRMKxCfb2EgQrmnlrPSRTO7YmcMwTaxfOM64JmC79
	AxeCo45icyCokiRNTzx40Sp+tNC61LA3oZF+qCg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:o1ZNBUMdgmZRFjQGvJCT8X1PeIOdnxDpY9ythOT5Mkc=:NdQqLdoVcsTAskrYI1FJtDTJy8FiZWNAwAbqq3w3to8=;
X-ME-Sender: <xms:YHT9alvCuN3JL_9c-toAGogtzwhCInTBjFViYNiov90YhiWcf_dniw>
    <xme:YHT9apRWu1eRnRfg6iuE3qiVLkmbB9qpJ27NADGLhq_X75viSN23swABlSi_N5uv_
    c3pWbFy7tZdQ7YRi6PBU_4H2Lf7Fw8GwcUIqAPbc6UUDg825fqpMj0>
X-ME-Proxy-Cause: dmFkZTEQnUw3sFO/J+KDZ5wTMqryjhyx7/y6yNzE9VcfWSQ2np6l+Yf+6Au26OrFy23XHD
    q+kC97X6kGXgA6vqSPGPEfQDWQ2vMTbJNlSqeMjc5kYk5NUK55hZXYfIPeSXR7fybsijJe
    3ldwVajPYU1lVvXUgbx6LqumEjlYZOyUCH31hVtg8wyJp1X0BNA9d9duqEwIcVZnRO+cZV
    0ze2wT7H5qksb2DY7cWBKvYNWqBrrQ3erPktQrTZu8vhtaVVjGR8q1vZOY9xYbpve8xolF
    /VpnRWtZLTOj+r2SFWPfJzqFFS017/XR4aLoUuUnQh/4PQDJnR8Ny6JeIi3Rj+OWCUAVSw
    USzYGuaD6wWc19GQqM8uBzzUQ5Pwq77McE8zw1Nr+eaYDOPtWyb784NtLyXUE75SRx97m0
    2RbY+WTXnYbF2NMhmoM0MNWQg+VIV0nIoboZks2dOKBJXBk8/cNqQyzaA9+E6PvHnkVaOS
    IGPa5nEB7GEfiGo21WrViSNW/W/YwQYiHx89/y8OpZu/NMDTDZaoQA1dTNNm19jSrHUOWH
    6lGvsHFhw1TzUqVwV2QQU/aPuC0HLnIiLZ3tFwirVJmVT3dEQXzsgcMMixR2yvAOGFr33h
    dxh/y9EfxAXGYv+0A2zSYuSc4/3H5eip4VmlfKT+PxCpj/aDLIoS/WDR2/xg
X-ME-Proxy: <xmx:ZXT9amc-jikSr7ODgA86wfQA4FAc6om2UhHVQYMYvOZKLhasITEamw>
    <xmx:ZXT9atphb6k7Rvu90VtwmzepKlAPL4YNd8LJtn4a0UTqVMOlK3Mjxg>
    <xmx:ZXT9andBn5XjFKBp8p0GZ-sO31k5S8dYKkEkflv5Yj4RzU_srqvOww>
    <xmx:ZXT9allimL9RLpsxW_AkORfJTK-jeUc1qIB4wVunFIbgAtoJXOXzIg>
    <xmx:a3T9aqUluMyKPmnty1ayKQTOHrsEPnZ6BdR6xTbyt9RixJCoIigugnse>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 43D7232A009C; Wed, 18 Nov 2026 04:48:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: A70rKOtn2eLk
Date: Wed, 18 Nov 2026 10:47:55 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: sashiko-reviews@lists.linux.dev, "Arnd Bergmann" <arnd@kernel.org>,
 linux-mm@kvack.org
Cc: "Andreas Larsson" <andreas@gaisler.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "Ingo Molnar" <mingo@redhat.com>,
 "Jason Gunthorpe" <jgg@nvidia.com>, "Linus Walleij" <linusw@kernel.org>,
 "Lorenzo Stoakes" <ljs@kernel.org>, "Lucas Stach" <l.stach@pengutronix.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Malin Jonsson" <malin.jonsson@est.tech>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>, "Michal Simek" <monstr@monstr.eu>,
 "Mike Rapoport" <rppt@kernel.org>, "Nicholas Piggin" <npiggin@gmail.com>,
 "Nishanth Menon" <nm@ti.com>, "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>,
 "Thomas Gleixner" <tglx@linutronix.de>, x86@kernel.org
Message-Id: <c8f80ac0-83ba-4d59-9930-ef497312e2b7@app.fastmail.com>
In-Reply-To: <sashiko-outbox-218796@kernel.org>
References: <20261116124832.662455-1-arnd@kernel.org>
 <20261116124832.662455-2-arnd@kernel.org> <sashiko-outbox-218796@kernel.org>
Subject: Re: [PATCH v3 01/10] ARM: remove support for highmem on VIVT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Nov 17, 2026, at 13:49, sashiko-bot@kernel.org wrote:

>> @@ -178,14 +143,12 @@ static void xsc3_l2_flush_range(unsigned long start, unsigned long end)
>>  
>>  	start &= ~(CACHE_LINE_SIZE - 1);
>>  	while (start < end) {
>> -		vaddr = l2_map_va(start, vaddr);
>> +		vaddr = __phys_to_virt(start);
>>  		xsc3_l2_clean_mva(vaddr);
>>  		xsc3_l2_inv_mva(vaddr);
>>  		start += CACHE_LINE_SIZE;
>>  	}
>>  
>> -	l2_unmap_va(vaddr);
>> -
>>  	dsb();
>>  }
>
> [Severity: Low]
> This isn't a bug, but both xsc3_l2_clean_range() and xsc3_l2_flush_range()
> still initialize vaddr = -1 with the comment "to force the first mapping"
> right above these loops.  With l2_map_va() and l2_unmap_va() gone, those
> initializations are dead and could be dropped just like in
> xsc3_l2_inv_range().

ok, fixed.

>> diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
>> index fb2eb0ed7bb87..917a546af0b90 100644
>> --- a/arch/arm/mm/dma-mapping.c
>> +++ b/arch/arm/mm/dma-mapping.c
>> @@ -647,18 +647,10 @@ static void dma_cache_maint_page(phys_addr_t phys, size_t size,
>>  			if (len + offset > PAGE_SIZE)
>>  				len = PAGE_SIZE - offset;
>>  
>> -			if (cache_is_vipt_nonaliasing()) {
>> -				vaddr = kmap_atomic_pfn(pfn);
>> +			vaddr = kmap_atomic(phys_to_page(phys));
>> +			if (vaddr) {
>>  				op(vaddr + offset, len, dir);
>>  				kunmap_atomic(vaddr);
>> -			} else {
>> -				struct page *page = phys_to_page(phys);
>> -
>> -				vaddr = kmap_high_get(page);
>> -				if (vaddr) {
>> -					op(vaddr + offset, len, dir);
>> -					kunmap_high(page);
>> -				}
>>  			}
>>  		} else {
>>  			phys += offset;
>
> [Severity: Low]
> Should this keep the kmap_atomic_pfn(pfn) call and drop the if (vaddr)
> check?
>
> 52c9aa1adc30 ("ARM: dma-mapping: Reduce struct page exposure in
> arch_sync_dma*()") converted this path to kmap_atomic_pfn(pfn) so that
> only the kmap_high_get() branch still needed phys_to_page(phys).  Using
> kmap_atomic(phys_to_page(phys)) reintroduces a struct page round-trip, and
> kmap_atomic_pfn() never returns NULL.

done.

    Arnd
