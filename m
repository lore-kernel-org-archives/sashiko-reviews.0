Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2E937E2F9
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784027294; cv=none; b=COsAd31xYEvP6uSYhSJdilwv2euBNfMZya8XPM/k58ztmH4e5TfdtfL4ese2zzT8xVtLWDlHHIUHEg0qJsALHbrcufwfjHaah26MTgIfGoSWIpvK3gZZd/AL82iVxp/P09QiYgUacWgUMy3PK7mdM25T7IIsltwLs6T+5sVpqBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784027294; c=relaxed/simple;
	bh=bVV6TOSeVditsAadk10Y1Uve5c6razlz9lN1viTKHPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A4J+kO6rHpKBrNPcxAPznqJK5A+TCRqkpU1u37BdXhZcl2t8TMihMjYMlUA8su0iwF0wkpCg+TqtrGjWZy3ot7a0A5kbm/9KAvcUM0e/BxjcE0NKMXWma2yItOkAbm4H+ce0fVE2l++kBi0pF9a+M3yjD0SWc7oFDAbqaWAqGgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggeB50I2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYnBD2QY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggeB50I2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYnBD2QY"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SXIH3954635
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:08:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PE5OuGY131AHFuPRKju+KWbU+74Cuv2LHoq+g+bCrSk=; b=ggeB50I2f48RhCka
	b0iKdDnpJTJdik4DJPz+9oSS/GMoAH+G8cW9lhqBJYVrgiNkU3Mdpz7lek/Xb4+u
	RL1waEfCbPVlFklxU4U4v1n8Qk8NTAPIl7USfkXlHzLJaO7NO5pSSW08gPyQPWTo
	1dWfUWPh84KJj081AMUr9RvKQjRdCeRqxbGmwZhpb1IiPISR5ssN0ajevFTY/fLl
	6sDRtRGbtRPtdY2tTqahZJYZgd1jHS+AlPERmkGDIzp9rywE+YIt4mjhSb8MkBZV
	JH02/x8dMBqxx39KwyTW+srw9SZopamPLi+mU+f17JsvXaFBUxbsmE2wP9nnQrEE
	0y7a5A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44juea6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 11:08:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c916d17dd43so7224589a12.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 04:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784027291; x=1784632091; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PE5OuGY131AHFuPRKju+KWbU+74Cuv2LHoq+g+bCrSk=;
        b=IYnBD2QYWyU/3vqDnIUc7Z+DC3RGYy0La6JZyI1cqVfifbWvFMrP7Y9UsSEdsW42Cv
         MAt2gsZzBjMzxghC2fCgO/o/9GTRVYrib15K9CvYmgaTcFYv1cs/nzR9jo8DjSu/qZyH
         M2IUl8B8PV9TLklEZUsA9IgakYHSPADIrZJbFxg83TrO/McafVpUyPgYBj+8c0w/KJy6
         PmOFo1ofR4WhXo2nmflZ/hZRCdZ7AtXzmEdwR3npeaFjf7bX6WQM+nNu/UVoeCplcc80
         2d93ObJlaiMHRAEjHCh+k6TpSJ/s39Ez7F2EqjtaD4Wdd+3ji1R/VDfaSOExSGFyig/2
         bnag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784027291; x=1784632091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PE5OuGY131AHFuPRKju+KWbU+74Cuv2LHoq+g+bCrSk=;
        b=Bq9pTAZw8hJ7aOSxAhd5/db3MKbf793Q7uQwH1flAh/4rE8y6ImaAJyCpwQDz3vhiB
         qoR5JE3v+kVT6YpL9YfrLVzZARhNWDYCl4v9OZU1lgCCWEO1wfN4qP2sWkMgABMWZTPK
         8jFjP59uSBw9lGks1OfvZPjD5S0sSBwEcTOvbEpQqLgw/rXg318hSN/F5c1E1LDqhzYo
         h1ZNfpJNPLg81cxara63VSo/6egU7EF2E59T6kVxpcnD2wN8Mvu0JSbAKFiZFVePB5BE
         VV2DEeJsVb2lTW1MyxN/AKorMhSmUDHEybSjZ2ipzKcJQ0FH8OqH8Mqu3uvT+M+D1Mwp
         PBWg==
X-Gm-Message-State: AOJu0Yxl1RzAlGVBe2M3iXggNK4rZbsR9lCULfIWJ7IvfMeTV7IN1Aaf
	48CoAimhB8JcXF5oUJUp2B184sZ+aHmcYgJnaK5QJXTNMKPa5O9du5NU0PpP5JkXSYgGEj4XTXe
	i8FciOE0ZwGyghmC8MGHPQuvMCmKhm5+LEf7vN7t1fvQD4nbeB4ZqR/kwcEuydLTIXBvULFy6SF
	dbb0E=
X-Gm-Gg: AfdE7clqRSGJMOlsUW9sZAOE2W7I7Pxa18heIuaw0nce/8S6umAh7McXJ90f+Rikff3
	vlcDd+RZZytodTq0SXxPNnvP/9jE3z2UnSmdTntJ8tUUnyh/WIslzqQoU9oCc2XA3DcsMtgTQx4
	qL0JEhtwz57ztLMaNMaqqnHvaDx4wJZdi9OWXX+vue9ZJ0PKwVZEokAGm55o4x/HT2Z1wlOjQqi
	w8EJGqC8QAOLqh7pqLuB7wJ5KzCsYkLwXqO10OX2DEFMLWWyZVsQMay2y5gEkhzmloJ0dvm50fl
	El+nNhfz7DfK8QuKfnrbw0EHzN6LiQdG91R1SZFOeKZUw3aUxjSuqcSE2/XGn8HRrOhcOfDULqa
	JGl+Fnp2inJqe4nDQ4NPOgwd88xV1fBEM10gy0KuU7eig
