Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220273328FA
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256106; cv=none; b=tbv6mVqt2NU2sWjr7gf0gP91lZ29zSFHwLNZdxAtfyqhexNT6fLHR9EMQahy2O3n0dFBxK5IRHCUJkcTIswx9EB8niPGNZYuku8gCgwsHDlupyhZ3E80hX1VosSd/stNuaz1nLK0D7huUmG+Laeykzc76TesFlH3Jw/emi0fBbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256106; c=relaxed/simple;
	bh=a71YTWI0wrsSCd6HSZdUyWH7tn6B2M+FmSmWSuj2hqE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DEyh1AYwynbTq+isJUrTcGLnBP+vs4Iq9IDUYdW/LUesq29I/Y2s6pzgexLzw53U1m2/c4a6p05ySuqdug2/sHJp0QQiFfIr/SGCtvKPOloglDApUJ5BjJaOQxgCe7qM6WFNAoDPgVdjfqyNKTmPddOfivnF3fnMYvKCZ8gPtkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PRYI2ZIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bbQ0rxx+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PRYI2ZIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bbQ0rxx+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNIr4s4076496
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiHqrvT+mM6D6jdKW6Gxav0qmC++bQtkMzZTkAbIWzQ=; b=PRYI2ZIg/BCe0QKH
	bV3QYjRAbVe90C9Nu5MQgruDZwtwavnBfHaKNBvV3HbXUD8Kivek/lKmQI2+fa5y
	BIrsaaU0y/gIMci3CqWpzI3CbrqUrB3mO0ZZ3Ccr7TfIY8st8M/ahKL+xPJKzv/4
	n4rAW8d0/GTKLy2Dncazo5RR49U0iJ2vTCeyyxFTNEUhoF+LIH5jzBAgOihCboE3
	+ZlbawMoPTeCJxnhJHNlFvyGT/l9iGn81xZ1E8Lb3OP1knJHhYgRe5nZtzINUQwA
	0JNQQvm8Rb9FoM9KS4zEb7IkRc0CR2MhEvDresY6A2o2nNyxRHr8RKmXE7Q4JrG/
	1/1xeA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv3wj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:41:42 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso9547993a91.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 19:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784256102; x=1784860902; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jiHqrvT+mM6D6jdKW6Gxav0qmC++bQtkMzZTkAbIWzQ=;
        b=bbQ0rxx+IXUNNfcvx7o3A9iu4U0FXGU8KPza7IuxH5ZB2YnnBQ6EougwFoV9XM2R/c
         44ASt8z4praDjbMTTCUD9kfK3QUO6gCPSKHjgRn8hHqMoaH5J02k9NMQxNGtXnKvd4ut
         DBVPvnQCjorzZCi1k2T6YjaLVTOE5f9usbjPhfSCn+YXrdRf0FaccnZwJfG5xBwrgdF2
         6dZSnG6rxuz/fv+sdJG+Ikivpr4UdnyT4mexSWiuAidKgVBOjztIAP/RvSh9bBL/qBrW
         WGI774mSOoJ+9TV17CjFZq3n/9noesKeKaCYrohzQ9QgzYOPex/x9ofze+MNzMFrPrrn
         hVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256102; x=1784860902;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiHqrvT+mM6D6jdKW6Gxav0qmC++bQtkMzZTkAbIWzQ=;
        b=SF/Ae1z9rKoWbd1JbPPFRSFSCoHdk6eMuk6wkXxaAmxr42RX2J5MvLlj8z/WujcoL5
         EdZYcvSoQ9hV5jH6MBBPjpd/pRTxIb5WDcp4TdUfMi1B96KvEdP3VVqvfUjjjLcio33Q
         wNpezoq7/wt77UDtT5UlkL9eTihwAzJGbIl+M6xmNghs5mP7zZGyuQ/NoOpLRQQZ6CX1
         FjzK8MDSBGah8PvassLdRIxbOAqHFrvPFd9yP1Hn5yki93IxMK+BdA5EeqcTYsvXZe5U
         XO96QCgXGKEP/e1WDpdILdmakGRqpMD2wC3KAIRApttdwXjC+jFv3owCZx10iUKChyEx
         K/tA==
