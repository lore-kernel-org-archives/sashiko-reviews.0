Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666620;
	b=HpVbhD8N3aXC65trKhPk+SMgYwU+IQYOzhZDRDRpa5EImX2u6qkJ/US56/Pjp55/DG3X
	 SVgiOfdsH9ha05FHw0dLHzNpHgGjUAYVfdSHwl+7f8vF9iYroqU8LXO0tcW10mTQPKduF
	 3TphxJFtSRKiCr3bTBhu52mRGGboFn61NzN9fxw24+sdJFsDSl53MX+TJghP1mRh2m5dl
	 y5qVEgT8dYBmSuSDhR1+/WIbum+o+A8ZkBUl4BNE93WvOtGbyfBucTJWLU/mkHboEkf4b
	 3xkM2XpM34m6QlHM0TyOinNAAf7woYOkhhqwT1Vy9NadH3DgqnNQ/KRQQ0GBrQN79Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+qUjfZRRveuY++xXlkQWRbDMXMpAPdgSRpEgB72Ewnc=;
	b=iqByd8ivQL6DTc89Sks5kQOB8A8WmwiwTjxt8yAA97vRO2enu9lIYgnZLi7q7wjsKuGt
	 7fO5imTcGZqigIe6MmhD5StvU4bfEhSxNh3G1v09UDMjjlaR7ML66PNGrm/12/Tn5dafl
	 gVMcCL5qTqvN37H6C/XIZjveZTQcRcq6Wamt8FNygHNYZkCVMD6/28+r+nxRNElQSIKNl
	 Sgqtl19oXeuGaMAoifOL/fdByfRfDFUTqUbVZjzp6zRWZXl1nmCF8IFlH/MhFz/Uq/ZkW
	 S7A1dnrtNrNviutjfn02CXry91WtP3g8Xqv2LvsiwV4svZIHJbqmI6KYhxliPh/GV/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gcoV1le+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYQy5ikV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64887606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 10:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64887606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gcoV1le+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GYQy5ikV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA05a23115450
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 10:56:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+qUjfZRRveuY++xXlkQWRbDMXMpAPdgSRpEgB72Ewnc=; b=gcoV1le+mfvgJjKC
	pXK7kkAfGq10QwvZnuZx/i3D82mzMt6MTvtiOqqe37JjSPhCcxUM+CKmZDeLH0YZ
	2e3STe7nohZ3vrYzuk6gB/rqdd4fXWtOJI0EbV1jL8NRGuHZRWzGj2JlQXKIJCOQ
	qln5cYAeLLupNVTZXdEJmZA4LUSy+YOuRr0EpqLhB4LdK3XhWUbsxUWb9aZWjJ58
	sPWVsr03KtsFBBmA/kJmWE9C6Q3uirx24ATKY9mZJy+CnFkjcaJbc+78VESVu1FP
	11K6jrwiepzTM2na+sKrhEaG97/Ec51U3neGE/xYetOLDDlxfDi+Zx3jPc0kI9LW
	qskT/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93btauf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 10:56:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cec4226c70so14855805ad.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792666617; x=1793271417; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+qUjfZRRveuY++xXlkQWRbDMXMpAPdgSRpEgB72Ewnc=;
        b=GYQy5ikVUV9AEzbpFyHtUQ0QRxkBsWZ5HB7zxdx+IwFvDlaeSzp1TWgL4AqtOb72VT
         GDcWU79WVhSLCMVR19Kqo8Ymxb9o3lg8yxC2BNeYdkiv+qnKOelG7w/fsv8BWVAllEKz
         ZVymiU4UeFimj9eK6TtU2BdIELiwhS1Ti41HbGGCKF3KPrTBJWNEaOe1Yg0TaMjsuGjP
         n5V31tJaS0Mc63ieMPPKMbbkqzeKq4GOud2m6ggkjxXUbTzclUllz7K9vVx9sQLVCsGA
         AOi5xuXNZdz5NuaKwsdFQTngOwTDpcKZR2YOZ6nX13ZZPCcUSlvkOt2Xb7tGH0zmn3A7
         9mEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666617; x=1793271417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qUjfZRRveuY++xXlkQWRbDMXMpAPdgSRpEgB72Ewnc=;
        b=DqbRisLf81kcEmlNd/ULfJQRI14XGQ8lnJX9Q3Qw/OBc306Y9nTdipMqg+PuCvYgTG
         XJx9CJfbApTtsYo1XxrPm1mCEpOYrz4cPEurTZQzGvMeyJ3jpyokSknpDCZxfmArF2+j
         iRjoROAkb0APS2IMYLzTLzDPBmdCqcW53uyCQec7MwvxyV0GsPIOWPYwhRfSPD4GoHLM
         KpcVGv4IJQ0Oo/qpmP2Nn+SSbKBYYpwe+m7VrLWGDnIGlW6kXisf8jAKxZ45qwZaYOBY
         XFIhEamqrA5FPyJsHRCmxA/6Au83fx8VvJOKJnHiYLQmcXmPyKZ65O9SfKW9e9mkmHlK
         LLvA==
