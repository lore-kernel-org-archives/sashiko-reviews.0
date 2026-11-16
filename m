Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801550;
	b=qtvyF2QGtVg9qSRi3Ylfc/D8go/1jn6DW5lsn4vrxJF1WNSzkSX1UoxTrV57sTTjNXQP
	 QczxwEMuaT6pboM2HKSDncMoHt1F9D3sBHEnxpCMwi0tIddjEJ5osA9/T6PPjF3DSUyzL
	 /OaChTj/QW4xUzZwbA5HlsagP+s2HD3Ho6kj+EV3h+K98P7RgX64VhXDv1U255ge89G04
	 YAWkhRfYIY+mQhW6gfNu42fpr8GxPS86SDg4E1WfTxUVYV8KWrJbNfqS6YwppCU1N3Sbw
	 M1ElBx5QxhRQ8KLZv+7PKOJd3LHRxRN0E2RGDiXVejg9tNtMNb8I1hKoS0sbzfD9ACw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801550;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-Id:
	 In-Reply-To:References:X-Mailer:Mime-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gQMeTciaSvtzZf1tVwUK4oeeC0M0LiTFBkf8Fh1eAgY=;
	b=S1/Eu5N/RwI/eQdc8wgEc4Ld5IP9gxak0WdXTDiT0UBEmKVoWO+samkYB/LHxUkzOsti
	 8Q0a4ifg0wvTQiP4fWf0jIpRwc5ZOhagJxwstRoVnO5+cfqGvJ2Mo0Jxtp1/IyROI8qG5
	 6L3Pw5hJ3r31u4bS9PERRIJ93LLObLrUpl33iXS8VE3i37I7C+vf+35lDIXvTTVmjKxR0
	 XYL+RZPewXPn8BpATXMmWeKftD79dq3jmpDLUdM22t/9Jzd0HRkvySol6Tdbo/JivHQP4
	 ga7fdIvRGDZcpKb5MtxQJ0e4ILN2t+sz+5oPMXpfTvt9ULUU5JDqgw77FlXks2ei9KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=FiNThKXp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0487606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 03:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=FiNThKXp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FA61F000C4;
	Mon, 16 Nov 2026 03:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1794801550;
	bh=gQMeTciaSvtzZf1tVwUK4oeeC0M0LiTFBkf8Fh1eAgY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=FiNThKXpbOTA7jl7KFxz3LJ0sP0PgD/jW1RF4aayD70XAnPUFJ2QNrDNjB5iFIlo1
	 M9AAsbRaBCEruyahEGesuQhgqCnzuEN8YUeZZ8vwOetkY2anSldYSYdfV9GmKPqw6+
	 ddMzBfhLFcDnQoX8jFdcGsPrx/xbjHz0D3KgUAPI=
Date: Sun, 15 Nov 2026 19:59:09 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: sashiko-reviews@lists.linux.dev
Cc: sashiko-bot@kernel.org, Matthew Wilcox (Oracle) <willy@infradead.org>,
 linux-mm@kvack.org, "Shardul Bankar" <shardul.b@mpiricsoftware.com>, David
 Hildenbrand (ARM) <david@kernel.org>, "Dev Jain" <dev.jain@arm.com>,
 janak@mpiricsoftware.com, "Jinjiang Tu" <tujinjiang@huawei.com>
Subject: Re: [PATCH 1/2] lib: xarray: free unused spare node in
 xas_create_range()
Message-Id: <20261115195909.b91edf975dee06ce566e3437@linux-foundation.org>
In-Reply-To: <sashiko-outbox-216113@kernel.org>
References: <2dfabfd9476542e39c7d5473a6597208.0@linux-foundation.org>
	<2dfabfd9476542e39c7d5473a6597208.1@linux-foundation.org>
	<sashiko-outbox-216113@kernel.org>
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

On Mon, 16 Nov 2026 03:17:13 +0000 sashiko-bot@kernel.org wrote:

> [ nag nag nag ]

bah.

> [Severity: Low]
> Is the Fixes tag pointing to the right commit?

OK, let's make it

	Fixes: 77da9389b9d5 ("mm: Convert collapse_shmem to XArray")

it doesn't have cc:stable anyway, but afaik lib/ is subject to
-stable's blanket "backport everything which has Fixes:" rule.

So I'll also add

	Cc: <stable+noautosel@kernel.org> # not harmful enough to bother

unless people disagree?
