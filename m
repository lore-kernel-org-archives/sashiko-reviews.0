Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0758B445ACE
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034097; cv=none; b=c9EH7XKxaLOr1tYoOcMReNu9gX2lrTckfZ4kjp5wYlz5iKnANPacAdR0zE1XqcmGq0Dks3Fe8hauWC+f0NeMp3qo7K6sI8BFV+qacL9wyXIWTOzHzK4YMbL/1MeMVrvzIeaSf+DZMi8gxtVu8eC0+//yXkf0dx9pg+v2q49oaTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034097; c=relaxed/simple;
	bh=wiUVEPinw9N+2X2D0NbPEHwitXA0TSkVxf6Wzl6ISJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFcC4QFYbRMWf9cJsKnrE//dQvpnuTsqj56AQSAf4BCm5v/v8dnU9YjGCmMjSQKITQFp7qVSkMINtDnQx4YqVQeSfd6wuQH9dGyhzw+I2mMKACMfg9kAA5QVRexzSYf2HOvdQATIkZZFxSIJCwI4yiX1DioBWTF4rl/ODFBJFWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KrWUboeT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJsIKpH0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KrWUboeT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJsIKpH0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBmw0H474588
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zULZzfXg5cn8fPqepA5+O4tHoqs848wQxaCgPp+Jz7w=; b=KrWUboeTQKv1QkF5
	Wux2S0tcUpjqOqmNT2nWa2zMDAj1yl5KWLhLMdSzfO0/Abyo56WWN+qRIQxWMfmb
	UbAh2Ds1dvkw2mucZwZRSQqvRi4BHbmbWDJm6h6FAwznz0E2UZITOwt7aexqvrXi
	mTijGOJzFO3bazEmIBEHejHkT5r0dM+MlOLT/CD15YWiOXIqlKa620ntz50WilOJ
	KnKrVU5kW23QE0JXB2fZAGGl9OS5JWfyhPfFlI5x6gePTddfNIsbAkavQ6YVcJ/E
	gZAykDYm1sOcq4OEneKZibSoOsfqP2ZQ8MErbgh29emYep45xJY0bS0Cb9iS9BmL
	B4xNKg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdmjq09ht-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 13:01:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2caa9a3cf7aso11774365ad.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 14 Jul 2026 06:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034094; x=1784638894; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zULZzfXg5cn8fPqepA5+O4tHoqs848wQxaCgPp+Jz7w=;
        b=WJsIKpH0GRIBhiR2Ej/HHcEHW6P4aFHdpwKle42yVzJ/CoCQcaL4eIJzgMaY98xrbI
         2cYHwbR3CfdGqsdP4jzvDfwkwBhaYgWWn1soYlvfwZhb+16cFtxBTg5GooJCZ3PbfFLb
         bW4sSRPaxrEvIUmcWfSBLjd2QtNeVOYHAwgYipmkBN714s3pw3Fjfv9i1BBtaqEJ5pwe
         wNprmzCMZutwwgbv3dQm2RUwBWysCGdcX4IT4wXw1jIrJadVm+WJsB2LFmSnJ3m+s3Qs
         rG4dgysGInm6eRMUp7hJa2Oj1K3QfctbyNR9+i4AUuhlFZpnovEBNv+6ghkEgodooZTc
         HYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034094; x=1784638894;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zULZzfXg5cn8fPqepA5+O4tHoqs848wQxaCgPp+Jz7w=;
        b=IlSoiLdCvKhotGN2CIpB+FwmiNFolLO7j9jhyoUsGSJYiIwYMPQQU1/g1iiyHQ8I68
         LrHR6YOI9brDIu+hKm/bidteTokkxSkIOYK03bSm+oDfYrRNIJoEYT8ezEVa38hJtBKA
         gdnSr5aeSSJ0lw7co+X5aYIKbuRHBi1Yb3Js2FfkYa/5URaqOHovFwZKH6vFCzhTw1E4
         14COZj8wYfUBord5e+gM8XgM1f1RK4BL2m4RX+qk43RYjAf807NKfAD2JqbLfeEWB5xG
         Vrk95gpGArF9hxXP8snVvjOEVfn1T1EhwHQIFrnDEnOjxg2Nw/dheLl/RmO+qnPAgyv0
         /u7g==
