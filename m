Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09C74192FD
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 11:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782817202; cv=none; b=PyDqzTcYewPuevwX5lixidC6ztqdHAEjm29NSE47IoZ1ox+gEhVzub8jmeyxgYvStJP0flejnGUxRnj7ybz4bc/E/C+CskHYBjtud+a/tm2L77dpXNd6soaQE3OMuSfcmsHndw89ZMrBgVY8sCXnsMcnGwloMxphAV40osNOt+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782817202; c=relaxed/simple;
	bh=Ec/MyH4Xri+y60xMNcT6+HsrGNJeJczzhCHvAGEnQVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mk0zfRSDCtU6E+9fVJyG3bXqhKLUBoHMmgkynYbluOvgpKPU9j7gYnAyBYw+M3djJ5nJ7wpUQf+5qwP9D3z5h5cH7zB+N3LjtQTUWew5Dggch93IxYBVxb/S3vOuJt8qgR6GWPlVMnzhTi/9M8y3B4+KeuvYjxE9PFh32R7NI0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ll9MB1QO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HRzIKiG9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ll9MB1QO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HRzIKiG9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mrIx1611698
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 11:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WpBZ9jkb32jVHwTH+Jt+1cvU5EwYSlabbplseY69W5o=; b=Ll9MB1QO3eXeMkXa
	0CTb/WBQuuJPgt/bOCAQ+jPuok65MaedIfkjhExjs84tALQWT3DwdkKiPz4raJlb
	HAeqexUtc33+0+x1DHbOhucD7OQlYnTSeV+s3/ETnTC7B6rWfE3ilMY8GrKJULQ0
	bxoziPmeNqlIybxs2L2kFjtm1fRKwFsOR4sUs1M3gDFga4Vv5kyKwcDjnUjsXp4Y
	vbKr1ikP6JHwWrlNYoxhSnsmrwJVTXtATbpv1DEoS3HqbVu1d6zLD/ouQmZybwJ8
	0EeBhVE1KLO2/kP/74hcsxbZWvCn6KCGQ6us5etD523adKBxk9gMH7vFrj1EQA6j
	42nXYQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f441gt7ay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 10:59:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca3b314193so5171145ad.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 03:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782817199; x=1783421999; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WpBZ9jkb32jVHwTH+Jt+1cvU5EwYSlabbplseY69W5o=;
        b=HRzIKiG9Lt/VUhHRdEfppp8+42GG+LhxyAaEofle3Xfs+iaroEEfyE4t42YsoQEDAW
         wgs701MgEB5hT/H0z4Eo21AOtkddeFG6OurZdcS1HsOyZ8mNroul2xfZoZ2CNbDY/lVA
         jpOL1ylrSGgX0TUryIaJ8HpKUJySTCTDEKCek7hrs1TidqrjY/YUmv8fiqzDY2NT/9HM
         dMKYP+lVYaA9m/tV/WvyxnNnIMRgbWxoNktMzBQN2v843o6Ad44mzba3uFSZZCu64Sm7
         wwou5utOozm/567GLh7LzuvwQuAP9SErp6CfSLszlDIlRf4Cic5XkSDFHwQC4YKaxWXu
         9xgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782817199; x=1783421999;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpBZ9jkb32jVHwTH+Jt+1cvU5EwYSlabbplseY69W5o=;
        b=Zo6RD6oQTzCu8EikBLzDkCK33XREA83H/qoNPKW7Fkh/TQMPUhx58OXk1g7Hk9fE4B
         QYvBpkTLDud8yOqNcAKj9A+rt5DCvIxLCgTbfzth6CRyTiFabWaYO8aJLU8cyPHqBY1U
         XN1oxmS1/EOYTbCtMbnqA5H0IGDfr2uU0XW3eo99La5s0ClL3y8wtiwnZVwo54Lgq3Sn
         O4y+m8b2lhxvPgi/ECDAog9Tbj3rWRBI+Jy9LWZK6ulTSFIVth3HZnZquh761fFXcmSX
         IHKzKqtxEKL1S8QW4n6K6b7Qj0BokMrKzQU1vxqlbgrihMAA9iGgEqOHdxEt68rdN3VF
         M5/w==
X-Gm-Message-State: AOJu0Yy3iZ6BBbsbwICRoR9NLaYqxHR/UMFm1RQdZoI2IuQtXY+xMxUQ
	L0L6wBVu3RI3NbDpQ7f83ZWwA+mm7iqpBo7dR4bMnWPoUG0Zkof6CHA3aG4+p3pyMLLZsE0Mpb7
	Zi/riTqe93ww0yYmCATY/u1WB0LdG3lCBzN4684hvtykWhaRS5YPB96tS6qBjZ1/k4bC3+DFdqA
	plyILXQw==
X-Gm-Gg: AfdE7cla6S7/qGzzuNUDOLHtajQGkGBE/HA5asPfmm33DGedfLLTFMdzG+Fi9fgqMEf
	I+Ks/LmDKzbKqb9aOH16Pvh3MBz8/PTUiUDazKHh0dmxmSXCpB3Nx4fTUV7hysqf5tBnkLcy69P
	8BwSp9GKmF1SvUiNk0eWqeEFBW4RvNxTSFvWe9lZCE6hw62vHbRbtDHIkKjDWnpdyraYfCnNZxa
	okMlFRAS4jr23SK57DtAqJp54iWphhNs33US8rkCSuYScA1TVfcMCi/32mglWYOwWFHC9NA+UnS
	8ae2M8w20PAEeku1TY9/iU4UCnxOTRVWFeEjbuM26sA32Xk12TNwRhZdkcmyW5zR1acss9Cbq2t
	1sMKbAsXJ8bD5WVNOWA/VIEtlx5APbnk6LsRAYomU0F/nL06w1yIC7OgLPGBRPHETvj7wAoAeG6
	8=
