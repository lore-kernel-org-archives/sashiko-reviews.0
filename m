Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3234C6F1C
	for <sashiko-reviews@lists.linux.dev>; Thu,  2 Jul 2026 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782986357; cv=none; b=R5VIDGw7dIOxa8ZgaZ7lwWksCYDH5+iJNcdkviw5TW6jLvYAcoEtbrl80qpC0u//fzoFPoszQqcvRIYZ7weEpeDEGafeGpwKImJGsJgmFP3oG2PgLOdXX1+r3+8avl4HKHSDJHjYaEWUzAXYL08ZJkDDynUbJx9OhXAO/6mxWAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782986357; c=relaxed/simple;
	bh=jmb+q4LjwLPufvDH9/3E+N6kYV9SVCkTvqQ3sbohNHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0rbn8AHEHh5hRsufema9gkuc+tBikBrGaaTitHHwzuIqkSJX08rRZclcw3AK+q22KIMDn3e2vJmayRLurqsRHJNuxSZF/w9Cj46lEihrt93TC52pLx9vMdLkBF5AY88vO77KIPyCnB4sDnoCn7Ra/yzswaDRngU0PmoKZxjyq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VQCwzO12; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i16Jz7Qe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VQCwzO12";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i16Jz7Qe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KPeO4115627
	for <sashiko-reviews@lists.linux.dev>; Thu, 2 Jul 2026 09:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5nL/rNcQHZd91kva335i8FIWuDnFWjipBa3t4Wt/gio=; b=VQCwzO121TuMAd54
	sSwlCB3QU1ZqROvmirrDIgHrcMB7OiYreq1qcIohxFFyWt4LXgVR0vftN55VfVlh
	ENmtiqpBRYzfEycul2C1ja4pynl8J+VxWxxRuSc6MDxpebgOILFs2DVReGOvdzbA
	IxRBijUCQnJ163QuxYbn0owJiTK3ijYwO8Yp0UTkaFgsLqtlug1+eTXBP2dvf/b7
	Go5vfkB4Z9ngoeOfdK+eftv9YvLlESjo9fURjzTAzdF3Yq0XwNemYgO+NjlDT/xg
	abGHYBT+pC/sOhMx7ahSgvoZkJUnAX+uY4IW/ugo+dkjG7BcJdod55xxcaV3bZ/p
	j01VhA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9404p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 09:59:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e55721a8cso178712985a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 02 Jul 2026 02:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782986351; x=1783591151; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5nL/rNcQHZd91kva335i8FIWuDnFWjipBa3t4Wt/gio=;
        b=i16Jz7QegZAGoNP2aNtKiNQ4rSmbwoi1rdImeHVX/OMvyX2emY9V7TdDl7avK4QJGE
         pCfVPFdf4TaT5atbjkbbqDwBCb6gAxmzoSn0hzvCL3KJAYkuOa8Gqnc8ucukExjxB3ry
         0f36bTh8sO66tIUIi7Sm6CprStkwuk7Ews5UnfhqJUO8DYSsm0SxiWpRMThT+Mp075PB
         k3TeB2r23P7vvIz/qZ3IIOyWvlvX+XPjbrcqIC7YjzSzPLBDetJNIRrababOJfbbM1aL
         eqhV/LA0eR2n3UD9A06LCFQUhjp6RCSinSbZb27L+zdB6Uba9pv9m9MFREjbTpq0Bdou
         RbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782986351; x=1783591151;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nL/rNcQHZd91kva335i8FIWuDnFWjipBa3t4Wt/gio=;
        b=pH+13QF4gtUPDKfcp8dWlsqDqnKm0KsjrOgJwZAgCR5xXjPKjcAknNMKKClHH5O0Bb
         hIChbTJBaP/4p2oiLEnnMTPZiSKYDHDX2hFJABxBMujf6AeAMvNDD6CenlUPIYpONYjI
         hIBsrUlBFJSkEZtARVw/0xLUvC0j7nWl26XnzaXTT56rv45vTqYE3cJLSluC33Gkhumj
         RVU+WbZ6gZ0s8sD6gbDixLVFxPbwiBdJqIE4xB2grwZWtnLTHyosg+S8lH5SHR39NacU
         PcAv7bw3INkB+eryW9L1Ktk0Y1UgQa5xURq/KMogLInTbpZEdlAsTFG5qRFZIZEAaTpT
         X6Rw==
X-Gm-Message-State: AOJu0YxX6yMzHWCFO0xwZomuXzA2UL0KwD4gCnUxTadBb4xJbFFBWw7a
	C4rdE3zq8seoWavlHKhX1XsCNJ7M0pRcavNqB0dSc9QwZbWkOkJZdq4YjrcSjoziWy6c4ZKpJbF
	PVRniWl+e/3+GDX8sLYmGgs/i6T/w2btrX1OlGPmyc/2JYmiib6WHEBScE0T9z1sEU8CL//oGOP
	jarz4=
X-Gm-Gg: AfdE7cnSUvTFbiJVy7DcESzVaPvza71LnNk1xSrZxUkHb/6CnViSgbBz8jAQEgEUfIZ
	CjzBtfoz699OZ/gN5C6buE+r5FPl+HdzDWhtB6rUk8zSyWlmReh1ZutQi8/NX2tv6k/vK7qymC/
	fVA+z+tItIZhh/ldHT+9G17zF1rTYAFYTkE3hRZBocV9I5SVG1xkEE9X0cJFDo8A7RV+ZnUXdt8
	G26I8gmRTw4phoYNL3FtjRmd0TSHLnGAw/eqXxJ9PAn9dU+mC9dQGoE2U1fF8bAG0Zb2yFhMGtq
	g0UlZVyHarzrpq4Ejd4jQveA5EnFOzSZwlAXlXUV3G4tHzf+KJInRP68nGIRstDJEDdMGs7EGwX
	bWa5I46aaaRiFPgdS3xuYeyI8AFPZdEmWTAl9Gi1S
