Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795113176;
	b=TBZQu4mKxZfz2bB2XsfPv0JIgf5lO0lV7RWbKkAxtCTRt+2Ao8OQXUmQhsBGVOVn0nC8
	 uKlqxaIbJ4GSYsSZCZWsO1Zp9kJhD/UKZR+4wO0oKf35DWdlDW7GtVnsoBKhFnD0VhUy7
	 FwzTJbsZGeV7/Dx9VEytIgbYSWIscUndoVeKl1EqcOGWqveofJdG3PCRcscQOpHv6PGT+
	 oDLv0Du5hlfl5djzSN5wfB3g4Azrb2DA1B6V7p9bjzGfvxzFKTxbk6JgMLexe5pn5erZm
	 1Njb4ktBDeXdxz1GDil2RaSTAkAkxymhlZiOmlOaOKirwLn1TL77i31DwTfM0Srvm3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795113176;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=eHUpe68o0Gyuu9bj/dGXGOLZdSYedum7yw58Zv5M3uA=;
	b=NAEgUFNazwN/hS9pbP4mWpsMFYfmkbv3pUTglYrOf0uojyhmCehTH1LOUeL4GmKotxOZ
	 Mi4TAbAynfjzZfvK/xzH8O6fU9rAkbYC7SK2M/LN3mkWxgYQcox2/Ymy/ZGoIRORhbgMG
	 u/m+BPQ7Y5swFiJsmgEyDG2HGuOkwhM3HnezIYQWY0+ni5Q4Ul1U0NAIQ74MO08bsYSa5
	 m9LMqhqJECVA9cKcYA5xzU1MMPx7QojptRm3IhHk7EsWdDNjp+yZ3iSDsC8SjRC1PRmdZ
	 Xg/dup3EuC5C/By0YuEhnlB+JPBPvWhlxfa5POogd57wcG7I8rsM7hww3hVS04g6Rbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M1HivhvE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9918A606A320
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 18:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M1HivhvE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B8B1F000C4;
	Thu, 19 Nov 2026 18:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795113176;
	bh=eHUpe68o0Gyuu9bj/dGXGOLZdSYedum7yw58Zv5M3uA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=M1HivhvEpmZhxvpmc6r4vY/xkVZfSRaCfhSFVKHd/NQDka6qnq0Fp9Kvm+5I3xtSH
	 dbjOov2+k/DqmIL/4QGh/tM9Kbj/yRQqtitg6TO4IgomsOdmXo+1qfYJ7fX41Mtmdk
	 Ru4RaHbHdV8/FDguWGdnmCmot6FKWZS/SqWbYdQ+ZxiQ0niM9MaksfAW9mVYmMFTlx
	 xfiL4oTqokVgXiatdDe4PHjbngJ1xHt3PKYntRv+VX8gi5OYskfFDabFoJ5PvjITkt
	 BWwdwFeLrVLpeJDssQC1Fm+tO5xkvNPOJEYOS67LYR7XWVHzGp1bcnXF9XrMuRa5Vj
	 prGC4UZqIlxFw==
From: Pratyush Yadav <pratyush@kernel.org>
To: sashiko-bot@kernel.org
Cc: "David Matlack" <dmatlack@google.com>,  kexec@lists.infradead.org,
  linux-mm@kvack.org,  sashiko-reviews@lists.linux.dev,  "Alexander Graf"
 <graf@amazon.com>,  "Andrew Morton" <akpm@linux-foundation.org>,  "Baolin
 Wang" <baolin.wang@linux.alibaba.com>,  "Christian Brauner"
 <brauner@kernel.org>,  "David Hildenbrand" <david@kernel.org>,  "Hugh
 Dickins" <hughd@google.com>,  "Jonathan Corbet" <corbet@lwn.net>,  "Liam
 R. Howlett" <liam@infradead.org>,  "Lorenzo Stoakes" <ljs@kernel.org>,
  "Michal Hocko" <mhocko@suse.com>,  "Mike Rapoport" <rppt@kernel.org>,
  "Pasha Tatashin" <pasha.tatashin@soleen.com>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Randy Dunlap" <rdunlap@infradead.org>,
  "Samiullah Khawaja" <skhawaja@google.com>,  "Shuah Khan"
 <skhan@linuxfoundation.org>,  "Suren Baghdasaryan" <surenb@google.com>,
  "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 02/19] liveupdate: Pass user argument to file
 preserve and retrieve
In-Reply-To: <sashiko-outbox-209934@kernel.org> (sashiko-bot@kernel.org's
	message of "Thu, 12 Nov 2026 00:31:05 +0000")
References: <20261111002358.1842967-1-dmatlack@google.com>
	<20261111002358.1842967-3-dmatlack@google.com>
	<sashiko-outbox-209934@kernel.org>
Date: Thu, 19 Nov 2026 18:32:50 +0000
Message-ID: <2vxzqzgg3c4t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Nov 12 2026, sashiko-bot@kernel.org wrote:
[...]
>
>> @@ -995,6 +1052,6 @@ int liveupdate_get_file_incoming(struct liveupdate_session *s, u64 token,
>>  				 struct file **filep)
>>  {
>>  	return luo_retrieve_file(luo_file_set_from_session_locked(s),
>> -				 token, filep);
>> +				 token, 0, filep);
>>  }
>>  EXPORT_SYMBOL_GPL(liveupdate_get_file_incoming);
>
> [Severity: Low]
> Should this pass NULL instead of 0 for the const void __user *arg
> parameter to avoid a Sparse -Wnon-pointer-null warning?

Sashiko has a point.

With this fixed,

Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>

-- 
Regards,
Pratyush Yadav
