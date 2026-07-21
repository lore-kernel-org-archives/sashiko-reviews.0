Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431973EDE7C
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 06:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784614906; cv=none; b=FPvneq78ba0HlW5wFSE+qBsRTpOSFVvk3YmTVoxc/uNKFyhMc6zIddiKGq0ZfRUZXaKNyGn7LKD1QNyj5+S+tYBUgGN9v5N+8i48dI9NwhXnNCOQz1L7y1I9IH5kbhCgGPKOlZn/uVFW7EQ/X/EvSZUcJzyfiLRtZjbPqnPR/o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784614906; c=relaxed/simple;
	bh=Uxn58aySpAhdMQ6ah7BqnJsCZmhT2AihwvZJpamBVTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFAWGt1YsHaPD5gp6gaBkPa5dlLp8xTFM3epTjeKfspx0OlFhZgLo54erKhr8Sd1rGTAXOihcGkecc/nERc1IZg+Q6+SKSzdy16lQw5j9fajqJk2OV0cV9BflhsV59x0ygnXSSVhjtMqGU1lvef+lYsP2/h3Ic9VDT03DIZUSM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eJCrsFOD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYJ/IUer; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eJCrsFOD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYJ/IUer"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6KEZF3884164
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 06:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nK2E8OyvdqxAm16nc66xTl8OYcZkCGcWgPhwWc7zC4w=; b=eJCrsFODEXjORwKi
	yQBwH0vukiKkMmKcEozMrSZ6gsfxmlVBOv0iBxjbFcHhrSOpQDZRbjRq80lQyTKl
	3pqdCoQNKNXnB6JHxM4CFReYaHdLmtA6/6WIdq+blVeV+q2lE3DeNeixvMO47Ucr
	uRyvNOi3oxPqAAwSHWkiYHcoe4/qHZ/N2VTiL3lDZR1jmDjsw5APFM5/KqmciZVW
	szFdEbrC3+ynOYDSjtvwZx12SF7ZvT+ySoSTKhVBfjOkQLZiej4vseroEyx2oQwu
	aEiVyjKwV3QU+6+4fxi9Wl2UuHcRsizRLeWxqAYqLG89miTyLueFdf3P2vdWYgVE
	c+NJHw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcaqbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 06:21:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so196008345ad.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 23:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784614903; x=1785219703; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nK2E8OyvdqxAm16nc66xTl8OYcZkCGcWgPhwWc7zC4w=;
        b=AYJ/IUer0P+sWlAD2PzRbA1iAosqkvzop14Rf/B1NQjlgFvRbjiT2VF0dYiWIJR2Jt
         24jYFUCnEB2+X1QrOhCxrZv+2pS+7835zo80tZqy2yD+opt/iAGgv07vDV7A++RlX2xq
         d2IdEXVb+tggOVYBYtPUGFK1sn73daqElsUqBV20QXzH1rm7QxL+DPhddFixpyObKu4x
         Xa2fR45z9anF8Lh6ONsDT9hd6AKU6oH7zegMHYGgxrmVy+vFwtQkyLvTZtPMnWXrAQ5F
         aX20M/xnZ9PVvn6oRgfQZJkQc1n2cMOj6SCETOwO8DmbRVpotb/Yx9ursBFcGSCBI1Jn
         njow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784614903; x=1785219703;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nK2E8OyvdqxAm16nc66xTl8OYcZkCGcWgPhwWc7zC4w=;
        b=eLW6rXdJsJkA9sWGrCvCWha7rW6jxl/bR9hmuIU+jXDr2o6Ly+umL23A1RPTgvxo3J
         rj34qL1VOwhTzXWYkO1MDSvekLawSxwfTBeOiJEciHxcLtgR4NIg8NppJsW0LWRxSX4I
         NZPAVec+bGXQekV/1oZiExA2u79VdFdfWuIXrJ6Hkbua5jlJjjHyFxtRyXhihenOflIM
         bsdKP/KHF9UdBxKq6T/7/wk/02vPCcWNw8fS+m7iaoX5Kl+YGXIFBuLCR7SpKgT9Idqz
         iahI9yY4YOEgBKP06X25Wm/pLTs8bfst6ufD9+gGP6zT4TfGOb1JI+ZY/gViCwIQnBLM
         x96A==
