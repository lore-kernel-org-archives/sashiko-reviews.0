Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B802E326924
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 02:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787625572; cv=none; b=tYuS7Jz5TsPOxUH6PxJtseTeuNAniB6Rvnl5UTnc1Wo0ClIM+QFQImNJZHoWzifllT/xHeY12g27KgND5njUNbm6R8gzjEd8a+4Z4XifDjb1wimsi/gRHz4b+829UAj5mnTlARzjaKcGTvyJkqZTCQ5cnoWenR4dwYiei9Y8PGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787625572; c=relaxed/simple;
	bh=30xKD38o73VXa/hJ0JOvY2xHjIVXoiWOnOPEV1JWW2c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YV4o4kjFFiy3fjnWmy5NR090ogiBGWsoghRgTrQJVoNvHdBzxgPY5qT47rvM3avJx0vtIw3Fyw++mz9DhIOoYR+OCiw+az9HPX0S2xEksufASk5fnbor0ZALOL0quqE6jQUZseoPXmJENTLkT5or/5a6HtS/mGVp3hckyW5+eHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X3iG/7UK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V8MivCQz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X3iG/7UK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V8MivCQz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R4we120411
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 02:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqoeoOu+8PfjGTZBzhg+XakMcLe1cSmMdGUV9GViNyg=; b=X3iG/7UKzeiRBoaI
	VmGc2DyxCYAbbvzfXRLabwbVi7hdkpTr5t4X3iJN+Ha+D2LBOXEgTyo/d9egZWfg
	ktzK89fNSq+/1cJuT5Sw1di88WTsPCPOfVKs6O5LZ7uQKEED28Vvq9lkUfcO0lSF
	LmxjnNmnToVBhSm9/S2yuj5N3xcEvTMIIHHCjtrOAYT+ulNawIAw2upjzcYnDwtM
	ocDoNMFefuiNkZSHhsxGC03zL8aNP0lZx6TPmVeQgRjnrtngtbLA2Q3RnBezAUKV
	dOHIwfN5Ib6wfa9dQTIiRSu7ih1gXP06AfihyvOLO3DpQ6/E20L8GTbXxIDUVLXA
	z5cIRg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8t3dsr73-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 02:39:29 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso5947706a91.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 19:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787625568; x=1788230368; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kqoeoOu+8PfjGTZBzhg+XakMcLe1cSmMdGUV9GViNyg=;
        b=V8MivCQzQbxed006cSsQIWoHn1nEYVJy/NsEgV1rg/TCOAi1QTe+liwxEH4JZq/Wl0
         ND7IY98pOgwoL+eX/cdmypGo/OeT6ceLw2xr/pXGS3NsZE2edTyTXCkTXxbB3mosus/0
         vgAJYg6NGMc1J6WocKXFSY/DkSXjakdl+PufsAs3U7UiyY+lbN4g9XSPZ/PK8r8NONzH
         e3wCx8gYQyu7C2LWZ4pedNzj/8yvpi+EOqBJ2EoZcGXZkoaJJPiCw2Fer32OTRMJXTFA
         /jubi953Il3b+JXvdqTpFTm32adFmEIJ/Zzx8kyTE/yqu7bAyzzC1now9EFs0AUb6SuW
         yhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787625568; x=1788230368;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqoeoOu+8PfjGTZBzhg+XakMcLe1cSmMdGUV9GViNyg=;
        b=CaRfYWQd0MTtPzwAf4W+a0BuI2pSH1mdkPXH80E1ALjGmB/w1d+SdANnhha1/8E9lq
         /p3+i/j1+wsd86erGERvJrtpsRPdOe1HL5uXAtVMlXQuSgKrpKjKKKsotjAa0zqqe7ll
         H155CBny2S/KxzVczmfmh7Iaqjhh/62hAKrA18chcOAepgdi5fyZkHfoQZ9mxV+lEBga
         dHUphFTjijA0xVmHxiNCWinAdVT3jMTKtBC3jcWN36OvjmJBKkW6dfhJYZhKky0IAX+l
         2H7k87Xyewt3RxGTgwdXk2aAENtpqO5IyYpnd1+Y2mVd+srIRgBVTxRGNNjkMil7tg9V
         O74g==
X-Gm-Message-State: AFuF++nKxa06W6N1Mncp0x09eIUwgdfKEDWu/manNCCjGeUPGGcZAt7s
	bl68nTwBzCmBu74OqOdD+lH3OVA6+/ipDxKyS9ctiWbXYDhGclSlqs/dcytGP9dSFvZ7RJPKdCL
	vwENFM2m3yChFaxlVMjpwOnpSLHR3mRjq1X7iJDZwmwQ3xPWHOgxu+xqqn99bkqJdgDtokXAfz/
	8sm3o=
X-Gm-Gg: AR+sD115gN2nXUYqJ9f4klY+Av7hOToVlcjEA5MnHUtOntDIa+D5y54heNbnJiPbiyu
	VtcldScDvu8gQMRZtZtVr5lGm6xd/2BL0Gx7vIxXFf6gTGlccxjq7lC54bQz1KO2Cqrd8bLAhWh
	3Rzlk4zlnAwgTRsY1wG1AcJo1ZNzQ7Lmy3/zGQwo/Ix7pW/jp7y+wSwB2RaDShn5trgX1V3soll
	d4vrjOIUxViI/IamXAJgQOsiUWpVrHKZuZ7+XpEXgVjni5vZkOKTp7ewMuEvht2oph67CTCXTOG
	J+w42373fiKUJ+4q77ui12DL3OiR2LdtSY69hxQAWbjyZQh0wXsRkE/KGB8k+AkXyRUOKJUfs4d
	Sq9/WMWVSGlPRQjCVX0Cf1oCKDFAY76hUU0wxMyPgS6s0L8M/KPS1ySXZqjUnws8rPIxr
