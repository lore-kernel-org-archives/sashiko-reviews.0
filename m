Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262F8356755
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 03:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565613; cv=none; b=A9xuar+6vf8dcsvd89w4Htq+xmORMh11p7KW/mkS8SHaMIz4N5B4V9vST7zpJjYJf9OQ1Gaexf2bIY0ksyNuEjjKDLYWIGosAf5oexx+LTqbePArLbvOdUEMP3YS6isGb1sH/zCqP40uHbE2hhuGRO/KfFOo8ykdMtd5Rq5NhGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565613; c=relaxed/simple;
	bh=53tLU7Ps2H+f3dic7QewFLbcTE8+mia5MBui94ExjQI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=assBp70iut4dh1vgWjs7qHDyFH0zCA/2n+4O+/CC/VkD8zftuuzCx6TyaWdtEtjaLLk8bVTzhmg7toyqNiDi8UZ/bVmp8eYfdy+RrN8DMOTAKV9Q6xue93z1XlLToTYAAHeSaBjnpc2G2RLpMLDjx0tFiKTKDvCCo8frxGI9uHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=avM7V1x0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnvRYjBr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="avM7V1x0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnvRYjBr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1BMqT3456088
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 03:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BPeGMbjbBxfKamsqiHMI1B8e3ukxWNHTNoce9CWzzzU=; b=avM7V1x0LBMIdA1j
	V+TIIenhbI+o3uUByBVRniO1G+VXdUZHV2NA9MG0T7atxXSFIKj20HB0G3esSkXF
	xo5ObbrJVd+OZj6PhyKsfMsBUiw+GGno4mEgQ3tzPz2rHN3VY3yxTqwEynZyaSzp
	PiREBMTLg+Suh6XWrO46/F6PcZah9jBaQVxVJUZi49l/aMMdpIt/sooFW9UAV7HW
	q4UdGgqTZxbRgwkwD4AlCmjEnu9rSUSIOdydF44sYbxmwnTEaQzg9v0v/9PsB3sq
	crh5B2f5VUDQOR+LFFOYuHmhs3DXUdRKZrcKj8tsvIvoFC1rvR87mPdzBJnMX1aO
	Fd4ZsA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq099f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 28 Sep 2026 03:20:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d94a158dc8so37128455ad.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 27 Sep 2026 20:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790565611; x=1791170411; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BPeGMbjbBxfKamsqiHMI1B8e3ukxWNHTNoce9CWzzzU=;
        b=AnvRYjBrszb2iWBz8UsJtUnDIOfmkq7zDDJHqGIOWHKe3snuZY+xeEfU5pmKGKueEo
         e0O8IEWR3L5Bs+XsbdMZTn0Lp7S2dY54VGTlwMrtdVcJbNujUqxF3aJD7zGVqr9dbtzi
         6opq9r2uC1DuYRjwhuj2oncwRWt60+ZKDi3mGaUiYITKiluwBTq0kghMkB5d0NI7TUjf
         3vmGZNoSF9IcUbRWyXE7PdjXA7lhphVaMJXuTV+kq4YnPEfPDxFq6cbiz+AVYpx6qYuu
         BnIs1eA29una5bJYXa2k7gEKj1hy9MEpBbsbkS3hnu+toeHSuJT+tltlCwkT4az87fm1
         lPSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565611; x=1791170411;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPeGMbjbBxfKamsqiHMI1B8e3ukxWNHTNoce9CWzzzU=;
        b=eXCf2ir+18sxh8meqqknEpizKsg1aKKs+jQMv2JaPtUMGmoNIu1+iPbbNBDEAt1AXi
         ngFOEYNd0Yp17X/ACgm/eRYFBmTgm98KgJpqkQ1wXD30Iaj8RbBErpEJfUMC6ZafBG6b
         +odRjNMgQYrKcs+SvrRyFpxzaC3+uTrFhRTDcO4Xv2//aepXeAwi1FRUeBo90Tidlfnu
         0qbJ+GFVuqOgYKt52AUuv27hmWAPSrrx3zfzgQ/VITcPfhHiDO0ojL2IwOKhhEBs2NTD
         J0ff4/qKQq6m6vbwCSESGNr8TbkPXaBLHoq39SL61GQCq0bhm9w8TokWomfLieMF0oe0
         Y0/Q==
