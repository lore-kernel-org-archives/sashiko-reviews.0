Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625804;
	b=fYC0yG5y9oKpc668Ozx51E/QuqXVzfkh5c1mwzodH2WyCwLzCUacTKfcEOIyczQtz5hS
	 pwKKDWrogp0lu+9Oi+NsgTgX7ac9TvUr24QYHy0Hc0IY0t2Sc2YTj5Rv2QNNDb2PScqVz
	 x2s85O4i+3tLN9MZjVQVlx76mGFTWVS7KYyNYZfns6M9k0rFAuZFJSKcyv8lHzLcLaalS
	 8lxsQ4EpgbXtjgSQgICaLB5eAWGt8Hv/VLhb6OXusCY7bzXLquA7BtrQAkFXa5oexWjt6
	 I2iaqqMQ04qkbTypxw0R5oM7NE5oYK1t0WYcnL+UIl8LvCRiOkGPStxGu4KRLdxh2SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625804;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WhYs0ocL7SsRFR/Pu3RA0F+kyhv3Pu7Av6qlVdHTERI=;
	b=oIjro7mNe07JO17q4t4AJJsFSiA+5/uWtQV6a67mgqO0QJugCMN7q0ZArbjbC99CxyvB
	 XnkKk0OIWeX3jpFu4XRjLYiLbVU9c313hUYUhT0Y+3YEkPRRN+jV+MhZUU0oJrUtJeIDC
	 RJOHjvsO+1xVHTAvhiCSYCssXLz5vtsycNqyPczu3mNeVXLi5ldfKl0gmlRgOu13AJgVg
	 c/78rtXnIue5uN1MgMfRWR1S8zefoUAmCb8Hz6HxFOsvLPRA+yi0NQDQyZq3qCH65aRtE
	 aGFBhvB7me+lkv4PdUjWuNgOCTddK88rVnQLaBHHo84qKGNvQnYhwtgVf0fpbZK9SQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=aVqGh8zy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFF2606A327
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 03:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=aVqGh8zy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8CA1F000C4;
	Sat, 14 Nov 2026 03:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794625803;
	bh=WhYs0ocL7SsRFR/Pu3RA0F+kyhv3Pu7Av6qlVdHTERI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aVqGh8zyXQPShEVl3cgh0idkAXLy/GSl0ETBYb+2CpwKQuuN+vVIbvdKDWdfMM5TS
	 OG0GDBFKSqEqrOL9Su40Kg7jXFDeTa3P+zVlcRskhLXEMRAi1Oa8VCcPFP0p+U7kBr
	 ZGnl7M9nWH06YX9BpyIf8OSlHrTpboPcu9/fBxGc=
Date: Fri, 13 Nov 2026 19:10:02 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org, "Hongfu Li" <lihongfu@kylinos.cn>,
 "David Hildenbrand" <david@kernel.org>, "Lorenzo Stoakes" <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka"
 <vbabka@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>, "Michal Hocko" <mhocko@suse.com>,
 "Shuah Khan" <shuah@kernel.org>, hongfu.li@linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH v2] selftests/mm: mlock2-tests: fix fclose(NULL) in
 is_vmflag_set()
Message-Id: <20261113191002.ca262aafeb5789b0df35cf39@linux-foundation.org>
In-Reply-To: <sashiko-outbox-214060@kernel.org>
References: <20261113-for-mlock2-v2-1-f62195fc8394@kylinos.cn>
	<sashiko-outbox-214060@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 02:53:30 +0000 sashiko-bot@kernel.org wrote:

> Since this fixes the fclose(NULL) crash in is_vmflag_set(), should this
> include:
> 
>   Fixes: b3b0d09c7a23 ("selftests: vm: add tests for lock on fault")

Yes.  Added.
