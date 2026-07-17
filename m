Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CE43750CB
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 03:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784258936; cv=none; b=BKujTpoxHlP+Ij/RkS8MNx0MAZtagVKKu+lMbYPfg2QFdO5eg150HSwIIjP+G5o7WnRyjWw3jA+QnxQUCWXanrjTOPFhLo2mnpzY76ilSYNjY5fWJ6/MtSdPFyn/4RICzEdTY/I0ecYlvaNOIlPOgsuk3WlSZShTFx5BqUsAu6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784258936; c=relaxed/simple;
	bh=CbRVULL74DR2r6XeBV9dhMYzjbPUMMsZ1lbbQuDXY0U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etLXamas0by6YDAkmG+k+t8iel3hdJ4sw+tOSS4IgruxcguCH9WtznEQsOkfkSw6PWQC7fOfHPNrwMLI5TnzwWlX2l/1Nl67Uui0+KUDDBsmpHTLWAAYsevsk/cogMxzTAWfVyYoJhK0uww3mSoxWWkl68GqnQRr8/+UyqsTSUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nKdI19VI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fp3TrFQv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nKdI19VI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fp3TrFQv"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33lIh469393
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 03:28:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oGQyhCyTFOfzEilNh6DtlVyB434KQJA8Hb/vNH9xhho=; b=nKdI19VI0Xg+gH6K
	UaaLkdRdr0hYfoRKujO+x/4z6W8hJIy1tzOMitetK8PrTxidOfU3ufli8mgWHkHB
	J3sxzmo7OH5LsyP4SZWOu2hIw4uC8lYlZ0BLRzK6/ltIFrMutUJ8dQEbrU+q5l8f
	k/XcBlJtTQsM7mpZb0IvTLbV36sZIbklyWkR11UXAI9Ig1zG425AwhHG3ZPtWFUY
	3aIazBfoJC5g+5rKz/FsKPa9HT9AHhQLgMQVr4DWUIv0EXdORvIq/Qd4dWCsN0Ql
	uGuF2AQPqLxMiPxDPuGhkkZzx64PBNcow0ELolGpDpTWWgF443BMnYycR51hIIA4
	roIzhA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2t99v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 03:28:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2237bc43so5622141a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 20:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784258932; x=1784863732; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oGQyhCyTFOfzEilNh6DtlVyB434KQJA8Hb/vNH9xhho=;
        b=Fp3TrFQvtiXhMxLSo3qXDvJw23H9ewFEZdcKVU+oZ6yeJ2aFNYH+C1owkEhk1X870t
         IDtW4xKKauZn4Z8Fmz1gJd/lN2pCHlfvOg6vwc5RTJ4YYVMNSJBCupt8QmpkF49fOWl+
         /vvdv+hoJADeWMytD1+m1GJp/xgyOBCr8kENQITrsk+NfqA6V87nYXPCJhzGLXzKGh4p
         5jxQTHZYNfBx3+7Mdar4BJGcLPzbZml7SdGkWQKdbjdT0PmSbIF92DrI76rPUnl4zTES
         NUW2/RY+iaY1KXR4eY2o+frW5qHHHBSW9Vb2MteKHwZMBwWm8Mrw3p3VrHl9kVl2HwIi
         MkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784258932; x=1784863732;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oGQyhCyTFOfzEilNh6DtlVyB434KQJA8Hb/vNH9xhho=;
        b=U8LQ69XbYUToc+o9CzxutQh/qsYzVVTX35w6ZhEF8GyvJ3J7uq6wlPWNn1Tff1arfs
         I/yhJ9jmNc8e8F0yJFaMaC3v2KGV/oUmMmYnWtitYvQHubQZahusDLhhtC/t7XMBqy3u
         9JrAJ1jqLb4Nrw6qjoln9v89/LsNvbeAe3XWidNJVytfcgLPBg+bSoFlrdyYwK6mAQCB
         IK181GIYmacM6WOIu/GGHwtz+QbDPPYUBfSUwjiGj9cxrhvwlHZPHnB4LcV9192Kyc6I
         7yBvPIgwZdPNeEdKNVwpuUm4gcb+YBm3u8N93qeYNMV+3e6OwLNbBGQzabiF+Uv4RPo+
         zNtA==
