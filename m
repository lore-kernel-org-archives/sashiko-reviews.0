Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794044378;
	b=skXuqaQI9R7fhJqYFMWYza+99YYB6hzLwaEK8isRLecbHtOnLdZrKZDLvdOW1MyEaWUh
	 DRIILSzOPsEpoSIT1NDRKnRS4rE8qlAnW/2sQ/nvO7S85vN0WV48Kw9ZQrlbU7LNvkCqJ
	 xPkuqi7fjZEcOJpnmSR3t3vZCUVUN/cqhbN8IpR4MOFYImpOEyzsPv3J0iYaPQqNY5orB
	 6Zc7aVTDuSMK6NvAweD3WoNjnoXs9Kvv3VtNdx4ytpXvlgM2OblgDX9hYbWZrzd7tZ6rk
	 XxJrtT/KQsqQ3E+hCMNyfOElCo6bPpS4voehfqjSpFxFihoX9oJh3kIs6hTrag4A+sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BhP7zGWAKdDhvoK/dqiwsbUC8TFOQvEskzC0SJWqEq8=;
	b=N25dPzv3Y2LsA455AAGeuUqvvMBL3gYePvFJl0r1UGaf/ZpDxiZQ3qHbp/8zEYjA4sV3
	 NLTF+tQyDgDwzk66I7ZZI9fWpZLxKU+05ixGuLkGdFP7HVFzed9eDf+rGlLrS/Z9L5Xzd
	 25zf5MeNqP7M9Vup6FCcu2Z1eVEzf9l+k0W4VqbfYZ0EoyQPgl7/i25I2EDUXcKYq3ZWo
	 Alod9+FdrKgOz9MYDQx8HdbIp+lbvI7ObLolj/WE4zRUg0cvuGORPM9enHGeE97a2ZY25
	 mKUOa1nM9sYq0ojuB9j2Egiso5jtZYF4h11q8FKScnH8uv99I4xcM/WxzFaXm4vmTow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXnhQThX;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC894606A326
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 09:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC894606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qXnhQThX
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so579775a12.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 01:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794044377; x=1794649177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BhP7zGWAKdDhvoK/dqiwsbUC8TFOQvEskzC0SJWqEq8=;
        b=qXnhQThXDxEbMOkBjn8wOzcK2ShFwL3dwLM4OTR7bR8vDYG3polDAykeU4Tm/p6tu+
         qWbA/SfPO0JoIj9j8ZXs8WeHDd6eBUxOF8bONi9H6+p65BNOYNyhftWnCT1ASoN1xDWc
         ucBZrG5pXI3qIPDxvYJY1qYpZT94uoBEziqbQeeI0CSZQ5X7cHvtvfCANJLeADEzs9Ms
         HK7tIfuyLb7Bg9zikhHA8kUHkJBu1b0+XP2alocajjopKE/LsE5Rt+WSm9z2jT/iRkDz
         oDs7j7lLzV4qY3dKMrIYAjPAC4c+r9PEDU/UfBvLqMuaomY+8m6tYT7L7jjnNnfAA7G7
         EOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794044377; x=1794649177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BhP7zGWAKdDhvoK/dqiwsbUC8TFOQvEskzC0SJWqEq8=;
        b=ya3g8JkrD1Ey7GQTdQd93AXdPDV7AEnK5xkfbehgXQ/30vlCT8mEby4OCLt9/2OEX1
         t4TDLDwtItbd2kJuUqY1D62AY4I0PwFvx0cZhbLFza6TKAob19stHos8tNK4jVWK2Ncc
         i25iWUiidlyGjsp7UScCbNCbfA9EL7/izigv0d9sCfwsBE5hqgOggqW/VyXrLsuqjuIo
         xP0Hn1M2QU4SNd4xV8ZxLRqHW9O7c5taT17VKt+yeCC/za8bZJUgDVE/cZj+W3U05cZB
         LK1FK12TYy3h7wFTxkjVY4y3Ybdeish96vctsFcIS9b8Y/CtXWnWrHZ+MmCp4vW2JMl/
         0+Zw==
X-Gm-Message-State: APuU4Z+ONS3ChPMCHrgM/Wmje73DaCbFnQYrY4QmG4jPN/kMWRSWGYsp
	6tRnVDhl5bqGfppoDEsz6rzExfZOTW4NnolEbo3J0sFeTvR0t8EgMvGHKnQg6g==
