Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6593CB54C
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 15:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869538; cv=none; b=rFZJyHil58S/nxfZyqaaW1FsA1FVhOYM0GXEGFV7X4xg5HaqqgBMx65Em1YN0ukbpT+0wR0OXJ40rLMX+v+XzlFoON8QQCAgZm2xKJ/N7n4vcf69fbm5yTa7vWcSQn//u/PxFFI12Iv7GtAkRbZv+j7mNRFfBTxehZhQw0NdJCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869538; c=relaxed/simple;
	bh=ek0mHY+jX6/KNnk4EXp5aEITYu1sH8LI6WIoOTR4bGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+CTAkoXgU6rzMJwe7oPTScob+SzqyC0zIUolmMniZYh20tn2MqRWmW4Ib85JgdW2Qp55oqM9t0RQfnYjCyR26ykmzxhA/GL27TPuAuUW1OMp8tfNwtL1RTrLMi+Mq4wFs4ciJl0oyq4qPl9sIiHg3bUFE8URrDjOYxgGDKvD+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIuUXEpE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DEZga05U; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIuUXEpE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DEZga05U"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DjuN71304155
	for <sashiko-reviews@lists.linux.dev>; Thu, 1 Oct 2026 15:45:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xOg8ridGO382LkGdPMnhwPfNlAgSjjSsZkKVWWJT/h0=; b=SIuUXEpEkR1C86eA
	1cZZRd7Hqi1yYbwiFZdH1C7UJk7mHUxNrDc6SX0qGqXxF21ZzJqIcoUmBDQvkBgF
	qarAldHF8hGnW/Q9PAVRCTB8gUsfiF1bJlJubbNI/lK43nTK5/YVvSdLmYOh4eKO
	VMtAQRilQ34KrZn6V2osg5kFj1KGrZnjFNhHxY2bOLglp8XP4OUaQCnWVW6xYJXk
	IrMf7pmyPw8ei37q0ECW5QeB0s1P9uCvD+LIDyfL57nA0M24K54AEj8yjvN1mvEb
	COIBFsL8LRMvjPgHVPvYV/cJ6Ja3djjWbTCFFoEUKQYWPX7pIn3QcWqrbku+SEVu
	yshUWA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh5cv66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 15:45:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7ce00b8c6so2310490a12.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790869533; x=1791474333; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xOg8ridGO382LkGdPMnhwPfNlAgSjjSsZkKVWWJT/h0=;
        b=DEZga05UGI8TE1J5zlqvpWNuaH+mBtbEBnIzkmdLAXnx/it0ROluDd5i46thYE78mq
         cbTa4xXBKnEEebuz7ToPG2NACy83qM+f4S6dYuuaxEVJXQ5Dd37kDqSAkRTBg75wTn1k
         iAXr2H+8bvU7nkWKZ1tzTdyG7UQJgfyZUuy5U4NWQWBRC0sBN1lYZUh6pT/3YPxa1iyI
         eKEAI8zjmaAaqJDBjhBjt+GDCuNDhcHcVXK0UKhKK5YGnCW7BxH8RAEgJW2jni7eDCPW
         3iSKiQYo03WZC0hwps+uQ3WWQuDQlmGI3vAG4Ca3dzoCwkozOaCmqbS+X5yBfv00aTIz
         P3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869533; x=1791474333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOg8ridGO382LkGdPMnhwPfNlAgSjjSsZkKVWWJT/h0=;
        b=MG0zm+jo2183fkQuZT1ZosCNmTCxdY16ILGsJ0v2i/7cMZ8RRmACe4dPEznwlXRBVQ
         VpYt/rbAh/pnhsT+IoFlAh5U/a4qjwi4t1F9y+qZAS70Qv4FlehP8mJng00aRWAJUBV7
         tRwWHbqjOZUcVs5G7MIh93V/1Oq7eKU6fb2PSNzt1IMK1nWsLaDpD2KCBAvYhgZnU6L5
         Ej2W8V4YKLlWMVm9bkHOY7POzjz9HPzKUsE83g4s3ZNzm1px4hW4g3yOYRwQW/7WN6It
         wg55HVGx+v8NDCZ15YYeWjrEg9l0QnbCF75WSsDrJ9oVtSxytqP4SowFLuvtVJ7f056H
         zz/A==