X-Gm-Message-State: AFq9FYJ2kgNKsAFr3CePCLwR2lxK64+fiRVCTAQgbwWtAExSoxGu2frS
	i05FCXG1OH1Bw7UopTEHS10umcfmaOwW8gJpXupPYvqVrN6tP591EdEu3nEXGf6QWpLHE9F7Hlo
	919PSPQ9J+4KDuS3thav5gqYFpoE0VoMScgSselzUm+YhDbmTB/KJJoNkjfWs9q9Ec4PjmpRvM8
	R3OXc=
X-Gm-Gg: AYBFou0z6+eRcE5cGeEU71mF0BhuYSe0L8ZNWdrazIMBtgLj3aOoSwj+R0ofEuY2c5Q
	i4waJORkG7szZMHlU/CfCHQQfiItv5xbbjnJjjEWKcODUzbueF6Vnam78V51ba92NE0+LZOxWbd
	+OC04nYIfLhBBpKj2H5+jxbi4ji5qKQaVR8CIg9UZjnvnur8IAfwfl+iyvsufuitxOSHyX5Phzr
	gvNz3qyApZbve22foLUwmbuxISduCO05xJ/ql5dKICIgeIh5Z8xHeZNO3A2ZojPBQ+jqQvCx1zl
	YRv1FzRjkPq5/0X9IlgYzp00kFX8ivKJ67Ob+yDueoZAduzseu+yatSKr0iB7tq1M4QhGdsEz6v
	iNKp0zqhEHwcU32F0zrzLEVkR8wiOAAEd
X-Received: by 2002:a17:903:2ac7:b0:2e6:c39:b25b with SMTP id d9443c01a7336-2ea43e4f132mr35643915ad.14.1792666617459;
        Thu, 22 Oct 2026 03:56:57 -0700 (PDT)
X-Received: by 2002:a17:903:2ac7:b0:2e6:c39:b25b with SMTP id d9443c01a7336-2ea43e4f132mr35643625ad.14.1792666616662;
        Thu, 22 Oct 2026 03:56:56 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b49e5f6sm22117235ad.70.2026.10.22.03.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:56:56 -0700 (PDT)
Message-ID: <17d0f386-04ae-471e-8339-ad3e44fd2ee5@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:26:53 +0530
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
Subject: Re: [PATCH net-next v3 2/2] net: wwan: qcom_bam_dmux: Assign
 restricted DMA pool to remote processor
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20261021-qcom-bam-dmux-vmid-ext-v3-0-cedd1f681102@oss.qualcomm.com>
 <20261021-qcom-bam-dmux-vmid-ext-v3-2-cedd1f681102@oss.qualcomm.com>
 <sashiko-outbox-181101@kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-181101@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfXzZsJ5qmm9YV9
 KIww0RBaU/1XGC/j3kxPkqS8WUBjL6+SmwFhPEj07IaQOiDBUpY1Ws8EBVWmQH1tapHRGM+/q+b
 b+mpjaMV6UHTLdG9f5IDFFAj/1IzTj0=
X-Proofpoint-GUID: TK_yY-aE6ASAwoiBI4q2ttzUraRb1Haq
X-Proofpoint-ORIG-GUID: TK_yY-aE6ASAwoiBI4q2ttzUraRb1Haq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfXz9Zw52kJQv1r
 PbOazo141YzwI9F3o98O7+NTnupY50R2WmvKFuLr4hnu5TmMc8wI11LnRYEcU9VoIbdXaoWkvf6
 jnMkusFNuAu+K1OwHBdTedbyJ6eLl/pahyEM6keW7tzM0EnqLeLti0G/TsI3Chucu8JXyugGktR
 /b72vSolM4Z4Yrw5H7RfKtHJ+AEEqU5X+1TgizXSUR+6e+U3vYsWQFzchHYkYpRHrn60Skta52M
 SkDTAy03MaZ/JpP40RzkpHBqos69BrR3ohQ87HMcRN6AuAcXvUgj4EqzBh+jxRmv91t8NZgOyTK
 nmkupoeci0qJmJJKynuy4X8ZoWrY2+K0HpIuSrrwpsEXjaUqK6veZjUi8XLDCn5PqUUpZNhu1WF
 GQiiWjEYdlkeBS5qD5a1P4wDARZCew==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9ebfa cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=eIAiJ7D5M_aMgY5_KNUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220043

