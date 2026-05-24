Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B250395D8F
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 13:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779628031; cv=none; b=bR9FMpJbyQjb1wyZDL1xqZUXNcVEmdllXq2RiXBGdYK0ukvUsC75i2rz4TDruzudwdN/IIgvcjfhoaxQ/2iCM6mjkDGQiFnys1TYgIG2NmcF6MxqXFrSzBijLJTWjrVBELLYxBCtvxE9ollCC9z0kddtOHiGf5IyKFE7UzQgMiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779628031; c=relaxed/simple;
	bh=CGu9itIYUblNfG+RLcHmeNDouaMDmZ+0SgVnDgTcO2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ByTPELPj603y7hrgJVk8F7hKYTVABJXFue9wGTaiIilTjpvf1HVJqiom0nPH+HHrSuuDhhjVsVzpeolmDUG1B3yT17qjdJQ6b1DUwQSbwJXd3b1lwIgfl+xhWh3HIRIaWRDEh7hKUJGL2W+wEbvqqrWMlAspSjj2S75vcBf4vy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AvQIgkBJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UsYKmYD5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AvQIgkBJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UsYKmYD5"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O5eAIf2817965
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 13:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3rFnaq83VGMEew0lXNYSC0puW4n7VbyCoCWMnn4QSJc=; b=AvQIgkBJDUbU9bCZ
	PXfr/RMex/vPBtgPdIQzG0N79vOXB90r6lDJxBErmLHekenl52svqRCyW2z6yXeU
	MDiIgQmzI0oehTAao3UZ/RFY5mdrwDbmzKAMmizUfgem980ZwxUUQqMhbCfID0bz
	0cWzKJkDCkABLH/3Zk2jG/DcRHG8LczF9j47rRH05z4zHaGAiJHy+RuURY98hWAN
	9lBQ8MysUrfTNo1y90mSkGcR4I3Im+6Mlv1Tlmox/XJ6A09pIWcud6BP7PdL+/gZ
	Cg9iTQEe4GDoMYf9SVM5E86Ico5IwYQx432dzMW5vDsW1Yib/38Ia15cvgl4lZ5u
	K5HIAw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb5h9k287-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 13:07:09 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c8531d89e59so444076a12.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 06:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779628029; x=1780232829; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3rFnaq83VGMEew0lXNYSC0puW4n7VbyCoCWMnn4QSJc=;
        b=UsYKmYD5fnpUlBsP4R8mqrybov/jyuFbKjTjzv4y/y3CKIqa0UOd5ruY+1f8wXuskt
         5dynrY5iq8/+ASWYM8Tb1iZSF5vE7co6ADgepUqZm+qkbp6W7Y1WfXn6LQTSrRnTO+Vr
         8ccaiHTpxsqtneDF4G2hr/66ZUDQq9LA5xWBdD+bT2XKUxJ8iYpBSW3u49sVKnzKdoX1
         k9M1qKScoTyMu9SIz42VpiPBJA2+8B0IaJdbP2zAItoqFGSsGBCH3wLT0lHSVJsJFnYL
         19949dDPwnkJehqt5c1eMxrqI3yUKGDnhpvueavBuVaxNV1MdWO2g1SUN6vcFj7gPH+A
         aT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779628029; x=1780232829;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3rFnaq83VGMEew0lXNYSC0puW4n7VbyCoCWMnn4QSJc=;
        b=NN8rFp/L8jP//qHgxOLk3RTQ/vgeKHadxId6dAREWzg3P3OSb3fPYaG8dtrHQjQ8A8
         GUCM4TJl66CNm0nBtQUvOBTOKSgbdA6baCRDYZPgqbBhUXa+NpzHB4tPeiInzEpCbEZ9
         KzsRD6M4VUhm26mAKsCzKLbqmkzCp0n/8trk8UkVghHTAhu7fF+NkfK82A0LG+y2mNRu
         +l/CE8GE1pjJgVn62OJb7ym4kppiYv779tOF1exRCRDVsj9mpfkbmuAb5QLJmegkf5mQ
         YofCJDr36yFbPF48X0Tz7OGagJzazIukUnmDuhmvsiJTXnGkaRgJfCCVD+bwGYnQ97Xi
         LV3w==
X-Gm-Message-State: AOJu0YzvkuMtCIo76nq1ZNKsQ0ODTE21aCKiJMdthGUYaGruxog6wdcp
	ZFLALGndHDtWKaRT1Pwoj+uckL2e7s6YvY5Yyp/2Ug909PfVlvD1vNz6hDqtZbPNoDd5rqQ8wel
	rSTwx2Glx9U9ZfaP/MNNArk2mAs9dzQ6AeQX9ahu+oeSKH1ETnOZk2gV1BqAd/mYn9A0sC39XxW
	vf1go=
