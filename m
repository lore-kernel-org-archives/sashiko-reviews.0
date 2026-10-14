Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8824F3939
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982369; cv=none; b=OQDQBfYOh5aTKgO59EadfvjvCh6m5OMBtt8dICFIOQTf5AR25agPKywfG+bOCxpDjyHptjXK0mA0FOAd4Crb+2ftAbnZJlulvKpRxh7QZHdCljCX3FAgz5DB5L6k8X67EhJP8DGivfIM5UonQqLGiyryvGMEUxjMMu/CrBIJu4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982369; c=relaxed/simple;
	bh=RXnPjfLjnkyDib2zh+QxtH+ITST6yFAswTx63bIOYjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHEvJEQybae0eQHbG68p5NOikCvaQhfNpqJRqTGj33z2AwBk88Vd0s0iwl2QLTHPHSFYKkfGSP8TfAlPV438q/s6v/e4cMyxmDF7lfMnZG3/EoFOuXlpV6bXsAvjaR58k52CMHvP8QSPrMOqxQz8apQ7YFtB/fiGk4cPd2KdFz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nz88sVXJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gk5DLOih; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nz88sVXJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gk5DLOih"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7mH423017676
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 12:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UG91mkFrWeipTAxiKmKXbvbb7ALNPef3qQlwt7YlI0Q=; b=Nz88sVXJ2bPEvAK3
	eK1NTshXn7WhBlAkX8deGshZUUbz7BMq8gncqP2OTcBhahtO6RvcQ3WntFHdzawn
	T6Al96zbV2hbQ7l5QS2boMq3KOV6mv3NecksooATPmEcxyEU7F/jdit4awnTJFq7
	cpor3U4u2B3wcnbq95SDYM0O0CCradgEyjdcr3BhM+iSFi/CMI3em1In5Zc/sFSQ
	ij9roCVM36wMG8XemTHKMjrJXqu/0Lhz+MvX1lFpSs6/OfsbtRMfO7J/+cfufe54
	eaWEl380Fw3b44efhK/Jw04O5U9+9fYfK8Hy4K/1UFR03181EUFow5hCOaRoPGX6
	V2pQWQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b4cak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 12:52:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd3e7a65fa8so799546a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 14 Oct 2026 05:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982323; x=1792587123; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UG91mkFrWeipTAxiKmKXbvbb7ALNPef3qQlwt7YlI0Q=;
        b=Gk5DLOihr31bcAqnziZp/p1LJx/plG/kRuP2mEw/L6XFXQdcrXFgmhy3KKvn9shs4E
         0wZcSK3hM2lkCagJx9abMIXAvyeEr9EEVzGukkIR7DxrN0X5+HTicUaBp+Wud0eB/B+T
         SnViNPwRk13siQ4PwI/DWraXtfG4BQpIbC0L7SqnZyXXDP1SHN5/WrKIBItA/yZ3qF47
         7sOssD0wNvXwNd62ZV5sl4NTU3ZZEDPHdEijRtC7AsppIFNsVCoY5bVfSTMm23XFeAPq
         qiSt+oi2RggX+0ppcN4C0TRdfRjgzOu+qPhDHL4GVU/74vs27DhJnAszB3wyN0zR4ewu
         zKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982323; x=1792587123;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UG91mkFrWeipTAxiKmKXbvbb7ALNPef3qQlwt7YlI0Q=;
        b=VL6441+F8xEUIZAXXVitRJf5GhZbhwej//cRvS1G3nNHel16p0IEl/ogFxzZ4lDmMo
         3KdzCot74rjDgQ3XC9ysGyHaHQqTXSmDGBtlrhIPgylSSQhqK470z7fHGIYG+IWpzZDG
         JAm8NNvbSsdHR9N10VbmzdQnPQzrD5hemkkwknDlpO7Fq3WyETzBhWbIV6CB6iQgozCO
         uNfm1WfJ9deOz5Mx0QAZMK3u0OhCtR8d85YOOyupEee6fi41BiUHP+1cu1tIc3dM868W
         PdqwLW2UA6aToooqzHJMM168VHnLzGUC/jkMjvDKhMXd2jBUE8l+WGY6M4ZWsDCZmDdI
         CMLg==
X-Gm-Message-State: AFq9FYJZmZtq14P0kW3qXmu2Qu/4KDv8TUa9nxUNg++CZxTymG3fe1Iw
	iNs8xyPgXklEe+piQuCgfmlnblrs1tsCZgrHEcpRMNlOif40VmF9mxcuJvq36trn1nzAAfLF/9z
	L3HHA7L8uKjSCyrlSGZ9HV8EubdHTaxjI9Vfaw71pL5INY7VMMpFdJf3zJppuRCnHHPbzB1R8fD
	Z5qPM=
X-Gm-Gg: AYBFou0Df9msmdeKjBo1qK1d03FmUEwHZ7OErDq2MdqbXPNZ5otTClMUKKw1I6NFlBu
	Yy9LqoIEgqMqvfhjzk9DnASe+3gV80cXFMIDXh4EIEibti3kB9ENwfvmpVhDU1Cz5fcT400GyAG
	VbFmdbQ7Ldr+KJa66QBSzQvAgzEF29AZIIyXYGfP2EDxKLItd/A3FwJ+JiD4q6PuwEAvWNcf6Og
	ivrasTWpVlp1E0aQ/VbDq8UgV8T/gwU03WqCwQjw3r+G+0jGy47OZWXYPbj96Rq9xLOi7wm50EZ
	xETikMxlXLGPzMCj6Dn+gC0qoGZRwsNeASCjMuOzH1Mapa7lw6W84fgucosbLvXSigdqb6klvcR
	rQG75w/WCYaRHDFpHcRd65IBhEU6BYBjdha7d8BMHjXQb7yjg5uOrpMH0lKVX2vE9uUohESaVmA
	tkQTnOAu/AuYdXQi5BmhHdmb2bd0s=
