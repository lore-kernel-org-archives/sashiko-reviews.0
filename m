Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B993B6356
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 22:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781563340; cv=none; b=fjdKqx9/25f1NbdViViVeqcZ+JGfWWMV+6vW38Q1cyFqCIY5Ypg9yFIRj0S7p/yh0S0jDbNdbs4JYTVEyJwsYF31aRXElOvUfcKFU/gEPTbbfdo/kRDojzBEg3vLGsQhWNw9yRyShxUZD/oWmffgyeXyX5KwRm3LmGg/7EWZ5uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781563340; c=relaxed/simple;
	bh=bSn4IF5SXIoyf657ywaHvXslqafduIay3JjIzHM+EAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XvcXvEovR8ohDPTMCehdmgX0W4QY7gXt4+9XA22oeSDR/lwrFsutQO1LJcqUvvreHn8bK8D5pVZ/EKhR/U5g7iffk/93tUx9r0pDhkFPdOmv/S9RECF2kNvEz5aLSNT+BgkNKBnFERFYLqUFQ00Ux9arxKqSBDTw9VNFFqIpSY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=coj3dEIM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AoLPkyf7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="coj3dEIM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AoLPkyf7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx7d0861025
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 22:42:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zHE3dR2u6AwWN2e/vCgwqj+r
	w4dt77oofxvwtyZmHYk=; b=coj3dEIMglK8jz1O9wLV3JJ0V9KohF9ZN1N74BiJ
	ysauhdGXYwQ8SUaQ8TNhE3gdj0edIvUbk/naMKCS4/ZQk8Lx+iZ+Ck4Tuy3qgk5H
	A5kK2rPaZQIr4gVKBuNr0jymfDWrVwtk5m9ct1OUTppkzeAbRwwAt+dKiHfHTbOn
	9FUf1KdbzRyg+t0uL7nLM3OvN4bA+niLjcO3eI7n5ZyLlmzsLiEibPX9NujF4a5T
	QZrLTHbhPXyWPK+CBL/LZmoAzXvt2sHwdl2CuYi7JqW6ZLU+sbtRPfS56r9a2mpv
	FX1pU4Kc30myhfCh9/E0TuqYDZd8QmZffAgdffvu8kNLhg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteydbbgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 22:42:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccd51bc2f5so86212776d6.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781563335; x=1782168135; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zHE3dR2u6AwWN2e/vCgwqj+rw4dt77oofxvwtyZmHYk=;
        b=AoLPkyf7NVj0yLBl2DpLDK7A2GW6FvXj5inkkytaUVvCymf81AuAXerUqQ2qArSwsa
         dpcdvbb0fCza3e9eyLvkG1nv4ae5Asa9rngQfKbe5PeRpqF10gbtxfy2+7zUQXwXun0E
         WR4k2JzAusA4Gro56ylB0P6uEX9USPEl7fohi3dqFxPF8wtyjxeZz26fa0TBJBlNUGQA
         1rrdZKiAitFYyY4Kiq6/LEBz7irH0bbZVPjAR/vQxzpkC0m6PtCWInRtcxLu6daIhV0T
         x7ybLiYEvV/aPMWCQHxBj88hns3Vn30riGp35HaD/nQ3GkOH0lPxTVRpjnQ3BAqaT9A4
         /Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781563335; x=1782168135;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHE3dR2u6AwWN2e/vCgwqj+rw4dt77oofxvwtyZmHYk=;
        b=po30joQQKLK8/AGl8wUXIVk5oZWmvTT9oS9T+eA6d5lwRLvAy2HM5PdeAYTv1+cQqa
         E/xY5IV27WKdmQGSlriEhlZ5PPFRPQEobQ6en1rN+pG1W0CyShojkC9It6NyOnUC5pr1
         fg2oSNhmNso7o30Vlb0KebqLl6Lm0kHJFBZFPMk6wWGBQgmm+WDUKcS2e1a++vNRTE5e
         HznH/kmwSYQcquVfzGA3uo0OOkmK3thXM8fweykLvpS4E7gSOflnX8OZq0Ej/lvwwA65
         iuNV6Vy9lGvPyuRc8hkFEyOznCSJfdrr+jVjsdqszOIf3EfNFR8G5MmUbSC3qWhE7ant
         UwjA==
X-Gm-Message-State: AOJu0Yxzupm5rKj0GAPT2jPns5g7XDQrvNPcW2bsrLDKKFun0oZqrxbs
	BskEZSk6rylE9yyjOJGdJYzbVKWr24H0kcj9zQ8N2lVjWYReyq183IVCPaNM7Ert70bAxWktKVd
	kY1L6WxOSOxeLEFn1V470KYjqJVHJGDTvgyjQ8zpMPQulVMDFdQBmFmZXpD8gdMpZhxe+i+hs38
	l3sJQ=
