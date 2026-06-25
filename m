Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FEF2F12A5
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782395522; cv=none; b=neCcOaE8dq4GPuRi8Et+/e6n9L/KSOPCjuyMhlsKyo3AfORn4Kfay7UQ67FLR+EspR4y9mLf1fE3C6CihHBkccviE8kwiYppK0rPzYBYAE4SdJ5TYnTUK8SllJ5bH7HNR6c1SeeJJEhZXklsJYWM6UROLpv/lf3jS/YDMCtwoBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782395522; c=relaxed/simple;
	bh=Bjxr+4mfKTQzWGBzmLxiJd+H8nda57/CH5sqXEPImo0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPoeE8cWFPh+mGcJ1arNOeWzlfa1ZeR7egneNMgPwBM0IjMvRM+ZkOUSrDc0hPrZzQ1716bjkSQxd/XjKH4keHXP/8F+6DmXvO5oAF2RrOx2B6R52FmrF15kLyhP2Usiil1is0dtftKSLUz/6D0ECA8CGNSfMdchY1VZ2M4JDrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iSdXcfZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPfMtvAy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iSdXcfZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPfMtvAy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9juZp1470515
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 13:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5bTOU+fXDMhTsxkaKQIVuhRSGC9WNFr8Q8hspqtwVoM=; b=iSdXcfZSDFD2be2h
	iMMUbAdJmmX/s6eyJMSydPk1SPRfiKaEUnzg3NRZ1BSIuMCDEzygBekLjEsQccT5
	DXBizfBXRwqseRLWIZ4e0gP7KvlbV5w5G/lZsxflggoRbGBY9ssWeDx+J9AxU1Tw
	F0V98jT6qs6iNkNKXCnlrrv6JtJLdjRPRznhjj6A3WzuaGST2C2WGQNig86JOngu
	SZ3+dzFOQhD5j7LpNsPylnj7n5JCn9JdDZktzl7tRtK1mBdS3ra0esxJBjmxwAu9
	ZqaWSrogYwiIZhqa0awkSTPHOv24Tkx2wxLX0XKFjPSQQZAerWJ3IfTFS+YokSIQ
	ftHgVA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7kjhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 13:51:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c90101fb3deso1449727a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 25 Jun 2026 06:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782395519; x=1783000319; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5bTOU+fXDMhTsxkaKQIVuhRSGC9WNFr8Q8hspqtwVoM=;
        b=LPfMtvAyYa3x3pK7qiOfn2lPCWCXP0hSyzM77lv9Ndn+tHCOdeviCtkdN569Yi/5jv
         8L3RdqSL9KFnVkg2AtecD2E0J5dnaMDAI7Uq1muKVeIbnqIVNb2wckuj0DprbBpJ0pd6
         8k6ZeQ409Vn7dCV8DAFeTA04zgO7g+/ivgsV1TVKVYonqsxoKKq1OTx4rz6ZwZNoYU20
         tGteSVCw4GUoieejfwEwPPaBW274kREacoUm4Q+iLZ/xibLyfh4vRP4NV3ICxvSDST07
         frpQBLHPzSYpRd1L+4vDureKutPGWa7SuRa6WwY4WKbygNAcbdwQ24VwZM5jCM0kkqG/
         /w9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782395519; x=1783000319;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5bTOU+fXDMhTsxkaKQIVuhRSGC9WNFr8Q8hspqtwVoM=;
        b=l0VzhAFGdzlKEPpApVo2Zx72SgC/DFPMhHWZngZooMMcJXlfFveS9IBEOUjZOjEVa3
         tebXpDYxpRB1miUDrG8BFN+QWXSyhk/jTRRxag7C1PHpBTuDkVF2Hbej1cvpvp4xid0Q
         G2/a8Piljs9YrHQtp5v1pjpOCyj2hB0e4/ykYyQ7PUvoAVIc+M2jcwnd8o0eahzxB8Hd
         Ab+P5vPofvnqvA0UORqGlxx+x9+AeAkRWg1KF3mZDyA+fDEk34JHf/xtlNJnUslgM357
         XXPzndyOExcIIBePekIT2M23CdyGxHnXkwcud18fHRbL5yxliPQbAoeu7tCMqQlMnd/R
         q4nA==
