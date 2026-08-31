Received: from mta0.migadu.com (out-70.mta0.migadu.com [91.218.175.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F55239CD0E
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 10:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788173493; cv=none; b=NE6RIpDLe8hpZP8/OMPPD9Mlhdat9im18GqSaMH4xmC+8ozSphH7TLvDvIiU4TVXIKi2gOqiuuMDdl8m4L1f+T25oaRmvomALXHkNjBaqXH4lu4T+5n8BDDNPK/NZSxmyqFbMr6B8/s9fEJVEizdJymmIO65K3L6rnTum4XSWp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788173493; c=relaxed/simple;
	bh=eGXx/VpQkOfbNT/AftaKzxylaXK4DHz7qELHneEin80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=snFrtmsq1pEdh+irMbs4K/sdCpVaaG9ktiCiw4PhYrYVgeCVXb+f9LGDEy7fvH3oWLau7rj94wWA4plMHErh6rFst4qV3M6YfqGxc9e12lybrycWTlfA4A6uZsofJe/U8LYfjGXcdVkQKy2V62byyYwORuyrrK7vPEjIeeazKV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oJJE8jpa; arc=none smtp.client-ip=91.218.175.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oJJE8jpa"
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=eGXx/VpQkOfbNT/AftaKzxylaXK4DHz7qELHneEin80=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788173489; v=1; x=1788778289;
 b=oJJE8jpaABZuqICprjHQsQALALn/PmNoHM7LbLvGHHrNGQRoRf/mTkv29xYNGOZb6+7FbKzK
 4AEEMCp+4dTLKoAcyLe/TKnPgupgbUXPgBUJXsR6MaFLuGOSmUQTLrMNT68h+77rHSjzt7M0e5r
 WQqJiTzq2Kf/6wBYoV32ogPI=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id e2758a4cc40f684e;
	Mon, 31 Aug 2026 10:51:29 +0000
X-Mizu-Trace-ID: e2758a4cc40f684e
X-Migadu-Flow: FLOW_OUT
Message-ID: <ecfaca00-f14a-4511-bbe8-c8fb71c21f24@linux.dev>
Date: Mon, 31 Aug 2026 18:51:19 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] cgroup/cpuset: Respect child CPU ownership in type
 changes
To: sashiko-reviews@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, hannes@cmpxchg.org
References: <20260828095643.13395-1-guopeng.zhang@linux.dev>
 <20260828095643.13395-2-guopeng.zhang@linux.dev>
 <20260828101035.8BCDF1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Guopeng Zhang <guopeng.zhang@linux.dev>
In-Reply-To: <20260828101035.8BCDF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/8/28 18:10, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] compute_partition_owned_cpumask blindly subtracts child CPUs during trial mask validation, allowing root partitions to bypass housekeeping checks and illegally claim boot-isolated CPUs if a child is subsequently invalidated.
> --
> 
> commit 45691f521ea33837a28cae4d3ac3d74477a096ee
> Author: Guopeng Zhang <zhangguopeng@kylinos.cn>
> 
> cgroup/cpuset: Respect child CPU ownership in type changes
> 
> This commit modifies the cpuset subsystem to calculate the directly owned
> CPUs of a partition by excluding CPUs granted to valid child partitions.
> It applies this logic during type-change isolation accounting, housekeeping
> checks, and trial validation to prevent valid children from improperly
> invalidating their parent.
> 
> Link: https://sashiko.dev/#/patchset/20260820124202.517160-1-guopeng.zhang%40linux.dev?part=6
> 
>> diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
>> index 8f24171b6055d..32a37d624c6bd 100644
>> --- a/kernel/cgroup/cpuset.c
>> +++ b/kernel/cgroup/cpuset.c
> [ ... ]
>> @@ -2155,6 +2155,31 @@ static void compute_partition_effective_cpumask(struct cpuset *cs,
>>  	rcu_read_unlock();
>>  }
>>  
>> +/*
>> + * Compute CPUs owned directly by a partition.
>> + *
>> + * effective_xcpus includes CPUs granted to valid child partitions. Exclude
>> + * those CPUs when checking or changing this partition's type.
>> + */
>> +static void compute_partition_owned_cpumask(struct cpuset *cs,
>> +					    const struct cpumask *partition_cpus,
>> +					    struct cpumask *owned_cpus)
>> +{
>> +	struct cgroup_subsys_state *css;
>> +	struct cpuset *child;
>> +
>> +	lockdep_assert_held(&cpuset_mutex);
>> +	cpumask_copy(owned_cpus, partition_cpus);
>> +
>> +	rcu_read_lock();
>> +	cpuset_for_each_child(child, css, cs) {
>> +		if (is_partition_valid(child))
>> +			cpumask_andnot(owned_cpus, owned_cpus,
>> +				       child->effective_xcpus);
>> +	}
>> +	rcu_read_unlock();
>> +}
>> +
> [ ... ]
>> @@ -2401,7 +2426,9 @@ static int parse_cpuset_cpulist(const char *buf, struct cpumask *out_mask)
>>   *
>>   * Return: PRS error code (0 if valid, non-zero error code if invalid)
>>   */
>> -static enum prs_errcode validate_partition(struct cpuset *cs, struct cpuset *trialcs)
>> +static enum prs_errcode validate_partition(struct cpuset *cs,
>> +					   struct cpuset *trialcs,
>> +					   struct cpumask *owned_cpus)
>>  {
>>  	struct cpuset *parent = parent_cs(cs);
>>  
>> @@ -2411,8 +2438,10 @@ static enum prs_errcode validate_partition(struct cpuset *cs, struct cpuset *tri
>>  	if (cpumask_empty(trialcs->effective_xcpus))
>>  		return PERR_INVCPUS;
>>  
>> +	compute_partition_owned_cpumask(cs, trialcs->effective_xcpus,
>> +					owned_cpus);
>>  	if (prstate_housekeeping_conflict(trialcs->partition_root_state,
>> -					  trialcs->effective_xcpus))
>> +					  owned_cpus))
>>  		return PERR_HKEEPING;
> 
> [Severity: High]
> Does this logic allow a root partition to bypass housekeeping checks if a 
> child partition is subsequently invalidated?
> 
> When validate_partition() calls compute_partition_owned_cpumask(), it blindly
> subtracts the CPUs of all currently valid children from the parent's
> owned_cpus.
> 
> If a user shrinks the parent's cpuset.cpus such that it no longer fully
> covers a valid PRS_ISOLATED child, this validation check subtracts the child's
> boot-isolated CPU, passing the prstate_housekeeping_conflict() check here.
> 
> However, the child will later be invalidated with PERR_INVCPUS in 
> update_cpumasks_hier() because its mask is no longer a subset of the parent.
> 
> When this happens, the child's boot-isolated CPU reverts to the parent.
> Because the parent already passed this housekeeping check using the old child
> state, it is never re-evaluated, leaving the root partition owning a
> boot-isolated CPU in violation of kernel invariants.
> 
> Can we verify if the new trial mask will actually invalidate the child
> partition before subtracting its CPUs from the parent's owned_cpus mask?
> 

The underlying issue is valid.

I reproduced it on a 32-CPU system booted with:

  isolcpus=domain,15

The test topology was:

  parent: root partition, cpuset.cpus=13-15
    child: isolated partition, cpuset.cpus=14-15

On this kernel, shrinking the parent's cpuset.cpus to 15 did not
immediately invalidate the child. Instead, the child's
cpuset.cpus.effective was clipped to 15. After subsequently changing
the child's cpuset.cpus to 14, the child became invalid, with the
following final state:

  parent cpuset.cpus.partition:            root
  parent cpuset.cpus.exclusive.effective:  15
  child cpuset.cpus.partition:             isolated invalid
  child cpuset.cpus.exclusive.effective:   empty
  top-level cpuset.cpus.effective:         0-14,16-31
  top-level cpuset.cpus.isolated:          14-15

Therefore, the exact point at which the child becomes invalid differs
from the scenario described in the report, but the underlying CPU
ownership lifetime issue does exist.

I need to go through the related logic in more detail and will fix it
in the next revision.

Thanks,
Guopeng

-- 
Sashiko AI review · https://sashiko.dev/#/patchset/20260828095643.13395-1-guopeng.zhang@linux.dev?part=1