X-Gm-Message-State: AFq9FYLFhycp37WxhSCU9pWqcuGwaf+cFidadYRUJhATjy24bOU0YJ2q
	kOQQzMnfX0FTHlxsjE7QpIbUBaKIDLqXWd+TNKJnI6H3A6Pxg0fHbhVDGsGzzFYFuoMZVSB3q8Z
	Fg5qVRiSuF4LW2YkEFxKx/8P/c/DhlDkOusYm2bRJNzEpSCenGKK5pvgxWshp2zOcjqwH6EFRvh
	x3ado=
X-Gm-Gg: AYBFou0XLT9VIY+ehlRHwdt3DQBgE6LKFuffRjwgUzIr/VzqXd+Do8dsnuWWLyeQwGz
	jiyeqQNT7JoxOeCoUWGRy1tkzY9y+kJzjq29UDBu2Ccv2iOFbVNXCFCrSw3AuQptdoSJNdfRxj0
	G8a1wt1tZSLDZNy5rcwqGRPu8V0yjy9G/z9kJuLNO6pYj//sa9YotlWtwCLXGmx1qvDuEmxHBvq
	52hGAD/O607aODJlPnhH53sCUG3ZZl4TtNIArrsfNcX6Dz444ifvpu8uzSbKMd9Eq8Tr5+dv3Sc
	1BwNBdHfWQ/3WUcDT53+HfOxFSiHu39SqVaN9N6kppje4b0yIa6imsP/mS/Cu1xbxpJjWx4TTaz
	n8Bht/0kU9PKh1bn0vPixoJLRGcjhbEN/KWee4uQ221c9bHRopyApmhOqum9sEpxc+t0gQg==
X-Received: by 2002:a17:903:1ad0:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2df94906031mr61070995ad.3.1790565610628;
        Sun, 27 Sep 2026 20:20:10 -0700 (PDT)
X-Received: by 2002:a17:903:1ad0:b0:2d9:599e:df95 with SMTP id d9443c01a7336-2df94906031mr61070885ad.3.1790565610128;
        Sun, 27 Sep 2026 20:20:10 -0700 (PDT)
Received: from [10.133.33.62] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e13c8sm33820715ad.25.2026.09.27.20.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 20:20:09 -0700 (PDT)
Message-ID: <fa853efa-918a-461b-af98-06bf59040b70@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:20:07 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Introduce Maili SoC
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
 <20260922-maili-dts-v1-3-ac2b1b76bfd9@oss.qualcomm.com>
 <20260922233119.9674D1F00898@smtp.kernel.org>
Content-Language: en-US
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
In-Reply-To: <20260922233119.9674D1F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y2AUeDYlBRbFDvR2jo-ndutYIl9SqxaN
X-Proofpoint-GUID: y2AUeDYlBRbFDvR2jo-ndutYIl9SqxaN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX4aGC7ebEneiP
 04oar0rdy34fofgFyDtT/eawqSgUQ7qR2iDsx+YLbyMP3fP+ZqHRR7vePJdMu9N2GWOkVJhekKX
 P5aPgx2QoFhCqomEgTPI3EgALJhsLEw=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6ab9dceb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n0sZffVvZfifOZd3MnoA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX44Q3a3IEYXap
 TjPPOXT9WbnI2z3UqHPmGwKO6ndbqzuff8I8NklGcVg2EPUaF8naWRvdSt2+ww17cV8dA6fXVgx
 9te7sCSxMiN96pqJlqloud1M5/y1SFt7jekVkFJ2m7iQNUhJhyqL/UDYTNvx/V6ago7itkbPrve
 +8jqo/YVbaeMahtiaQZJexJ2ZUlGxSEKXSte7rfG0e8KTQzSL4fZ4usdGVciMUun8Lfb7EHef3V
 RdMN3e3o2bVj+t3ZLq9GZYOe9LOXOh6rjk+aKsLanJ0LbFP3Ojhw3SCt9xh53zVHkWRCWNHkz9t
 vJT+FVdlgnL78OwhbcEF1pXzhDZ2tz5Z1+YbptMWAy/dAaRv4DC0Uv6lfUR1WypP2OTjUDMqKI3
 +s4KvMW711QV5SE6Spvdo/gdj+xL3cSyjT7piQreSqGX0zCF309twL/C22azxwXlVDw1Lr6KSuw
 Ufx3wKYpTCl4I7ldRNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280013



