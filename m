Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416462;
	b=AmcS8MXT4DLgm9Fi9iXWAMVfz8pJohZTKQTmT7fYKzcWkGMpd+9/RaMYVOt4q+xbGsw5
	 7wHOW4cJkkURBU+p8lFFfj91HHEKmSNC8zeiKOEFpYuz70sn8sDVhnK+tZN+gbgexfZSq
	 9ZdsWjb5kcC72IW8O8gWB9uayWB+qrN0AZzclVddPExfwG0SyoAfHPfsvgiYlPKW/V/St
	 GESn9OWlZidk6hBqmljOn/oUG/NWkiKoET8U53IvbEb9/eIk/7S9srpSHFBaKmHOUyM3X
	 T5DUPJM4uwKRvwRuMX8B5NmfykwT1/u3zOT8I4qG8oEAlkm/ZacY9efCaktknYl02uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416462;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EkvQnwkJJcWAN0emGOjl8nhSfJ3XAraZnDzQtBA1wZA=;
	b=Qxq4sYDKDlUGgIA28v5HqHeHHsgprKGqu+P7HLVq/e4x9X3wGtecx29QBOQBAOBpFuF7
	 LlAGKhP8bui/jaBskzo6k2lgFeFM1LeaqQYWR3VjTLADJt0nyTxUZ24tXM7M9Ecf2K9/A
	 0f+ZUDLcmHM4DdxAnq8y+qGAX3aT1kzp0WVkQohO51qkPkqRzHnR32qza6vu6dKocJ++g
	 jERlQCjjXx5eviruM0JcSWNo7FhouFSLwtHKJGfTB3lQSaqwFLbHHi43M/VKKZ7iGYnH5
	 v/bW/X0uh9KctxEOYSdzvMfgDbIs90y7E0Exlt7w5qZ/s1QRbj86G8zjCeLuzOYYfcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DB/9f5zb";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fk818x2S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F76606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 06:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10F76606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB/9f5zb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Fk818x2S
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN68DtW1126885
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 06:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkvQnwkJJcWAN0emGOjl8nhSfJ3XAraZnDzQtBA1wZA=; b=DB/9f5zb6LL/s06+
	7AkH9xZyg7KjWX3p1n/3CRpa6iy5m+NNqcP1Qv7ovi2azEU+MR/WPzisjQvhw1il
	HqDgzSQbnfaTOry760OhvONqpoDK99zO8W+GWNRYRGpa4wB6IJgNtnjjEC7al0Ee
	4HTM1rtvs1cDL3d02KJz7n9k4TSpBxWkUKgLfjjdZOw3Xi/QFJ81754XuezXAcGW
	TGDRJC6N0FKx2xaCeRcj6XdT6g8LBO9axEaEyxQdCjdv5dwV57lGF2SSxLzJvPSt
	bRN1QssiuRn+jROWhYKPuXVD8HF/X5weB65V7rGfaDycvmUnm/8ce5uST+QyILHv
	9b7v+A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy004ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 06:47:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3b167bc8e16so2427103a91.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 22:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795416460; x=1796021260; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EkvQnwkJJcWAN0emGOjl8nhSfJ3XAraZnDzQtBA1wZA=;
        b=Fk818x2SPimoN/3zryR/viu8SRsOvfZ/qjqkk9SmnSgfbmeSUbfM9QvUc8N87wBXYD
         8GvAGNjcVojnb54VqECdKDAXJDsiOAXXwy7Hdi5KMTMl8GTEkPb+pceyO2jdZFq0CCuz
         m88/W5y8+S2LFgSpKP+xDSnUM5InYQL+I5DpPJdiRbyPpiwWJIEI4I6ZBRqhfLrhx8sQ
         4NNDmXtOZ3GwWqANcJ9MxRzRXf2FU7kzQp8/XJEwJojLXO0f65uDzACTYUa6rkCoSDsS
         iOHX9/PINbsqQugCxkljANVcpDnE3o7F0KIIsn+JDlGT8KEBiZlzT27/SYJULgqLlqpD
         ZgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795416460; x=1796021260;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EkvQnwkJJcWAN0emGOjl8nhSfJ3XAraZnDzQtBA1wZA=;
        b=JPxU+2+muNYgM5wsXXuHx/253tJLUsRKwK36wxt99hPUsBy25Ck1CM+gP/Hj88mpXe
         ihWgJiAFuQd7CKxd4FccJ0Mr/UZM27j9v0YXv/66aush6EYzPzHxk/UbTi9eVLdRkHYB
         mm33bSw8Zmg8gHSGJ60/iay/HMAMzl1s0LGwB82voetz3IKh0kSYm4TK9rXojHRVTRvg
         L82nLzRPx2lprJXXAitL1DZmJhs3sDqSZx/rKtnf0k5m/JMcO8nUMKL6l4QHS5wRQTpS
         YiBFO/ej2IAuAIA4jIrxZvkBYoyGRUA6Z7mY6CG6JVwz+QOrtPol7cTqhJ/pZ/QsQFiH
         T/bw==
