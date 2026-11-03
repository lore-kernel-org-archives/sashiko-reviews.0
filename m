Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793702846;
	b=zBhoGpUegj5adYXqIIOEs/RUEz1HJLDL39vlxNDVDHZxTcRoStwyNkQq5lUJFq8QNLRj
	 orvrHdOm1YBbsgwGWBCxQfReXZpSNsPYrEynKJB1bDLAExrchN01K4uaMNHsQSA4qz9Ri
	 xGuG4JSqHCdT/DzoyKGbAxZnttQB3BVjWeXadHz/AmRlYA1cxB6g6R8waxBIEMsozF1KH
	 Rt91rkWjouLgO7J6z8lsWFl9jXwlc/JJZwqvKqNApJTbPz3utm6r1AIdp1MhK0anK1YfB
	 GoqMFXk7+Ifc9kG4OfJ/btgz2qjg/h83dx+LbGK5kbb5jlVmo0WCDQowQcVONtb+8vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702846;
	h=DMARC-Filter:DKIM-Signature:Cc:User-Agent:Content-Transfer-Encoding:
	 References:Mime-Version:Content-Type:In-Reply-To:X-Original-From:From:
	 Message-Id:To:Subject:Date:X-Lms-Return-Path;
	bh=4nQFqetGIINz3bS3DjkIqIu/AbSp7Br0OBHcXNCcZzg=;
	b=wE2pyc5sLDk6NGF4xXAX5n6SCx89ga7QIBL1nrzlgloWmoPPYmAcutG1G8+Dy+J4ELNg
	 rTlPMCSVvtNiAIz50mi1eT/psHwPc3FMo+k+VSK0ueJRjLecrMljUuvBqZmQ3cXO54YfZ
	 JR8oPpKuf0JYHU5HUqAFM1g7CUTH42XjgJKkpu6n1aecbw/Lk4lch0WOQyZ7bdCAMQmSG
	 PVurCps6sos+cBZCka/TWrGtTl87qaoAkRhVgACTlJZFORGbDuDeSZdOXWV50cIXM3Ac0
	 nArELrGKF3tKS9QAotmnWtK0aNkRs08U6zyEuYI5hzUpFID/5d1LO/r59x4epV9FCUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ThXAPP9p;
	arc=none smtp.remote-ip=209.127.231.114
Received: from va-2-114.ptr.blmpb.com (va-2-114.ptr.blmpb.com [209.127.231.114])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5AE6072CBF
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 10:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E5AE6072CBF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=ThXAPP9p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1793702840; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=4nQFqetGIINz3bS3DjkIqIu/AbSp7Br0OBHcXNCcZzg=;
 b=ThXAPP9pIWIwUQGkgwvt48WcNWzT+o68PfSdlQwYd0bTMTlXkvScGPBVDDQhK56LfNGCYf
 TVXy9oXDIIGS/5VLBCEUcB9nhZiYYeEeetGiowAekQ/oxgM/XbAGFPHPdrrs4y+UH64xnZ
 DfH5OsGnG91wudPLyulYN6HdmQ6XlPilzAqkeySjxDA10n5GFSrCuGlO849IMmruKwyjRY
 CkMy3K1Y4ibPyEx3wx3N23byO4Z/69BfS1rz3/6ja3mDl+vx5eYDCXHAwFzjv15l7iu+St
 jB/gutUBM9kUQCSpqtFwNm3HC/eLLRtCjEmkBeJ4qfIIe8TAav78buE8J7MwmA==
Cc: <linux-perf-users@vger.kernel.org>
User-Agent: Mozilla Thunderbird
Content-Transfer-Encoding: 7bit
References: <20261103093709.81605-1-zhaogongyi@bytedance.com> <sashiko-outbox-194990@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <sashiko-outbox-194990@kernel.org>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Message-Id: <c09a3399-15a2-4931-a858-b4e52c22367b@bytedance.com>
To: <sashiko-reviews@lists.linux.dev>
Subject: Re: [PATCH] perf/riscv: Guard PMU counter indices and user access
Date: Tue, 3 Nov 2026 18:47:06 +0800
X-Lms-Return-Path: <lba+26ae9bbb6+270d30+lists.linux.dev+zhaogongyi@bytedance.com>

Hi,

Thanks for the review.

On 11/3/26 5:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] perf/riscv: zero counter count in pmu_sbi_get_ctrinfo() derefs ZERO_SIZE_PTR
> --
> 
> commit 8efed03034c08f98dfc2b34e375ed58087ac3e08
> Author: Zhao Gongyi <zhaogongyi@bytedance.com>
> 
> perf/riscv: Guard PMU counter indices and user access
> 
> This commit adds bounds validation on PMU counter indices before accessing
> counter state or CSR mappings, preventing out-of-bounds accesses when a
> disabled event is mmaped before hw.idx is assigned or when SBI returns
> invalid counter values.
> 

The zero-counter issue predates this patch, since the existing code
also accepts a zero return value and allocates a zero-sized
pmu_ctr_list. However, the reported failure path is valid and is
directly related to the SBI result validation added here.

I will reject zero counter counts in both pmu_sbi_find_num_ctrs() and
pmu_sbi_get_ctrinfo() in v2.

Thanks,
Gongyi