X-Gm-Message-State: AOJu0YytcczLzhmRYubGFF9cwBuPdrXnelEZcaQgUN8hRnDtRyTH1v3S
	LWlDuFSTqNMLp4Vkh9si69Ghp316acLYSpybAdtPcbB5hIzeLiNRte6DpEjHh7tH3mvxeYKq3nW
	sMs9tXzfN0FnH98vKbxCUL9pzGVb1jn9f+g6E3mVJuxdBAYNtUgTunBu7zTx3VtuVIPpHKT8X9F
	3puXI=
X-Gm-Gg: AR+sD12+8BcpjIpmoD/OLaEzmgaCG2p1TeWFmcir3V4YdTLUTcoGIbkiTXREQChBVzc
	QcrfZheqWTzlUhISeRFq00I4/HyDCQf4ziO28634Ey+3vNwQd8D7wfKcZE1Fnkm8hbvYSz8CLyp
	XtYKAV566KQu0I/U0u3vB57By8uQgKm7KBv2kcIUEQATcvkOSyWC+9jDAkXXOP/fecSFywZzn/3
	RXvTYW5M5c+LnHxdE7BQVfASHu243aPJHK9Qe48UlJYSysSXw/c2zF09gHN2zx80CzMizsMZlHv
	HAjGHCIvUzuBJ80FXDKD+y5g01grf+EsnU8aTIAETxPFa+1RT0h1sEqm1eV/mk4REMyA1LjJtNC
	BYFQY8R3t0wCy/rvSshHwvCb4mbSFmRw=
X-Received: by 2002:a17:902:f693:b0:2cf:7f6b:8c8a with SMTP id d9443c01a7336-2cf7f6b8e8emr25843815ad.30.1784614902921;
        Mon, 20 Jul 2026 23:21:42 -0700 (PDT)
X-Received: by 2002:a17:902:f693:b0:2cf:7f6b:8c8a with SMTP id d9443c01a7336-2cf7f6b8e8emr25843495ad.30.1784614902268;
        Mon, 20 Jul 2026 23:21:42 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448d9b0sm69347495ad.13.2026.07.20.23.21.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 23:21:41 -0700 (PDT)
Message-ID: <b102a471-7860-460f-aeeb-702270e6ffd6@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 11:51:38 +0530
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra CQ2390M SoM platform
To: sashiko-reviews@lists.linux.dev,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260715-shikra_adc_support-v4-0-5e07b6d21429@oss.qualcomm.com>
 <20260715-shikra_adc_support-v4-3-5e07b6d21429@oss.qualcomm.com>
 <20260715075531.75E061F000E9@smtp.kernel.org>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <20260715075531.75E061F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA2NCBTYWx0ZWRfX2udPtya2OEQm
 okjUvAkA+x+UVY1MHK7qTS2FriMylgNYX1GgH25ZccKNtZ450J2+4ofm38YjY4+XvYlJsAyiggX
 /UQJ2caoQdvGtKSp/rTalfz+5CoP0X0=
