Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657406;
	b=cb2JX8AQDiRUlOvauJtMmvHnStCSG+b7o6sszARRMNWm1zmQ3pwSgIMZs0SRfADhDzI1
	 mGkP3sbj4ADmLc+HTILkK4jWY/x//wUUzuxjaSLiZM09oflFHSAA7Ozs4f7WXbPGf1WEX
	 4ykwLZJmBk2qHd/kt7zTZFmOvwNYoR0xfUc8/oByGnab6mmSjhaLLC+xJzLvDVKcvoM7H
	 9x5oaVSW2msRIloF5iHQ2wPbmaoFX8VO9ADnCwyXWX0AopnCUBN0poZbkEf5vp8gX37Bv
	 /Ojw6o1HGD6XML5OwPp8CNWdMvrKa2yklUlhSp2laz3XmKgLHAYYF6oeAe/NlkPvaNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657406;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IrR0ucWnwxQ/cocBxwwq0cb5UPgH07q1FaZL6ppOVpA=;
	b=iOS6yCmCq3Fk0X2bkmbOwLGbpY0H4g7Xm60iIK3wrkEu1362a0T5OkAdlYAg2YgQ8DTm
	 M3WgqUZKFFgnc2vw5sxXqzKTX/+bVt9dtMXh6I4x8SVjeIZTORkynWgmdx/a++fIPFtre
	 7h3IEE+XjnpGzYPoRLlBtUfHRHn0oEniLRWVPlLewy6a6kCs8lrIml3oIpNhwqlkuqZ1l
	 33JL2hke2IcK648WxN/onfAHGsnDiXRA1Sx/1SePZaIc/1pbEoN6QdBE9hgl/cLtFei41
	 fKH66yMFaZHL7x7uJevAotsQV3WPs0QDgtgmvHhtnHnhue7WxD5GrB6ICNtw0W4yg+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b="FPG/D1GF";
	arc=none smtp.remote-ip=115.124.30.119
Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40224606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 01:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40224606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=FPG/D1GF
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795657395; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=IrR0ucWnwxQ/cocBxwwq0cb5UPgH07q1FaZL6ppOVpA=;
	b=FPG/D1GF8WqyfBa5FsxlJRnkFOQTIzM0NMXRtK7KI6ivXpLz9Bw1oBKeemAJUzLSEXnJw/ga7Z3woiSCyvMZRTx2aUvqw9KK+nGjqizp0OMIxHXl+m4sRJmNkgcxF7M3oJYiFip1/c7BK7hyp9KUBDzbh0o/z9PsgV812cLz9V4=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XFSr1ve_1795657394;
