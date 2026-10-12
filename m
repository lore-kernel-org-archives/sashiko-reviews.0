Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1156F3A0B31
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 09:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796141; cv=none; b=ZvwqtH1bxGXla3NqlI230QAQtS4q7yHfvwqWFE3iLonZL3LNIDPmfw12ARUTXWMA4EJok3JCpMdNTOUlSq2DcQwV5LWkw3eqJodyzcWbmTBXhYkOqS80wdqYHsi8UOkyRFeKZs/LESqH1vD7Q2IE9WvmbWkM8Mc4Y2+4XOacEps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796141; c=relaxed/simple;
	bh=+XKLPOkMti39smatx/U/VS8VHURsgKtzBMZ2YV2VjbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PXomAAJbk/CjWkLC0u2devV4J5XXTKRg3KaQjHrrk5cunXUq/9v+rzhG+pJgSG6GaFiw2bkY2nIFUCEK7xDZUhnIk+jdJPKmlJk+oTBdwHmIGD/zoAzcfVkYCI6KVlaQssX6F5SlS0nAEzkjiaIViJYZCBtqkcyQLOzj9IEwYQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MoewVVol; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNwp5kdU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MoewVVol";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNwp5kdU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8K8xx2796117
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 09:08:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DyRfzjcKdOQMTJdwcyuqyC6/erkqy6LTPieCsoY9kfs=; b=MoewVVoliv/zj72w
	AyfDstsmLGGvb0tsugZPgioNxgvALQ1Mj78xTITiy2Ormw13C+5bJ8rSeEDZ06To
	zUq1EWb8ZQuu4Ou/eTX+CrOPwkMAj7Xbvz66sgQ82DU2baXkg71ldb7LwGEg303S
	AHWzU/tsW4ovOCp7U3hQEF0hfvNjcvgeHI99kVheS7tcdDicFFKWw9sYaNQqICsD
	JGKoWzvagJ3AVjXjlpRcCzgaG84S+4ZCRprqKjmW+UMG5WzfhCmEUP+s5wF8lKJf
	jphYMjb/fkBSgcAcIIzefSnl5Gw3zkArw7SxPxjvdzaIWm4L3eGA8zIQa2nXsRjl
	gMoQlw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3gbaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 09:08:57 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-88bbc27f85cso2403925b3a.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 02:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796137; x=1792400937; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DyRfzjcKdOQMTJdwcyuqyC6/erkqy6LTPieCsoY9kfs=;
        b=bNwp5kdU4gBgFrf+GdwDiuFyDG2I5baLcpbE8ablEzQC1f9aoWgHx6gjuG0G3PyXhN
         hvdK5ha+1c8g5OzZUPGMaOSJN/95BkX41tvZpxLkOs2H1Io4Uy5/zmrLFpXlsu0xEX3X
         xwx+FYcA0Na3+EPl2wblOJtSuCE97O917n3qEjj4KuriRubRCinEY5K6yr399qAcz1UC
         4HvmDfPdieds4omgOh/WdlA7lPPApobkXYqzSNcwMe4QbISvejY3SRWLqk8MOLV8PI5e
         4E+krfJ+rs9W1OpC79Hc4LFddDTXqY+4nmYukvvOgTTXpQLGMUU8TklUUg/Ap4SLwupI
         sPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796137; x=1792400937;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DyRfzjcKdOQMTJdwcyuqyC6/erkqy6LTPieCsoY9kfs=;
        b=RHX6IT9SC0j8Z4cCQ4EsoZHTOuDFRdmOWEW3x86kKTW7btrC2NgxXzMhwGFLZBUvS7
         YfwnjtiDntA+RpBlUk0VgYfNJo/jFke4ficL+3vnwvml7jk9NP2wDsb/36C+cJ1LgQC6
         8BTIAqVvpUBrLlXs7ddlujxgE04QpV0mejQ2hIUZQuy5YvCUy+cEKeVq6wHgqkSmkC0E
         8haAsZjkme/f72B0fXq5HM+JQJsnZTInyfIb/16W2h5RwmUXA/vCYi5HMYHayKJXbgVU
         d50EKs4xBEYcdMc4H0ABczIQ7Kfqqg6FDLeE7M+xeAeCxB7fVrb+aGXgIEEqHHKVWx7k
         fh6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxPgBHN8gRlAHKD5dwPMzmCgb/n08k6Pejpe4XRhmxYK4mteOmAZhEngL4udR60Yf8ViCy6WvbMTh2Ov89455c=@lists.linux.dev
