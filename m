Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CF94963C7
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 12:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784505; cv=none; b=eICD2YM4969Jo9OQwhoF/eZFklkW8eDXtIuxZOwsttnzgv2WISPpU0AowQBtUPIVXOwcXdD0ei7PJW1hos9e/egKaFlsOXl0wAP3FllmBv85WL+ZISFkygIiFUAromQomCp5F+Kywrt3ATuLtuj9CMNJhqSTN3Lt7mzO4A2kG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784505; c=relaxed/simple;
	bh=WBHrSTQ++EBmgNGA/9tpbMeWFhdN/4x6saXzLgPldSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6o9kw7IyU5hux35Bel4n8Gt+jnX2CoueZpVQDqqQ/Lwgk0M373hdfYm1FV2u5OgjdUGGwY49xPbp1LXVMR7SmJ2g+hU4+EHwbc2mhAq5xgQRyH0GEj7mBEn8NmtYogLLDj37ezz3zt8olke5ilS4lOylivFY/7mBkP5gTfqsX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRgkmdzr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MB5tnCAP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRgkmdzr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MB5tnCAP"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnAF74064246
	for <sashiko-reviews@lists.linux.dev>; Mon, 7 Sep 2026 12:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nRove3eF2CgDkgkhUEbbyBJwjMDlcAT0c8FXFh1iM4g=; b=QRgkmdzrNVdnI69T
	PKrlNWYQxgUMX2mQRQSdOk3967Omd3V8BVHOMkmjs9cTTI80MKneRVXWcXKrq8ye
	mycdtMz3FTmTgrx5fIOmGa+b5je8xkXuI7p4goU02EONZZsAc/H84jrH182RxuTK
	a10JW1sdvgPFW/6f6GCGRtqzepHYf7gTgKAJcE+VRPwtCUV3CsaNlPFOlMvN+/bz
	cw9UY8jgq+YwlJpKBPvsNP1n1P9LHadyCJrKB/wcGrwsLIXyT+2ipcTiYUWZZNgd
	pjVTwhF36h6/ZpOiHAGauosrDSqbt0bIVOyGG+81AY8Yg68Oa7kgpgFdhyZfd6ZM
	FBRXRA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghs86s6ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 12:35:01 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9806756ea40so2210732241.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 05:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788784501; x=1789389301; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRove3eF2CgDkgkhUEbbyBJwjMDlcAT0c8FXFh1iM4g=;
        b=MB5tnCAPMnT3a+hdLWBKP+nsiZ6156UDmQRAsjVwey/gAu5GmCc+Ufzb5rsCnCjJii
         3iqEmFxu7TDDgfWm4Gb6KCw3Udw2gCKo8qou8h8UKtsO3XIJvuYRY8ff/4e8x08o+zH9
         /MkMVPqBpfUYdajv/6WTHKVXf9hpvbXNnTQMOi38GPoJJwGBPyfyTw7WTnNWbXalkpn8
         EXCG4qc4S2BEKfpmm+SfG8Oo4t9Z+7dltdMqPFxNeYWoo3noj0vnsc0VZIiA0UtvSwnO
         Rg8c4vy4/MeQEcf3dOcU6nZMkaosRrjtq85h2CwzoZkyQwhZVUXdndgmTrvfjpTQtk1/
         qUBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784501; x=1789389301;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRove3eF2CgDkgkhUEbbyBJwjMDlcAT0c8FXFh1iM4g=;
        b=WTjHZa+doJ+xTWqB7JxFbeYrDAeyTjDN1PvJXmFyp6H4a7kkXIZqPwSR8bVq2Ju5Iu
         z/XKiQibgC6lxdmNO3gDuWbDmOaMKhh5fEdtTZfSsdakXRWtYT67htC7T21rBP9WuEIM
         k2jDjCX6FbrLYRJKNSRtP2/A7ZzcZUZZb8NYm9/iKi1TLY+tWFqvN6jmUYGNEXtY69Cl
         FNPp2zNTg66Np8XgW1yv1fmJVAdMy1bjs8jna5iMi5TZJol1YGJOtspBo85yahbWFaN1
         HlEAfpo8qvyaWPkx0xhsf5CZddvnxRUecK1KSVKZHI6zrBj+/YMdH66DCrclwCkVEjJa
         H3rQ==
