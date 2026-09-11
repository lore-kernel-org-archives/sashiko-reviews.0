Received: from mta0.migadu.com (out-60.mta0.migadu.com [91.218.175.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 365D83E4508
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 02:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.60
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094058; cv=none; b=AWhy9z2C/E/EAT61zvHHOvyfXzPaJ24l7iw0W4bnJb/+6t+9xPje7YoTbxaLNneRcqoqRrjwSkaSi9wX5xQU/I12khq7i9Xg4cxuuwrh2b/aEr6eC9C++D1EPig/NYyDjO4tUGcDa3ym4muMpznrS5I7eO/1XqJSnYKoWaH2r3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094058; c=relaxed/simple;
	bh=bQVC/dxr39L1TyurNV6KfAQz91z/xi/2KrjGLit0ipo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+AzfTHU8idaywtc0a7IeN08krQc2+SkRm3ehIPZndORwmvlMRlIh01VdUXSc0dyhoAVQTTE1ezg219CD3JpAx6J3jPQ2H/tJQi4LfFxcF0D8tyFL0Mrm/s6nn9kSSJ9gZUQt4AUXNG4j3xGWfaFB3kRoDOAtDhtxZINJwdj1XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qGR3folb; arc=none smtp.client-ip=91.218.175.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qGR3folb"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=bQVC/dxr39L1TyurNV6KfAQz91z/xi/2KrjGLit0ipo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789094052; v=1; x=1789698852;
 b=qGR3folbSkuXwker3bErcdEXTSn63ZRudyp7q/6juI7HwVhYIFx3AmiQD4QtvkiVTs0B1MAO
 QHNdv18xCKiJtn8GWXdTSTtbsQ5dJPPApyEhxuiP+WUt0s60w+nz5PRKUWDoWAaaJPN5Y56Ts1t
 6U0aCyEFj3QR8pXOEvL+10No=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 4741dbb634418cca;
	Fri, 11 Sep 2026 02:34:12 +0000
X-Mizu-Trace-ID: 4741dbb634418cca
X-Migadu-Flow: FLOW_OUT
Message-ID: <cb485c57-ca44-4657-a97c-d003e60ce222@linux.dev>
Date: Fri, 11 Sep 2026 10:34:04 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] cgroup/cpuset: Fix isolation accounting on
 propagated invalidation
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com
References: <20260910094546.5852-1-guopeng.zhang@linux.dev>
 <20260910094546.5852-6-guopeng.zhang@linux.dev>
 <20260910100131.DED241F00893@smtp.kernel.org>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20260910100131.DED241F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/10 18:01, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but a pre-existing logical flaw in update_cpumasks_hier() prevents a child partition from being invalidated when its parent becomes invalid, provided the child's computed mask becomes empty. This leaves a valid partition with an invalid parent and bypasses the new isolation accounting fix introduced in this patch.
> --
> 
> commit 29bf1f183d4a958f4b19a0031b32733cfb1e93a5
> Author: Guopeng Zhang <zhangguopeng@kylinos.cn>
> 
> cgroup/cpuset: Fix isolation accounting on propagated invalidation
> 
> update_cpumasks_hier() invalidates a local partition when its parent
> becomes a member or an invalid partition. This patch fixes an issue where
> isolated_cpus still reflects the old partition type by updating
> isolated_cpus before resetting a local partition whose state changes from
> valid to invalid below an invalid parent.
> 
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 4004a3e580df1..df91cb3777667 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>> @@ -2379,7 +2382,18 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
>>  			new_prs = cp->partition_root_state;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but a pre-existing logical flaw in
> update_cpumasks_hier() prevents a child partition from being invalidated when
> its parent becomes invalid, provided the child's computed mask becomes empty.
> 
> When a valid child partition's mask becomes empty, the code sets
> update_parent = true and calculates new_prs to a negative value:
> 
> 	if (is_partition_valid(cp))
> 		new_prs = -cp->partition_root_state;
> 
> However, because update_parent is true, it calls
> update_parent_effective_cpumask(), which has an early return when the parent
> is invalid:
> 
> 	if (!is_partition_valid(parent)) {
> 		return is_partition_invalid(parent)
> 		       ? PERR_INVPARENT : PERR_NOTPART;
> 	}
> 
> Because of this early return, cp->partition_root_state is never updated to a
> negative value. Consequently, when new_prs is captured here, it overwrites
> the correctly calculated negative new_prs with the old positive state.
> 
> Does this bypass the new isolation accounting check below (new_prs < 0),
> leaving the local partition valid with an invalid parent and leaking isolated
> CPU state?
> 

Yes, this analysis is correct. I have reproduced the issue. I will address
this relatively narrow edge case once the review of the full series is
complete.

Thanks,
Guopeng

>>  		}
>>  
>> +		/*
>> +		 * With no valid parent partition left, this partition's CPUs
>> +		 * return to the nearest valid partition ancestor.
>> +		 */
>> +		if (!was_remote && old_prs > 0 && new_prs < 0 &&
>> +		    !is_partition_valid(parent))
>> +			owner_prs = partition_owner(cp)->partition_root_state;
>> +
>>  		spin_lock_irq(&callback_lock);
>> +		if (old_prs != owner_prs)
>> +			isolated_cpus_update(old_prs, owner_prs,
>> +					     cp->effective_xcpus);
>>  		cpumask_copy(cp->effective_cpus, tmp->new_cpus);
>>  		cp->partition_root_state = new_prs;
>>  		/*
> 