X-Gm-Message-State: APuU4Z8namyODTto9MpKSfd5hAOm3gOqHsDdXNvg8Z++8sNQq86lin1M
	xOhgPUUZ8Xy74IL7o/IDUV9Eb4YbrwV45wsX3Hnyp5nkQO/bPaeq6nFk/ImPh2QK3LpcJpxgpfl
	FtzgTfnfUpuTSsrwuRSiuDfVnn+6+I8w8MeAgQFrkXtAK9/uLdbcQsEQH76mllgBmVg9aJjO3Cm
	Qpslw=
X-Gm-Gg: AZFdTZfLgVsLjQi0HqUHCvfDvXZcptX/nj1rQigwd+scL8lf2Bg6s2JBZ1pLQfTmD8r
	iN4QmnVWNGVo/lmLagmpu+QziIH8JBL2Ozp8xSdAfM4tH3qWIZ8yuZnMjHoxVlN0j8WWt+MSzST
	eE1yYmqsLSNfMjQ3ei+0VleCv1p8QHTFFnffLEbiEJyfqms0ubW2RLARIQ8II/8MAmA/su7OQh1
	DUnUnXCa6pm0qKFdVL0DyErXV907EKgIPL0gTbNtAuJVTw0JllLccAuAY8ONH1ufMNjNN56EFlM
	BAtjvGrvRbdeD2tgCZxV8GKwzhb7jj+KlASQDgCqM1NUZpeuoumTgkUf3uhDc7DDmDx1OB/rghx
	oFKZ4s29EQVNQdOXWxO58cFAlYGKG42W6Rfzs66UgAQgJPMWKQuHp85p1avf6A41JVnW40nRSfm
	JD
X-Received: by 2002:a17:90b:2f8f:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3b41c933eefmr9505042a91.35.1795416459654;
        Sun, 22 Nov 2026 22:47:39 -0800 (PST)
X-Received: by 2002:a17:90b:2f8f:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3b41c933eefmr9505026a91.35.1795416459202;
        Sun, 22 Nov 2026 22:47:39 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d1361fsm19057034a91.6.2026.11.22.22.47.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2026 22:47:38 -0800 (PST)
Message-ID: <2fb796f9-bd23-468a-b70a-ac1924ee198a@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:47:35 +0800
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
Subject: Re: [PATCH v9 22/29] drm/msm/dp: wire MST helpers into atomic check
 and commit paths
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20261119-msm-dp-mst-v9-0-ca61be4edfc3@oss.qualcomm.com>
 <20261119-msm-dp-mst-v9-22-ca61be4edfc3@oss.qualcomm.com>
 <sashiko-outbox-222708@kernel.org>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <sashiko-outbox-222708@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNiBTYWx0ZWRfX9B1bo13s3SLb
 mG3Iz+06ej29CPOOIrcsLehdTr1FJJfZy7zsiWr8XHseA7XVpGB5tXq63HIaulblLquU0grnqos
 SEyzeegJol7ji6n3KieDUNlKAgzmOnCwf9+5pYNaZSGUzaUI+4OqIZRHT0uRFhxhqpHtZ2aWJLM
 YQUoxu2wdpUWVln05/KcYTC6v9/3LCSV66lE9RwWOwmjtnJbIXvrbNa1Vc/hy5xJacsHoep6ZOk
 YHf2h7nC38IMxnfxKRsBy2mRzoTCKO7OQBl4W0/jZu3VpbR9b/Dmu95LwVtth+ZMi5ScM8Tnvhh
 s/giK1sWaLG9lmo7HFEUi/QCGJLl3DTur+Qeq5G9xsEURAmYLGuY0sRnaitmap5NAe29EYWs625
 HIwlJ8CUxGPsa3UoN346MUUWaaDmVVRYFI+cvLvKnWJCqzvAIFTe2HU9fu1fWmXIzaj72BvHYE+
 S5iYKzXoMK3pRjxIUuQ==
