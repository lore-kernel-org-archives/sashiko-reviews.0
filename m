Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E2A1ADC97
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 18:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784659813; cv=none; b=ZE9KBZtldOoSSU1M/2iBE0VjK+2OXtJfoBhQOlfYMMSG1g8Df/nVyHnlASzE7MBbNx51Ovns/l70szFb5EtREV7PL+kFwMOwnTPq6EnE3ufda6LuhHeKm1pFMhuktTr6DUI+MjWYQlxwegKV7dss8ad6IyuuXoGoSxc0+g6j5b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784659813; c=relaxed/simple;
	bh=HTWIgY35mHBMzOhNwhud2WOJYqsscqFcryiaK0GOc0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KcEoV5fH+SeI2w+qNq2Ba+2JSubesfNBJH+lGgWk+CfQqphLhUbsfVn3K0yATKuJRbH3AE29kf1N+A5U3iYsIWK2aRL1u0yU/W8SoG4Oqmuadtf6QaEoA4K5kfdXx+YS1L3WRV71pbgTHh2CTcJxcAoslpQDJJViRQRdAz/c3L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zb/b3xou; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGwTjkhZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zb/b3xou";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGwTjkhZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LHRLQG2494444
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 18:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fxC8wePi6tkBj4RJjKl1UeH/
	A/kptp+3A5mz2gNO7yg=; b=Zb/b3xouFz4nyp0/go8oLtuwEUoKD9C0cirnBLfW
	aVwEUGt1yadY44wTqGfBAnPYInHpvYnQCnm0BrX0DHrG2YTQyRmP1HUa/JVkz1gT
	jdAhrHFsJmuhWzmZomIFrbGMO7Fwa22JCp2DiQwTOli7FKlcOkTtOYA8PQlx4dP8
	Tg7BPZoDr02ZNZISLp4EJ07jZs4MkUp5xZtT8s596MTRKOX0RexUDkpifaCEyzRu
	GaB55z7KMzHgPiEU/m5zbJjMfOcimRAeskZzNR5oEobYIQeqct73F5OtVCaXkBzw
	rQi9cvx7jLWr500P5ppA3Kwcp66BDvk18k5BHsD3rVNeYw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6d8cxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 18:50:10 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9771a7eaf48so3379820241.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 11:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784659809; x=1785264609; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxC8wePi6tkBj4RJjKl1UeH/A/kptp+3A5mz2gNO7yg=;
        b=WGwTjkhZc6ZiBhy+X3YTAkEkiXjjC2OBqjGbr8oL1scygBWnY1o87ESudeSKKlmCZl
         LE/MJ/paDduPD8ocmvgJ5btDcXbcER+2KonSoQmYfEZQSbkfcToDjBrUmH9xc/zXkQMk
         kW4YLN6WDtHPrzGM3KQ8aWT/I4KPxrOQMdggL9rAmzoleThWngNo/8FnsKd/WfMVnYj2
         ZfPXeoxeAhOS24D8fslUufJeif/Z55xPQkG3z5TDbDLYeUy3NZo9Kp2AN+Fn3Y7QKKwO
         AgoZ1B/tiUDHqiopJUP073tPSxg00Y6KUZ2ork1yGs1kWaYvPIy64F0HzpDzOMIxpaBw
         STQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784659809; x=1785264609;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxC8wePi6tkBj4RJjKl1UeH/A/kptp+3A5mz2gNO7yg=;
        b=f4l98wMyOwszMaTsJjwAT9zkq13SRSJQoWjSDGJCkzyWXHWN+6Kzrmf34bOB2FggHs
         JuV/TgOmSIPnZ1+CNQDKfAztHEj7Ipnlr1spwAFExnxrfdeYy5iTboSkto8O9LuFH5IQ
         R0XUkyGcynVmF8Stq9helkzTUNN6aOHjB2Q+DpWVyu96IdiovfNFeBw7T7xcIonZmi/x
         u0Afq8KMNRUsH8TOOTvI4RwsGXaR0zb+nK5sUwfHl76moiFcWW9QAJXJ61Kj6NSl1nF2
         MrGQ2RgHVT22iWHBoSHvvxZ8R6Qwch1FK9SZ6GZCdYrcle7Vm7w83O42BKgc2z6vrOx/
         lR8Q==
X-Gm-Message-State: AOJu0Yw0Y0Ql/4PRiXawr8Q1dLW9/213W6daGjiBoStzIQuqYSiV/9ug
	BYcqqZ7JREbMKkVLcceGo4cuTtnuBsEW7p6sfJ88VjVOx8QGXpw+zL5BZByn7Qs4pdGwh3LaM03
	fV0C18+OLExhiFGPZnezCST9jH1j7o61eO5yrHk3wQ8jNv69+Fns3kEH4oRfGzezeFoV/pzg2sx
	Phqe0=
