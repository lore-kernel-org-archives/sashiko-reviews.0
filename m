Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A0F379998
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 11:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785151405; cv=none; b=YePRu3NzT/b4Cyclqy7prntt+rM2/2qdADvThTEt1Ve+cOHu9BGk9qDTzjX5EmzXze9qQV7TyAsDZ45hc+KqEiDFbYCQ8M4IzjJbGAuftgrPHzIxRyL34n2qWVmb8FZMbDnY5pA41EelfPvZYBokIYPWkrJNRSlnw3QY+WbsUIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785151405; c=relaxed/simple;
	bh=fbu/+zj6aeh639hwEw1NBkjlAGIRRjC5FcHHwvgHRuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cTOW/Xwuo69uGav6gO3ElqgasVvcuqf75DTClPZBGZFiLubl8yeLJnkNw+cewv2ob1zf+e4FtyOeDIlcJirdq0xe3dxaKZryo2aBoettBLBF7KM1CMo8QUq11L466/jnlFSDSpddkZgrnyDLmTyf3V1bplLtYSfEdoTgU/K+ImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TbZNQVMC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htYB1KUe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TbZNQVMC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htYB1KUe"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RAMR1c3594231
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 11:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWxpiBo0wahqWwPFynrwdza53qUPfJscdYXk+WaBue8=; b=TbZNQVMCIQEKb6mT
	zMedew595zz4zkNSOJbprFPN2+tBWaO8Lb4HBUwx2Hr2YqTHTEvHrG2wupFm+vg5
	+FOipmCjSOjN8yj8dzHCv2LN6w7kLI7A02zJAWfl1OjaVBvbDtrHGmYWMeR+PH03
	f5Jtw8R3uMToWWm4v59SjcpnY8nIcukb2kTZ383aznsUMQZMTz06MMd93+lnaGXs
	ShKugyAtBP1Bh5w9vrMmAfiewqSxpV3fYeJpJQh/KG9vo4qS/N9Fpsf38l5Gbs6z
	79IAb2HUuYV8staP+oA0b1VNg8USa7vrfxT6No6J4W1r23k0jSZGbLHsg2TGOzS7
	nhRZZg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mq0f13-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 11:23:21 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so4449254b3a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 04:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785151400; x=1785756200; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vWxpiBo0wahqWwPFynrwdza53qUPfJscdYXk+WaBue8=;
        b=htYB1KUeM0pfgOBr8qK4bA5cYWAHl47l0e/5QqlZQjQTG1NA0t/RG20PgORcdwFASc
         PPfJc0ueWEEeJYqd5if2NcTlpZn2DtxR4Kc1V0pzmHMP81po5AFYbG7bNZcxLIqXXefw
         a2Czk53x4A81/k9BZTqgLBSXZG+MFmwEPwGYBC1CZMPWGtxC2VV1Ob068GxpDsEwvfYm
         azJrk32BjhND5Dr4psUxy+gYgjcRLTcYsNrx57aAZTExVbLWsIrJj0USRT89o5nqAqU6
         d6J0eECg5zxR48zOPf1przspWb7pELXIgIkqpPOCWBTZ/o3subd1i69PujBHtH8sdrAi
         HD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785151400; x=1785756200;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vWxpiBo0wahqWwPFynrwdza53qUPfJscdYXk+WaBue8=;
        b=deC0LC9+jeKT+xhsAJx3Vv7HBfl+6WUGhmEBVvmFkPGmB+mozItuH2weyf2FPG1EVh
         +/MH6RQiY+Zz4qPNjeJaxWD1ijnUt+CVWlLZLxU+fg7216qyLCI1Vd5KaxNsVqJYWB7o
         0OkAIFwsA7e7BSDUdav7/mNizelNZVR059lJ1UVSJdogThYT1+V66lE/Hb5Do0lhD02F
         lUVcROv0ZELYtnsUzvtR+ew9UeeCj9Xy78tDOKqpfnEWvcaVYOHXLaEocdyDSQrO2Q+F
         fx9o8REdeMil6TBzU6GQ75YnPrQPtvtCSQCUz9r2VBMj4jb4Ep3Dpw0wo5VIz+0GzW6E
         gyrA==
X-Gm-Message-State: AOJu0Yz0K7/XKZS7gfCHY/CPFSlIEas0fRF3xAuBNp/Dz5ZTmjnHJFKv
	KQe0o4QidzSPqSg1sCOA0itr0Ubd+N1A8stN/sQ1BO9zCvLUOBZ2bn/cflNrS5C8Em3/I24QWXV
	tM3chbGQqTI5qAt1odEZ/4j9Ri/13HMb3gm0HZV4XpZbvtamzBYKewOgW2JFNoslB+CwkWUFBon
	Hs3s0=
X-Gm-Gg: AR+sD11T6J3oJJJ/Tg+bTLBtBFSlM9W1yMSHn1h7OaghjKtI9vlwOZSukseCeJz4RKn
	aGgyq9FX+HXPeNXlrRREm/rXLQHD21fCVHw1P1+rPzKveHM89eUaW09/N3BbPWXAh+1S3u2BotQ
	YbR8IToHSacYoyhywUyy34WiSm6SmsYd5ot9Qen/2F6ny+xYpYiDAa7TsI5edpYaK4GTg3gOXEn
	h39FMHlez6pxpFRD9h+369D+CY0143ZDh8yDOjOpa5LsDRdMjze1DBHkqzJsHX4lkYWP+S2QZXS
	+9Is3/voP30KwxCbvudmveiKio/7MHYkko0yJItdXCT7ydOR2KRymt2QhbdG/UG2fdWVebogSHR
	eOwLgUG89JP1wV3NoAaJl4U11UflzDmjalO2sCOnYEdga6NO2RQMg6DKlkfY8qS4/zEvH6dmam6
	nmALBCBId103Py6HL835ZnJ1SQ+lU=
