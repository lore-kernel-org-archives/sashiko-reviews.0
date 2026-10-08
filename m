Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F8049F110
	for <sashiko-reviews@lists.linux.dev>; Thu,  8 Oct 2026 13:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791467567; cv=none; b=ay1NO160BNpAgLD1l4gpimFDJ4n/zPayITxm9SvF8FdaByyS/g7Qg6dFaY0HKzVckZ12dapj29xpjw7kxa5yziqrtWIuGwNgT7jZUGgZ6IY0exF2XFO27QZGFeoyhvE8ClnWiPo+xmfi/Nc6yq+tcEyoT/xX46YHuPLZ6Gqsc9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791467567; c=relaxed/simple;
	bh=qs6Zkfa0UYwfam2Iz5kiY041lfid0v55471eBxyhrcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0nD5PW6FhjabJyXMH0PbzIkSuC9P0F2EQ9nDiw5ZZE59QPJK3KQ23vBjpPndT1XgoFcDnzun0blSdLW6fjwsldDlP93unbgEzLHz/DeHa9ds/w7NRDMgbWT7NwIQkEJirnN1zMTTeFSV8FS9owWybcbfVkIR995ENguMDrE2og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRVpc3Ky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y1yA4Fry; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRVpc3Ky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y1yA4Fry"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKBEb1269545
	for <sashiko-reviews@lists.linux.dev>; Thu, 8 Oct 2026 13:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g1ajShL5hmrzGWgmQJawATgi
	FWxzPKfgeC+DpQwr2bY=; b=VRVpc3KyYMp4R4uK0E4C3w62OUECuiWPeSNTQi9V
	dADXbuthWvDJt9lWQNbqEMwUj1jer1HUcWZPNGRydQao53uprRX8jVfTWLcmgw6F
	rzB1tJO+c3gVqvlIH9vkX84B4ggAg+W6RIKrxhVL39yN3p668+zs0SDK6zzZ0Ytk
	DgItnoxVNjtaVUZ7VKoatDwDAj9D0Y+VnuijNQNAwKS+Xhl+Oc0v5JWSejDphZuY
	ko+1BYHblMT9OuE0G4VzH7bZB/G7f+2lzJo6E1vjElDcoRpuSmo+Vtdf06mcJRfB
	jCMJKWUUIWVSDPtxBobvyOcw0EMvMGDMsB/k7RRa5bVJyw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe332sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 13:52:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91789a9107fso123404656d6.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 08 Oct 2026 06:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791467561; x=1792072361; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g1ajShL5hmrzGWgmQJawATgiFWxzPKfgeC+DpQwr2bY=;
        b=Y1yA4FryBxTV7u6tGNjIXjFhfADYuRLXFu/rRM1spOkXg3WkorXfittJ58+qKTEr52
         TLE8leFYwMpf2ya2R8r6aNr702Hv8z/5yZvaeyfro4UfFhrq43tdXe1rrEHoQmNSOYgY
         Oi49puU4BgHpwgIGHixhD4zp7VBCaOBUplmOyVtPsRfSNU1k6Lcrj4E3ggnvjCKLlZQV
         TyjRPflddIT5X5VD/1lusLzBuhWft146QuOgESqkFafLwISHmgtLJ1pkxOWqifbC7rJt
         rPQshjrTlrNptJm/gKyeWlE+LUxWLQRGk2b95uH0pPk/tRzaJ/WdNZuJ81U/n9nAGyVT
         gc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791467561; x=1792072361;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g1ajShL5hmrzGWgmQJawATgiFWxzPKfgeC+DpQwr2bY=;
        b=iddALA4uGtjaK+VNKXbzqvLLr+iga1o6f/WSBbMAn3eHZWAGRNoWu7Z3qfvVucXZUb
         tujGBnyJj8hIuPSN05gfFg2d157jUoLt64mE6lLWvlW7Xmft84+VONOCcCAqWw6HMlqR
         OMKeMVFjhw55rIyqRf2uVKvvOdR1n/5mWp6oruJzaFbbG4tHDMbtIjXla6C6M8IgfUN7
         84A3tcq8cmz5RibzouWKgVQiiq0O51lqrBDfUcLEXdc61TuiPeXVWvNQHm+M8D+YWFJC
         DZcPRItLX6KPgkavssEFrhAjHF4ipxz2XH5rAjkFvp6oG+BnXxBK7w5XmukZJj1O/23O
         So3g==
