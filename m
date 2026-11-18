Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993974;
	b=bLOlv++N4xNITeT44/UkXR5vcJXBncSnxMWw3l0gP6UzEpj5O2lVQq0xt4bLEuZOh1m0
	 5BwG4xGEebrEcWZnxjyPxkXpYKRN9c9bPEzxDnj/v4W7RsSeMnCbFYseCP1AyFXpv3JrF
	 g3suQCWDaGBN1WYLVowT+sNYM6nnZ+g2AFjhGsnToo0hrN7V4Cf3vAm8aZpZ7YTtFcXjL
	 0Hjkh2GmjxhG5Vhl5v5iXLlB20t2z0MWtddkDm3EkiohEoO/aCtxHiNcGhPnlIYx0NUxE
	 DEwM6gnqg2NKkiWbM55SJsq7Jg5jGq8Q8zNPXSpBGKr5OhaC8FNSAVFkMrD1HD6vE7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993974;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DCpvpmRay5CD/t5tU4GRUaHaWtAjTRfHVMypBLzz8xg=;
	b=H4+dn9Pfki57jiQwabLtqEKVxZWbqoAxLtJnGbONc5vf99unxUyrwtSwu0+7eSqE4f6H
	 Ogx/CG8WsWJptTrZH1TRPlKO4f8GDVRiRi9qqPdmuPdkhlvXtPgPXCvTVRqKqtdpOu4D8
	 FREo6QrnaTPZuFPdnPUAiwJlKfoZig6W343h2uKcXVQZ7/i7KWPfG63FsvuP5UWcJttFm
	 welzUZ53rbeO2cdkmVNtNV0LTwrXPrFACoK5UKJdI+Zm4eS8xwXhBiarhM2TDDfWvKYI9
	 01ptrhKypbZDo076lwlgnsgmLAu6uebAo6Y9QR5pnf3k+MbolsagfvqvhPBuIivFG+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFGyvYg0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89065606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 09:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GFGyvYg0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C436A1F000C6;
	Wed, 18 Nov 2026 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794993974;
	bh=DCpvpmRay5CD/t5tU4GRUaHaWtAjTRfHVMypBLzz8xg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=GFGyvYg021aA9lGp/EV5CM0n4XTVQQku09tqAxj3wKvcKhVfUmu7U8NeJqLAXZBbq
	 GdUS8KiszLLaFlpuAe9DYQGLQlm70IdM+eow2x0MsrAOTu+CL1NmSXiZ1XLUxaEiva
	 RvXOZvreZ4yV9Qsfbg9LCpgO6y0vJcitiguVIE5flEY40fqmIxoiE6yPENkknz3nxg
	 8mdNCKtakb4Z0PCL41VECBeMGVn/FviYdCgscc1c25GjMNwmrpOa0IxEVWD1waUDaR
	 W73nKx/00g0zeQnzpuVzWKdRLvvfzwJG/Bft+p3mAmvLK7g/uFUZ0+00IZdidgRM8C
	 g/sqKLe/Ml+cw==
Message-ID: <50bfbdb5-548f-41e6-8225-5292fcaef535@kernel.org>
Date: Wed, 18 Nov 2026 10:26:03 +0100
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
Subject: Re: [PATCH v3 10/10] mm: print pte in __print_bad_page_map_pgtable()
To: Arnd Bergmann <arnd@arndb.de>, sashiko-reviews@lists.linux.dev,
 Arnd Bergmann <arnd@kernel.org>, linux-mm@kvack.org
Cc: Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Christophe Leroy <chleroy@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Linus Walleij <linusw@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Malin Jonsson <malin.jonsson@est.tech>, Matthew Wilcox
 <willy@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Simek <monstr@monstr.eu>, Mike Rapoport <rppt@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nishanth Menon <nm@ti.com>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org
