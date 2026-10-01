Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658B0485504
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 06:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790835653; cv=none; b=LzyMW2OQvPUrDOKFjyY+SFGU6rRHO5UFl4ivTC/eN6l0AirGijptVjKRxjW6enV3fyWCe5bLtDgP9oxPeyWfejXH3FirT1gajB4OGVTBv6PrnhWyoqYCxBgu9xPBIPQfqzts7HtB48bgslhfJxjpQkFysSqOTHnlYAhgUAQ0YxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790835653; c=relaxed/simple;
	bh=iOwAsP8ps7n4B96WTbEdmqoobOdeSutrQrYZKlneRYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxiB8/OziKWiXkLOoSqrA/aJ/F8VGAUaJ1xF0BsqksQMrrQEZBzhIbQrVSVd6yfJRbAst/0HFTajmFUL4ceScPgW5xaZLa20hAUFCAgVE9XpnEwfUZxzgd/jqkoRXpQrVOoReuWTAOcXv5ipXl9SabQRnHC2gVVI7XmZrRKfaSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faG7x515; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmWCKYNn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="faG7x515";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmWCKYNn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gAAg866033
	for <sashiko-reviews@lists.linux.dev>; Thu, 1 Oct 2026 06:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EoL5Zq8dAWHB7YFnbRFE1n4oiWuxqDXZ03Ci1CauKnk=; b=faG7x515dHo3R6Vf
	8KitqwxL1PJ9HvA9/n4629QyhefQO0UlKuDEtvUXdBioZb1/87i+4bh+bItZaQYN
	F6P29hOpet4pZsgngVMcBEuplJPsGuXPc0phC1sH+2LQjE70Rw6PaAUsfVxNara7
	pD2remKAdRikY87HhWOBH7e+0NW161DMYKLLKIH6iKGAD9So3on2M4Y5ZjVB4ZXc
	/gRaLOlC7LJ17fWrmTlXzPLP1tFoz/9A4vbIXJTfep/A3uVgJE1naXP/1nivIFjs
	JLrnlf+heLrTTGUHflLEjPFAwMVlwCviXIotkwSh/1DjJ07HXGCMqKWlx7wEolig
	gLHa8A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjabyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 06:20:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3968bb86fb7so6146787a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 23:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790835650; x=1791440450; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoL5Zq8dAWHB7YFnbRFE1n4oiWuxqDXZ03Ci1CauKnk=;
        b=hmWCKYNnFDxR14wKyTjU4/mHIS1dTw7Imwi2bcTooVKCtXuEWOLHEfT4RyzACZc0l8
         og/lboinxjZQ0n88M9yGc+Gwrrda/GvUWSYo2gWFuxu36PfDhqo1xFd9EaglCdD4MHuw
         QG3VnnKhUQEbFtROR3QUTc9YikMimGPdpbpBhCHXphB2BoXCrjJ8qbep6YQKXyKW8nKC
         RaS+LtyKkKg8jkPWoTKTRbUq1G5rnNxwxnDXiL0EcaBf1mNyV1ik8jKi1XXl0IjfSqwa
         SHFG8StLNwaxBeuSDtgpMC4/bj60e+ExFEFN2JkQ6d3AMRbsayMO/ui3MSdKkQhJ7YWA
         ICAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790835650; x=1791440450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoL5Zq8dAWHB7YFnbRFE1n4oiWuxqDXZ03Ci1CauKnk=;
        b=rZQArDyP+2kXOqsRviRvoaP8Z712KGyLBMlIjLF+6ZvJgp4AOiEJ/GOkWTkhe+3F0x
         ZyWN2c/GOaY0sqMEP10co7kHRQryaFce0wAkq4DjFrQ8zp1yEuTXDRk7KCOdMLIbZQRk
         Dgzr0FhZlyptEuIocsdEqpxtFbHus0Ew+C5Ci//5MHahEBXcIX6BPglBxYgUR9gn9AoK
         Mr3O9itgG5UCoaEzPd77mB/J6QXJ8FVHpOUOkqYAajhzPnauQvAIFXcbMlsHuA66gZgB
         CNBE7Wo0pRkKoiJTYr1eUneNfqW4PzKQMnxgXiNWqOd3nVhDbvdamX+VtHQxvsXX8DD9
         jl5w==
X-Gm-Message-State: AFq9FYLbKn1aVGzYYpPN7NmJdCNYUcdDXwDh5tcRRaWkqc9ZYiFCx6IT
	XcRIkH96WNIQACVeO99eM1lDuCDJcocKLTelIV+TpHcRqyaX4F3Kr6CYKIVUasucJ2TMj6HQlbP
	XFQiKATEl+yiXZMhcUrJ1yBAgRybT6ezy5Wf2CtrNGzDw0LVW3eNUep8N8n8RJflokZ3A1PArVU
	5HLC4=
