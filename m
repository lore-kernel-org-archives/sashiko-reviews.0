Received: from mta0.migadu.com (out-235.mta0.migadu.com [91.218.175.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31553491591
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 11:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769055; cv=none; b=T6rdjIvkoyGFgaJ1z3h1Qfjn+IYyyPH6KFHUsGfbsCxGhTUy8cMIj1u7Y4Aj+P0CVm7ajEXZSUQEeAoQ3CrLi6QL9co1GQxAGw4qsiRgUVbj4PgEavws5Dv49wPfv5+2xuew/0Qq1xVS64jmjfrxSGK4zRANXbOHkMOfgO673mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769055; c=relaxed/simple;
	bh=s1d9s2uZpjV4NHv1E/jjK0caCmGFjqY92Yem+RWDv7k=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=O9aZYigFNCksYmadiHrOXols/J+G+vrr9X1Zl9wKgT57MI1qqkur0ad/e0uHHT4ak5pqlF5+m+hVcFxz3qbcM32dIXQf47xIJ7UDJD1IZnCAs2ZttWbRfsjpo0I2Mi84So73JIg3N0Pi6JxSzcY95dLTBKfBanKa8DgmzmZC6IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QdnKI9dp; arc=none smtp.client-ip=91.218.175.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QdnKI9dp"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=s1d9s2uZpjV4NHv1E/jjK0caCmGFjqY92Yem+RWDv7k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790769050; v=1; x=1791373850;
 b=QdnKI9dphw/bwa7DEfwKSuEOmAoWy7vWDzRcyczBBq4fjfSPIbfOfhRF/eaLtLeof9/32MWu
 Ufe5sIeWXNlG/Qps7ScJwSsmyfdrgjk0xeijdUj7cm41KUql8f1iNwY986mioKT7Expzd5zdeK9
 AQ84uEliADE8vhvDiXByObwA=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id f33bd8b0dbe14da9;
	Wed, 30 Sep 2026 11:50:50 +0000
X-Mizu-Trace-ID: f33bd8b0dbe14da9
X-Migadu-Flow: FLOW_OUT
Message-ID: <dbc80af8-f277-4180-bfe3-c7a56c265e8d@linux.dev>
Date: Wed, 30 Sep 2026 19:50:46 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: cui.tao@linux.dev, mkoutny@suse.com, tj@kernel.org, bpf@vger.kernel.org,
 hannes@cmpxchg.org
Subject: Re: [RFC PATCH v8 1/4] blk-iocost: add BPF struct_ops cost model
 support
To: sashiko-reviews@lists.linux.dev
References: <20260930075154.189958-1-cui.tao@linux.dev>
 <20260930075154.189958-2-cui.tao@linux.dev>
 <20260930081123.8CDA91F00893@smtp.kernel.org>
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20260930081123.8CDA91F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

在 2026/9/30 16:11, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] block: Use-After-Free in q_to_ioc() list traversal due to dropped rq_qos_mutex
> --

The findings are confirmed; here is
how each will be addressed in the next revision:

1. Lockless q_to_ioc() in the attach path (sashiko, patch 1).

   Confirmed. After blk_iocost_init() succeeds, the attach path called
   q_to_ioc() with rq_qos_mutex released. Although the returned value was
   not used, q_to_ioc() walks the non-RCU rq_qos list and should not be
   called outside its synchronization. The unnecessary lookup is removed.

2. Missing test__skip() on -EOPNOTSUPP (sashiko, patch 2).

   Confirmed. Both attach paths now call test__skip() before returning so
   skipped tests are reported correctly. The unused line[256]/word[256]
   arrays in write_cost_model() are removed as well.

3. Documentation commit message vs. text (bpf-ci, patch 4).

   Confirmed. The commit message described two behaviors that were not
   stated explicitly in the documentation. The documentation is extended
   to say that detaching restores the builtin model, and that the ctrl
   field accepts only "auto" and "user" and never selects the active
   model.

Thanks,
Tao

