Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20F8433BDF
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 14:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212118; cv=none; b=HS7eeD/k00o2DgtgdaMJwOOp/d7Jd6sFJFl8BzhakdPfXCAkDnn587eVkMVACVQU38bwgJB8ZnGnALCBnBPZ3VHNheuj2lOSFPe1O5MyUShaEZN3c1/kCBGyiYARLzFHhzZXQgq/2bHJNspOKPEE9Ji/6JgP6njsTl3g57C8T9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212118; c=relaxed/simple;
	bh=XbeiP+quxy8JdRYY++ddACJ6YqpfwZkPJ9dVg3KWp98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Etcp1T67J3cde1lKTu7faFw4kzhuyIfktRq2LMc/L5zuww4wfXgiMRw1gdeSMkmCEdwKzuNXiSTi1kkbQqBTJ4toiwDvLfkkLt7Ubxnqi4hw/up7d3Rwp5dA3pa1O7IR7ZCf473gdHQIPzb+CHTp7t1/U49xndYZSxqe+yc3Enc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LASPYrWw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhR1hyw0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LASPYrWw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhR1hyw0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDK3x12959573
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 14:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rL4SpDLV0gQsFTbrH61VS1SQZ29IO/LN7dDdsh0VUgw=; b=LASPYrWwAQxt9RWf
	2kk5WrOkQUghcwjikBG/7ohp0vYfzhIfIaExT7fgnOZJLyTyVyLEQl+5PZZgKGZO
	57rLAUhOho4QKeoUzuqurW3ugffa3TZeyAm5lg3TvPgMckdXguS65n8In++VEWSM
	HzopEBHYCfopYHhOOUri2IHQL6/gkJMj7Mha97O+7gIEBjy2aVN/wsKJhW5JW3i1
	kQ2vFeHNmHpmi1c8pllcU401/CBb7Vh2zh2nuVI/LYBx9+YNs2UNj3+ChhYo+suv
	UcKM0ncRtvVjQkfJ2J2CUFE09yHX0uTJXiIqEkBILkC8wBQNHMAp7nIdGHiYGRiG
	P0cBjA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym18fq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 14:28:35 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ebeeb51976so742522a34.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784212115; x=1784816915; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rL4SpDLV0gQsFTbrH61VS1SQZ29IO/LN7dDdsh0VUgw=;
        b=KhR1hyw0y6JJhoS9uTNEBvQ0GnYAH9mVXGphbh+Q9zolCB2Paamn87QMOYV2z2nHZr
         UHS81RWX0CogLCxCQvHhUiDRnpeeNCWtnCcabLlXlbp2Vcs39Fxuu2NXkinad3O9ja2P
         Xz5k9kv22UFtg7Kjm9iMI+FINcTM8tForfts5CHF/5KCYwh8CKJUN7IpJA6pPqxz6bj+
         tURLz2fscBkUFqWYDr69toEM2Culh3Yjh29xja6r77G+aUDTN+3IfC7d8yChmeIhoXYh
         ECq7jF+tdjwCMkWSgvImhPdynup2X+pL/yMIvvXB10HerIVrVxOUmpYdVdNB6oGDksTQ
         kfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212115; x=1784816915;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rL4SpDLV0gQsFTbrH61VS1SQZ29IO/LN7dDdsh0VUgw=;
        b=GhgIB+P246yp93vHcVOqHIrjvXO4OEQpw/jqKomVFo/oUBZyboet938uGPCrH2+JEa
         NL7UCVXmP/f4QhXwFyWgtOxLvsKwkksvmeCK4r8geteIveobVYG0zmwTuPLl/WO/GNZm
         tRoW5R41iWDiFMQPPkufpORpDA1UwztGkyAkaMVV7wHVuT1R2utVx1r7ZqWO7AESauyi
         xbaG1zMJ7yra8P5S1BTXdoVzOL3Q8/F0jyJJXWYcP+XZHnd+ixX25tuFrjhHYlK+wZj3
         50JjDT5i8ACflg3D1C2EZcQH343epxnsNNBZnEzWrBATKaT9o8H9uaRsNtsQOcKQlSpF
         12qw==
X-Gm-Message-State: AOJu0YyB0GMxSLsvaY8uD54XOz7JLNJffMedMGCQtlEkjMpN8J18BQ2D
	ImfLigvgnatH5LcvFWTyBp1uyNiF6r6hxGBEYcz0X/qGO3HDpriGEiBPJXpf1qK2nyfjGnQSbGT
	hrR8TN/QP4oB6CjcmcKbNytOYZnxLZtplt+78a5o+VpUFdu3unwS6hZ525/AMneFiQvi5xLCast
	NJ9lw=
X-Gm-Gg: AfdE7cnH9salDoxTuSl0/l+X27z29YVNq2VYHfjnhFG5pRrz5hsWimGEDnB4+NhC+3L
	Ipu8AwntMUu1r56OpNYWaTGcL8fafFfzInUzq0J6jjPOEhWyRdLjqVRTJGxXYdnKYkO7eocMfkR
	N/V0d/fYIDSZeURCEwihZ0+WtHA4H/KyBPcWrj2WoTPAiok72AZU8PTbGFdaG8NobN3VIAEQLdR
	Gu7ndH7xnqGj0LDi3OHAqhA5wHf2wSexOmBjFpKEKv9W1BoBV/KB9Gx1FVa0iCqdz3UkmOy2E4+
	yg2BALctFi2w91k+J2BcUmkpSY7OHY5sFW4dBtOkpprB7iaW9WFskSc8uI+gheqNw5xDl9wcNCx
	1Mi9MTnvXZ7UdStVxn58qKdnOQrWtl+Vm
