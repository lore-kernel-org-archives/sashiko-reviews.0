Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5922D2483
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256066; cv=none; b=HjWXdYYWR5LaEvU8Y1tJlDNJx6yxJrPe+Y0O+GKTj7RBJwCUk9BUqD2sq43hUxPuecp86Dioosctz0NNxl6DEtTtZWrT4TgAb5RSObDUXWSrItPKLpwRpPejcQyH9ZWJ/ru8JWFNfRsjEOWzDe3ttQRD769Nt190mAksR+120tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256066; c=relaxed/simple;
	bh=pORWDWHTusXjBw/EJulBCaYGSefupe/Bm6gNE3utLIA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XXcpz5oWis1rXxKEVFKNA0cSTntWH1v6k79hJgG0tNT6npv967+VR0XHypyoxSUIBBJdeO5pF3FHmedP1CGoVqkPKUJ9WI78IQurEOEH+G3QDn8JzX+ne5K4tpu0RwPp2VqUaJ77iusN+Fd8UtuA2cPvN97rE56w3c3l2rOT7H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnaJ6nlR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P/An4iID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnaJ6nlR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P/An4iID"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H2YQnP515803
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N7rCpjkWjlTwa6LsILuSxuuEsyS7uwwCqw43dM9nNM4=; b=dnaJ6nlRIKpYPq5N
	ivwszUVgsaPCbrvwIP+PMBAioomdOiDsanBXB1et8cyxI8ZosPTt/d4DuZnl2ifw
	pUU+3gGz3OSQAaz8MkzCb0hIYY3K3xXaXX09H6IL51RxqoRzn+cNKeQ1COltbXPH
	dm85nvHXKXriVnTP1Z9SU92JS8AByvNp3sRbe3NUdeS2+KFECqNp5GjVIqzopHFb
	TaKT5G+lDRy+8QTbevs2VdYXHWE2gQM+a6x5afdq8q55mJ6w2OIp4+ShhfmnzCPT
	TJ+YbPEkxRu0IKZapxpr87Mh8OMaK+qCJqWCri5duv0XMveKZyZgzVfR5oTrmS/I
	ev5Gaw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbqug0pm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:41:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848551b54f5so13803570b3a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 19:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784256064; x=1784860864; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7rCpjkWjlTwa6LsILuSxuuEsyS7uwwCqw43dM9nNM4=;
        b=P/An4iID+hloHOrmnBwEqFivR4t9cM/zSAWpc9tWfY117XcIei87EU1OdKh/uj6MGQ
         /7tIQe3J76q2RndLX6tNxZatJLRTOFb+OyBlmSDavCiQWSPopmUbBajm58QDcEqBmDz6
         qZ4Py4I+Kr48MD5Y0QWcRSbxycp4HnEm/8+rlwWsFGhuxx0LB9oFo+zupOTARRjHdBNI
         RnZBquy+jd/9Gaa58UwxafkcHFOa2d9wIhW953HY/EZgjbeumiEYGYVfI93ZFqAUhFaw
         vQmle0WaZwFwP6+CpFhQ7SHrB2TWvTzQnuk0U/40D7AyanzgkboW1PaRTWqD2kA85lar
         QMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256064; x=1784860864;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7rCpjkWjlTwa6LsILuSxuuEsyS7uwwCqw43dM9nNM4=;
        b=RnV6dPgFv+7H8IbrCRwtPDTqH8JEbkQz9KQNKi04+TYdLsVzXCmTvZyRqhYdodZdCw
         uVq6XG4oqyvfpI2WjQISkjLRq5d/8/jhLMON4W3w+A0UEAF1NOCKBT6fUnZOw0YXraE/
         PZH8uRWBzbJjX8o7FRpIFF4+5jedRUaKtTrh2QeO/kIUECsdioHMkA0WL44EfsPEiMVR
         miza7gMdAsgsVhU8BUCdPw9g5gTBWSguO3PiosQFblXzez/F1eu5v3pbvX5pjidL+CzQ
         b2XU6sbF1UjVHr0wMpZGjCC0foXKqbHiIrSD3hd+7KixG++s2wfjobfgi7dXpxA2h4e7
         Xoeg==
X-Gm-Message-State: AOJu0YwOXRVvOh3XSnQGTrqBQsthdOV4a9Qp8/UaJ02MaLEj8ulm9s3z
	d969jsQxWnE3lASKAxDW6bbyZMPBcbA32un0BCchSIYuljhDTkB4znQWKvmSSPT3R2/iMwNpc8D
	SrlvMHPhGZIH+Cokd4BUDBAhu+LAyL2RtAABnGdsCKWLOX9h9DyZ8wJODvOePHhheKEMDDKJi34
	0Tbvc=
X-Gm-Gg: AfdE7cnOSH/1XYf1PpCfEP3K9zj2q5+mwOxoTvqNduOp9Lxprt3NoQAJmaPUuRx9/5t
	ZqSf+FPk13/58gQnMtOBi/b9zNzOfjw+4FTeR7weH7TWydVnFi70lnxdVsnPtyq+d/HGXkUu+dq
	XDRMEYRKEXjJh4i1bJrQWuM6Ih6pBBvq1ab1Oj5KA8b/jqRhNTKfmpyYZbD98e28SwYjcyNDrCV
	MpfzxxuOxKQT2Ry/Z/pZEZAwsFai5gf9MH00f7F4GOGUUcE2SVaJK37X/mXv61l9NrCTIffGzZI
	iTZngmkgeI6gt/VGDZL6RdmX+niiAABQGwxPNgofI8FTj7BHJNyWrQ0SN3U7MSRk2lseTTOk74a
	ifpjrv/GK4442JEqYpcfTlCypK6mSCxIfny3pgXHGckL3quUEJiQqgcPBeEnYspOHjkZzOpKx
