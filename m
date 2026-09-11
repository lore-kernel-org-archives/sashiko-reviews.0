Received: from mta0.migadu.com (out-197.mta0.migadu.com [91.218.175.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9503033E3
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 01:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789091909; cv=none; b=KP9zT/EPFzVdq9ctUjTA0Iv+oUF2sbFt48dpjKZNBkWsKDqTSEKYYnM9zbfhSUpZHTia46AkqRBiEnFNbsMSVBw1MzTEwJ6+zNJ0GgYdgfFJJTKIY/dvR6920NBMKsEYl0nReZ+GurAHNtzXVCFa0b9TKZ2Y9rfxOLZIrXHwnXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789091909; c=relaxed/simple;
	bh=Su7/he/rLAfnoMYt2HCIPpgklMpzjuXx3YY78IqHwEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwBxKe1AEY43u2KPi3hKzmQ8xwyJ0CrO0pI89w5l6r7xtwP0ymWucJBVDGF8DYTE/kzGcFUIUtk+qJEGBTDDADgAA5EKxZzY2cUJw3LbMJ96HNTDxukRIplrFOz8TRoDGWoA/gRH/8m5DIyDLQ/2weNtiEYXsoArCmAREYf8bxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r9GdKAqz; arc=none smtp.client-ip=91.218.175.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r9GdKAqz"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Su7/he/rLAfnoMYt2HCIPpgklMpzjuXx3YY78IqHwEQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789091903; v=1; x=1789696703;
 b=r9GdKAqzRrFF64eDiYGauUiLrnhvckdhGA+2IkEN3ABilV1LaisSJDzNm+SNB2wgpsRw46Nt
 k7UFX6/FW7vFjQ24ftqcCgmd7zSX72rHWIfKaEkjaC9S2D7tcmbAbmlUaPQ9/XA16HQlUiF+Fjh
 xstIIdWhZJbItxb93f+Mb/8M=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 763b54b3587cf8a0;
	Fri, 11 Sep 2026 01:58:23 +0000
X-Mizu-Trace-ID: 763b54b3587cf8a0
X-Migadu-Flow: FLOW_OUT
Message-ID: <430b860f-13c5-45f4-9fb9-ef5235c5a5a6@linux.dev>
Date: Fri, 11 Sep 2026 09:58:20 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] cgroup/cpuset: Account for child CPU ownership in
 partition changes
To: sashiko-reviews@lists.linux.dev
Cc: tj@kernel.org, mkoutny@suse.com, hannes@cmpxchg.org
References: <20260910094546.5852-1-guopeng.zhang@linux.dev>
 <20260910094546.5852-3-guopeng.zhang@linux.dev>
 <20260910100101.171B11F000FF@smtp.kernel.org>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20260910100101.171B11F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/9/10 18:01, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Shrinking a root partition under an isolated parent permanently leaks CPUs and violates the housekeeping constraint.
> --
> 
> commit 3a1165f79081dc8176afcf8e5f8289444f4e3b63
> Author: Guopeng Zhang <zhangguopeng@kylinos.cn>
> 
> cgroup/cpuset: Account for child CPU ownership in partition changes
>     
> effective_xcpus includes CPUs granted to valid child partitions. A change
> to the parent must not apply its isolation state or housekeeping checks to
> CPUs which remain owned by those children.
> 
> Link: https://sashiko.dev/#/patchset/20260820124202.517160-1-guopeng.zhang%40linux.dev?part=6
> Link: https://sashiko.dev/#/patchset/20260828095643.13395-1-guopeng.zhang@linux.dev?part=1
> Link: https://sashiko.dev/#/patchset/20260902102615.79189-1-guopeng.zhang@linux.dev?part=2
> 
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index cc643715d4802..95e82bd18450d 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> 
> [ ... ]
> 
>> @@ -2951,6 +2997,49 @@ int cpuset_update_flag(cpuset_flagbits_t bit, struct cpuset *cs,
>>  	return err;
>>  }
>>  
>> +/*
>> + * Invalidate the highest isolated partition that contains @cs.
>> + *
>> + * A root partition returning CPUs to an isolated parent can consume the last
>> + * housekeeping CPU. Invalidating the highest isolated ancestor lets the
>> + * subsequent hierarchy update propagate invalidation down the chain and
>> + * return the CPUs to a root partition.
>> + */
>> +static struct cpuset *invalidate_isolated_ancestor(struct cpuset *cs,
>> +						   struct tmpmasks *tmp)
>> +{
>> +	struct cpuset *ancestor = parent_cs(cs);
>> +	struct cpuset *parent;
>> +	int err;
>> +
>> +	lockdep_assert_held(&cpuset_mutex);
>> +	if (WARN_ON_ONCE(!ancestor))
>> +		return NULL;
>> +
>> +	while ((ancestor != &top_cpuset) &&
>> +	       !is_remote_partition(ancestor)) {
>> +		parent = parent_cs(ancestor);
>> +		if (!parent ||
>> +		    parent->partition_root_state != PRS_ISOLATED)
>> +			break;
>> +		ancestor = parent;
>> +	}
>> +
>> +	if (WARN_ON_ONCE(ancestor == &top_cpuset))
>> +		return NULL;
>> +
>> +	WRITE_ONCE(ancestor->prs_err, PERR_HKEEPING);
>> +	if (is_remote_partition(ancestor)) {
>> +		remote_partition_disable(ancestor, tmp);
>> +	} else {
>> +		err = update_parent_effective_cpumask(ancestor,
>> +						      partcmd_invalidate, NULL, tmp);
>> +		WARN_ON_ONCE(err);
> 
> [Severity: High]
> This isn't a regression introduced by this patch, but while evaluating changes
> here, does update_parent_effective_cpumask() still leak CPUs and violate the
> housekeeping constraint when shrinking a root partition under an isolated
> parent?
> 

Yes, this is a known pre-existing issue, as noted by the existing TBD
comment:

/*
 * TBD: Invalidate a currently valid child root partition may
 * still break isolated_cpus_can_update() rule if parent is an
 * isolated partition.
 */

> If shrinking fails the housekeeping check (!isolated_cpus_can_update), the
> partition is marked invalid but fails to recalculate the 'adding' mask to
> return all of its CPUs:
> 
> kernel/cgroup/cpuset.c:update_parent_effective_cpumask() {
>     ...
>     if (is_partition_valid(cs) && (old_prs != parent_prs)) {
>         ...
>         if ((parent_prs == PRS_ISOLATED) &&
>             /* Adding to parent means adding isolated CPUs */
>             !isolated_cpus_can_update(tmp->addmask, tmp->delmask))
>             part_error = PERR_HKEEPING;
>     }
>     ...
>     if (part_error)
>         new_prs = -old_prs;
>     ...
>     if (adding)
>         partition_xcpus_del(old_prs, parent, tmp->addmask);
>     ...
> }
> 
> Because 'adding' is not adjusted to include all of the invalidated partition's
> CPUs, only the originally shrunk portion is processed. This incorrectly
> isolates the shrunk CPUs, violating the housekeeping constraint that triggered
> the error, and permanently leaks the remaining CPUs from the parent's
> effective_cpus.
> 
> Can this be addressed, perhaps by adjusting the 'adding' mask similarly to how
> PERR_NOCPUS is handled?
> 

Adjusting tmp->addmask as for PERR_NOCPUS would avoid leaking the remaining
CPUs, but it is not sufficient. Returning all of them to a still-valid
isolated parent could still consume the last housekeeping CPU. The isolated
ancestor needs to be invalidated as well. I will address this separately.

Thanks,
Guopeng

>> +	}
>> +
>> +	return ancestor;
>> +}
> 

