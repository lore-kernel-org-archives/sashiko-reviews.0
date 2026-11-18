Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981465;
	b=nm6BmZsX6P8Ms79iZHnHqohvD/F96xwLYSOD2vO9hRhc4ty6jdCh5YIwFxMG0auXR0yE
	 ywI+OYdk/fpYZ2LLpQdwGPegmOXztvwZspV+OCUog4VeO6zOMPCXEiu2zRTlcP7y7fj3g
	 +pzFat0n/1lCGszbT/ZN9i7iB7cy+73nXL4TuxPNL03Gei4VTYW+KhSXc0kvjAQfzbWvJ
	 fsK6+rmlzEpgxjswbqxYewHGO3gGfKb1MFJTnfcK9UpDtxqHnJpPYNtcvFbnR6LGbM22y
	 MzZOHR+57il/EXXux6Ml2LNc+6Gm0olSodfrGFCebyiYp6onkXdyPSwFTY6kVWCdMmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981465;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=3yfKxLMhshtB+2F037xrAWVe+vfR0qbY5pPO7nGzJOw=;
	b=S2Q9xM6mXl3cEh2GrabvtsZIZJqYmML/ocHMmg+eitiaBcjULoV+qU7W18mepJTyo5dw
	 +IW47VX5LbGSVjmX8XyKTGdQRcDdgEcspy3OMEgqtqz0Wc0wPQjaZSkKg0D/UMQIFnQ4u
	 m4o2MaUYyv8okAo/skVQluR765gniu4sLsYmXgaxydjDsoclbKBDd5RY7cbBUCU+kwKvs
	 bzCm3NLF3loerzfF3dS8UNgXOkCFpGjGTEI/n7BR/0aDd7gestnCe7NPDdcrTuF5iujp0
	 L9NlHarVNjBSJpylwyTSvzGZiCByUVpqPvza5GFw/OQV4/XIZBMQ1PSBfXs0y601BSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iKjr+C7C;
	arc=none smtp.remote-ip=91.218.175.148
Received: from mta0.migadu.com (out-148.mta0.migadu.com [91.218.175.148])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55991606A32A
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 05:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55991606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iKjr+C7C
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=CngAOLNog5Y81sTkiyw8e14TFkRjTahcSus0NtRjDsw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794981462; v=1; x=1795586262;
 b=iKjr+C7C7MWxyvw7hph2+mQoCrtgkToPKm5PmEsUGzXaKVUTD3w+LKhaFJdVBXsqzv+Gsdiw
 /RVl2gpqY4Hh+X+VEADljcxXK4s2Rn1HvGW9tc14j92lD5zjxkEPNg+LMaSLj8D7+TOPjJv6tY9
 ReczpWTgCTA4av6UJ7R6Zx+w=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id 9c6dfb37f04a2a11;
	Wed, 18 Nov 2026 05:57:42 +0000
X-Mizu-Trace-ID: 9c6dfb37f04a2a11
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
In-Reply-To: <20261117215129.d7bcc7bfa060daf99828f0c0@linux-foundation.org>
Date: Wed, 18 Nov 2026 13:57:19 +0800
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
Message-Id: <1DAA3861-ACC2-4D76-AADF-13F454E8E49A@linux.dev>
References: <20261117120627.50601-1-songmuchun@bytedance.com>
 <20261117120627.50601-3-songmuchun@bytedance.com>
 <sashiko-outbox-219498@kernel.org>
 <20261117114635.37d4c1f7f1b38cc4ce7fb886@linux-foundation.org>
 <F4EDF1D2-D02C-4339-AA30-422D576B735A@linux.dev>
 <20261117202136.9eb67013389f3bdefe9b3a15@linux-foundation.org>
 <11DE08A1-5F83-4BE2-B8C0-B426441A957A@linux.dev>
 <20261117215129.d7bcc7bfa060daf99828f0c0@linux-foundation.org>
To: Andrew Morton <akpm@linux-foundation.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 18, 2026, at 13:51, Andrew Morton <akpm@linux-foundation.org> =
wrote:
>=20
> On Wed, 18 Nov 2026 13:39:04 +0800 Muchun Song <muchun.song@linux.dev> =
wrote:
>=20
>>=20
>>>>=20
>>>> Something like?
>>>>=20
>>>> static inline size_t page_ext_data_alignment(size_t size)
>>>> {
>>>>       /* No client data means no alignment requirement. */
>>>>       if (!size)
>>>>               return 1;
>>>>=20
>>>>       /* u64 has the strictest alignment required by page_ext =
clients. */
>>>>       if (IS_ALIGNED(size, __alignof__(u64)))
>>>>               return __alignof__(u64);
>>>>=20
>>>>       /*
>>>>        * A type's size is a multiple of its natural alignment, so =
its
>>>>        * lowest set bit is at least that alignment.
>>>>        */
>>>>       return 1UL << __ffs(size);
>>>> }
>>>=20
>>> Well I prefer it!
>>>=20
>>> The final bit-twiddle could be (size & ~size) but I'm not sure =
that's
>>> any clearer.
>=20
> err, (size & -size).
>=20
>>> We should have a handy helper for this operation but I can't find =
one.=20
>>> max_pow_of_two_factor() is close, but only works on uint.
>>=20
>> How about changing the helper to
>>=20
>> #define max_pow_of_two_factor(n) ({ 					=
\
>> 	typeof(n) __n =3D (n); 						=
\
>> 	static_assert(__same_type(__n, 0U) || __same_type(__n, 0UL)); 	=
\
>> 	__n & -__n; 							=
\
>> })
>>=20
>=20
> Switching max_pow_of_two_factor() to take a ulong should be OK - the
> thing only has two callers.  But oh, that name!
>=20
> But do we really want to go there?  The drama with min/max/min_t/max_t
> and especially clamp has been endless.
>=20
> Your open-coded bit-twiddle looks great ;)

OK. I'll use size & -size directly. I think the adding comment could =
make it clear.