X-Gm-Message-State: AOJu0YyXJEeByOL0VTyfau2qdG+rLX7csOlgKIub1Bl4qnFYhELugKml
	cHAXW0l0X0Ym7w3uq+fthfj9YyioYjd2efuzR5ALojv0XxHOZGfa4Pn3DNUZC0Niemww75mAcYj
	ViYevl9L3Y7TCyhaMFZqWXExbYB92KWpFzxPH0sgYHf+746wrNn6B7IXKdxpBQfn4H7+Yq1micJ
	oc7zmh1w==
X-Gm-Gg: AfdE7cl23u8a5dVI/Fw89vKUhiQUhTpLFUZ3006kU7A/YKs+ZG+XflRiPD0iFkZSVcI
	kv3vE1BbGIOdAT522wKW98dabXXLtW1CI12LCvGhKjf423Hm+gRnMJkCybwzB8sAE7gw7s5e9jv
	xfz7qwvr3MXiitCo7TrfhWARfnJ6kTTYGgTw1HhAuNr7E6WkaXLpfYDg77OgutK4vSRLvXU2UWq
	56SC8FWGIZYoB7rw6H42nELY8R2k1jJPTkCAn6NlAn68R0T1F325dYJludcsY1FZcbrbbaWSc7+
	xpI8NsEnRMTpL5gDTXFp514I1I+D8pqQB+4qiV9//JL0GV7u4RB5gQX9Ny7FGrJf2JqPNDh4Fad
	xgzv9VzI5NBcYHPZU02I7qSq90SYvqCI1vT5UX1zR3fl4ke4LPQB0dMMxW+xL+iuPmKSkqOx473
	I=
X-Received: by 2002:a05:6a20:918c:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-3bd4af58807mr3210543637.12.1782395518558;
        Thu, 25 Jun 2026 06:51:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:918c:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-3bd4af58807mr3210506637.12.1782395517927;
        Thu, 25 Jun 2026 06:51:57 -0700 (PDT)
Received: from [10.133.33.96] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c92bcb9c14asm1706128a12.24.2026.06.25.06.51.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 06:51:57 -0700 (PDT)
Message-ID: <36cb9fa9-2527-4e24-8c4b-dd3d57c0df27@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 21:51:51 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 6/7] coresight: ctcu: enable byte-cntr for TMC ETR
 devices
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260625-enable-byte-cntr-for-ctcu-v19-0-8fbbf22e8381@oss.qualcomm.com>
 <20260625-enable-byte-cntr-for-ctcu-v19-6-8fbbf22e8381@oss.qualcomm.com>
 <20260625110924.BA8EA1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260625110924.BA8EA1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDExOSBTYWx0ZWRfX5MlIN6GzYlbt
 fBMuTGYhLbhhmsu5UOAP1wX+3amnxqqRZviJNCdzwiuDLOi0Qamuggk4eOrtVmSaFdrygt7eV3T
 oTFW9DVUJkM04B7gZsNvleqSZ1YCH0Q=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3d327f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mtuFwQZHmCstQ3Yjy2oA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: y940Sk4DX27OiUD0ti2t0ig6weyRsa5e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDExOSBTYWx0ZWRfX2ojU0WuS9nT9
 K5BZWMK+SUd8u/vV2OIr3GYy6RaOPlZUCF1GCDK7OrskKrpjASPFEjpOk/7NKRjArJriEx45cjv
 0QkviSs9Z3QwVd81FHhjDk3kkbpWfS39Js/JmobZgU9+T28Pd4/eovn4n9XAg3hSXohYFkozHu1
 Ta+TC9h+7OxPrvcxAZegcnqEEN0aLTJE5SBt8F+PHLmFov1VJdIVj2px4+jd9Bm0mfutE10PrMe
 c+9oPIPMOHEVtINrZswDYcxXcNobX0pXVYEjD64+UD802SfuTEA8EwTLc/ZEh5gyvVDu+wi8Vm4
 uHkL+22l9vjYKeY9zlm3QmjAyclwRrbKdlx09ya90Pu/k4SULOcuoVNaR1mxlG8HAP0STJisyOm
 Z8lBF72jwGf8wfVG5zFzyfH2MszPbnL7knIa6jerbbkeUEtE2qxkuhTv06ghQztj+/dJr+wsC95
 upypfZYlNuWtll88Ykg==