X-Proofpoint-GUID: AayrToHnjakiMSiDtDDbtzRPMOhP-I8R
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f0ff8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-4L_Sy8ICBWNds7pXkcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: AayrToHnjakiMSiDtDDbtzRPMOhP-I8R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA2NCBTYWx0ZWRfX2I8eyqJYj/Qq
 Ic48RLijF0HB1I4igowPp9rkFjSbFyQs6aG+xt0qZP+Kf0KTgmUbQHfPRthBiH10FpC+nhWF/kA
 qanlnzLr9fWRhN99TMlXy8HuQAfWbztULuGRoz+hcbxhAGDYqhrCdcJALBRAiZ8YWGxP2NXjfNm
 mdf0aTTkmeD9fXhY+jBYZEeSZJuou+Ov+QCsu8Rvy7VDM8lKRZGq8vE+3LVXQKNaZ2scY923Iu2
 QYxMYKzboabU+FW5Z7rLrHRJwzo+drf6TM9WpQ5w8u2aKNZ/yx/riy/GXfn3vVxeGfmkQektRRq
 C54ShyVPzA5eTtaccb4m1kk254vLeo8qsV7+iTKHcrnh9oXqYJcrVIAkSXakbQkG9f7lAYP/vF2
 Rk3BTN8srfxFTSujwDLdVTANEQ2X0hyAdrJRIzmPBaAMi/+Kxy5xxNC4/e1RMRBmFagLc6fcaR1
 DVDamBeN9hlwhh04xzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1011 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210064



On 7/15/2026 1:25 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Missing `polling-delay` in thermal zones using `generic-adc-thermal` renders thermal mitigation non-functional.
> - [Medium] Mismatch between ADC channel definitions and pinctrl configurations causes bogus sensor readings.
> --
> 
> --- Patch [3]: [PATCH v4 3/4] arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform ---
> commit 0bee643f0fa64e35671928d7a4baae1362c3d049
> Author: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> arm64: dts: qcom: Add PMIC thermal support for Shikra CQ2390M SoM platform
> 
> This commit adds ADC channels for pa, quiet, and msm thermistors along with
> their ADC thermal bridge nodes. It also configures thermal zones for PMIC
> thermal mitigation on the Shikra CQ2390M SoM platform.
> 
>> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> index dc3861489f64d..139d0ad0b1ab2 100644
>> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
> 
> [ ... ]
> 
>> +	thermal-zones {
>> +		sys-1-thermal {
>> +			polling-delay-passive = <2000>;
>> +			thermal-sensors = <&pa_therm_bridge>;
> 
> [Severity: High]
> Does this thermal zone require a polling-delay property to function correctly?
> 
> The generic-adc-thermal driver relies entirely on software polling by the
> thermal core since it doesn't support hardware temperature interrupts. Because
> the trips defined below are only "hot" and not for passive cooling, passive
> cooling is never engaged.
> 
> Without a polling-delay property, the core defaults to 0 and might never
> schedule the delayed work to read the ADC, effectively disabling thermal
> mitigation.

When we enable the cooling-map for this zone, we will add polling-delay 
as well.

> 
>> +
>> +			trips {
>> +				active-config0 {
>> +					temperature = <80000>;
>> +					hysteresis = <2000>;
>> +					type = "hot";
>> +				};
>> +			};
>> +		};
> 
> [ ... ]
> 
>> +&pm4125_adc {
>> +	pinctrl-0 = <&pm4125_adc_gpio5_default>, <&pm4125_adc_gpio6_default>;
>> +	pinctrl-names = "default";
>> +
>> +	channel@4d {
>> +		reg = <ADC5_AMUX_THM1_100K_PU>;
>> +		label = "pa_therm";
> 
> [ ... ]
> 
>> +	channel@54 {
>> +		reg = <ADC5_GPIO3_100K_PU>;
>> +		label = "chgr_skin";
>> +		qcom,ratiometric;
>> +		qcom,hw-settle-time = <200>;
>> +		qcom,pre-scaling = <1 1>;
>> +	};
>> +
>> +	channel@55 {
>> +		reg = <ADC5_GPIO4_100K_PU>;
>> +		label = "gnss_therm";
> 
> [Severity: Medium]
> Is there a mismatch between the pinctrl configuration and the ADC channels
> being added here?
> 
> The pinctrl property for the ADC node configures gpio5 and gpio6 for ADC use,
> but these new channels are mapped to ADC5_GPIO3 and ADC5_GPIO4.
> 
> Will these channels read from unconfigured pins and produce incorrect
> temperature readings?
> 
>> +		qcom,ratiometric;
>> +		qcom,hw-settle-time = <200>;
>> +		qcom,pre-scaling = <1 1>;
>> +	};
>>   };
> 

