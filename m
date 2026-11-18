Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794980366;
	b=aAx8khAgfqdAZRDgvSftUTw6h0ij3pB9tzlkdcVTYefMfaDQR6afzGk2Mzx7qjL/DJ8J
	 UcDpN/TOULBfNmZNAnRMm5i63zl2b9rtDs0erEovsMt7U0oUZ4f6T73e1BziCKChigN5D
	 o0ev9yf8I8YO91wDIyOQ5Z+lXN6NbqYaPQGt5Hck/vgJJtL3KCPrqfdrPznsNAKm6cw44
	 CDRrefq/T+cOBxGzbgcEs+pcgUcTsDfmDMs/oYEiGwAf/LBag0BD4HQwE2cDKpdVpeVvg
	 YiRW0G6znoZUYrYo+dmSYz0RiPmPGyWQqQTLJv7pJzkx/8WM1uOCG7XSGLjwNd785sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794980366;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=ivtPd5ttNuyhfy98ioQJITuu8jfayeumroo16CmslDc=;
	b=b+CYTCVK+G+VNGxEDpB0XEB0QASve3SH4EBx++liDt5lwH8/LmSHWJJDoSfe1JU52moD
	 68Bn5qiwGYljU/ZRQy0G6grRDUMV76kBku9ratldM73afu04Ebzcm8bGo3JkZUCDhM8GT
	 07gSBu8MvqyKNdp7lUxVvUbO24Db9iprpjlfTTn1JXq7mFO3WVg+O2C8KcEiuoiJtKtzS
	 IG3zg1fi0Y2m5MxhZQuRBY6cKYeqBJO6OUSeLmz+vdnDMYi+PO8u6SoKytMeueQ5sMspD
	 Wel+k8UVsqaagyh2I7hC2Zst8o0eacHgBhNRlC7aDq06RCjnGD7gsypnlBNzC5BgT0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Cua1W+Jv;
	arc=none smtp.remote-ip=95.215.58.227
Received: from mta1.migadu.com (out-227.mta1.migadu.com [95.215.58.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5419C606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5419C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Cua1W+Jv
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=H/f7fxK9dSXTVO4fB0pNECpC88jXcYa6XPqhZn4b2dU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794980363; v=1; x=1795585163;
 b=Cua1W+JvpxUG61rrVgT7xcr6R31Xd9mkZ6xfki7rUjVUofsHwhdLJ93e37hWK7VYxF/tVxGi
 hMCMYtBT7khXZ/+9kWPZ1T7uDdwixYsm35xUyh2J/MKIG0FbdwaNuS7YF/b2dqRtIJmzHpuC/B+
 HxrX2Sbtelk4WwyaxE2ksCYU=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta11.migadu.com with ESMTPS id 6c1682f25ee54883;
	Wed, 18 Nov 2026 05:39:23 +0000
X-Mizu-Trace-ID: 6c1682f25ee54883
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v2 2/7] mm/page_ext: fix client data alignment
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261117202136.9eb67013389f3bdefe9b3a15@linux-foundation.org>
Date: Wed, 18 Nov 2026 13:39:04 +0800
Cc: sashiko-reviews@lists.linux.dev,
 Sashiko <sashiko-bot@kernel.org>,
 Muchun Song <songmuchun@bytedance.com>,
 Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Chris Down <chris@chrisdown.name>,
 David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Brendan Jackman <brendan.jackman@linux.dev>,
 Zi Yan <ziy@nvidia.com>,
 Joerg Roedel <joerg.roedel@amd.com>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>,
 Ketan <ketan.kishore@oss.qualcomm.com>,
 Mostafa Saleh <smostafa@google.com>,
 Sang-Heon Jeon <ekffu200098@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 kasan-dev@googlegroups.com,
 linux-mm@kvack.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <11DE08A1-5F83-4BE2-B8C0-B426441A957A@linux.dev>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-3-songmuchun@bytedance.com>
 <sashiko-outbox-219498@kernel.org>
 <20261117114635.37d4c1f7f1b38cc4ce7fb886@linux-foundation.org>
 <F4EDF1D2-D02C-4339-AA30-422D576B735A@linux.dev>
 <20261117202136.9eb67013389f3bdefe9b3a15@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 18, 2026, at 12:21, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Wed, 18 Nov 2026 11:49:58 +0800 Muchun Song <muchun.song@linux.dev> =
wrote:
>=20
>>=20
>>=20
>>>>> +}
>>>>=20
>>>> [blah blah]
>>>>=20
>>>=20
>>> Yeah, but the whole expression is quite reader-hostile, as min/max
>>> things often are.
>>>=20
>>> How about doing
>>>=20
>>> /* comment */
>>> if (this1)
>>> return that1;
>>> /* comment */
>>> if (this2)
>>> return that2;
>>> /* comment */
>>> if (this3)
>>> return that3;
>>>=20
>>> ?
>>>=20
>>> The code generation will probably be just as good and it's =
__init-time
>>> stuff anyway.
>>=20
>> Something like?
>>=20
>> static inline size_t page_ext_data_alignment(size_t size)
>> {
>>        /* No client data means no alignment requirement. */
>>        if (!size)
>>                return 1;
>>=20
>>        /* u64 has the strictest alignment required by page_ext =
clients. */
>>        if (IS_ALIGNED(size, __alignof__(u64)))
>>                return __alignof__(u64);
>>=20
>>        /*
>>         * A type's size is a multiple of its natural alignment, so =
its
>>         * lowest set bit is at least that alignment.
>>         */
>>        return 1UL << __ffs(size);
>> }
>=20
> Well I prefer it!
>=20
> The final bit-twiddle could be (size & ~size) but I'm not sure that's
> any clearer.
>=20
> We should have a handy helper for this operation but I can't find one.=20=

> max_pow_of_two_factor() is close, but only works on uint.

How about changing the helper to

#define max_pow_of_two_factor(n) ({					=
\
	typeof(n) __n =3D (n);						=
\
	static_assert(__same_type(__n, 0U) || __same_type(__n, 0UL));	=
\
	__n & -__n;							=
\
})

?