X-Gm-Message-State: AFuF++lhe4eqnmxFFRaRxx+KDTjfzErMvxtd9eN/nxJ0z+MBXQMDTKno
	2ZIi5eg7RZbFsK6OZlwJVNwUy764UjhO063yF7SG3R43RcxOz0UIHci9iqNIQlYX+2ON77scJeE
	u2GjGxRYHK7PAdJvQDjcjBXPl0bzWOr9kICk5QLUH91dAOwxajVkRosLNLS/wvDJIWvSH/USZLu
	IhSWJVwQ==
X-Gm-Gg: AYBFou210mSwMWL46QB/zaySWzW30DTCzp7OHlxfv5MXhqy1KUXFSmFVvMKSga+/9HI
	1mi6pgXiND65HppRFR+8bbPC1XswRixfxlKr0MnU9TKVC6WfxOOMm2FpkPgaTaV2SpEbEH+pQaM
	ptYtZG8t3qmbWstdLLyYzKvVTyWmGjeOGC7nSYKrXpojRIV5CKh3RHqncUS41iLrO2W7Pdo++ny
	cDgAaJsBCtUFsc0UrsHtnzMFm9nOgNGnsw+za/7FxZr4MXBYUbXTfiQ+jRHoq/779qH7+ioK4HC
	QoENuHWk2B5LFX4yXTdT3HycmB9VUez/kDTBIG6WaF6T4cgPFeRNSAgbzlZKZklgxn+C9Dm/SQX
	xqnXS6msG46kJwYWIu+JJtlzSTgh/Qj8Gvw2Cgyq8BG58fvHq1zYR5B+6M4+vvJDLcuPyhcxTER
	MYnyCsVl/VWfO6
X-Received: by 2002:a05:620a:628e:b0:93c:8544:6adc with SMTP id af79cd13be357-93e9b76c7a4mr1088660185a.18.1791467560577;
        Thu, 08 Oct 2026 06:52:40 -0700 (PDT)
X-Received: by 2002:a05:620a:628e:b0:93c:8544:6adc with SMTP id af79cd13be357-93e9b76c7a4mr1088651285a.18.1791467559710;
        Thu, 08 Oct 2026 06:52:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcd30833d2sm1274813e87.42.2026.10.08.06.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:52:36 -0700 (PDT)
Date: Thu, 8 Oct 2026 16:52:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 03/10] drm/msm: release scanout framebuffers only
 after a vblank
Message-ID: <ztvgomgdl7hzfhwf5z5llwlv67246brexy2mfblb7nnixvuij4@agaiyj5bfys7>
References: <20261003-fd-kms-fix-smmu-v4-0-2a44d4d8ac77@oss.qualcomm.com>
 <20261003-fd-kms-fix-smmu-v4-3-2a44d4d8ac77@oss.qualcomm.com>
 <20261003013429.DF7271F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003013429.DF7271F000FF@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1NSBTYWx0ZWRfX42ggd93PkUd3
 1Fgt+KfpOOmGS0SSqhST8vNs8RTYmTAGFXx1X76T/q+EpRAvawKlmztPHekugZjdKdVgxg+diQ5
 O+Q44RoZXfSkz/b7NjrtNe+FS+GTSxvZuVQpkDZaNAYOIswpD5jzfaJjCKekJiFzTbkusqVgfhN
 gT3sZywIloIFIl7qsgzdrlzTN3iJvWXJwywqWyfEj17gUnVPVfmXDJ+sSj+vZlY0t1qPI01LXVZ
 A7r9SXfGBHLFpUyAijOOIyDiRAnYfrerbvSKYUqxX9UJ+mHxtHjXQ6+XZYhbpp5BGVoLK/bLFVI
 nbOY7jcYy3hDqDC/t7SRdQ4kfqpBIyrV4xQIt0QgW+7p7XDu5uiFjdsamL3MwC7LdtnTA8fuyVf
 S4DdK4rUping9FG2dTDk889Q586Ck339RYbien4KMpmq2SkPyUQ3jkbw3LhDWf5veLdbaGfZJQK
 +Gcjp1kaAbwsJ62pmwA==
