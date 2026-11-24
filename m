Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523764;
	b=O6vaDAaeW69NbtJIXSCJwwtsYM3Tg9hKxQsJcLwf7OET2Q+arOD68W0bzEtJhuG6VQOX
	 a9eAx/lzJAW1BQ55zGYcfa/k4eUn/bfHjQ9LkyzZCMxknF2vDgmBFFk+St0i+cB8o/wZ+
	 YdUooZ3LX5LcBAIScxfNH/KoiEvb677q/NPYTFLVa/IE53bD2kR9gpxsAcp7mDKkuNua9
	 swQekQvE3XkLPPIr8jZvC2IQMaNEns4NIIc5r1svofo1wVfzWP5cksWQGXCPWIA/y+e5e
	 nFN4HZbN1RFmcuiaHFfb+4wvfI3i/rfBcvja5qIRLHjFKtk9EGnQdrjUD3QXmwijI+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523764;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=UV8wFrRd9rkiIlpugBk7ezJ4Swo/IBOIk9B+puP7igc=;
	b=wsUlLEW/SS5xmPlHekLFhMXJQ5IfF6rf21PHEqRQSRezyOgt8Vq/vB1dPTeLb8AO6WlL
	 S1J+uZq8fQkjMkU8w8kP60dFn1xD8lIKIhFNZXlM1HTSYzIYcgrk98Zm2sldli2F/+2Sf
	 cTMDIrKvsptHZKEhfIxXUbSc7VK5NXTR7mCeYBTN6yQyfQ/F3m62XOk2xXBBcjKTqy+Kt
	 D4WUUJSWi/5/0uzp3NTjDvEN4wLhiTvoNNaglmnxqY4LMLyPW4JMQm+jOD+/sm6qHAYNh
	 U7YEbzZ/MxB3/WF7gD7sJmRCoNTvQ7PGvVb2T+A2SY0V3Uxr6WLqA6dd7kWHOcyilaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=fbueesWb;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5613B606A333
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5613B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=fbueesWb
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795523753; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=UV8wFrRd9rkiIlpugBk7ezJ4Swo/IBOIk9B+puP7igc=;
	b=fbueesWb+W+ED/zAZq0li/y9F0G2ifI4Ae4XvJv3Xpt013wSRtvujdgBC3cj3sFQ+COVG2nwddvco1hlpud6ENCzb9EuNu8ye3NkRAKc+vDUJHnurStqM0uMnpG5wFmXa2QHQY5FcNdmt+V/Aa4hQXx3oK9AZqXyrHazaa5Qijg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XFObgDc_1795523752;
Received: from 30.178.69.52(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XFObgDc_1795523752 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Nov 2026 20:35:53 +0800
Message-ID: <e7e925d7-27e9-4961-b405-aef832525dba@linux.alibaba.com>
Date: Tue, 24 Nov 2026 20:35:51 +0800
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
Subject: Re: [PATCH] nvme-multipath: delete the ANATT timer after draining
 ana_work
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261124121349.1861269-1-kanie@linux.alibaba.com>
 <sashiko-outbox-231129@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-231129@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/11/24 20:22, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Critical] nvme-multipath: use-after-free in nvme_parse_ana_log() [1]
> --
>
> commit e4ad87877e854ebed2991236e7f5c8c425e05678
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvme-multipath: delete the ANATT timer after draining ana_work
>
> This commit cancels ana_work before deleting anatt_timer in
> nvme_mpath_stop() and also deletes the timer in nvme_mpath_uninit() after
> draining ana_work.
>
>> diff --git a/drivers/nvme/host/multipath.c b/drivers/nvme/host/multipath.c
>> index 27facdbb3d4c0..40f6cab3db47c 100644
>> --- a/drivers/nvme/host/multipath.c
>> +++ b/drivers/nvme/host/multipath.c
> [ ... ]
>
>> @@ -1614,6 +1614,7 @@ void nvme_mpath_uninit(struct nvme_ctrl *ctrl)
>>  	 * resources.
>>  	 */
>>  	cancel_work_sync(&ctrl->ana_work);
>> +	timer_delete_sync(&ctrl->anatt_timer);
>>  
>>  	kvfree(ctrl->ana_log_buf);
>>  	ctrl->ana_log_buf = NULL;
> [Severity: Critical]
> This problem wasn't introduced by this patch, but can freeing
> ctrl->ana_log_buf here without holding ctrl->ana_lock cause a
> use-after-free in nvme_parse_ana_log() [1]?
>
> When nvme_mpath_init_identify() sees a larger ana_log_size, it calls
> nvme_mpath_uninit() to free the old buffer before allocating a new one,
> without taking ctrl->ana_lock.  A concurrent namespace scan in
> nvme_mpath_add_disk() takes ctrl->ana_lock and reads ctrl->ana_log_buf in
> nvme_parse_ana_log():
>
> CPU0                                CPU1
> nvme_mpath_init_identify()          nvme_mpath_add_disk()
>                                       if (nvme_ctrl_use_ana(ns->ctrl))
>                                         mutex_lock(&ns->ctrl->ana_lock)
>                                         nvme_parse_ana_log()
>                                           base = ctrl->ana_log_buf
>   nvme_mpath_uninit()
>     kvfree(ctrl->ana_log_buf)
>                                           /* dereferences freed base */
>                                           <-- use-after-free
>
> Taking ctrl->ana_lock around freeing and replacing ctrl->ana_log_buf would
> serialize this with concurrent readers.
>
> [1] https://sashiko.dev/#/bug/linux-48603474-5139-4b24-a567-ce7f9706b201
What Sashiko found is a pre-existing bug, not something introduced by this patch.

Let me check wheather I can send a separate patch for it.

Best Regards,
Guixin Liu
>

