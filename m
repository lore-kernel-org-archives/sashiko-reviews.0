Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA8438F250
	for <sashiko-reviews@lists.linux.dev>; Fri,  7 Aug 2026 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092719; cv=none; b=h30nx4DIVa7JSbqAQGDBVgn2OBcPJhNc585kGhtQF5pQeVJpTPCWtwjwii3o/oOWymNQz9kzTK1M++6bnVFfWjMMo+6CgtcCghTwNd8f41J79Ll4MNN+UjXfPxnMyFzalEXAUtympnv1MQt3jLlkNnIWr79uZzqTE5iczA28U3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092719; c=relaxed/simple;
	bh=e3jsuGhBxHLui+In1zgCjXokCiudyrBbejqq5AfoXV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qNft3gvWpIyueLbHhhk+qd+V0azWuTPJNaRNuvKL1KJvK2dkUA67SgP2vRAAGI1xCU+Dl+WOHnHADSqLZWf06qguuI4cC9xGwINCEnW6wn3xrnXWdTubZQ5M9UnSZpPB/JZx5CkaL5V8XYFkh0MytN4jjrxZaFBsbNI6uOiVqLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9WTUG2p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qb+fTMgR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9WTUG2p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qb+fTMgR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777onkx3218043
	for <sashiko-reviews@lists.linux.dev>; Fri, 7 Aug 2026 08:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h/Fn9keX05U9JPUaWjJKJl2eCMtAlThD0WpvAOwLFNA=; b=I9WTUG2pZtLI6gYP
	AjKAGqOHFGVxd8/J/H4tdnPnPTqj+nhXLmkwdV3tZ09EiW0zq2sg3v4thubFRfLK
	h6Db1eF/BhT465ZUI7Eh4MT+VxSYkXDFUxyqx5mmNkpk3iNDEfvBHpAHfWlxw16b
	XxrxRNcb+8ylJ2/5yqnGBSzP5VPPksRBJ3D4xFwVrXy39MZt6uKD2Yvvoyu7XkGj
	xpI70IP03TS5qbIsfQiOnEFStFjYw59S/pPEML2ckiXV5rKrA4Hmh+HMur5H0Wt5
	JYU70+FCylGyzr4rX7/xaEfvgH4RKm9kIchqdcktAPWwukjxJRbKCNrk+OBKPyTm
	ZTB+zA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hu290-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 08:51:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so5264823a91.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 07 Aug 2026 01:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786092714; x=1786697514; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/Fn9keX05U9JPUaWjJKJl2eCMtAlThD0WpvAOwLFNA=;
        b=Qb+fTMgRL8iXNqRfmgz2iUhj+jTwIc0PkcIBi5ZrnuYAdoUD2HPaAfl6UebV7y9aOu
         hnocHcXFaKbwA7lUssZBPRRVM96WBilTR7ZeTSYNQ+IGDzltfrLk6bx/AgZ2EMXTLylD
         jM567plaKr4isyF6hEHkMy6jEdcGuRtmpNNKI763zBY2wx1+5gJh6Q0Kapxp6LHNAZik
         f1d5GM8jl/lOcwo623rlBCSdTcmBBIocaDIAG6LF6DzSVxTG/EvBaevLfKr/Vp7+BYsj
         gPovr0+WLy0+G1BaIXvR7ezsy5+zLKJ3771I8lFNBvYCVgQklNs4/5SLtUXCBg+Fkm3A
         12bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786092714; x=1786697514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h/Fn9keX05U9JPUaWjJKJl2eCMtAlThD0WpvAOwLFNA=;
        b=MhIcQsk0ZLsuhB5C8XzdPkFXcZ0nJf6diFMFpiMh7tEPh7okwNyewhHBmkzUylDZrV
         Fa7rubf/pqwWlcp2c64cNYpxA6JE7BwFChBziMYWf3n/O2FZnL12m7z6B5fkjvJmTUic
         1o+qZQBhAyOZVATCiMUjAjg8f/gcIH0AmPu9CtB8epVx13UMRxIFKEQVWpsaRUgKsSf3
         plHsghwx73acT+y4zNR0hd8FaAqVUMHVAKA74aO8hYXwtCBrzC2J8QEmIVUcmyT6VOgr
         0XMuUU0CQvX8gC0xN67/sr7tVhpeW/1IMpvp6OrJrFDKAFmmU+ES63igAbEOwa9R8Bt3
         Xwxw==
X-Gm-Message-State: AOJu0YyGiCSrLGB3iuNXNWuxNPRD6TvNlMf/EobUQLr5BlMQo82dy+zR
	Z5UhGHxAuEn2KDV6Lp7sBog3oTrdjOE74F97DONjWUB28Te50I2+acVgTq+xOhPT3EHRUTHzdKh
	cmOFtQ8DRL60LErijnF3CcS7sJOJT6TzUFqzvrr0obWLzl0OJzTIAB/sVrSI26ZKS+O+UepnZmI
	04Rkg=
