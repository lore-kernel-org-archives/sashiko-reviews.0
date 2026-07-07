Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26BB3DD504
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 10:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419335; cv=none; b=M/k1YHa0dDLvA6inqlt1KDI1DQitedl8TcuyanSFn/oTm5Ga275U7FA1Ed+BzbXxBcsE4qPkMUnUqYee8FfEe0OzxRnI0prXbCjabVMCQ8rwAVO6h7/CPOgMLV1zuFyW9rBOQJtLEgPq/gzODS1YONlbd7czN4va8qcSa/IdCGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419335; c=relaxed/simple;
	bh=1tk/upgsaJYwS65PF3VTqYUqof/+pSIPwJVVIVSs9aU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+eiKiAT2pqV/Gq1keSfkQYB/AzSahLfwty8at50jcJBIlyCPN1QhLxNNCvvl0XXmAuxgCvuVpu+Lc1YmOkmv8SosewnLvb8G8o3u6kFLTW0nt1y1wEXJscVAxUrYUCJecFfuNVq5gyRzntdt01cVRdTIX79Z4vq9wdzdagjli8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MQuNfbbv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPKxNJEe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MQuNfbbv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPKxNJEe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DlAA3138661
	for <sashiko-reviews@lists.linux.dev>; Tue, 7 Jul 2026 10:15:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	utLvZziuSambl+y9XEr31wpRmXka6gzmw01V+qISh20=; b=MQuNfbbvH78fheWc
	eqljI8a4vB5wRUoAfBkJ1MW+71SZX0C9TWThBR2UkHx3m7cWPSxK/rrrJkQwT+vq
	D33ZSciUg1ZN9T8A4oEU6+FCKUaChCS3Kk9AkCU+pBiy7AGWhou4K5U2kdrd1+XU
	w7ctxcqyOcHbwWGc8h8ghU2e6tjagG2cr+DpfuxpZJNhtatL5wSHu3JYBVmSSwmt
	Xj/N+7rnJ+McgBbw/SIKMtut+VPIT6SsyC/sRAde2C7feVrtxvixrg/1alLaPREG
	cqz6m3FUl27vYgrgsjVUUCppkLnsxmDKimoXNq99XefYOd8gdqnggxLCTpPRr7Wx
	XvOQTA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t159eky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 10:15:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8478e9c4bd2so4498295b3a.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 03:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783419331; x=1784024131; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=utLvZziuSambl+y9XEr31wpRmXka6gzmw01V+qISh20=;
        b=jPKxNJEe+ttuz9gtWxV82ZvuNZgTy4CEAXqa+PMt/dk9bNUqP5X9tijyNU2mBhQoPr
         1kA8Hq3wp5iioKaCwMg5El5xj/p72RCtZfK3M2ZMPWaLAXZa6I7aOMcRdoswH/w/QHIH
         OLf4/ag/kJiPWXSFVJQtuqrme06A7QTPndOiw4WD7ItY2XSqseaioscxnRsphAR7Lq3z
         mr4MxUDn9vya5PXtY1wTWeF+tC6r37pywExfNf4nU0UI0CsTE8QHcjqzFtPyNqubz7Sr
         XBo55o+F1D8un/Qm6wSunPcjqNlIK6cyMTViK3T0o1YANyXbFcPvpuJY/jEu5j6SDME8
         8bRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783419331; x=1784024131;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=utLvZziuSambl+y9XEr31wpRmXka6gzmw01V+qISh20=;
        b=mA1OPLd8mcGIo1mNYnheEnmGyH/ZXnRUHTBihq+o0j5ouheNR8nSDJqxELqFeQbfkv
         QQ+LCrAuU0L1n2/6ojdb7P87Drt+RiqFu9VJc0c9w/xiVquT1GxgbycFVfve9ZvubRHi
         AH7BNajFEgvqgM42/SCmsFf3mTED7290sw7TBXFgItiaCa2GfVyDmy156YmrAKJsClw0
         DealLMFpafnLszGIUIP3jOajclL1DbKroi1XbNlqzrVV9ttWt6J6BOzyvM9e753BuBfk
         TSnxKQQfRXt06Ihgd03EKCO7zFL/oV33lGImtXV8t/LZQDfoajDYJzNwgnVcA070dfsU
         jtiA==
X-Gm-Message-State: AOJu0Yyl+RnLgZpzJNP9MwoRj42C4WzoSQcpXGOoVaSpTvhCCVT1jjqu
	tgdOyPMQR65GygEPyPhOpEf+a/Un/wwJUtXnc0aJwxGCsUuirKhXgcJK0ysM7vwfV9+tG0TiA4J
	NEXjNVBkyis+UtkBZVLxnYprzul29gKZ05LWS/H8KU2oJUXBPSJ7r+LwHIzAkbQWmiiIOkU5vf1
	+4lyI=
