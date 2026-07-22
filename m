Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E9E44AB77
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 10:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784717706; cv=none; b=d9UmKKlarhIfeJW9SWx4NbBeUW6fH7l0AGT/c0+irabGwo6e359udsl4lT34osdMEaF966040TlftXfD9yA0G8nHXxKSmY4EnB+7H4CE+goMVQUYv6HarCoBXj7Ja7hUhGLrS5nJ70M9eS4WokjZXlRcPtNBlSmbNJByodnNygs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784717706; c=relaxed/simple;
	bh=QlZ1mAEFW2sRXV6BuYMpOuS7pSTvh3zATWYt5EgfYeA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q9nR+iCmdYa1fga+6s6EZuhFiTr9wXrvMMNxa2YkxN3CavV8u4eCmEwGtW+jK2zixs3EVW/QHjFVq2lxEmfZEFWWCXk+sDkjhCTepW71gUbTIWUTNbSrONjfolWvX2KDmtEgOezEpliLRvmrHrq/l52gB+EM1wVWg5+2YbzjPZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c36GvnUt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JaddneDw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c36GvnUt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JaddneDw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x89v1400250
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 10:55:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LPDGN1eDhV0cM2OKKPZ5QUdzqEuIcsRmODO3PXGRRAw=; b=c36GvnUtGVL/AuIy
	EWnidWC9uyBJbjugFm+g40UN9rLF+9Olk3E6lYKTxTuli6s9XOx4qL6n9gFrwkK6
	56hm2uQppvAUegsm/uvisNsbB8i9XyAXwVvOLP4Aj3jEVfaUKparM4Hp0snEreU4
	zQyqW5yn9xaGjQKDrDB/qkicaBsumlx0UlhUMzvFcZZ0pCfHJsWbRXCf+9CUFxk/
	aCJHkmbC7wjM7N6GA/EWy9S5JIyLT+R/MaCj+gsyupYyLKcYU4A0EasdFhesgKV3
	T9NLspTeF5W2hdB4WNdga5xjmZQstUphCgZkeDuKMvzwG3dxhME7RxXO61OLACca
	GY04ew==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr83968p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 10:55:02 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f45dde7595so102741526d6.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 03:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784717701; x=1785322501; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LPDGN1eDhV0cM2OKKPZ5QUdzqEuIcsRmODO3PXGRRAw=;
        b=JaddneDwAcyYEjKOZyGBMWRQF7Va8zKPEYXhs9zJ0pFLjL8IX0ER+R2qjxzlBzRCLT
         zT2bc4dH0Rx3v2fOoCF41H1q4le03K8HwlKd4Szc2jckayHrD5rHRMcNSgLFcjKKPen2
         N/15D9HNkRyB3uwmziXnt/P9eD7KUpXLWeuOZp3bettwiuPk3Y7w2BVDzF2Zycpf5gQy
         Difk8HCoj/+CEuWt8mDHsasjC6Cum06UK86ANTFZTZVGH6N3oacylc1ZgyM9qaKWvWTA
         JvwgDNy9uhHnK4W+2ExhAjX7ZD5H6X1NRXu1MaORghtDvtlwGinlbHAxG7MCxS04ab1r
         oJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784717701; x=1785322501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPDGN1eDhV0cM2OKKPZ5QUdzqEuIcsRmODO3PXGRRAw=;
        b=QiYmPmACtlSw7JAapLGG/ghOeyHzPGUr8cRkhjF34RssVVZLwK7SY4rogCz0col2IJ
         y2dOzAy0k/QyYaaEBdpq5YSCiEn7h4L5qqbcVtqmFiylB2leDyfd7fulAc89wMszlm9X
         fzin0gJimKymGycFdIlK1mQ1w+0SZ2Du9aU9SPFPZ3c36/SMl/37dZ/HQizCXmvfdT4y
         ICp0XgEIyR7hEeU24SLMohvYL0/LyEYLLLKAQ7/42Doc+IE83sD0g15yGDSnkuNpLygM
         Jj5nSfOm/UEi21fQCczfKyR5U3ZGVLhozP6FSNTeuClAFaT4cQBxF45neOwqttEaWxrh
         qhPA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7G3T7UAKPEGg5WLDl/AofTjFURo9iUJ94xviAKOFjadCscutuDn2mqmaMk3LBukH+TChqCFkGFnZLO2hzznk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/iyCExNHvWx3OCKP61/XZ0PWjf05N96us3zCtYjJcksDicj9J
	LNbIep8yMnO+q6zXJwfu4jp7S6N4L2qcCPob9s3czUbrHJYly7pY1xNrWExGjCI6tF9FKdWyUpm
	CeBn7C+yY+svT0Uu/vSOOdBFB8BaPLrZXA8kSc+4wmaNqoHDoxjfvy842D9KAVfmU7kmDEnd0hs
	0A1aU=