X-Gm-Gg: Acq92OFeUThBNOEe2IYJLW/T4n8EikvsIqsoHic32x09ecU4jj59R+A7pKTJgISu9xT
	gFP92BH3SERjKSuxy+BsksMP/bcjnVHNYujwHuYFGBmE0wvf/1Gwvdfwan0SLm4Uqxv2dpw8Lyi
	OJS66spBnUbudB86f5VXGHCHFumJpGG7N3m6C5vc2RautIAD+Nk5cSV/kHJhu+RP/wut7+MbeNO
	NolWvZ1ZPfSGlZN6iJereAcQRxC3jd+aKQGjlZn3vu5M3q6J2UThY2ofuN3SVgriIv5B4WutK6Y
	HV239QOlc9/vIZowXQg4vjqUZLNUxsxWs4zxToH8o78Qs7DQfXE8znjIv5kWEi9bxGyFZfOgPOU
	S4zOve7RPvOgz14yeUp5Xy3cbgpi2zG6xc4cjpNKxva04noJjXUGzqPQ9nXfQosBeYYSBjOaQSs
	UcFI0Ril0wfWGA/Rq4lg0bngN8eutBzuvTJK0=
X-Received: by 2002:a05:620a:2945:b0:915:d322:c47b with SMTP id af79cd13be357-9161bc4b5ccmr2472984785a.13.1781563335111;
        Mon, 15 Jun 2026 15:42:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2945:b0:915:d322:c47b with SMTP id af79cd13be357-9161bc4b5ccmr2472980585a.13.1781563334472;
        Mon, 15 Jun 2026 15:42:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3995c059bb8sm2169691fa.10.2026.06.15.15.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:42:12 -0700 (PDT)
Date: Tue, 16 Jun 2026 01:42:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: John Harrison <John.Harrison@igalia.com>
Cc: sashiko-reviews@lists.linux.dev, dri-devel@lists.freedesktop.org,
        wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v6 3/9] drm/amd/display: use
 drmm_writeback_connector_init()
Message-ID: <eieq74qmqkkrgovktpon6umq2an3l6xmih2gqxjqtawmtvnesl@zpxepcxb3hm6>
References: <20260612-wb-drop-encoder-v6-3-9f3a54f81310@oss.qualcomm.com>
 <20260612185828.C0D241F00A3E@smtp.kernel.org>
 <e98e6632-20a1-4e76-a6e5-916066c7438a@Igalia.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e98e6632-20a1-4e76-a6e5-916066c7438a@Igalia.com>
X-Proofpoint-GUID: FIoqQ9o5uSQD6gEAxQx8xo3Aw1fLPXIv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI0MCBTYWx0ZWRfX0UnWi4tsEnH7
 GVrDghM1jkCvmm/7mxtSzeteELa3N+gmIylbxiPndgappiRtThJptAnc+RPCvjd/f9GLBnfaCDa
 /vJwGSPaAoprsoA1CsgbwX8YVdP67Uc=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a307fc8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=MhOIpkx3JouqtUk9ItIA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: FIoqQ9o5uSQD6gEAxQx8xo3Aw1fLPXIv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI0MCBTYWx0ZWRfXz8z0XrXBYXNh
 FEjrb7w+ET4JNzra+OH0G7iFew27Ne57QGe7aN6e0RFVNGgEk57hUEpR2srrx8oaYU6orIy3eMa
 LYBibnXlN6aeu93zSI7d2pYpLQAoa3UzDywlFg+2KjLHqsX2TTur0/8WxLi5EP5kXnyocJLwzap
 m8Z/S4k+RbYNHi+6WZnCA3ZbLxMEXJdCtgfxWZaypqBtm89Fu+j/CsO6GZ3/c2mA9nmjblG73Z5
 rWn2e5qffSaH+jLBxldfxckGXohfx0imhVnp59WkcOwikb+qu2l9V/9KodYYQ/jt+hHzTg05wXS
 J0mFYQ6Zb3x83s6s0A11q5YUnPNppdDbSG2ElUpPzX+08Nho2INcVPuqSaUKwvrh6yHeLeqJlPX
 tVauEV95PvqzsbjOYJ7Ru0muQRqrDnlj38alVeKc4y/6XfeyBHZAPDXVDjtTlOtwHyz+To+NcWQ
 7GRBWpsns0nCyAtk1Hg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150240

