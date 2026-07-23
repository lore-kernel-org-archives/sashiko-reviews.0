Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388573839A9
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 06:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784787368; cv=none; b=mFIn3rajY7skKcTZY96cHn1zlFb3hb+O8onczbhbRwQUR1/FwJgYZKIVaFusUvZ4TmEylRBWX1WFc45rp5neRWg+9HjhrVtO+lU3AEpvDm+TclJpQN5zoyOVW/STQiMdLks5QpYT29YAdUdqBVcRhyrf9t92tvq0l4/4vVjZwsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784787368; c=relaxed/simple;
	bh=F05Vdjr1h1fZyFmF07wyXr7PWCv5A5I5Y1xhLRXZH4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fedS4XiG7bn0hQO9XqUO69ioxwFfjQIiBhWmOtcTBDwzNCB22iQQqRo1e3zqgUCg9awhrWGTD1IWEPQZuOony9Uz4TB9UFOjil8N37j84uVRbe+5vhdcnxyQIzzb+X+g/Cn6yNbXWyKg7QqpG/KSKgZE/zd3O3g3QLXCSIo9akI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivHbvVVu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gs1NhvKG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivHbvVVu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gs1NhvKG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N6B0p72676825
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 06:16:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uztIw7Y/czAkNHoN3VaLJJ/uxyGxSAro/FyBZ0TR0YM=; b=ivHbvVVu63S/vnRj
	W8dmUU7rP8j2FmQk6kGYReehwJvkW3fV9aGu3w1rNKNKQidIuKVWTlg38c3f8xe4
	oJEmBDF1m2uxMcPvw/MVbWNv0kIqKDFrmMvS8WsrRyDLy28Dhphb0GNFfaacRZ+F
	bhgvbWvKZMDvR8+WVxD6zQh62IghWBMvTNqzGVNgkfRcUvXAesCeH16HpYTzFLqc
	/ICKKstXafXvLKPaQrstqrf4K9Nxk9W1v3UkP5qSyREW9s6iET7rv23wDuM750ow
	vVTBufpr7WmKy34osr6OyZM2DxUNDMwb3/u086gsAtCEnwnj1W4RMqibzqXlwwI4
	tqmYiQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjxmgkp3a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 06:16:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e9a2b95b5so64773885a.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 23:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784787365; x=1785392165; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uztIw7Y/czAkNHoN3VaLJJ/uxyGxSAro/FyBZ0TR0YM=;
        b=Gs1NhvKGaemMasvbbWO6AbUq2x0EOvDvymflEXQvNU76tc10NZm82xWL16ym/aWrAA
         71nUsS5bNhk42aEv9jOAF5eso4e1ZOZ3OqtVZvQoJmZZJCRjtov4Fmfw9ZVQ/OThQDmb
         pQNu4jghICZPAgFMProKGcTFFtW7ztY5BqrBBoyD9R3+ezSV9ExIc3+CU9SmfPFB9S7L
         b4ei0d0kk8kfYUvrY9SKbNaWeVwaxhEm9d2AC0h2eLuB7/XbmxUfdV3SI4f7V7WV3ZC2
         o+eeDvVqDdAmfmho2CtQt9E7UQQquKz3BdX/Q+xBmnwfbHUTBQidllJyQSbmQw2O8azW
         Y7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784787365; x=1785392165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uztIw7Y/czAkNHoN3VaLJJ/uxyGxSAro/FyBZ0TR0YM=;
        b=hcezap+a10KzyTCvUI5z8+GOO607RybOs6fO4iWrWfvAoAWUCdhh5YJzCKXLKUOv21
         BQDSRrEcIkhIC8jVupdnp3lkVzJmPRQCpuFV/Nje+ulDaJdPw9KCfw+nxsHgTHb6Fz+/
         pQ0lXkm32DWRgfisDHi7u32m23BXWyRNVZC5oLWI7WprHsWSN2lYMDbaUESyRK2vlzDp
         rdGFOEs2R8Z86x1P3SO05x9D9ZdhQCs8u+3Os3EYTuRHK5+31/743tTv+9uRfMwLhvck
         RmhBJ9++R5AzBbpv1RMAB/4yiGSEoGe361pIG3GUBB1lgTxyRl501IS8ricJZDFIHd5V
         kArA==
