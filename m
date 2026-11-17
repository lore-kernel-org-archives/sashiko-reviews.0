Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953670;
	b=TfDj5ktdTyJoUur5eU4AkgZzn6xje7kgy9Z7sDr34Gz0/UJnLMjW7dXMOIC/Gn8sdyNj
	 KNAy+eUx9EafXwMXPl4/kjU8ukXV01qUvwtqlb748Y6bhnclR+aoe7ZDOcprqCyIk1sX6
	 qf+JCsiuyKWhClHXt8YiLAG3czDMas7Eug8PfeW3Ytg7QwjTjUNE877ZyrNFSWk1b9niv
	 9020eYoYOJJG3sHImntnXo8XdDUT4B4ud1ddo3o6KJaHoIC9PpmDFhKRzkqLsTZD9Hz9a
	 8h5ROSDNyIUPVCzKHJGCWJS9hqrQ8lDaCjCLePsDSAkYM9jD+hu/YNoZDwA0Vfj0C2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953670;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=R+2KYdjMaOZoj65JLgMEFAFNxfok4kzbLO0ccaHB1YM=;
	b=e4COUEFCnm1TcTgNilbDxV8sS6csyuoHWrBfXoOjxfoliOBI/mTkDNBxmGCt2RQ2esMg
	 6LYW4Sgbk84KV8+Y4uIepukV8+72AyiwVxM7OVdsYsTHKxqSRejFijphVV1LB/ze4rXc8
	 iqTqjKvmuLqjKIAsMWbT1kf1PwyIUabVaRe6l1uIs/YLaJ+8yBlKG1oPbZUieJBS0fQAH
	 /ZqutRfFcFMwBU1qrc2s1RZP5WROoRFKoaqaAXZ1m+lFa5D2FLUjD6ywD+zWZeR99MDgO
	 W6TUS6ITzIq634GgVt6fq57QYBVAu9ZstXYJ7/Gf5eC8wNeupyKRxHBN8/TQha1Bi3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQ9Ih8LR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3222B606A31C
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 22:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WQ9Ih8LR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175341F000C4;
	Tue, 17 Nov 2026 22:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794953669;
	bh=R+2KYdjMaOZoj65JLgMEFAFNxfok4kzbLO0ccaHB1YM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WQ9Ih8LR2PtaoATHxRv4/qfWJkjd9zFSoe9U1ofQ2bEGEwBmMpHuicI8cSgsdKW2h
	 Rj1yLoXjm3xzEBkpxwM5vyNGAJc+kf0MW2n/ARn5Dk/+5ZxVP//nbXzgMTEzbYCJ7a
	 1XiuVU5iMW3SkxSJCHHP+1e/zneOkbHQ4I8dO810X+K20GX4LLQa0+k3UT0GvJKPkP
	 hJBr7H3Gd+feLI6RE6RgPl+GhV2zVfrwQudtZvLdbPMdxTqzB1TECfwChQNsCRYNeP
	 6rZMwIC0ZskAnaj2PoCPP8uMBDt1MeTDTh68Vesfzpd+kWP8kQmwnrqsT7HL2VYV+b
	 CzY4huscGDOAw==
Message-ID: <51878e96-c283-4ccb-a06e-4ffe799cb130@kernel.org>
Date: Tue, 17 Nov 2026 23:14:19 +0100
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
Subject: Re: [PATCH v4 4/4] mm: add anonymous mTHP folios to the deferred
 split list
To: Joanne Koong <joannelkoong@gmail.com>, Kiryl Shutsemau <kas@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, akpm@linux-foundation.org,
 ljs@kernel.org, baohua@kernel.org, usama.arif@linux.dev, hannes@cmpxchg.org,
 alex@ghiti.fr, ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 liam@infradead.org, npache@redhat.com, ryan.roberts@arm.com,
 dev.jain@arm.com, lance.yang@linux.dev, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, willy@infradead.org, linux-mm@kvack.org
References: <20261103212004.1356327-1-joannelkoong@gmail.com>
 <20261103212004.1356327-5-joannelkoong@gmail.com>
 <sashiko-outbox-198104@kernel.org>
 <CAJnrk1auD1u1J0yQrXOeJrxvVsQfbxYf+nsMS-9qFQ0hfchG-w@mail.gmail.com>
 <aux4FcaEdTrJ60NR@thinkstation>
 <CAJnrk1Za6=B=Y3HOaJjhU7orq_P27QFe92_n9F2y2+108xDSOA@mail.gmail.com>
 <CAJnrk1YTX=kmDY1zwLncOpzTYsJ9UEa1h1PW9egV59hpnpO=WQ@mail.gmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <CAJnrk1YTX=kmDY1zwLncOpzTYsJ9UEa1h1PW9egV59hpnpO=WQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/9/26 23:29, Joanne Koong wrote:
> On Thu, Nov 5, 2026 at 4:05 PM Joanne Koong <joannelkoong@gmail.com> wrote:
>>
>> On Thu, Nov 5, 2026 at 4:37 AM Kiryl Shutsemau <kas@kernel.org> wrote:
>>>
>>>
>>> I think it is a bit of understatement.
>>>
>>> For mTHP it is every underused split: the folio is always PTE-mapped and
>>> try_to_migrate_one() drops one PTE at a time. Each underused split bumps
>>> split_deferred for that size next to the new split_underused, and a split
>>> that fails at folio_ref_freeze() leaves a fully mapped folio flagged
>>> partially mapped on the queue, which the next scan splits without
>>> calling thp_underused().
>>>
>>> Can the fix go in before this series? I think it is hard requirement.
>>> Let's not brush if off as pre-existing.
>>>
>>
>> Sounds good, I am looking into this and will submit a fix separately.
> 
> This is the link to the submitted fix:
> https://lore.kernel.org/linux-mm/20261109220958.2071687-1-joannelkoong@gmail.com/
> 
> I'll wait to submit v5 of this series until I've received feedback on that fix.

I assume we can make progress on this even without the other fix in place just yet.

-- 
Cheers,

David
