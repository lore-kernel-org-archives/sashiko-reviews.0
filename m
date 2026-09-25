Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B724C8C5A
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790349099; cv=none; b=H82o7XmiDh4ntDn9YDBOyNUlMtXP8+RhwnaOw7x0pHcoO+XOrqmmGrOWGz2VxzMgbtEt21WIqZe7gmccNpM3l/WGfF25x/I8Oz0l8uRuNfepgegZq1h5Ll5KrxKH6QCYyzEYcfsJ6gxWbiV3nciVmi3+1i9+9Wbu3U3DBJVOlXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790349099; c=relaxed/simple;
	bh=U9e2cTWg4RU+oVRUNia0elOPmEX6VJ2HYr4MJMEV9RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1s+9SwPQvd/CiyIKLzIdYzlyv76g7D42Cro7Op2XJFV1vlqKWGmifnfFPG6yAFSBvEfUtwvXHm2vtlRkVs7/9yEnW/eI7TQxTQozrgAB/pDhj6Ta5vQJygHAzw+nudfnu4DheGD9c2sVKSSKCydiF0x6lgpu3J3EXaEKWh0tYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JZibYLSx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j98A3ejH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JZibYLSx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j98A3ejH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PD7aow209928
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGVgNcQx8oJT/2gbfw0v3WXm6aB9A/KYFngS34SqQHE=; b=JZibYLSx2Ma1Hcyi
	NqkgDZv/fQDRcOeaA+bXcSAEgvMntHxFvoBGZaNzNkqhxXbnZ+kyJU7E3z7I49cJ
	xNSqaHFTins42aNaVp6/4WgxxxzQnM1P03ct+pIwVSdXAUTW0zUF/BsCCmo3UhX6
	y3q2yEXFsGT0L57wdyZejr2i7+sFClPO14kbLbJFYerGVu+jAi6gLozi8dZFtZrt
	c+4sxEAMZNNmsR+sJPxBDWcrr8nvc1O9/YofKhqK8IJ1gtoWTgKqCnFBXLCU9JIl
	pnIzfrp9A+ALYg6foKOFT8RzsYAQXraDtFpxTd9pNSBuxtgC8V5ow6EeD9M3IUZt
	dNBiSA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898v2kt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 15:11:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7930cb5cd3aso750200137.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 08:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349079; x=1790953879; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGVgNcQx8oJT/2gbfw0v3WXm6aB9A/KYFngS34SqQHE=;
        b=j98A3ejH9Jt4QHFB+BA9xVW1djMhAguPTdHmdsGx5K6D0QNertFPki3ux9LSHxqgZO
         UQpR9Ld9nKPB7x6zx3gRNKuLpX9bzvcNw8sZog/c9RKg85S+zB0I9O9cHHTHPhhzDAtP
         TDMKHkbRq+SIjVJ+8sIyem++O/SJ+706nqGn49O7M2oLKgRn77TXtkjydQubj5UwXO5x
         pm1QyYNtNlyIuLgGAadYe82ApcfMvJhMrhk+TpGIn5aCgB4qK5+zx6/3iStdujRYi6Nw
         oH6tPTtCHiV6kuOphd8CjK+Ygn16v+hPjvQAsIe2ffq5DbTIwFAMcSwbMa2j2pwPxSL4
         tqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349079; x=1790953879;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NGVgNcQx8oJT/2gbfw0v3WXm6aB9A/KYFngS34SqQHE=;
        b=Fho9vopWVkFO7YsBT1QpkAX/iT8yK01IuJU4u5L9w2udtDL0IiiQCC1rTn61HSLUxd
         YJMdgoc6oVuZ8e7+J30Gi/XXwgF4RjJNLsxvxjLlzdYQSrKgLEz9anigLQhxezEG2G/G
         yiFKcRvSn9sTW3wu2fFKbajUd2nrnrbZ8knszQ67A0yrPWf/NaOuwoGbpI5Z4mmRNLKU
         fKu3U9SwuTZ6RsTMPa9P4QWFxedKCIt/V7dgyJYxOEjLUgHRRypcOEf/rTNdODLjr6cH
         8cxUr8M1PPTUeBeHxDi9O5gznEFAX1WXoGzR4C3xTh4UDNZcxaqYgoGmSyh12SbjpQpa
         6Usw==
X-Gm-Message-State: AFuF++mxSjbcJZEodgzCcrPQ7kTrhCalGEJ1LcmuY2itJhYdIgfkp2AB
	nuJeExWxkalObdu8DaxwVk3bGp0BEq+RlDgASfyiAxY0yc0u/jAzK+iGAw18UGYL0ssKHSJIGOt
	Xe1Nqxf2eQ0A7ZTk9D0oz0epD6HP2IrJZYPM6LtifdsgoL1vwY8r2Jw679OR8M6+/VWBQXxhgG9
	W7Gts=
X-Gm-Gg: AYBFou00VSsei8pBB/PzwLviRiFxZibgpchl4Z5tM31606dz36yFaVv2hKuLCXOHE54
	zy20nP3FMg8qbpp/nXD7dXWakAGcrX/oqMYdI6W3BTXHfB4rnXPAL24r330eNS0dS8D36LvzZo8
	leTdQSTovn68pJ+ARDiUJ6UfTPkinf+2ua8OlJljJlhZ+ZC6f/Hihpv1f7EFh+svswqyopQACGp
	siW6i/ZZ/Gmt4I5df5cB/EqYIVi7rwD2rHb3NT/gD4wiFuoBHM6km3MBY25dc8AIAY6sgvIp3O9
	YHru3rKXLM9wOJefNKMGtV3KDZVCZ22KmdQXAX4fzqFalA0fVJYbLpMwsx39NWBuFDdlr1AeG+n
	aIPVgxRP79FvcY51qmz+ih778wA==