X-Proofpoint-GUID: y940Sk4DX27OiUD0ti2t0ig6weyRsa5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250119



On 6/25/2026 7:09 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 11 potential issue(s) to consider:
> - [Critical] Global function pointer accessed locklessly leads to Use-After-Free on driver unload
> - [Critical] Global sysfs ops pointer triggers NULL pointer dereference on ETR without CTCU
> - [High] Driver remove/unbind blocks indefinitely waiting for userspace file closure
> - [High] ctcu_byte_cntr_stop() skips setting enable=false for SYSFS mode, causing infinite read hangs
> - [High] TOCTOU race re-enables ETR hardware after framework disables it
> - [High] Missing wake_up() in error path deadlocks driver remove()
> - [High] Unsynchronized checks of irq_enabled lead to resource leaks and driver unbind hangs
> - [High] Data race on concurrent read() calls causes NULL pointer dereference
> - [Medium] Spurious Interrupt Handling due to missing hardware status check in shared IRQ
> - [Medium] Error codes (-ERESTARTSYS) from byte_cntr_ops are swallowed and convert to EOF
> - [Medium] Masked error code breaks sysfs reading fallback on memory failure
> --
> 
> commit 128ffef0065b7b8a8c73e5e3f9b0ce8bebea0593
> Author: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> coresight: ctcu: enable byte-cntr for TMC ETR devices
> 
> This patch introduces the byte-cntr function provided by the CTCU device to
> transfer data from the ETR buffer to userspace. It sets up an interrupt
> handler to track data size thresholds and switches buffers when full or on
> timeout. It also integrates with the TMC ETR framework via sysfs ops.
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
>> new file mode 100644
>> index 0000000000000..5ab97a71f02f6
>> --- /dev/null
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-byte-cntr.c
> [ ... ]
>> +static irqreturn_t byte_cntr_handler(int irq, void *data)
>> +{
>> +	struct ctcu_byte_cntr *byte_cntr_data = data;
>> +
>> +	atomic_inc(&byte_cntr_data->irq_cnt);
>> +	wake_up(&byte_cntr_data->wq);
>> +
>> +	return IRQ_HANDLED;
>> +}
> 
> [Severity: Medium]
> Is this handler missing a hardware status check?
> 
> Since the IRQ is registered with IRQF_SHARED, another device sharing the line
> could fire an interrupt. By unconditionally returning IRQ_HANDLED without
> verifying the interrupt source, the kernel's spurious interrupt detection
> might be suppressed, and the CTCU buffer switch logic could be triggered
> prematurely.

Although the driver requests the interrupt with IRQF_SHARED, the 
underlying hardware/DT topology provides a dedicated IRQ line on 
supported platforms. So, no other interrupt sources are present, and the 
handler can safely treat all interrupts as CTCU byte-cntr events.

