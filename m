Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74126313E30
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 13:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783431021; cv=none; b=Si4oKTdREYPBJYr1mXX4sV2O7PdYfJ5V++vCEhscOvsHd0kYbTqpdNnCzUT4gg8ddB0NGLx3btkNsD6Sa3J49ASpTPcee6z3PE1XJu6tiiEfJSij9T6SxoxYqnLLzSIVOIgMABZL4bbCc34YANGYBA1u1u4HBnTUds8mWFSnfgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783431021; c=relaxed/simple;
	bh=stBD+/sH7V5qjHYx7BWshE2WoVnRJsFQkt4ni5EA50k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sbok5uOWytntjn1L15h3v5h7Yz3DewNPMpaf/zTzQPL12S0uAWMervCJIQVyZdOq5CIfbF31RVurEooPWzK+q4UK4gz3QEywubMa5Ym5mlca7DLRKI0od+CRcRuGXKzYSmL7A4j+9idFzau9r1a8sQTUFAxZAGCCYVfsxWtkry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YNpbvyt4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfapK+Ol; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YNpbvyt4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfapK+Ol"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667C8Vqw3741880
	for <sashiko-reviews@lists.linux.dev>; Tue, 7 Jul 2026 13:30:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9FkWytPKEFzcW2rOJ03A4Ztr+w4t/jCKqLErazbBHHY=; b=YNpbvyt4gFzUPtHE
	istfF5KOIEMLzuE85OJ2Ge7xATz3Vv/XfMe1y5+sGwHC4ziKsHJlFSWQiTlad8Ll
	93VuN0dFQhbsgND2WyzTZe46Y7wyNKxDU62oH/89BmuGqqE2mgKRW0ODGlS2o4gr
	4/SQkthmw/RI7JZt/mwaR5DznmOnLZq2y/r4iObwgBZVZA/M4kHJpPAqES7DqyJo
	ztGfTo8kINJBBPY5bJmV5MuvlcuoZ8Hkc5spqUPtoPd5PJyN+Pcvclkg/GKvKZwH
	TpFTDzm7OeBolfDverDDgb5vni3G4F9HSnnvJAGn/VCLNAy65lpYtZezJvsbnOof
	642bqg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8ye0grqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 13:30:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2caf4173b1cso83932665ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783431019; x=1784035819; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FkWytPKEFzcW2rOJ03A4Ztr+w4t/jCKqLErazbBHHY=;
        b=LfapK+OlWO14/tkv4P0Gav5oMorPCld4nj1WvBD/qZjcQbSWJ0Q9Lm2HmE8IXGUUO9
         T02Q3gXtlWbKdlqhpg646yrw4AiF696k5Gl7c1jzg3+awsKre3WRXi2nccdkY0E35diz
         Dp6r3XWX7vIp1lPT7W/WPm+ylAJXqiQQ2dZw4SzIAm6HEymfduWhoLJIaVhwX0hWac6t
         2qvkkjBToRkrAOHxOTDDgIxt8U90hlrX3t7HxajYAljDQUm/y/C8FWUQhQtJrUBq4GIE
         pQZyF/sJb2JUjQQvOJ/I3PYl5eXIfELIS60MZejbrTFfBKwUtsiebJvAbVkaOvSY0qrb
         zwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783431019; x=1784035819;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9FkWytPKEFzcW2rOJ03A4Ztr+w4t/jCKqLErazbBHHY=;
        b=DBw/6sEnObgQWWyqBrXeFFRdhlEV+cHCgeWnsPqV2FMmx52l5Pvj177T3lMAtC0Xl3
         R/FoWjYWYQEY30J6P6lqAXz2BQcMzIvUVVYQueHOngckwiGpxW7EYe5jf714U5vu/cxE
         N3vC3I+lM9U3MY1IrVPnzJb/dKLQRHyqFFvDoS8Daj+vsd0oGzdymWja4KtPJKR7dY78
         qS9N0ldMgSZ/7hHjh5bYCZg1ZpRZiUvpD7SWWHWtOAU4odHYotf3MTZw5MXB7JvjHZL2
         kHsj+hp+N1a64c0Zd7ahV0ncYhyrJ7RFl50o7OJRuA4LA1vi85caC7/PycZSfHkkUFfG
         yKVQ==
X-Gm-Message-State: AOJu0YwEk+VO71p324z/ImXhTExJhDPljOpa/XYeZ+0x5GAf/6b6w+Vo
	WZlr2/nqsHIFfG9andS+vqiNuJwdVRbgJSnCWj9OntQg1uDCmHHN+VMw/nzoTUhTfDLxPWqRt/7
	sxjSHQmDe8aY0Sv4xsdHrG+s3acnsx5/ZJNNScTDlgB9rE28eLBX/h2VIOWG816XkL4ZOzEby22
	G5KmA=
