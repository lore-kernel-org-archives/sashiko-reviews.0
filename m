Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F2533030F
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256058; cv=none; b=AFcfThGHlIoEteiAuhVrZKXlOMMUgklCkHTyJd3eWum8+A27hXUnXfzoxkCWWTPLhTP9m0xQSUt+ASIiqHG67nrpTFd9Mh+h0LHUqVt1ynSBdq33IEqhcgb1fUCSuYeH+uok/8SCsejDXQpS75dHKoPm+BUy3T6EMaM6lwyV/7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256058; c=relaxed/simple;
	bh=sFb6iFA1mae+eHUNHE+wkDHGkONwSwC6MP3J9/3gWLs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bVuXSvLmeKcdylvnosz4kPVWyLSo6+vAJb8MOLlYJRLDPrXXlI4AgrP3+XqczwypUm+VEXCCXBlrNL/oF6fRvgoxNVIDSA2pjltYidUKhLWiprb1rNGpNK3OeHcniV5ex8xumFvRI0mu7Gu7B3c4V356IflpN1Ae0yhJf5TjFsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J6jmmr8L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nggz0lRV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J6jmmr8L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nggz0lRV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNIT3p4178631
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZVeb1FG1OCtjsr9mqY6kcodNvD8xgUw/91muIII8Fk=; b=J6jmmr8LRoSk0uU8
	oA+FIgoUfE7Vo40VCu14xNBIqhiEZZZ5czkhoZG9UdctBdsvQ2wiuuQ/lAq+1kpH
	puWlcSyvAxUyOqiNn30v835tCbi1ov697dmeAR/onl5bZGl1Cg5+DxbYvzYZA+D6
	uDG+8JQLe+HFoYegL6Tpd5KGSPVbVMSbnJYGDispOoWQmXiQ97wMhdwamc8auaBD
	4nxk5fuLDwVpapKDnD/MZKqtOg85vpDESZkNN1cdtc6mxAOXclPtkotfc5aSo8YU
	fVuhVP/4qSY3fZHGcCITPy7/0YPa4HyTzSW+mJK2kOC3u0OR1RYre3QQswOjacWs
	rFz6GQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2t50r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:40:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so9365513b3a.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 19:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784256054; x=1784860854; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZVeb1FG1OCtjsr9mqY6kcodNvD8xgUw/91muIII8Fk=;
        b=Nggz0lRVq484zY0jfBXphU+KItEx/kqnllbIjc4hvLpNIDuGFgfah2Uoyg/LY9WzwE
         /ZGzYFGE32wfECJCvaEgw8JBXxL+qyPJD1qetSj0oBTQYfUQWYshSOAbrl1K3wtXEOpv
         kZrXkfpYdl3yMyQxBMgzFoI7NAmNe3KQMVAxjp4G+gM/uO6ff/ha+1KMibBrd8GSyZuX
         7g1W5oADdGcwFNlcG0R+z+2HdRpfHdv9AIPyTWTSyr8KOOPGXUM5GBuEwWZ10Jmrl7WH
         wJ1lWkLlaQtktZ0jw6fFE0nZVRDfAHoQDfnwaJWBOJiVi+99chXhHtdK71RwuLY/kgs7
         l7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256054; x=1784860854;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZVeb1FG1OCtjsr9mqY6kcodNvD8xgUw/91muIII8Fk=;
        b=QhmJaXQe83XA565BOy6GVwEyB2Y/xCCvMIuHaxUV+KtYsIRBYZTaKBUHdiAu5txyN7
         CmrKPDTq0TpCkQalXq13a8Y10FAvQzwkpOt3pMxVDIHLuZH319D/eVuFCfe/hyhy/0yN
         RE5Xov+HMfl6W4BVFlvw3LEVz6jtuQsWxm6vKhM9LyJoJhc0x5KKKy5KniAw+4v0MTsU
         DRurWVJDGmRZD3WKeWTYArhT3QQo/YzQVlM1eWvjK8lUAAf7OFf8atZQta2t86L+EmQa
         bD75CPROK2dJvCy8WPLSBRsoIkDvMG43rTsoaXzFbr4e9W586+O4/esp7GqHETfiwPK8
         Plyw==
