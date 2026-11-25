Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795588449;
	b=1oOJOhuxhGPYQHoiJXMHxKXFl9T3DAc+mK+agcc8wmvrQfcYCay5R0CNe215k9MQ+Bi6
	 jcJ1LIQLh6WTCWT3XKvyBrLJBn/cokDxbES/bbU3KpjGIvlO7L7JK52vfN8D9nBitCq5B
	 oGVFnFRH4u9r07nAOR8eywP3HQDNFlDx3gfcczNvUE9VBRrEk+tAht0OspvKSQfJHgLfT
	 E2KtRonDFcxnOI2AkwJJ3Ezv9KnSqw9ZOcjcKEDYIkfGb5tD9Rvt+oCil2yOJujmCSQqo
	 ee7LNixDr/oiocHU8UKSIFcgWVu4w4gAQO9lmqOmwm5+rgPxVgbas5dAUBTsoSGKJJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795588449;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=Ht/4Zv8vReTWNzwe8U7mP97/jA/SA5fhwbA7wkWleFo=;
	b=LDM2stE7gqOM2y5dZPzpOBQDu4gMZnPDPRpORvbSKM7B4pb3EzPRU0oVwEHA5P73SoDB
	 QOyBYqdTMMxTxWYiMkcEn36iJIGAiK2ir9TkxlhCwV1xJXrmVdBCzP53faxHi4TD1swRW
	 sqTvPkeZQBL80lWASSTCZHlqU6venQ+nOnpHTQz+Oz6FsmoJMcdP3QoAxM6s8jF05uAvB
	 B/ULYKj0LWvUpwF6IngpBX/vtTz8UXKc05ErOzpW+C3W1E4NIJApPVh1r4atL6ckrHK6m
	 AwEH9GEQ9wJMg/yrCarK2ZNjuCgKCXMI3LPU3tqru2HDDDHniOK4k36e/qMRgflN88Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tUooAsZZ;
	arc=none smtp.remote-ip=115.124.30.100
Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E22606A31E
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 06:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E22606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=tUooAsZZ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795588436; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Ht/4Zv8vReTWNzwe8U7mP97/jA/SA5fhwbA7wkWleFo=;
	b=tUooAsZZN1i2J8YC6EbzxWQS4fFd7IW4afqr/XbUKDcIjpOxyaKVEZ+Pu/eBO/KOdLK9eIJv9YMBvlZfyg1HyGPKxTky0Mz6Qn+I/ajgvQ2q0i2Jh3KcbN40L0vzmvvahRlFKfaeL2W7vme+mucKXP8x8MZ3YcFkoN0BdFIBU0g=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XFQbHol_1795588435;
Received: from 30.178.67.246(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XFQbHol_1795588435 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 25 Nov 2026 14:33:56 +0800
Message-ID: <317af3d9-9055-42ff-adc7-4f1f0e37a210@linux.alibaba.com>
Date: Wed, 25 Nov 2026 14:33:54 +0800
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
Subject: Re: [PATCH] nvme-multipath: protect ana_log_buf teardown with
 ana_lock
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261125060153.206699-1-kanie@linux.alibaba.com>
 <sashiko-outbox-232646@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-232646@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/25 14:10, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] nvme-multipath: NULL deref and uninit read in
>   nvme_parse_ana_log()
> --
>
> commit d312e34ea57a3e103965fa1cad1dd210a8ca3b3a
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvme-multipath: protect ana_log_buf teardown with ana_lock
>
> This commit acquires ctrl->ana_lock around freeing and clearing
> ctrl->ana_log_buf in nvme_mpath_uninit() to serialize against concurrent
> ANA log parsers.
>
>> diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
>> index 27facdbb3d4c0..bc0abd1f30274 100644
>> --- a/drivers/nvme/host/multipath.c
>> +++ b/drivers/nvme/host/multipath.c
>> @@ -1615,7 +1615,9 @@ void nvme_mpath_uninit(struct nvme_ctrl *ctrl)
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
> Can a concurrent parser in nvme_mpath_add_disk() still hit a NULL pointer
> dereference or read uninitialized memory in nvme_parse_ana_log() when
> nvme_mpath_uninit() unlocks ctrl->ana_lock?
>
> In the concurrent nvme_mpath_init_identify() and nvme_mpath_add_disk()
> path, nvme_mpath_add_disk() checks nvme_ctrl_use_ana() (which tests
> ctrl->ana_log_buf != NULL) before acquiring ctrl->ana_lock, and
> nvme_parse_ana_log() unconditionally dereferences
> ctrl->ana_log_buf->ngrps:
>
> CPU0                                  CPU1
> nvme_mpath_init_identify()            nvme_mpath_add_disk()
>                                         if (nvme_ctrl_use_ana(ctrl))
>   nvme_mpath_uninit()
>     mutex_lock(&ctrl->ana_lock)
>     kvfree(ctrl->ana_log_buf)
>     ctrl->ana_log_buf = NULL
>     mutex_unlock(&ctrl->ana_lock)
>                                         mutex_lock(&ctrl->ana_lock)
>                                         nvme_parse_ana_log()
>                                           ctrl->ana_log_buf->ngrps
>                                             <-- NULL pointer dereference
>   ctrl->ana_log_buf = kvmalloc(...)
>   nvme_read_ana_log()
>
> Even if CPU1 acquires ctrl->ana_lock after kvmalloc() runs in
> nvme_mpath_init_identify(), ctrl->ana_log_buf and ctrl->ana_log_size are
> assigned before nvme_read_ana_log() retakes ctrl->ana_lock to populate the
> buffer, so nvme_parse_ana_log() can parse uninitialized memory from
> kvmalloc().  In addition, while ctrl->ana_log_buf is NULL between
> nvme_mpath_uninit() and kvmalloc(), concurrent callers of
> nvme_ctrl_use_ana() transiently observe the controller as non-ANA.
Oh, Sashiko is right, I didn't fix all race condition.

1. We should check NULL under lock to prevent NULL reference.
2. Should use kvzalloc instead kvmalloc.

Changed in v2.

Best Regards,
Guixin Liu
>

