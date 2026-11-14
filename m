Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.120
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794657662;
	b=v79dPlIYjl0//Jc2XItHAGrrm9ufRUZ/ht/3jpGp8OZcmdeVn+bBt7aT144mhXYZgzHw
	 B3757OGvmlnBp4PCgVYIXle071IpCfGCC7sGh8WvqEQtrpnfI20PHUIP3XzDzQKnUfImY
	 kSsUcrkAYjRyZl78V1WKsyMo96LnWCesTxstod0JrVZJMq/jQwo3rimsx9dVcIoRk2kQc
	 dPVkEfV808Gx8Km4DLmvxjj9TzdCaWvaMuQz960VcZsN3p1p+D384sH1ozdmGhGMaMcbV
	 pHDgK8XaSFwUiFIanmzqyafBq57II+XhBIUVFMDheI3cNHY7/E3mJ0lzOrrHwXdzRPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657662;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3qRX1hZTN3l+y9T7UnJRx7nT93qwKXwKZCXKTmcyfYw=;
	b=LSkpCpp3mJfoZRm76ibnC5+KlV5EHSvnhRadBcyzYMHw+Io7OhryrMV9SvyZvED39gSO
	 4RIAzQLztNUT93cEdKOqW8FJ92S+OxVmdAtVJLCGEG2gakZrI47jCxkRCeWj4X1oVmOgl
	 ZKu/cY1HjuCgmiUePdxjGndOKPEFvtETQyv/sBN+96ovRlIFG+5/y7tZVwTxkKTPUwTPU
	 c5928D9ynqgvypHZ1xViTGNj6WssQeAhQfRteZE12sYZGCyQBJVnh225zJerq68YB0Fn2
	 r3v9KmdFHTrbct3JSfBj79oQRc6tgcM6w4kSJetxhO/lkewNBguBp1T2HMH28bcucFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DFI0Sxq1;
	arc=none smtp.remote-ip=91.218.175.120
Received: from mta0.migadu.com (out-120.mta0.migadu.com [91.218.175.120])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEDC606A327
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 12:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BEDC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DFI0Sxq1
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=znGengzfkTmsbCD3pN+1WJApk/K5eHctH9NBb8nBLZM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794657658; v=1; x=1795262458;
 b=DFI0Sxq16xlO7pcxcw+bM8Cq2fT2yh/hNHP3l92us6I+VRAaJY180LalNHHgEkZShBDPL+RD
 SpjSeCcCkHrsYYkmntIvSFGXiQWSBf5JJL/LQTEAOh4CQGsnEu+kOcUBbabFmYC0W9Ijqydnjff
 m+pA4SVEegTc/2dGiobSxX+Y=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 02e42df67e8354df;
	Sat, 14 Nov 2026 12:00:58 +0000
X-Mizu-Trace-ID: 02e42df67e8354df
X-Migadu-Flow: FLOW_OUT
Message-ID: <acc2eaeb-382a-488e-8739-fb0f5e0b75bd@linux.dev>
Date: Sat, 14 Nov 2026 20:00:51 +0800
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
Subject: Re: [PATCH v5 11/12] cpuset: introduce local_partition_update()
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com,
 Waiman Long <longman@redhat.com>, Guopeng Zhang <guopeng.zhang@linux.dev>
References: <20261114083124.1340140-1-ridong.chen@linux.dev>
 <20261114083124.1340140-12-ridong.chen@linux.dev>
 <sashiko-outbox-214330@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <sashiko-outbox-214330@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/14/2026 5:36 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issues to consider:
> - [High] cpuset: hotplug partition update in
>    cpuset_hotplug_update_tasks() corrupts subpartitions_cpus

This is a pre-existing issue. It can be reproduced on the baseline
without this series when the invalid partition has cpuset.cpus.exclusive
set, as the hotplug code revives an invalid partition with a non-empty
effective_xcpus even if all its CPUs are offline. This patch makes it
easier to hit, as local_partition_update() is also called for an invalid
partition without cpuset.cpus.exclusive.

I will send a separate fix to cgroup/for-7.4-fixes, which only revives
an invalid partition in hotplug if its effective_xcpus has an active
CPU, and do the same check here in v6.

> - [Medium] cpuset: stale effective_xcpus on child cpusets after hotplug
>    invalidation in __local_partition_update()

This is a pre-existing issue, as the child partition is invalidated in
place by compute_partition_effective_cpumask() without resetting its
partition data, which is not changed by this series. It will be fixed in
the follow-up series, where the child is no longer invalidated in place
but by local_partition_update() through partition_disable() when it is
visited.

> - [Medium] cpuset: __local_partition_update() passes non-empty delmask
>    for invalid partitions

Right. An invalid partition doesn't own any CPU, so tmp->delmask should
be cleared for it before validate_local_partition(), the same as what
partition_cpus_change() does. Will fix it in v6.

> - [Low] cpuset: missing update_partition_sd_lb() on partition
>    invalidation in __local_partition_update()

update_partition_sd_lb() will be called after partition_disable() as
well, the same as for the re-enable case. Will fix it in v6.

> - [Low] cpuset: premature effective_cpus copy in update_cpumasks_hier()
> --

Agreed. The first copy isn't needed, as local_partition_update() doesn't
read cp->effective_cpus and tmp->new_cpus is recomputed afterwards. It
will be dropped in v6.

I will wait for more comments and address all of these in v6.

-- 
Best regards
Ridong