X-Gm-Message-State: AOJu0Yxwtci/WPwZbBFXfuhp+EBNwrCjvOoxu3ktQK2EqNk7UhvTQwar
	PaLQop8PLM6Lb+4eMvX7gvIvMKGLmpzAyUS4u+hLnIXyX79RMBgIJFcR4HEUt52G+WWifF3TZTd
	1KsfMWERNyIJTRpaRFCYQ4e+AtErxseZze+NG6Casef6pgTAl79pHgvRuSEW4HvZrkw0O1Row+i
	/1fTs=
X-Gm-Gg: AfdE7cn8b2Eg18GiskKGhh74jnHp/PumpXMuK1kd+S4qNuauErUPelrsEUB+Z8qxuvn
	1FWR1AqXpKuGeM1kc5eVmiR6DUCNHEOqiOmxs+HhaLRABvvvELdeLenbRNcpWmdrnQJCm8Etehl
	Cw7h30k76hrsigdrtv8YyC6QiTzJPwqjmC0i72/DUFVv7punKZlxDlb/Iopi06n/Js5sGjyUzR3
	sSruWJp84vPK8dEn3G7C0vtkS95CgNtquoraalhHYbXoXJdEVRBeGyHyEhXvL5qLifMFKr1C/Nm
	RynM4JM3ZqfReWojtCXf7DrX6SYYV0jjE0tz09arDZfma2zZOj3zhT9enKcMOaAwMY4Laag+LkU
	BA77G9QLIrgMkEPrmrX4I1JbSCfzSBKMvVk9kIhlLgeesutILq/HtIaDfE5/Rg/wMmceDK/eP
X-Received: by 2002:a17:90b:35cc:b0:381:720d:240 with SMTP id 98e67ed59e1d1-38e4b446fb9mr806531a91.14.1784258932423;
        Thu, 16 Jul 2026 20:28:52 -0700 (PDT)
X-Received: by 2002:a17:90b:35cc:b0:381:720d:240 with SMTP id 98e67ed59e1d1-38e4b446fb9mr806516a91.14.1784258931889;
        Thu, 16 Jul 2026 20:28:51 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4b22bf63sm281893a91.15.2026.07.16.20.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:28:51 -0700 (PDT)
Message-ID: <cfef008f-6b25-4630-8571-573be8156233@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 11:28:48 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 15/15] drm/msm/dp: pass panel to display enable/disable
 helpers
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260609-dp_mstclean-v7-15-ea04113e8233@oss.qualcomm.com>
 <20260609101330.8E11D1F00893@smtp.kernel.org>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20260609101330.8E11D1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q_AkJjad92ZCVhXwBDnqOxNexvLsT6U5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMCBTYWx0ZWRfX/Fuz4ZVp+8SY
 zFwDSDgSWtUL4sYZZCc6YcpG30ZVCtBctstbSzpUGg4JwGAS5CcRTntqIMkthTwyfirjfir0vJ2
 LWQesSWgfP5WDlXsKjTPPs4oz8pBQoQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMCBTYWx0ZWRfX3YzRh70VBj+4
 qRpLvUd/hlkV6Oju2x43j5Rie2PuvjaPzWPUk2BJ7jN9uQO0/vzaP8gOWFq2hMZC97HUiE/5q+k
 JJfBz6trQpmHzGfWJiuDapKDyMhJ8N53R/K7IyLRFveY0AHdHfqkW4YvwSi3jVPLMW5QT6RNY1A
 c6oR9VRy1STPRdla8WXYPzniDy5kf+QnmEHzdxyhnfzARIIfZgTb1R3SV2Gkk3+ImKs64cJ4hVA
 GtF9+6oc55ZTX8wHaoevQRFNEffdnMY/QiLqYPc1HcfU3rPxMRdneO1RaYc5uKQUTH44AMkMCG/
 e/XQP2H4lFn05BMJEA3/G3rZI/kom/Q1EKcCTGg5dEfQVdB0vucZawFex0aBfFZNNl8ALq4yySU
 apU+JK6yHYAjys0ANIv9zg4H+kRJ+6QecfRT/sBLWjyLGRsRittXOlKRFtR/lU8iakgFZ3ay49U
 2H0fUxVgz3P/xYZJgtQ==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a59a175 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TcVGpIbawYuZJHNPIbUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: Q_AkJjad92ZCVhXwBDnqOxNexvLsT6U5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170030