On 9/23/2026 7:31 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] dts: reserved-memory overlap between mpss_mem and other regions
> - [Medium] dts: invalid topology, all CPUs share a single l2_0 cache node
> --
> 
> commit 81315838a00d887952d320c67bfae01521f7328e
> Author: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> arm64: dts: qcom: Introduce Maili SoC
> 
> This commit introduces the device tree file for the Qualcomm Snapdragon
> Maili SoC. It defines CPUs, PSCI idle states, interrupt controllers, timers,
> reserved memory regions, interconnects, and other hardware peripherals.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
>> new file mode 100644
>> index 0000000000000..886d307e536be
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/maili.dtsi
>> @@ -0,0 +1,6956 @@
> [ ... ]
>> +	cpus {
>> +		#address-cells = <2>;
>> +		#size-cells = <0>;
>> +
>> +		cpu6: cpu@0 {
>> +			device_type = "cpu";
>> +			compatible = "qcom,oryon-3-0";
>> +			reg = <0x0 0x0>;
>> +			enable-method = "psci";
>> +			next-level-cache = <&l2_0>;
> 
> [Severity: Medium]
> Does this topology accurately reflect the hardware? The l2_0 cache is
> defined later under cpu0 but referenced here and by all other cores, implying
> all CPUs across all clusters share a single private L2 cache. Each core or
> cluster must have its own topologically correct L2 cache node for the
> scheduler to make correct migration decisions.
> 

yes, it match the real hardware topology

> [ ... ]
>> +		pdp_ns_shared_mem: pdp-ns-shared@81f00000 {
>> +			reg = <0x0 0x81f00000 0x0 0x100000>;
>> +			no-map;
>> +		};
>> +
>> +		smem_mem: smem@82700000 {
>> +			compatible = "qcom,smem";
>> +			reg = <0x0 0x82700000 0x0 0x400000>;
>> +			hwlocks = <&tcsr_mutex 3>;
>> +			no-map;
>> +		};
>> +
>> +		dsm_partition_1_mem: dsm-partition-1@83500000 {
>> +			reg = <0x0 0x83500000 0x0 0x5180000>;
>> +			no-map;
>> +		};
>> +
>> +		dsm_partition_2_mem: dsm-partition-2@88680000 {
>> +			reg = <0x0 0x88680000 0x0 0x1700000>;
>> +			no-map;
>> +		};
>> +
>> +		mpss_mem: mpss@89e00000 {
>> +			reg = <0x0 0x89e00000 0x0 0x10400000>;
>> +			no-map;
>> +		};
> 
> [Severity: High]
> Does the size of mpss_mem intentionally overlap with the following memory
> blocks? The mpss_mem region is defined from 0x89e00000 with a size of
> 0x10400000, spanning up to 0x9a200000.
> 

the size should be 0xe600000, will fix.


> This engulfs the subsequent q6-mpss-dtb, ipa-fw, ipa-gsi, gpu-microcode,
> camera regions, and partially overlaps camera-2. Memblock reservations must
> be disjoint to prevent early boot reservation failures.
> 
> [ ... ]
> 

