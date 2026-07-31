Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E75F3C1D62
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 14:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785506735; cv=none; b=NgPiqwIriG3y9Xj5wDiO4H0cNrapDIp7Y2uvdmJuRMdQKC5Qa8tubrt7Z5BJu2nt7RMny9so3WHgjhVaAsdCcd2W6UxMLCyZqqBWYFHcHKIlAzxrZZ/QnC469ltUey5rq50QiUZTnDNsmG+8oDKNl3uP+bDrcpU6vfEBVMlJ9Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785506735; c=relaxed/simple;
	bh=098HrdB4qj3uWEtOns0NoI33Krb2EhPBbTVdca7AS/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uy/leSSYuN8DF0fUwvb6qWZjMYCZaoc8Kg7Liw7Mvcsv/hWW4NBmF4S8R8aC24VALBgBAne9KhQvO5+8ix3Rwd++dUbDVAVhAYjpvVXgITFcoPoDohCQd0sx9AWO8Zx8YNrMXXdPUTiREBE03snQ4IVQY86EldwtEq1adHS+u2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxoqKk6u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yygx1WuJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxoqKk6u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yygx1WuJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBd7ls4185706
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 14:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	343B1/3+b4zF0oyHAPXPcWl8rg0MW19SgLHKxpdb+jY=; b=hxoqKk6uLhpYiQdO
	yECxHJ8rxjUyhccKYseyFK+80rp9j9fJi8vQLuUeeeotQpO7xWDeZSTEBrBFLBLP
	zTakhBMrKC+ZNlUvL5ksYm7QwV/gQUEhCN1mU1MnTXaW4lEjQomgJYvyt/macZGX
	vZXq87Ja1x4OYHEd+2bDilg+wXJoon3/AkjGPidwFEygdCJQINfeniHgvaSGVFew
	AdNF5SR0DX1Pz9WmrhruMvpaKv4aCMCxhSm5iuJVHfQ8YN8lyLXtEKND4yR26NB/
	/OKzEub3IRYZwfLP0tSRl+3d0mXln1Ruwzgr+xKeivmV7KcjOqhIjA/gy84IB9UU
	B9RNcA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru130krp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 14:05:32 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-977dbf3b62dso65244241.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785506732; x=1786111532; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=343B1/3+b4zF0oyHAPXPcWl8rg0MW19SgLHKxpdb+jY=;
        b=Yygx1WuJmstML/ccpD1S9eTACT0OjCAwK8O4+09CZaby+/jUstHHru8RdOdojgVCgD
         ZLkohbpjAgho3P+DUtViMcpL+JIulyZl5CqS6YSnIvxPPbdgZzvCqj3itM7dtEshco/k
         YbUjpeoLbw9aZilbu02Ylv9k9F+3OdDD7hj8M71Oa/EAAuT7Xv1K1sFO5FFqPawWxMHW
         7WUFdJiWyxzTec5nbq+jbQlDdZmkmfB4J9444fUdb3dLhqRI2Pc5Z43cOvOcgiKgCfj4
         78zV51Rrr9uxTXit2SMdFTXkIY9FusPp8nSJno4xupWDdacQmcXPhCVYMrFpfzKfEAnc
         LcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785506732; x=1786111532;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=343B1/3+b4zF0oyHAPXPcWl8rg0MW19SgLHKxpdb+jY=;
        b=mvZYW/r8g95cNAoRl/H2pe5r/x+dttQfS2oSWYqiNjuKUHAzbGw8fxoxrk1SoDrwrU
         RJGKL82g3TUIrV2/Af3bdYlPHKrP6CLYYyha9rMOY4dMEHdxCV194oDnaVWeUerTGOz8
         btcnCW8mRid7sl1+tLU7N8jL7kxRcw6RJED3XotxCZuN0w7K3WPHAOm5j66tRaOv7f9B
         zglqudhPcEWwi0iCq7EuIMWqGNUVaKCqaa1xqG7T7mHDNHvuqVxK4zyEpb08sZcl4kQV
         V/eIIjlBwIP5GxPSGJDXoI0WlhzkJCCtBajLHh3vmac9BAySk1EkGdKRzprE8vcRL8kF
         bvLQ==
X-Gm-Message-State: AOJu0YyXg4qq/JNZGIfxjQjym4YTe5/RdHciHBYy4a+3raYBBml5QlZy
	u+6Azw4tujMa+riye5y5YlqcFfK0PYMkjL+VlMpe6tBc6kwDhnxGdPvlQ/h62McDMYplS7XEbjH
	/8zzkxfxlM4p+CN5zMlUToE9ERjr7FRkvLGmlS5Xm8iPZJU86JNXybXU8hOKcrys8GavfmSi2cA
	GIh5s=
X-Gm-Gg: AR+sD10feQeu8Tve3pN3U5oYMrp6PU1qJCJEyiLmfmxYOqrfS/ogUxRs5DjQ5yRsgso
	HG8FJms/xog5AlQF8z820gWpTnQyQ8X8TaO+3WSP4SIaZIYK2tPP0dzTE3znUvXfApWjSY0KsKn
	b3lMBvumhKpubcmGPTne5HYXwFnmOM/12ae4m0sbIyNKvquaBtJcLHBs9HYTD6uapyEzQnXb+2a
	P2FxqeXAjXWCwxM7tIrPr2QaKOFpZHcG1pp2zSoInmC4xWAWgO8Go9Ko/ROQnxrw16g37LfVNOA
	BMG15eJrraCV+++BDJ1MtgRw/g5lshlbB+oEankrG4Of7MTP53m99ZOsF5Ug/QQov7pAru/5wuu
	SBJ9uBysR5v/C+zVSFOf87ILfurMvUp4hwfDtGrN4mZPqQEhuEbPO9u9/RDsAn1XGXGpO0YhwmP
	OKVzoRCD34bGaEjA==
