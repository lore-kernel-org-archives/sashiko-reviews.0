Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6651898FB
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784256085; cv=none; b=NUCtCCBgqHSPh/Tr2P2SWFH3GssrtgUUNVoxqUrZbDHpccp3MLywFOmCu/ty/2GO1Z2KjjhGvvgCwfuqE1cPSHT8OkbfE/PGWzCCEgP0QLnKj4rGEY60Y88LnFaydRBp/tGceG2BXWssYYe3RAAl8BXH/9pJ4CQMq2S3ZOX+Y/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784256085; c=relaxed/simple;
	bh=CUCbB5LJlFy8pgxVVZhwHkwh6Zio6mIUqIKH5vSyXzU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=LfLrzilSPcxV+/g6uASgGTO3O2dK5MARs27qHtbBw+YdSYeDU6jp127sGPNwke/WUyADC5iX7DGxxNwwzjvXCmiPeTksU/NtIvMOd5XQSwR8t7JMaOZ/IrzOa6E/xbWHfKVXRov3Ffdldg5PCv+lXzIUFLjpaiXrTGqMjOmOvlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ikpj56d1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UClIp9x8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ikpj56d1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UClIp9x8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNIZ8B107646
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xz4xt+e8dWjfcT2i2h4KEU0Pe4rwhXpno+W3ucpoTgI=; b=ikpj56d10f6FlWcj
	YQsrwb0GQxiYg+shzziyF6rXV8VZ5FqT4oK2cSOpCP6UrXbeoUQCT66OWDDmvvpv
	SnNh5LiDblL6vA8VyS337AOL0cXqw3EK2KeY4AFTE2mxsE/HLuKfxIi05k0NHluL
	+MfEkRXy2vqMmBeTyYp8VyBV7XvwdyoVis36/NVRymVXI9XeUIQkvHyfPcjf8ymD
	5DfOa1DAvDKVGMEKI+lBS3Fs3tHawbrBkZer0ymYkkI2nwvPCLdd9HotEZECXU/H
	icZMlVjrBLs6IWC5MZfOWybv51NIL1PFPMTSsnsL7rlgFJ5hvU9e7nBnqhPMVz20
	JssdLg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1b1dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 17 Jul 2026 02:41:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf1c86963bso8368325ad.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 19:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784256082; x=1784860882; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xz4xt+e8dWjfcT2i2h4KEU0Pe4rwhXpno+W3ucpoTgI=;
        b=UClIp9x8XV53geC7UNBBBNYngTZpYJ8Yxhj3SbZkBQ8GS/SqcddtihWg0T1ozxbTWC
         mvRSzCdCFwSC6FBap1U6rIdQcHuQ+FVZlr4Tf0Oc8jVj19O2LWG0jKvCxJ06ACr6oQ6R
         TIKZwknqIvus/MV7YZQM3C7DkQYOkExtOBMWYH+0EMBfXHlG+oNoOJv/OKZP2cVe4YOr
         KSqw1PmdGpOO7AM6CUaTl2xMoLMDurznn38LK19+Y9k2O2QZE6wjWyTVTX0+YiVSgWJ4
         wbwzIMVmHHz/mRyvHGn4e98V4FgxjWhrhQib9bs/ZX3O+hZ3MnLfBJRY83QAAaZ6/Swh
         4LuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784256082; x=1784860882;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xz4xt+e8dWjfcT2i2h4KEU0Pe4rwhXpno+W3ucpoTgI=;
        b=ruYGWo5EgLC1oThVI1/jfhPfVbtNbK9Ytk6sB0rPwWMcX2l09zYb0F5Az9zfh0sMDg
         gKFm1ZQBNvRxWr8eadhxL4Ch31ZhHCIkcn3UzTZPoBk0xg90B7L4xSnQqPU0/eePVf9i
         14LdzZOXEH+FuDkRJIrR7nD8AeASpqAGus4/WTYP94Y36SHSwyWZeqry5f2mXrIa1GL1
         0Y74/jYknowT+3iQamR0gn4kCGP2Xa5ff019eEdXvupqHllZbwB/BbzZuj2ZluHl59sC
         c3TehbF6bahyThWJZ9V6Ytrnc4q2Vk/rk/ILGCzB9Bfca62vtuUae1FlvolHfU+rsYKj
         NZRg==
X-Gm-Message-State: AOJu0YyWolOo3w7RSSA1B36q9afcZnMEUN+YDUJ3h/LJhq4umqIz2X6u
	Jtkm3cIYgrs//soq3JZW2lSWQfDgAYnr5w1OU6jnbh2O3mM3z0eZO86ggM70aAmnEdhVm5tkoNu
	Jj4IGrSTOtKH28CefiyzIQFPhKQv5p467itOA4OVIrhDrGfcw6gca6sbhcKWaBsDNY5SjKV8Xza
	z7QhQ=