X-Gm-Gg: Acq92OENYpPwxLxc95gpVheHin7PtD1AvHBq1XfvyFOHDYNNnkkCLPjDXSTWLpDbMm1
	YPGEBkBz/3H6xayAT+KH7cpTgX/VJKJGGRMrLgntE6y2cCyqsocT8FgPg9Orv74q/RPDMRc+7PE
	RXAIo+TfcJ0nS10kNN+HwMLa+AXkKHIzM8H8FTeHnk0qFE9Sswf1XomflMVibex/WOVfytE4NIl
	dyjBTtsMkYs0iBM65cgBt+9qPaP68cx9e+SA7tUvV6L8DZBp6Vsm6DjRyndZReY28xnmIBLWHn1
	Hsdj4ZZWMDIy4fdLIDyePHqIfPIAoct1CK0Cw6XlxV45AvtlrABOHp14ARqRgflzMiUgGF7lHAE
	nkEEcvL3VwFQkzAiK4g/2EsfXUJjhvCvrj7zes666dZ2gR1WFmMgF
X-Received: by 2002:a05:6a20:7485:b0:39b:8571:3051 with SMTP id adf61e73a8af0-3b307f420e2mr13083768637.28.1779628028658;
        Sun, 24 May 2026 06:07:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:7485:b0:39b:8571:3051 with SMTP id adf61e73a8af0-3b307f420e2mr13083731637.28.1779628027923;
        Sun, 24 May 2026 06:07:07 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.232.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c852028fecbsm5631720a12.1.2026.05.24.06.07.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 06:07:07 -0700 (PDT)
Message-ID: <4d10e792-5d47-4c39-a054-37588ef7fd6f@oss.qualcomm.com>
Date: Sun, 24 May 2026 18:37:01 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: Add Shikra EVK boards
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, devicetree@vger.kernel.org,
        linux-phy@lists.infradead.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org
References: <20260522-shikra-dt-v3-5-80ffde8a3dc4@oss.qualcomm.com>
 <20260522193943.660811F000E9@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260522193943.660811F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FjwSqdVoV_4wONIqfUhOhaQYjCyocePn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDEzMyBTYWx0ZWRfX5J+xy2j6jttS
 qcnYW/YcnCswbrGhGhi2z2Ehgb6wJUVpKyuTHALOvQ9p31ulz6WmsmnXDMXwmyYOLZOpjL1BbZg
 LN7pJfZ1yJOAFpjY/THUsUdfSCR+8+P+GT8R11bQE8BrrViO1nOmawBEjoKdXiF8sCeag5fvPYu
 eOqE/JRCooCn2ZFTBafxphRxgsU8/CM5sTQmDA3Mj6x36OTdCA5/jwxXSVYAKabvBYyZ4XRs6KA
 ROn0WtPkbBumVQB+p44p6DdYT/7zZsf+27kpP9QnRExwo+c0YUQbgNFONyBjpz0RKnkHCyCzGHC
 BTNDzvpIEmf+7c2aRyNvNkiqAOvIUmuEWnzTNHxSKABWSbFO1HFygEdcuK33mrpUTF+aOz9jsoa
 4ZW+lbJ4j8BPqbZz+obNtypLaIxcK4U42ta4escu/L42PdGQBRCCsoAx0y03HurEeVIpaSUGKCc
 BaSgNV3uocWfdYEAuZg==
X-Authority-Analysis: v=2.4 cv=H7jrBeYi c=1 sm=1 tr=0 ts=6a12f7fd cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=XawOCIWsnnDrxziW7imd2g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=rmuw6e2lUgWHCeyTDCgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: FjwSqdVoV_4wONIqfUhOhaQYjCyocePn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240133

On 5/23/2026 1:09 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The device tree file shikra-cqs-evk.dts incorrectly includes the CQM SoM device tree (shikra-cqm-som.dtsi) instead of the expected CQS SoM device tree (shikra-cqs-som.dtsi).
> --
>
> commit cb9ff9c76f4ee019113138237f57794fa621d71f
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: Add Shikra EVK boards
>
> This commit adds device trees for the Shikra EVK platform, combining
> Shikra SoM variants with a common carrier board. It introduces three EVK
> boards: CQM (retail with modem), CQS (retail without modem), and IQS
> (industrial without modem).
>
> [ ... ]
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> new file mode 100644
>> index 0000000000000..b3f19a64d7aed
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
>> @@ -0,0 +1,40 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "shikra-cqm-som.dtsi"
> [Severity: High]
> The commit message states that shikra-cqs-evk.dts pairs with the CQ2390S
> SoM (retail, without modem). Does this file include the incorrect SoM dtsi?
>
> Including shikra-cqm-som.dtsi here seems like it would pull in the hardware
> description of the modem-enabled CQM SoM instead of the expected CQS variant.
>
> Could this cause boot issues or lead to loading drivers for hardware that
> isn't actually present on the CQS board?

Already discussed, refer: 
https://lore.kernel.org/all/4787d5f9-601a-4d27-91d3-33216ee6f64d@oss.qualcomm.com/

Thanks
Komal

>
>> +#include "shikra-evk.dtsi"
>> +
>> +/ {
>> +	model = "Qualcomm Technologies, Inc. Shikra CQS EVK";
>> +	compatible = "qcom,shikra-cqs-evk", "qcom,shikra-cqs-som", "qcom,shikra";
> [ ... ]
>