X-Gm-Message-State: AOJu0Yywe692Gq4NFUgwKEEEobYG3AaqRlGTGfS3NexcPLWH8hz7Oai2
	nQ9DkwSKzJTYO1nkVq6kiv1o5CkNPlA78y4xRQT2scQsyKH9S8EgbY5XJjRJXWogP5hVid+DhYT
	4eY+bmoqHkCKBQ8osiz5IflLS6UkOXii3LyB95NRE+uR8yZKIS654DCes67Iuj47DqMgZwAk=
X-Gm-Gg: AR+sD13tKtoTasc1SE6jgy+hu9HDG3kNFG+aDPKikv5kjoSK9Co6sKYNoYLcd5iB7fJ
	Xcdj+Tp2YuSKNXB+LBeHo3gpFGJYpxygq/foU1kNpVKBvYsZ4MJOQEWFBaSwJ/MAIA6AX78XTW3
	JSd5wSfXHh6HnM5eYy91GuXOe+AyY3WsuLD7i4LkrZ5pDk2pVPCflzavCS9OvZ/iZFlPt5a9KxB
	WkgIJdxH5cOi3jMFoB1Qib4OO/UFttjZ8HcddntmZ1VidqL6/KxEMgped7pC0cOxaZERuhBUtF0
	P8dv9SbY/+Dd1aeT16ur2wPgEgumlZb0sq4MuFCQLq6pUtWFGkuIVL4MncTqdVVUbP3FeqmG7u1
	JQEnDI8HzEQxWADnRQYX9wUqivrCm+Aw+pf6hxKCGXNQuSveiGxbny798o1+TGjuGhQ==
X-Received: by 2002:a05:620a:1707:b0:92e:f3ca:2ecd with SMTP id af79cd13be357-931038f08abmr175252085a.60.1784787365192;
        Wed, 22 Jul 2026 23:16:05 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:92e:f3ca:2ecd with SMTP id af79cd13be357-931038f08abmr175250385a.60.1784787364665;
        Wed, 22 Jul 2026 23:16:04 -0700 (PDT)
Received: from [10.111.173.228] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a0411dsm343863885a.22.2026.07.22.23.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 23:16:04 -0700 (PDT)
Message-ID: <0436a2a6-4a4a-4b5f-ad53-594781cdc914@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:16:00 +0800
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/15] drm/msm/dp: drop deprecated .mode_set() and use
 .atomic_enable
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
 <20260720-dp_mstclean-v8-2-bea261bf4e7d@oss.qualcomm.com>
 <20260720063317.CFCFF1F000E9@smtp.kernel.org>
 <ldznbgwysgo4ya6h2s57wytjjhhljkfyiagrce4z2gvty5suye@bdc3gfzl7xff>
 <fccb4620-d5b2-4a49-b703-8725a863c540@oss.qualcomm.com>
 <i4h4amxstadjomfd6i5dkgtjdnre23ugewvlsffajfdelwmyfg@kpex2duwixxl>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <i4h4amxstadjomfd6i5dkgtjdnre23ugewvlsffajfdelwmyfg@kpex2duwixxl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D+V37PRj c=1 sm=1 tr=0 ts=6a61b1a6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T-t0yevPL1h59vvOJvEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: I34uO1c8qC3fCabmnCnvB5MMP_l40GyD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA2MCBTYWx0ZWRfX9kVOWeSuXN+v
 QIQfrazmbmv8JUyCMfA7st9Q6RszWunWMJ68T3om71LD7+Rn3xF51R+/UDN8sY4G5dTVkfA3z6U
 vwevh2/Y8uhuO00Wu1+X3xWS7Sw1YAA=
