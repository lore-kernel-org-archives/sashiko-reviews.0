Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163568;
	b=pL2E3QfcFK+db38GiQi0d/jGqTMA6ZGZKoLPiY3LA0jXflwtCCGOfTNFu/lZ9qGCwEw0
	 9CYcTGBiDS1/HSJzON7jwvkbK9JbAq4Xut0MS7jS/L0CEDqKv0IgTj7Q3oVihXpW0R+90
	 Bvb7+6AJ/GVdqLpXD2vim9SnN4aryXmylrmpJreFZ1DpPq7zkvUg2KUqp1vPYjc5UPcA9
	 ufrXHGLc3vPzteaYWzAly58ecCYzzmcNac2zpB1M9BMfCmy4UFz9jTypr/X1gxQHMMQAo
	 XHlIchHLJ/rWpfYKSdtBBZyT9cj3icvX+JaGR5NSi8LLVFChgR0nsSQBkaQRDNkZwqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163568;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=xRFhMlcn0xlxKDAyzDGD6BZdkslSLafjjRmcFObGPdM=;
	b=SOukIBe4yPEg7bJpcUzdVzDsyUkY6yHEnh8RJlma23IXvsGzT36nw+ipEDDwLlIlMRsR
	 hWGWDwySTywxCc39cxXMX/147nIyeygwVXKh+1EqevmK07z8ruVzvmqyomVQoFNr1SwVp
	 fHWpkhzBTU6kU0VwqhP7y49+p26gFPeUh3UwiMpJoIKSsx9BFGGv1QhFXRoXmSWo01wvl
	 ZiPfiYgvkxQS2rHUEZJfFj7VQOCsSygI32eq9UkdBYFCUVes578MQ9vNr6yUFpGkIqfXx
	 EOPZ3/B33Ijc3Hj/+fSrK99VEqOkEKlCBwp0GAHUzPceJxpHJHcZwXPQRwUvGJS4dgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=bmaT2pZn;
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02580606A320
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 08:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02580606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=bmaT2pZn
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795163558; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=xRFhMlcn0xlxKDAyzDGD6BZdkslSLafjjRmcFObGPdM=;
	b=bmaT2pZnHMhH7+6zae8c4d+gvIZSmmXxdbx6UGJN6U9D/MiO6B3YCkNiQgR63zoiuoD7vxKkJZGf4lndTimFh9TeNPsRBFG6kzZOaYEl97c27NpU0ChuvUwgviultUBNswRiedwTG/24AsxtANZXphJETuUuHDT1Y0B6Lr1IytI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R371e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XF5jp19_1795163557;
Received: from 30.178.67.37(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XF5jp19_1795163557 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Nov 2026 16:32:37 +0800
Message-ID: <f7a83440-6fdc-4b8d-aa63-3677ce4e21f7@linux.alibaba.com>
Date: Fri, 20 Nov 2026 16:32:35 +0800
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
Subject: Re: [PATCH] nvmet: don't abort the preempting host itself
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261120080642.1179691-1-kanie@linux.alibaba.com>
 <sashiko-outbox-224708@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-224708@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/20 16:18, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] nvmet: nvmet_pr_unreg_all_host_by_prkey() skips abort on
>   false pc_ref premise
> --
>
> commit 07f50eedfd5f5e5d148cd9fefe65d629fc37077e
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvmet: don't abort the preempting host itself
>
> This commit skips calling nvmet_pr_set_ctrl_to_abort() for the issuing
> host in nvmet_pr_unreg_all_host_by_prkey() when handling a Reservation
> Acquire command with the Preempt and Abort action.
>
>> diff --git a/drivers/nvme/target/pr.c b/drivers/nvme/target/pr.c
>> index 8c818f24815bd..ed530d7362f5b 100644
>> --- a/drivers/nvme/target/pr.c
>> +++ b/drivers/nvme/target/pr.c
>> @@ -502,7 +502,14 @@ static u16 nvmet_pr_unreg_all_host_by_prkey(struct nvmet_req *req, u64 prkey,
>>  		if (reg->rkey == prkey) {
>>  			status = NVME_SC_SUCCESS;
>>  			uuid_copy(&hostid, &reg->hostid);
>> -			if (abort)
>> +			/*
>> +			 * Aborting is best effort (NVMe Base Specification
>> +			 * section 8.1.25.7): skip the issuing host, as the
>> +			 * abort flow would otherwise wait for the preempt
>> +			 * command itself, which holds a reference on its
>> +			 * controller's per-controller ref until it completes.
>> +			 */
>> +			if (abort && !uuid_equal(&hostid, send_hostid))
>>  				nvmet_pr_set_ctrl_to_abort(req, &hostid);
>>  			nvmet_pr_unregister_one(pr, reg);
>>  			if (!uuid_equal(&hostid, send_hostid))
> [Severity: Medium]
> Does a Reservation Acquire command actually hold a reference on pc_ref?
>
> In nvmet_parse_io_cmd(), nvmet_parse_pr_cmd() returns 0 for reservation
> opcodes and returns early before reaching nvmet_pr_get_ns_pc_ref():
>
> drivers/nvme/target/core.c:nvmet_parse_io_cmd() {
> 	...
> 	if (req->ns->pr.enable) {
> 		ret = nvmet_parse_pr_cmd(req);
> 		if (!ret)
> 			return ret;
> 	}
> 	...
> 	if (req->ns->pr.enable) {
> 		ret = nvmet_pr_check_cmd_access(req);
> 		if (ret)
> 			return ret;
>
> 		ret = nvmet_pr_get_ns_pc_ref(req);
> 	}
> 	...
> }
>
> Because that is the only caller of nvmet_pr_get_ns_pc_ref(), the preempt
> command itself never holds a reference on pc_ref->ref and cannot cause the
> self-deadlock described here.  Skipping nvmet_pr_set_ctrl_to_abort() for
> send_hostid instead stops nvmet from waiting for in-flight I/O commands on
> the newly unregistered issuing host's controllers to drain before
> completing the Preempt and Abort command.
Sashiko is right, Please ignore this patch.
>