On 22-10-2026 12:10 pm, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] net: wwan: qcom_bam_dmux: race on remote_suspended in bam_dmux_remove()
> - [High] net: wwan: qcom_bam_dmux: UAF on register_netdev_work in bam_dmux_remove()
> --
>
> commit 122841a576cc339cc33ba7e25a1af2d9d591b2cb
> Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>
> net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
>
> This commit adds support for assigning a restricted DMA pool to both the
> local and remote execution environments via SCM when qcom,vmid is present,
> and reclaiming the pool for the local environment during probe failure or
> driver removal if the remote processor has suspended.
>
>> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
>> index cc6ace8d64371..fa3621224a56e 100644
>> --- a/drivers/net/wwan/qcom_bam_dmux.c
>> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> [ ... ]
>> @@ -829,8 +929,11 @@ static int bam_dmux_probe(struct platform_device *pdev)
>>   
>>   	ret = irq_get_irqchip_state(dmux->pc_irq, IRQCHIP_STATE_LINE_LEVEL,
>>   				    &dmux->pc_state);
>> -	if (ret)
>> -		goto err_disable_pm;
>> +	if (ret) {
>> +		/* The PC IRQ may already have powered up the RX path */
>> +		bam_dmux_remove(pdev);
>> +		return ret;
>> +	}
> [Severity: High]
> When irq_get_irqchip_state() fails in bam_dmux_probe() in
> drivers/net/wwan/qcom_bam_dmux.c (or during normal driver removal),
> calling bam_dmux_remove() cancels register_netdev_work and unregisters
> existing netdevs while dmux->pc_irq and the RX DMA channel can still be
> active:
>
> drivers/net/wwan/qcom_bam_dmux.c:bam_dmux_remove() {
> 	/* Unregister network interfaces */
> 	cancel_work_sync(&dmux->register_netdev_work);
> 	rtnl_lock();
> 	for (i = 0; i < BAM_DMUX_NUM_CH; ++i)
> 		if (dmux->netdevs[i])
> 			unregister_netdevice_queue(dmux->netdevs[i], &list);
> 	unregister_netdevice_many(&list);
> 	rtnl_unlock();
> 	...
> 	/* Try to wait for remote side to drop power vote */
> 	remote_suspended = wait_event_timeout(dmux->pc_wait, !dmux->rx,
> 					      BAM_DMUX_REMOTE_TIMEOUT);
> 	...
> 	/* Make sure everything is cleaned up before we return */
> 	disable_irq(dmux->pc_irq);
> 	bam_dmux_power_off(dmux);
> }
>
> While bam_dmux_remove() is waiting in wait_event_timeout(), incoming
> BAM_DMUX_CMD_OPEN packets on the active RX DMA path invoke
> bam_dmux_rx_callback() -> bam_dmux_cmd_open(), which schedules
> dmux->register_netdev_work again:
>
> drivers/net/wwan/qcom_bam_dmux.c:bam_dmux_cmd_open() {
> 	if (netdev) {
> 		netif_device_attach(netdev);
> 	} else {
> 		/* Cannot sleep here, schedule work to register the netdev */
> 		schedule_work(&dmux->register_netdev_work);
> 	}
> }
>
> Because register_netdev_work is not canceled and netdevs are not
> unregistered after disable_irq() and bam_dmux_power_off() stop the IRQ
> and RX DMA, can bam_dmux_register_netdev_work() run after
> bam_dmux_remove() returns, causing a use-after-free on the devm-allocated
> struct bam_dmux or leaving registered net_device instances pointing to
> freed memory?

This is a pre-existing issue in bam_dmux_remove() where the work has been
cancelled before RX is stopped. It is out of scope for this series, and can
be addressed in future as separate patch.