X-Received: by 2002:a17:90b:4b0a:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396462ff21fmr5422591a91.1.1787625568404;
        Mon, 24 Aug 2026 19:39:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4b0a:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-396462ff21fmr5422537a91.1.1787625567955;
        Mon, 24 Aug 2026 19:39:27 -0700 (PDT)
Received: from [10.133.33.69] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39646138f87sm1707105a91.3.2026.08.24.19.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 19:39:27 -0700 (PDT)
Message-ID: <d129ce45-0769-432c-bbc2-76e992325dee@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:39:24 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC haptics
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, linux-input@vger.kernel.org
References: <20260806-qcom-spmi-haptics-v6-0-19fcecd5204f@oss.qualcomm.com>
 <20260806-qcom-spmi-haptics-v6-1-19fcecd5204f@oss.qualcomm.com>
 <20260807062927.548EF1F000E9@smtp.kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260807062927.548EF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nz_YxOYE1vc_lAtV0junWeAeRIXp0I9C
X-Authority-Analysis: v=2.4 cv=OLAXGyaB c=1 sm=1 tr=0 ts=6a8d0061 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ED_tUBg3TPI6sqZwEIEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: nz_YxOYE1vc_lAtV0junWeAeRIXp0I9C
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyMCBTYWx0ZWRfXxXXc0xIj1P+Y
 DBwzRPm9MfasK0k6aD00/r1zQnQgnEfQJxT6zbP7V597I5CUgUllVOBuK3akDN5IzXlFsthnjkD
 BhDcqGNhr0vkYsBuM3PslpDaCmngyBM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyMCBTYWx0ZWRfX8niKdIXADBf4
 P4pQVkpdXgY4cYSrQ+a4A92yXLXshwLQVLAmKLFLu6q05gE5xMp2LvzXEfa0RnDYr4r7YDwMWXa
 vzF6HN2dW0vnEnkmMh4goUSaOvwFKJnh94KsAvUJPVsrVexwbBEtlpBKQOey4JKwYazKFgaQq3+
 YvXR7Zl0nfum1sVJLJPAsI/M5onHgZPxa4AyZBPpARkvmTm5ktgnk1eKc4tP1tqnKkcvXFfSyuU
 T6zJAunxZ4mLl1aZTKpCTPCKbYtzB1wAUuGYXUYBMOaqMiqgRHh+IPSmsYLa2YjeKlSlvESwe5d
 bECGM73jCwZbcoThgJO2IuPHmV8jJL9Q3VFQPrB+79UG4GNdY5R92DBWfwG31FxBKflfkCXAQUd
 wWS54OTgYzLxMkeR4aOp8Wxmo6hs+Xm5bCr/2lg/gCOnATjv+8MVeZ3Hb37aLVr5JdE99QaGzGa
 b63s7FxJJVfEXNnNPYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250020



On 8/7/2026 2:29 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Missing update to the parent PMIC schema `qcom,spmi-pmic.yaml` to allow the new `qcom,spmi-haptics` child node.
> --
> 
> --- Patch [1]: [PATCH v6 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC haptics ---
> commit eb446753c24c30e9b557074281da814e0e94aa51
> Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> dt-bindings: input: Add Qualcomm SPMI PMIC haptics
> 
> Adds a device tree binding document for the haptics module inside the
> Qualcomm PMIC PMIH0108, which drives a Linear Resonant Actuator (LRA) and
> supports multiple play modes.
> 
>> diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
>> new file mode 100644
>> index 0000000000000..b1a69e9886ee6
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
> 
> [ ... ]
> 
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    pmic {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        haptics@f000 {
>> +            compatible = "qcom,pmih0108-haptics", "qcom,spmi-haptics";
>> +            reg = <0xf000>, <0xf100>;
> 
> [Severity: Low]
> Does the parent PMIC schema (mfd/qcom,spmi-pmic.yaml) need to be updated to
> allow the new qcom,spmi-haptics child node shown in this example?
> 
> The parent PMIC schema has additionalProperties: false and explicitly lists
> allowed child node patterns in patternProperties. Since it does not include
> a pattern for ^haptics@[0-9a-f]+$, will device trees instantiating this
> haptics node fail dtbs_check validation?

The change which adds haptics child node in the spmi-pmic schema has
already been applied, so I dropped it in this series.

https://lore.kernel.org/linux-input/178602255123.2917765.7426706813083510078.b4-ty@b4/

> 
>> +            reg-names = "cfg", "ptn";
>> +            interrupts = <0x7 0xf0 0x1 IRQ_TYPE_EDGE_RISING>;
>> +            interrupt-names = "fifo-empty";
>> +
>> +            qcom,vmax-microvolt = <1300000>;
>> +            qcom,lra-period-us = <5880>;
>> +        };
>> +    };
> 

