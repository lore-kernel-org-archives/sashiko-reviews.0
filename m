Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014249;
	b=D4LQZStdrBm4xQZDo22Vvo9Yvv6gSV0ReDP9hmryyu6/U/1eMxbmigtOzYfXYSrUF+3L
	 7Nn3IQaQJR3KKFEbLuX71zNTYC1oCqN0TqI4xwXLw8KMv+P7+MJeBWxNOU/tFypajwPRf
	 4OErGk1BxFO6OnpjFJsQEzye8xgHeatX5Ip2DW8EDGeIHIH6Dx/yozIzByKGP+rX5mhQ7
	 0J5lw+oXeSitcnw4bJn/+cf0RvF6J3KiSFSq6mS7pd2yUDxrQBNozrQwBqjL0bjl2bbQr
	 wD5piJZNJydfewj25nG1pg1yncEAnV5f2jR0HAyhvZB+y1Z/BZz+JJirGj6vSqq3Q8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014249;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Yfwtmuh15e5L/fsscSO213kl0aITGy03gz7OI2vHFYU=;
	b=cinoeunzJqQQh4lqI/z+Y8eOIBzGQgBGDQgK6ppqlu7NJkDCeWJOxCaEqgFLEcmUftgM
	 93qKmA9oQy7ob69vJaLXGt/eJ+ef3cU/LE9G2/JZPCMBtIfcGyHmbgTKUexUdjGmdLNCt
	 wGNQQAadq/SQKu6NHlP6TW4b5Yeb2CtbXRidGZuoDP3vCgp6AFvuZvNRbN/aTpj3H0uBi
	 +DvEnhlU92c+mZllFZsE86jg9+EZXzNzOsxJhvVlj5XVoHEY4E7rp8PvI4eXamVCGJfve
	 lQOiLSS6wcMU8KM+9VI7lMa0g9+sdO0XSM5tXjN2k8N2Qy7OCN0aHeRJE/3WAHSfPIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SS02ieOm;
	arc=none smtp.remote-ip=95.215.58.161
Received: from mta1.migadu.com (out-161.mta1.migadu.com [95.215.58.161])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14990606A320
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 15:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14990606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SS02ieOm
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=XhbjaJ8im/VrH8GwiaavZ+shVr7GKVnu9JIrbTmImk8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795014245; v=1; x=1795619045;
 b=SS02ieOm8mSQdZMt8RfMzTwzPVp4tvbhfgGwPXrJkqiJLrnambkdgGaltn1zYpC2oDaZuE/l
 GMt19qiaiHln5apXEU+n4D8pM2WJ4HGSIDcs056wKodAg1ETMuJMGxhF1BEKXWA+iQFh760zj8i
 uobwQdeyeNh1lcdGLMnGu5g4=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id bb9e3daad670b11f;
	Wed, 18 Nov 2026 15:04:05 +0000
X-Mizu-Trace-ID: bb9e3daad670b11f
X-Migadu-Flow: FLOW_OUT
Message-ID: <45cca73c-9846-42a8-a505-65b90a7cd3c0@linux.dev>
Date: Wed, 18 Nov 2026 23:03:48 +0800
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
Subject: Re: [PATCH v2 2/7] mm/page_ext: fix client data alignment
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 sashiko-reviews@lists.linux.dev, Sashiko <sashiko-bot@kernel.org>,
 Muchun Song <songmuchun@bytedance.com>,
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>, Chris Down <chris@chrisdown.name>,
 David Hildenbrand <david@kernel.org>, "Liam R . Howlett"
 <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 Joerg Roedel <joerg.roedel@amd.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>,
 Ketan <ketan.kishore@oss.qualcomm.com>, Mostafa Saleh <smostafa@google.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, kasan-dev@googlegroups.com, linux-mm@kvack.org
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-3-songmuchun@bytedance.com>
 <sashiko-outbox-219498@kernel.org>
 <20261117114635.37d4c1f7f1b38cc4ce7fb886@linux-foundation.org>
 <F4EDF1D2-D02C-4339-AA30-422D576B735A@linux.dev>
 <20261117202136.9eb67013389f3bdefe9b3a15@linux-foundation.org>
 <11DE08A1-5F83-4BE2-B8C0-B426441A957A@linux.dev>
 <av2q4RAESvKh0chV@kernel.org>
Content-Language: en-US
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <av2q4RAESvKh0chV@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/11/18 21:40, Mike Rapoport wrote:
> On Wed, Nov 18, 2026 at 01:39:04PM +0800, Muchun Song wrote:
>>
>>> On Nov 18, 2026, at 12:21, Andrew Morton <akpm@linux-foundation.org> wrote:
>>>
>>> On Wed, 18 Nov 2026 11:49:58 +0800 Muchun Song <muchun.song@linux.dev> wrote:
>>>
>>>>
>>>>>>> +}
>>>>>> [blah blah]
>>>>>>
>>>>> Yeah, but the whole expression is quite reader-hostile, as min/max
>>>>> things often are.
>>>>>
>>>>> How about doing
>>>>>
>>>>> /* comment */
>>>>> if (this1)
>>>>> return that1;
>>>>> /* comment */
>>>>> if (this2)
>>>>> return that2;
>>>>> /* comment */
>>>>> if (this3)
>>>>> return that3;
>>>>>
>>>>> ?
>>>>>
>>>>> The code generation will probably be just as good and it's __init-time
>>>>> stuff anyway.
>>>> Something like?
>>>>
>>>> static inline size_t page_ext_data_alignment(size_t size)
>>>> {
>>>>         /* No client data means no alignment requirement. */
>>>>         if (!size)
>>>>                 return 1;
>>>>
>>>>         /* u64 has the strictest alignment required by page_ext clients. */
>>>>         if (IS_ALIGNED(size, __alignof__(u64)))
>>>>                 return __alignof__(u64);
> Maybe add a const local for __alignof__(u64)?
> No strong feelings about it.

Maybe better. I can give it a try.

>
>>>>         /*
>>>>          * A type's size is a multiple of its natural alignment, so its
>>>>          * lowest set bit is at least that alignment.
>>>>          */
>>>>         return 1UL << __ffs(size);
>>>> }
>>> Well I prefer it!
>>>
>>> The final bit-twiddle could be (size & ~size) but I'm not sure that's
>>> any clearer.
>>>
>>> We should have a handy helper for this operation but I can't find one.
>>> max_pow_of_two_factor() is close, but only works on uint.
>> How about changing the helper to
>>
>> #define max_pow_of_two_factor(n) ({					\
>> 	typeof(n) __n = (n);						\
>> 	static_assert(__same_type(__n, 0U) || __same_type(__n, 0UL));	\
>> 	__n & -__n;							\
>> })
>>
>> ?
>>

