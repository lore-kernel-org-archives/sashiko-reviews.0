Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4737F314B77
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 13:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784725873; cv=none; b=h8VxXvX3qa/0kajJTQwDWzgN0vfIe2YJhN/gYXAEkWyo27kwYurrRwwoIyYM6WA97n5cAEIboMc+EWvTyxB6SeV0xg837j1MhCEvBmUS5svVmmrSVIeVmyp53krQJybYatatOTf8e0CIH7GCjc+dmeng9sUonMW/JEa4sRaaVew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784725873; c=relaxed/simple;
	bh=DTmXSzRXA98dq3iv1TqgnyIRb16DpAWxwcXNZWsFdyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joxSUu732rApRui18Ji7k4ZO0PXu2jxEfkPtxZJLbV01/jDVvOeC2C6gdS6wA6Jo5LVV/fr7+oq09r+29TEKCKgw2knR4sqYHKRyOdzYa27r6xI4Bt4VtFATknnCMekzX4NO7DxwPHdXKMQfvIhtq+eJEOUwB9HtMrl06YoMEGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ff759zIi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DB3nFuo5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ff759zIi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DB3nFuo5"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MD2BG4684852
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 13:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hNel+sH6BLQYpHqz6MzLUF1s
	CFWsXMBglCiWNwb42E0=; b=Ff759zIiXFr+0AKgsg8AcULIR2Nd9Ll3eNjanZ8l
	tTInjYN0hwb+M38DnZbFSU2+F8dropckOfxw5nMZpOSAwcwAKU9RotA1JfIAoRkH
	RJAg81gUBoml5L73DVlWcNSM1jPM/Q8p7ffaUP+WRAoggR2thQDDRg7AEaUUH86j
	HYZU1jBpE8vb8hf9/FMYbNcIgDpnLEL8ozxNMgOOZ3D7b+BUFdIbQXWE962sx8Pr
	R1SeEHXJy48bAD9N45tPRHFkL7AvFZ8D02xaGPEtUJp4rkGfmJubJn75e2qz20l1
	5n3AThYVEhEeqERhe9hCPRvloXPbFuJq8vsIPFSxvpIVYg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjnu4t8ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 13:11:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef8249f871so239216446d6.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 06:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784725870; x=1785330670; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hNel+sH6BLQYpHqz6MzLUF1sCFWsXMBglCiWNwb42E0=;
        b=DB3nFuo5JQaLcZbdl4b4EaPzmhllN3BYFXGYIFRmyt1yTdOA7b29G3iiH7cJvTgkG9
         9zq9Kv3zqM8gqqXBv/Dx+nxNWVyxB+sAHD8dHlmVFoT2dr/YaJcd/Feiti+xQ00VtLvb
         SBWVBjwzEAlrqZJkdins4kxo/P+b+MvMbvJ7qzBVG6AH8H+p6kZl04fxyU0Yeq4cmLql
         xyUjbRHD7zGiteG/nXGRSW4bUwDO7Lnmy+Dc1kdiiLTXsNSd7M3I+straoTwH8GVd8NR
         2alfNabG0ITOmmAp8QGdXoC/fbd4y22Na5qPQpWfQljx0EiEcUGBZLdKxmDJlVme3g8d
         Kgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784725870; x=1785330670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNel+sH6BLQYpHqz6MzLUF1sCFWsXMBglCiWNwb42E0=;
        b=M01MXFICInlXPJdMYQQnnLRi4lX/FgNCKrzJfbMiXDDRKkGzOlm5RVD5b63BiqNQ1y
         M0WPm9mAP6ijLERCoreqd1s+w4GkcfCZBZWJ/x2mixwUuQ166cWsk/um6E9PmVlnVsHx
         DJibfAM06RwfbbXzNsWIwsspZFfbiIx1t6YBoesju8EJE/QcdHBKQ7geVOZJ5g66cQro
         5hKXifau2VKZvFQG5hCyo9TYKwW1izZmNGERH04XaAqHh/tPyEoQoIPNO4Vud8yTRsgh
         6rza9siV8lV+FbcKG+M9pDR1t8l0uPPyjzDZtbfGhBhpA/MVazR+VA4NbOGKgDaDpPxg
         ++3A==
X-Gm-Message-State: AOJu0YwXiYScyXPC4ctKBOLCifS/MnuqT43VGMjfONsGSEKABjyOgTTn
	r5DE2WkeoTNLSdd1HpaBcLTW0YHvmxNuco1w5YG3yF8JYxFT7LNN1F4c07DDLiX14+GtLKada+Z
	cRVgzwtUNcYlSscFpyZxjqi89d4GqggAOEIqzvh3X2pFOCBt3Dr2oWyE8NkkLBErfMNoqQ8Q=
X-Gm-Gg: AR+sD11VMz7CpSSwuAWbLEkcqjK/aVnA3fXyq1clBkWK/k3UrCgd6NoCQq1HeCWVeb/
	mUIX3qJLaF0YCg9Wt6BcuxaA1Py6nYX32WAzrCWTRyrpBgGVoB/lzFdxk3avB7qurW4oUl+6dne
	+UOFkicYrMMN0eUsMaJLf2KLtm5tPcaRyBlxLQU3opn8zC8/+ULrYuF4NWwXiLAARlWDOtNLuUN
	Je/4EoLEWaW8HCzcZXrnPJbnet1kXovRZjfPfBSWD+4vqo7jCf87jFPcaqQuQl9A1ivxqjq1aSG
	4S5+JtZHeooYCmueHUvQTMMv00i0ag0w2x2eM/QwFWY6L7GUAfklttE4KN5j31fHf+EP0OL/8GI
	Gzk2NBkZ1WJgHZKBs8U5i6YrvQplRm+Q0R/ZZkdPNXiGS01NPVA2FXnWK8+hLTTSFS//SC8eMN+
	LkJZJlqGFRT35pHA==