X-Gm-Message-State: AOJu0YxWSzyn/runtHWCNjiAQrpjGyFMF0gqF5gMNo9SoWwopOUoAc/N
	en6kwdwi2x+wY1M0mb6YVeyXmfOhpcRFfNBxNN4Js5H/QWwfCglx18Ftz+lC8sH+G2x0ReEhWaD
	q8xg3si/o4u0TtmjiJpd5cLVrVY/WzDFRkEVXW1I509Xh7dbPH6zk/TKq3NTFr8TaDBROWw2Yto
	zXqVA=
X-Gm-Gg: AfdE7ckU1K8T2cf/vp8kSl/wrVWebd38F63diqv8CsZsrSXfuQyspa0qwc/mNjqHZIR
	jM2OnshvtpXZV0kdwzHpQZMQU4cLbWUKf/SQpSA7gggD6Z6bHYjegSCxJruhbYMYYaGKFiQILXO
	nxL/k91xQs5S6t9JLbDtNovoMNtvj/49BsSiZ7cRF4hHKbZkjg1HN2sCceoGK4g2VpYFssShqhd
	gyaFNxCrn9F6Be3nlqv9ETN2PNL+sBmdDj1ruHNbtlpV2Y6s7q2fUbqxblqhUCeSoNUzftZxk+J
	wa+U4By0lyD9w9M/N9ZquCql7575sE9Hhy6njZs281yS7fVXT7Z6/1hP28Y/hOfvoW/rm8OuC/z
	zCESIqi80u2xKBJfqnX9roALwD8p++shlGNk4Rz8YPaGpBZzUHeQPL0aszFV3SmzSKQG1Y7VU
X-Received: by 2002:a05:6a20:9397:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3c3ad97155fmr668975637.50.1784256101626;
        Thu, 16 Jul 2026 19:41:41 -0700 (PDT)
X-Received: by 2002:a05:6a20:9397:b0:3bf:6c08:2843 with SMTP id adf61e73a8af0-3c3ad97155fmr668962637.50.1784256101157;
        Thu, 16 Jul 2026 19:41:41 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519aeb69csm151310a12.20.2026.07.16.19.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 19:41:40 -0700 (PDT)
Message-ID: <e997f350-df80-4ab0-bb94-462ac5ed2232@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:41:38 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v7 08/15] drm/msm/dp: break up dp_display_enable into two
 parts
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260609-dp_mstclean-v7-8-ea04113e8233@oss.qualcomm.com>
 <20260609095951.B0A1E1F00893@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260609095951.B0A1E1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAyMyBTYWx0ZWRfX8gA5Mu8wDw58
 VLSIDfWB8oS5ZOMBJ+DlFHm+xooJzC+qLyVNR8rvIR3xSqXBbB7dIHTyqsuBLTCHVuT8otjzbZR
 YLeOGgNYfpIvHsl0JCCxp0RsQqkQnfz2FsGK4ZSIG01E2Fwa4Ug+O6hhNl6FTOOJHCX95//63sN
 +UMFr8IyggKBD1THHFs8MGH7/7X98COcAIPcIgRR7nweHecSenvSxJWXZJqN0HOIS59+e5WZ/7c
 gEqyzfUwfK7kdUEo/yAxHW4NV2a+pSdAXXGNskquILDjXkNSJ+xqJbFnUe9SNP1hQolfn42SJN7
 A5jUVaIASyGglOSh1LIax8c+L9U9bjU1Gapyi3PRPIPZ/bf07bCfbWi0BHZ2N4VgEw4NJYBAPhR
 28jrOl2NK4K+WCylGr1qGmku2o0oY3q9R9uQCmwEug2/zW3EDx6y440/+48WcF8QctHu+An7tca
 gqAdpHFfTxjX0R2GIMQ==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a599666 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Y219pdqfsrRzYske1R4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: C4Gepee1CEh6TyLxZO8OPGF2jGFaSnNE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAyMyBTYWx0ZWRfXyQdr1oxQMr7r
 0JPrEdCI4vqsvKUJqVMiSTcYNqgKgoUf1NLpUuL7uMZw9AHDZoEvdWD6M1aUdudepjjrXL3+FQD
 pRgidAtNBKd5aDw0fI2NBsw+eDLuTWY=
