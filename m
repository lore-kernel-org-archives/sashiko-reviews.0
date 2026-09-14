Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9948249EB
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 00:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789345393; cv=none; b=K8UG9rqIKhXZ7UMphS7j4y+ycZ7AWYDDZFdArwFDNNoMF1FWLlKGPwDCX/OH51xh47o/hfc0gVaVI/DA/qHE9EYHPmk6SnRMT6tiewsX7Z/KRZLkeHYGhvmgGemj7hICi/WN2Pjw3Mhp1lQtn03DtqnSKcU/cV9nzHCCfmilafs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789345393; c=relaxed/simple;
	bh=N2KT+u7zDxDLNALcHN4+P5ZfAolX9jFrccbtjAXVsb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CS1KwU804G8xZ9KwxWiBO5FshNdt1d6Sh/ylpucEGXNhaUrB7lqelG+6W2MhmR5ABhAIvzyJviXi8IEdr/xrAvVYeADZnqZaKAYGsrBfteakjVWU7XaV2at842CvYWx+mRqqGW0/FdjPExXHfFQbE5AcVWLGNBFbwWxiAu66e08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nc1NyrIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eBKl+WLm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nc1NyrIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eBKl+WLm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E06k8w3132230
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 00:23:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l5ZzPJiPFJ/GEHid7mJTuEMsndjVp3V0ZBZ/Jv+w/xc=; b=nc1NyrIawIRS+IzH
	+tk/JTasnE3HNO+NnNmK7CUBEjhmsfi68N2GJ5fJ6ElM1TsTByVfan9eU4frPcgC
	65Rz5Wv06AEx2upIlfEuraYNHcpTeK7I2bzTYsZLsSkOjLwn3bEjyWffUg+uLyl/
	Ajl5VBPsOz+SxDumVWEzbTeafJI44JHevSe5fB5tjTtJjyw+2ab2O5dd5WRQQg/Q
	zJzNK4ZpGm/2zp4HUGeAaio7hTnlVxQqrRrL4PHNcjPVTTJ2EpgNTWQrr36feCXj
	XqyyDy/vK3A3kLGt5cjw2I2x225nsI7OaaOBm6EWs+MmyNYPEjkboz4y+DVEGcUW
	Ov6xCA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c4ef6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 00:23:10 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c83007a11cso709183e0c.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 13 Sep 2026 17:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789345390; x=1789950190; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5ZzPJiPFJ/GEHid7mJTuEMsndjVp3V0ZBZ/Jv+w/xc=;
        b=eBKl+WLmq0xD/JpvF7QOS5gxSEWoklnDNFmT6/cSYcnmb47qidzLzfGHx4NK+rctIa
         /Na1QkWpTHeUcFMwk52PZZK4WGjTU8PBelJkA4os5i024PArYN2EMsJ5tjjHtK8acawP
         AiiR2oERPEiyMDPssuVueLeXLxbeN8RKRMu6utaiBdaMOEKGp39qCQjGCPdUJeMsgg2I
         tffluKaPUOvOzx+JOyAqQjKUI7emzaEKBZNPMmpeZ/B7pkvwbgLgsXR9GQdCMBmjAUhq
         BmNypmQoMvaVGnLhSOMPMYU40GRjfhhrEBZJtCx38iGiTCCvthTbBOhSt7u026r/EI2N
         0/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789345390; x=1789950190;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l5ZzPJiPFJ/GEHid7mJTuEMsndjVp3V0ZBZ/Jv+w/xc=;
        b=sgXxDV8II2dyZIBwqnqmbLBepTR7T7dZXtx8QxAqhYQWOiDmQIV1LfhRpYnEy6nDWz
         mlQSEtsWXzvV3HIXZO7I8SY1tzz5/NOdjFekoR7+pMknP6Ucb0sdnpOCq5QhP69t0RjK
         38on7NTKE7kE/q22uzfC05r2DSoDD6SF6gRV5LXTPo0ZvSDdOYAqMiQB7iGbJhMoVrxK
         8ig13HoHM2IQbDAkxQURctm+BlC56CoYJ0OR1RpgUOFeJPwhetuliV+w/DB/aL6S6gFC
         zhKL3sRdmg4wr7u3aAuw9SF2cCZZY3vJXdtlrHzTcVHzrhmXwOSk37GgEGoz6W4ANDwM
         i9Sw==
X-Gm-Message-State: AFuF++lkLlWpW84kPB3xEnziOchBA43/fZ9ZMhWNihV61M+Rllqt0DhG
	YTezAGkrqXAMgLLhmiDkxeuswa/HTYCej13eJVlELBsydK/XuHlFsI48EDdZzG+sj5QkruEh4n1
	AAtRGgD2vs8PtDN16RSH2FEV3ZC82Ay8JszAS11A+qpHKoAFU1GDKVcsMiu9DufB9jsGco4HwKl
	ycCNM=
X-Gm-Gg: AYBFou1JjOGNb7sLDlvAp7qdRcUZDxrDQ6ddB/aaYR0c3hWXINzGH++HOPLaFzCwDyO
	K0PPPh1ZUQXGk92u4x+rZHnlRru1u2bvJZnO0WsBpDoK8hNIn7EZasw2HuzGz+IAdJ/KXi6OPXG
	XGerLAGWn6a7LbTOtKzDipZQXIR2uTrKdc1GCfnCOYLXrv38l6dwX1q8trzwj3KdHGdf51frjSe
	2KQi9/T6z5lvwNCYuN4l2K91ZBXXQjweNrojipQ7t1Dazvt2KpOoivgZVoOYv9Lh1yDiHHu8kpc
	p6fg3mz14gh5y2rYMCbvSRPA23eLIhLZWeK9m5hc7yiqAmjmWFDUyUZ3oZpf1nvsfVpg94z6Oc6
	iyOCoMEcEO1KmJFbRZUQ3e3muTBWudWYfCsLU/Sp+N8br24tCNK74juXAAHPtDg/q17hD37jwxp
	4dC1H6xqA+MrJo