X-Proofpoint-ORIG-GUID: I34uO1c8qC3fCabmnCnvB5MMP_l40GyD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA2MCBTYWx0ZWRfXwYAl9628xkWp
 evvrxkO+QEdsNFxRnWlqMvKlHYvOM/MFYBbASqitZEP3sSz/eq0tpczw6IvJAsrKaaqnjQLZlEK
 iDQg1DcOueda1oqxAAWDvcEgF9SnAZorJ6QpzktjR5TQJI26U/l1nspm+w3LasoncVGdUCjMXfx
 aH4/LUb15T7OEBxMZ+FIWxraypZjH2wypu7FhEH61uXwnIfbphXSaDGFqtEFvjcUoc8ZJG5EpcZ
 7AfmB8Gt4tH7yZdVPLKb0tInrr3xRXNyweMQyp6sxOx19V+2fzAvHsgB/EniibQoUehH4/o2k9x
 3YavO0gOSmCFXIZFcLZo5RGkmbzmsyVGvjE7ZPqfCoNCbEKh7ESg5LDTps9ThkK9x7ls/S4fM/Q
 DQw2cJPu+x94SwiLaQyB79KTyibA+whuWAwvjU8zuyU6MHiJeSeH6BWMcDE6tWfgaKzCAd2U569
 VcBG8oZaVNiYdFf/Z1Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230060



On 7/22/2026 9:11 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 22, 2026 at 06:54:56PM +0800, Yongxing Mou wrote:
>>
>>
>> On 7/22/2026 2:47 AM, Dmitry Baryshkov wrote:
>>> On Mon, Jul 20, 2026 at 06:33:16AM +0000, sashiko-bot@kernel.org wrote:
>>>> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>>>>
>>>> New issues:
>>>> - [High] Moving mode state updates to `.atomic_enable` causes the DPU encoder to read stale wide bus configuration.
>>>>
>>>> Pre-existing issues:
>>>> - [High] `mode_valid` incorrectly evaluates wide bus availability based on the currently active mode's state rather than the candidate mode, causing valid modes to be rejected.
>>>> --
>>>>
>>>
>>>>> @@ -1386,7 +1406,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
>>>>>    	if (msm_dp_display->link->sink_count == 0)
>>>>>    		return;
>>>>> -	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
>>>>> +	rc = msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
>>>>>    	if (rc) {
>>>>>    		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
>>>>>    		return;
>>>>
>>>> [Severity: High]
>>>> Does moving this mode setup into .atomic_enable() cause the DPU encoder
>>>> to read a stale wide bus configuration?
>>>>
>>>> In the DRM atomic commit flow, the encoder's .atomic_enable() (which executes
>>>> dpu_encoder_virt_atomic_enable()) is called before the bridge's
>>>> .atomic_enable().
>>>>
>>>> Because msm_dp_display_set_mode() updates the format state
>>>> (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420), the DPU encoder will query
>>>> msm_dp_wide_bus_available() before this new mode's format has been stored.
>>>>
>>>> Won't this cause the hardware to be programmed using the wide bus state from
>>>> the previously active mode, potentially causing display corruption or a blank
>>>> screen when switching between RGB and YUV420?
>>>
>>> Indeed, both look like an issue. Please add a patch before this one,
>>> adding drm_display_mode to the msm_dp_wide_bus_available() call. It will
>>> solve both issues.
>>>
>> Sure. Will update it next version.
> 
> I needed to pick up your patches, so I ended up looking at the issue.
> See https://lore.kernel.org/dri-devel/20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com/T/#t
> 
Thanks for the series. With modeset() moved into pre_enable(), this 
issue is no longer present.
Do I still need to send a v9 to address the comments on patch 6/10?
If I send a new version, should I include the first two patches as well, 
or only resend the remaining patches that still need changes?