On Mon, Jun 15, 2026 at 11:27:12AM -0700, John Harrison wrote:
> On 6/12/26 11:58, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > 
> > New issues:
> > - [High] Dangling drmm cleanup action on writeback connector initialization error path leads to Use-After-Free, and possible build failure with drmm_kfree.
> > 
> > Pre-existing issues:
> > - [High] Pre-existing memory leak of `wb_info` and sleeping in atomic context in `dm_set_writeback()`.
> > --
> > 
> > commit 946e1af8401710237d25526b5d87b4357eceb542
> > Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > 
> > drm/amd/display: use drmm_writeback_connector_init()
> > 
> > The patch converts the driver to use drmm_writeback_connector_init() and
> > drmm_plain_encoder_alloc() to ensure proper cleanup of the writeback
> > connector instance and its job queue.
> > 
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > [ ... ]
> > > @@ -11086,7 +11086,7 @@ static void dm_set_writeback(struct amdgpu_display_manager *dm,
> > >   		return;
> > >   	}
> > > -	acrtc = to_amdgpu_crtc(wb_conn->encoder.crtc);
> > > +	acrtc = to_amdgpu_crtc(crtc_state->base.crtc);
> > [Severity: High]
> > This is a pre-existing issue, but does dm_set_writeback() allocate memory
> > using GFP_KERNEL in an atomic context?
> > 
> > It appears that wb_info is allocated using kzalloc_obj() earlier in this
> > function, which implicitly uses GFP_KERNEL. However, this function is called
> > from amdgpu_dm_atomic_commit_tail(), which is an atomic context where sleeping
> > functions are forbidden.
> > 
> > Additionally, dc_stream_add_writeback() copies the contents of wb_info by
> > value, but the originally allocated pointer seems to never be freed before
> > dm_set_writeback() returns. Does this introduce a memory leak every time a
> > writeback job is queued?
> > 
> > >   	if (!acrtc) {
> > >   		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
> > >   		kfree(wb_info);
> > [ ... ]
> > > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> > > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> > [ ... ]
> > > @@ -188,17 +187,26 @@ int amdgpu_dm_wb_connector_init(struct amdgpu_display_manager *dm,
> > >   	struct dc *dc = dm->dc;
> > >   	struct dc_link *link = dc_get_link_at_index(dc, link_index);
> > >   	int res = 0;
> > > +	struct drm_encoder *encoder;
> > > +
> > > +	encoder = drmm_plain_encoder_alloc(&dm->adev->ddev, NULL,
> > > +					   DRM_MODE_ENCODER_VIRTUAL, NULL);
> > > +	if (IS_ERR(encoder))
> > > +		return PTR_ERR(encoder);
> > > +
> > > +	drm_encoder_helper_add(encoder, &amdgpu_dm_wb_encoder_helper_funcs);
> > > +
> > > +	encoder->possible_crtcs = amdgpu_dm_get_encoder_crtc_mask(dm->adev);
> > >   	wbcon->link = link;
> > >   	drm_connector_helper_add(&wbcon->base.base, &amdgpu_dm_wb_conn_helper_funcs);
> > > -	res = drm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
> > > +	res = drmm_writeback_connector_init(&dm->adev->ddev, &wbcon->base,
> > >   					    &amdgpu_dm_wb_connector_funcs,
> > > -					    &amdgpu_dm_wb_encoder_helper_funcs,
> > > +					    encoder,
> > >   					    amdgpu_dm_wb_formats,
> > > -					    ARRAY_SIZE(amdgpu_dm_wb_formats),
> > > -					    amdgpu_dm_get_encoder_crtc_mask(dm->adev));
> > > +					    ARRAY_SIZE(amdgpu_dm_wb_formats));
> > [Severity: High]
> > If drmm_writeback_connector_init() fails internally after successfully calling
> > drmm_connector_init(), will it leave the drmm_connector_cleanup_action
> > registered?
> I'm not following this one. everything that drmm_writeback_connector_init()
> does has a check on the return code and only if everything works does it
> register the cleanup function as the last action. So how do you get a
> dangling anything?
> 
> > 
> > The caller, amdgpu_dm_initialize_drm_device(), appears to handle this failure
> > by attempting to free the connector using drmm_kfree(). Since drmm_kfree()
> > requires a dev argument, will this missing argument result in a build failure?
> Bizarre that it is complaining about something in a totally different patch.
> 
> > 
> > More importantly, since drmm_kfree() frees the memory but does not unregister
> > actions, will the managed resource list later execute
> > drmm_connector_cleanup_action on the already-freed pointer, resulting in a
> > use-after-free when the DRM device is torn down?
> Isn't this just lying? The whole point of drmm_kfree() is surely that it
> does unregister the cleanup of the allocation?

The question is not about freeint the memory, but about unrolling the
connector registration. I'll take a look later whether Sashiko is
hallucinating or not

> 
> > 
> > >   	if (res)
> > >   		return res;
> 

-- 
With best wishes
Dmitry