X-Received: by 2002:a05:6102:549f:b0:73a:128b:ea07 with SMTP id ada2fe7eead31-75b23a635f8mr167394137.14.1785506731612;
        Fri, 31 Jul 2026 07:05:31 -0700 (PDT)
X-Received: by 2002:a05:6102:549f:b0:73a:128b:ea07 with SMTP id ada2fe7eead31-75b23a635f8mr167332137.14.1785506731103;
        Fri, 31 Jul 2026 07:05:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f810dc89dsm1229371fa.12.2026.07.31.07.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:05:28 -0700 (PDT)
Date: Fri, 31 Jul 2026 17:05:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>
Cc: Yuho Choi <dbgh9129@gmail.com>, dri-devel@lists.freedesktop.org,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vladimir Oltean <vladimir.oltean@nxp.com>, Kees Cook <kees@kernel.org>,
        Dale Whinham <daleyo@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/msm/dp: Disable stream clock after video-ready
 timeout
Message-ID: <ka3af5qc63pdcvh3uf6ulb25wrsf6udjugm62ooxuscxvz6zhz@mbuivewege2k>
References: <20260707175212.412699-1-dbgh9129@gmail.com>
 <20260707180553.78C7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707180553.78C7F1F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwNyBTYWx0ZWRfX0rYL5uuBPIGD
 6li6xAUIAiIKnhtlLz0/J+IhQcThVhqC0LmcLu3O1Yzpxi7IRaEPo2Hy3OEkBGnXTUIZEvvNfo5
 r1XWVrlANvq9h6RkvKg2UzE5cOfWTag=
X-Proofpoint-GUID: DqfWYZ-m1xWgaP6vPPtESLX98oou0EgC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwNyBTYWx0ZWRfX344ABUxmTc3M
 lo5gmocQsH17R9FsJczxR3RKSoOHSVRJp9irXOlOZUPTh0s3CMvSfmZAL04d1MjZ+kCwNRxm0jD
 8t0QzFVKp9UqvEjCc1W/sO4Az6DqumfJU4bxlzCJ5sDbhaTVZvUKuJ/lYYUPzTK2A77tUW1eMlJ
 KHgrAX6uYFSvatP6wiA6tm7KcMx5c/AmICpEHfhFfYXAaXcKe0QQ9qz4ORzvVasPGCic4l/YtTQ
 cgfDBOQ9Eyo7N6/QFpTP1+AXAHLtXlyphx6LaGxcF6NccnFKPRTVEJUpy1yO9hyo6yzc3Mg+vLo
 VM0lmhCpV0JXGleej+oyc5yEIyLPh/6z00PPfzSKP/tSoaUS+7334FKsxnteo9eZgmBUhuztzZa
 /p4rcG/huxyu7MP8GNEeaGR3LGgi5mkoq7c/T5II1UsYQ7TOWSIITfpRQiY0BFKo9w635vY9fu3
 4OwnL9Ec9xxRUsfzWuw==
X-Proofpoint-ORIG-GUID: DqfWYZ-m1xWgaP6vPPtESLX98oou0EgC
X-Authority-Analysis: v=2.4 cv=CYI4Irrl c=1 sm=1 tr=0 ts=6a6cabac cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=c92rfblmAAAA:8
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=YuBhx4MO3GsoJQDmrn8A:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310107

On Tue, Jul 07, 2026 at 06:05:53PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Disabling the pixel clock while the DP controller is actively in the SEND_VIDEO state violates the teardown sequence and can lock up the hardware.
> --

Could you please comment on this Sashiko comment?

> 
> --- Patch [1]: [PATCH v1] drm/msm/dp: Disable stream clock after video-ready timeout ---
> commit d51f59f75198361a5116081d3f135fd586dbcb66
> Author: Yuho Choi <dbgh9129@gmail.com>
> 
> drm/msm/dp: Disable stream clock after video-ready timeout
> 
> This commit routes the video-ready timeout path in msm_dp_ctrl_on_stream() 
> through a cleanup path. It disables the stream pixel clock and clears the
> stream_clks_on flag if the clock was enabled during the call.
> 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index 86ef8c89ad443..139e9fa25d6a7 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> [ ... ]
> > @@ -2543,13 +2545,17 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
> >  
> >  	ret = msm_dp_ctrl_wait4video_ready(ctrl);
> >  	if (ret)
> > -		return ret;
> > +		goto end;
> >  
> >  	mainlink_ready = msm_dp_ctrl_mainlink_ready(ctrl);
> >  	drm_dbg_dp(ctrl->drm_dev,
> >  		"mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
> >  
> >  end:
> > +	if (stream_clk_enabled && ret) {
> > +		clk_disable_unprepare(ctrl->pixel_clk);
> > +		ctrl->stream_clks_on = false;
> > +	}
> 
> [Severity: High]
> Does this error path leave the DP controller in an active state without
> reverting it before disabling the pixel clock?
> 
> Earlier in this function, the controller is programmed to send video:
> 
> 	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
> 
> 	ret = msm_dp_ctrl_wait4video_ready(ctrl);
> 
> If wait4video_ready times out, the code jumps to the end label and disables
> the pixel clock. However, if the caller ignores this failure and DRM later
> disables the bridge, the teardown sequence will invoke msm_dp_ctrl_push_idle().
> 
> Since the controller was left in DP_STATE_CTRL_SEND_VIDEO but its pixel
> clock is now disabled, could writing DP_STATE_CTRL_PUSH_IDLE cause a
> timeout or wedge the hardware because it cannot process the state transition
> without the clock?
> 
> >  	return ret;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260707175212.412699-1-dbgh9129@gmail.com?part=1

-- 
With best wishes
Dmitry
