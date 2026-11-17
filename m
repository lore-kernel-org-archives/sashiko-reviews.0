Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951688;
	b=z0GQOheqFC/KHzhu5hiSg8BaHYoK08/JtU/j8N6FKknep9tqam7UHvB+/5/j+nbFwCAs
	 M9nnKtvWDhZw+NHI0l19WJftyskiY77/zVBgeHwdkP3g3k3ybttV5j+/Q9yJKBEuxdQdw
	 JQ6CPs1FYP0Zs47gfn+goYgKOCXhvVaXmC8La389pyQPQCwenBBYK8AVzppWDx8Kt/4E7
	 ZdJpPvchSOdDBdSo5piCwhCuBhNmvVqz/dFBcm31MSM4LpchZCljWMrgPaxZX1Jp2/Qts
	 o9+CkjBOBKU24kITG56Inh16qcMGanVmejhBsecVpaZC0uh1nz3Im5Bsw8cFRHLvvAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951688;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=wGk+DFVe9G3lrZK0q6FM5QjUlw6oOxXtR4uzvN0+csw=;
	b=E/hRBBdn/s6uAJfmEPqnoEWHVnKt1+fP2i4JhJREixWJ8psocIq0WvRffrI6Hoi8bVUc
	 /oeAIiVyg51xmUcS/dxKKJLMMO6qKIWSZ4mIy/D7p8j4WYs8WYCL4Q2Te3vGNOJHUjp0N
	 oX49oM409BZ1He8pTm1Tm/7ShJqFWqT5oDNX97eVYEXyxDE3Q5ATVsA6NlJTYHMNryIox
	 tw4zztpOfzXHwlvvrmiCddYuS1wr8yt1lbIr4YmSByIrLL+NrzY4nm5cXcpwuPZvzPtL8
	 bX9meVVzf0UxWbkrSFte1B+gjoCPzM/OKOyN74P93ZX/A2W6dp8zbbEWOcXEpwHZfvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bnc/bhRw";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A1606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 21:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bnc/bhRw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB5E1F000C6;
	Tue, 17 Nov 2026 21:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794951688;
	bh=wGk+DFVe9G3lrZK0q6FM5QjUlw6oOxXtR4uzvN0+csw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bnc/bhRw5E0IDRCFeDwlKJ8EwQHTrX8og3jwM66r7QFpKAXb0fNGURcTEpQiHCm8N
	 JB7GL+O3Zx97ebeTC+1wgYKvrWxXQXdmZ6UMqnN1VazH5fSzdVE+DmbuSgdW3a4dky
	 gnpemLLi8mWk1mMt9g009N+E3oBJfDbBKjtWErEVdZK5xiSyrYPZldfiIGhU1cC65n
	 k7dhPZ92nbelkVG4yI1rpLXmd1JL+EDgFoN0Z72UK8ullhMOUBoDbe/8DEAWitgWQA
	 nWfafAY6gefsZqLWHg+F0WaYN5qoiRVDVSGw747Rt+nRGN9fG526d5MpPgDmV2S0oq
	 vr2djMHgdJpaQ==
Message-ID: <fffbb241-222c-4e39-8421-cb5468039e7d@kernel.org>
Date: Tue, 17 Nov 2026 22:41:19 +0100
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
Subject: Re: [PATCH v3] mm/highmem: refuse to copy hwpoisoned folios in the
 !copy_mc fallbacks
To: sashiko-reviews@lists.linux.dev, Yuanhe Shu <xiangzao@linux.alibaba.com>,
 akpm@linux-foundation.org
Cc: "Huang, Ying" <ying.huang@linux.alibaba.com>,
 Kaitao Cheng <kaitao.cheng@linux.dev>, "Garg, Shivank" <shivankg@amd.com>,
 vbabka@kernel.org, ljs@kernel.org, liam@infradead.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linmiaohe@huawei.com,
 nao.horiguchi@gmail.com, ziy@nvidia.com, wangkefeng.wang@huawei.com,
 tujinjiang@huawei.com, mgorman@techsingularity.net, chengkaitao@kylinos.cn,
 muchun.song@linux.dev, linux-mm@kvack.org
References: <20261110112641.1196786-1-xiangzao@linux.alibaba.com>
 <sashiko-outbox-208876@kernel.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <sashiko-outbox-208876@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/11/26 12:27, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] mm/highmem: missing is_page_hwpoison() check in
>   copy_mc_to_kernel branch
> --
> 
> commit 5b18d6f721e579b691687c6c8c6355f1e1a00b17
> Author: Yuanhe Shu <xiangzao@linux.alibaba.com>
> 
> mm/highmem: refuse to copy hwpoisoned folios in the !copy_mc fallbacks
> 
> This commit checks is_page_hwpoison(from) in the !copy_mc_to_kernel
> fallback implementations of copy_mc_user_highpage() and copy_mc_highpage()
> and returns PAGE_SIZE when the source page is marked hwpoisoned.
> 
> Link: https://lore.kernel.org/r/877bjowf9i.fsf@DESKTOP-5N7EMDA/
> 
>> diff --git a/include/linux/highmem.h b/include/linux/highmem.h
>> index d7aac9de1c8a4..c3240f70471d5 100644
>> --- a/include/linux/highmem.h
>> +++ b/include/linux/highmem.h
>> @@ -473,12 +473,18 @@ static inline int copy_mc_highpage(struct page *to, struct page *from)
>>  static inline int copy_mc_user_highpage(struct page *to, struct page *from,
>>  					unsigned long vaddr, struct vm_area_struct *vma)
>>  {
>> +	/* Don't touch data that is already marked poisoned. */
>> +	if (is_page_hwpoison(from))
>> +		return PAGE_SIZE;
>>  	copy_user_highpage(to, from, vaddr, vma);
>>  	return 0;
>>  }
>>  
>>  static inline int copy_mc_highpage(struct page *to, struct page *from)
>>  {
>> +	/* Don't touch data that is already marked poisoned. */
>> +	if (is_page_hwpoison(from))
>> +		return PAGE_SIZE;
>>  	copy_highpage(to, from);
>>  	return 0;
>>  }
> 
> [Severity: Medium]
> Should the #ifdef copy_mc_to_kernel implementations of
> copy_mc_user_highpage() and copy_mc_highpage() also check
> is_page_hwpoison(from) before mapping and copying the source page?
> 
> copy_mc_to_kernel() only catches hardware exceptions raised during the
> memory read and never inspects page flags. 

I'd leave that out for now. This commit is explicitly about fallbacks.

-- 
Cheers,

David