X-Gm-Gg: AfdE7cmsIb2LHrVSNyUjNyAq9wcnkmTY3hzx2OFLQaIFsG5fkBdsSKlAOHa07x1prYK
	eootm/6qBPn+xciHtgx4gVugOFeNOzpqvgQUoJz6yWnP2l3V3lOpVjaVIxsM5g68l4li4TmAWMQ
	M4Vt9pfiy9hTkMO4UqJycO8RQ9BexfmZfbqyjAhzp2P9MSygZE2CsN8OqPmGjHKi4aHy0jfHclD
	GAw6DlXnE3n0O+GHwopgIplmMxHcCnXeUdH+8Yr3RXp7wo+cEQe6iNtbP6/xXc2xp8SmdnkWX8u
	DqM/CjcFjAyve3YrZuGqmDM1/0IucUxIiIjZP91gyFY4BgQAy1YvPpZ1+HYyGT9wkttU6plrOzj
	gzxDlFYxCVBKvdwl8L60kn9/ELFYzMUgdI6kvelpjeGc=
X-Received: by 2002:a17:902:ef06:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2ccbf0518aamr53343895ad.30.1783431018945;
        Tue, 07 Jul 2026 06:30:18 -0700 (PDT)
X-Received: by 2002:a17:902:ef06:b0:2c0:af09:f3c7 with SMTP id d9443c01a7336-2ccbf0518aamr53343365ad.30.1783431018416;
        Tue, 07 Jul 2026 06:30:18 -0700 (PDT)
Received: from [10.217.217.28] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb86bsm12315575ad.11.2026.07.07.06.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 06:30:18 -0700 (PDT)
Message-ID: <d8f56740-5274-496f-b77d-8d3790789ebb@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 19:00:14 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com>
 <20260614081244.C2AD81F000E9@smtp.kernel.org>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <20260614081244.C2AD81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _yxzQ1TmNIIU4Hqzd9oZ_ITU4xsXVJ4a
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX90e5GuIEo5kZ
 cWdCVJQEOVzyXkvU/cviVZ/w8u5myvKBcm9BX2nSlQo/w6mXLWSXqUysAa2Amy3JPF89sW8hbHy
 9dTP8sT5PQpMpkzS2EPJbZiQTu8VZlo=
X-Authority-Analysis: v=2.4 cv=SZfHsPRu c=1 sm=1 tr=0 ts=6a4cff6b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kEwMdB4yzSm1prmz-DoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: _yxzQ1TmNIIU4Hqzd9oZ_ITU4xsXVJ4a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDEzMiBTYWx0ZWRfX6ixFA8OPd30v
 Yibdery8iCMBz53JxC+h9ZoJp01RYiDcpMOFB9lVX+nm1SovkB+8IjcYMd4rAPt8G4Vk6qgiYlA
 7jeGzUl2wfQ9BYM7ZmATCkhxnDtuUN/r8IjIJywauqNnwjcAGKf0tyBA2ijS/E4O3Wk7AcYrtjl
 JXR1vYfF8BXKKHRM2VEbIih3lhaKTVuBRt8RexJAE8+ut2zi5DiFlU4JzVAX/i+Zt9yMnm0kG53
 GHBMOxcuVLtmhiPmNXgTJIS7+W6KphvVw15QQkk1f/Xls4GQ1DqPCrbLUsFSTHudvRJm4ZSOPfm
 MgdXKNhumH2APVkUagFaX7nmnPyzTgISge2S21PfSG2LMDnXEkzxf/WrpJSo2cpZguDCSR6GPUI
 Ufg8scV+o9Ixq1qY3SWiPfK9ARy6IhjKB02sqW8VUui6Hp5qCEBTN0wkW8dN6aSDv5Yc2/yKKhT
 DW7DD9SnL4XtVijKv3w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070132

On 6/14/2026 1:42 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Devicetree binding headers for shared hardware components must be placed in `include/dt-bindings/`, not architecture-specific directories.
> --
> 
> commit 7bed566fe71218ad2ab3cd2babe147ee1d601536
> Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add header file for ADC5 Gen3 channel macros
> 
> This commit adds macro definitions for ADC5 Gen3 virtual channels to be
> used in devicetrees and ADC channel reg properties.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
>> new file mode 100644
>> index 0000000000000..aa8e54d7e786a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
>> @@ -0,0 +1,88 @@
>> +/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef __DTS_ARM64_QCOM_ADC5_GEN3_H__
>> +#define __DTS_ARM64_QCOM_ADC5_GEN3_H__
>> +
>> +/* ADC channels for PMIC5 Gen3 */
>> +
>> +#define VIRT_CHAN(sid, chan)			((sid) << 8 | (chan))
> 
> [Severity: Low]
> Should this header be placed in include/dt-bindings/ instead of an
> architecture-specific directory?
> 
> Devicetree binding headers defining ABI constants for reg values typically
> reside in include/dt-bindings/ like include/dt-bindings/iio/adc/. Placing
> the header in arch/arm64/boot/dts/qcom/ prevents cross-architecture sharing
> and can break dt_binding_check validation, as the schema tooling expects to
> include these headers from the standard dt-bindings location.
> 

Based on this discussion earlier: https://lore.kernel.org/all/d10e2eea-4b86-4e1a-b7a0-54c55907a605@oss.qualcomm.com/,
these ADC channel definitions should be placed in the dts folder instead of
dt-bindings folder as they are hardware constants meant to be directly
written into registers and not ABI constants.

Thanks,
Jishnu


> [ ... ]
> 

