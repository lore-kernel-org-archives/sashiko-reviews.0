Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370311E5714
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 08:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792398662; cv=none; b=iQY3pyFS4Aq5gQXs22hw6MuUe+/u70boHZ0f6AKTthWfSgFrfeU0EaA4IuwkTxWsfS5IhuVSPsKip7ZGoK8IEvEmwjP6jNYBMVWxA/pAgQFSe7yI6xjgaGdA7LAehIenzLWTOqzZXU1inSC9NjHMuC4ADCh0TvX/O+Nmdc6ZELM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792398662; c=relaxed/simple;
	bh=P38rouQ1y3Abct3WvmIzNKmVVkAiqG3x1CyzLBqwyoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UFhxlAXEBw7RpWifINrY9EXieXPnqcvryOl7Ds40vdTUDGrw4UsTY/6FLzWOGusMBDAyvSkv66Gquclim9iRaQd9IpfhJhPAuwXiPsj9g4POSCMytbq6k7ShuNqjGM4nwoStOl4yVBI2Pv3rik+GzUu2JDZGlMdoZqAT+DL7e4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=hDoA1gaH; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="hDoA1gaH"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792398648; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=tXNfQSk8w5bCsKCQiiMuDFw/Pxco8MwvKv0f7YR8YHw=;
	b=hDoA1gaHSDNQFFryk0XObdgyw890gsIeG2aja3h4wBIvRionEB5/rd/vu6+YNigeClBmiMt2Qq9ftQdMfutMj1ag1qoGWMJT/RLqV0tOqImlTckl4wqGYAvuyLE0RK/SDsSU049/HLE11uUV+nBjMen9GE92CJ1jigd33AFyAfk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XD3.1sO_1792398646;
Received: from 30.178.69.0(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XD3.1sO_1792398646 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 19 Oct 2026 16:30:47 +0800
Message-ID: <62db7029-2ef2-40fb-8e04-ed29e9e4a963@linux.alibaba.com>
Date: Mon, 19 Oct 2026 16:30:46 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] nvmet: implement the FDP feature
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261019033624.402337-1-kanie@linux.alibaba.com>
 <20261019033624.402337-8-kanie@linux.alibaba.com>
 <sashiko-outbox-176587@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-176587@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/19 11:45, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] nvmet: missing RCU protection and live check in nvmet_fdp_lookup_ns()