X-Gm-Gg: AYBFou2UHjVWcbRKTTHgtMHBMBrLWJ6hrxH/aQ9YRlMp5A2/a5ykJfGNzhNGXV1QRZy
	zxjY9gqVriaSg1mlY26aCtrQdcvg/yy9YrJF4C1WkJFHYSusVrV6xWkQ6KNhJnmlkx/a39JMSQe
	FxEo0JDRfp1LvYTLBjYwD4PSGLrvVw5nR5PHbcYcbMlVwrbpg8diXciF6LNqERlcaxxGf425iV5
	tIb9VPsSPugigCRDMr/S+q3Z1JDRBAmRls+GlhLfoVRr6fSPtZF8gcmZqK7YMtY+6zZ6jhdlu1Z
	h7OL1sI6enpMBfeHG544n6FiL6bPfV5aNqK8LqBt3+0jzCJMhOBrjyoz0WnouvdXZSl4pFuQYQA
	4gU0aTEhhxubwx5ew6J3hggh7QyLV783LMdAu25mMCE2+hXcHFeuSzV8fP2Pry1YkKvsbrPArgV
	zVOo+e9GOqlY/kb1aAsd5Y7QUVx8U4kzMLHeqgZMPLFN1QAza7cqbyJBwheWHv9MGXP4YT4pZGE
	CZd44qu2I6L/9/tal7NBmO97xDorIdWppuU8Ybw3T1jTuaqsC65wbnmlbyTN51Safm+K6FvxKxI
	rPcalo/xCqKRMKLB5ZWh3lXQXR7YhtMKhV2k4f71XoB4D37a3LPl7gkszEPpsIfHLhd3
X-Received: by 2002:a17:90b:3950:b0:3b0:92b2:2e74 with SMTP id 98e67ed59e1d1-3b0db6f6c35mr5119998a91.62.1794044376916;
        Sat, 07 Nov 2026 01:39:36 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057b17f8sm2792987a91.1.2026.11.07.01.39.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 01:39:36 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huaweicloud.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org
Subject: Re: [RFC PATCH v3 03/18] mm/swap: cleanup and document swap device availability flag usage
Date: Sat,  7 Nov 2026 17:38:35 +0800
Message-ID: <20261107093906.36492-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-188132@kernel.org>
References: <cover.1793106426.git.lianux.mm@gmail.com>	<c3a660c13ec9a98af8a496b5f9139e73eab5aa3a.1793106426.git.lianux.mm@gmail.com>	<sashiko-outbox-188132@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 28 Oct 2026 16:14:54 +0000 sashiko-bot@kernel.org wrote:

> Can splitting the clearing of SWP_WRITEOK from del_from_avail_list(si, true)
> cause an infinite loop in alloc_swap_scan_list() and corrupt the cluster
> lists?

Separating these state transitions does open a selection window. I have
not found evidence of list-pointer corruption.

In the next revision, clearing SWP_WRITEOK, setting the off-list bit and
removing the device from the available list will again happen in one
swap_avail_lock critical section, before dropping swap_lock.

At this point in the series, allocators do not take the topology lock.
Moving two separately locked operations under that lock would therefore
not be sufficient.

When SWP_WRITEOK is clear, an order-0 allocation scanning a partially
occupied higher-order fragment cluster with scan_all=true can make no
progress. The cluster lock is released on each iteration, but the cluster
can keep returning to the same list.

An allocator that selected the device before disable can encounter the
same underlying scan problem on the base tree. I have prepared a separate
fix: stop before isolating the next cluster when SWP_WRITEOK is clear,
leaving the current iteration's normal cleanup intact.

I checked the scan helper in an isolated x86-64 KUnit guest. On v3, the
disabled higher-order-fragment case did not complete; the stall stack
included alloc_swap_scan_cluster(), and the host stopped the guest after
45 seconds. On the revised tree, that case and both enabled-scan controls
completed successfully.

This tests the scan path directly, not the concurrent swapoff selection
window through syscalls. The publication boundary is checked separately
in the code and through the intermediate commits.

Thanks for the report. I will include the availability-boundary correction
in the next revision and keep the base scan fix separate.

Lian
