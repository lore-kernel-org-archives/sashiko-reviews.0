Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66AF4C9E0B
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 12:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771817; cv=none; b=ffNrUqY3eol9bAqfqIL4bS9WzlKYNIEJbZ823vSu+YNcuPaSARsU0x4d6VxBsmBurGhql6hDsCP8Ji2rvbYWa9+lmYO4L/8o29q+AOe6Mr9Ndxq+z3HakjBczVHg5H+7FfyNuVlsNOWvk2/O2wp1BqCq7c3zyU3kOXKCqi59gwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771817; c=relaxed/simple;
	bh=u3FP4394F5WeOzXMgeTc0izd67r1yUkSSChegsp9gSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pDbOI7/wX1ffEb6Xy6pzVBsRuy2eDMLjobqfyZvPKlzyI/xseQi+5u5Ty4Io0hY25blVd3nIA1nNKPOZUITEtZs880g6DyVFGqPGCYnDBEAbzFsirbU9gvseMBRQ22jFvwnOT2zP+AY1/DITN/uIpWGgzqAcz1yJn/B94B+m+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jp+OC0ff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dIsd7hN1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jp+OC0ff";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dIsd7hN1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7JWO3554799
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 12:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YR1pxcm93dXVjoCVwNe8cAwUkjwrpYKoF5JTMsrsvYY=; b=Jp+OC0ffgWmb05Ok
	DwUbVD9KvFLD9T8wCmeGszFRIvkgwyugnGTdMgN6n+LRmI/eNd6OjPtFZ8aS2Ek+
	/s5ebp9fDmYtbvxfWvbUpjEWGNo1n36FVwM5n/g8KCYkfF0J+Q+qYLQdpB/nQtNg
	Cf8EPmlfTqS6H9iKeqvI7gx7yb4+g4gqn7kQyMt8yrlBVGZiqeReYU/pSpjBnNAm
	bgn3+yqg31O25MKFTjuDICrMnkqDuGKnqVAHQQ+Bd0DvxgFZ26MZ31GTUJEn7buU
	AA/fkt2liss00X+yNA2DnXpYSzPUlIY8KelGr6AaHVTqcgH7LwOnMpWKy753w7eh
	XrakFw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h10bk8me2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 12:36:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1b6f65dacso3571414a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 05:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790771744; x=1791376544; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YR1pxcm93dXVjoCVwNe8cAwUkjwrpYKoF5JTMsrsvYY=;
        b=dIsd7hN169VCFb2fKIbQ1zu7vz0313ldygztOHXezatMglZpwhe+83SA81YBcjNxE+
         gZeovVANzKVVTxqA0p54w+A9wjbTMdwbMlOh6da0Yjlup4qv8KWNNnr275yEhbsMNc6D
         5xOSEkKDj2NSDmJDjUOcrT+J42mtCrcTf8H5/WoRMNAQOBhti7Ytic+aX1e2wqonM5ZE
         byRiUwmtqNl2rwMwlon7ONCbQC2eK/vQfhQyTLBPahEyiXFsspY4aoPo53GX/ju7hC6l
         ZHGcVIsllaolbcs9b4nVQlY6bz70NC9iYV57uxkLmPQ4y1ZrtuGOp+UgabA9Ph9t39Mg
         cVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771744; x=1791376544;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YR1pxcm93dXVjoCVwNe8cAwUkjwrpYKoF5JTMsrsvYY=;
        b=kW8SQcCROnfTl/cTiRdEGKvjGFM0Q1Km4Vy6DdMSmUj2Jj7sYSz6o/f0u7H7IyGh2C
         ch0r8kK6A2MPgzeZF5e3xbg0qURYIJIeKMPZ1nHLrOawrjaSb0Dn+RyidVe2Xa/Bf2Dg
         UPwfJuSv2TW8rNQSV86sY8B+HSH5ZSv9fQQBoq/ZFs+5RJg0ZQBF4//Hl5RiJTA89xdL
         LYUPI25GUh53A61epJeqhKQY4V4Gs52TdzWAJADrFvCPcsagUzcGG82/GOjWOHIPnC5o
         TWeZBcxlfB9MGyW/Uvs7SSpQu/UdiN5Pgc0dGHVAjBPGZUpnAyYUwJTzblxKY6rL3CTt
         Y4fQ==
X-Gm-Message-State: AFuF++lJIG7Of/rJA5TUPtTnsd8LNxT5FplcfEJUnfTrtxFQ9tUnuhFu
	cW6Hgz48MvUaET1BmnLVFZmJ4RcFQIVbJnbIrO4eBzQeA4WokZWJxS0J+phrX/x4e3i2Rt1zHc8
	AJou+coUQhGp0zG8jMnk++XRrTfZel1QBTgqqiZFI9PsTyk/o0kcb6R3EfjfPmafW2RGSCTvk5V
	JFlBU=
