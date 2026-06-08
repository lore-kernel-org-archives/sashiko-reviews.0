Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6769635836A
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 05:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897112; cv=none; b=cZmA2tRkALxZzG/OOT5lPtq/3fhansqi6lne3MDEXdh7qEuW6n6x5VpQoAKGZt8/nkGpunTsnLgbs0OXXnd4iqqfZErUySt0vFhBPXnkd66S8jaVbxmIZFDoVNQf9+YeMbA4sb4ygEFQUiL5iqNeeXR7K1KChbXlYCtqiDh4vtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897112; c=relaxed/simple;
	bh=BppOv9GzsS/Jn7Nr8+oKKCF7ShPsa0n5I9VSa+nm0lw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GCNYrgAg8/T7DwJyPr4V3c4hi9y2r+lrfWKxyO3PY6TIx92RtZRn8i+vppDJlHwPfxgPU9nKkzaLgCalKzZG1b0IAbkGBCAtn+gaFl0k6WFa3n5HwUldLAaQldkpBrcKvtZ3GFOzp5Ri7v6HV3oWbv+HGoxcoSrB7ITKKRCFW+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgugIydG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWOYmuwS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgugIydG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWOYmuwS"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580GmvP2025142
	for <sashiko-reviews@lists.linux.dev>; Mon, 8 Jun 2026 05:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	heQ1GheVhTBTWp+6PCJ41yryWW9YBWE0HsasBwZGTc8=; b=XgugIydGheKBpvu2
	ofJnJVr7zPdeE7ys17kDktT4XjStr5uSiH6diK76tDaI+GMKn581gDKl92p6lB52
	IReTCDwhBPnuwc/z6QXLesFXlwdtb4P9uQJFV475cffYhqnX5T/YI/WZBWq+w4zo
	yJwAWkK1najdvB97BrlTBmWuYz+Z0Ze+p678PMdQ9oEFBdFrJ6A0tQ1GKp+Gd0qS
	pHGJO3AMXMACVPNuhu0nvWntKBP47TOsxxjfrutTI2ClOD5RO/prCdS7Msf7iS/2
	V3Zx8dYBcr/RZvRPzgJUJs0Wxj+sjbvu+ZvENd/XQcYVFh5lfsHoH4ihWw0krchl
	Cwlo9A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmre294-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 05:38:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36bba9b849dso3832198a91.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 22:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897109; x=1781501909; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=heQ1GheVhTBTWp+6PCJ41yryWW9YBWE0HsasBwZGTc8=;
        b=XWOYmuwSyT1VxG4xNqL8m+DZw1isPhmwGH9JAbECWDmrNAHJdkd3EwLfzQRlOngNA7
         MUx2b+lOWFM1DO1RecndWifbsZcTby861Tw64OxybOdw+ViEcKReRIbulxuAwOWaujy6
         9l0s5XOTsScjvej3IFqGdCIySiSTMOWqfvm8KRlyURmG2+6khyCIF01ywxg6iPN17uha
         6tEmYfc66bD2Kqn2Wm51tqDQsOyAgxEt+Eqq13pKMd2IyWFSMb38XDwDGVeeWx4e+QMq
         9nbBhM4RRn/Yhs0hNkTE8ygF47U0HumZAQnskh9W2wcvc8UZqeFlgQma4Ut+uT4M9epW
         tOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897109; x=1781501909;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=heQ1GheVhTBTWp+6PCJ41yryWW9YBWE0HsasBwZGTc8=;
        b=ka5iOYgQLyhbX2cixlAKGClLu9VIKhNyd243Kg9sF9SYM0x6/hIzC3BVTtSerdmVfF
         tlI6Lq4nwqY0bhBrqQ0dnHi6n+8bPF2rsiaIDMcCvFKT0M3BxLmHmb+SkmogdDVMe/Eh
         R7oKWSTzAWHwR5s8ysCsdZKOfAJEuqy0Vrq2EVyDb/5FBbP8kUZpOepMoRw8YPM5ptv/
         KmsFqlkx5OS/rYgsyLDNTsWHwgm2V7yxASwb99d2nEWn/zI4sJ7SRV2ikBMG7cRArdai
         ZSYThtCoky/EVSQzfJ+lTpdorZ2tHyrVEGGCoLwWKjQDdbGSYF12rwkcQkGis3ub9XRh
         rRWA==