X-Gm-Gg: AfdE7cmWAdR1TeTq991HP7OI6cuHuzOGj2z8fgqIkg2TIoAxHYjA4a0je3lRXRYCSH+
	ofWv8xTa7+/pGYg2l8VzoVKOLe+8U25v0tNqN2s68DqmG9XDWD6L2A1Edm7xwJ2TTnNv3Z7ocEE
	nhdRqgavWAsZTL5/Z3na1neI42+MIZU7fvhjzRYO629m6TzLSoTrNDUy3lUVBI7tcn1XC747APd
	hTcwQIVwxYGe5q8qczVnsMNW2LIi4QXP91/FLUVOtceGparf1Bl+wEfnNvl+TS8Y6GjHZ0vRFzv
	zLinMgvDaFy0XatJNoqsLcvsWJf55+4rQQH4kvHauf+pUoK7hE8OAPll91zSha72yKMQCQmKt8u
	9E6Ny5E+WmbLbWxYFlO/1/AUuOyaVinN0AT9tFJUE1EoK
X-Received: by 2002:a05:6a00:6f42:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-8482c2ec98emr2384928b3a.12.1783419330973;
        Tue, 07 Jul 2026 03:15:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:6f42:b0:848:2c2e:c79e with SMTP id d2e1a72fcca58-8482c2ec98emr2384900b3a.12.1783419330317;
        Tue, 07 Jul 2026 03:15:30 -0700 (PDT)
Received: from [10.92.162.241] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d76e0esm5100983b3a.41.2026.07.07.03.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 03:15:29 -0700 (PDT)
Message-ID: <517839de-767a-4f35-a130-ad008eda2886@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 15:45:27 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: qcom: bam_dma: Defer IRQ trigger type to
 device tree
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, Frank.Li@kernel.org, dmaengine@vger.kernel.org
References: <20260611-qcom-bam-dma-irq-trigger-v1-1-21c216e00b2a@oss.qualcomm.com>
 <20260611062838.CE8D01F00893@smtp.kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20260611062838.CE8D01F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BUhERdevIAWLZmy2fpSYA5A9p4yBh_Yw
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cd1c4 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=j-lP-nYXe62oYfzXaHYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: BUhERdevIAWLZmy2fpSYA5A9p4yBh_Yw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX2DUMIfSC/chB
 kVB1vFb54hV7WtwIq85Mwv+tRXCsN7eGmqHt5nxVgjFQCUqdZ5GCvS1G9L6Inovj3egfozXi9rd
 BJIDbxeGXtGK4pb+POZqrbusrnFfYSg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5OSBTYWx0ZWRfX5ksOSVoim6wW
 OTsN5XMSONLv5l5CgZypasasuzfQ5+/qnLj8VjQA6nciIpTTbhNwWwLN/GQGLZNBYBg15NOoouF
 k2/YnIJ+rPOTW7E0dVyM/W3daJsz5XTdDSbbVL4ss1bQBAKAYryHOvvDfZZTa7OM3/b1+cYnhLW
 lEsk+9oQXSu9D2gUe5lUWgFS9f5oPvmfivo1n4i7ZlGyDoaCkUgiVbNapTj0eOpgkVbmbRWrBO+
 0H56zCWG0EcTD7nmp25/qumUwrMF7DT0gRe9+E4Hkedq+CXWOFB8TsWl4zlSnDpymNHPBCk6nEz
 TeWNXgm9QFITpbF6K6e2zhy6EzGTljyltIsS+2ranQoyShUKyBwvQbddQtRnOYWwVL3ejRk/oCV
 Mwl+KUI+OUGEOSsfmt2QRh4cFQRYOJdJbiex03uF8x3VhEVvmJHqD69xwHx0u3UBJ48gKsVbq9F
 IUvbj6uKcIPwCZJJeKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070099


On 11-06-2026 11:58 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
>
> New issues:
> - [High] Allowing edge-triggered interrupts without a polling loop in the handler introduces a race condition that permanently deadlocks the DMA controller.
>
> Pre-existing issues:
> - [High] bam_dma_remove accesses hardware registers after forcing PM runtime suspend, leading to unclocked register accesses and system crash.
> - [High] The probe error path cleans up tasklets and disables clocks before freeing the interrupt, leading to a use-after-free and unclocked access race condition.
> - [High] The interrupt is requested before PM runtime is fully enabled, causing a permanent interrupt storm if an interrupt fires during probe.
> - [High] Failure paths after `pm_runtime_get_sync()` return without decrementing the PM usage counter, causing an unbalanced usage count and leaking DMA resources.
> - [High] The interrupt handler unconditionally returns IRQ_HANDLED even for spurious interrupts, defeating the kernel's spurious interrupt detection.
> --
>
> commit ee883954f4570a653a82ea860b70acc6baa4eada
> Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> Date:   Thu Jun 11 06:17:11 2026 +0000
>
> dmaengine: qcom: bam_dma: Defer IRQ trigger type to device tree
>
> This commit changes the hardcoded IRQF_TRIGGER_HIGH flag to
> IRQF_TRIGGER_NONE when registering the BAM interrupt. This delegates the
> trigger type configuration to the device tree, resolving missed DMA
> completions on platforms that use edge-triggered interrupts.
>
>> diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
>> index 19116295f8325..6c3e2ca8a572f 100644
>> --- a/drivers/dma/qcom/bam_dma.c
>> +++ b/drivers/dma/qcom/bam_dma.c
>> @@ -1303,7 +1303,7 @@ static int bam_dma_probe(struct platform_device *pdev)
>>   		bam_channel_init(bdev, &bdev->channels[i], i);
>>   
>>   	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
>> -			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
>> +			IRQF_TRIGGER_NONE, "bam_dma", bdev);
> [Severity: High]
> This delegates the trigger type to the device tree and allows edge-triggered
> interrupts.
>
> Does this regression introduce a potential deadlock if the hardware asserts
> a new completion before the previous interrupt is cleared?
>
> If bam_dma_irq() only reads the BAM status registers once per invocation,
> and a new completion arrives after the status register is read, the
> overall interrupt line might remain asserted.
>
> Because there is no new edge, the interrupt controller would never fire
> again.
>
> Should we add a loop to drain all pending events until the status register
> reads zero?