Received: from 30.178.66.94(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XFSr1ve_1795657394 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 09:43:14 +0800
Message-ID: <86b6f4e4-f3b3-41ff-b0bb-1d8c959b37eb@linux.alibaba.com>
Date: Thu, 26 Nov 2026 09:43:11 +0800
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
Subject: Re: [PATCH v2] nvme-multipath: serialize ana_log_buf lifecycle with
 ana_lock
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261125122446.1122253-1-kanie@linux.alibaba.com>
 <sashiko-outbox-233382@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-233382@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/25 20:39, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [High] nvme-multipath: ana_work re-queued with NULL buffer after
>   nvme_mpath_uninit()
> - [Medium] nvme-multipath: stale ana_log_buf parsed against shrunk size
>   on reset
> --
>
> commit 6951dbeaa851be5d302a81751db149aaf0a1b322
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvme-multipath: serialize ana_log_buf lifecycle with ana_lock
>
> This commit serializes ctrl->ana_log_buf and ctrl->ana_log_size updates
> under ctrl->ana_lock across nvme_mpath_init_identify() and
> nvme_mpath_uninit(), and adds a NULL buffer check to nvme_parse_ana_log().
>
>> diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
>> index 27facdbb3d4c0..91ba71ab1c614 100644
>> --- a/drivers/nvme/host/multipath.c
>> +++ b/drivers/nvme/host/multipath.c
>> @@ -867,6 +867,9 @@ static int nvme_parse_ana_log(struct nvme_ctrl *ctrl, void *data,
>>  
>>  	lockdep_assert_held(&ctrl->ana_lock);
>>  
>> +	if (!ctrl->ana_log_buf)
>> +		return 0;
>> +
>>  	for (i = 0; i < le16_to_cpu(ctrl->ana_log_buf->ngrps); i++) {
>>  		struct nvme_ana_group_desc *desc = base + offset;
>>  		u32 nr_nsids;
>> @@ -1589,13 +1592,22 @@ int nvme_mpath_init_identify(struct nvme_ctrl *ctrl, struct nvme_id_ctrl *id)
>>  		goto out_uninit;
>>  	}
>>  	if (ana_log_size > ctrl->ana_log_size) {
>> +		void *buf;
>> +
>>  		nvme_mpath_stop(ctrl);
>> -		nvme_mpath_uninit(ctrl);
>> -		ctrl->ana_log_buf = kvmalloc(ana_log_size, GFP_KERNEL);
>> -		if (!ctrl->ana_log_buf)
>> +		buf = kvzalloc(ana_log_size, GFP_KERNEL);
>> +		if (!buf)
>>  			return -ENOMEM;
>> +		mutex_lock(&ctrl->ana_lock);
>> +		kvfree(ctrl->ana_log_buf);
>> +		ctrl->ana_log_buf = buf;
>> +		ctrl->ana_log_size = ana_log_size;
>> +		mutex_unlock(&ctrl->ana_lock);
>> +	} else {
>> +		mutex_lock(&ctrl->ana_lock);
>> +		ctrl->ana_log_size = ana_log_size;
>> +		mutex_unlock(&ctrl->ana_lock);
>>  	}
>> -	ctrl->ana_log_size = ana_log_size;
>>  	error = nvme_read_ana_log(ctrl);
>>  	if (error)
>>  		goto out_uninit;
> [Severity: Medium]
> When a controller resets with a smaller ana_log_size (or a smaller
> ctrl->anagrpmax, which is updated above outside ctrl->ana_lock), does this
> else branch leave the pre-reset ANA log in ctrl->ana_log_buf while
> shrinking ctrl->ana_log_size?
>
> A concurrent nvme_parse_ana_log() running before nvme_read_ana_log()
> overwrites the buffer will validate the old descriptors against the newly
> shrunk ctrl->ana_log_size and ctrl->anagrpmax, hitting WARN_ON_ONCE() and
> failing with -EINVAL:
>
> CPU0                                  CPU1
> nvme_mpath_init_identify()
>   ctrl->anagrpmax = ...
>   mutex_lock(&ctrl->ana_lock)
>   ctrl->ana_log_size = ana_log_size
>   mutex_unlock(&ctrl->ana_lock)
>                                       nvme_mpath_add_disk()
>                                         mutex_lock(&ctrl->ana_lock)
>                                         nvme_parse_ana_log()
>                                           offset > ctrl->ana_log_size
>                                             <-- WARN_ON_ONCE()
>   nvme_read_ana_log()
>
> Zeroing ctrl->ana_log_buf->ngrps (and updating ctrl->anagrpmax) under
> ctrl->ana_lock would keep concurrent parsers from walking stale pre-reset
> descriptors before nvme_read_ana_log() populates the new log.
>
>> @@ -1615,7 +1627,9 @@ void nvme_mpath_uninit(struct nvme_ctrl *ctrl)
>>  	 */
>>  	cancel_work_sync(&ctrl->ana_work);
>>  
>> +	mutex_lock(&ctrl->ana_lock);
>>  	kvfree(ctrl->ana_log_buf);
>>  	ctrl->ana_log_buf = NULL;
>>  	ctrl->ana_log_size = 0;
>> +	mutex_unlock(&ctrl->ana_lock);
>>  }
> [Severity: High]
> Can nvme_mpath_add_disk() re-queue ctrl->ana_work after
> nvme_mpath_uninit() has already cancelled it and freed ctrl->ana_log_buf?
>
> When nvme_mpath_init_identify() jumps to out_uninit during a reset (for
> example, when ana_log_size > max_transfer_size disables ANA with
> error == 0 so the controller still becomes live), nvme_mpath_add_disk()
> can pass its unlocked nvme_ctrl_use_ana() check before ctrl->ana_log_buf
> is cleared:
>
> CPU0                                  CPU1
> nvme_mpath_add_disk()                 nvme_mpath_uninit()
>   if (nvme_ctrl_use_ana(ctrl))          cancel_work_sync(&ctrl->ana_work)
>                                         mutex_lock(&ctrl->ana_lock)
>                                         kvfree(ctrl->ana_log_buf)
>                                         ctrl->ana_log_buf = NULL
>                                         ctrl->ana_log_size = 0
>                                         mutex_unlock(&ctrl->ana_lock)
>     mutex_lock(&ctrl->ana_lock)
>     nvme_parse_ana_log()
>       if (!ctrl->ana_log_buf)
>         return 0
>     mutex_unlock(&ctrl->ana_lock)
>     if (desc.state) /* 0 */
>     else
>       set_bit(NVME_NS_ANA_PENDING, ...)
>       queue_work(..., &ctrl->ana_work)
>                                       nvme_ana_work()
>                                         nvme_read_ana_log()
>                                           nvme_get_log(..., NULL, 0, 0)
>                                             <-- numd underflows to 0xffffffff
>
> Because nvme_parse_ana_log() returns 0 with desc.state == 0 when
> ctrl->ana_log_buf is NULL, nvme_mpath_add_disk() treats it as a missing
> group descriptor, leaves the namespace stuck with NVME_NS_ANA_PENDING set,
> and queues ctrl->ana_work.  nvme_read_ana_log() then calls nvme_get_log()
> without checking ctrl->ana_log_buf, passing a NULL buffer and size 0;
> nvme_bytes_to_numd(0) underflows to 0xffffffff and submits a 16 GiB
> Admin Get Log Page command with no data buffer mapped.
Right.. Fixed in v3.

Best Regards,
Guixin Liu
>