X-Received: by 2002:a05:6a20:939d:b0:3c0:fab7:bee0 with SMTP id adf61e73a8af0-3c110a1dd98mr16819002637.62.1784027291181;
        Tue, 14 Jul 2026 04:08:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:939d:b0:3c0:fab7:bee0 with SMTP id adf61e73a8af0-3c110a1dd98mr16818953637.62.1784027290674;
        Tue, 14 Jul 2026 04:08:10 -0700 (PDT)
Received: from [10.204.101.214] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ba16d46dfsm14010424c88.7.2026.07.14.04.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 04:08:10 -0700 (PDT)
Message-ID: <5079dc9b-8c46-4cb5-afcf-787145d24f67@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 16:38:06 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 09/11] arm64: dts: qcom: lemans: Move Iris IOMMUs to
 child nodes
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-9-72bb62cb2dfd@oss.qualcomm.com>
 <20260709144453.DA5E31F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709144453.DA5E31F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SAWtCRdeZR9QZVF1DUA7uSzSEM79pyln
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfX4AY9wXYg0UPN
 8kAyXky4bHxiGK6YbOoGP5ijuegMUOKktG53kozN8b6wrmPU4GWBgy6tJ2R1N9Cc3Py+aRRa4vg
 I1ul9+kO+Qj8OSEBbILPmnAQyq8uK3Tv4iBk/DyqNSYWKgQInf8EG3RUOJrY6sZwDIqYDELYjqJ
 k9ulq6FpJCF5TLwTy/tOgvjHaemb5KMTF8vH+RcHo0C4xtYrwd/VDYTcuEZ0vF6fTZsF6gZwYw4
 jH1o0s50MfxQ5rOC5skAq9oSJMKGFWLoP5d7RbVsvN48RuGuc26LQtanI3EkbsKbuRhx0UlumHK
 4MTsMVx0wmBD2VSVNaLzTXsjD+GmMCbe5YqP0wpe0xelv/Ia1N3rf75NMKa6dCyjtOchhTPorw6
 SjhWjAXMffR0Wd5Iz53G+T4r+vrwJr+7SLGrKjpdDkUK1FgrtSCQwp8QjaW+PM/9RoamPdVgDZW
 FAblaG2a5SERCv9F9YQ==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a56189c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vXmN6uM01wKFn2pfJ1MA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: SAWtCRdeZR9QZVF1DUA7uSzSEM79pyln
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDExNSBTYWx0ZWRfX4jXKX6gfsXzn
 yftBm1u79x1DMctc1D2oEiE07dWT4XwtdZnXXFwMuRYK86MtvRYEG9itajZnWGCGbAqczhUVgDI
 qHsB0wp/816XLxMUhmdQBnm29KPwEfA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140115



On 7/9/2026 8:14 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Using `iommu-addresses` in a `reserved-memory` node explicitly blacklists the 0-600 MB IOVA range instead of limiting the device to it.
> --
> 
> --- Patch [9]: [RFC PATCH 09/11] arm64: dts: qcom: lemans: Move Iris IOMMUs to child nodes ---
> commit b935406806a9ce7b7ad2277e27ed775abba4a09e
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> 
> arm64: dts: qcom: lemans: Move Iris IOMMUs to child nodes
> 
> This commit splits the Iris VPU into non-pixel and pixel child nodes with
> their respective IOMMUs. It attempts to restrict the non-pixel stream to
> the 0-600 MB IOVA range by adding a reserved IOVA range.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
>> @@ -879,6 +879,10 @@ cpucp_fw_mem: cpucp-fw@db200000 {
>>   			reg = <0x0 0xdb200000 0x0 0x100000>;
>>   			no-map;
>>   		};
>> +
>> +		iris_resv: reservation-iris {
>> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
>> +		};
>>   	};
>>   
>>   	smp2p-adsp {
> 
> [ ... ]
> 
>>   			status = "disabled";
>>   
>> +			iris_non_pixel: non-pixel {
>> +				iommus = <&apps_smmu 0x0880 0x0400>;
>> +				memory-region = <&iris_resv>;
>> +			};
> 
> [Severity: High]
> Will this inadvertently exclude the 0-600 MB IOVA range from the available
> allocator space instead of restricting the device to it?
> 
> During domain initialization, the IOMMU subsystem parses iommu-addresses
> without a reg property as an IOMMU_RESV_RESERVED region.
> 
> It then calls reserve_iova() to remove this exact range from the IOVA
> allocator's available space. Because the non-pixel device is linked to this
> memory-region, all subsequent DMA allocations for the non-pixel stream will
> avoid the 0-600 MB range entirely.
> 
> This forces the device to use DMA allocations strictly > 600 MB, which
> seems to guarantee the exact out-of-range memory accesses and device crashes
> the patch intends to fix.
> 

Yes, thats the intended behavior too. The "non-pixel" sub node is 
suppose to skip the region 0-600MB entirely, and return IOVAs above and 
outside the range 0-600MB.

Regards,
Vikash