X-Gm-Gg: AR+sD125NXA+xkjne5Q78mPOBcPbnHWZAqZoWa/2nqeLDby9SuGTJFANdxudTIF22ty
	VQDHgtceByWsQuBTN5Z9u5GwZuoes2WvbtenBgK1WfCNV4Dh4VdUsEQbb6qLLlbB5ZaQsMACjMH
	1O2lDCrBDwIjc+FdtTF0PjiLfI3ajw243pMaok1xFOi8xqod6q5pMpUziAamg+EZFBByatok8fD
	JF2yLGH/ErdllX0I46aV2h/LihwOGHdbE/Xg4eAsh8/eacETmiU496wC+NASBOav81GnhokBinS
	FmxBHtwtURvSMTg1X5xm3c9nVlKfhUmuEGmtJUKb5jk5Kcffy3riMxptmMI6pn48kDhWYSai4PS
	KnMCi0h5Fro0xfSRg/iN9TFQuIavh3my0rwNBoZ3IzxH5o+ECwJSKkcyihaIYTKFHBw==
X-Received: by 2002:a05:6214:2f12:b0:8e9:f62b:8fa0 with SMTP id 6a1803df08f44-907783cfb3bmr246503196d6.53.1784717701355;
        Wed, 22 Jul 2026 03:55:01 -0700 (PDT)
X-Received: by 2002:a05:6214:2f12:b0:8e9:f62b:8fa0 with SMTP id 6a1803df08f44-907783cfb3bmr246502966d6.53.1784717700892;
        Wed, 22 Jul 2026 03:55:00 -0700 (PDT)
Received: from [10.111.173.228] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8b3e96sm18841846d6.1.2026.07.22.03.54.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 03:55:00 -0700 (PDT)
Message-ID: <fccb4620-d5b2-4a49-b703-8725a863c540@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 18:54:56 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/15] drm/msm/dp: drop deprecated .mode_set() and use
 .atomic_enable
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
 <20260720-dp_mstclean-v8-2-bea261bf4e7d@oss.qualcomm.com>
 <20260720063317.CFCFF1F000E9@smtp.kernel.org>
 <ldznbgwysgo4ya6h2s57wytjjhhljkfyiagrce4z2gvty5suye@bdc3gfzl7xff>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ldznbgwysgo4ya6h2s57wytjjhhljkfyiagrce4z2gvty5suye@bdc3gfzl7xff>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rviG9S_mnNjJoHJjA1UZDN6TaDnjZ4rt
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60a186 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=ATxrgLNVpGx5eOw1QnYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: rviG9S_mnNjJoHJjA1UZDN6TaDnjZ4rt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfX4uebUE2J+CaF
 OnERYMDZyGsCcWwvPn66wBMiLe9g/viWGcKnFxYU3w9Aq5FRCo8lkIf/z1GASXiVuF9uxgILrxl
 kNT3BdLthJmPGHG8mxKeID+BKRn6F7AexWOnyeYOYfbvVtIIpZP8v35C68iTOJThtMdd7oDF5Gs
 AFqCMTmQ43e2abHz7dWlYr43/K4DzBueIFFV+FHSxwZ8LJRbKJODhTpzUH66ZbwGbNYpJaOAvEo
 W/jSDzcrXOcLuR3V3cU2ds5ad+V9u+iTTIATFwHMq7DUj/397upBg72O2C5tGnU3MMAgxY82P8t
 rsURTWTQEV6u+9ni0bdMoMscOQ91VA2kp9xSyMbfIJC+OaIw7KDwk0Tq5wXNdfQ2WS9d1KjM0VX
 akRupT2lDBiIH7XQHNTXViuhktWm9nM/MdwN3IkPQTpMYrphPGr8ig8sJiJljUxP5AqeFGiVUv6
 xe7um2oO4wWV4VhO4Zg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwNSBTYWx0ZWRfXwwcKZeREtVYd
 cGa1z/CjNAo7puBSf380QMI/VYW6VjVz6D+HOf7411rVo7YRAVa6Cl49SKGP1BCg7Y1YIZdgge9
 rDXHtnCHPwZLRxf87Xy0obTxjIV+e3U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220105



On 7/22/2026 2:47 AM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 06:33:16AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>
>> New issues:
>> - [High] Moving mode state updates to `.atomic_enable` causes the DPU encoder to read stale wide bus configuration.
>>
>> Pre-existing issues:
>> - [High] `mode_valid` incorrectly evaluates wide bus availability based on the currently active mode's state rather than the candidate mode, causing valid modes to be rejected.
>> --
>>
> 
>>> @@ -1386,7 +1406,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>>   	if (msm_dp_display->link->sink_count == 0)
>>>   		return;
>>>   
>>> -	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
>>> +	rc = msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
>>>   	if (rc) {
>>>   		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
>>>   		return;
>>
>> [Severity: High]
>> Does moving this mode setup into .atomic_enable() cause the DPU encoder
>> to read a stale wide bus configuration?
>>
>> In the DRM atomic commit flow, the encoder's .atomic_enable() (which executes
>> dpu_encoder_virt_atomic_enable()) is called before the bridge's
>> .atomic_enable().
>>
>> Because msm_dp_display_set_mode() updates the format state
>> (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420), the DPU encoder will query
>> msm_dp_wide_bus_available() before this new mode's format has been stored.
>>
>> Won't this cause the hardware to be programmed using the wide bus state from
>> the previously active mode, potentially causing display corruption or a blank
>> screen when switching between RGB and YUV420?
> 
> Indeed, both look like an issue. Please add a patch before this one,
> adding drm_display_mode to the msm_dp_wide_bus_available() call. It will
> solve both issues.
> 
Sure. Will update it next version.