X-Received: by 2002:a05:6830:3c86:b0:7e9:b673:cbfd with SMTP id 46e09a7af769-7ec6e5ee816mr1662255a34.7.1784212114921;
        Thu, 16 Jul 2026 07:28:34 -0700 (PDT)
X-Received: by 2002:a05:6830:3c86:b0:7e9:b673:cbfd with SMTP id 46e09a7af769-7ec6e5ee816mr1662154a34.7.1784212109651;
        Thu, 16 Jul 2026 07:28:29 -0700 (PDT)
Received: from [10.218.25.112] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ec2183a28fsm10376641a34.24.2026.07.16.07.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 07:28:29 -0700 (PDT)
Message-ID: <c66cb2e1-b403-4241-b63c-e71abf8f49c7@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:58:24 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/3] arm64: dts: qcom: monaco: Move eMMC CQE support
 from SoC to board DT
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
References: <20260701081715.2580329-1-monish.chunara@oss.qualcomm.com>
 <20260701081715.2580329-2-monish.chunara@oss.qualcomm.com>
 <20260701082834.EA3E11F000E9@smtp.kernel.org>
Content-Language: en-US
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
In-Reply-To: <20260701082834.EA3E11F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a58ea93 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=AICR_x1_rTwGJrEgV6EA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX9K1QYK/Rv3Sw
 xBsCN2cZaj0hOZpd8rpw2Po36bws2kKdTjFXz67GYzazQw45kPE+/sB8ukkFNGt1Zi4dOcAAFLC
 C9JJpSm5tXBS4CbnKP6gAIakkHgEk6ZNwIiwlfUm1sGnoHRwFkRC7kfpq4V2+m/R4hxLDRK6lIF
 B+BU3LlrB6ldiETCmO9YJ44W0jfS4u1e9KN4sP7AQzbUJP6DoJwSnXP1fBruJGgt2YsmaJJSnk8
 f11Ms9Vs3ibMHeuFqaS35lZlxtwzMau0GvJWfqH/GsKgSnMJJCGmtdM7DIlhqzPb5WW1nYkJPBI
 6JD4WSdEgVz4ENVSe6w+05aH5Xp7aykuPA9LpqXP7OC9vxSJ/quR04hrdaKLN4tCcx3z9qU2cTg
 OMg/bYob0UnqEzU/JwYVxMEKlJTBQz0XA0EIdak8K20sKr0YUf5FPZ21KwebHsupF3JoFvcmxL/
 fz8xitqrG2HyGYJGJqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OSBTYWx0ZWRfX+iXEDubSl1SZ
 tuujVv9Bb/wUaB1b/eNCPyihgYKvzfXbYq9cbigoRyAmMJjrUa32h3bpoizmooQtPCqfc52jbsj
 8Oj5BZ3UUDqH6mU+iLlxDrtjkoyl7dc=
X-Proofpoint-GUID: ipgXvOBffAPy25mCpEHjBJFvZNvc7KSI
X-Proofpoint-ORIG-GUID: ipgXvOBffAPy25mCpEHjBJFvZNvc7KSI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160149



On 7/1/2026 1:58 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing `supports-cqe` property for eMMC in `monaco-evk.dts`.
> --
> 
> commit 5c91ec5c205c89bd965c17fc6805d964575e0468
> Author: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> arm64: dts: qcom: monaco: Move eMMC CQE support from SoC to board DT
> 
> This commit removes the 'supports-cqe' property from the Monaco SoC device
> tree to allow SD card compatibility, and moves it into the board-specific
> device trees that use eMMC.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> index 7b1d57460f1e6..e5f316897706b 100644
>> --- a/arch/arm64/boot/dts/qcom/monaco.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
>> @@ -4828,7 +4828,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
>>  			qcom,dll-config = <0x000f64ee>;
>>  			qcom,ddr-config = <0x80040868>;
>>  			bus-width = <8>;
>> -			supports-cqe;
>>  			dma-coherent;
>>  
>>  			mmc-ddr-1_8v;
> 
> [Severity: High]
> Does this unintentionally drop CQE support for the monaco-evk board?
> 
> The &sdhc_1 node in arch/arm64/boot/dts/qcom/monaco-evk.dts configures the
> controller for eMMC:
> 
> &sdhc_1 {
> 	vmmc-supply = <&vreg_l8a>;
> 	vqmmc-supply = <&vreg_s2s>;
> 
> 	no-sd;
> 	no-sdio;
> 	non-removable;
> 
> 	status = "okay";
> };
> 
> Since supports-cqe is removed from the base monaco.dtsi here, but is not
> explicitly added to monaco-evk.dts in this patch, booting the standalone
> monaco-evk.dtb will now bring up eMMC without Command Queue Engine support.
> 
> Should monaco-evk.dts be updated alongside the other boards in this patch
> to prevent a performance regression?
> 

This property will come from the monaco-evk-emmc.dtso file to enable eMMC.

Regards,
Monish
