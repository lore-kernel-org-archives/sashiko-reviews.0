Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A5B35C19D
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 05:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780897074; cv=none; b=Xd8gLf64rwfAwJJ8MsEZRSsOHsDGSrteA8zKxqAtga6A02UmYtxJwNRYC77MY3kWXtxjO2mRasTLQXxHdetrP6rFGakiJR6UMbQOmzYsS3ujYV0L4orrkRBz1S2kf3hAyPYBf77Ddskw/PjSsgk2tO50YQ4IpgMV6a5xz9X63dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780897074; c=relaxed/simple;
	bh=k433kSHHswEjNIEXyatPSmR6tDkM60pP7cSVKDezh9s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pZWawEmkPxHitfHtaMxAg7bCWY2gVpgOJNeXaLqAWqAYWElQGADKv9rKea73r7Jgp7ChhWMHlrXNW75JUmJ3GKz1VQq36FX1X8S+r/VkPvo4suoZ+1WO1ldVzv79LtJTU63EeytMfeZ9d0MfOhelHwaYHNF18DSw24LGrOfDyPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oST/aAnL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jZzzNEmj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oST/aAnL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jZzzNEmj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580F2xM1577353
	for <sashiko-reviews@lists.linux.dev>; Mon, 8 Jun 2026 05:37:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fsm3to7FrdCvbglcFerVKBvLbI88eR6ku+IP31UeBLQ=; b=oST/aAnLGnFERZ1w
	jAI97r3p5duMRn/uzxoMzgeeRgGSVPzsdQtl8YGK+t1LCHhfvlSdPgRPoGHysNiB
	TjnzyPbV6HATGBl92snWV6tp515SdKfmLLJRNxhsiU61x5/bmQGXPZvWcF4X2eWJ
	Pler0N+8Dy+5GhlaNh0eT9TggmmLnLiAJ7CGCB4wazTojEtbWtx/UR5PoS437R5w
	IwOMO50d7i3DhoBnwK1GPRAj38xqhoUn2c9wnSYVurG604qUDgopsP3VqRIqBIXn
	UzCNsunsu50J27UQLBlr1/32uGmhe3dhAaZWagXc6hlUHhqmwmkniWHzgeg2I6qB
	Kq1Kuw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embs1duw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 05:37:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso7205310a91.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 22:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780897071; x=1781501871; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fsm3to7FrdCvbglcFerVKBvLbI88eR6ku+IP31UeBLQ=;
        b=jZzzNEmj7BkH6KyVx4l3KBg2hcEX8enizVb0YXZcjxcNH3AGtPranKJEZHquioYvDt
         DNzkvkzb740ij8StTrfqpdnWdWkDfhdR5LPhqWqHKeV9lHmiJ2aFfqPhED/ycQYGwq47
         o3b82KIyWwor86EIPHovi9Yu11kMO2P3jgcAHp8u7SHJ/2NEDVtVbhONP+CxmKWZk0Rc
         NIR5j+37o5FSMDuLU5I/y+di/7czRxAzngJzQeqRZK2TihSz1iCZG6lRwidt40WEiCMq
         O2uvJVw2sr3BCP0NEuL3X8r03i3NDl0zJQUmGZm3XKLLhamHjR+BPvk1pBFHd9ncb4NF
         rgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780897071; x=1781501871;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fsm3to7FrdCvbglcFerVKBvLbI88eR6ku+IP31UeBLQ=;
        b=rOU4H7rveebf2YCMF05n9YzgCGyw2zyc/LnygajDrwGKxdB0OUlcQ73KmNxuAMQzgb
         WMzEq/7cxTITr4QUKRS2uEc3dJlN6jC9jbOwTy2p4KMK+dcuFrvnnrxcc7AwUt4eoGOi
         U6g1wbIIp16D3ybqcD46rJ4zUWa5xLS1EUpcvkIdD7mkZ220OB0+8/dMmG/hZIekqsSg
         16OhMcedkYfJtdZR6D62ck0n7P3sdZnjI81p+8hg3K54PIqp5nAItprRdYXedQ4i1aAn
         XE4x8OlUv8uyKdv0M3FyxbC5m9dLobExkx/A5i3kfOK7ivJGxnFIBzdnkA7yEdXSYD7K
         gGrw==
X-Gm-Message-State: AOJu0Yw+R1plZXSk54w+ZKRmLE/+g3EBT0maWVVVi2SsaaQRec4PPonr
	QPvVvBGxh4SmKMS301FuEaHxtc5jSvmI5hrXcT4X+2veDkiwhbUwO0aFW5t+VI4CXLMInGysJXO
	FlxLvHCgcK9OPIV7y9XwBisX4fJltPoeUnLKGWQnnguU1Zwgmlw+R1X9aERC+sh5uN7qS3XMozU
	lZB3E=
X-Gm-Gg: Acq92OGQqLvOnrYHebtsCWVIbSTnS2fp/t7KnaI7inEIvb6JLuAR1+KpIRjLKebbws/
	hhcmx7l9bbi+Cy1HFIr4rX56tYzXK5VwJkcHt8sEs+9adGreHhGC3XU+EYpI3/cnG8ncYAhlFSx
	GGLlMV6tzrTpcnFDRTQmoLvEj49QGOvcPVpzDxjvmKZ53D10Gq8LS9SOgL824Ym/NpD8OpKB4Es
	L5vy2LEE790CUkFx9CmhQPCg5gDmWGojeH25kWOrEjBJCz3KLquSlZcruektblVDc1p8B+4rf/X
	hQ0JAM4Ygp0MP53WsoG6T4/PRTVDfyCZogD2zfgqb2o8BWBFTXyadkgEiYRqvpSTTwsr97LUl4U
	5OFyzgzj32M1ZbIdYjLXNbs2k9RqvWU13/DZ4HVouN7nYGua3mKRTrVOL6bDq3VET