X-Gm-Message-State: AOJu0Yxk+3OgGGRW3oEzgMZpim7+5yM2O3WuxrT2IYMfOVNIJ4TsBQwR
	F3wqYciQxxeLeqxtuCbYQ1eM8o41CPspUsb2C+9Cz+61if4gnL03SybFdOL8X37ejMY/gI2u3am
	qsAN97HVugQTGd+NFEeAZxWLrTu8dKnmfExEVnm1opqKVEDjHKyyzXJeq+s+jKm4M/JYcAfkYeP
	EkhSY=
X-Gm-Gg: AfdE7cnbvItCiXGFo6KWU55w6wy6gsVQ1f6Th5wsqGSVFXZEwCL3qcZWTdxFgOQdX+7
	T6pGR1sfev0w8LspspquYNfnxZEEw+xdoY9PKTS0+PxSMoHn6oeyqiv4+i/zXmrQPhCSTHim8vE
	WztIWhYaf6fRJkHIXBG6exRwK5inXA3j4Su6OvxkR9ivSUcw0j2FpzAO/twQRmdDmzw+2kKiQOl
	sZmrL8xLIGtogO5Ax651WSG+LHaCXabYnqLdkw1ETyGzZECFV8rprqVOJ0L2CFrk6yAQ8yN9uCg
	r0I5GvsdEYJfq0BRRpIVcsuSMk3C7vnnUTNLbHtnyaLMNutNcyr2aWxHVX2QfRtZq9zngeE7x+s
	5OB6JEAXNAm2C8lKVMJX1PwmyC4KAcyel1/7afv2qfuCA3iRS+1HiwA3FdM2nkO5lgYqJQosz
X-Received: by 2002:a05:6a00:278a:b0:848:2f84:f42e with SMTP id d2e1a72fcca58-84c294d4dd5mr547734b3a.71.1784256053884;
        Thu, 16 Jul 2026 19:40:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:278a:b0:848:2f84:f42e with SMTP id d2e1a72fcca58-84c294d4dd5mr547719b3a.71.1784256053348;
        Thu, 16 Jul 2026 19:40:53 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb51a2c1b0dsm146689a12.30.2026.07.16.19.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 19:40:52 -0700 (PDT)
Message-ID: <ab9b496e-9329-480a-ac4a-46d468d4fe9b@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:40:49 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v7 02/15] drm/msm/dp: drop deprecated .mode_set() and use
 .atomic_enable
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260609-dp_mstclean-v7-2-ea04113e8233@oss.qualcomm.com>
 <20260609100657.8935F1F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260609100657.8935F1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9_1U4d1BeadzkOsXFbvmKvksBeSIrE-Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAyMyBTYWx0ZWRfX5NBWFExgEQht
 jTmF3DSkhmhPQ7M0IoPgwjaLHpd0zmU7IZqiIYNK/J+6rEU/rUnMvZui9piX2JYfbji66EFLBOP
 qOhMcLLUAE9rO81fs2vmsnPO/PDMK0w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAyMyBTYWx0ZWRfX7Nq8dpZvAZvn
 ycRYFH2+GaTYeNobyvN7uxuYjG+ydAAXucj7REerINoFD62+Bb7SQsmNsD5DDg5NKx7bInON926
 3+wxvzcTf3ChB1/DrTtwcdJ+TWfwqmU0KZT3rmi+slx9aLuQb6RaYXNWA6Ro7a0XrnBDhflq5uy
 Cef5aiUnc034fWe5AnAhDGTapL/Jqbxf1wFB9l/ZnzBGgTGGKTuQHKPAKZAxavHHXWPzg1Tm3rs
 lkDbhfF1e+BgSqbbLHX44qPfNPKyyLdSl63fqOyONbW47c5BgiBz9bxhpqzfgN2VrpaZXq+3tOn
 pno4WgUThMdYhrxOBgBj+74GdYLxqcZyyioeD8kCLN+KkwWxaVTVESDf0bUO59t/nSpinRdOJbD
 gLE7wTMbFctJ8H9vqBy4dfqAUH66AqIqkuQyOa2tCSBdwdbmR485Gsb1iitwnSUfYFSgNkbCVtj
 SwREjPc0WFrfNc55ziA==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a599637 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UyEoFrDdOu127hDhB3kA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: 9_1U4d1BeadzkOsXFbvmKvksBeSIrE-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170023



