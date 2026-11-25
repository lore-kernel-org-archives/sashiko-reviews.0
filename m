Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613571;
	b=HuLp/zdfVSez5St20t4A+oazXZ5R2Baj7+Ln6kiRyui8opHTquT2HgLoq+O4849oGzUY
	 V0YDZ52a3Qtzrq/0MjiMfXXgelOefOEl0pnSBi/unO+KPMTvh21koKaueP/fp7vpccKrx
	 7gZKXFQsHhQg3bT/PEk2VVqMXVZffcAZciD0l1txTBaG3BSf3ljk91OtpNybKWTcJuODF
	 vfsrMfmGpYNQp+GeU1RFjUkHhyHjxoI41zTpfbY78jTGtHeAUz52F7ddVDqf3yGNwzCxb
	 IydS+e48x6z2nCrU2QRyHLSiCcQZYVxE7sDzw+84Zazd34vfvAsB0Ob1deYAMmDe71Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613571;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jiY+GIy6MY/XGAOEhBQIf2DUGSXYYkQR+i74zNHuAyw=;
	b=GGUPuEwrC3cukojQ3a22F/e8a9Y2tgRZVI/GTFuJjDAGtD3+ovfRmyItHTXryt+kEmup
	 DdZIa85/4Bpbg6uo1sjchZZnZrqlW9AaTlzkoEqzNksF2YayN8pplIehLYF8Kb6Fi7jru
	 ZK/lbByxYTY5jpupxhABWRq56TRh8jRoGoeTrct6Xb0FPbNKIT1s9oL92O3tlUiuHKmYn
	 LK1oaWg3Nz72eWa6HKpIE7Vrp6cv5k+5dVomrJHZo0kaOO74caPR4eKQzuD04a9uElvPJ
	 o77g6u/kCY+M3KEzSZvIUUbjX37rEaBu9hYDkpUhCnlLAV9NMaq9jI/tysB7gzndYcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Pnh0dVx/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4340606A321
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pnh0dVx/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2241F000C0;
	Wed, 25 Nov 2026 13:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795613571;
	bh=jiY+GIy6MY/XGAOEhBQIf2DUGSXYYkQR+i74zNHuAyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Pnh0dVx/+8VfiOTS2ZdsY706kRBMNLH71+Q/sILCBMjoG49P3AdvAMO2u0YKlphxI
	 VA1YknQ35/KLVbde/qu1XlmEm/XW4krkfAlRYg/RFOWgPrBpyNeB+a33j2Ae0XDPuv
	 fsPO2hKErwMds7qPSoNpOpCIUjqt5mdxDqI8ubZMgSLa9Tl8oY8mlXBAqKZXmhV3cn
	 I9ZUjj5zEHcusqG0gnNjGShxX6mnPBK/JAzp3mey8ft1/iTfLWHPFs6ZygSseOP7LH
	 njy1pzbKH38mJCggxr0Mq0B2GW9E/JWp4PleQ5J6KLgm7wLatJw9EBOXGaBeQxCvKI
	 9MWT1Jyy+iZRQ==
Message-ID: <2382beac-077f-4393-89ad-580bd09a6314@kernel.org>
Date: Wed, 25 Nov 2026 14:32:46 +0100
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
Subject: Re: [PATCH v4 2/3] selftests/mm: fix false-positive and racy KSM fork
 test
To: sashiko-reviews@lists.linux.dev, "Xu Xin (vivo)" <xu.xin@linux.dev>
Cc: akpm@linux-foundation.org, chengming.zhou@linux.dev,
 donettom@linux.ibm.com, linux-mm@kvack.org
References: <20261124130143.128411-1-xu.xin@linux.dev>
 <20261124130327.131410-1-xu.xin@linux.dev> <sashiko-outbox-233438@kernel.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <sashiko-outbox-233438@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/25/26 14:04, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] selftests/mm: missing Fixes trailer for
>   test_fork_ksm_merging_page_count() fix
> --
> 
> commit 9f91c40f8740268fa4e48f24e3a50d43177b045b
> Author: Xu Xin (vivo) <xu.xin@linux.dev>
> 
>> selftests/mm: fix false-positive and racy KSM fork test
>>
>> Currently, test_fork_ksm_merging_page_count() passes wrongly even if
>> fork() fails to reset mm->ksm_merging_pages, because the child process
>> calls init_global_file_handles() -> ksm_stop(), which unmerges all KSM
>> pages across the system before reading its counters.
>>
>> Fix three issues in test_fork_ksm_merging_page_count():
>>
>> - Drop init_global_file_handles() in the child process so it does not
>>   call ksm_stop() and mutate global KSM sysfs state (unmerging all KSM
>>   pages across the system) before reading its counters.
>>
>> - Use '!!' in exit(!!ksm_get_self_merging_pages()) to avoid 8-bit exit
>>   status truncation (e.g., 512 pages on 4 KiB systems truncating to 0).
>>
>> - Introduce ksm_pause() to pause ksmd (write "0" to /sys/kernel/mm/ksm/run)
>>   before fork(), preventing ksmd from scanning the child and incrementing
>>   its counter before it is read.
>>
>> Signed-off-by: Xu Xin (vivo) <xu.xin@linux.dev>
>> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> [Severity: Low]
> Since this fixes defects in test_fork_ksm_merging_page_count(), should it
> include a Fixes: tag for the commit that introduced the test?
> 
>   Fixes: 08ff89b5659d ("selftests/mm: add fork inheritance test for ksm_merging_pages counter")

Yeah, makes sense.

-- 
Cheers,

David