X-Received: by 2002:a05:6a21:2d8b:b0:3e1:5481:545a with SMTP id adf61e73a8af0-3e16bef496bmr12720385637.58.1791982322722;
        Wed, 14 Oct 2026 05:52:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:2d8b:b0:3e1:5481:545a with SMTP id adf61e73a8af0-3e16bef496bmr12720354637.58.1791982322030;
        Wed, 14 Oct 2026 05:52:02 -0700 (PDT)
Received: from [10.149.108.218] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da0596f9sm7131033a12.31.2026.10.14.05.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 05:52:01 -0700 (PDT)
Message-ID: <1f629377-c1a8-4c75-8fd6-743e1371d4cd@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:21:58 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] arm64: dts: qcom: Add Kalambo SoC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
References: <20260909-b4-kalambo-crd-v7-0-f5685804478a@oss.qualcomm.com>
 <20260909-b4-kalambo-crd-v7-2-f5685804478a@oss.qualcomm.com>
 <20260909073152.C08531F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260909073152.C08531F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf7af4 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=enX_rUQm5nSqV3y0VPwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: rC5ByY9vY3Rg6H5lcL04COoSPBklYoes
X-Proofpoint-ORIG-GUID: rC5ByY9vY3Rg6H5lcL04COoSPBklYoes
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX2I/3gUKF4VnI
 28Me3KVVUH1ZvPHNGy1MOv1MNhfW+OD1KKe49dCvhXsokUnqC8DOkFxA4wqpM+jjq4lW9/y5so7
 UXK81lgjtV4dV2Dhg00xUhvhUcgh6+pZV+8FSgX3gekrmmSAgfO1LWODwm4kaLJBU6QB+siqoCs
 eDvqUyorKgIUD8D2+BJBTzKKhW5r0hD+3k9nQ/Gdz5Mk53V+HtCbA1kNlE/SeVM2MP1GYqMfwHs
 FQmqBGeDLtYeY7mzR6eg8kewsQHsOEjOivp0Xo/kTNVxXqWgkXpdYWxqriwCzruXpm0oKQwzezo
 AB9sAvIMmzXmMbwR2+QA+GV1B/VkQy0zladEF3waiDFgsJ+igB7B8bX8u4nl0l7FSV0dzVus6KW
 EUxy0OemvcrC/O/XTbi63DdCp1umSwk/lK/yDpQw1DpEBYbQaXylkYBCJ5RI5jZZEjgnFZLMCKf
 UkWQxgohw9Bv0ex0g5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX2l35Zyhi93jY
 Ho6jvsGwYueMEinXZn1jjRRrxGbzTHgDwdzjMTdtD0Ta/FUnxa+gbcSGJxTfGCx9DuCPGDZl+/K
 woBWPSoM1esI0ap/Fwe/b1Zy7bzVx8A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1011 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140051



On 9/9/2026 1:01 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing disablement of bwmon_cluster0 after CPU cluster 0 removal, leading to a synchronous external abort upon driver probe.
> --
> 
> commit 917eea48188cf7e004e9ea44ee5963d8c898f1e5
> Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Kalambo SoC
> 
> Introduce support for the Qualcomm Kalambo SoC. It is derived from Mahua
> with CPU cluster 0 (cpu0-cpu5) removed, leaving only cluster 1 (cpu6-cpu11).
> The surviving cluster is re-added in the cpu-map as cluster0.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/kalambo.dtsi b/arch/arm64/boot/dts/qcom/kalambo.dtsi
>> new file mode 100644
>> index 0000000000000..8e2077d9d0a8a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/kalambo.dtsi
>> @@ -0,0 +1,119 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#include "mahua.dtsi"
>> +
>> +/delete-node/ &cluster0_pd;
>> +/delete-node/ &cpu_map;
>> +/delete-node/ &cpu0;
>> +/delete-node/ &cpu1;
>> +/delete-node/ &cpu2;
>> +/delete-node/ &cpu3;
>> +/delete-node/ &cpu4;
>> +/delete-node/ &cpu5;
>> +/delete-node/ &cpu_pd0;
>> +/delete-node/ &cpu_pd1;
>> +/delete-node/ &cpu_pd2;
>> +/delete-node/ &cpu_pd3;
>> +/delete-node/ &cpu_pd4;
>> +/delete-node/ &cpu_pd5;
>> +/delete-node/ &cpu_scp_lpri1;
> 
> [Severity: High]
> Since cluster 0 components are explicitly deleted here, does bwmon_cluster0
> also need to be disabled?
> 
> The bwmon_cluster0 hardware is enabled by default in glymur.dtsi. If it
> remains enabled here, the qcom,sdm845-bwmon driver will attempt to probe it
> during boot. Would this result in a Synchronous External Abort (bus error)
> and a kernel panic when the driver attempts memory-mapped I/O on the missing
> hardware?
> 
> If bwmon_cluster0 is physically absent on Kalambo but cannot be deleted
> entirely because it contains the shared cpu_bwmon_opp_table used by
> bwmon_cluster1, should its status be overridden to disabled instead?
> 
> &bwmon_cluster0 {
> 	status = "disabled";
> };
> 

bwmon_cluster0 is physically present and supported on Kalambo CRD, even
though CPU cluster0 and its related power-domain nodes are removed.
Therefore, it should remain enabled and does not need to be disabled or
deleted. The driver can safely probe its registers.

Thanks,
Gopikrishna