On 6/9/2026 6:06 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Moving mode setup to `.atomic_enable` causes the upstream DPU encoder to read stale wide-bus configuration data during its own enablement.
> 
> Pre-existing issues:
> - [High] Mode validation callback incorrectly evaluates wide bus availability based on the state of the currently active mode rather than the candidate mode.
> --
> 
> commit 1b0de5b490fbc6b7e19b00f71948fa7d36954fe7
> Author: Yongxing Mou<yongxing.mou@oss.qualcomm.com>
> 
> drm/msm/dp: drop deprecated .mode_set() and use .atomic_enable
> 
> The bridge .mode_set() callback is deprecated. Remove it and move all
> mode setup logic to .atomic_enable(), where the adjusted_mode is
> available from the atomic CRTC state.
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index bce165bac106b..57eafd4724627 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> [ ... ]
> 
>> @@ -1309,7 +1325,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *msm_dp_display)
>>   
>>   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>>   
>> -	if (dp->msm_dp_mode.out_fmt_is_yuv_420)
>> +	if (dp->panel->msm_dp_mode.out_fmt_is_yuv_420)
> [Severity: High]
> This isn't a bug introduced by this patch, but doesn't this function
> check the currently active mode's format rather than the candidate mode's
> format?
> 
> During mode validation in msm_dp_display_mode_valid(), the driver calls
> msm_dp_wide_bus_available() to adjust pixel clock limits. Since this reads
> the active mode's YUV420 state, wouldn't it incorrectly assume wide bus is
> unavailable for a candidate RGB mode if the currently active mode happens
> to be YUV420?
> 
> This might cause valid high-resolution RGB modes to be rejected because
> their clock exceeds DP_MAX_PIXEL_CLK_KHZ. Additionally, isn't this reading
> a state field that could be locklessly mutated by concurrent atomic commits?
> 
>>   		return false;
>>   
>>   	return dp->wide_bus_supported;
> [ ... ]
> 
>> @@ -1386,7 +1406,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>   	if (msm_dp_display->link->sink_count == 0)
>>   		return;
>>   
>> -	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
>> +	rc = msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
> [Severity: High]
> By moving the mode setup here into the bridge's .atomic_enable callback,
> could this cause the upstream DPU encoder to read stale wide-bus
> configuration data?
> 
> The DRM atomic helper sequence executes the encoder's .atomic_enable hook
> before the bridge's .atomic_enable hook. In the encoder's enable sequence:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:dpu_encoder_virt_atomic_enable()
>      dpu_enc->wide_bus_en = dpu_encoder_is_widebus_enabled(drm_enc);
> 
> This calls down to msm_dp_wide_bus_available(), which checks the
> out_fmt_is_yuv_420 flag.
> 
> Since the bridge hasn't updated its mode state yet via
> msm_dp_display_set_mode(), won't the encoder read the stale value from the
> previous modeset?
> 
> This seems like it could incorrectly enable or disable wide bus support
> when switching between RGB and YUV420 modes, potentially leading to a
> hardware configuration mismatch and display corruption.
> 
The two reported issues are essentially the same underlying issue. A 
proper fix would require moving the YUV420 format selection into 
.atomic_check(), similar to how other DRM drivers handle output format 
selection. However, the MSM DP bridge currently lacks an .atomic_check() 
implementation, and introducing one would be a larger change outside the 
scope of this series.

Furthermore, the affected scenario is limited to rare YUV420-only mode 
configurations, so I don't think it should block this patch series.
>>   	if (rc) {
>>   		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
>>   		return;
> -- Sashiko AI review · https://sashiko.dev/#/patchset/20260609- 
> dp_mstclean-v7-0-ea04113e8233@oss.qualcomm.com?part=2
> 

