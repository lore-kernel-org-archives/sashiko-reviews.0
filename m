Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920648;
	b=pVMBu0yjMqvw8V83daE3rj9gNJ6HvVVgWaMjKT6I+FGUsCgeM2o4GJh4u8Rdqvm1XvVA
	 5TL34nGIyR5n73WdfQROFRjuLMgQQhol8sPYpsFz3D/tqLpjEL8mYpC4Q51ULWExQCK/J
	 C4/zgZK5ha0NH2mTxDOedKS281EpoE0m5H1m1wivq4ZT27vxeJSkV0bxej1OsEZzA0tfI
	 3/9bUB683DXWnm+x9ojw357h2oRAiHO694fgCWXwTl9+0KrXuTF5D2LkI7+w6JzYjMrSP
	 hiXMrDDX/95S+jxq/1JcIQQBjzb1GZqI3o57rrZD4j7owyHa2H3mdHiTBs3rFDMmNoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920648;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=SHJZaWrKHNhHUqos5xpllk63Yn/OQUNoxKtkvNvJ2EE=;
	b=UqFiZQd5wZI0ZcZHx4N/MtRfN31qO+ff3vzWGgesJeBah71ts4Rm9528HM3j5WDIl1vY
	 z9IKMmMv8ODg0YBvwCo3MrJvf0+UFr6ZU3R9Fv3O/+GeyPmpBpiFhGY/BdDFJbGL1EGOb
	 +twLkwW8aLN0XGCWRZW8cmpP07A24bWeXJ+K/1Bq+J0LxyMDwdUDMFKv2rA9BmGXrCd6q
	 1BsSzS3ZmyhIa2DNTujleiE7H6KbCloBhDDi49uj/7C1EJ0nhK7TkI9VKKSWiHqPHtuAT
	 6DjfcCDT2bd+oB/gCYQNfg6j+BmPZyTyQbPXhtXUE579cDRjpl8ebOaQwukpSvWZlpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5pWdZoEl;
	arc=none smtp.remote-ip=113.46.200.221
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C49606A881
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:04:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C49606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5pWdZoEl
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SHJZaWrKHNhHUqos5xpllk63Yn/OQUNoxKtkvNvJ2EE=;
	b=5pWdZoEltFxbPMoef/xATCGqmi8k3EEg2rfUtIrPI+OOlZLeirFHp/bDmS4djZZ9hnHU/g8xZ
	3JGhomXimyWBJ+DtzU4m1B3KenAr+nNEkhzZNpKFRfTj3j6M6Z0xvCJOxn7fgvfjgAJHSKnAzEy
	KcBPB26EM95gPqgrJYhS8Yw=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jTQ0H62HSzRhTB;
	Tue, 17 Nov 2026 21:03:43 +0800 (CST)
Received: from kwepemk200005.china.huawei.com (unknown [7.202.194.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E0AB140561;
	Tue, 17 Nov 2026 21:03:57 +0800 (CST)
Received: from [10.159.167.44] (10.159.167.44) by
 kwepemk200005.china.huawei.com (7.202.194.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 17 Nov 2026 21:03:57 +0800
Message-ID: <fd6919ff-393a-4d07-a138-e0d6d7ab0cdc@huawei.com>
Date: Tue, 17 Nov 2026 21:03:55 +0800
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
Subject: Re: [PATCH for drm-misc-fixes v4 2/2] drm/hisilicon/hibmc: Add a flag
 to indicate whether the OS-side driver has been loaded
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20261026060303.289737-1-shiyongbang@huawei.com>
 <20261026060303.289737-3-shiyongbang@huawei.com>
 <sashiko-outbox-184838@kernel.org>
From: Yongbang Shi <shiyongbang@huawei.com>
In-Reply-To: <sashiko-outbox-184838@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200005.china.huawei.com (7.202.194.71)

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/hisilicon/hibmc: unconditional enable flag set when DP init fails
> --
> 
> commit 9960ec3a8f045c4b7198b1788310aca553de0cc3
> Author: Lin He <helin52@huawei.com>
> 
> drm/hisilicon/hibmc: Add a flag to indicate whether the OS-side driver has been loaded
> 
> This commit adds a hardware register flag (HIBMC_ENABLE_STATE in
> HIBMC_ENABLE_FLAG) to notify the BMC when the OS-side driver is loaded and
> unloaded, preventing the BMC from enabling DP and triggering unhandled
> interrupts before the driver is ready. It also introduces a spinlock to
> serialize read-modify-write operations on the shared register.
> 
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> index df4501bb076bc..15583a2d1c6fd 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
> 
> [ ... ]
> 
>> @@ -460,6 +486,8 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
>>   		goto err_return;
>>   	}
>>   
>> +	hibmc_set_enable_flag(priv);
> 
> [Severity: High]
> Should hibmc_set_enable_flag() be called unconditionally here if DP
> initialization failed or if fewer than two MSI vectors were allocated?
> 
> In drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c, hibmc_kms_init() treats
> hibmc_dp_init() failures as non-fatal so that VDAC can still function:
> 
> 	ret = readl(priv->mmio + HIBMC_DP_HOST_SERDES_CTRL);
> 	if (ret) {
> 		ret = hibmc_dp_init(priv);
> 		if (ret)
> 			drm_err(dev, "failed to init dp: %d\n", ret);
> 	}
> 
> Meanwhile, hibmc_msi_init() either allocates 2 MSI vectors and registers
> hibmc_dp_interrupt and hibmc_dp_hpd_isr unconditionally, or succeeds with
> HIBMC_MIN_VECTORS (1) without registering the DP interrupt handler at all.
> 
> If hibmc_set_enable_flag() is called unconditionally in hibmc_pci_probe()
> and the BMC subsequently enables DP and triggers a DP interrupt:
> 
> 1. If hibmc_dp_init() failed before allocating priv->dp.dp_dev (or failed
>     in hibmc_dp_serdes_init() before clearing HIBMC_DP_INTR_ENABLE),
>     hibmc_dp_interrupt() calls hibmc_dp_get_hpd_status(&priv->dp), which
>     dereferences a NULL dp->dp_dev pointer in hard IRQ context.
> 
> 2. If hibmc_dp_init() failed during encoder or connector initialization,
>     priv->dp.connector.dev remains NULL, and the threaded handler
>     hibmc_dp_hpd_isr() calls drm_connector_helper_hpd_irq_event(),
>     dereferencing NULL.
> 
> 3. If pci_alloc_irq_vectors() only allocated 1 MSI vector, the DP interrupt
>     has no handler registered.
> 
> Would it be safer to only set HIBMC_ENABLE_STATE when DP has been
> successfully initialized and its MSI vector is registered?
> 

Okay, I will add a new state to record the DP initialization status and check
it when setting the flag.

Thanks,
Yongbang



