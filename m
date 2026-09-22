Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640B237F319
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 03:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790047676; cv=none; b=j3Gkn6yCid93cwo8h/Xf4zUMyk/zmsQXGjhTimqaE2iLQ0hkjSVC93Vk63SxZ7+P5cyGC0ed+tuLZ/toTT606hgdKFYLTE6YyvinWwqqjG5Fa742qIWkNJKRuyMrgRRaI3tYYSoX/IySNXUj7yf0VhpOhdHpZhRkORpB+mzGb8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790047676; c=relaxed/simple;
	bh=Qtxel18qHJKw163J6jbG6RGG0MrSRAy72mEeBvuRRrs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J6pksZrqFNBQzN1NDOUFp9Fdb7yjKEGW5lQIFrIpg2zgTj73S2A4uotQSV9B3yh4Xu9gNJgmg+ysrvlKDIbcWl/QUM0oshlqrzRrss+kPQlfFqWHzHnd5Nu0whR53zhg3oiZTVsVlWwk6jblLD8B4dat/IT9D9w92Ro2DkRx7WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdfJu0ax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5LGR7md; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdfJu0ax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5LGR7md"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00qpM1370670
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 03:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	db606FZ5rvTANVLSxVgbt5sUsdfzTaDo+c8SWQ7Q/t8=; b=gdfJu0axBKKYEKXW
	MfePgdhEbSULg/4hA1RuqsG2vO+FAcrKMIh+y108Kuu3G1FLH3q9YIrwtvSw/MbA
	CoATIUutxVgPfBA9SEwx0ObCTgroUYt3Exh5BWsoq6fQyVvuFuAz5U/iS073Cg5L
	08srJr+OnllzMZUd8jUxBJACqmmi9jcwvS6GfmnT6lGeueV+RITv3y6f8YFxDV3A
	2+siGJP6uNeouwqAz9teiZ6lLNUZKyi97hfLejkmXJen6InSOxesHw2hwa5oRkuD
	LjOt8fxO/FmXB+MPB6GwfQMn9mQoDMLy6XsRUtxLpV5GbUOnJ7H9leVdPYzkOA/6
	Ov7o8w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu7tsja4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 03:27:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso4864420a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 20:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790047674; x=1790652474; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=db606FZ5rvTANVLSxVgbt5sUsdfzTaDo+c8SWQ7Q/t8=;
        b=e5LGR7md7OyU3sAUpLtXRlTkTmK7pMgHSiqrMTlNA71dvMA50Rzvcp6Bj8WndkOd82
         Gus4GEXPe+3bMMr93k1vfcy4TbmJEkDMy6NZyAXqDz0CKy6wIPthIXAZK4pulqHbSVta
         XUJ0vewDLfJjtFC4RWHr2lTC61Ss6nyBlldyJSOrikFg7y9j6n8H0KVIGPey88OAruQM
         0WHs2U1TX5zQA/xX1UmfWLY85gf8r53VkverGMgVvIu14vAxfgJaMDCu0XNRqp6dsX0G
         kF7ACrWqaicWAvq3YXcc5o3KvC0nfMHac3ahZbWTaxr8Qso8GV0Oo3FVdUx2eV3qOTYk
         IV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790047674; x=1790652474;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=db606FZ5rvTANVLSxVgbt5sUsdfzTaDo+c8SWQ7Q/t8=;
        b=dUP8bWNyd/NgP/LO4dSaQ/ZGhNGUKohyP+ZysO75w872sYImGvgmnLxtp79OBe+9kn
         RQDYakQ8QEohQIPQ209Ab+kcSq9tcC7BMe5JdhTcHjYA3jm4TlMAI9kLVWudGbZsNXHn
         j+vWhG8C7+9o2v7U2u8CkP7qWvsc/iWR7xwLTbUe3x6zJLhOfADwskrU8oP+q5HuQ8av
         mJE1v96RwC39JeitglOgMgtq+s6megFV48iw7S3hQMZabuP/+mW7Ca2U/EARHXy8mW0+
         h9Ja6Fd4eF3Uhm6jgtB3C/+ClmfvRW0zQeo4g/B+WboK9gK+yMuoYdwS62Y//1Vg7e0E
         Gb8A==
X-Gm-Message-State: AFuF++mFfsfO+AUj+3RyeU/J84P4jjHRxWGgDPwIfO4kPZbZ9+nxHcar
	POz/QaY6EiiCSbdglF6z12TvsSmiBH2gjoMzq92sl5FpVVx+kaT6IxO72g3Ul6tcO2ePxZ+gLSv
	Ng/BEKIcZVkCEbe2f/C5m0t48mHs2llCG/qvAtiN4Y17Qu+ruASB2gSycvxCxVMmP0Gl8k/MHl6
	52V6fHzg==
