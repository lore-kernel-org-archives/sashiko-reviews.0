Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4A61FB1
	for <sashiko-reviews@lists.linux.dev>; Sun,  9 Aug 2026 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786278749; cv=none; b=qd3nP1UvujtO9x0fICfMzpef2U0zqV9wd7rCFPHjSRK9ohbJ02GadV/x8cCYG35gKE7bh9FYZWLo8GbMjpoY4rO6ml6KTAt+pD6rSWFY1kjeGFd4FqjvOXiLve6yIb+0pBM3YMcdkGNf6Og/xIYh88/B9hKLlnAFc/a9eXsXP40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786278749; c=relaxed/simple;
	bh=h25Al3YV9d9cDAlZPKfZ0/iWPXeyX1vX30AkLuHyAEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JAur2lYsBRi6u/ruC2Beo4nImcug5OatS9nempitj2i7VdyeI9EQSS24DLImDlw2F7ysFFZDnG6AKHjhxpMSU86M8P7nsD6wqg6h6UW4q8r8iAP5vi0Fj6YrDE7r707kbtdx2KTL9Vcv3sk9ydwwM7VwTl+UlyhHWPqF11aWwM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eu+VNBVZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVwbWy+o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eu+VNBVZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVwbWy+o"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679C1ido1945632
	for <sashiko-reviews@lists.linux.dev>; Sun, 9 Aug 2026 12:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4u4WW6Emq7DmRx4bgmyS5ORnD5TRmpSecDumYKBQYM=; b=eu+VNBVZDCCCDrc1
	G89rIrycF3L6SXPDFfuMVIb4Gd+Alg6IwGB61jrmMEtOrKZr5sD40ZoW1jb9UNBT
	N4HOyhIIZ2ghcUYpP1Khuynur6WI0sOhBGHB8q1N2EA9IW3MhaWpBSPd/Fl7qwMB
	3r7TSJGcmQ7ZbzsaUFIJkhrLFo/h2OGEZokbUgSwQ3Szv8Ar5UFMLSo9TiRAtNXR
	8pbNJBy6pGGTBfZLGjwWND9MZEvcwpKCtRH2T7943+qSf0Vb8TSffF7Lyxnk0rzE
	bPlcEKz0DEoA4ndrPwPjoYzb4lCcovB8I4nWoDhgSTaLE+CZO/Qb6dCiQkp0oQPt
	fhWmVQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwmgtrk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 12:32:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacf17c7e0so15635205ad.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 09 Aug 2026 05:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786278746; x=1786883546; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4u4WW6Emq7DmRx4bgmyS5ORnD5TRmpSecDumYKBQYM=;
        b=JVwbWy+ovv0/QOYkuwEwH85ksWbx8D7oXY74ttXA4EQjvVpkhSsKZV+xQurqzn9N2p
         jVj5qFcNhJ8d+rBwLwg0elIzSwP6QoDsRkZ4BGufkht9c7urRGI7QL4EL9+JBpo/Z+4i
         apM++nbUsvS0OWQBz8yqmdiOJ3A6/IyUjezUePa/I4zqS01YqTvO3w8Ppvly9EVM88zl
         iYjFZIalR7JMyk8cXZp+go7vphLkSDudCeGo2xPFTPIzc+OFOVgM7R1UYQp2sccZPysx
         3Igbt80y8VhNZs6WPsBTY95rGdihcV0vQVhrCd3CCnvSR3VrXce2y9SbJSBmyG0khSuC
         37nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786278746; x=1786883546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4u4WW6Emq7DmRx4bgmyS5ORnD5TRmpSecDumYKBQYM=;
        b=tKnD3aPH3op3MW7mPXa8a5WwND743iBDL86HlEZPw1JCIL16gGPS+SOgdy0vnVtMoB
         zqc3X02h/Rnq3HFvVAyo23gPbtkeWmMu1vmfZGXNFMjKRUwAvaVXgZMUQlPxewobLrBB
         JU2OyWmAK0J9pWulxxgzjShpA/2yLsUQBJP0sM+Qq6KuZ75V6WPO4sle2e8byTVgpOno
         YHMzYQTzQWiogzNiDN7NllyMbEh3FCu1LdHVj4g8dPW3o4oQ8YjfBcXSfq/BVtBfTfu7
         NvvU4CQ9GbbapOHLXCPIoa/jVfSFS+KrS1S5hYwFzK6StqMHf+akyB8epM9RpjFEJ8qN
         AVdA==
X-Gm-Message-State: AOJu0Yxh28rjtZuePTNkiZrfVwPazwM2ZP6Vvy+vYaXC4/L4FsOmA0UA
	Q6Dw59PRzD8demF807jZFWkFaHNARbnTJLqKgB1j7lEfGn5kNISQGBIHtYaMRw46pbXj1c1oN5d
	EaVVCKlNIITgrJuyRJQoZsgpxGHRbPYnPyvG1mG7hR1qlkHDnW3jy0+YmaDvUG9XXphEXg1nMsA
	30AsI=
X-Gm-Gg: AR+sD1321y6fHiPjGh4fqHnV+h6CF7qlx05fkXr3GlhAC2PgVH5jc4MPOXlcolABOmL
	PVEsLaPdr3pdiAeJU5xSNyzMrAji0WBe3tUm0P7+1i+5ClyWuE0iNoePOZ4Vhin+JgtfoG1o0cM
	MnEKvpk/DDDrQpstUlvujY3XjE6C9OFgv2/7xQfvvCiR6h+l0ik0OKfQaDBB3/MfcZ7U5ouX0MS
	sustoYH4cBnfcf5VRgaQwPNCCMBGA1T1w1IiyM5WTjHQqdWxRTLC8Vt+BuED21Y8KiTyT5QOEh+
	saArBX+EHN7foEyjn++VfUivYxXLjLmivHjBvzzg2FzS7MpzDLin7bZGT+gbJR2z1KR5bwvCpNP
	I16HRIfNwwPl1RxE4zfHfPGBD97jOXfBlxNQ=