X-Gm-Gg: AfdE7cmjuOqZz3UFL8YvBtra0mmdfkMdrfX4la9E3rvsx0Ngo5FEW4o+nn3efOSFUEj
	PeXxBIE6WL+6vHY8WEBnEVNvovkSIppIL1/QCQZKANcsgLzcKN++QXtb7PtdevlOWDLKIb2ANKo
	XlKE3Pik78JgEVTLTKcc+snfxnwod6PjXZhw+KLoO11ZK3HNPCE0lbH6CdJRiWxn6zFJTWmV0dU
	9iTGECgJg8qXzhQ3P/S8AMFXZQd1ETh5fJxpo/9KwwHXWnf9LqF9vwyF1FQgMuKT8D2Tj2bBUuF
	A6DxXBFLfKhgyEksn3BwL89IdcTwqfuxX+yNRbfeIjIO357Kpv1lslN9pU3najFCGpt6mYKXSwI
	jlEPz3V0uWEKb0teZdmgqn8W8e+E4dkgGEbcaZJwxA2KGRV0EtGw00bYamolpCwIAfEmM9AET
X-Received: by 2002:a17:903:26c7:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2cf1f5495a3mr51951815ad.24.1784256081814;
        Thu, 16 Jul 2026 19:41:21 -0700 (PDT)
X-Received: by 2002:a17:903:26c7:b0:2cc:92ae:b36 with SMTP id d9443c01a7336-2cf1f5495a3mr51951605ad.24.1784256081309;
        Thu, 16 Jul 2026 19:41:21 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344cf96bsm2363225ad.28.2026.07.16.19.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 19:41:21 -0700 (PDT)
Message-ID: <406d1c3b-cf7f-44e9-8de5-7e397ff4cf84@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:41:18 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v7 07/15] drm/msm/dp: move the pixel clock control to its
 own API
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260609-dp_mstclean-v7-7-ea04113e8233@oss.qualcomm.com>
 <20260609100437.758151F00899@smtp.kernel.org>
Content-Language: en-US
In-Reply-To: <20260609100437.758151F00899@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a599652 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tIJq6jK7UZ6rIIlOuEwA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAyMyBTYWx0ZWRfX+fIBpwhfJ2/Y
 Nz+dMy3YBXopcv8uRqwVssP3DZiEpIVlrelD79kanx7BNeHICDUCttORn2JcxutdA7AuJ0iz8s9
 ioFEqpLGPuvp6vTSoqj2B79mYTggkLe8+hqdKTOLtLsD/dVPNBAAwiJf3YLvKRdDrutqxGEXjjx
 2R9p9v0y8ISYNCfff/fI1yjdMZCKZZW6ZgTbjH2E3GiPYiIN9zjrqn0945qvMIMwMACqR54/KMW
 nrCH/o4zOHBV41tNFcUtFJZe2s+c05gEn/ldbr7L/G/9+xzeB90+iz54JVt3nRB4/bbMxgHRwPX
 N/tCFNluZsEpwIvuVqyGLOvfAVS/9pbJ3D6WTO+irXQ62w8/hnELN13GD1onwJVtvGTOnlAL44s
 iMPDAVWFfdP4KUDY+Kez5N1w7hAgxN4hoPHS7m+aG5JOyNsB3LO5tcpgKUbv5vfBz/LApG9deot
 jaOeSu/63+HRY3ArOJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAyMyBTYWx0ZWRfXzkIlnly0VKJN
 2UW2NNs4/QnsbI2f1lJS0czHeMpN1vPgLSc+qkiP4FDGJQH8B+NbMznsOzhvBcHCB6Xj2nJj12i
 DjqFrUC1pdBl4l6r0ojMpZhLq6UzyT0=
X-Proofpoint-GUID: 7MAPvtyT3pdwqN4NynxNLgOZeVSJ7JMb
X-Proofpoint-ORIG-GUID: 7MAPvtyT3pdwqN4NynxNLgOZeVSJ7JMb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1011 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170023



