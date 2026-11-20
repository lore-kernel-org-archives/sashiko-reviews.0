Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795171180;
	b=jg0wpi/tqsYQFPVHg7yUsLkpa+qhE+EZuQgBzXLEMHeMMkiQaiI6y/f4Am0sfbQRhs0s
	 k/DvcpVRB2MquIElTCZjzNjigDSW3W6p4GqpIx2VpoQ9LVLYDPSjukn3/W8iIwd0dXbBa
	 QxtT3QulzqCW7t/X46k2EFxArGanpREvhb6hC+es7mPAUUnpo9terZLHF5357rRtXKicz
	 f4vl6hvWPmvMV7tg8uxHIACqCIgB/8KmxnHEcS/lBRVOKpLU2mdH9MNw5R+bR6cwaCHpf
	 vi3SH/1Z0BG0SGmABxAYPu52aIXtG4EcaGpD2UieBiKlqz//ZeSCPyMAQv6dkcBxyLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795171180;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=vGIW9I1ju4o1yJGSu39nk3CaJ8NQdo93J8CXX8CWrdo=;
	b=QMHvXwv3el9Z1mku7Q6kfevkUO/ibkjOfHQdVo9B6/+Dje0M4GeuwUUJcL0hd6f2KNMH
	 YdyVcQdAuSyXtgq3DkjQWFNOWHQhu/8WqLKtYkfZ6HYRC4UYK8gaxwignNCCiPBikU8CZ
	 AcCh0YS7IaY8wYjDBSWXSA33HmhnV36KNW+AG0ABz2Haz8Hh9c6PxQvROXwwR2Jn7CVcr
	 W/dDchwOl0VpgkZ66A90GsPNKSNzfS786tHmP/2zmbZ8IZeXmJYAicMFD28YrAfM6qFNP
	 RjSy5p+hG3S6z29eMlImecD4hwmr/b5GQmM7kr2yEUwRcvMRvxHUQ8QOmqU2YikCO0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGBGu8Pc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76474606A320
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 10:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IGBGu8Pc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEB51F000C0;
	Fri, 20 Nov 2026 10:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795171180;
	bh=vGIW9I1ju4o1yJGSu39nk3CaJ8NQdo93J8CXX8CWrdo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IGBGu8PcmiFc8kFSm5YOE+U19GwPgF+o8NDkNsg1tj9YkoyZ+5alsM8cO2U4sebtx
	 cjGYUFaxIoh/bzAvm9ZDG932gYkLjexyJDNSkghGIrSTqkhupNHKxeeqFXKSMftGwv
	 LacEuCexP+Mjv52VHF1yXPFWZbRIiQVXEnCENMgeIbGbjfdGgmhqUjaCkQf8hIxpat
	 KDGdFFFNxtDeG3Aa4ExrLhy3whA/Y9d1fKtCKKmp0848c+f98nedXelZRgZ+Z8NjRw
	 Aymihtefuu1JYhRz+1eBkq2kIuLQ/Ky2olyPPWnUWqTYjdQ13xMSLtdrkISnPjcoVE
	 l7H/xSCOusr8g==
Message-ID: <87218525-12f3-4259-9950-877c8e36c83e@kernel.org>
Date: Fri, 20 Nov 2026 11:39:33 +0100
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
Subject: Re: [PATCH 1/2] [v2] mm/mempolicy: fix copy_nodes_to_user() for odd
 inputs
To: Arnd Bergmann <arnd@arndb.de>, sashiko-reviews@lists.linux.dev,
 Arnd Bergmann <arnd@kernel.org>, Gregory Price <gourry@gourry.net>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: larips <larips950@gmail.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Ying Huang <ying.huang@linux.alibaba.com>, Lorenzo Stoakes <ljs@kernel.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Jackie Liu <liuyun01@kylinos.cn>,
 linux-mm@kvack.org
References: <20261117211635.2472067-1-arnd@kernel.org>
 <sashiko-outbox-221983@kernel.org>
 <c420ec17-b297-469a-927a-85934a05fda4@app.fastmail.com>
 <3b00e53f-b4eb-41d4-b3e6-791660da3342@kernel.org>
 <45a71e8e-0c8c-4b5e-96c9-be6f2ad0e364@app.fastmail.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <45a71e8e-0c8c-4b5e-96c9-be6f2ad0e364@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/20/26 11:16, Arnd Bergmann wrote:
> On Fri, Nov 20, 2026, at 10:55, David Hildenbrand (Arm) wrote:
>> On 11/19/26 16:52, Arnd Bergmann wrote:
>>>
>>>
>>> Same as my reply for patch 2/2: no, this is fine as the size of the in-kernel
>>> buffer does not depend on the word size in userspace. Copying the extra
>>> zeroes from it is fine.
>>
>> I'm not convinced, especially given Gregory's test case. It's all a
>> confusing mess.
> 
> Right, I see now where I went wrong: 'maxnode' is adjusted down to
> the nr_node_ids, not the number of bits in the bitmap. So my patch
> was wrong, and Gregory's was correct.
> 
>> I do wonder whether this whole function should be thinking in terms of 
>> bits to make
>> it easier to follow. A bit more churn, but at least I can understand 
>> what is happening there:
> 
> I like this version as well.

Does your #2 still apply once we would have that (in a reworked form)?

I'd appreciate if you could resend based on my suggestion. Feel free to adjust
what you want and just keep it to a Suggested-by (No need for Author,
co-developed-by or any of that).

-- 
Cheers,

David