X-Gm-Message-State: AFuF++n7OxUQwn4ThSNiwFTv5vwZkMFAJ9Q3dFruvFt/zW13Y64Gje9i
	tMCzsPApy8KRR8sBTM04HfyZS+JFbMFjW2OckN4eRigkWKA2p7Vim4cqva6HyfAre37hrYJvmr4
	Ncw+rrXISn4eRm8SBBCpqYqbom4QVmybV/nGYMkpHzRS9LCrl8Xjl75mOJjqjV4gaLifxAa8buI
	itohE=
X-Gm-Gg: AYBFou1qOzZw2p/HZGmR7AInA4Y1DuPiDS5VUu2mjTV2V9V3YB96CbV4OB6Z/8zRFF/
	f2d6XqEIkadser1Lp4maxbeiYjr+EmGmGO95yXfqKnJfeEYqfuNjHbAlr1Dto/+Z9XkXqhccPOH
	3emfhYcoFl9cJTMxLYz8MsjJcn7l5+/m2HhvUPe3/zpQkIA6Wx9TyPLkegF9emdnZH9iuMRQ2MP
	nSjx27kuBt8Ta5Y5okCiZ0WS7L1gAzBfxUUEqJjL0BOoBVlUzm/zcvqEAEArtwNiw1wTyAfoqSU
	3toQBsBJY3PjyuDW2qDdehNRvDzT6cNXx85JyK+Qda4PMwu4+jKR+thfARfM6qB0tlC0T0PNJAp
	6yFgpCtPM/z2WLfDxca9U4OykVDDfcz8/fBkl
X-Received: by 2002:a05:6a20:1603:b0:3de:5abb:ac8e with SMTP id adf61e73a8af0-3de9e89a4abmr5562007637.69.1790869533385;
        Thu, 01 Oct 2026 08:45:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:1603:b0:3de:5abb:ac8e with SMTP id adf61e73a8af0-3de9e89a4abmr5561981637.69.1790869532822;
        Thu, 01 Oct 2026 08:45:32 -0700 (PDT)
