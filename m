Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792980701;
	b=rleCTrtzmVWOWrMYVnyp4Xvc0/Ea1nSMJPf9AvVQH/dDklXY9CMku92uQXAvLopVjsvI
	 lyHleT7KDuN4Ic+zt5mTXi7nvIakB6P5q/x9NIgBV3xalmoNFyetPnBkZ7WY2iFGAiBLb
	 K6RokPm8scQTBgzJIJOmKy0GUnSxAMiIOLXmhpWLCirLzpktyVWJheesgIDqw4Km0SBfT
	 Ez6c2Lv4PFbp8iZ61oactLpraZtUqoZCwe9RMMCRYAGcFhWOCt7q9PNaDI72ELiG4B+dT
	 1T+bXU2Hlf7BW55fKOwMRrEBF/a7GLdZEV2ngnLrqmOjVmSCchpMW0ZVunOTTuCV0zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792980701;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7pBb8peZLyGlupbuSNH0lecZVCjEl1ALPaCWnm6Cx3o=;
	b=HpQmi+sAZ/skMMBEWBGIxoj9avqn4H9ey/OoAdN1ZqCGAkgc7/EHGE/ie7aRmlwuozOV
	 TG2DQirG7tV6sVpi9YeoFkvSqS1WtdGzlBzekhIFUF3EwQoNahVyN9hU/bal1aQ+4HN1C
	 qxdM9OmFIGob9w7wOFRlmCWjNaZSlS3fubWKq9IVSjjQL1+DxU+53CbZji9+euQBKAusT
	 pF9lKnSqNXOSSIamSeqMBmcyCzxfZNrabp5GvrlB8PJeaqLJbiER6AX2Yx3SLlC1DUox9
	 8hqMMIcXcnYfaqbEcVWLUKB93fPRW0AZBmsnxgbotATIH0HTT3GpIZKzG/MMZqM1MZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PEsgsdHr;
	arc=none smtp.remote-ip=115.124.30.124
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2621606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 02:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2621606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PEsgsdHr
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792980691; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=7pBb8peZLyGlupbuSNH0lecZVCjEl1ALPaCWnm6Cx3o=;
	b=PEsgsdHr/rg1fxjhS1K8jYPszRrh1G6p6dCZC3R/XoF80+rqGdR6JJ9Rx+wTD0x/DXEKNR2O92Vi9yYoOuYrVg/TdO0kaRnVenDkuSm6fDKGpN9shXbCzLcToSx63q4YiHxlj8D15lc95UX/JxC+hkEkY5PAHjT1oqiSnvfj4Pc=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R461e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=kanie@linux.alibaba.com;NM=1;PH=DS;RN=2;SR=0;TI=SMTPD_---0XDRPkTX_1792980690;
Received: from 30.178.69.120(mailfrom:kanie@linux.alibaba.com fp:SMTPD_---0XDRPkTX_1792980690 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 Oct 2026 10:11:30 +0800
Message-ID: <4be183a5-5d40-49ba-ac26-30fac06c007c@linux.alibaba.com>
Date: Mon, 26 Oct 2026 10:11:29 +0800
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
Subject: Re: [PATCH 03/11] nvme: export nvme_bdev_ops
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261023080251.2606443-1-kanie@linux.alibaba.com>
 <20261023080251.2606443-4-kanie@linux.alibaba.com>
 <sashiko-outbox-182494@kernel.org>
From: Guixin Liu <kanie@linux.alibaba.com>
In-Reply-To: <sashiko-outbox-182494@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



在 2026/10/23 16:14, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] nvme: exporting only nvme_bdev_ops misses multipathed NVMe namespaces
> --
>
> commit 764e628e097c80c3a597aca0fdc4893155c2715b
> Author: Guixin Liu <kanie@linux.alibaba.com>
>
> nvme: export nvme_bdev_ops
>
> This commit exports nvme_bdev_ops so that external subsystems such as the
> NVMe target FDP bridge can identify an NVMe namespace block device by its
> block_device_operations pointer and access its underlying NVMe structures.
>
>> diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
>> index 7eb0f9fe6b18d..0099ce5730b20 100644
>> --- a/drivers/nvme/host/core.c
>> +++ b/drivers/nvme/host/core.c
>> @@ -2719,6 +2719,7 @@ const struct block_device_operations nvme_bdev_ops = {
>>  	.report_zones	= nvme_report_zones,
>>  	.pr_ops		= &nvme_pr_ops,
>>  };
>> +EXPORT_SYMBOL_GPL(nvme_bdev_ops);
> [Severity: Medium]
> Does exporting only nvme_bdev_ops work when NVMe multipathing is active for
> the backing namespace?
>
> When multipathing is enabled for a namespace, nvme_mpath_alloc_disk() in
> drivers/nvme/host/multipath.c sets up the user-visible /dev/nvmeXnY gendisk
> with nvme_ns_head_ops and stores struct nvme_ns_head * in private_data:
>
> 	head->disk->fops = &nvme_ns_head_ops;
> 	head->disk->private_data = head;
>
> Meanwhile, nvme_alloc_ns() in drivers/nvme/host/core.c marks the
> per-controller disk (which uses nvme_bdev_ops and stores struct nvme_ns * in
> disk->private_data) as hidden so it cannot be opened as a backing block
> device:
>
> 	if (nvme_ns_head_multipath(ns->head)) {
> 		sprintf(disk->disk_name, "nvme%dc%dn%d", ctrl->subsys->instance,
> 			ctrl->instance, ns->head->instance);
> 		disk->flags |= GENHD_FL_HIDDEN;
> 	}
>
> When the NVMe target FDP bridge in nvmet_fdp_init_ns() checks
> bdev->bd_disk->fops != &nvme_bdev_ops on an opened /dev/nvmeXnY device,
> won't it reject valid multipathed NVMe namespaces with -EINVAL because
> bdev->bd_disk->fops is &nvme_ns_head_ops?
>
> Instead of exporting nvme_bdev_ops and having callers inspect
> bdev->bd_disk->fops and bdev->bd_disk->private_data directly, would it make
> sense to provide a helper in drivers/nvme/host/core.c (similar to
> nvme_ctrl_from_file()) that handles both nvme_bdev_ops and nvme_ns_head_ops?
Well, this only support NVMe-only backends, I declared the restriction in commit
message.

Best Regards,
Guixin Liu
>