X-Gm-Gg: AR+sD12ynQGwbMYqtvX4HlTTqZMnczKnOmzwHFb7E4i1L7iB2BoLzzem59cnKbsaZWl
	msiCZ7JiCC6zXa3gPfdhECyGjgL7giTpXfP4zzekqMlkJp5btU6zKr9ftzpo87o5nF4Seg0NeFR
	OYrNLbA1QV87Fix6WXimr5HlgQnmOdCTyufwg0s6EPEv/i9QM+SI1WDPnoE6DEvc55V4caefnk1
	7CtBS2ya6TPvEjIxfh7asqrlYbYsKhvHMRw+OLqzIBZGXX2xYyKJhh6eL2/JY8UvN1gq4HPCj0R
	xFhhG6u9wss4+Le+jXfBmrR47FK8i6JzT9zyPnPrSyngdLs53cy614Ouoly/z/cP3msHTD6yXzA
	j6LkPx3nh2wZTBBjILMNpadQyiqjde5OQ4HRNsTaDQQUoMq0XbfPLbzzPmYvQQ3Rafk9FsbqjoU
	64dbJKiLScWzyV1w==
X-Received: by 2002:a05:6102:18cd:b0:738:8b5c:a41a with SMTP id ada2fe7eead31-74ad17da68fmr341889137.18.1784659809459;
        Tue, 21 Jul 2026 11:50:09 -0700 (PDT)
X-Received: by 2002:a05:6102:18cd:b0:738:8b5c:a41a with SMTP id ada2fe7eead31-74ad17da68fmr341878137.18.1784659809037;
        Tue, 21 Jul 2026 11:50:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6888542sm721611fa.1.2026.07.21.11.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:50:06 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:50:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev, freedreno@lists.freedesktop.org,
        linux-arm-msm@umbar.lan
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 06/15] drm/msm/dp: split link setup from source params
Message-ID: <2ysoleroryfoh3tosv54iyq5t6556k4uf2hkp67fofy7gizkhp@3koilwev3czy>
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
 <20260720-dp_mstclean-v8-6-bea261bf4e7d@oss.qualcomm.com>
 <20260720062728.89BAC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720062728.89BAC1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NyBTYWx0ZWRfXweYf/p4/0/UA
 rGj5HNdgGaNyoKD3VZ3twaK0f7SR4ldtyPVth/uQM9eBXo43cAh/av+fKJDKuUuHWNbvWGINUIb
 kR2aUmcVN0/nIoum17VTFASM2oYKjls=
X-Authority-Analysis: v=2.4 cv=Ipsutr/g c=1 sm=1 tr=0 ts=6a5fbf62 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=mEP0jwSp7JUOxKfJe-kA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NyBTYWx0ZWRfX6RO7YHV+KPRG
 BbvIwgFyyzSJM7CIlwkhZtMvFB2DSklfFtBNO2xFeXExjoqgMx5LUe0JZo2qUwBotmkaWXPpdsm
 HwRXDd0esBqnsPV8PKDb5KKH0qg1KnvSbBftHyIOHidPU5HPX1/EeLCwe7MQNFKyiDQkx1fxwe9
 I7s+FJ6RhJb6pyq90IBfw7RQo1ZffqC9gYHQhbdaJpFo0NWmTCZ+dC9cy3ix4DAkeaJRYRw0PXT
 h0F0nyDF9jlwN9eHm5/lnWpdMMy66mExoK3LWt+TkddygGjBOdgX+sn2WJmEzyWwaMm/KMB7OJt
 /fB4aAYnhwRGX9EzO49bpy/lqDNQHuw8ZPUS+VWKRcefqBNgJs9imETTgPMa/atAejwuVznwmqs
 KipFTo/DRAefRvZPcxfCX3SyM6Y6QaR/I+oPr/ZfgDN0YzXS3z7jdJtdRjiOpRkjIGLWk1k9wzO
 kCf9pwKgfMJ5s6tmY/g==
X-Proofpoint-GUID: IxqpeXhZOkCc2ZqX2kemXJOdqSM4ngCa
X-Proofpoint-ORIG-GUID: IxqpeXhZOkCc2ZqX2kemXJOdqSM4ngCa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210197

On Mon, Jul 20, 2026 at 06:27:28AM +0000, sashiko-bot@kernel.org wrote:
> [Severity: Medium]
> By splitting the link setup from the stream setup here, are we exposing an
> incomplete read-modify-write in msm_dp_ctrl_config_ctrl_streams()?
> 
> When MST programs the link and stream settings separately,
> msm_dp_ctrl_config_ctrl_streams() will be called independently. Looking at
> msm_dp_ctrl_config_ctrl_streams():
> 
> drivers/gpu/drm/msm/dp/dp_ctrl.c:msm_dp_ctrl_config_ctrl_streams() {
>     ...
>     config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
> 
>     if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
>         config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
> 
>     tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
>                                           msm_dp_panel->msm_dp_mode.bpp);
> 
>     config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
>     ...
> }
> 
> Since this function reads the register and bitwise-ORs the new values
> without clearing the existing stream-specific bitfields (like the BPC or
> YUV bits), won't this cause bit accumulation and hardware state corruption
> across multiple streams if the link isn't reset in between?

This deserves a comment or a fix.

-- 
With best wishes
Dmitry