X-Gm-Message-State: AOJu0YwtVCFs41udFIbDo8fa4nT46dNfqDwhA8zBNvmcmTyJJ7ehWM3l
	6fJ/l0tAF8hfjE8b2PypM33cPjmS7NvoXxJSfb2ssE7ut7KGmfeYCMkDQYRuB4S2cAYh7lFWAGi
	EZ+FW9HZ31ahU0l908c2/W2qTD2eIGQPpvO4as5GfiQxHCpuyHQPMuVN0SCUP13hwIxhsIzmlzW
	0KoMw=
X-Gm-Gg: Acq92OEJb3TOQ+wKfU5P3LpD3PV1dKFS23TPD8SAlCfllRKxC2Aisb2pgchTW9gJbq/
	WMWJLryuhQSHdL7TNMEURVrA/zlPH4T1VFI7qZ67ybRbra5UMGP4VB4mGNFODzO+/h9Rv6YNiL2
	Pl2UIu2PuBKl8PSqGSXTqUwpXe1sA7EP91EGyGhGJv1AlNGjkGjwKrDJCjU+QX7rqId1bBTQZ3L
	0H3w49/Uo8EKYAp2rpJqj4GZU6xagxoQSU52GOx0eysQqZ0YyBvWH2IM02rQG2IDIFRwsBeyXEE
	LSTbqDW7Al7dOnnPGHO9CFJv6ONKj02fpGrGWxfJFYjGrE2uY6NXzQi4xtgYk9e4iyuASNAmx4l
	7UN2Q5psx+V+BA5u0hKL48jYPmesUU1FahWiXyFN3hvPE1fdPIgSw2WkiCJ8NMi/B
X-Received: by 2002:a17:90b:54d0:b0:36e:2106:dedc with SMTP id 98e67ed59e1d1-370f0c5060fmr13843865a91.22.1780897109089;
        Sun, 07 Jun 2026 22:38:29 -0700 (PDT)
X-Received: by 2002:a17:90b:54d0:b0:36e:2106:dedc with SMTP id 98e67ed59e1d1-370f0c5060fmr13843847a91.22.1780897108663;
        Sun, 07 Jun 2026 22:38:28 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf827e6sm17548029a91.1.2026.06.07.22.38.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:38:28 -0700 (PDT)
Message-ID: <4f775a8a-ae97-53e8-f8f1-8b37e200911b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:08:24 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/12] media: iris: Add context bank hooks for platform
 specific initialization
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-4-afaa55d11fe0@oss.qualcomm.com>
 <20260603143600.87F901F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603143600.87F901F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OSBTYWx0ZWRfX4a8j7S+PIX6s
 0owiEcJVE44WmAKfaRud8SqOmELCCZ6zxBn5O9rIELXp69q66yEUgQxiroo6HlVSWPwOYZNYrqU
 WC9FFfXvA2Xo37M7BiKv5c76zgvSKVuT0jCvvh35IAPRmW/vGFUtifQps4KALr9qN0XUgi370Ba
 JBX39zLTazG4omua3alCTzDoMu1caQZ5N1ZMIzzZsu/Prjn6kcN8eqn7lo0x5uvS1VuKhIF6Cv7
 h+kM9Ae2sErUULGtapdkDLZpjdb2z4zIF92g/SK06JfJz/ONJIpZzPkCcb3wjS3REjIZ4GCl/bi
 JnJwjiT8njW2egrf5sAw7E4SYijzEC5ZmrjQyI0YG1xf6EbJIQK8pqYoBGewX9FPk2UoE/V+1io
 HYaMroHCw6fsM88/lD6d5Y2h9Z6mKvLeoI+1y0JkfOja63AKLgwxhnOC27d3SIj+SSln59o2urf
 hkj+dmk16gaqSiFmcbg==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a265556 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FEqDrzKljyI82_xno7EA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: eZMrQsVlqbjLvSr99olqoDJ9k7f2LclX
