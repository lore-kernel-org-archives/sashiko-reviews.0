Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD7382383
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779178072; cv=none; b=GozUSh0ppXxeI//OgntnnstbmnzHBesus3z0EmYLIY47sEi7p5o2cUvuVs1dEVApYviJyw2j7HLgYEA7UtzRZ4C2Yt8JD2EuWFrbLE1xTZA9flCZZEeiA61JcU3esedUp4Niv0uqkh+zqz/mZSmAjAGpLG+MmkB7IIIC7cN3UfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779178072; c=relaxed/simple;
	bh=zWvcwIF4ERIpXt2ngx1RhgBc7NobKg1QkGZaeY97xUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=beTib2idS3oBU9MMQ57GAToSKn8tN1eLopXBru/Zs9VPaMiIp0iXZZ0u6Djvv9B+XZeWHcgWE4ThJwbBzHP1gr6ky7xVkyvoC6imh7+Mz7GRj7i264KKeU4O5xJpsjf52G5Go/xA8mDSnCC9apTCdiuxmuraJJ1OHQuOCtyO+7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ahj4YoL+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JsmJDQrT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ahj4YoL+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JsmJDQrT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J3TMm62091139
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 08:07:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	59HAtg5RIziatbG8bbvWjgGc8UwWm79jY5ekjjZsbFU=; b=Ahj4YoL+D2JYypI0
	r4zA6MbuN3f/vxvqszhwf7wLupcQSzTDmeagy60Wv+LVDqE9kI0YQG+zgjOUBeVX
	h4yTQuWJIXhx8AGJGwgj2iVgJq4GXF/04UxHXi+cYAvTMcguxrzK4/D9nciIgNKr
	FjnVXe6dvshauDAuhjN+My0a88yfwbDxIKui3a5/9f9G3j83qxFIVPnAKMK1UL1P
	1O5JOXZSH2XlnL2s0jx72MiBKTFw97T25IO8oLWO0DCXgrzeHrR7l7AWHOfl8enS
	ml0WBEMHsbZ6VduM+uKTSH/0TmlU3LNwECAorf09Rj0WYUFDnGau7Ljq/Rt2qO+K
	zKSCjA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpmgde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 08:07:50 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-514551d5f2aso143410511cf.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 01:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779178070; x=1779782870; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=59HAtg5RIziatbG8bbvWjgGc8UwWm79jY5ekjjZsbFU=;
        b=JsmJDQrT6l07XTrNWcNuXScMPjdCSFHbZ4Tj3S3DIC1DUXvVvgulmO3ydVIYo0qfSE
         7jOzrS/w2ErVu1Se6hJaE4o8y7PlJSVZYnrLiFueJfBbHcXcGV/cwoag2VhlR7jS/ZEu
         YF6RJrJxgHZBF9Ff6LzX0g1zCvxIgVee9JzYRYLhsUld37RiN8C1R/pCEKA/8Rl+kPd2
         V3cdOVRcJ1jUy1AoMvjujrZS/fswSBKw2cIdk84mlymF9xWk3JhJcIzeHGf4YmWdEGl1
         mPQtyx7OD5fz+YHqxV2TcTlPXVCv6/7zXt5asqFlDmMy818n1ViqIcVbFU4abD0XFZ40
         juVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779178070; x=1779782870;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59HAtg5RIziatbG8bbvWjgGc8UwWm79jY5ekjjZsbFU=;
        b=qSiUf1ZoOgjzGWXGzxDM3ZGpSQplNnv7b0+EgDR2un4aXwDtimtjFJarIRxg4ZO9GZ
         KhVUsTkRFHdIur/tMucUdzl56TvyTjrV6Hf2IHUsCZqbs5F+vSKZBU5uB+tkchc31njq
         mLDi4UmfIgNuofoJCd0n8quELn0c81ln92n20bywzRuARAXI+3SsyK0qAuTRgHbRWntd
         v0KPXieC0ruM7S5OgocNDCmGjiMVVrAjh8SBCulLMycxmJWu6aBtuyUWdLGIbFVo3cFi
         aYAR0mLIyTVYjqXSWNnJM4Q2Tl8CHRwPPX+5XO40OGopw5FM6SHIdjn1bBEWK5ryyBRP
         qOrA==
X-Gm-Message-State: AOJu0YwuvY7baEH493kxDAqYaZL2ikKA6FJuSyZhu+34DZhbdeMDOLnd
	uITuGHtohMqeA+su6hpIW8JHzDkiubmYivNDPfcbF9mnPpROVqOEwXMMwSC+SwTF6La4rHyCBvC
	USGVKPx8pmBr8jTO6Y9XIfLfceXIPIHOPmuoqV/OTzWakOdFGqorbKDSpVTldq1HEv/KyhxmesT
	HLYJk=
