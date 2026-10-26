Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792980836;
	b=SsEWzvDalMrkF2IzLciYJwRBsFzB/7fuCynSpdqpqZtid54nBt7vCx946AZQleuF4Yjy
	 aWx5cmpt7bEvCpmmhbyDVt6KHSCGOlwtxo048LbPRXsHGl8EwtX4reGxSMI/geZl6WDG0
	 jxm8BbiPY9CzL6Zo1LWOPxPU0Pi1y5y8aBQY8gZ+9wG/EWgRcrmUIwbUPtHf/aKYGWRPg
	 yslN19yM/DBSknrTO7OkGkWniq/3wb0YK50ZEEpCpd0lHNRxzEbqRHoAMBmJR0A2zyADL
	 eYRAxuT8iOw5zX6OjTkg84OUzbKXA8b3umMOBQjfCuWelpwImxj1p5k7PUg19ZXVshQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792980836;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=kZdzXgxqnZUDvgMXf+kiOm1fRbjDSnKoY5uKh+Y1VmM=;
	b=JPFMde1vgbHVkJH0mRbt1XhbwQCiKsdOxthEEKOZWx8+bxIUvACBV3sxhzdX/PYjbPkX
	 ESpNJ7dxpIK7RlKDm2bcKfhWyvQ5RE2uIZGvUPbn6NkqXq90nBUvmWnxJXv0UYZG0CdX3
	 C65iAv4nkTW2Ds0tkZsiuRFKciFehL8jZbHOV3RJMjc2CjLY8bWqVkqfzQTcAoPrzQh6i
	 cFDeBXb5qE297UiW3gEA9iPJ1jowKBddEB3jtEkx1cYYkJC6Ye7oE2JOzI0B4gqUBOTxu
	 Gpj65LDxXQiUXry3kb4d/PqxlDi5LCQ5wMTy8DyR31r2RnmwYFCLWE9Ubeh9ZcAFatw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=moIjZYaA;
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E57606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 02:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E57606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=moIjZYaA
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792980825; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=kZdzXgxqnZUDvgMXf+kiOm1fRbjDSnKoY5uKh+Y1VmM=;
	b=moIjZYaAl2fhiZlQFet3IyqzerytkyrIDvuNwjihteP1VEF7lNHBDANvqbb6Xxzo3hKbvt0SzW6gcMkA9ldg/eeTcYrFyo0hoKNCOuHkdpAuQw3mQC49/mOzOTUmCGVQ5T7XxfgeNL3QPhwgnDDSASphW4T46CmqPvwH1uA3Gwk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R511e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XDRRzTU_1792980824;
Received: from 30.178.69.120(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XDRRzTU_1792980824 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 10:13:45 +0800
Message-ID: <0da017d8-0ee2-4104-a864-3377f9c8e1cb@linux.alibaba.com>
Date: Mon, 26 Oct 2026 10:13:44 +0800
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
Subject: Re: [PATCH 07/11] nvmet: implement the FDP feature
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261023080251.2606443-1-kanie@linux.alibaba.com>
 <20261023080251.2606443-8-kanie@linux.alibaba.com>
 <sashiko-outbox-182513@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-182513@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/23 16:26, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] nvmet: fdp: nvmet_fdp_lookup_ns() checks ns->enabled instead of NVMET_NS_IO_LIVE