X-Gm-Message-State: AOJu0Yw1fqPYcSQSdbpmcMXWf6jG7JpXHQcwD54Yc/CnJBU47TjkUAvy
	30I7ji6EwdLZlwU0VZkZyQwQBMPvhrQuZDyFnUKQF+gUw088TA5B8NFk1lWc/5mUSOSwhXKa8qT
	Y8SZcoC/9qRQakUZgAeTImibD6vqJ5rwQtcwfv4S/tuZIoZGhPDZJNroP3TWGhicHxRXVl688Hv
	Qqsr8=
X-Gm-Gg: AfdE7cmExeOhozxKlW/tQ7vFeq9ldOh0MmRu1ve34kO1c6Egz4xTPgaaTPuZtCgOdSE
	dYyyN7bCfNgu/QXdH0J6AcxJP7OZHCNM4LX6Xnrc2P3jWITejRY4KonFzno77xFovHgtA/cLSX4
	1UPWj4Xq1/ckbTQWhli5W7nAZaLJ6+VNCSK5V8WygDLNlFMFZGqMoSEAM+zuLjrbMih1y3ZpujJ
	k0xei3lLumlOUQwEESrqWHHXanOe01MEKmbDUfXwFOIPngIajQNPv0555AnjuqKpO95cdJiSjCt
	0EoTeWZ4FpjHyOQG4O0aNaOftW+olOr2PUhyXR//nknAn0RFSAkndyV1+daD51b06IPpJGGz06M
	xBh80DY/T6wcOUosx7hzJvihy8z2T
X-Received: by 2002:a17:90b:2585:b0:38d:ec55:7aa7 with SMTP id 98e67ed59e1d1-38dec5589c6mr8804115a91.19.1784034094016;
        Tue, 14 Jul 2026 06:01:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2585:b0:38d:ec55:7aa7 with SMTP id 98e67ed59e1d1-38dec5589c6mr8804064a91.19.1784034093107;
        Tue, 14 Jul 2026 06:01:33 -0700 (PDT)
Received: from [10.206.103.83] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174ac14f2sm86490794eec.27.2026.07.14.06.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 06:01:32 -0700 (PDT)
Message-ID: <777d061f-3b2e-4b3b-bffd-2ab5b3024e58@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 18:31:27 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/11] arm64: dts: qcom: sm8550: Move Iris IOMMUs to
 child nodes
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-8-72bb62cb2dfd@oss.qualcomm.com>
 <20260709143046.7B5721F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260709143046.7B5721F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LqmiDHdc c=1 sm=1 tr=0 ts=6a56332e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Yny9DMg95cZ_4ygEYTwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: YiiC5UMEvqHpu6kpbblFtYgAWpmKFeg3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfXy4cafFsNxyPn
 zsYlgZjgT9JxDtQZum+0rIiN8pjFKt3NxkUixjJ/mhx3EQIUQVO+bdSWtB7i2g/r8H16eVSXd5I
 fORPB5dYFHaBZCgtlSCSDv3OujfgEbPso/T9ThcMflNLosK+1YKE5W9cKNd74cL1qfx2tFpQqzw
 PpQrNN66VMg9d8LhcWr5UnnWwSjPBhkz9EUdwzHhqVAAChHxIAKcn7yG/a+Sj+FuhlTQZlavCxp
 r+UCFB0XAlpipD3vtxvLbYBU/fOO2g1wCyj+/l1rUi52DirI+CZMa1VVdJnFMPU4EESYT4NtQpE
 0JBcK3qnK/qAk+QvFHX4RA1z3b5CZfb3BMo1W9PAcYD7aFajWSZAf2bqa5SMzg97tBrBT1QaO/I
 fw1d5pAiyAEl99/wEQJ+CCvxuFvDP5QxexcsSMFsFWp8ap/6kEJNv503QpANhdX7kNO+e96uOwR
 S5e6Sb/2jApb618m5hw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzNSBTYWx0ZWRfX7IdF7vWdXR6F
 pqsyOXUDsY3Q/w1jZVW9ja/iJydrKItzsmKsQxuefXDUtJ8LMJMnwywXtIPsHA8GMdG18lzpBkS
 kUhN7/3ifGJgiE1vB1fvGr07a7U7RXE=