X-Proofpoint-ORIG-GUID: bJmoJfPS3WyTbxb6Tb9I_HAmIL4RkqkY
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b03e18c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=LrEcQCBHgJHnzhMH_loA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: bJmoJfPS3WyTbxb6Tb9I_HAmIL4RkqkY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNiBTYWx0ZWRfX30nhkmL3yWr1
 7CaBD4rUx5MDLC9rvkjYy7JVzepM6BYb0l14e3Shcd9slhUUVXWzD9TMoDufvmnTlz2tADqZvIn
 nrDXQ5Ia5OyO0of8Z+JO4dkIamnHqjU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230026



On 11/19/2026 4:46 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/msm: link failure from unconditional DP MST calls when
>    DRM_MSM_DP=n
> --
> 
> commit 45937631fc3531311a3391632556b054bf1c3512
> Author: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> drm/msm/dp: wire MST helpers into atomic check and commit paths
> 
> This commit wires the DisplayPort MST atomic helper functions into the
> MSM KMS atomic check, commit setup, and commit tail paths.
> 
>> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
>> index a8babf1dbe0d3..e70e5088cfe53 100644
>> --- a/drivers/gpu/drm/msm/msm_atomic.c
>> +++ b/drivers/gpu/drm/msm/msm_atomic.c
>> @@ -4,6 +4,7 @@
>>    * Author: Rob Clark <robdclark@gmail.com>
>>    */
>>   
>> +#include <drm/display/drm_dp_mst_helper.h>
>>   #include <drm/drm_atomic_uapi.h>
>>   #include <drm/drm_vblank.h>
>>   
>> @@ -207,7 +208,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_commit *state)
>>   	if (ret)
>>   		return ret;
>>   
>> -	return drm_atomic_helper_check(dev, state);
>> +	ret = drm_atomic_helper_check(dev, state);
>> +	if (ret)
>> +		return ret;
>> +
>> +	return drm_dp_mst_atomic_check(state);
>>   }
>>   
>>   void msm_atomic_commit_tail(struct drm_atomic_commit *state)
>> @@ -221,6 +226,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
>>   
>>   	trace_msm_atomic_commit_tail_start(async, crtc_mask);
>>   
>> +	drm_dp_mst_atomic_wait_for_dependencies(state);
>> +
>>   	kms->funcs->enable_commit(kms);
>>   
>>   	/*
>> @@ -322,3 +329,8 @@ void msm_atomic_commit_tail(struct drm_atomic_commit *state)
>>   
>>   	trace_msm_atomic_commit_tail_finish(async, crtc_mask);
>>   }
>> +
>> +int msm_atomic_commit_setup(struct drm_atomic_commit *state)
>> +{
>> +	return drm_dp_mst_atomic_setup_commit(state);
>> +}
> 
> [Severity: Medium]
> Will calling drm_dp_mst_atomic_check(),
> drm_dp_mst_atomic_wait_for_dependencies(), and
> drm_dp_mst_atomic_setup_commit() unconditionally break the build when
> CONFIG_DRM_MSM_KMS is enabled and CONFIG_DRM_MSM_DP is disabled?
> 
> msm_atomic.c is built under CONFIG_DRM_MSM_KMS, which only selects
> DRM_DISPLAY_HELPER, whereas drm_dp_mst_topology.o is built under
> CONFIG_DRM_DISPLAY_DP_HELPER (selected by CONFIG_DRM_MSM_DP) and
> drm_dp_mst_helper.h does not provide inline stubs when
> CONFIG_DRM_DISPLAY_DP_HELPER is disabled.  Unless DRM_DISPLAY_DP_HELPER
> is selected by another enabled driver, linking fails with undefined
> references to these three symbols.
> 
Hi, Dmitry,

Sashiko is right about the link failure with CONFIG_DRM_MSM_KMS=y and 
CONFIG_DRM_MSM_DP=n; I plan to fix it with thin wrappers in dp_mst_drm.c 
and no-op stubs in msm_drv.h for !CONFIG_DRM_MSM_DP, if that approach 
sounds OK to you?