> - [Medium] nvmet: nvmet_get_feat_fdp() fails on non-FDP namespaces in mixed subsystems
> --
>
> commit 306dfd499967efa07a30c35673d8c81562928443
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvmet: implement the FDP feature
>
> This commit implements Set Features and Get Features for the Flexible Data
> Placement feature (FID 1Dh) and advertises it in the Supported Features log
> page when FDP is configured on the subsystem.
>
>> diff --git a/drivers/nvme/target/fdp.c b/drivers/nvme/target/fdp.c
>> index 17949e3665293..5008294984885 100644
>> --- a/drivers/nvme/target/fdp.c
>> +++ b/drivers/nvme/target/fdp.c
> [ ... ]
>
>> @@ -83,3 +87,82 @@ void nvmet_fdp_exit_ns(struct nvmet_ns *ns)
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
>> +	rcu_read_lock();
>> +	ns = xa_load(&subsys->namespaces, endgid);
>> +	if (!ns || !ns->enabled || !nvmet_fdp_enabled(ns))
>> +		goto out_unlock;
>> +
>> +	if (!percpu_ref_tryget_live(&ns->ref))
>> +		goto out_unlock;
> [Severity: High]
> Can checking ns->enabled instead of test_bit(NVMET_NS_IO_LIVE, &ns->flags)
> here race with nvmet_ns_disable() and nvmet_ns_enable()?
>
> After commits 42b0f5196dc2 ("nvmet: defer setting ns->enabled to false in
> nvmet_ns_disable()") and 3fdd281e0a04 ("nvmet: don't allow I/O admission
> after percpu ns reference is killed"), nvmet_ns_disable() clears
> NVMET_NS_IO_LIVE and tears down ns->ref before setting ns->enabled to false:
>
> drivers/nvme/target/core.c:nvmet_ns_disable() {
> 	if (!test_and_clear_bit(NVMET_NS_IO_LIVE, &ns->flags))
> 		return;
> 	...
> 	percpu_ref_kill(&ns->ref);
> 	synchronize_rcu();
> 	wait_for_completion(&ns->disable_done);
> 	percpu_ref_exit(&ns->ref);
> 	...
> 	mutex_lock(&subsys->lock);
> 	nvmet_ns_changed(subsys, ns->nsid);
> 	nvmet_ns_dev_disable(ns);
> 	ns->enabled = false;
> 	mutex_unlock(&subsys->lock);
> }
>
> Because ns->enabled remains true across percpu_ref_kill(&ns->ref),
> synchronize_rcu(), and percpu_ref_exit(&ns->ref), a concurrent
> nvmet_set_feat_fdp() or nvmet_get_feat_fdp() calling nvmet_fdp_lookup_ns()
> can still observe ns->enabled == true and call percpu_ref_tryget_live(&ns->ref)
> while or after percpu_ref_exit(&ns->ref) frees the per-CPU counter.
>
> Similarly, in nvmet_ns_enable(), ns->enabled = true is a plain store with no
> release barrier after percpu_ref_init(&ns->ref, ...), whereas NVMET_NS_IO_LIVE
> is set after xa_set_mark():
>
> drivers/nvme/target/core.c:nvmet_ns_enable() {
> 	ret = percpu_ref_init(&ns->ref, nvmet_destroy_namespace, 0, GFP_KERNEL);
> 	if (ret)
> 		goto out_fdp_exit;
>
> 	nvmet_ns_changed(subsys, ns->nsid);
> 	ns->enabled = true;
> 	xa_set_mark(&subsys->namespaces, ns->nsid, NVMET_NS_ENABLED);
> 	nvmet_debugfs_ns_setup(ns);
> 	set_bit(NVMET_NS_IO_LIVE, &ns->flags);
> }
>
> Should nvmet_fdp_lookup_ns() check test_bit(NVMET_NS_IO_LIVE, &ns->flags) and
> use percpu_ref_tryget_live_rcu(&ns->ref), matching nvmet_req_find_ns()?
Sashiko is right, changed in v3.
>> +
>> +	rcu_read_unlock();
>> +	return ns;
>> +
>> +out_unlock:
>> +	rcu_read_unlock();
>> +	return NULL;
>> +}
> [ ... ]
>
>> +u16 nvmet_get_feat_fdp(struct nvmet_req *req)
>> +{
>> +	struct nvmet_ns *ns;
>> +
>> +	ns = nvmet_fdp_lookup_ns(req,
>> +				 le32_to_cpu(req->cmd->features.dword11));
>> +	if (!ns)
>> +		return NVME_SC_INVALID_FIELD | NVME_STATUS_DNR;
> [Severity: Medium]
> What happens in a subsystem that contains both FDP-enabled and non-FDP
> namespaces?
>
> When at least one namespace in the subsystem has FDP enabled,
> nvmet_fdp_subsys_configured() returns true, so the controller advertises
> NVME_CTRL_ATTR_FDPS in ctratt and NVME_FEAT_FDP in the Supported Features log
> page. Every enabled namespace is exposed as its own endurance group
> (endgid = nsid).
>
> When the Linux NVMe host scans namespaces on a controller with
> NVME_CTRL_ATTR_FDPS set, nvme_alloc_ns_head() -> nvme_query_fdp_info() issues
> Get Features (NVME_FEAT_FDP) for each namespace's endgid and checks whether
> FDPCFG_FDPE is set in the result:
>
> drivers/nvme/host/core.c:nvme_query_fdp_info() {
> 	ret = nvme_get_features(ctrl, NVME_FEAT_FDP, info->endgid, NULL, 0,
> 				&fdp);
> 	if (ret) {
> 		dev_warn(ctrl->device, "FDP get feature status:0x%x\n", ret);
> 		return ret;
> 	}
>
> 	if (!(fdp.flags & FDPCFG_FDPE))
> 		return 0;
> }
>
> Because nvmet_get_feat_fdp() uses nvmet_fdp_lookup_ns(), which rejects
> namespaces where !nvmet_fdp_enabled(ns), won't Get Features fail with
> NVME_SC_INVALID_FIELD | NVME_STATUS_DNR on valid non-FDP namespaces instead
> of succeeding with result 0 (FDPE cleared) when nvmet_fdp_subsys_configured()
> is true?
Sashiko is right, changed in v3.
>