On 6/9/2026 6:04 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] Unhandled error return from `msm_dp_ctrl_on_pixel_clk()` causing potential system crash.
> - [High] Invalid `WARN_ON_ONCE` escalation leading to potential Denial of Service (DoS) on hardware timeouts.
> 
> Pre-existing issues:
> - [High] Lockless concurrent access to `ctrl->stream_clks_on` between DRM atomic commit and HPD IRQ threads.
> --
> 
> commit 4ab86d41ec16eead989a4b3a8579ccd95556770a
> Author: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> 
> drm/msm/dp: move the pixel clock control to its own API
> 
> Enable/Disable of DP pixel clock happens in multiple code paths
> leading to code duplication. Move it into individual helpers so that
> the helpers can be called wherever necessary.
> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 1c2eccec6ec6d..a2c44088e6a68 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -2171,6 +2171,41 @@ static bool msm_dp_ctrl_send_phy_test_pattern(struct msm_dp_ctrl_private *ctrl)
>>   	return success;
>>   }
>>   
>> +static int msm_dp_ctrl_on_pixel_clk(struct msm_dp_ctrl_private *ctrl, unsigned long pixel_rate)
>> +{
>> +	int ret;
>> +
>> +	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (WARN_ON_ONCE(ctrl->stream_clks_on))
>> +		return 0;
> 
> [Severity: High]
> Does this WARN_ON_ONCE() introduce a potential system crash with panic_on_warn
> enabled?
> 
> If msm_dp_ctrl_wait4video_ready() in msm_dp_ctrl_on_stream() times out, the
> function returns an error but leaves ctrl->stream_clks_on as true. This causes
> the caller, msm_dp_display_enable(), to refuse setting
> msm_dp_display->power_on = true.
> 
> Later, on teardown, msm_dp_display_disable() bails out early because power_on
> is false, skipping msm_dp_ctrl_off_pixel_clk() and leaving
> ctrl->stream_clks_on as true.
> 
> On the next modeset or hotplug attempt, when msm_dp_ctrl_on_pixel_clk() is
> called again, it will trigger this newly added warning. Since external
> display hardware timeouts can be triggered by a faulty sink, is it safe to
> escalate this from the previous debug print to a warning?
> 
No, it is okay, printing the call stack can help identify the issue.
> [Severity: High]
> This is a pre-existing issue, but does lockless concurrent access to
> ctrl->stream_clks_on between DRM atomic commit and HPD IRQ threads risk a NoC
> error?
> 
> The boolean flag ctrl->stream_clks_on and the pixel clock are accessed and
> modified in msm_dp_ctrl_on_pixel_clk() and msm_dp_ctrl_off_pixel_clk()
> without any synchronization primitives.
> 
> msm_dp_ctrl_on_pixel_clk() can be executed by the DRM atomic commit thread
> while the asynchronous HPD IRQ worker thread simultaneously handles a PHY test
> request via msm_dp_ctrl_process_phy_test_request(). If Thread 1 evaluates
> ctrl->stream_clks_on as true to disable the clock concurrently with Thread 2
> accessing DP PHY registers, can it lead to a synchronous external abort when
> accessing unclocked DP registers?
> 
>> +
>> +	ret = clk_prepare_enable(ctrl->pixel_clk);
>> +	if (ret) {
>> +		DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>> +		return ret;
>> +	}
>> +	ctrl->stream_clks_on = true;
>> +
>> +	return ret;
>> +}
>> +
>> +static void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl)
>> +{
> 
> [ ... ]
> 
>> @@ -2196,22 +2231,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>>   	}
>>   
>>   	pixel_rate = ctrl->panel->msm_dp_mode.drm_mode.clock;
>> -	ret = clk_set_rate(ctrl->pixel_clk, pixel_rate * 1000);
>> -	if (ret) {
>> -		DRM_ERROR("Failed to set pixel clock rate. ret=%d\n", ret);
>> -		return ret;
>> -	}
>> -
>> -	if (ctrl->stream_clks_on) {
>> -		drm_dbg_dp(ctrl->drm_dev, "pixel clks already enabled\n");
>> -	} else {
>> -		ret = clk_prepare_enable(ctrl->pixel_clk);
>> -		if (ret) {
>> -			DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
>> -			return ret;
>> -		}
>> -		ctrl->stream_clks_on = true;
>> -	}
>> +	ret = msm_dp_ctrl_on_pixel_clk(ctrl, pixel_rate);
>>   
>>   	msm_dp_ctrl_send_phy_test_pattern(ctrl);
> 
> [Severity: High]
> Does this code ignore the return value of msm_dp_ctrl_on_pixel_clk()?
> 
> In msm_dp_ctrl_process_phy_test_request(), ret is assigned from
> msm_dp_ctrl_on_pixel_clk(), but it isn't checked before calling
> msm_dp_ctrl_send_phy_test_pattern().
> 
> If clock enablement fails (e.g., due to an unsupported clock rate requested by
> a malicious DP sink), the function unconditionally proceeds to send the PHY
> test pattern. Will accessing DP PHY and mainlink hardware registers without
> the required clock running trigger a synchronous external abort and panic the
> kernel?
> 
will fix next patch.