X-Gm-Gg: AYBFou2gyshpbTSZhqQwrLgozU+xmqAMU49HlnAAYF3aRSc3DnDr+EurIbklDLPK9wu
	DKXi+Upei7M2GRfqw51r8Hc0AXrIFW8c9Wfs9CIueoK4s9cYOkxs+914sJzwukJS0wv3fGn23R8
	MsCLdD6z0t1vxJaKYur5Lpqjo4Ln/NMWV5gJbz4lRxG8sOPVYwcxwV+nfvl54xHCXqrC/7yqLvK
	zqamPBZHusbLa3gXcFUj/1ellV6StEJoIQMQuQWZblmAKSZwy8qOmOUvU1/9pI6CvEQ+6eXMHx9
	Cn1D97wXiUIciGrS5BGapsGsz0RtmOAVwusvkeBhe0WKL/ljEDinLWfTx9JkdIN03Y8+cjXVNnL
	vaykYfW4713ja3nosOJQQ9mF4lNI=
X-Received: by 2002:a17:90b:4b0e:b0:3a0:d75c:239f with SMTP id 98e67ed59e1d1-3a4d1505448mr3202074a91.11.1790835650466;
        Wed, 30 Sep 2026 23:20:50 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0e:b0:3a0:d75c:239f with SMTP id 98e67ed59e1d1-3a4d1505448mr3202053a91.11.1790835649973;
        Wed, 30 Sep 2026 23:20:49 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f479dc9fsm2788610a91.15.2026.09.30.23.20.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 23:20:49 -0700 (PDT)
Message-ID: <6a685e0b-c198-49ff-8941-5017fdbd48c2@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 11:50:46 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: shikra: Add EL2 overlay for
 remoteproc SMMU mappings
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260930-shikra-el2-v2-0-f0822be5aaee@oss.qualcomm.com>
 <20260930-shikra-el2-v2-2-f0822be5aaee@oss.qualcomm.com>
 <20260930115553.C3CA71F000FF@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260930115553.C3CA71F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abdfbc3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xrLqKWkFl_EJ2zcK8ggA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ddpIDe5t_oQXQFFXDUgyTrcz2R-_4r8W
X-Proofpoint-ORIG-GUID: ddpIDe5t_oQXQFFXDUgyTrcz2R-_4r8W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyNSBTYWx0ZWRfX+QgvaCen5+JT
 Gp36Vc1ILJRe3T8D3t/LIFo2qsazzuTOapgdM/v2NBkNQZeQVXLutAS5rRmL9KFXXtHVY2udqTm
 SH6ySBwlgtnNGVXilc/2zLZ5RAiCgEQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyNSBTYWx0ZWRfXzgbeJWplrlco
 yf+v1cZtWaPpnk5u+fMsH2evXpC59m9QQX/Q2K6bGLxfx0cpiDvNUV+8pXU7eyrJtKVYzRPG6el
 n5lWiesv/2Qf6+IrTmf1ipmswqiYu7ESp6AJKw8E3cmgDENGJf353N3Rc6/+QdyUb/kkwglkB43
 ijFYB5us9jWMGaNvYp39om4KkJwk4vYVj++UIyMXYDvNxMhgM3gD83Uq+KrOw2bj8U0N4O52il4
 E2aRBt/5tSsk5IaSayvYSxrnj04KWYW7yyzUxrzZX3qXJ4v9YsRYXDGSC+PDdiOBnmA1jA4Nj1A
 vJfxAKCX0oag32was/h4280IJzcWvkETqtQeZPR5/lE178o72oKhyKbtYMZH/TwLGKufXmdskUd
 UMhgGCZ+r1MLoRJpclq0hb8DHzmUMdg73p5bNUcJ5lDU6yfnO5mYsjsgIwiJQLpN1oNOCVJRimV
 Ls/ARUMd1enTyz+nhVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010025

On 9/30/2026 5:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing EL2 targets for camera EVK variants
> - [Medium] Undocumented disablement of GPU zap shader in EL2 overlay
> --
>
> commit 07c9abdfac5fabfba8cfb72f094624db1d5cb41b
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: shikra: Add EL2 overlay for remoteproc SMMU mappings
>
> This commit introduces an EL2-specific DeviceTree overlay for Shikra boards.
> It explicitly configures the firmware IOMMU streams for remote processors,
> allowing Linux to boot directly at EL2 without a hypervisor.
>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 4e714251d5e6b..634914b8f229b 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
> [ ... ]
>> @@ -377,6 +388,7 @@ shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-ca
>>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
> [Severity: Medium]
> The commit message states the overlay is applied to "all Shikra EVK variants
> devices", but are we missing the EL2 targets for these camera variants?
>
> Without adding targets like shikra-cqm-evk-imx577-camera-el2-dtbs, the camera
> variants cannot be built or booted natively at EL2.

Camera variants have not yet been validated in EL2, so the corresponding 
*-el2-dtbs targets were not added.
We will add them in a follow-up change once EL2 validation is completed.

>> +
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
> [ ... ]
>
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-el2.dtso b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
>> new file mode 100644
>> index 0000000000000..d2f3186bd47db
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/shikra-el2.dtso
>> @@ -0,0 +1,23 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + *
>> + * Shikra specific modifications required to boot in EL2.
>> + */
>> +
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +&gpu_zap_shader {
>> +	status = "disabled";
>> +};
> [Severity: Medium]
> Is it intended to disable the GPU zap shader in this overlay without
> mentioning it in the commit message?
>
> The commit message only describes adding remoteproc SMMU mappings. While
> disabling the zap shader might be necessary for EL2 boot, this hardware
> feature disablement is currently an undocumented side effect.

Zap shader is not required in EL2, as Linux can perform GPU zap sequence 
on its own. Disabling it is intentional.

Thanks
Komal