X-Received: by 2002:a17:903:234f:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2ca2d52e925mr23911495ad.7.1782817199054;
        Tue, 30 Jun 2026 03:59:59 -0700 (PDT)
X-Received: by 2002:a17:903:234f:b0:2c9:e9db:8167 with SMTP id d9443c01a7336-2ca2d52e925mr23911315ad.7.1782817198513;
        Tue, 30 Jun 2026 03:59:58 -0700 (PDT)
Received: from [10.133.33.23] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382bba24sm10888325ad.71.2026.06.30.03.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:59:58 -0700 (PDT)
Message-ID: <8f175e76-b446-4afd-ad55-18b67eee7e5d@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:59:54 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] coresight: tnoc: Add AG tnoc standalone compatible
 to the platform driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
 <20260630-fix-tracenoc-probe-issue-v3-2-7201e1841e94@oss.qualcomm.com>
 <20260630105749.197541F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260630105749.197541F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwMCBTYWx0ZWRfX1Hd/EfR71kku
 uH2DVSUK0IYnwmg4+cQZ87n5+8iHEYEiRF/3AkZuaU3pdPsM7n/5V758qKozDfZefdXPJmeG3nn
 iiU5CFBGIiRs99SLGPeqv+mVLgnpaOY=
X-Proofpoint-ORIG-GUID: HV4-75RR4KKFv_6RPRTm2ioh4tr-xTuE
X-Authority-Analysis: v=2.4 cv=F8dnsKhN c=1 sm=1 tr=0 ts=6a43a1b0 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SyiVr3T7apCZMAOczy4A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwMCBTYWx0ZWRfX2Yw6VPWZbuAY
 vaLjxDfmSB/VVlEr1tiL/69y7sODUUDN9cl6MriNGDr7rAe7iVSYu98fOquYM62rtnJ4TmjGWCZ
 SaThEulwXRYtRM/tb0FhTDZmv3IjTdIMy0+Vciinxxgi3yIvx6WGr4ReH/FqqFDZXnMR7G2BoEL
 zuFKmiAS8rVXYWmbDHuxksSSqO6rhIj6Qx4+bjBI2vbNbuEkSsUcL9zx/An3S2qnuf96QsWPJEu
 ck4XocK0gAFO31YBhCuNe170+iWuehFeYQH0Za6IxVLSZnrypZZxICeje/yOAwHgylANeq/pesl
 aHZk7ISTshKB04+ZFagiPp0OWspn5Fg73psgLUah1VRojq/Kz9dXnjfb/0iKGtqdwEM/xuM8feE
 08q+yIK2nUrG1J2wvCfQosVpCtT+Y6SyMiWFOu5OBhO2l19ePX0BeNKGp/UMq8Ow2ahV0PSYNMO
 xVAZ2aedG9U9yt1oKYQ==
X-Proofpoint-GUID: HV4-75RR4KKFv_6RPRTm2ioh4tr-xTuE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300100



On 6/30/2026 6:57 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] System Trace ID is leaked on platform device removal for standalone Aggregator TNOC.
> --
> 
> commit 060ed6649d8ad0bd7b6b53c7f626563782e801df
> Author: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> coresight: tnoc: Add AG tnoc standalone compatible to the platform driver
> 
> This commit adds the "qcom,coresight-agtnoc" compatible to allow the Aggregator
> TNOC to probe as a standalone platform device. It updates the platform driver
> and callback names to generic "tnoc" variants. It also modifies the default
> data initialization so that only the Interconnect TNOC skips trace ID allocation.
> 
>> diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
>> index 9e8de4323d285..8237467faba72 100644
>> --- a/drivers/hwtracing/coresight/coresight-tnoc.c
>> +++ b/drivers/hwtracing/coresight/coresight-tnoc.c
> [ ... ]
>> @@ -295,7 +295,7 @@ static int itnoc_probe(struct platform_device *pdev)
>>   	return ret;
>>   }
>>   
>> -static void itnoc_remove(struct platform_device *pdev)
>> +static void tnoc_platform_remove(struct platform_device *pdev)
>>   {
>>   	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
>>   
>>   	coresight_unregister(drvdata->csdev);
>>   	pm_runtime_disable(&pdev->dev);
>>   }
> 
> [Severity: High]
> Does this code leak the allocated system trace ID on device removal?
> 

Thanks for reporting. We need free the trace ID in remove path.

Thanks,
Jie

> Because trace_noc_init_default_data() now allocates a system trace ID via
> coresight_trace_id_get_system_id() for the new "qcom,coresight-agtnoc"
> devices, it appears tnoc_platform_remove() needs a corresponding call to
> coresight_trace_id_put_system_id(drvdata->atid) when the driver is unbound.
> 
> Without this cleanup, repeated unbind and bind cycles could permanently
> exhaust the finite system trace ID pool.
> 