X-Gm-Gg: AYBFou3QwmjI3rPrOV3CkhIyTB8kUIWMBPPKGWs4Rt7vH2CK7wzLphms4Z5NqS07nY4
	OYGjC2E2ulrk9dXtQWZfmb5xWgFMgEkR7a+QqKVxQx89CItdN/m9jej8iCDxrQHpqmdaXAIlBDe
	VBs4TgpJAHaLeHKxbJ4WtjYuPuHHtlWSPLyatUnoX/3R0BdRyqxbkjeh7cWx0eOkYtnHxiFlCF9
	0GrxzgMROuwdV2sLp52+CYAOjoAIu86iY+eBIH1hP357DFWS6akhaG9qYZzfzHNqXl/lsWHLaG1
	W4Jid9L4i/qKyN4yEiRld1igxGbDeg3MNyfoo/IlJuRMeJbfIkqePX5DTYkM5PQiDq8YoGJGgA3
	jsNLWgxnMH8GlQtlODTqbu1I/TBI=
X-Received: by 2002:a05:6a00:4188:b0:871:aee:8b92 with SMTP id d2e1a72fcca58-8874a89aa56mr1031248b3a.15.1790771744322;
        Wed, 30 Sep 2026 05:35:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:4188:b0:871:aee:8b92 with SMTP id d2e1a72fcca58-8874a89aa56mr1031231b3a.15.1790771743825;
        Wed, 30 Sep 2026 05:35:43 -0700 (PDT)
Received: from [10.218.30.203] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-887bc2bd76asm114029b3a.48.2026.09.30.05.35.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 05:35:43 -0700 (PDT)
Message-ID: <ab83f7d1-7165-47f3-afcd-6574ef5d9238@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:05:40 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8750: Add watchdog node
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260929-sm8750-watchdog-v1-0-ea06d5dc7e54@oss.qualcomm.com>
 <20260929-sm8750-watchdog-v1-2-ea06d5dc7e54@oss.qualcomm.com>
 <20260929103912.C22291F00893@smtp.kernel.org>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260929103912.C22291F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: quynskh5IaunJYtXX7rKRfeB0fL5eJx_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX2B7v+t4RFtbo
 llBbxi4H7zt7TiXrqLb54tyOHcXwBP21Hjjur6Wj/nK1RHdLmFLbxfWNHYPdmXMasi0IMm/6g0v
 MeflOFc/kJOhNao4orUgJuhTiBSd5efeukgHxPlhsfc9Fo6SKRRMDb2Cuv/SyDydWnaLUMcOfIU
 eiRp0NpZscHuztNNJT47KTyEZUkYKilOra5rmmHKzn72nJBa/U08FmageZ4xTp3RxUkVH3I3tRO
 31LR9ASSvGDjUVq856J1yxpIuSiq23z6dys0GxX4Ljx/ixbUhA+XyaIJzt1B/yDpu6dAXO6qLMu
 O8x/F+5NX/KEn0fTt2F7r+NOh6Wp0d4/VHvIMCJjNHcufKSB/NqkdH/IK10TQwZLoQkudpZELKj
 0mylk+kq1iXv4g4fGKa47o2Ys4/323tDuqK9As1Z8kCmigOI6yzYEzuqipjH9prAdvNKsk7T+cz
 r8ZWnx/vY5mdd0OyqnQ==
X-Authority-Analysis: v=2.4 cv=MZn5KJ/f c=1 sm=1 tr=0 ts=6abd0265 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=z0PHE49TrWTsZCah-ZsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX8C7M/5JqlbeM
 EvQfDZTcZGbFSCwfsETvZzCx9m/RUyEdQ9jDZ+gz+X5YMlYeLSAuruoP3JsjJGSvmDJEKzNFyvp
 uiJJjNrfzMuwtAxzG4kX614JbLWXKJs=
X-Proofpoint-ORIG-GUID: quynskh5IaunJYtXX7rKRfeB0fL5eJx_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300050

On 9/29/2026 4:09 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt: incorrect node ordering in sm8750.dtsi
> --
>
> commit 807aba78b66c219c014d5a42b4b7964dbeb6b207
> Author: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
>
> arm64: dts: qcom: sm8750: Add watchdog node
>      
> This commit adds a device tree node for the watchdog on the SM8750 SoC.
>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> index 8ed5fa4d24fcd..53125e5dc4cca 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
>> @@ -6006,6 +6006,13 @@ cpucp_mbox: mailbox@16430000 {
>>   			#mbox-cells = <1>;
>>   		};
>>   
>> +		watchdog@16410000 {
>> +			compatible = "qcom,apss-wdt-sm8750", "qcom,kpss-wdt";
>> +			reg = <0x0 0x16410000 0x0 0x1000>;
>> +			clocks = <&sleep_clk>;
>> +			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>> +		};
>> +
> [Severity: Low]
> Does this placement break the ascending unit-address order convention for
> Device Tree files?
>
> The new watchdog@16410000 node is being placed immediately after the
> mailbox@16430000 node. Should this node be moved above the mailbox node to
> keep the children sorted numerically by their unit address?

I missed that. I will fix the node ordering in next version.

Thanks
Komal

>
>>   		apps_rsc: rsc@16500000 {
>>   			compatible = "qcom,rpmh-rsc";
>>   			reg = <0x0 0x16500000 0x0 0x10000>,

