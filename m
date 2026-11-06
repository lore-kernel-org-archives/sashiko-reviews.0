Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962690;
	b=3K2hIXujJR4QOo7tb+4lEZ22n+b8tE+v3nZFyFPVGunnw5UUt8Q1tNkRbA480osmkuZl
	 CSSH81F6Y17eY7Jhl642/yceK3ZfD6RoZ6dIGLfY/IOCd8n6vtHv9GsrmByAwKLqCG/iN
	 HIdCUE49aruGINIo48kEE+DGlqt3tud5h+9WEh8B//p+72u7L5KkAx+c4LIfPlm3K9CHz
	 dIJ8YKY8j1YxITCTj9tytcXSLOSnTg2vGwxOt7PevViBWw7IjPvsHLKpFy95MYMsAPct6
	 edTcvZcEx9klz9gdTen4b7ideXG2eNHYNeY8y9TToqeFtHd2cHUrFEA/3H6e8m30MXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962690;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=oGtf7cq0UsrLa45GfwcvanoPtiYiVk3j/nnH/0LJUZA=;
	b=bgEx6t+tlUDsJNOuIGWqsG15hc2YO5M3V8xYZYn6dkHgPEe5WvmXD2Cvtu5v+XWMq8d/
	 6o9+o77ICluwFWhasOVaR1qdzOKHCsDST//vJQrSd9tEVOUwUSqOKvmvcCIdnOruyl7BV
	 pyNxaCr4Vsdr4zQmzAci72xbu2ijgUJJRVtqp1Uaip6J4O2UWnm+GoqGqKhDZ11EENrAq
	 k/AfL3xKHjPHDMSpO5MOFVEGI5jG8W2xcbBJhKdsREVvm1rHM2ZpIRBGlGuuaPpxWFx0X
	 6bDhZhoklRnGTiNrr14bHsm/6lstkRASJU4A4qadTaQiSvNeiKuWVUl6HE1fc2lbEKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vMJSlwHe;
	arc=none smtp.remote-ip=91.218.175.76
Received: from mta0.migadu.com (out-76.mta0.migadu.com [91.218.175.76])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7C9606A326
	for <sashiko-reviews@lists.linux.dev>; Fri,  6 Nov 2026 10:58:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A7C9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=vMJSlwHe
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=6MzGxrzKP6Sm9XpU83WwK1iw4N4wI/tZmCguNNhd7s4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793962688; v=1; x=1794567488;
 b=vMJSlwHemzJPnKmoPGJ3w0VZKtCyFRaWrNQTgSqsk1VnJycog/9l3dHZuonxmorICe0dhVb4
 id0RjOBAd8GZGAaYef5w39Yjvn5GqwxazbRJH8Sh3qS1YIsBhPHVa9K5PQIQy2NxYEpacYinqJK
 GM8/NXDgbcLw0MAN4ayWASao=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 3f746f7da2084609;
	Fri, 06 Nov 2026 10:58:08 +0000
X-Mizu-Trace-ID: 3f746f7da2084609
X-Migadu-Flow: FLOW_OUT
Message-ID: <b1a83b07-9ad4-4b61-851e-4922f9a27573@linux.dev>
Date: Fri, 6 Nov 2026 18:58:04 +0800
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
Subject: Re: [PATCH 1/4] cgroup/cpuset: Reset partition data when an invalid
 partition stays invalid
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
References: <20261105125215.2205892-1-ridong.chen@linux.dev>
 <20261105125215.2205892-2-ridong.chen@linux.dev>
 <sashiko-outbox-199130@kernel.org>
From: Ridong Chen <ridong.chen@linux.dev>
In-Reply-To: <sashiko-outbox-199130@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/5/2026 9:16 PM, sashiko-bot@kernel.org wrote:
> [Severity: High]
> When an invalid partition root stays invalid and reset_partition_data(cs)
> clears cs->effective_xcpus, does force remain stale in update_cpumask() and
> update_exclusive_cpumask()?
> 
> In both functions, force is computed before partition_cpus_change() and
> reset_partition_data() by comparing cs->effective_xcpus against
> trialcs->effective_xcpus:
> 
>      force = !cpumask_equal(cs->effective_xcpus, trialcs->effective_xcpus);
> 
> When cpuset.cpus.exclusive is cleared on an invalid partition root (for
> example, A1 with cpuset.cpus=2-3 and cpuset.cpus.exclusive=2-3 after CPUs
> 2-3 are offlined with tasks present), compute_trialcs_excpus() sees
> !cs_is_member(cs) and computes trialcs->effective_xcpus from
> user_xcpus(trialcs), which falls back to trialcs->cpus_allowed (2-3).
> 
> Because cs->effective_xcpus is also 2-3, force evaluates to false. Then
> reset_partition_data(cs) sees cpumask_empty(cs->exclusive_cpus) and clears
> cs->effective_xcpus:
> 
>      spin_lock_irq(&callback_lock);
>      cpumask_copy(cs->exclusive_cpus, trialcs->exclusive_cpus);
>      cpumask_copy(cs->effective_xcpus, trialcs->effective_xcpus);
>      if (old_prs && !is_partition_valid(cs))
>              reset_partition_data(cs);
>      spin_unlock_irq(&callback_lock);
> 
>      if (is_partition_valid(cs) || force)
>              update_cpumasks_hier(cs, &tmp, force);
> 
> In update_exclusive_cpumask(), both is_partition_valid(cs) and force are
> false, so update_cpumasks_hier() is skipped altogether. Similarly, in
> update_cpumask(), update_cpumasks_hier(cs, &tmp, force) is called with
> force set to false and skips member descendants whose effective_cpus did
> not change.
> 
> If A1 has a child cgroup A2 with cpuset.cpus.exclusive set, wouldn't
> A2->effective_xcpus retain stale exclusive CPUs from A1 even after
> A1->effective_xcpus has been cleared and those CPUs are claimed by a
> sibling?

Thanks.

I have updated the series.

https://lore.kernel.org/cgroups/20261106105538.2915492-2-ridong.chen@linux.dev/T/#u

-- 
Best regards
Ridong