> 
> [ ... ]
>> +static struct ctcu_byte_cntr *ctcu_get_byte_cntr(struct coresight_device *ctcu,
>> +						 struct coresight_device *etr)
>> +{
>> +	struct ctcu_drvdata *drvdata = dev_get_drvdata(ctcu->dev.parent);
> 
> [Severity: Critical]
> Could this dereference a NULL pointer if an ETR without a connected CTCU
> is used?
> 
> If the system has multiple ETRs and one lacks a CTCU, the globally registered
> byte_cntr_sysfs_ops might pass a NULL ctcu pointer here. This would cause a
> panic when ctcu->dev.parent is accessed.

This scenario assumes an invalid hardware topology. Byte-cntr 
functionality is only applicable when an ETR is connected to a CTCU via 
the CoreSight graph. tmc_etr_get_ctcu_device() discovers the CTCU using 
this hardware/DT linkage. In the absence of such a connection, no 
byte-byte path exists. Supported platforms guarantee this connection for 
byte-cntr capable ETRs; therefore, the reported NULL-CTCU case is 
outside valid configurations.

> 
> [ ... ]
>> +static bool ctcu_byte_cntr_switch_buffer(struct tmc_drvdata *etr_drvdata,
>> +					 struct ctcu_byte_cntr *byte_cntr_data)
>> +{
> [ ... ]
>> +	raw_spin_unlock_irqrestore(&etr_drvdata->spinlock, flags);
>> +
>> +	/* Restart the ETR once a free buffer is available */
>> +	if (found_free_buf &&
>> +	    coresight_get_mode(etr_drvdata->csdev) != CS_MODE_DISABLED)
>> +		tmc_etr_enable_disable_hw(etr_drvdata, true);
>> +
>> +	return found_free_buf;
>> +}
> 
> [Severity: High]
> Does this lockless check introduce a race condition?
> 
> If a concurrent operation disables the trace session and drops the lock before
> setting the mode to CS_MODE_DISABLED, this code might incorrectly re-enable
> the hardware after the framework has explicitly disabled it.
> 

Disabling the trace session implies that the ETR is already disabled in 
the byte-cntr read flow, in which case the switch-buffer function cannot 
be entered.
The only possible scenario is that ETR becomes disabled in the middle of 
a buffer switch operation. However, the code explicitly checks the 
CoreSight mode (CS_MODE) before re-enabling ETR, ensuring that it is 
only re-enabled when appropriate.

The byte-cntr read path drains the ping-pong buffers regardless of 
whether the ETR is enabled or disabled.

> [ ... ]
>> +static ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *etr_drvdata, loff_t pos,
>> +				      size_t len, char **bufpp)
>> +{
> [ ... ]
>> +	pos = byte_cntr_data->buf_node->pos;
>> +	sysfs_buf = byte_cntr_data->buf_node->sysfs_buf;
>> +	actual = tmc_etr_read_sysfs_buf(sysfs_buf, pos, len, bufpp);
>> +	if (actual <= 0) {
>> +		/* Reset buf_node upon reading is finished or failed */
>> +		byte_cntr_data->buf_node->reading = false;
>> +		byte_cntr_data->buf_node = NULL;
> 
> [Severity: High]
> Can concurrent read operations cause a NULL pointer dereference here?
> 
> If two threads read from the same ETR file descriptor, they could concurrently
> access and modify byte_cntr_data->buf_node without serialization, causing one
> thread to clear the pointer while the other is still using it.
> 

Byte-cntr supports a single active read session. This is enforced via 
byte_cntr_data->reading in tmc_read_prepare_byte_cntr(), with concurrent 
open attempts returning -EBUSY. The buf_node is exclusively owned by 
this session and cleared during unprepare. The reported race assumes 
unsupported concurrent consumption of the same session.

> [ ... ]
>> +static int tmc_read_prepare_byte_cntr(struct tmc_drvdata *etr_drvdata)
>> +{
>> +	struct coresight_device *ctcu = tmc_etr_get_ctcu_device(etr_drvdata);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +	unsigned long flags;
>> +	int ret = 0;
>> +
>> +	/* byte-cntr is operating with SYSFS mode being enabled only */
>> +	if (coresight_get_mode(etr_drvdata->csdev) != CS_MODE_SYSFS)
>> +		return -EINVAL;
>> +
>> +	byte_cntr_data = ctcu_get_byte_cntr(ctcu, etr_drvdata->csdev);
>> +	if (!byte_cntr_data || !byte_cntr_data->irq_enabled)
>> +		return -EINVAL;
>> +
>> +	raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
> 
> [Severity: High]
> Does checking irq_enabled outside the spinlock create a race?
> 
> A concurrent sysfs write could set irq_enabled to 0 immediately before the
> lock is acquired. If reading is then set to true, read_unprepare() will later
> abort early upon seeing irq_enabled is 0. This would leak the buffer list and
> leave reading permanently true, causing the driver unbind to hang forever.
> 

irq_enabled serves as a configuration gate prior to starting byte-cntr 
and is not a runtime control for active sessions. Once prepare succeeds, 
operation is governed by enable, reading, hardware registers, 
waitqueue/timeout, and buffer state. Sysfs prevents modification after 
reading is set, and toggling irq_enabled during an active session is not 
a supported use case.

> [ ... ]
>> +	byte_cntr_data->reading = true;
>> +	raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
>> +	/* Setup an available etr_buf_list for byte-cntr */
>> +	ret = tmc_create_etr_buf_list(etr_drvdata, 2);
>> +	if (ret) {
>> +		byte_cntr_data->reading = false;
>> +		return ret;
>> +	}
> 
> [Severity: High]
> Is this error path missing a wake_up() call?
> 
> If this allocation fails, the reading flag is cleared, but concurrent readers
> waiting in the driver's remove function won't be notified, potentially
> deadlocking the unbind process.
> 

No wakeup is required in this case. Allocation failure occurs before 
establishing any byte-cntr read session. The prepare function returns 
failure to TMC open, meaning no reader exists. wake_up() is only 
necessary for active sessions that need to be terminated or completed, 
not for failed prepare paths.

> [ ... ]
>> +void ctcu_byte_cntr_stop(struct coresight_device *csdev, struct coresight_path *path)
>> +{
>> +	struct coresight_device *sink = coresight_get_sink(path);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +
>> +	if (coresight_get_mode(sink) == CS_MODE_SYSFS)
>> +		return;
> 
> [Severity: High]
> Should the enable flag be cleared for SYSFS mode here?
> 
> By returning early, enable remains true. Readers waiting in
> tmc_byte_cntr_get_data() might never receive the EOF condition when the
> trace is stopped, causing them to loop indefinitely.
> 

The early return is intentional. In SYSFS mode, ETR remains enabled and 
byte-cntr may actively serve the read path. Forcing enable=false in this 
state would prematurely terminate the read session and disrupt trace 
transfer. The enable=false transition is reserved for teardown paths 
(e.g., CTCU removal or non-SYSFS disable).

>> diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> index e8720026c9e3f..2da1a6f3d29f4 100644
>> --- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
> [ ... ]
>> +static void ctcu_platform_remove(struct platform_device *pdev)
>> +{
>> +	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
>> +	struct ctcu_byte_cntr *byte_cntr_data;
>> +	unsigned long flags;
>> +	int i;
>> +
>> +	if (WARN_ON(!drvdata))
>> +		return;
>> +
>> +	/*
>> +	 * Signal all active byte-cntr readers to exit, then wait for them to
>> +	 * finish before resetting the ops pointer and freeing driver data.
>> +	 * Without this, a reader blocked in wait_event_interruptible_timeout()
>> +	 * would access the freed ctcu_drvdata wait-queue head (use-after-free).
>> +	 */
>> +	for (i = 0; i < ETR_MAX_NUM; i++) {
>> +		byte_cntr_data = &drvdata->byte_cntr_data[i];
>> +		raw_spin_lock_irqsave(&byte_cntr_data->spin_lock, flags);
>> +		/* Set enable=false for all ports to signal teardown to racing readers */
>> +		byte_cntr_data->enable = false;
>> +		if (!byte_cntr_data->reading) {
>> +			raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
>> +			continue;
>> +		}
>> +		raw_spin_unlock_irqrestore(&byte_cntr_data->spin_lock, flags);
>> +		wake_up_all(&byte_cntr_data->wq);
>> +		wait_event(byte_cntr_data->wq, !byte_cntr_data->reading);
>> +	}
> 
> [Severity: High]
> Could this wait indefinitely during driver remove?
> 
> The reading flag is only cleared when the userspace file is closed. A
> userspace process leaving the file descriptor open could permanently block
> module unload or device unbind.

This behavior is expected and not a driver defect. During removal, 
ctcu_platform_remove() sets enable=false and wakes byte-cntr readers, 
releasing blocked reads from the wait queue. Any remaining wait 
corresponds to userspace retaining open TMC file descriptors. The kernel 
cannot forcibly close user file descriptors without violating lifetime 
rules; thus, waiting ensures that CTCU state is not freed while still 
potentially referenced.

> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> index 2b26ce6455a7b..e78f8891f11e0 100644
>> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
>> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> [ ... ]
>> +ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
>> +				loff_t pos, size_t len, char **bufpp)
>> +{
>> +	ssize_t ret;
>> +	const struct tmc_sysfs_ops *byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
>> +
>> +	if (byte_cntr_ops) {
>> +		ret = byte_cntr_ops->get_trace_data(drvdata, pos, len, bufpp);
>> +		/* Return the filled buffer */
>> +		if (ret > 0 || ret == -ENOMEM)
>> +			return ret;
>> +	}
>> +
>> +	return tmc_etr_read_sysfs_buf(drvdata->sysfs_buf, pos, len, bufpp);
>> +}
> 
> [Severity: Medium]
> Does this silently swallow -ERESTARTSYS?
> 
> If a signal interrupts the wait inside tmc_byte_cntr_get_data(), it returns
> -ERESTARTSYS, which falls through here to a normal sysfs buffer read. This
> might convert the signal into an EOF or return unsynced data instead of
> letting userspace handle the signal cleanly.
> 

This is intentional. Byte-cntr operates as an optimized read path 
layered over the existing TMC sysfs read. If byte-cntr does not yield 
valid data, the implementation falls back to the generic TMC path. As 
such, propagating -ERESTARTSYS to userspace is unnecessary; it simply 
results in bypassing byte-cntr for that read attempt.

> [ ... ]
>> +int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
>> +{
>> +	int ret = 0;
>> +	unsigned long flags;
>> +	const struct tmc_sysfs_ops *byte_cntr_ops;
>>   
>>   	/* config types are set a boot time and never change */
>>   	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
>>   		return -EINVAL;
>>   
>> +	byte_cntr_ops = READ_ONCE(byte_cntr_sysfs_ops);
>> +	if (byte_cntr_ops) {
>> +		ret = byte_cntr_ops->read_prepare(drvdata);
> 
> [Severity: Critical]
> Is it safe to access this global function pointer locklessly?
> 
> If the trace file is opened and the CTCU module is concurrently unloaded, the
> memory backing byte_cntr_ops could be freed before read_prepare() executes,
> leading to a use-after-free regression.
> 

The reported use-after-free is not substantiated. byte_cntr_sysfs_ops is 
registered during CTCU probe and reset during CTCU remove. Existing 
byte-cntr readers are first signaled with enable=false, then woken and 
fully drained before the CTCU state is freed. After unregister, new 
callers observe NULL ops and fall back to the standard TMC read path. As 
such, this concern conflates global ops registration with an actual 
post-remove data/session UAF, which does not occur.

>> +		if (!ret || ret == -EBUSY)
>> +			return ret;
>> +
>> +		ret = 0;
>> +	}
> 
> [Severity: Medium]
> Why are errors like -ENOMEM from read_prepare() masked here?
> 
> If the memory allocation fails inside tmc_read_prepare_byte_cntr(), hiding the
> error breaks the fallback sysfs reading path, leading to delays and hanging
> operations instead of propagating the failure properly.

This is an intential fallback design. Byte-cntr is an optional 
enhancement to the generic TMC ETR sysfs read path. When prepare fails 
for reasons other than an active session (-EBUSY), the driver falls back 
to the generic read-prepare path. Masking non--EBUSY errors is therefore 
intentional and not indicative of a defect.

Thanks,
Jie

> 