X-Proofpoint-ORIG-GUID: C4Gepee1CEh6TyLxZO8OPGF2jGFaSnNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170023



On 6/9/2026 5:59 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] Missing error return when sink_count == 0 leads to unclocked hardware accesses and kernel panic.
> - [High] Missing early return when link training fails causes stream enablement on a broken link.
> --
> 
> commit b8a02a483af0ac409e7c1790ebfbe296067ea49d
> Author: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> drm/msm/dp: break up dp_display_enable into two parts
> 
> This commit splits dp_display_enable() into two parts: prepare and
> enable APIs. This allows inserting MST payload functions between enabling
> stream clocks and programming the registers.
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 155beefdfdef2..2cf4c984c7ca7 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> [ ... ]
>> @@ -617,7 +617,40 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>>   	return 0;
>>   }
>>   
>> -static int msm_dp_display_enable(struct msm_dp_display_private *dp, bool force_link_train)
>> +static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
>> +{
>> +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>> +	int rc = 0;
>> +	bool force_link_train = false;
>> +
>> +	drm_dbg_dp(dp->drm_dev, "sink_count=%d\n", dp->link->sink_count);
>> +
>> +	if (msm_dp_display->is_edp)
>> +		msm_dp_hpd_plug_handle(dp);
>> +
>> +	rc = pm_runtime_resume_and_get(&msm_dp_display->pdev->dev);
>> +	if (rc) {
>> +		DRM_ERROR("failed to pm_runtime_resume\n");
>> +		return rc;
>> +	}
>> +
>> +	if (dp->link->sink_count == 0)
>> +		return rc;
> 
> [Severity: Critical]
> Does this unintentionally allow the enable sequence to continue when the
> sink_count is 0?
> 
> Since pm_runtime_resume_and_get() succeeded, rc is 0 here. Returning 0
> causes the caller, msm_dp_bridge_atomic_enable(), to continue directly into
> msm_dp_display_enable() because the prepare step appears successful:
> 
> msm_dp_bridge_atomic_enable() {
>      ...
>      rc = msm_dp_display_prepare_link(dp);
>      if (rc) {
>          DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
>          return;
>      }
> 
>      rc = msm_dp_display_enable(dp);
>      ...
> }
> 
> Because msm_dp_ctrl_on_link() was skipped, the DP link clocks are not
> enabled. Will the subsequent call to msm_dp_ctrl_on_stream() within
> msm_dp_display_enable() then perform an unclocked hardware access when
> writing to REG_DP_STATE_CTRL, potentially triggering a bus stall and kernel
> panic?
> 
>> +
>> +	if (!msm_dp_display->power_on) {
>> +		msm_dp_display_host_phy_init(dp);
>> +		force_link_train = true;
>> +	}
>> +
>> +	rc = msm_dp_ctrl_on_link(dp->ctrl);
>> +	if (rc)
>> +		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>> +	// TODO: schedule drm_connector_set_link_status_property()
>> +
>> +	return msm_dp_ctrl_prepare_stream_on(dp->ctrl, force_link_train);
>> +}
> 
> [Severity: High]
> If msm_dp_ctrl_on_link() fails, does this mask the failure and force the
> pipeline to stream video over a broken link?
> 
> In the original code, an error from msm_dp_ctrl_on_link() would explicitly
> return and abort the atomic enable sequence. Here, the error is logged, but
> execution falls through to msm_dp_ctrl_prepare_stream_on(), which often
> returns 0.
> 
> If it returns 0, the caller receives a success status and proceeds to
> configure and start the video stream on an uninitialized link.
> 
Will fix it next patch.