X-Gm-Gg: AR+sD12ZeCOZ+d0AtYHIPGo4Ffl7ezzuMhSAld0oQromMrvxMIYD9Kh0pglyzUnnrEE
	FkJFQpLJ0Kf6MsvBmkvg41a5WlAEj+3IoLz1CEo+KFsdE/hUcPlnc/ds9FFuVTzA167+z+bW82p
	vScOzTx97UvO0GR3Bn5oNyvnpXA8myqOZA9vaNJ7ilb+4Hn/0aAUPvcY6LFZKMxI6pkQu47F5+B
	3oz+07LKlXUW+JoBLmqA61MPOoPAjp0g5VLg4TQseuoBvc3oQkYprq/s41z5AIUGXlDrHZkacWT
	8Ps+9ZbZTY/ZxP66Ip1nRe4hFdQOYApeJt9zxr5FXBsrEqwlhpmiq7rMU57yR+VPhhj0ST9VvfQ
	IjF2zpWap8+1RgOnD1bG6Y9FdvORWUhAIa3Y=
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr24674573a91.5.1786092714541;
        Fri, 07 Aug 2026 01:51:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2dc1:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-3903c535d79mr24674501a91.5.1786092714010;
        Fri, 07 Aug 2026 01:51:54 -0700 (PDT)
Received: from [192.168.0.173] ([183.83.142.146])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a9220sm5754464eec.7.2026.08.07.01.51.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 01:51:53 -0700 (PDT)
Message-ID: <3b0d07fa-6251-423a-9a1f-ceaf5cb2eb4a@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 14:21:48 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/22] dt-bindings: media: qcom,venus-common: Allow IOVA
 reservation memory-region
To: sashiko-reviews@lists.linux.dev
Cc: media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
 <20260807-iris_iova_600mb_fix-v1-1-3996f67e33f9@oss.qualcomm.com>
 <20260807084913.384D81F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260807084913.384D81F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NiBTYWx0ZWRfX9VwNTkiDTRbk
 jDsuHyqTwd+7BMWnHr/U5jSqqEy+et1p/gx2Spzj7PxXSs0e4SMoKt0fNOx8To6Wmzv8fnPbnUw
 c9uHWRyj5hEjNrUPwmjWs1u6ZyCAeLI=
X-Authority-Analysis: v=2.4 cv=PK0/P/qC c=1 sm=1 tr=0 ts=6a759cab cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=eVbXwf39F0J6/s7D6zfB/A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ypr4sf9bQseyws4CTX4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NiBTYWx0ZWRfX+D30CGixCn+y
 YfqrRCktp9iaf/HKmwdn4xyjyEFapI2N3Z/ObbnHTFC/Dcj5UYGXYTdsjpcpoBxHNr/1JBzndQI
 rv8JCFUSD+rW9TRy5LB3Q06b1kZL3s4RH5JaZBR+A4yWUDn/D+K3PIg/QwnxPRQLas8J5rlAJwC
 qL/KkUzlnicmK+YHO/rFw+Vbt466eh30eMySkjuEQwMRTg+M/lFxs565N9agSgiM4cRqJ6+w4tC
 MvxobXXIzhLKxnnibGrUbWIDD+G3gXGav9BHtlAxY+Gf+Sb4R/ouhN3aDfxadAeJl4Ej8wZYYFz
 HYzPDG0pLGohuYcexK1VzrReEwfIyBYniK9wA2UIDdTmqA0eDU4Tate63ggX5PgrownvAreherL
 bdaPU+F8ImUc8BVn9ZXqCEsoC7/DkDDCTrYkxBHzkYt4xxIfRthZPmMofw21AXC2zuRklYFvU6y
 Zudri3qroarQyGkC/xQ==
X-Proofpoint-GUID: pL1aGp4cr33NVAaPGqi1F-ydomCNvytO
X-Proofpoint-ORIG-GUID: pL1aGp4cr33NVAaPGqi1F-ydomCNvytO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070066



On 8/7/2026 2:19 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The patch updates `qcom,venus-common.yaml` to permit a second `memory-region` phandle for an IOMMU IOVA reservation, but fails to remove a stale `maxItems: 1` constraint from `qcom,sc7180-venus.yaml`. This prevents SC7180 devices from successfully validating if they supply the newly permitted second region.

patch #3 in this series incorporates this comment.

> --
> 
> --- Patch [1]: [PATCH 01/22] dt-bindings: media: qcom,venus-common: Allow IOVA reservation memory-region ---
> commit 44e20424e211e02ef9914abe4592c185ad0d75ac
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> dt-bindings: media: qcom,venus-common: Allow IOVA reservation memory-region
> 
> Non-pixel stream IDs should not allocate IOVA space from the 0 to 600MB
> restricted region, as this region is reserved exclusively for secure
> non-pixel.
> 
> In addition to the firmware-loaded codec carveout, platforms need to
> declare an IOMMU IOVA reservation (a reserved-memory node with
> iommu-addresses) to keep DMA away from restricted IOVA range.
> 
> Permit a second memory-region phandle for this purpose, and describe the
> meaning of each entry so the ordering is unambiguous.
> 
>> diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> index 59a3fde846d21..0be2f9119e782 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
>> @@ -37,7 +37,10 @@ properties:
>>       maxItems: 20
>>   
>>     memory-region:
>> -    maxItems: 1
>> +    minItems: 1
>> +    items:
>> +      - description: Firmware-loaded codec carveout
>> +      - description: IOMMU IOVA reservation region
> 
> [Severity: Medium]
> Since this patch expands the common schema to allow two memory-region items,
> should the local constraints in related variant schemas also be updated?
> 
> For example, the local constraint in qcom,sc7180-venus.yaml restricts the
> items to 1:
> 
> Documentation/devicetree/bindings/media/qcom,sc7180-venus.yaml:properties.memory-region {
>      ...
>    memory-region:
>      maxItems: 1
>      ...
> }
> 
> Because dt-schema evaluates a logical AND between local constraints and
> the included $ref schemas, won't SC7180 device trees fail dt_binding_check
> validation if they declare the newly permitted IOVA reservation region?
> 
>>   
>>     power-domains:
>>       minItems: 1
> 

