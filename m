Received: from mta0.migadu.com (out-144.mta0.migadu.com [91.218.175.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068AB282F17
	for <sashiko-reviews@lists.linux.dev>; Sun, 16 Aug 2026 05:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786857065; cv=none; b=n73nK39JBH/WUbra/tCtEP1spAF7ro91QNVFdjC4yR2DMw8pWyCggtYzsoo4vJQzQfnUWf6a/Mf7k/NkIwBK6bbfTrYMT5CiEMI3zZVU/08ANMwtLzSa4ZmZF8eW668H8IXTs5n9iI34XwLiwAtHjCxtPUcSixdJiK6GEpk3ByE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786857065; c=relaxed/simple;
	bh=SEFoQbjK0tdz7j/adJ5Fjr7AVZ1n9GP8SfnoIvS6IYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b92i2n6OZJ7STAqLLRmHuWQOxleyfWNnlLiIoGYwWEHEmlobn1sawM3XI2aNzCO7LIpl00swm0N4VMKa7KYuXKaKZWx/4uKDOTFD2APq2s2iDQQc9QMvEAQ7q//gZz20hCjgILxY75XOo10QW8koXCzPI6hg0/BXUFaHLvJa4p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=lCGBZMku; arc=none smtp.client-ip=91.218.175.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="lCGBZMku"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=SEFoQbjK0tdz7j/adJ5Fjr7AVZ1n9GP8SfnoIvS6IYM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786857059; v=1; x=1787461859;
 b=lCGBZMku9G0Zetw5/uzfExK0ZOXhWoy74xBX9dWpn9FsL3b3WpJQhy0AGEpSwsOOrNfXNKhf
 mzBYQkaCzzA6BNDIYCqXy0WDY+8zc2pDNUccfGnc8Ci5c6X+aWgbzwG2/skTOUIxQxEewLcTdFo
 D0DobQSeCXjZN8r8Jfeht4VU=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: from [10.54.26.41] (222.72.143.228)
	by smtp.migadu.com with ESMTPS id b4d34709e7724279;
	Sun, 16 Aug 2026 05:10:59 +0000
X-Migadu-Flow: FLOW_OUT
Message-ID: <8cbc09e6-bc32-46d7-bdb6-890a3ba59568@linux.dev>
Date: Sun, 16 Aug 2026 13:10:56 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf] bpf: free page_pool frags via the page_pool path in
 bpf_xdp_shrink_data
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
References: <20260816031245.268898-1-jiayuan.chen@linux.dev>
 <20260816033752.794AE1F000E9@smtp.kernel.org>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20260816033752.794AE1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 8/16/26 11:37 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The netmem_is_pp() check fails on compound tail pages, leading to page_pool leaks and 'Bad page state' kernel panics.
> - [Low] The multi-line comment introduced in bpf_xdp_shrink_data() does not follow the required BPF subsystem comment style.
> --
>
> --- Patch [1]: [PATCH bpf] bpf: free page_pool frags via the page_pool path in bpf_xdp_shrink_data ---
> commit 28e0b86b119236ed1263628b895946efb16e99cf
> Author: Jiayuan Chen <jiayuan.chen@linux.dev>
>
> bpf: free page_pool frags via the page_pool path in bpf_xdp_shrink_data
>
> This commit fixes a page_pool leak reported by syzbot when generic XDP
> programs shrink skbs into fragments. It inspects the page itself using
> netmem_is_pp() rather than relying on the rxq memory model.
>
> Closes: https://syzkaller.appspot.com/bug?extid=237bbeed8dfe0699b7f5
>
>> diff --git a/net/core/filter.c b/net/core/filter.c
>> index 3423734124a5b..4536bd147c253 100644
>> --- a/net/core/filter.c
>> +++ b/net/core/filter.c
> [ ... ]
>
>> @@ -4293,6 +4294,14 @@ static bool bpf_xdp_shrink_data(struct xdp_buff *xdp, skb_frag_t *frag,
>>   	if (mem_type == MEM_TYPE_XSK_BUFF_POOL) {
>>   		netmem = 0;
>>   		zc_frag = bpf_xdp_shrink_data_zc(xdp, shrink, tail, release);
>> +	} else if (netmem_is_pp(netmem)) {
> [Severity: High]
> Does this check handle compound tail pages correctly?

I think we should process it like napi_pp_put_page

...

   } else if (netmem_is_pp(netmem_compound_head(netmem))) {
       mem_type = MEM_TYPE_PAGE_POOL;
   }



