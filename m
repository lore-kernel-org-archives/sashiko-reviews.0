Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48FA37DE98
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027271; cv=none; b=qpsdfnj2xdb5+iTHH00o6J8615RAgD+o+LIsH2CZ7V9UYNFV3QXU+FVdGdA8RNfI+/PdV/1QuYEI3I+7RRaqHACE71Ao4VFcyJ3aAOEtWf8eyJPs78P/3gI4P6tejvHUJhRezrbvojOI2BsE4Su53ha4eJbu5gX05xfARUpPJ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027271; c=relaxed/simple;
	bh=MJkDtCn1ULX+X8cnzGICSgyjuo5+vt0Mc/zlwXPXYa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LOMUZBkBLfnUhY1LIeSoR1sn0ndZKzGN1Uc4WCYbTD6DrvMJO3ga+MUEWNhJUADmBEk+mov4PjX+DeQ0pvGPNvGox2X3nKDODmp6MasQ9zWA2M8ktUUokk0VLR1I2eu+5Wt4ND4NZhONS+0d1nj2/irFAa6N42ek0KIHb24ZSmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcyBLojX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lv6/bs3c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcyBLojX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lv6/bs3c"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SdAu3954772
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	So3CnGl3aa9Ii3ufK617ccxG419vCDYeqchFUdY6qw4=; b=LcyBLojXTfXgxEyU
	KzhzbUL8aqRvw7idxNQUKYnvLdeWSueU9fw1+SwPCvOEoSMgTgzakuZGB1iZ+62/
	aWCi859bkA+qHmcOY/I6GJU1SmeyuJLc/Zpxke09vBxgANS2GXoR7iEaZu5HZZuJ
	QVHvKspZVN9TWiGDjitafljEqW9hgvD+sLwZLyEPn7LtymrhH+ZP2QQMyXsuzJfy
	wdTFOu5nMOJHwJwYFYniwsqEx8vUd9Htn6G+xzb2tbCJv+PyrViisa7JEkKJkbi4
	PuSpFWG7ml9K2YfDXDWF1kvh1+3ODmhkSYiPorW21HMISu9WxmIND+GHMTbdljC8
	gILjYw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jue95-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:07:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so6100563a12.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 04:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784027268; x=1784632068; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=So3CnGl3aa9Ii3ufK617ccxG419vCDYeqchFUdY6qw4=;
        b=Lv6/bs3cbA5REWl7Wlfdoywa1wHI/2rMJHNc+gvt/UOi6MMDQ9Xd7iCFMsqXga0EwG
         EK3AsCZEi4uJwVGuHXu2OSeZv/DIOV9uSr9PyPs+8E+zPzamZztvc2v2wVopGkfvZRfq
         yqUDE4srmP/8nb3laP2rD4mzQwOo8hDIyJXwk+zFhe6XoboL2qbEA9pctErCGnMhIttV
         GjNukG9OW2KhH+wY8bygAXFTOYAF8O3jU6Hjt507f/D68kATm3Jqu4d63eE5t2OCuxA/
         +nbcuiyeRk5dJjj4iME3fEV1YhhShX/RobGsR37ECJtHi5w9Ed69YuDSj1tNFUYjtfQu
         L/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027268; x=1784632068;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=So3CnGl3aa9Ii3ufK617ccxG419vCDYeqchFUdY6qw4=;
        b=XV+LQwtuIC+cX57ukaEIRFKHtJHTuTPHjqaCVQJ/kaGbk0//Y5vvwVqgmvxWY45+WM
         XyNxheZ4ul5KlAPOKKmR6hd3zD+F47/9yU0g+495d0HwH1U4H3I6ETzxB+S4dGy8ocdX
         wmSKUOaoTyo3CP8VhsTiUIiY09PKiaayUsFeIQoRkCHux2uoc3WvYHC9JFtU15VSVPzr
         zD/PeJBbagguaWey1In3r+gqLYPA7UFGvhS5StG8aGLQeykNGRJDoBDazqUp4h7eBVnP
         eaMAm/o/MVB3eclGhY4Dfz3f1txeRTjI5qO81JuQr/QwUK0MXdK91kQ3c47S3v4IL426
         VAFA==
X-Gm-Message-State: AOJu0YwsrHRyfuu51GeMCXFNud8PSkJQIgI4pMjJhIdjATedTYGCkVjY
	NEyCnHpd3uyvBpIDuMr3eoOEb5a3QsyqPA6Khm27moHfVyYN82M7FfgylazEYY+xDeVgAwdgZj8
	uodrO7lq4kUR/PcedepJQgroFUvRpODnRVTrsuMkYxR6huX2RARCfPhY1zUPR91vKAqx+z8UZJ0
	pPvpg=