X-Received: by 2002:a05:620a:46a1:b0:915:9fba:878f with SMTP id af79cd13be357-92e781d690bmr758800985a.5.1782986351101;
        Thu, 02 Jul 2026 02:59:11 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:915:9fba:878f with SMTP id af79cd13be357-92e781d690bmr758797585a.5.1782986350449;
        Thu, 02 Jul 2026 02:59:10 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477ddf0f310sm7269238f8f.31.2026.07.02.02.59.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:59:09 -0700 (PDT)
Message-ID: <01cafc67-adb4-4240-9c45-af835c4269e0@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:59:07 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/msm/hdmi_bridge: Simplify register bit updates
To: sashiko-reviews@lists.linux.dev,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org
References: <20260702-drm-msm-hdmi-cleanup-v2-0-a4a4f0e8895b@oss.qualcomm.com>
 <20260702-drm-msm-hdmi-cleanup-v2-1-a4a4f0e8895b@oss.qualcomm.com>
 <20260702094921.3DC7D1F00A3D@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260702094921.3DC7D1F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEwMyBTYWx0ZWRfX4dqXj3XghSCD
 wJXQ6Fjl8RmyW9nK3ZS+mBJmS1ZxveexYn94pYhtKTarMmbXBYXyf0KgMm1Z6rPQVTOs4+W6hOq
 s+yOFXUJKujYvww3oU/EKolxqAxJIOsSH+gJnfS6Ooeiop0Vn1H/kHfKl4sjI+z8Qm7HPKv//fm
 nMfQItkOyg2Dg6AVN5b4LXuPhvzdDFqwXZloG2WtMxMO93JWqNwEphYwXgJJ2NSZWIvDr0AKjzv
 T41uiazDuWBQ+ew4qrEpBYroFh69yd45hxE4i/4QhN4eTbUWFFK/chPTgy13m4bpKxVZ/Ly18m2
 WU6Ztl8onVGnPo/LdRmHnGbVArmF1aNqjH4EZqhjFO4LT5fDT3mkVFoYvqtJ4iFrqDNWuOVoINI
 hCScAorzUuPuybo04pRAArXd+LlviYi9X7S+4AUOxaWjnM5hZsUJnZbtroVp8hrpJgpaPw/npDF
 LrfWW1D/M6+YPdMQa3Q==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a463670 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZVebHPM84LVkS2BvH6IA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: kTMAIU4JojFZSyCqTomWPkULp-IpMqXs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEwMyBTYWx0ZWRfX/nfGJAvkx5iY
 axYqEto5n7suwaPFBQh6nNJTO1u93MPuJINkkd4PdSO/FdgQSEOH6ljI4XQi/u2rgqN1FhLGjZx
 W+BmIJqTrxG+VMFXWk96K0OImOq56jg=
X-Proofpoint-GUID: kTMAIU4JojFZSyCqTomWPkULp-IpMqXs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020103

On 02/07/2026 11:49, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] hdmi_update_bits() is incorrectly called with the update value as the mask argument for multi-bit fields, defeating the purpose of the API.
> --
> 
> commit 21923da02c72e54abf3a47df112e97f9d67ce903
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> drm/msm/hdmi_bridge: Simplify register bit updates
> 
> This commit introduces wrapper functions to simplify register updates by
> using read-apply-mask-write steps. It updates multiple infoframe setup
> functions to use these new helpers to prevent reading and writing to
> different registers.
> 
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> 
> [ ... ]
> 
>> @@ -231,11 +217,10 @@ static int msm_hdmi_bridge_write_spd_infoframe(struct drm_bridge *bridge,
>>  	for (i = 0; i < ARRAY_SIZE(buf); i++)
>>  		hdmi_write(hdmi, REG_HDMI_GENERIC1(i), buf[i]);
>>  
>> -	val = hdmi_read(hdmi, REG_HDMI_GEN_PKT_CTRL);
>> -	val |= HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
>> -		 HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
>> -		 HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
>> -	hdmi_write(hdmi, REG_HDMI_GEN_PKT_CTRL, val);
>> +	val = HDMI_GEN_PKT_CTRL_GENERIC1_SEND |
>> +	      HDMI_GEN_PKT_CTRL_GENERIC1_CONT |
>> +	      HDMI_GEN_PKT_CTRL_GENERIC1_LINE(SPD_IFRAME_LINE_NUMBER);
>> +	hdmi_update_bits(hdmi, REG_HDMI_GEN_PKT_CTRL, val, val);
> 
> [Severity: Low]
> Is val intended to be passed as the mask argument here?

Yes, just like old code did.

> 
> Because HDMI_GEN_PKT_CTRL_GENERIC1_LINE() generates a multi-bit field,
> passing the data value as the mask means any zero bits in the computed
> value will not be cleared from the register during the update.
> 
> This works in the current code because the register is cleared earlier
> in msm_hdmi_bridge_clear_spd_infoframe(), but does passing the data as
> the mask defeat the purpose of the hdmi_update_bits API?

The code is correct but I could make it more obvious or intentional by
using here in the mask HDMI_GEN_PKT_CTRL_GENERIC1_LINE__MASK.

OTOH, existing code is very simple and obvious, so not sure if worth.

Dmitry, you reviewed it, so let me know if I should change it to
dedicated mask following above tool review.

> 
> [ ... ]
> 


Best regards,
Krzysztof