On 6/9/2026 6:13 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [Medium] Incomplete refactoring in `msm_dp_display_disable` leaving `dp->panel` usage.
> 
> Pre-existing issues:
> - [High] Missing early return in `msm_dp_display_atomic_enable` on display enable failure.
> - [High] Sleeping functions called from atomic context in `atomic_post_disable`.
> --
> 
> commit a04f2001a63e30ecc08234abf0151576d165e356
> Author: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> drm/msm/dp: pass panel to display enable/disable helpers
> 
> This patch passes struct msm_dp_panel to the display enable/disable helpers.
> This aims to make them easier to reuse for MST stream handling.
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 03320071fc077..888ecf34f1602 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> [ ... ]
>> @@ -707,20 +708,21 @@ static void msm_dp_display_audio_notify_disable(struct msm_dp_display_private *d
>>   	msm_dp_display->audio_enabled = false;
>>   }
>>   
>> -static int msm_dp_display_disable(struct msm_dp_display_private *dp)
>> +static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>> +				  struct msm_dp_panel *msm_dp_panel)
>>   {
>>   	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
>>   
>>   	if (!msm_dp_display->power_on)
>>   		return 0;
>>   
>> -	msm_dp_panel_disable_vsc_sdp(dp->panel);
>> +	msm_dp_panel_disable_vsc_sdp(msm_dp_panel);
>>   
>>   	msm_dp_ctrl_off_pixel_clk(dp->ctrl);
>>   
>>   	/* dongle is still connected but sinks are disconnected */
>>   	if (dp->link->sink_count == 0)
>> -		msm_dp_link_psm_config(dp->link, &dp->panel->link_info, true);
>> +		msm_dp_link_psm_config(dp->link, &msm_dp_panel->link_info, true);
>>   
>>   	msm_dp_ctrl_off_link(dp->ctrl, dp->panel);
> 
> [Severity: Medium]
> Will this disable VSC SDP on the wrong panel when reused for MST streams?
> It looks like msm_dp_ctrl_off_link() still operates on the primary dp->panel
> instead of the newly passed msm_dp_panel parameter.
> 
>>   
> [ ... ]
>> @@ -1437,14 +1439,14 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
>>   
>>   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>>   
>> -	rc = msm_dp_display_enable(dp);
>> +	rc = msm_dp_display_enable(dp, dp->panel);
>>   	if (rc)
>>   		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
>>   
>>   	rc = msm_dp_display_post_enable(msm_dp_display);
> 
> [Severity: High]
> This is a pre-existing issue, but does execution proceed to post-enable even if
> msm_dp_display_enable() fails?
> 
> If msm_dp_display_enable() fails, the error is logged, but there is no early
> return. This allows msm_dp_display_post_enable() to proceed and configure
> hardware features like PSR when clocks and power might not be properly
> initialized, which could lead to hardware timeouts or unclocked access faults.
> 
>>   	if (rc) {
>>   		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
>> -		msm_dp_display_disable(dp);
>> +		msm_dp_display_disable(dp, dp->panel);
>>   	}
>>   
>>   	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
>> @@ -1479,7 +1481,7 @@ void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
>>   
>>   	msm_dp_display_audio_notify_disable(msm_dp_display);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does this call sequence
> sleep while in an atomic context?
> 
> msm_dp_display_atomic_post_disable() is an atomic commit callback, yet it calls
> msm_dp_display_audio_notify_disable(), which can sleep:
> 
These callbacks are DRM atomic modeset callbacks rather than
non-sleepable atomic contexts.
> msm_dp_display_audio_notify_disable() {
>      ...
>      if (!wait_for_completion_timeout(&dp->audio_comp, HZ * 5))
>      ...
> }
> 
>>   
>> -	msm_dp_display_disable(msm_dp_display);
>> +	msm_dp_display_disable(msm_dp_display, msm_dp_display->panel);
> 
> [Severity: High]
> This is also a pre-existing issue, but does msm_dp_display_disable()
> similarly sleep in this atomic context?
> 
> It calls msm_dp_link_psm_config(), which acquires a mutex:
> 
> msm_dp_link_psm_config() {
>      ...
>      mutex_lock(&link->psm_mutex);
>      ...
> }
> 
> Calling sleeping functions in atomic contexts is forbidden by DRM/KMS
> guidelines and could lead to kernel warnings, deadlocks, or system instability.
> 
Same as above.
>>   
>>   	msm_dp_display_unprepare(msm_dp_display);
>>   }
> 