References: <20261116124832.662455-1-arnd@kernel.org>
 <20261116124832.662455-11-arnd@kernel.org> <sashiko-outbox-218805@kernel.org>
 <ec881778-0f77-4f4e-be4e-17dc0adf8bf0@app.fastmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzS5EYXZpZCBIaWxk
 ZW5icmFuZCAoQ3VycmVudCkgPGRhdmlkQGtlcm5lbC5vcmc+wsGQBBMBCAA6AhsDBQkmWAik
 AgsJBBUKCQgCFgICHgUCF4AWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaYJt/AIZAQAKCRBN
 3hD3AP+DWriiD/9BLGEKG+N8L2AXhikJg6YmXom9ytRwPqDgpHpVg2xdhopoWdMRXjzOrIKD
 g4LSnFaKneQD0hZhoArEeamG5tyo32xoRsPwkbpIzL0OKSZ8G6mVbFGpjmyDLQCAxteXCLXz
 ZI0VbsuJKelYnKcXWOIndOrNRvE5eoOfTt2XfBnAapxMYY2IsV+qaUXlO63GgfIOg8RBaj7x
 3NxkI3rV0SHhI4GU9K6jCvGghxeS1QX6L/XI9mfAYaIwGy5B68kF26piAVYv/QZDEVIpo3t7
 /fjSpxKT8plJH6rhhR0epy8dWRHk3qT5tk2P85twasdloWtkMZ7FsCJRKWscm1BLpsDn6EQ4
 jeMHECiY9kGKKi8dQpv3FRyo2QApZ49NNDbwcR0ZndK0XFo15iH708H5Qja/8TuXCwnPWAcJ
 DQoNIDFyaxe26Rx3ZwUkRALa3iPcVjE0//TrQ4KnFf+lMBSrS33xDDBfevW9+Dk6IISmDH1R
 HFq2jpkN+FX/PE8eVhV68B2DsAPZ5rUwyCKUXPTJ/irrCCmAAb5Jpv11S7hUSpqtM/6oVESC
 3z/7CzrVtRODzLtNgV4r5EI+wAv/3PgJLlMwgJM90Fb3CB2IgbxhjvmB1WNdvXACVydx55V7
 LPPKodSTF29rlnQAf9HLgCphuuSrrPn5VQDaYZl4N/7zc2wcWM7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <ec881778-0f77-4f4e-be4e-17dc0adf8bf0@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/18/26 08:32, Arnd Bergmann wrote:
> On Tue, Nov 17, 2026, at 13:50, sashiko-bot@kernel.org wrote:
> 
>>   print_bad_pte()
>>     ...
>>     pmd = pmdp_get(pmdp)
>>     if (!pmd_present(pmd) || ...)
>>                                       retract_page_tables() / zap_pte_range()
>>                                         pmdp_collapse_flush() / pmd_clear()
>>                                         pte_free_defer()
>>                                         /* RCU grace period elapses */
>>     ptep = pte_offset_kernel(pmdp, addr)
>>     pte = ptep_get(ptep)  <-- bogus address or use-after-free
>>
>> If CPU1 clears *pmdp or replaces it with a huge leaf PMD and frees the PTE
>> page table via RCU between pmdp_get(pmdp) and ptep_get(ptep), CPU0 will
>> re-read the modified *pmdp and dereference a bogus kernel address or freed
>> PTE table.  Using pte_offset_map() and pte_unmap() here avoids re-reading
>> *pmdp and keeps the PTE page table RCU-protected while reading the entry.
> 
> This looks like it should be prevented calling conventions for
> print_bad_page_map():
> 
>  * This function must be called during a proper page table walk, as it will
>  * re-walk the page table to dump information: the caller MUST prevent page
>  * table teardown (by holding mmap, vma or rmap lock) and MUST hold the leaf
>  * page table lock.
> 
> Is that a case of do_swap_page() calling print_bad_pte() incorrectly
> that I can ignore here, or should I actually change this? Is the
> same race present in the upper page table lookups?

TBH, I wouldn't worry about. If we run into this the system is already pretty
messed up ...

-- 
Cheers,

David