X-Proofpoint-ORIG-GUID: YiiC5UMEvqHpu6kpbblFtYgAWpmKFeg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140135


On 7/9/2026 8:00 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] The `reservation-iris` node uses `iommu-addresses` without a `reg` property. In `of_iommu_get_resv_regions`, this is parsed as an `IOMMU_RESV_RESERVED` region. The IOMMU subsystem explicitly reserves these regions in the IOVA allocator tree (e.g., in `reserve_iova`), which prevents any DMA allocations from using this memory range. Instead of limiting the non-pixel stream to the 0-600 MB IOVA range, this patch effectively denylists the 0-600 MB range, forcing all allocations to use IOVAs above 600 MB. This inverts the intended hardware constraint and will cause the VPU crashes it aims to prevent.

hardare constraint is precisely to keep 0-600MB IOVA range in denylist. 
So this is intended behavior.

> - [High] The `non-pixel` and `pixel` child nodes lack `compatible` strings and do not bind to any platform driver. The driver registers them using `platform_device_register_full()`, but because no driver probes them, the driver core never calls `platform_dma_configure()` (and thus `of_dma_configure()`) for these devices. Consequently, their `dev->iommu_fwspec` and DMA ops remain unconfigured. When `dma_alloc_attrs()` is later called using these context bank devices, the allocations will bypass the IOMMU (falling back to direct physical memory allocations) and trigger SMMU translation faults. The driver must manually invoke `of_dma_configure()` on the created child devices.
> 
This is not true, please refer the other path

device_add() (called by platform_device_add(), which 
platform_device_register_full() invokes) unconditionally calls 
bus_notify(dev, BUS_NOTIFY_ADD_DEVICE) in core.c. For any device on a 
bus in iommu_buses[] (platform bus included), that fires 
iommu_bus_notifier() → iommu_probe_device() → __iommu_probe_device() → 
iommu_init_device(), all at device-registration time, independent of any 
driver binding. And iommu_init_device() explicitly handles exactly this case

if (!dev->iommu->fwspec && !dev->driver && dev->bus->dma_configure) {
         dev->bus->dma_configure(dev);
         ...
}
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but in `of_iommu_get_resv_regions`, if `of_translate_dma_region()` fails (e.g., crossing a non-translatable boundary or encountering a malformed `dma-ranges`), it returns `NULL`, which is assigned to the `maps` pointer. Because `length` is uninitialized, it can be non-zero, allowing the code to bypass the `if (length == 0)` check. The loop condition `while (maps < end)` evaluates to true (since `NULL < end`), and the next iteration immediately dereferences the `NULL` pointer at `be32_to_cpup(maps++)`, resulting in a kernel panic.
> - [High] This problem wasn't introduced by this patch, but `of_iommu_get_resv_regions` lacks bounds checking when parsing `iommu-addresses`. The loop blindly advances `maps` cell by cell, without skipping the address and size data for unmatched phandles. If a data cell coincidentally matches `dev->of_node`'s phandle, or if the property is truncated, `of_translate_dma_region` delegates to `__of_translate_address`, which executes `memcpy(addr, in_addr, na * 4)` and `of_read_number(prop + na, ns)` without ensuring there are `na + ns` cells remaining before `end`. This leads to an out-of-bounds read of the device tree property.
> --
> 
> --- Patch [8]: [RFC PATCH 08/11] arm64: dts: qcom: sm8550: Move Iris IOMMUs to child nodes ---
> commit 84b6e774da5044311b95ef6d8c3458ace387439e
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Subject: arm64: dts: qcom: sm8550: Move Iris IOMMUs to child nodes
> 
> This commit separates the Iris VPU IOMMUs into pixel and non-pixel child
> nodes to describe their different IOVA constraints. It also attempts to
> restrict the non-pixel stream to the 0-600 MB IOVA range using a memory
> reservation node.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/qcs8550.dtsi b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>> --- a/arch/arm64/boot/dts/qcom/qcs8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/qcs8550.dtsi
> 
> [ ... ]
> 
>> @@ -158,5 +158,9 @@ mpss_dsm_mem: mpss-dsm-region@d4d00000 {
>>   			reg = <0x0 0xd4d00000 0x0 0x3300000>;
>>   			no-map;
>>   		};
>> +
>> +		iris_resv: reservation-iris {
>> +			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
>> +		};
>>   	};
>>   };
> 
> [Severity: High]
> Does this configuration actually reserve the 0-600 MB range for the non-pixel
> stream to use, or does it unintentionally prevent its use?
> 
> Since the reservation-iris node uses iommu-addresses without a reg property,
> the IOMMU subsystem parses this as an IOMMU_RESV_RESERVED region. The IOVA
> allocator explicitly denylists reserved regions to protect them, preventing
> any DMA allocations from using that memory range.
> 
> Will this force all non-pixel stream allocations into higher addresses
> outside the 0-600 MB range, potentially causing the VPU crashes this aims
> to prevent?