X-Gm-Message-State: AFq9FYJaU4eQgYcYnptfw+NmQP+dW5CFYHLSlvTaALGVIPMg8w575E6a
	1gM9T/+qvOmJw7roP5ZAtzMZtx1BYTD6jrjrDsJz19eEvqkz7BYPN63Y5MIOqo/Jpz/yxZaNAaJ
	eFk5fM8VfS8WhzBMPxSdlC8E+F9tW92gIkYETpbiR9Iq9QhFg6CnRFNffqQKWXhY5HfaCQL0PiO
	kVNdo=
X-Gm-Gg: AYBFou2jLBSZag9nn/MCJdXCgXgEYHgbsjdDJIJrnVzpnWUSY7jBdE/78sXf58fyvx1
	a3TL4XNSydqDMTRHjK0LXKnLCaBiCJMKFm+jacLY2qsmnUpyt2e5zHSI2fpF/iN+YpRCq4WZurb
	afcBCDkfYAjcm574giAYtnbxtsEYMxkE17jAI8dgqPTNTyoJlWZCRbMgYF0txKRBm6Jc39f/XOz
	1ZsGDMEgXMfEx4PtgAUFr2Kz1wp2upJnpkr7zjMG4ey6+UnsgbmObIFffEXR1XthAemuhthC6pU
	y3vE6GcLtEZtg3Rf1xgieKRkVi/ijKK4vgXO4Zu6vzi1QzsmVNi5FOqXdAqQXRd5iKe3jXJuIvb
	Q9se8IvHesKbeAbTz6d77TvogPxy40UySzE9NWtIEOr47XbIzyBy04Y4k0e+FTW6M5qIQ53Q=
X-Received: by 2002:a05:6a00:2383:b0:88b:cddc:4f71 with SMTP id d2e1a72fcca58-897c7ec8c3emr7464283b3a.37.1791796137226;
        Mon, 12 Oct 2026 02:08:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:2383:b0:88b:cddc:4f71 with SMTP id d2e1a72fcca58-897c7ec8c3emr7464266b3a.37.1791796136626;
        Mon, 12 Oct 2026 02:08:56 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3bcb9cbsm3681883b3a.28.2026.10.12.02.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:08:56 -0700 (PDT)
Message-ID: <f7e864e9-8500-430c-8f02-915a162bd2a2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:08:53 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/35] drm/msm/dp: add support for sending VCPF packets
 in DP controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-12-4b81473185e7@oss.qualcomm.com>
 <20260929045000.55AE01F000FF@smtp.kernel.org>
 <t3klzrnzq3oicg6djkv6ixwy6oteo6c6zvnpddbqk5pjhsodoh@qz7pcou23no7>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <t3klzrnzq3oicg6djkv6ixwy6oteo6c6zvnpddbqk5pjhsodoh@qz7pcou23no7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX5IhnMEsEPLTk
 Igcwp9RjP/9p/ciiDm27pXoF9T2WfR8mJtjDdyD90Sm/+U9jnVo/x+CSQRwfLD+HgrveYJlu1Kh
 8Z3b5m3ybVaefcu2U61bHrEBj3BfzeCKa0yx8TBgvLd/17ecDZPE3qgI4pJuGJK5oFMKYkcRSdW
 3uA8g1XHyvd3HgDvF8lwWBa59UzM5h93dRWKMZIXdlt3XSIw4h5gUhVR+8UbaZDaQ9fat8S0F3T
 wwCaf0z4uaRjP5FGGNrYIW1GOJUwRwv8fzQT+pZksEHTqgtt4CUiujRW0CfJPfR6JyKA8UZymwr
 sz7sAJ/0Wr7rApAaS6XypDZ0l9/V6zcjAyfZLSfwJJUvOJZGahUVp15FmqYduRjXFGyj0/z64M/
 D7kzqUJdT0LAkaQG0xS7JIFviR4xUzPDYkZorgX3lbl8gHWhNEgZp8OxE996btZ2Jx9AsRsMQVK
 hWv+3M73zaoea5uXOfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfXwp9QFkEnDCeO
 pXIRMr2DRPCzim0UnZdKQVnaNz2gQbcL2AG9mKsOtqRnzZeP9JDB5GuuRTqoJJSR1Nm5zfh31w1
 KeN5Ek3qigcljxBRC32vmykGY6yo/Co=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acca3a9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=61UhLNPrlPfkgRlA9uoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: jXHaCjBsjiXn32tywnZ2rtTkvINKp5NI