X-Received: by 2002:a05:6a00:4307:b0:848:5010:ad3a with SMTP id d2e1a72fcca58-84e5958a8eemr6554548b3a.58.1785151400021;
        Mon, 27 Jul 2026 04:23:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:4307:b0:848:5010:ad3a with SMTP id d2e1a72fcca58-84e5958a8eemr6554527b3a.58.1785151399508;
        Mon, 27 Jul 2026 04:23:19 -0700 (PDT)
Received: from [10.149.81.110] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e533cb54dsm2880228b3a.31.2026.07.27.04.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 04:23:19 -0700 (PDT)
Message-ID: <aba21143-2dbf-4f1b-b504-7c03c1618603@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:53:16 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Add Kalambo CRD
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-3-a1069b5a2757@oss.qualcomm.com>
 <20260718121649.1714C1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260718121649.1714C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDExMSBTYWx0ZWRfX5s6ZtjdVhLWD
 yb7vggkxDva11zgHnoCr0TPgsVYBZR9ypSY9V/Vo+nRPS2fOZ1vGqE04OV75icZ8M3hSGgG6D9N
 gvbbs3hFUYcsqoe41nHQ45mwiOwLv9E=
X-Proofpoint-ORIG-GUID: TyUg5inrg5noNXI0376BvvcRAL91BzLk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDExMSBTYWx0ZWRfX3sSdyn6icd8Z
 KIEe567m5TtXzKKX5BEw/vibMKYCF+rQadDogGSBvGXnWxhdrdid5keH1N4yoAPDg0SigeDH//w
 wuNHRd1Xy1xMIwlX/HR9e6HxntxVKZh26+rTuutt1L/DlpkVmh6bccqViGUmfR50tKON3LG83By
 8ulE/mzYyt1eS6RQlxXI5wmGJ1LzN6TSCJO0KXevwYTB6mfE2zRXc51w2Iodi0jyVmZTH5Q+QkO
 uIrCx1tP0F0NRJnMKwcM8ALaC4fqhUQJamOndZoiyiLmLuQxAHrDmWjyvAB0PuJQHWEwtxWNNf+
 owNsslzVlSQkLKZ86qIZY0YE6c/nCoci1zPDGfjbfPjXmMEIV8pOA0gKWSKEWNlumJzH0pTa32q
 zYvrK2tszLlSKC3rH0EtIs+Kc2F3W9Idzb0/uw+EiUyVDgg6TMNJz9QYdnhtmrWAbnP0+kXooAd
 t2CCJMwndOeQRvWYCUw==
X-Proofpoint-GUID: TyUg5inrg5noNXI0376BvvcRAL91BzLk
X-Authority-Analysis: v=2.4 cv=TemmcxQh c=1 sm=1 tr=0 ts=6a673fa9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Mn405PmejxS87doCboMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1011 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270111



On 7/18/2026 5:46 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The device tree leaves orphaned nodes for the physically absent PMIC 'D', leading to invalid SPMI device probing and thermal zone registration.
> --
> 
> --- Patch [3]: [PATCH 3/5] arm64: dts: qcom: Add Kalambo CRD ---
> commit aaa6e566ef6b80e52c726e5cb734189e7e8ad2a3
> Author: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add Kalambo CRD
> 
> Introduce support for the CRD based on the Qualcomm Kalambo SoC.
> It reuses the common CRD board description and drops the PMIC nodes
> not present on this design.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/kalambo-crd.dts b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
>> new file mode 100644
>> index 0000000000000..b4441807f4602
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/kalambo-crd.dts
>> @@ -0,0 +1,21 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "kalambo.dtsi"
>> +#include "glymur-crd.dtsi"
>> +
>> +/delete-node/ &pmcx0102_d_e0;
>> +/delete-node/ &pmcx0102_d0_thermal;
> 
> [Severity: Medium]
> Are the deletions for the SPMI bus 1 endpoint and its thermal zone missing
> here?
> 
> This drops the SPMI bus 0 endpoint for PMIC D, but seems to leave the bus 1
> endpoint (&pmcx0102_d_e1) and its thermal zone (&pmcx0102_d1_thermal) active.
> Since the PMIC is physically absent, attempting to probe the orphaned bus 1
> device and poll the absent thermal sensor can cause SPMI bus timeouts,
> deferred probes, and log spam from the thermal framework.
> 
> Should &pmcx0102_d_e1 and &pmcx0102_d1_thermal also be deleted in this block?
> 

No, these deletes are not missing.

Kalambo CRD keeps the PMIC D bus 1 endpoint. This was checked against
the schematics and also verified on the running target:

   # cat /sys/bus/spmi/devices/1-03/uevent
   DRIVER=pmic-spmi
   OF_NAME=pmic
   OF_FULLNAME=/soc@0/arbiter@c400000/spmi@c437000/pmic@3
   OF_COMPATIBLE_0=qcom,pmcx0102
   OF_COMPATIBLE_1=qcom,spmi-pmic

   # grep -H . /sys/class/thermal/thermal_zone*/type | grep 'pmcx0102-d1'
   /sys/class/thermal/thermal_zone74/type:pmcx0102-d1-thermal

So &pmcx0102_d_e1 and &pmcx0102_d1_thermal are valid on Kalambo CRD and
should remain enabled. Only &pmcx0102_d_e0 and &pmcx0102_d0_thermal are
deleted.

Thanks,
Gopikrishna