Received: from [192.168.0.116] ([124.123.146.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-888193d7cb8sm1305786b3a.37.2026.10.01.08.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:45:32 -0700 (PDT)
Message-ID: <4cd28b2d-421b-4665-9985-3612a6f2c99a@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 21:15:29 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Add BAM-DMUX support
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260920-qcom-shikra-dts-bam-dmux-v3-1-91474d507d61@oss.qualcomm.com>
 <20260920034535.9EC581F000FF@smtp.kernel.org>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20260920034535.9EC581F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MiBTYWx0ZWRfX5uOINbFkoxed
 hdOU/z0EDom73avGvxEXjWjeNon4/UZanO8Sw/0rSnI/fX0daB+tZnAtKqaNR5xvOEYk6nR7FRE
 /SAp8UV9lnDeoCEfP6WyqA8qMrWRpKJBbjw0aNYSDRePO2fmw4RO+fmGNYEGUx5E0MqQncDvZEV
 a+5Eq9GrH4Pn5ckgy7TGTomW6VGX1gYBq/xhq1A8G1RELk/ku4goFB57vd+ooOATIa+i8jWYodg
 Zs6b4ASw85ipjv2leiXH+6GitySOxw2L2TIddy/qJejx7l/Zi4axWcdg/7rLhrme0TDT7tYQiQm
 mDtfYKH/TIs0r5e3daV1tr94tgbGjvjYxQHZRYOzAkgC89b7EC0CPRqGIpoc5EXehdkuD2rUjb2
 OAWBbBTzdy36P3vrrXwHe9vWk+ov8zBLeyIEHr0QHeAKJqAO/mebjuWXYatP3MjqG9awEAHCy2h
 wZxcavUhwIRFvw2mVQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MiBTYWx0ZWRfXyE78mjLJqMsm
 8TkA0TZhERRj9YTQG3TihEMHC6eoKP59urBq+9xs04qFdBZSbOM3Op7xirejmOy6DAwxQ+x9Fve
 HFGiKgNM3nDm90LcyhxtKvpYRLG9q3o=
X-Proofpoint-ORIG-GUID: p0XJT0Oqj7ug7xi4rmRYmptayesrCneG
X-Proofpoint-GUID: p0XJT0Oqj7ug7xi4rmRYmptayesrCneG
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abe801e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=K/78aEDNEn2Q/Yuv7mVN5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HFV7P2PMItf7egDhFlcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010062


On 20-09-2026 09:15 am, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] dts: qcom: bam_dmux_pool shares BAM DMA descriptors with untrusted modem
> - [High] dts: qcom: bam_dmux driver ignores qcom,vmid, leading to SMMU/XPU faults
> --
>
> commit 29cefe6f8087e49778891d714bb8fb329002f944
> Author: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>
> arm64: dts: qcom: shikra: Add BAM-DMUX support
>
> Add the SMSM state entries, BAM-DMUX node, and BAM DMA controller needed
> to provide modem data channels on Shikra. Reserve a 256 KiB restricted
> DMA pool and reference it from both the BAM-DMUX and BAM DMA nodes.
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> index 92d22e3b6931c..4980c125b7e1a 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
>> @@ -352,6 +353,13 @@ reserved_memory: reserved-memory {
>>   		#size-cells = <2>;
>>   		ranges;
>>   
>> +		bam_dmux_pool: restricted-dma-pool {
>> +			compatible = "restricted-dma-pool";
>> +			size = <0x0 0x40000>;
>> +			alignment = <0x0 0x40000>;
>> +			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
>> +		};
>> +
> [ ... ]
>
>> @@ -1866,6 +1891,20 @@ glink-edge {
>>   				qcom,remote-pid = <1>;
>>   				label = "mpss";
>>   			};
>> +
>> +			bam_dmux: bam-dmux {
>> +				compatible = "qcom,bam-dmux";
>> +				interrupt-parent = <&modem_smsm>;
>> +				interrupts = <1 IRQ_TYPE_EDGE_BOTH>,
>> +					     <11 IRQ_TYPE_EDGE_BOTH>;
>> +				interrupt-names = "pc", "pc-ack";
>> +				qcom,smem-states = <&apps_smsm 1>, <&apps_smsm 11>;
>> +				qcom,smem-state-names = "pc", "pc-ack";
>> +				dmas = <&bam_dmux_dma 4>, <&bam_dmux_dma 5>;
>> +				dma-names = "tx", "rx";
>> +				memory-region = <&bam_dmux_pool>;
>> +				qcom,vmid = <QCOM_SCM_VMID_NAV>;
> [Severity: High]
> Does the BAM-DMUX driver actually parse and use this property?
>
> The host BAM-DMUX driver (drivers/net/wwan/qcom_bam_dmux.c) does not appear to
> parse qcom,vmid or invoke the necessary Qualcomm SCM calls to configure the
> hardware memory protection.
>
> Will this cause SMMU or XPU memory protection faults when the modem attempts
> to read or write its buffers, since the driver fails to grant the modem the
> necessary access to the DMA pool?

The driver support is added by the prerequisite series and is in review:

https://lore.kernel.org/all/20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com/

>
>> +			};
>>   		};
> [ ... ]
>
>> @@ -2026,6 +2065,18 @@ dispcc: clock-controller@5f00000 {
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		bam_dmux_dma: dma-controller@6044000 {
>> +			compatible = "qcom,bam-v1.7.0";
>> +			reg = <0x0 0x06044000 0x0 0x19000>;
>> +			interrupts = <GIC_SPI 74 IRQ_TYPE_EDGE_RISING 0>;
>> +			#dma-cells = <1>;
>> +			qcom,ee = <0>;
>> +			num-channels = <6>;
>> +			qcom,num-ees = <1>;
>> +			qcom,powered-remotely;
>> +			memory-region = <&bam_dmux_pool>;
> [Severity: Critical]
> Is it safe to share bam_dmux_pool between the modem and the BAM DMA
> descriptors?
>
> The commit message notes that this shared pool provides space for the BAM
> descriptor FIFOs. By linking this pool to the bam_dmux node above, the design
> aims to grant the untrusted modem access to the entire pool.
>
> Because the bam_dmux_dma controller uses physical addresses, if the modem
> overwrites the address field of a DMA descriptor within this shared pool, will
> the BAM DMA controller blindly execute DMA operations on the forged address?
>
> Could this allow a compromised modem to read or write arbitrary host memory?

No. On Shikra, A2 BAM memory accesses are checked by the xPU against the
permissions of the remote VMID, which is only granted access to the
restricted pool. A forged descriptor address outside the pool results in
an xPU violation. This is the same fault that occurs today when the
descriptor FIFOs or buffers are placed outside the pool.

Thanks,
Vishnu

>
>> +		};