X-Gm-Gg: AYBFou2/cF5Hp8boD3YtUAstF4Y8Z1Nd9a2Z89VoW8mF1ntVHCPDoEhNfrcDE2znYzk
	1YBMpPNOlCurQEyQKF4uohq/rbCScaKU/qqUeed/zfenIi00bDio8E2u2eNEIE761Rol+iCcsTz
	ewDtXfXBdYMd1l8v3uLDZ9oSq0Lmfz99Q5yot7uyN2SI8mxOS95yYsYEtSqix+cMLsnt9xI4MK8
	/oLEox+wOP81wrzSC/0cYQqFD7Ji6kz1UXy4nLrS+1R74IzOYXpLo3b9+7kDiVWjbXD+8/jfah+
	i35vqoubeMulF9Kcuaapeobr96H3cZ6irYn+JwCwvCfDKe0djINi/d7qpiXncr5ZcFryd2s6jZ0
	mp+AXCEHyP5hMpwoTCyL3q8MaFMjzdtfxtL1TZHe1cgTdUyoNBj6wlzbydG3tRVb+SQ==
X-Received: by 2002:a17:90a:d4f:b0:39e:6a7f:1dd0 with SMTP id 98e67ed59e1d1-39e6a7f2240mr8215910a91.44.1790047673575;
        Mon, 21 Sep 2026 20:27:53 -0700 (PDT)
X-Received: by 2002:a17:90a:d4f:b0:39e:6a7f:1dd0 with SMTP id 98e67ed59e1d1-39e6a7f2240mr8215897a91.44.1790047672932;
        Mon, 21 Sep 2026 20:27:52 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0715e9d5esm54445a91.17.2026.09.21.20.27.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 20:27:52 -0700 (PDT)
Message-ID: <6b8bf779-6494-45b7-9b87-dc62aa4a7220@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 11:27:49 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based
 probing
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260922-fix-etm-probe-issue-on-shikra-v1-1-56d25e9bbe17@oss.qualcomm.com>
 <20260922031703.54C521F000FF@smtp.kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260922031703.54C521F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9gXyvoqizT8Nbh4CHkMm5oxEK1yQukiE
X-Authority-Analysis: v=2.4 cv=aqgnmiZV c=1 sm=1 tr=0 ts=6ab1f5ba cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9PwK0JBZ0THiR8dXEk0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA0NSBTYWx0ZWRfXw2qv4pGCed+W
 oHcBqFqBKpPQYfEz8kl91lzbyoNfg35S8wgv1nSE7hI2VWTlFdU/6wDYlqqp70LImDl3cYVnP8M
 u2R60M1WHJzYn7AELBzsOtKWi9Jr5jQ=
X-Proofpoint-GUID: 9gXyvoqizT8Nbh4CHkMm5oxEK1yQukiE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA0NSBTYWx0ZWRfX9TQrxj/p3Cm6
 Jp/6voDKI3EXEPdibohso8keye6HCb8dSmn6R4dbUG64xT6BJE5DvKmsso/0I/jogJosQNw+fSP
 FaV1L10orNkYC8iu0NG8GgWNCuyGeXNpa1QMCmIwio/HBuUP9dEjt2Ut2lhIfzst+1UUNtRqapl
 nnGgEJS6yybp2naE50espDJ0HQPAA4shLEKx0bDWDyRabbsp6w9A0B8uXH80KDzfAyBWYbRgZ+d
 wmRVZobCGBcnLtAkpb074fm36FEOTLgB/uBcQWAOmPnHh2+bPOW+dQdU0rhzO0Wi3zeQm2/XN7D
 T79l0d/j+OitZZ3paxAd4qhvZ0AZ/QKNs3FqudZgK4MAJItfhsAd7QbAWSXFldMeGGtuyj1/WOJ
 BZ475LgaOS0C88FESBv9h6AZfAib21zpZlUNd9vn91nG471Q2AwnlQ17AsdcoOZZqTBcQLCppgE
 01Bg1Gb3SKWQJC+pQbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220045



On 9/22/2026 11:17 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] arm64: dts: shikra: missing arm,coresight-loses-context-with-cpu property
> --
> 
> commit aab8605634d60b3bebc7a736fcec36f07d87f859
> Author: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> arm64: dts: qcom: shikra: Switch CPU ETMs to MMIO-based probing
> 
> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
> but do not implement self-hosted system-register trace access on
> this SoC. The CPU ETMs have a memory-mapped aperture, so switch each
> node to the standard "arm,coresight-etm4x", "arm,primecell" compatible
> with its MMIO reg range.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index c1f06f692f664..62bacf749241f 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> [ ... ]
>> @@ -3218,6 +3150,24 @@ cti@9020000 {
>>   			label = "cti_apss_pe0";
>>   		};
>>   
>> +		etm@9040000 {
>> +			compatible = "arm,coresight-etm4x", "arm,primecell";
> 
 > [Severity: Medium]> Will this omission cause ETM tracing to silently 
stop functioning during CPU
> deep idle?
> 
> By switching to MMIO without adding the arm,coresight-loses-context-with-cpu
> property, the coresight driver will skip allocating the save state.
> 
> drivers/hwtracing/coresight/coresight-etm4x-core.c:etm4_add_coresight_dev() {
>      ...
>      else if (pm_save_enable == PARAM_PM_SAVE_FIRMWARE)
>          pm_save = coresight_loses_context_with_cpu(dev);
>      ...
> }

Currently, we are not enabling the CPU SAVE/RESTORE in HLOS driver on 
QCOM platforms.

Thanks,
Jie

> 
> Should the arm,coresight-loses-context-with-cpu property be added to these
> new MMIO etm nodes?
> 