X-Received: by 2002:a17:90b:3b4a:b0:38f:23d6:b4ad with SMTP id 98e67ed59e1d1-3909d8172edmr20607243a91.8.1786278746136;
        Sun, 09 Aug 2026 05:32:26 -0700 (PDT)
X-Received: by 2002:a17:90b:3b4a:b0:38f:23d6:b4ad with SMTP id 98e67ed59e1d1-3909d8172edmr20607205a91.8.1786278745623;
        Sun, 09 Aug 2026 05:32:25 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec128a0sm34782357eec.25.2026.08.09.05.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 05:32:25 -0700 (PDT)
Message-ID: <fc97e786-dd1a-4f3b-a843-55de6cbb193a@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 18:02:21 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] ASoC: qcom: common: Distinguish missing and
 invalid TDM slot configuration
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260808181948.2489187-1-prasad.kumpatla@oss.qualcomm.com>
 <20260808181948.2489187-5-prasad.kumpatla@oss.qualcomm.com>
 <20260808183953.492F11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260808183953.492F11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDExMSBTYWx0ZWRfX4ImfhCBVTcN9
 TMBlezOk8QSCM29Glm2S5WiWKy/Dbp7XCSJ5yVoAgj48jwVS8sjcjnGb7KK82hhq42iQlgSVIvL
 wQO/TPN1bz6DCbpjRxJprRkqHBtNXgw=
X-Authority-Analysis: v=2.4 cv=HodG3UTS c=1 sm=1 tr=0 ts=6a78735a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=F6mPVD8IAMgZXornHRsA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: oI3oMU6n8h03xHDXUB2eB8vSE9hZyNbs
X-Proofpoint-GUID: oI3oMU6n8h03xHDXUB2eB8vSE9hZyNbs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDExMSBTYWx0ZWRfX8dA3bQXQJKMc
 FnO8FWvpqELIC12htwOReOXAwlgNw/F7EOEKMPpdCZ3OGhG6c1YmSuNcYR5ptsDSPcwPdywggyk
 SZUyBy9gxsdWQ+gCEuaB4OQ+C0OVaImeFjUHKbv6ewcFA2ewLILalj4jAuqwph6ZzzMFDqB3goZ
 hzW1eAabXMgLBDk6WuFeIO4zWPWjCcH4OH2DKEZs98BeHSUlPiPi27PEVSgzl14mxwmYnUpN1Rt
 h0lnuk+IvNcIrU8aL2v5+a2Gc5kkinZNnCx16NZgSdiLIj7251AFkWMBe1l9jkN6KuyiKzIoU/F
 pHodVt/0Q+tr0W4seFar4kaKSjZNdLDTa/HIkmmBPumWpK5YwK9SlNyviY04ZWnpDh3V2L6FI0K
 in+mxUOwj0GTEyjImTdCggKkRLzo3aWQpyZcZ7i3Hrm0jccYBbocuC2qQYtm4ljoCEnVNf39TsU
 oqXBAhEfGGasvMM+rug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_04,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090111


On 8/9/2026 12:09 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Incomplete API update breaks TDM configuration parsing and error handling in the sc8280xp machine driver.
> --
>
> --- Patch [4]: [PATCH v1 4/5] ASoC: qcom: common: Distinguish missing and invalid TDM slot configuration ---
> commit 2828c15bbb01105bac7c7698b0dd46a75894895f
> Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>
> ASoC: qcom: common: Distinguish missing and invalid TDM slot configuration
>
> This commit modifies the TDM slot configuration parser to return -ENOENT for
> missing DAI-link configuration while preserving -EINVAL for malformed
> properties. It also updates qcom_snd_apply_dai_tdm_slots() to handle the new
> -ENOENT return code.
>
> Link: https://sashiko.dev/#/patchset/20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com
>
>> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
>> index d231024206dbf..d9f256d519733 100644
>> --- a/sound/soc/qcom/common.c
>> +++ b/sound/soc/qcom/common.c
> [ ... ]
>> @@ -172,7 +172,7 @@ int qcom_snd_apply_dai_tdm_slots(struct snd_soc_pcm_runtime *rtd)
>>   
>>   	ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
>>   	if (ret)
>> -		return ret == -EINVAL ? 0 : ret;
>> +		return ret == -ENOENT ? 0 : ret;
> [Severity: High]
> Does this API change break other callers that were not updated?
>
> Looking at sc8280xp_tdm_hw_params() in sound/soc/qcom/sc8280xp.c, it still
> expects -EINVAL for missing TDM configuration:
>
> sound/soc/qcom/sc8280xp.c:sc8280xp_tdm_hw_params() {
>      ...
>      ret = qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg);
>      if (ret)
>          return ret == -EINVAL ? 0 : ret;
>      ...
> }
>
> Will this cause hw_params to fail when TDM configuration is intentionally
> missing, since it now receives -ENOENT?
>
> Could this also silently succeed on malformed configurations that return
> -EINVAL, defeating the intent of the patch?


Hi Sashiko,


Thanks for Reviewing.

qcom_snd_get_dai_tdm_slots() has only two callers. Both are updated
in this series to treat -ENOENT as "configuration absent", while
invalid DT properties continue to return -EINVAL. As a result,
malformed configurations are still reported as errors and are not
silently accepted.

Thanks,
Prasad
>
>>   
>>   	return qcom_snd_apply_dai_tdm_slots_cfg(rtd, &cpu_cfg, &codec_cfg);
>>   }