X-Proofpoint-ORIG-GUID: eZMrQsVlqbjLvSr99olqoDJ9k7f2LclX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080049


On 6/3/2026 8:06 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Concurrent calls to `iris_core_init` can bypass hardware initialization and use uninitialized hardware.
> - [High] Failure during `iris_wait_for_system_response` leaves hardware initialized and memory allocated without cleanup, leading to permanent DMA memory leaks on subsequent opens.
> --
>
> commit 378c8a359d3ed3242ace4eba3b25ac54fcc682b5
> Author: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>
>     media: iris: Add context bank hooks for platform specific initialization
>
> This patch adds initialization and de-initialization hooks for platform-specific
> context bank devices. These hooks are required for the glymur platform where
> Linux runs as the hypervisor and the driver must manually manage the firmware
> IOMMU mapping.
>
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
>> index 52bf56e517f91..89dbe9bbf6b0a 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.c
>> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> [ ... ]
>> @@ -58,10 +59,14 @@ int iris_core_init(struct iris_core *core)
>>  
>>  	core->state = IRIS_CORE_INIT;
> [Severity: High]
> This is a pre-existing issue, but does setting the state to IRIS_CORE_INIT
> here before initialization completes create a concurrency flaw?
>
> If a second thread calls iris_core_init() while the first thread unlocks
> core->lock and waits for the system response:
>
> drivers/media/platform/qcom/iris/iris_core.c:iris_core_init() {
>     ...
> 	mutex_unlock(&core->lock);
>
> 	return iris_wait_for_system_response(core);
> }
>
> The second thread would see core->state == IRIS_CORE_INIT and return 0
> immediately, bypassing hardware initialization and allowing user-space to
> issue ioctls before the hardware finishes booting.
>
> Can this cause firmware crashes or unhandled hardware states?

It's not introduced in this patch and it's pre-existing issue.
Will taken up as a separate post.

>>  
>> -	ret = iris_hfi_queues_init(core);
>> +	ret = iris_init_cb_devs(core);
>>  	if (ret)
>>  		goto error;
>>  
>> +	ret = iris_hfi_queues_init(core);
>> +	if (ret)
>> +		goto error_deinit_cb_devs;
>> +
>>  	ret = iris_vpu_power_on(core);
>>  	if (ret)
>>  		goto error_queue_deinit;
> [ ... ]
>> @@ -94,6 +99,8 @@ int iris_core_init(struct iris_core *core)
>>  	iris_vpu_power_off(core);
>>  error_queue_deinit:
>>  	iris_hfi_queues_deinit(core);
>> +error_deinit_cb_devs:
>> +	iris_deinit_cb_devs(core);
>>  error:
>>  	core->state = IRIS_CORE_DEINIT;
> [Severity: High]
> This isn't a bug introduced by this patch, but if
> iris_wait_for_system_response() times out, it sets
> core->state = IRIS_CORE_ERROR and returns -ETIMEDOUT. Since the VFS release
> is never called on an open failure, the queues and the newly added context
> bank devices remain allocated.
>
> When a second open() attempt calls iris_core_init(), it sees the ERROR state
> and jumps to the error label:
>
> drivers/media/platform/qcom/iris/iris_core.c:iris_core_init() {
>     ...
> 	} else if (core->state == IRIS_CORE_ERROR) {
> 		ret = -EINVAL;
> 		goto error;
> 	}
>     ...
> }
>
> At the error label, the state is simply reset to DEINIT without freeing any
> previously allocated resources like queues or cb_devs. A third open() attempt
> will see the DEINIT state and proceed with a full initialization, allocating
> new DMA memory and overwriting the old pointers.
>
> Does this permanently leak the previously allocated resources?

It's not introduced in this patch and it's pre-existing issue.
Will taken up as a separate post.

>>  exit:
