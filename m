Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A4C3438BF
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 01:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788138706; cv=none; b=rUaaDPx9pR6yRPVT1vG2Mj+Mc8LpnZwFqMGeqsZuUVaP/3XwYVKlOYZkO1xAvB9g1DeDK9Sjl11X3p65ZxG5ci0F0T18WaTq5cSuWVxQ1ATIgNuAPFw6Zyho+eer/U/+BETxn47NzZqJvrSYn8jYk4VSp6PWjiRVdC3RX7UJcuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788138706; c=relaxed/simple;
	bh=7UmMN1K0B3ovALPeaoztcWuz5nL6IxnpQy7fd0Gu6kY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uPM2EBqIQrt3VagRked6fXwd+KZVE6LkAHngKspJ/xWrsyJwYnM7n9TEsF6I1fKrq3ynfPadIko+KY5qG5WqqB2Uc2hsV1U9M/Jd2pL231fQWDy9NfVn6u0Ww56V7FuU0sCWzNPiLQ0rdKFhgjIFDw+DBqe/E5djFLdjI/RVzac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DM5JVk7L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RBDLOy8t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DM5JVk7L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RBDLOy8t"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67UMg7NU1626103
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 01:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h1D1TQvrH8BzeCG32FmB1x7kyZWd14bC0HSgfQg4E1s=; b=DM5JVk7LnyHq9p2W
	Tm5JJ+hSCdSA3qaSqp8rgLOsaJBlVer55JY7zCvwSekbHRE1grZcYy0v9B5KTAPT
	GUrVGS+SRKjVAmhbWDOj3JmxJl3YWI1YuV07Lt2DQY6SMBXplN65xnLIZ8hlGsWp
	tfYNn9Cw+RBIx9mmQfK7VGWQnm28IGMo1Rn8BInb94JVu6NFwEG4dOxKCSaEQnaR
	/wqQRZv8v77sb3Lxw+wlFcRK3/yjeRk6MNusuJ3l78kRqcYi0P66jsaAPzpa6Rd8
	UqjFsPkJKHGVfcjfLYNu5mNCtAmNAZd/v+qWfxh3Vv56X4UtOURF0MtXeff3/MP8
	ciCk1Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqe2c2ux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 01:11:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f5ac7416eso3957774a91.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 30 Aug 2026 18:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788138703; x=1788743503; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1D1TQvrH8BzeCG32FmB1x7kyZWd14bC0HSgfQg4E1s=;
        b=RBDLOy8tD+dyCukYDxyQtDW/bWafBYk7YMXjUYRO5hPv3eaxOLYZQKjVSl+80tXxql
         Y/qAH0XKLHshtsgs6b+Hv+O7Cc16FEKsbeCHaF/6PCrnKBj1q4gTuURL3BWJwYMSveP0
         iUh9iv033SXw+RMFpAcUshuPrCf+np0hQc+GBL/COWzFpECLUbco9OCsbp/MqjhtkzkS
         WEPq5RBvdHh2xrOsGZof174R0FpJlniWhTVgi9+A2BI4P3kKsGVhJp9dEFoXYxPWcJ17
         TctRkl10y8oUEeMEm6gaos8OqqzAqK+ewpUUXsh+8qUJlG3tSJC++CbE10LJs2XUwTIE
         +ZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788138703; x=1788743503;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1D1TQvrH8BzeCG32FmB1x7kyZWd14bC0HSgfQg4E1s=;
        b=m05MtFOW8Wa5xLiOlMDQWKH6wyWGIuWST7wqsIqddH2Io4bP+mDrtVqCiGA/ck8FHl
         MC1E6ldzDYrlEjp1yp7IRTjHjf2erDSLK3LywhWJ7gHZfTgoe4RO2JuTEOkMXmcHFRky
         wqvR3wQyZx6R7G/SHB8QRgrx/9aeiIIp2Z8pru3oYkYxhB0oH8kwIMJL0vbhbBTYd7GR
         1qEtvJ9jXMLeVmKhAbNHTunBZ4tghVZawIlh+II98K3ejp/oVfR9POSp+Dm3Ovj9asmy
         QGYrAISszX2vbtECdbXkwuJYtCV/FJnh0SKeWnMaGX1jTfQt+MsarVD2XGLV1qcgPuxI
         w74A==
X-Gm-Message-State: AFuF++mPc7SBnlWFj6vIcP3ntaNNjRBNBgAPEJnTDG8JT/HLpTNK4cVN
	mkeO+2bV85+iBs95tVI7MxmSj8l9Xv0YTEunI8FwwdCjWLEbCWCT8LUyd68bWeSqMpdkDcsycY4
	V0KNAro3FyG8O08sgphRe4Eek9gr26KQlYFxcVh5YqAJ/rMw4ECq2sCkLs+tm5XUUWHmn3faEOZ
	cpItbsQQ==
X-Gm-Gg: AYBFou0fnAwMNg7VIkIi9CObIfkT6NJyateHH0oSeCZGBE+lSFRTxxMBJwov2zBbR0E
	7voYcH+UOgrrNadxeW0v7ZeK9acMvOXADiczXsgtspaLT9MHgrzP88u4URWO7f7I8P76o0pqpZH
	x8Ptv8Yeb4nxfkYKHF3PrMLcRMP7f7CfLfL7tcg+tywcuHdHkR3wOQaCHsPv5ZgfooOqU1VXIT2
	waAN7smTkCVdqJXi2Tk4y+jxG7/yBY97RI7XNcqMRjeO2mYV/luu6Kzx9CMyQNZaFDcnO9qqO8U
	KTFX5UNzUMVjNanAhSvtt0ONdBUJYGPPFvj12Ypal7lrD4fSBTdODvjX2ToojHJlZaf78hVIspP
	EjtHayIH2rfKAW+jfbbidHP4VkU1RshBy80xXMNYyZ7s+lGeXNAgW17TrV/HZl2urss5Omw==
X-Received: by 2002:a17:90b:17c7:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-396d0fc1b2fmr34041148a91.16.1788138703178;
        Sun, 30 Aug 2026 18:11:43 -0700 (PDT)
X-Received: by 2002:a17:90b:17c7:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-396d0fc1b2fmr34041100a91.16.1788138702705;
        Sun, 30 Aug 2026 18:11:42 -0700 (PDT)
Received: from [10.133.33.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7eb6bsm14314442a91.8.2026.08.30.18.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 18:11:42 -0700 (PDT)
Message-ID: <e714caa4-26d5-4c41-9f43-9e9f71e63612@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 09:11:40 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC haptics
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
        linux-input@vger.kernel.org, robh@kernel.org
References: <20260828-qcom-spmi-haptics-v7-0-0367b3ac2e1e@oss.qualcomm.com>
 <20260828-qcom-spmi-haptics-v7-1-0367b3ac2e1e@oss.qualcomm.com>
 <20260828095932.EF7541F000E9@smtp.kernel.org>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <20260828095932.EF7541F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Iskutr/g c=1 sm=1 tr=0 ts=6a94d4d0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=skNwuv_u4mlSdyqJbrIA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Hz2gsGf57_aL2HXddZ0pYaTFdT6Ds7zy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAwOCBTYWx0ZWRfX05BtvnO5VheQ
 A92mVXhL4Ime4xwsc0iwgaEIfFPhR3y2u6dAG+n8y3ULM4tfozzRuP8uLhVQ98QszQrGs1wCyFP
 8XuNxogjFO99Gj+GBTypNr1+vYOqeulfkZQwAwKH/5hzKL6ylIFTzpsMR6Q6eTyCOCeOncWwdwA
 L3m/wCXptuqA4OGrxG49PnKiyeyP094Vts8MjLNA0YwogA6KV58k8a1npfRndtsj9XbzW/xzypq
 yUjMDshZRGAY/fiiQbucWELTXhclkkvbIoE0D3QdBp8gxn/9jYBo+WZh2Y9I0ul444B1fUGsQjB
 vbJUIgglZbx1VzH0dLKo1LEPhcUb5V61Ga8E2wISXoHNrNXKZgj6nM2jj+6ULvPBSgtejZ1zX7c
 dzjPcuRiqgyqH3xoaeMFF2DwgD1NRQZ9+egVZ8XlLcVVYEKORc5CYpDTlGZqKzFBVSibuVAC2D7
 xVbF00KcUXkopvrOQWQ==
X-Proofpoint-ORIG-GUID: Hz2gsGf57_aL2HXddZ0pYaTFdT6Ds7zy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAwOCBTYWx0ZWRfX7N5WpAQXsvHn
 SBPk3zbO4bRMq+317AuJ/ZGhPMaYYABV8fgNt2y4l10L7IbnZ4WBXF4xk5K+6OHRaLGdeTYRojB
 M11jBlpcUbHgW3oJJ76Vyc76AD1KQjM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-30_07,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310008



On 8/28/2026 5:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The new `haptics` device tree node will cause validation failures because it is not permitted by its parent MFD schema.
> --
> 
> commit 69b46ca6dd857a336fadfc81c3a26d260c9c10ea
> Author: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> 
> dt-bindings: input: Add Qualcomm SPMI PMIC haptics
> 
> Add binding document for the haptics module inside Qualcomm PMIC PMIH0108.
> 
>> diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
>> new file mode 100644
>> index 0000000000000..ce2c9e893a0d7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
> 
> [ ... ]
> 
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/spmi/spmi.h>
>> +
>> +    pmic@7 {
>> +        compatible = "qcom,pmih0108", "qcom,spmi-pmic";
>> +        reg = <0x7 SPMI_USID>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        haptics@f000 {
>> +            compatible = "qcom,pmih0108-haptics", "qcom,spmi-haptics";
> 
> [Severity: Low]
> Will the haptics child node cause device tree validation failures against the
> parent MFD schema?
> 
> The parent schema for qcom,spmi-pmic enforces additionalProperties: false,
> but it does not define a patternProperties regular expression that permits
> a haptics node. Running dt_binding_check or dtbs_check on this example, or
> any actual device tree using this node under the SPMI PMIC, will fail
> validation.

The change which adds haptics child node in MFD qcom,spmi-pmic schema
has been applied here:

https://lore.kernel.org/linux-input/178602255123.2917765.7426706813083510078.b4-ty@b4/

> 