X-Gm-Gg: Acq92OFGPpYaEKkOcZTM0Ey7fyuBqQ4FTgdNz8y4pdjx8imV6dJhmbO9+FvzU5YVdsb
	piu4YLvdXt8yZNpd4IhWjY2Ey5jbs3Om5dT1Z5oxhMOMkGsCREcpE2UZRLgpMR7IavTkf1/17wh
	GytIMJIU+rLVr1Lwxy2AdUp/viOxxyZN97hZE8sTjiKMlV+38jpvgAFa9KCcK5341Mm5waWja1T
	kpAzFIjyuB8jgeJsnBg9qmYTcHeHgFczT2t+kKnb4y+7lwmQkEL4DTdmMM9I6Zdsnr7NQS2285P
	E3Q3Wi13Pod/trpGyTutEZ6S6dFPmLfDCyspDq37ZklEBgBlp+wjLL7Q9owral05rYm3pwaVgxk
	9LMEuNbTyrfRVszoMzzM0mIn59pw2+jeW3X0qcGkwFsRkE31p
X-Received: by 2002:ac8:7f8a:0:b0:50f:b732:202a with SMTP id d75a77b69052e-5165a04b49cmr250713931cf.27.1779178069994;
        Tue, 19 May 2026 01:07:49 -0700 (PDT)
X-Received: by 2002:ac8:7f8a:0:b0:50f:b732:202a with SMTP id d75a77b69052e-5165a04b49cmr250713621cf.27.1779178069553;
        Tue, 19 May 2026 01:07:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm46736177f8f.10.2026.05.19.01.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 01:07:48 -0700 (PDT)
Message-ID: <6535af92-9d77-47c0-b4de-247662b6bf31@oss.qualcomm.com>
Date: Tue, 19 May 2026 10:07:47 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Constrain clocks for newer
 Qualcomm variants
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260519074059.61405-2-krzysztof.kozlowski@oss.qualcomm.com>
 <20260519075750.CDA9EC2BCB3@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260519075750.CDA9EC2BCB3@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fhAnm8PUXoWF7bm5Mfxc6UjEHS81QJKv
X-Proofpoint-ORIG-GUID: fhAnm8PUXoWF7bm5Mfxc6UjEHS81QJKv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3OSBTYWx0ZWRfXyZI8ieDr7Bpj
 jCniQyccAGKFgMXp8xLYZiXXOzGSA+QFP1x3pe6CYOJiXqr0mIAsOiRokwHfcGvIqOu8ldE9LU2
 scyCi8ykTeKaAy4QRxBQk9xvMo4lXSPC1LbQnnS3SD4VZ9sN/Sr5aRkIsCdt8kqEuOe/kbYGKPU
 keob/lMN9XfMW+5bpoGc4sDyiLiFiOd85QV07qOv/GpjCUz15wgCmuNJAC/eAgOoeihNQiya/7c
 88fRfqRWvVvb/za35wN3AvtSkGtDx2HkKvLoiU2H04adqJHsi5GNdWbdzxZuIdVxjkq0vH5cwAW
 8Go352mgCwxh6Imrkph5r8CZaj+80PgWCAcnAIIKDkUdsNnhWovgDujB/XW0yRWN8zlnjAFRH9g
 GVBV1xVmf6RiuTRGiJXI6rBORhHE/bLlMIcPscNa07qmrMUZhslRKv+LwQT6RRyzCQp1cSMx0Am
 hYl6CV2LVdmp0dMjOSQ==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0c1a56 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=x-AoecE9xypBXIETJxwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190079

On 19/05/2026 09:57, sashiko-bot@kernel.org wrote:
>>  
>> +  # Disallow clocks for all other platforms where specific compatible is used
>> +  # with different fallbacks and only one combination has no clocks
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          items:
>> +            - enum:
>> +                - qcom,eliza-smmu-500
>> +                - qcom,glymur-smmu-500
>> +                - qcom,kaanapali-smmu-500
> 
> Are there a few application processor variants missing from this new block?
> 
> It looks like qcom,qcm2290-smmu-500, qcom,sar2130p-smmu-500,
> qcom,sc7280-smmu-500, qcom,sc8180x-smmu-500, and qcom,sc8280xp-smmu-500
> also share this two-flavor pattern.

false positive, these have clocks.

> 
> Without them included here, will device tree nodes specifying clocks for
> these variants silently pass schema validation?
> 
>> +                - qcom,milos-smmu-500
>> +                - qcom,qcs615-smmu-500
>> +                - qcom,qcs8300-smmu-500
>> +                - qcom,sa8775p-smmu-500
>> +                - qcom,sm6115-smmu-500
>> +                - qcom,sm6125-smmu-500
>> +                - qcom,sm6350-smmu-500
>> +                - qcom,sm6375-smmu-500
> 
> This isn't a bug, but are these two variants redundant here?
> 
> Since qcom,sm6350-smmu-500 and qcom,sm6375-smmu-500 are already listed
> in the previous block to unconditionally enforce clocks as false, does
> adding them to this more specific fallback block have any additional effect?

Ack, I will send v3.


Best regards,
Krzysztof