The patch does not force edge-triggered interrupts; it changes
IRQF_TRIGGER_HIGH to IRQF_TRIGGER_NONE so that the trigger type is taken
from the device tree and stops the driver from silently overriding that
configuration.

The edge-triggered race condition is out of scope of this change.

>
> [Severity: High]
> This is a pre-existing issue, but requesting the IRQ here before
> pm_runtime_enable() and pm_runtime_set_active() completes might cause an
> interrupt storm.
>
> If an early interrupt fires while the device's PM runtime status is still
> suspended:
>
> drivers/dma/qcom/bam_dma.c:bam_dma_irq() {
>      ...
>      ret = pm_runtime_get_sync(bdev->dev);
>      if (ret < 0)
>          return IRQ_NONE;
>      ...
> }
>
> Will pm_runtime_get_sync() fail and return IRQ_NONE without clearing the
> hardware interrupt, keeping the interrupt line asserted permanently?

All flagged issues are pre-existing and not introduced or worsened by this
patch. Bundling their fixes here would obscure the purpose of both changes
and complicate bisection.

>>   	if (ret)
>>   		goto err_bam_channel_exit;
> [Severity: High]
> This is a pre-existing issue, but does this error path create a
> use-after-free and unclocked access race condition?
>
> If a failure occurs later in probe, the error path manually kills tasklets
> and disables the clock:
>
> drivers/dma/qcom/bam_dma.c:bam_dma_probe() {
>      ...
> err_bam_channel_exit:
>      for (i = 0; i < bdev->num_channels; i++)
>          tasklet_kill(&bdev->channels[i].vc.task);
> err_tasklet_kill:
>      tasklet_kill(&bdev->task);
> err_disable_clk:
>      clk_disable_unprepare(bdev->bamclk);
>
>      return ret;
> }
>
> Since devm_request_irq() was used, the interrupt remains active until devres
> cleanup.
>
> If an interrupt fires in this window, will bam_dma_irq() access unclocked
> BAM registers and schedule a killed tasklet?
>
> [ ... ]
>
> [Severity: High]
> This is a pre-existing issue, but does bam_dma_remove() access hardware
> registers after they have been unclocked?
>
> During driver unbinding, pm_runtime_force_suspend() disables the BAM clock.
>
> Immediately after, the code writes to the registers:
>
> drivers/dma/qcom/bam_dma.c:bam_dma_remove() {
>      ...
>      pm_runtime_force_suspend(&pdev->dev);
>
>      of_dma_controller_free(pdev->dev.of_node);
>      dma_async_device_unregister(&bdev->common);
>
>      /* mask all interrupts for this execution environment */
>      writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
>      ...
> }
>
> Will accessing these unclocked peripheral registers generate an asynchronous
> bus fault and crash the system?
>
> [Severity: High]
> This is a pre-existing issue, but does bam_free_chan() leak the PM usage
> counter and DMA resources on failure?
>
> When pm_runtime_get_sync() returns an error, it still increments the PM
> usage counter.
>
> The failure path returns immediately:
>
> drivers/dma/qcom/bam_dma.c:bam_free_chan() {
>      ...
>      ret = pm_runtime_get_sync(bdev->dev);
>      if (ret < 0)
>          return;
>
>      vchan_free_chan_resources(to_virt_chan(chan));
>      ...
> }
>
> Does returning here without calling pm_runtime_put_noidle() permanently
> prevent the device from suspending, and skip freeing the channel resources
> leading to a memory leak?
>
> [Severity: High]
> This is a pre-existing issue, but does bam_dma_irq() incorrectly return
> IRQ_HANDLED for spurious interrupts?
>
> If no channel interrupts are found and the global BAM interrupt is not set,
> the handler falls through:
>
> drivers/dma/qcom/bam_dma.c:bam_dma_irq() {
>      ...
>      pm_runtime_mark_last_busy(bdev->dev);
>      pm_runtime_put_autosuspend(bdev->dev);
>
>      return IRQ_HANDLED;
> }
>
> Does this unconditionally return IRQ_HANDLED even for spurious interrupts,
> defeating the kernel's spurious interrupt detection and potentially causing
> an infinite interrupt loop?
>