X-Received: by 2002:a05:6a00:32c7:b0:847:8250:2b2a with SMTP id d2e1a72fcca58-84c294dc10bmr573279b3a.60.1784256063920;
        Thu, 16 Jul 2026 19:41:03 -0700 (PDT)
X-Received: by 2002:a05:6a00:32c7:b0:847:8250:2b2a with SMTP id d2e1a72fcca58-84c294dc10bmr573261b3a.60.1784256063428;
        Thu, 16 Jul 2026 19:41:03 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519ae8690sm150093a12.16.2026.07.16.19.41.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 19:41:03 -0700 (PDT)
Message-ID: <996db256-91fa-4ace-bc1e-b43e45bbc9a2@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:41:00 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v7 04/15] drm/msm/dp: split msm_dp_ctrl_config_ctrl() into
 link parts and stream parts
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260609-dp_mstclean-v7-4-ea04113e8233@oss.qualcomm.com>
 <20260609100433.E45DF1F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260609100433.E45DF1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5GbWpYBjNydS9PAmteurrov-VHstkZlk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAyMyBTYWx0ZWRfX2y6FwCg2zgcF
 5nX+AJ49uBkOWgiQgI6LegKNJHj6axdgkJsaHLoYtl6KoWEGnNYe8ORVuhO+TMivasP5DtZ74lH
 IBE+gAYaiVXt3DjABl0o/T4UXAQvZPYntIOXRicVmr5qW4VXf4G4cz5ekg2BP2E5lF7fZbPbny2
 xhAKUv/ilVrzy/T2BA30Htm7kSHEx5eYBO2fhojmL/EcZ/Uxts1Q75EtYPSd9u01WpIiZokkUEA
 7zQML2e7DTf7ZO5nuMIgQKkkG4pPuYStBINKg7hdVgMSNJwGrfJg5lh3F2a6/PFDRK0Pnz7NAnA
 EzSe2jdmjZG16TIoP4NbS8b+IVRHTRHHG5ddy6P1rPMbc2QVvtVY7otYu2BGQRxkCpEgZvOBPSB
 BjvYfG/rwPVuQYifXY4qTg3eiwXBBqH3IU/iPUK1YCIIe/YMTDOyYoMeheFytkuiBKefSC+WW+v
 HqDklq2e0bTefiOzvVQ==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a599640 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1nfiX9nEXZiYykqwV9AA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 5GbWpYBjNydS9PAmteurrov-VHstkZlk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAyMyBTYWx0ZWRfX6CuXKvOk5mrY
 z7jP0fDHC4zrosqKZtCD7sa3KdvtWSZj4EBFiEYdtAWDU6jPa/RAFd+4k2X3lDNoluRCPO4f1oK
 KbC8/7ZdljTZ+8xkHnqNy/K4OyQaebE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1011 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170023



On 6/9/2026 6:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Splitting `msm_dp_ctrl_config_ctrl()` causes stream configuration state to be permanently lost during dynamic link maintenance, leading to display corruption.
> --
> 
> commit 83fda55d30fe1cd098ad8cc76e151a0398a09b6a
> Author: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> drm/msm/dp: split msm_dp_ctrl_config_ctrl() into link parts and stream parts
>      
> The DP_CONFIGURATION_CTRL register contains both link-level and
> stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
> all of them together. Separate the configuration into link parts and
> stream parts to support MST.
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 86ef8c89ad443..ed2ba47881fd0 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> [ ... ]
>> +static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
>> +{
>> +	u32 config = 0;
> [ ... ]
>> -	if (ctrl->panel->psr_cap.version)
>> -		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
>> -
>> -	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
>> +	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
>>   
>>   	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
>>   }
> [ ... ]
>> @@ -1628,7 +1644,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
>>   	u8 assr;
>>   	struct msm_dp_link_info link_info = {0};
>>   
>> -	msm_dp_ctrl_config_ctrl(ctrl);
>> +	msm_dp_ctrl_config_ctrl_link(ctrl);
> 
> [Severity: High]
> Does splitting this configuration cause the stream state to be permanently lost
> during dynamic link maintenance?
> 
> Before this patch, msm_dp_ctrl_config_ctrl() programmed both link and stream
> parameters. Now, msm_dp_ctrl_config_ctrl_link() initializes config = 0 and
> overwrites REG_DP_CONFIGURATION_CTRL, which erases any existing stream
> configuration.
> 
> While normal initialization restores stream parameters by calling
> msm_dp_ctrl_configure_source_params() after link training, dynamic link
> maintenance paths (like msm_dp_ctrl_link_maintenance() calling
> msm_dp_ctrl_setup_main_link()) perform link training and then transition
> directly to DP_STATE_CTRL_SEND_VIDEO without re-applying the stream
> parameters:
> 
> msm_dp_ctrl_link_maintenance()
>      ...
>      ret = msm_dp_ctrl_setup_main_link(ctrl, &training_step);
>      ...
>      msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
> 
> Since msm_dp_ctrl_setup_main_link() eventually triggers
> msm_dp_ctrl_link_train() which calls msm_dp_ctrl_config_ctrl_link(), will this
> result in the DP stream coming back up with critical parameters cleared (e.g.,
> 0 BPC, no VSC, incorrect color format), breaking the display output?
> 
Will fix it.