X-Received: by 2002:a05:622a:310:b0:51b:fc67:c73c with SMTP id d75a77b69052e-5213bb216bcmr213870071cf.16.1784725869574;
        Wed, 22 Jul 2026 06:11:09 -0700 (PDT)
X-Received: by 2002:a05:622a:310:b0:51b:fc67:c73c with SMTP id d75a77b69052e-5213bb216bcmr213869091cf.16.1784725868719;
        Wed, 22 Jul 2026 06:11:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d31c8dsm457423e87.43.2026.07.22.06.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:11:07 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:11:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 02/15] drm/msm/dp: drop deprecated .mode_set() and use
 .atomic_enable
Message-ID: <i4h4amxstadjomfd6i5dkgtjdnre23ugewvlsffajfdelwmyfg@kpex2duwixxl>
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
 <20260720-dp_mstclean-v8-2-bea261bf4e7d@oss.qualcomm.com>
 <20260720063317.CFCFF1F000E9@smtp.kernel.org>
 <ldznbgwysgo4ya6h2s57wytjjhhljkfyiagrce4z2gvty5suye@bdc3gfzl7xff>
 <fccb4620-d5b2-4a49-b703-8725a863c540@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fccb4620-d5b2-4a49-b703-8725a863c540@oss.qualcomm.com>
X-Proofpoint-GUID: jAkuwz3y1tVA19sqyj2kRnslxf38okVs
X-Authority-Analysis: v=2.4 cv=KLhqylFo c=1 sm=1 tr=0 ts=6a60c16f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=pafepFX888BrzEi7t0oA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEyOCBTYWx0ZWRfX7Qk/cRvFD09o
 Lo4BSyzM7hlliXOux11QXQFbNOy+hjszDMup4ZzHeGEUwsD7tUasAWIr32rW/EmYWEYRhV8s9Wh
 nuVoNTlN81SW45KV0hPZl1nG3x4jIk+4sAildlYqRzducPEk2anMvN09KxcAJLI8KSR4PZiTqOZ
 8lDpGkldYeo2TiVi3eMnaNJOgeHARRhpY68WruP+vT4Rgv+QJSkw7TW9/+H5k/JNFMU8FZ+tfNL
 hZ+H84O/L4z2rAgHCPSBp3P5TTNwsF29kUT7bdu8At2ClkKENwNsZhlVPw9MDt54UCzKRyPXSvx
 JNe5HSZakYbuFrgDxpKDS9p1AQ7Xk96sNp83lugHLIRCYbx8/Twi25XslbDsxZm2KqH00Lm2fT0
 cEZ4ECvLoeZaMMn8w9fSsBhPd/rzhPJ0yFNoU9irdnRXmCjR55Rgtru0ZeRih4UoskovMNZs10r
 cMHIyzuDl9g3Jl4lnjA==
X-Proofpoint-ORIG-GUID: jAkuwz3y1tVA19sqyj2kRnslxf38okVs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEyOCBTYWx0ZWRfX1KmpEDniplqS
 6cchac0ieo6qhSh0YL+wv9T8z7kiUf5FUGt62NG0kwat57FpGLRoKRkEp2/LQeUWI8krTTO0Mmy
 +glly7OIRLqiHCNjkEeSo/DsQkU/wC4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220128

On Wed, Jul 22, 2026 at 06:54:56PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/22/2026 2:47 AM, Dmitry Baryshkov wrote:
> > On Mon, Jul 20, 2026 at 06:33:16AM +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > 
> > > New issues:
> > > - [High] Moving mode state updates to `.atomic_enable` causes the DPU encoder to read stale wide bus configuration.
> > > 
> > > Pre-existing issues:
> > > - [High] `mode_valid` incorrectly evaluates wide bus availability based on the currently active mode's state rather than the candidate mode, causing valid modes to be rejected.
> > > --
> > > 
> > 
> > > > @@ -1386,7 +1406,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > > >   	if (msm_dp_display->link->sink_count == 0)
> > > >   		return;
> > > > -	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> > > > +	rc = msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
> > > >   	if (rc) {
> > > >   		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> > > >   		return;
> > > 
> > > [Severity: High]
> > > Does moving this mode setup into .atomic_enable() cause the DPU encoder
> > > to read a stale wide bus configuration?
> > > 
> > > In the DRM atomic commit flow, the encoder's .atomic_enable() (which executes
> > > dpu_encoder_virt_atomic_enable()) is called before the bridge's
> > > .atomic_enable().
> > > 
> > > Because msm_dp_display_set_mode() updates the format state
> > > (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420), the DPU encoder will query
> > > msm_dp_wide_bus_available() before this new mode's format has been stored.
> > > 
> > > Won't this cause the hardware to be programmed using the wide bus state from
> > > the previously active mode, potentially causing display corruption or a blank
> > > screen when switching between RGB and YUV420?
> > 
> > Indeed, both look like an issue. Please add a patch before this one,
> > adding drm_display_mode to the msm_dp_wide_bus_available() call. It will
> > solve both issues.
> > 
> Sure. Will update it next version.

I needed to pick up your patches, so I ended up looking at the issue.
See https://lore.kernel.org/dri-devel/20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com/T/#t

-- 
With best wishes
Dmitry