>
> [ ... ]
>> @@ -853,6 +957,7 @@ static void bam_dmux_remove(struct platform_device *pdev)
>>   	struct bam_dmux *dmux = platform_get_drvdata(pdev);
>>   	struct device *dev = dmux->dev;
>>   	LIST_HEAD(list);
>> +	bool remote_suspended;
>>   	int i;
>>   
>>   	/* Unregister network interfaces */
>> @@ -872,13 +977,21 @@ static void bam_dmux_remove(struct platform_device *pdev)
>>   	pm_runtime_set_suspended(dev);
>>   
>>   	/* Try to wait for remote side to drop power vote */
>> -	if (!wait_event_timeout(dmux->pc_wait, !dmux->rx, BAM_DMUX_REMOTE_TIMEOUT))
>> +	remote_suspended = wait_event_timeout(dmux->pc_wait, !dmux->rx,
>> +					      BAM_DMUX_REMOTE_TIMEOUT);
>> +	if (!remote_suspended)
>>   		dev_err(dev, "Timed out waiting for remote side to suspend\n");
>>   
>>   	/* Make sure everything is cleaned up before we return */
>>   	disable_irq(dmux->pc_irq);
>>   	bam_dmux_power_off(dmux);
>>   	bam_dmux_free_skbs(dmux->tx_skbs, DMA_TO_DEVICE);
>> +
>> +	/* The remote side may still access the pool if it did not suspend */
>> +	if (remote_suspended)
>> +		bam_dmux_reclaim_dma_pool(dmux);
>> +	else if (dmux->dma_pool_perms)
>> +		dev_warn(dev, "Leaving restricted DMA pool assigned to remote\n");
>>   }
> [Severity: High]
> In bam_dmux_remove() in drivers/net/wwan/qcom_bam_dmux.c,
> remote_suspended is sampled from wait_event_timeout(dmux->pc_wait,
> !dmux->rx, BAM_DMUX_REMOTE_TIMEOUT) before disable_irq(dmux->pc_irq)
> synchronizes with the threaded handler bam_dmux_pc_irq():
>
> drivers/net/wwan/qcom_bam_dmux.c:bam_dmux_pc_irq() {
> 	if (new_state) {
> 		if (bam_dmux_power_on(dmux))
> 			bam_dmux_pc_ack(dmux);
> 		else
> 			bam_dmux_power_off(dmux);
> 	} else {
> 		bam_dmux_power_off(dmux);
> 		bam_dmux_pc_ack(dmux);
> 	}
>
> 	dmux->pc_state = new_state;
> 	wake_up_all(&dmux->pc_wait);
> }
>
> If dmux->rx is NULL when wait_event_timeout() checks !dmux->rx (for
> example, if bam_dmux_pc_irq() was just triggered during the
> bam_dmux_probe() error path or during removal and has not yet set
> dmux->rx in bam_dmux_power_on()), wait_event_timeout() returns
> immediately with remote_suspended set to true.
>
> Before disable_irq(dmux->pc_irq) finishes waiting for the running IRQ
> thread, bam_dmux_pc_irq() can complete bam_dmux_power_on(dmux) and send
> bam_dmux_pc_ack(dmux) to the remote processor. Then bam_dmux_power_off()
> tears down dmux->rx locally without a remote power-down handshake, and
> bam_dmux_remove() still sees the stale remote_suspended == true and calls
> bam_dmux_reclaim_dma_pool(dmux) while the remote side is active.
>
> Conversely, if wait_event_timeout() times out while bam_dmux_pc_irq() is
> in the middle of handling a remote power-down edge, disable_irq() waits
> for bam_dmux_pc_irq() to finish calling bam_dmux_power_off() and
> bam_dmux_pc_ack(), but remote_suspended remains false and the DMA pool
> is never reclaimed.
>
> Should remote_suspended be re-evaluated (for example, checking !dmux->rx)
> after disable_irq(dmux->pc_irq) returns and before bam_dmux_power_off()
> clears dmux->rx?

Agreed. I plan to sample the state after disable_irq() in the next
revision, so a running PC IRQ handler is accounted for in both cases like below:

if (!wait_event_timeout(dmux->pc_wait, !dmux->rx, BAM_DMUX_REMOTE_TIMEOUT))
  dev_err(dev, "Timed out waiting for remote side to suspend\n");

/* Make sure everything is cleaned up before we return */
disable_irq(dmux->pc_irq);
/* The PC IRQ handler cannot run anymore, so dmux->rx is stable */
remote_suspended = !dmux->rx;
bam_dmux_power_off(dmux);


Does this look reasonable, or would another approach be preferred?


Thanks,
Vishnu

>