> - [Medium] nvmet: unconditional NVME_FEAT_FDP in nvmet_execute_get_log_page_features()
> --
>
> commit 121b81584ccf85602ba9ff94dfc9a38064c55462
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvmet: implement the FDP feature
>
> This commit implements Set Features and Get Features for the Flexible Data
> Placement feature (FID 1Dh) in nvmet, using the Endurance Group Identifier
> to look up the corresponding namespace. It also advertises NVME_FEAT_FDP in
> the Supported Features log page.
>
>> diff --git a/drivers/nvme/target/admin-cmd.c b/drivers/nvme/target/admin-cmd.c
>> index b293ce418e2c3..93fb9c3d500a3 100644
>> --- a/drivers/nvme/target/admin-cmd.c
>> +++ b/drivers/nvme/target/admin-cmd.c
>> @@ -600,6 +600,9 @@ static void nvmet_execute_get_log_page_features(struct nvmet_req *req)
>>  		cpu_to_le32(NVME_FIS_FSUPP | NVME_FIS_NSCPE);
>>  	features->fis[NVME_FEAT_RESV_MASK] =
>>  		cpu_to_le32(NVME_FIS_FSUPP | NVME_FIS_NSCPE);
>> +	if (IS_ENABLED(CONFIG_NVME_TARGET_FDP))
>> +		features->fis[NVME_FEAT_FDP] =
>> +			cpu_to_le32(NVME_FIS_FSUPP | NVME_FIS_EGSCPE);
> [Severity: Medium]
> Should nvmet_execute_get_log_page_features() check
> nvmet_fdp_subsys_configured(nvmet_req_subsys(req)) here instead of
> IS_ENABLED(CONFIG_NVME_TARGET_FDP)?
>
> The commit message notes that this feature is reported in the Features log
> page under the same per-subsystem condition as the FDPS bit. In
> nvmet_execute_identify_ctrl(), NVME_CTRL_ATTR_FDPS is gated on:
>
> 	if (nvmet_fdp_subsys_configured(ctrl->subsys))
> 		ctratt |= NVME_CTRL_ATTR_FDPS;
>
> Checking only IS_ENABLED(CONFIG_NVME_TARGET_FDP) causes the log page to
> advertise NVME_FEAT_FDP on subsystems that have no FDP-enabled namespaces
> and report FDPS as 0.
Yes, fixed in v2.
>>  	status = nvmet_copy_to_sgl(req, 0, features, sizeof(*features));
>>  	kfree(features);
> [ ... ]
>
>> diff --git a/drivers/nvme/target/fdp.c b/drivers/nvme/target/fdp.c
>> index 17949e3665293..0327970a9cb9d 100644
>> --- a/drivers/nvme/target/fdp.c
>> +++ b/drivers/nvme/target/fdp.c
> [ ... ]
>
>> @@ -83,3 +87,76 @@ void nvmet_fdp_exit_ns(struct nvmet_ns *ns)
>>  	ns->fdp.backend_q = NULL;
>>  	ns->fdp.backend_ctrl = NULL;
>>  }
>> +
>> +
>> +/*
>> + * Each namespace is its own endurance group, so the Endurance Group
>> + * Identifier in Command Dword 11, and in the Log Specific Identifier
>> + * of the FDP log pages, directly names the namespace.  Returns the
>> + * namespace with a reference held.
>> + */
>> +static struct nvmet_ns *nvmet_fdp_lookup_ns(struct nvmet_req *req, u32 endgid)
>> +{
>> +	struct nvmet_subsys *subsys = nvmet_req_subsys(req);
>> +	struct nvmet_ns *ns;
>> +
>> +	ns = xa_load(&subsys->namespaces, endgid);
>> +	if (!ns || !ns->enabled || !nvmet_fdp_enabled(ns))
>> +		return NULL;
>> +
>> +	if (!percpu_ref_tryget_live(&ns->ref))
>> +		return NULL;
>> +
>> +	return ns;
>> +}
> [Severity: Critical]
> Can nvmet_fdp_lookup_ns() cause a use-after-free on struct nvmet_ns or
> ns->ref when a Set Features or Get Features command for NVME_FEAT_FDP races
> with namespace disable or removal via nvmet_ns_disable() or
> nvmet_ns_free()?
>
> In drivers/nvme/target/core.c, nvmet_ns_disable() tears down the namespace
> before clearing ns->enabled:
>
> 	if (!test_and_clear_bit(NVMET_NS_IO_LIVE, &ns->flags))
> 		return;
> 	...
> 	percpu_ref_kill(&ns->ref);
> 	synchronize_rcu();
> 	wait_for_completion(&ns->disable_done);
> 	percpu_ref_exit(&ns->ref);
>
> 	if (ns->pr.enable)
> 		nvmet_pr_exit_ns(ns);
>
> 	nvmet_fdp_exit_ns(ns);
>
> 	mutex_lock(&subsys->lock);
> 	nvmet_ns_changed(subsys, ns->nsid);
> 	nvmet_ns_dev_disable(ns);
> 	ns->enabled = false;
> 	mutex_unlock(&subsys->lock);
>
> And nvmet_ns_free() then erases and frees ns without an additional RCU
> grace period:
>
> 	nvmet_ns_disable(ns);
>
> 	mutex_lock(&subsys->lock);
>
> 	xa_erase(&subsys->namespaces, ns->nsid);
> 	...
> 	kfree(ns->device_path);
> 	kfree(ns);
>
> Because xa_load() releases its internal RCU read lock before returning,
> nvmet_fdp_lookup_ns() holds an unpinned pointer to ns outside of an
> rcu_read_lock() critical section. A concurrent nvmet_ns_free() is not
> blocked by synchronize_rcu() in nvmet_ns_disable() and can free ns before
> nvmet_fdp_lookup_ns() dereferences ns->enabled, ns->fdp.enable, or
> &ns->ref.
>
> Additionally, because ns->enabled remains true until after
> percpu_ref_exit(&ns->ref) has freed the per-CPU counter data, checking
> ns->enabled instead of test_bit(NVMET_NS_IO_LIVE, &ns->flags) allows
> nvmet_fdp_lookup_ns() to call percpu_ref_tryget_live(&ns->ref) concurrently
> with or after percpu_ref_exit(&ns->ref).
>
> Should nvmet_fdp_lookup_ns() wrap the lookup and reference acquisition in
> rcu_read_lock() / rcu_read_unlock(), check test_bit(NVMET_NS_IO_LIVE,
> &ns->flags), and use percpu_ref_tryget_live_rcu(&ns->ref) in the same way
> as nvmet_req_find_ns()?
Sashiko is right, fixed in v2.
> [ ... ]
>