X-Gm-Message-State: AFuF++kQcwiDLUBdQU8wGXbWpMC2zRK0A88ePdgl21fAcdeze78nF22o
	yKLQVBf9IEqCmvvRX/0I4YEKGWn6SdFDat1NicLjLJtyiTCwSMMrnzx7zuGBpTlagKR5NrV7Dr1
	Eqi6uL9lHYSkYSY/mBievwwkSjfeQta1YPLGGGKr2w600NkPhDQ9t+hjn+8rn9S+kerD9OJNaL0
	WtwAs=
X-Gm-Gg: AYBFou17DWedbrO9hTazbPBwZbzDddDdYX7/MeN2+JBxlMN0B7gMczGC9fZyIhFgQ9/
	NtTBxekSEI7X0YbSk7RA5IPRq3wIj7DDDjJhnsvm/z2s3dU9IqR22iRv2+yVwttGS8eaSb6pmlz
	+kWFigthpE8XRQ0SmnnF7PpVKYJmaPv+AYR/361+Gmh+CYgYjXPuH7g21pkQWENSWPtjYFun0F/
	nPxTMbKC6SeVD+2iJfldiUEdu9ExXsMI+5MCJZPLGahYIMEWR4tBvs14A8EBxp9+VnGgbzqBsei
	EMJfnTOIIZOLPuD9UYRLqrEtAWpCgGk3/qeIUuOWRbiriYbsfGU7QbN60ZLuFD1beebvwX32eOf
	p3TNVnGNX7svXAr2E5KtjlD6MrSWS
X-Received: by 2002:a05:6102:e0d:b0:778:636c:71cb with SMTP id ada2fe7eead31-78a4a9c40c1mr9992797137.10.1788784501183;
        Mon, 07 Sep 2026 05:35:01 -0700 (PDT)
X-Received: by 2002:a05:6102:e0d:b0:778:636c:71cb with SMTP id ada2fe7eead31-78a4a9c40c1mr9992772137.10.1788784500704;
        Mon, 07 Sep 2026 05:35:00 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be01bsm27784233f8f.31.2026.09.07.05.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:34:59 -0700 (PDT)
Message-ID: <e1842799-2603-4f7a-b3db-623483bd4bd8@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:34:58 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/DO NOT MERGE 07/12] drm/msm/hdmi: Split PHY init from
 power up
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, olteanv@gmail.com, vkoul@kernel.org,
        conor+dt@kernel.org, neil.armstrong@linaro.org,
        linux-phy@lists.infradead.org
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
 <20260828-drm-msm-hdmi-eliza-v1-7-67843277de17@oss.qualcomm.com>
 <20260828142231.81AD01F000E9@smtp.kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260828142231.81AD01F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yqeo-Fw91LBMPm129J3tsOc1IjoBXzPv
X-Proofpoint-ORIG-GUID: yqeo-Fw91LBMPm129J3tsOc1IjoBXzPv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzOSBTYWx0ZWRfX6wR76ejEDv3f
 Z4XoJvYqFXyRmTZTUalnGeemNxNsHNWx7reGO6lljxo6Q+y9eODvuVHplFVDL5kZuFkOuAsCHFF
 ohkoA3vLWuLIzf/3IuhW4bH/crlSJxs=
X-Authority-Analysis: v=2.4 cv=LseiDHdc c=1 sm=1 tr=0 ts=6a9eaf75 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s3il5d3tusZ4osa2_RUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzOSBTYWx0ZWRfX9yTWDXEZGDWr
 2RrJyQw/Ld6s23NHa9M9JG21FeG08Tykmn99iusofqGKgrQr98GS6yaqoiHZ5z5zHhh7Py3vrhS
 bfZmpGnVluTYnjGrsGkb0irCagIdO6AZ/cxuMPBCvRhlnVb83+D9iR/xnWB8tNA+Iy7Mq5NmFMG
 vRpxAj5tLgM4YpLieQ+7G71RZK9H5a671eSU1sfy/3/q4DmZNhyuCZli4kZPlsZye1SLMjBrO4P
 da1u38aHetf8hhPBqj2UmOJdYmH1COLZiTw46eu5cIrnxzLjPhVuOmJlFPUYsMIFijqQAoJtsAX
 Zwewme7BUXa9t50umqquEIVNHKF4QhewDK2IU1WqbVowSPPMGixjfdVxFAiaLUHBVe58+SdAA7u
 w6JEjgATpe6ky3X2PdR7/wpRKnoYMyCAchGbo6Ok8fDGi93QVZzXW+f2OrMVHhKlwug6Hf32P4X
 Jd4xyQE6cvbsAry7Yrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070139