X-Received: by 2002:a05:6102:50ab:b0:784:b6e7:cee0 with SMTP id ada2fe7eead31-79b56df0dfamr72111137.3.1789345389657;
        Sun, 13 Sep 2026 17:23:09 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:784:b6e7:cee0 with SMTP id ada2fe7eead31-79b56df0dfamr72103137.3.1789345389162;
        Sun, 13 Sep 2026 17:23:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0461ee3sm2020960e87.40.2026.09.13.17.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:23:07 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:23:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/mdp5: drop cursor pipe for msm8x76
Message-ID: <oksemiwxoourcpn7ypa4w5rmqfa2ldes7lrwaq3rzyduy4zf6j@n5wjffpg4hma>
References: <20260914-mdp5-fix-cursor-v1-1-9fba3ace6cb9@oss.qualcomm.com>
 <20260913233843.B7C2C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260913233843.B7C2C1F000FF@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: UA2MDIC633HY48ujBb54X6Eavcn39sMZ
X-Proofpoint-GUID: UA2MDIC633HY48ujBb54X6Eavcn39sMZ
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa73e6e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JCTdk86uwd0TV-8ovewA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwMyBTYWx0ZWRfXxMvNrvtscKBN
 9487oqtgTmoatYPLCKCa5RnHQmSADLbFvB92xllvlqlS1yQ95/w4rWT5GXWQcYmbDjpdDY2070C
 W7M03uh4WTHfYLeBvdmx+63vWyFTI3S4eJG7+lbqcCv2jsg+6iU+m+W6AMQUgW3vkevfLQkiKJR
 1AN4Yi9KIQXYxt7wIkQVa0MNcZkSjrVCwi2ZGaFRImtqZR2bT2U6pmv1ay7Wd2N7IPS3bUvCH+g
 306dzzcWVS2PO8aCCot0afnLzrgIXA8a/HUJr6srsYBcinl8wleLHYK3JZiwlvunhK3JFB5e2TJ
 8K35Wpg+R8ftTYI/2/YE0ZT2JhBqOaHypppK/kBrYwiFNv31Err0BR6Bm9e3vfgxyvnUMjo3i63
 MBAhncpNqWTkLOJh2MO7/wWZy8G4GnQiBSXwGHOeVmDFYW0k0oNk3PK2DuPlg5yEqrB8GTNQSfv
 Oc7m9gkcZICgQYWia3w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwMyBTYWx0ZWRfXzY6j7JywXYvn
 ii9v0aY0oAdXFal8z11GlDR9RqSfpsVN/Ph+DOSbM/E8GXfzgmMf8bHFjVsczPDW4CZ1Kdr8RJ4
 +iH/D2DeNVhosqU4dWck34YmC7jI/oI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140003

On Sun, Sep 13, 2026 at 11:38:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Missing `flush_hw_mask` update when converting to legacy LM cursor breaks cursor updates.
> --
> 
> commit e1dbf3d7b78aa6bf44fff588ff9b069eceea7f6b
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> drm/msm/mdp5: drop cursor pipe for msm8x76
> 
> This commit removes the separate cursor plane configuration for MSM8976/56
> platforms. It drops the erroneously added pipe configuration to let the LM
> block provide a legacy cursor instead.
> 
> > diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > index 7c91fc1915f39..389d74ff75163 100644
> > --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c
> > @@ -698,15 +698,6 @@ static const struct mdp5_cfg_hw msm8x76_config = {
> >  			MDP_PIPE_CAP_SW_PIX_EXT	|
> >  			0,
> >  	},
> > -	.pipe_cursor = {
> > -		.count = 1,
> > -		.base = { 0x440DC },
> > -		.caps = MDP_PIPE_CAP_HFLIP	|
> > -			MDP_PIPE_CAP_VFLIP	|
> > -			MDP_PIPE_CAP_SW_PIX_EXT	|
> > -			MDP_PIPE_CAP_CURSOR	|
> > -			0,
> > -	},
> 
> [Severity: High]
> Since this drops the cursor pipe to rely on the legacy LM cursor, does the
> ctl.flush_hw_mask in msm8x76_config also need to be updated?
> 
> Currently, flush_hw_mask is set to 0xffffffff for this platform. When
> standalone cursor updates use MDP5_CTL_FLUSH_CURSOR_0, fix_sw_flush() in
> mdp5_ctl.c translates this to an LM flush for legacy cursors. However, this
> fallback is only triggered if BIT_NEEDS_SW_FIX() determines the cursor flush
> bit is excluded from the platform's flush_hw_mask.
> 
> Because the cursor bit is still included in the 0xffffffff mask, the
> software fix evaluates to false. This prevents the LM from being flushed
> and sends a hardware flush for a non-existent cursor block, which can
> cause the cursor to lag or freeze during standalone updates.
> 
> Should flush_hw_mask be updated to exclude the cursor flush bits (for
> example, 0xffffffff & ~MDP5_CTL_FLUSH_CURSOR_0)?

This should not be necessary. The legacy cursor implemented in LM
doesn't update the HW mask.

> 
> >  	.lm = {
> >  		.count = 2,
> >  		.base = { 0x44000, 0x45000 },
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260914-mdp5-fix-cursor-v1-1-9fba3ace6cb9@oss.qualcomm.com?part=1

-- 
With best wishes
Dmitry