X-Gm-Gg: AfdE7cnOStU2p3I4/G8shYnWDMJ96S/0giwaKO/soSxTHs0/ydhdF9Ot7wvlmIa3eKR
	J/tbNnxcsZglqz7P6ykXhp+c6if9jD3OE4Or7JyzB8DM7bipHHSuj6vcsSyjNPQUIYPfS2OT340
	DnqbWa5JHAUaGtG+eO5N3Tad/VaIYuyB7HqxD86EMFHvAXuG9MNwfia/XIIy7EUPH2O0DVBGHZv
	LMyrK/ZLpenfpyDbdVFraktZV0Je9ntfYWNhpOdcnso9Cn/1oFtfXTbi7I6ukQn5HLQ1eBBxNyq
	6WA4Wep+4wg8kjX2TyHYL0BktjJPm5TNlcphD+3pVcyKy7Ne8uztSRFdZGrPAQzyeWfT1rcp+XM
	OGAnzNz8IIdDkscK9tNsFjfMTQr8Hba7rpjcJaVKZa+AM
X-Received: by 2002:a05:6a20:6a24:b0:3bf:96c6:78a9 with SMTP id adf61e73a8af0-3c34d5284b7mr3759972637.2.1784027267566;
        Tue, 14 Jul 2026 04:07:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a24:b0:3bf:96c6:78a9 with SMTP id adf61e73a8af0-3c34d5284b7mr3759950637.2.1784027267025;
        Tue, 14 Jul 2026 04:07:47 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm140674709c88.14.2026.07.14.04.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:07:46 -0700 (PDT)
Message-ID: <9ef5c476-4f81-47b3-a86f-2dced939cd46@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:37:43 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 10/11] arm64: dts: qcom: monaco: Move Iris IOMMUs to
 child nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-10-72bb62cb2dfd@oss.qualcomm.com>
 <20260709150313.9B1B11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709150313.9B1B11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: N_SJ3WIPFmL6OxIKqYBaJByUn_sUzo6A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfX7j8lB6oBb8nt
 eTUjbslbWbHslqyTvr1rVbnMb85j7e6Pseq8TdPCF1G59zk+h73JqRJZd/uiOikFguiiWxamSgi
 fKhQkrJhdKU04s0Xfe7CfawxOVe1gqUDVKEJkvvnRzbi8932pni5frI1vsJwhppP3c1Paa3l/Sh
 d3fxzZnbATI9bQPj8Ze9IgNdTi1yV+3+K/Wu2QXVuQUvRnPGqdiSugBYZiSpJ0Vn7jCbwXXVD1I
 cfpRGUqSdQVrGVQlcbOiQ3YB5zVJJy3P1tY5FG3TqzRedYkt+YvOSa3E9b3TVaCktzh3J1Aj+p0
 B7XSs/sHTQE3dIX9jk8DWdQtLJVyrrI9zbEk9Fp83iNXRwc1ZE8U9zIOvIa41amKlbabGJqcwtA
 kLvI04stQUFX7xyryJnLCUhBlbVWuqB4i9WBy824olPpv+EZM1pyCKVm8AeKt2WNW4rz9EP3VeE
 SI2YQfgOG4IoU59WdoQ==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a561884 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=CT2iAjWcw3EbmAiu2KsA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: N_SJ3WIPFmL6OxIKqYBaJByUn_sUzo6A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfX0u/xuzrIxcP9
 4MQ7FFCgERqOR3e6eKuveHdI5GVHdyAKUsaRKMc6lzzBkRlV4xCnG1xBwUjmAImUjKv+dwMkhUL
 6INqYaCypUZG/IQ/j1zs1vUiVbpAu1E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140115



On 7/9/2026 8:33 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Misuse of `iommu-addresses` in a `reserved-memory` node creates an `IOMMU_RESV_RESERVED` region that actively blocks IOVA allocations in the 0-600MB range, rather than restricting allocations to it.
> --
> 
> --- Patch [10]: [RFC PATCH 10/11] arm64: dts: qcom: monaco: Move Iris IOMMUs to child nodes ---
> commit 2ee0f65b225528a8b439c85350380c9a56ad101f
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco: Move Iris IOMMUs to child nodes
> 
> This commit splits the Iris VPU device into non-pixel and pixel child nodes
> to accommodate different IOVA constraints. It adds a reserved IOVA range
> intending to limit the non-pixel stream to the 0-600 MB range.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -831,6 +831,10 @@ video_mem: video-region@9be82000 {
>>   			reg = <0x0 0x9be82000 0x0 0x700000>;
>>   			no-map;
>>   		};
>> +
>> +		iris_resv: reservation-iris {
>> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
>> +		};
> 
> [Severity: High]
> Does this iommu-addresses property block allocations in the 0-600MB range
> instead of restricting allocations to it?
> 
> During device probe, of_iommu_get_resv_regions() parses this memory-region.
> Because iris_resv has an iommu-addresses property but lacks a physical reg
> property, it is classified as IOMMU_RESV_RESERVED.
> 
> The IOMMU DMA allocator then passes this range to reserve_iova(), which
> explicitly excludes the 0-600MB range from the available IOVA pool.
> 
> Will this force subsequent allocations for the non-pixel stream into addresses
> above 600MB, resulting in the exact IOMMU faults and device crashes this
> patch intends to fix?
> 

Yes, thats the intended behavior too. The "non-pixel" sub node is 
suppose to skip the region 0-600MB entirely, and return IOVAs above and 
outside the range 0-600MB.

Regards,
Vikash