X-Proofpoint-GUID: jXHaCjBsjiXn32tywnZ2rtTkvINKp5NI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120036



On 10/1/2026 6:34 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 29, 2026 at 04:49:59AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>> - [Medium] drm/msm/dp: bitwise OR of STATUS5 and STATUS7 without masking in ISR
>> --
>>
>> commit 987123505b6cfcc4664c72feae6b070ad91b79a8
>> Author: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> drm/msm/dp: add support for sending VCPF packets in DP controller
>>
>> This commit adds support for sending VC Payload Fill (VCPF) sequences in the
>> MSM DP controller when stream symbols are absent. It introduces interrupt
>> handling for streams 0-3 using the STATUS5 and STATUS7 registers to signal
>> VCPF completion.
>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> index 9a0c9737e6d00..929e0f94f8ddb 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>
>> [ ... ]
>>
>>> @@ -2801,6 +2877,16 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
>>>   		ret = IRQ_HANDLED;
>>>   	}
>>>   
>>> +	isr = msm_dp_ctrl_get_mst_vcpf_interrupt_0_1(ctrl);
>>> +	if (ctrl->num_pixel_clks > DP_STREAM_2)
>>> +		isr |= msm_dp_ctrl_get_mst_vcpf_interrupt_2_3(ctrl);
>>> +
>>> +	if (isr & (DP_INTR_MST_DP0_VCPF_SENT | DP_INTR_MST_DP1_VCPF_SENT |
>>> +		   DP_INTR_MST_DP2_VCPF_SENT | DP_INTR_MST_DP3_VCPF_SENT)) {
>>
>> [Severity: Medium]
>> Does this bitwise OR of two different status registers cause false positives?
>>
>> The msm_dp_ctrl_get_mst_vcpf_interrupt_*() functions return the unmasked
>> register values. Since the values from REG_DP_INTR_STATUS5 and
>> REG_DP_INTR_STATUS7 are ORed together here, bits from one register could
>> overlap with the VCPF bits checked for the other.
>>
>> For example, if an unrelated interrupt sets bit 18 in REG_DP_INTR_STATUS5,
>> and it gets ORed into `isr`, the condition will see bit 18 set and assume
>> it's DP_INTR_MST_DP2_VCPF_SENT (which is bit 18 of REG_DP_INTR_STATUS7).
>>
>> This could cause a spurious completion of ctrl->idle_comp during a VCPF push,
>> allowing the driver to proceed while the hardware is still executing the
>> pattern.
>>
>> Should the return values of msm_dp_ctrl_get_mst_vcpf_interrupt_*() be masked
>> against their respective VCPF bits before returning, or should they be checked
>> independently instead of ORing them together?
> 
> Please respond to this comment.
> 
  Thanks for pointing this out. The issue is valid, and we will fix it 
in the next revision. >>
>>> +		complete(&ctrl->idle_comp);
>>> +		ret = IRQ_HANDLED;
>>> +	}
>>> +
>>>   	/* DP aux isr */
>>>   	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
>>
>> -- 
>> Sashiko AI review · https://sashiko.dev/#/patchset/20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com?part=12
> 