X-Proofpoint-ORIG-GUID: x09GVqU_IeLnX1h4nbwZlPmUdeNUAeuj
X-Proofpoint-GUID: x09GVqU_IeLnX1h4nbwZlPmUdeNUAeuj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1NSBTYWx0ZWRfXyJQEkdrcv68s
 cQPyzdcGk2E/YOTF1uKFkGAxQfoBJXbzTBPEcvt0oy72FknCKNyyJHHFF+SmakalnP/EmHAw7Cs
 vV8yC0SrANz6WDgpBRon/4uHWps3Tyg=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac7a029 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=G3YaYXDeKChVjLYJJ7oA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080055

On Sat, Oct 03, 2026 at 01:34:29AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] drm/msm: premature unpin of framebuffers causing IOMMU fault
> --
> 
> commit 86394032733ab2293f0e387866c3cbd603bc3285
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Subject: drm/msm: release scanout framebuffers only after a vblank
> 
> This commit defers scanout framebuffer release until a vblank by handing them
> to a drm_vblank_work per CRTC. On CRTC disable, pending works are flushed and
> framebuffers are unpinned directly from msm_crtc_vblank_off().
> 
> > diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
> > index 7e1df472592d3..cb497d419ab83 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.c
> > +++ b/drivers/gpu/drm/msm/msm_kms.c
> [ ... ]
> > +/*
> > + * The crtc stops fetching here, and with it the vblanks the pending works are
> > + * waiting for, so release the framebuffers directly.
> > + */
> > +static void msm_kms_fb_unpin_release_all(struct msm_kms_fb_unpin *pending)
> > +{
> [ ... ]
> > +		drm_vblank_work_cancel_sync(&unpin->base);
> > +		msm_kms_fb_unpin_release(unpin);
> > +	}
> > +}
> > +
> > +void msm_crtc_vblank_off(struct drm_crtc *crtc)
> > +{
> > +	struct msm_drm_private *priv = crtc->dev->dev_private;
> > +	struct msm_kms *kms = priv->kms;
> > +	unsigned int idx = drm_crtc_index(crtc);
> > +
> > +	if (kms && idx < ARRAY_SIZE(kms->fb_unpin))
> > +		msm_kms_fb_unpin_release_all(&kms->fb_unpin[idx]);
> > +
> > +	drm_crtc_vblank_off(crtc);
> > +}
> [ ... ]
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index 77a2d1f6700d0..35daf46fc4257 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1213,7 +1213,7 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
> >  	}
> >  
> >  	/* Disable/save vblank irq handling */
> > -	drm_crtc_vblank_off(crtc);
> > +	msm_crtc_vblank_off(crtc);
> 
> [Severity: High]
> Can this lead to an IOMMU context fault if the display hardware is still 
> fetching the frame?
> 
> When a userspace application issues an async plane update followed closely by 
> a CRTC disable, the ongoing hardware fetch might hit an IOMMU fault because 
> the memory is unmapped immediately during the disable sequence.
> 
> Because msm_crtc_vblank_off() now synchronously unpins and unmaps all pending 
> framebuffers via msm_kms_fb_unpin_release_all(), executing this before the 
> hardware is done fetching creates a race window.
> 
> Looking at dpu_crtc_disable(), we wait for the hardware to finish its current 
> frame fetch much later in the function:
>
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:dpu_crtc_disable() {
>     ...
>     msm_crtc_vblank_off(crtc);
>     ...
>     if (_dpu_crtc_wait_for_frame_done(crtc))
>         DPU_ERROR(...);
>     ...
> }
> 
> Does this sequence leave a race window where the display is left reading 
> unmapped memory?

I think it is not a problem: the atomic helpers disable the encoders
before the CRTCs. dpu_encoder_virt_atomic_disable() waits for the
pending kickoffs to complete and dpu_encoder_phys_vid_disable() turns
off the timing engine and waits for the vsync which latches the to the
hardware. For the MDP5 driver mdp5_vid_encoder_disable() does the same.
After that the interface no longer fetches when dpu_crtc_disable() calls
msm_crtc_vblank_off(). Any async update is flushed by ->wait_flush() at
the start of msm_atomic_commit_tail(), before the disables.

-- 
With best wishes
Dmitry