On 28/08/2026 16:22, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> 
> New issues:
> - [High] The HDMI pixel clock is disabled before the 20ms vblank delay, breaking the intended shutdown sequence and risking hardware hangs.
> - [Medium] Unconditional clock disable and PHY deinitialization can cause unbalanced clock teardown or CCF warnings.
> 
> Pre-existing issues:
> - [High] Hardware registers are accessed after dropping the runtime PM reference.
> - [High] Missing return value checks for hardware initialization functions, such as `pm_runtime_resume_and_get()` and `msm_hdmi_phy_resource_enable()`.
> --
> 
> commit 821f230494b55344c7aaf6bb73ba3e416ff8cb25
> Author: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: drm/msm/hdmi: Split PHY init from power up
> 
> This commit reworks and splits the msm_hdmi_power_on() sequence into
> smaller steps. It separates out runtime PM enablement, introduces a new
> msm_hdmi_phy_init() step, and splits clock preparation and reparenting into
> msm_hdmi_clk_prepare() which runs after PHY initialization.
> 
>> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> index 9d027f96ae243..ead6ba3b8192a 100644
>> --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
>> @@ -15,12 +15,18 @@
>>  
>>  static void msm_hdmi_power_on(struct drm_bridge *bridge)
>>  {
>> -	struct drm_device *dev = bridge->dev;
>>  	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
>>  	struct hdmi *hdmi = hdmi_bridge->hdmi;
>> -	int ret;
>>  
>>  	pm_runtime_resume_and_get(&hdmi->pdev->dev);
> 
> [Severity: High]
> This is a pre-existing issue, but is it safe to ignore the return value of
> pm_runtime_resume_and_get() here?
> 
> If it fails, the power domain is not enabled and the PM usage count is not
> incremented. Proceeding to access hardware registers will cause an SError
> or panic, and the subsequent pm_runtime_put() in the disable path will
> underflow the usage count.

Addressed separately.

> 
>> +}
> 
> [ ... ]
> 
>> @@ -341,6 +359,8 @@ static void msm_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
>>  	msm_hdmi_set_mode(hdmi, hdmi->hpd_enabled);
>>  
>>  	msm_hdmi_phy_powerdown(phy);
>> +	msm_hdmi_clk_unprepare(bridge);
>> +	msm_hdmi_phy_deinit(phy);
>>  
>>  	if (hdmi->power_on) {
> 
> [Severity: Medium]
> Can this unconditional clock disable and PHY deinitialization cause
> unbalanced clock teardown or Common Clock Framework warnings?
> 
> If atomic_post_disable() is called to sanitize the hardware during initial
> modeset (where hdmi->power_on is false), msm_hdmi_clk_unprepare() will be
> called without a matching prior enable. This bypasses the state tracking
> guard and triggers a WARN in the CCF.

It's pre-existing approach but I will address it in v2.

> 
> [Severity: High]
> Does this code disable the HDMI pixel clock before the 20ms vblank delay
> inside power_off()?
> 
> Because msm_hdmi_clk_unprepare() is called before power_off(), the
> pipeline is frozen mid-frame before the delay executes. Powering down a
> frozen display controller mid-frame frequently causes system-wide bus hangs
> (AXI bus stalls) on ARM SoCs.

No, this is just pixel clock, not bus clocks.

> 
>>  		power_off(bridge);
> 
> [Severity: High]
> This is a pre-existing issue, but can the code following power_off() access
> hardware registers after the runtime PM reference has been dropped?

Ack


Best regards,
Krzysztof