X-Received: by 2002:a05:6102:41a9:b0:7ae:c2ca:8dd with SMTP id ada2fe7eead31-7af1e6ef68fmr2998429137.18.1790349078788;
        Fri, 25 Sep 2026 08:11:18 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:7ae:c2ca:8dd with SMTP id ada2fe7eead31-7af1e6ef68fmr2998410137.18.1790349078240;
        Fri, 25 Sep 2026 08:11:18 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49ff27eabc1sm69594075e9.15.2026.09.25.08.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 08:11:16 -0700 (PDT)
Message-ID: <512dc68e-d1cf-4d69-a8f7-52eee01e1dcc@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 16:11:15 +0100
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] ASoC: SDCA: export PM helpers keyed on
 sdca_class_drv
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-3-srinivas.kandagatla@oss.qualcomm.com>
 <20260918134942.555421F000FF@smtp.kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260918134942.555421F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX1JgAWl4QPPjy
 DEAnq4Y6B3J+FKbVaJ6TV4AA5ia2RdeO7ynwUAcz5T9Rz8E3bijUbFZQ0Sb1MYJsLfiK5urPUjg
 WRiKvb7kCVa2BYnofooi3V47GmgPGO8WE/+qBj5qHmIh95KLhiGBhv9GL5De+lpDyjXk5fvVPoJ
 0GljtZ/Rjcnhpy5s42SyVPK6ok4+uUnXBzICYwVbtBNlqpEViyeuhy3zfKwMKbKK5nbrvvs5g5c
 r2mC/gSMt1tD5LLYdU4VbLVFVVhGs8s8fQ6yaR0LDPQDzaDRygj/yNAWYJbKuvU6eMTKebVqdk2
 Iq1eBKmA7l+6fHAA91opWeFJ3PeoTCfAB/nTNs+J/0TSHA2tBF1iXylQ4fKm0ky9UT2Eyr8ZWbm
 5sn3/GJqRrQuA4yTBQFtMHsDDHHHSCJel6c9MoNzg/pepy6X299vBR2tLvh5xMwIHF/zM4yjw41
 EQJCon16w0OTFDzcGdQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX9JxrDckvoLDi
 tjil3Seeojqe7+o1TQ+Yw2vS38P8P+SYELfcV1T4jmSIN3r1egT9M157tOdeDT8mgkv/V9iy7HK
 kF/Uq5WTz5km3/DiwJEbPHDCn397htQ=
X-Proofpoint-GUID: bEjuJLb8Vgf7NOSdgO_zo1eee6i9QzPF
X-Proofpoint-ORIG-GUID: bEjuJLb8Vgf7NOSdgO_zo1eee6i9QzPF
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab68f18 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=b3LgcfY4BDCpY9HWiaoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250060

On 9/18/26 2:49 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] sdca_class: code and commit message mismatch for pm_ops export

This is fixed in v5.

--srini
> --
> 
> commit 43543cd6fb0171b62979b93506768ae9a2b2e709
> Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> ASoC: SDCA: export PM helpers keyed on sdca_class_drv
> 
> The class PM callbacks pull sdca_class_drv out of drvdata, so the
> built-in class_sdw_driver owns the drvdata slot. This blocks codec
> drivers that want to embed sdca_class_drv in their own private struct.
> Split the four callbacks into exported helpers that take a
> struct sdca_class_drv * directly.
> 
>>     For the built-in class_sdw_driver, add small dev_pm_ops wrappers that
>>     fetch drv from drvdata, wire them into sdca_class_pm_ops, and export
>>     the ops so any generic SDCA slave can pick them up as-is.
> 
>> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
>> index d7444f442c71c..a092ebaa620aa 100644
>> --- a/sound/soc/sdca/sdca_class.c
>> +++ b/sound/soc/sdca/sdca_class.c
> [ ... ]
>> @@ -265,10 +283,37 @@ static int class_runtime_resume(struct device *dev)
> [ ... ]
>> -static const struct dev_pm_ops class_pm_ops = {
>> -	SYSTEM_SLEEP_PM_OPS(class_suspend, class_resume)
>> -	RUNTIME_PM_OPS(class_runtime_suspend, class_runtime_resume, NULL)
>> +static const struct dev_pm_ops sdca_class_pm_ops = {
>> +	SYSTEM_SLEEP_PM_OPS(class_pm_system_suspend, class_pm_system_resume)
>> +	RUNTIME_PM_OPS(class_pm_runtime_suspend, class_pm_runtime_resume, NULL)
>>  };
> 
> [Severity: Medium]
> The commit message states that sdca_class_pm_ops is exported so generic
> SDCA slaves can pick it up as-is, but it is defined statically here without
> an export macro.
> 
> Will developers attempting to write a generic SDCA slave in another file
> encounter build or linkage errors when trying to reference sdca_class_pm_ops?
> 
> Should this struct be exported to match the commit message description?
> 