Yes, thats the intended behavior too. The "non-pixel" sub node is 
suppose to skip the region 0-600MB entirely, and return IOVAs above and 
outside the range 0-600MB.

> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does the addition of the
> iommu-addresses property expose an unhandled failure path in the IOMMU core?
> 
> If address translation fails for any reason (like a malformed property),
> of_translate_dma_region() returns a NULL pointer. Because the length variable
> is uninitialized, the code can bypass the length == 0 check:
> 
> drivers/iommu/of_iommu.c:of_iommu_get_resv_regions() {
> 	...
> 	maps = of_translate_dma_region(np, maps, &iova, &length);
> 	if (length == 0)
> 		continue;
> 	
> 	phandle = be32_to_cpup(maps++);
> 	...
> }
> 
> The loop condition while (maps < end) remains true, and the next iteration
> will immediately dereference the NULL pointer at be32_to_cpup(maps++),
> causing a kernel panic.
> 
> [Severity: High]
> This is also a pre-existing issue, but does parsing the iommu-addresses
> property risk an out-of-bounds read?
> 
> The loop in of_iommu_get_resv_regions() advances the maps pointer cell by
> cell. If a data cell coincidentally matches a device phandle, it calls
> of_translate_dma_region() which blindly delegates the copy:
> 
> drivers/of/address.c:__of_translate_address() {
> 	...
> 	memcpy(addr, in_addr, na * 4);
> 	...
> }
> 
> If there are not enough cells remaining before the end of the property
> array, could this read past the allocated bounds of the device tree
> property?
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> 
> [ ... ]
> 
>> @@ -3690,10 +3694,11 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>   			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
>>   			reset-names = "bus";
>>   
>> -			iommus = <&apps_smmu 0x1940 0>,
>> -				 <&apps_smmu 0x1947 0>;
>>   			dma-coherent;
>>   
>> +			#address-cells = <2>;
>> +			#size-cells = <2>;
>> +
>>   			/*
>>   			 * IRIS firmware is signed by vendors, only
>>   			 * enable on boards where the proper signed firmware
>> @@ -3701,6 +3706,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
>>   			 */
>>   			status = "disabled";
>>   
>> +			iris_non_pixel: non-pixel {
>> +				iommus = <&apps_smmu 0x1940 0x0>;
>> +				memory-region = <&iris_resv>;
>> +			};
>> +
>> +			iris_pixel: pixel {
>> +				iommus = <&apps_smmu 0x1947 0x0>;
>> +			};
>> +
>>   			iris_opp_table: opp-table {
>>   				compatible = "operating-points-v2";
> 
> [Severity: High]
> Because these child nodes lack compatible strings, they do not bind to any
> platform driver. When the driver registers them, is their DMA configuration
> left uninitialized?
> 
> The driver core calls platform_dma_configure() automatically when a driver
> probes. Without a driver binding, the device's iommu_fwspec and DMA ops
> remain unconfigured:
> 
> drivers/media/platform/qcom/iris/iris_resources.c:iris_create_cb_dev() {
> 	...
> 	pdev = platform_device_register_full(&plat_dev_info);
> 	/* of_dma_configure() is not called manually here */
> }
> 
> When the driver later calls dma_alloc_attrs() for these context bank
> devices, will it bypass the IOMMU entirely and trigger SMMU translation
> faults?
> 

Explanation given earlier in this response for the same concern.

Regards,
Vikash