X-Received: by 2002:a17:90b:3d01:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-370f0095c8emr14813207a91.15.1780897071390;
        Sun, 07 Jun 2026 22:37:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3d01:b0:36b:b3f4:d578 with SMTP id 98e67ed59e1d1-370f0095c8emr14813176a91.15.1780897070991;
        Sun, 07 Jun 2026 22:37:50 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f711e7b53sm14471868a91.14.2026.06.07.22.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 22:37:50 -0700 (PDT)
Message-ID: <e1a47ff2-1849-86b5-5a3d-bd820d535b1b@oss.qualcomm.com>
Date: Mon, 8 Jun 2026 11:07:46 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 02/12] iommu: Add iris-vpu-bus to iommu_buses
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260603-glymur-v7-2-afaa55d11fe0@oss.qualcomm.com>
 <20260603143418.DCC751F00898@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260603143418.DCC751F00898@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA0OCBTYWx0ZWRfX6L4mrfKqizw5
 5yOLZcT0g+Lqs+rPo43Kn/2oY7lodrYAuFtJBGcBGQMfKm4bbmgX1Olv/qzu5+H/HQrC4yb5gDI
 bN9M5aOsNQUgBfJU/E8jkoaJ6sLdEuMz62gUs7hmLdZeep5q07XXz4gMT7a3JHFBZFEjZYISm9Y
 ZaVyZxD6MJN56MKy0lmV81VE9kOsbUWN0IdzuhFA90XzET3n7tbfboc0G2T4YUWXJyVqf/Iz6bu
 JyWbz1dChRt4rh4LuaXfYyEhF7O800vFpQy0T8ikpHbnh/OW6vK01hIuHfenrmL803vvsfB2L8N
 tYpEFfUARwktsqHMDZDXVzrIvrzEikdWaRTxe2a68wK/IJuFzUz2i+YuJbraTW6ExeY/LDAnbIf
 MPKBwnEwVbIMy66gQTjJcxwNhMFjWxwWzG29wlA4R/LBj3iWHkLw6Cc4nzfXDKxzUaO3+3IxHSA
 wcs9KymtVf+9ti8Gb8w==
X-Authority-Analysis: v=2.4 cv=CeY4Irrl c=1 sm=1 tr=0 ts=6a265530 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gQWBvvTIlS5GmZPSv-0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: OR63qMyejEMLDiC71_t7dPGFWlhstlDo
X-Proofpoint-GUID: OR63qMyejEMLDiC71_t7dPGFWlhstlDo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1011
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080048


On 6/3/2026 8:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Adding a vendor-specific media driver virtual bus (`iris_vpu_bus_type`) to the core `iommu_buses` array is an architectural layering violation and abuses the device model.
> --
>
> commit 237441c1b5f7b6f9432bcd95591b1105966e57b0
> Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
>
> iommu: Add iris-vpu-bus to iommu_buses
>
> Add iris_vpu_bus_type to the iommu_buses array in the core IOMMU
> subsystem so that the bus notifier callbacks are registered for
> device addition and removal events.
>
>> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>> index e8f13dcebbde5..fe51600953ceb 100644
>> --- a/drivers/iommu/iommu.c
>> +++ b/drivers/iommu/iommu.c
>> @@ -13,6 +13,7 @@
>>  #include <linux/bug.h>
>>  #include <linux/types.h>
>>  #include <linux/init.h>
>> +#include <linux/iris_vpu_bus.h>
> [Severity: High]
> Does this introduce a layering violation by pulling a vendor-specific media
> driver header directly into the core IOMMU framework?
>
>>  #include <linux/export.h>
>>  #include <linux/slab.h>
>>  #include <linux/errno.h>
> [ ... ]
>
>> @@ -200,6 +201,9 @@ static const struct bus_type * const iommu_buses[] = {
>>  #ifdef CONFIG_CDX_BUS
>>  	&cdx_bus_type,
>>  #endif
>> +#ifdef CONFIG_QCOM_IRIS_VPU_BUS
>> +	&iris_vpu_bus_type,
>> +#endif
>>  };
> [Severity: High]
> Is it appropriate to add an artificial software bus created inside a single
> media driver to the system-level hardware interconnects list here?
>
> The iommu_buses array is generally intended for system-level hardware
> interconnects like PCI or Platform buses. Modifying the core framework to
> accommodate a vendor driver's private bus seems to couple subsystems together
> incorrectly.
>
> Additionally, because CONFIG_QCOM_IRIS_VPU_BUS is defined as a bool in the
> driver's Kconfig and registers its bus using a postcore_initcall, this forces
> the custom bus code into the core kernel binary even when the media driver is
> built as a loadable module, leading to kernel bloat and abusing core
> initialization levels.

iris-vpu-bus will be compiled along with kernel. This bus is used the external
loadable modules. So here bus is not an external module.

> Can generic solutions be used instead, such as using standard platform_device
> child nodes or creating a standardized context bus?

platform_device child nodes method is not accepted and got suggestion to create
a custom bus.

