Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E73742642D
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 13:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785504924; cv=none; b=XYpo0Z/chydsLcPXdHQm2B+W/5FefCh2RooLK/4M/8wf+bTR0XEklnNlA0KggXn6LatKK1AqhstFv+Yb+m8UcpZUZIHttYTjcHyth6KLp78KCZD94ouzK/3CAhaay/dY7GK8/GQ3Vz61qe2mdoPS24ZmqUhuo9TjTk4w03APxaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785504924; c=relaxed/simple;
	bh=DcGNqmPNCSat1QJIXjrNiv9RKcb5pMEdkXr6aIPVOow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tolPkEEmUNA7JijiyYuHef7GB+6+UO52AM0YdErrt1V8yoD1+KKkvlKnV3mENPueZE3Oy65aiP+sgTwiH7krlgpybCLozFj2SJmQnVD/2z1oSyFheimr9BGNMvsO60XrwYIFqlIGuhiqXdPo75D3I1uzORvqDJMtH7LloxzN0Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wj919ht1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=faU+VUyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj919ht1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="faU+VUyl"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBelSP892289
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 13:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pUE7JydRHoj2bR2XQTZhL1X0
	wyHiUYs8hq0ouIE4owk=; b=Wj919ht1vZTBTg26b2P2nHDsmrpA5znkFKVoHoj7
	qSDn0DofSQVHue332EnFH596hBVdT6Xd+qnB4atMwtxaszsawd+D2FkczOF+tvj2
	3OBJM1meGxKqAv5TCMM6jD5KdqUVQpLtap8NglBmUGQPQiL+tessah0ZxIGYmyjr
	gemIQkrMH6j7nYv5wjOkv6uhqsLrBmAf5av0c8Gmqtvj4uoGUhXFclb4/w9hCSkt
	pAp/5J9JFwr3bC9tJp5vNf+IaPTvdSC8QEhdcyUfFdr+6UpCH+S0X28GonMz7ZwD
	5RO+YDauyVSSmFSEm88L5VbuR0PaPDoZteas3yvZrqZfPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1x8ew5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 13:35:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5283df62d68so9093691cf.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785504921; x=1786109721; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pUE7JydRHoj2bR2XQTZhL1X0wyHiUYs8hq0ouIE4owk=;
        b=faU+VUylQsICh2kCERn36tOVlSWy/E2RQBjt7Qei/wHJpo475XWWiPJNR/sMIa0a/p
         UMj7KCR5gOYjBkq5/5CP3v749s2rXF7AanyO8ldsOz560MMrL/Fog2cQpzd6jb0MGhVT
         B68rGM5jSpxFvAdWCTDUi/GsCX41jwdHvIS6Djp5jvKW7/i7pAz1Ohuuy+s0ZgDEH9Wj
         fGT9bFFmWejMySB+0KHMP8OtDH9iepaiIQQeNzH0wLyFU+m06Kb/VGg7iEJ72lN0coTf
         WUlJU801U49bv26vgdINx2yYyUWAYiHXvXMUiFchKLUCb8KrL9DjRm2cX6if+RdoOS73
         Vpaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785504921; x=1786109721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUE7JydRHoj2bR2XQTZhL1X0wyHiUYs8hq0ouIE4owk=;
        b=aelep+kyrDEBZhJtiqI9VK/svRP3C2tys4LDWiWXm20i7F5dsA29s2gh4V/bKMUoQ/
         7BXvFpk5cbHdrt0xOpQpeEDyzZFzAXNl0h3ai8jp+zG2jNwuGiuObUM6zk5c662WCJF0
         JwbA01NSiHV2sX3hJaofyk7IkFMFiCdjM1TVhAYcPC5pMleAY5Juj/83UHFFRznAT4pj
         UfD128iOCyDl6XzzaL5kuHdlDwXGtMXnV3lFOrebryfDzrWkPj7carxpoq6B4inWUDuq
         Ya08lAlugSYB1xAtzJ7DxVJTRsvpWwtJsSxIlc/vNgzeq0pK9KCs8fVWedMDA+xXNHSY
         je+A==
X-Gm-Message-State: AOJu0YzCcDaUOtk8M63Rk0U1zpJFlxo2XUe3pNSpk1Rzm8bPLQI5xWti
	GEKG+1pmbfmb+mglW462k8mubnFDFrhXwmtnNlM+7Ri5TCvxy9dUYdw6RBupWL3xKKjY72zJYXp
	KkO6MmoRXxs4wev4LLVMBYY0zUi8cSKsZWYdDWDTBhL2Odir+uHRRReiay+VCAn3QrGnWJro=
X-Gm-Gg: AR+sD12crJ/AXTl/ang+xemR2e4F7Jk8DPHzCpVl0LpllATbc/vw5ljc6cQZT92wRx1
	4q/X9vYTJ+ArQtRMXTCC6VB6PgEVVUb63rIqTzznrVrlGxZOur4SxSYVm/6UuNq5xA6ghzdxQMH
	b2nr9ATC5bBuUT8L3CyCAXFnwQtbGcTFELDHvYve4NKg6Zj4+lyXE/Igx0AjLOeKzmGp/tUcNXM
	KZGz3jXtOStzNwxUot8Kh/52DsPS979715Wd+3nUya0Cs6zZM6IhM11BR43SCYcJLLIFbxtW3jn
	STZ1SXWp3VG5jzfTmzYKSEAxvpBOns99Zr4SBfvVYmPDxpXJdNhhAZ7WSe4lSPMwOis6X1LCcA5
	fnEmH/QO+z1ooVVNutI8pEiUwz1n+4IQ8KM6JZXYsLEPKY9q6fDJ0CrT2x2L1T/9qdpd5qAKukr
	OQX17escgVsKyqEw==
X-Received: by 2002:a05:622a:1b07:b0:51c:6e:ef23 with SMTP id d75a77b69052e-52b5680e85amr1129101cf.32.1785504920367;
        Fri, 31 Jul 2026 06:35:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1b07:b0:51c:6e:ef23 with SMTP id d75a77b69052e-52b5680e85amr1127411cf.32.1785504919360;
        Fri, 31 Jul 2026 06:35:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cb4f1sm312343e87.18.2026.07.31.06.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:35:17 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:35:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: sashiko-reviews@lists.linux.dev,
        Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1] drm/msm/dp: return 0 from audio_prepare when cable is
 disconnected
Message-ID: <fv2gtrgxx6emfdhnw5xowmhouvig6fl6g3ewqbdiw6rrwpfvk5@pdze7uawd5df>
References: <20260616151252.3599089-2-kumar.singh@oss.qualcomm.com>
 <20260616152536.D81FB1F000E9@smtp.kernel.org>
 <5ixuxbgngzobl5c5fsyahdsouohwuykoat7s4hy6sczrye7vwf@rj7nmn7x3c56>
 <b5c0de1f-75e3-443e-9e29-a70fbdbf4441@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5c0de1f-75e3-443e-9e29-a70fbdbf4441@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwMyBTYWx0ZWRfXz9t9FDDnyF24
 UDOZGlxGSxBltvYnfBhMrERun0hoj/HO4uaG4KCa4qKtd1Nxycp6Dp1ydxG/XNoDi12VknF1MGp
 6Mb9w/OG7NkJGxfCe5q9Td0MilwWr2k=
X-Authority-Analysis: v=2.4 cv=GpByPE1C c=1 sm=1 tr=0 ts=6a6ca499 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=eoBTR9oA_HawxltPn1EA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwMyBTYWx0ZWRfX9/WJcqVog6B0
 hvZjgSO8Bp7ZcMIOS7v4AnexG3tpPxDsQT7rc+4h8qYRim+9yoVuiuKVBKIP4r51cQQ/PGojA8J
 daUFYSj1BehP1uxLL8eqoy145l+Z+006lof0URmnaiShzblqO+9Nr4CJnGwET4+ijBOhiEI2S11
 Sxik6UpMi0f7oCQZs43S4cKvsKhbAl/oarKbNUflhq8kfzLHsVw1fs0iOmdz5mxI9mXq6+qpnTl
 DFBzmRSOs6F0ZYh3WPS9k6XQXrr37AmK0cDynWv5GwpAN0iyDd8JCZscyHDM6kkg8tset68l0lO
 QKXZpWEVKoYkV/rQdJJexyn6zRJoAOtz1fTlU946MMiz1HjzxiYHu9SeNA2qkNVMmT2MxSfOeSj
 WWTOQtoaFDWdZ3C2xSVDADjVjFGFoZXcXWak3xDmbwyput/pkYCzaC6mEKLgvRrhwCVfYhn4JK8
 vv0qpRzjDxoDFCdLIBQ==
X-Proofpoint-ORIG-GUID: HHKYomsg3dy9f1w-HUGYmY3BxnDoA1fR
X-Proofpoint-GUID: HHKYomsg3dy9f1w-HUGYmY3BxnDoA1fR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310103

On Fri, Jul 17, 2026 at 08:26:18AM +0100, Srinivas Kandagatla wrote:
> On 7/12/26 11:16 AM, Dmitry Baryshkov wrote:
> > On Tue, Jun 16, 2026 at 03:25:36PM +0000, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> >>
> >> New issues:
> >> - [High] Returning success (0) from `msm_dp_audio_prepare` when the display is disconnected causes silent audio failures upon hotplug and NoC errors due to unclocked DSP hardware access.
> >>
> >> Pre-existing issues:
> >> - [High] Race condition between `msm_dp_audio_prepare` and `msm_dp_display_disable` causes unclocked MMIO accesses.
> >> --
> >>
> >> commit bfb65364e66313dc1385a42e09172f44a1e1fbd1
> >> Author: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> >>
> >> drm/msm/dp: return 0 from audio_prepare when cable is disconnected
> >>
> >> PipeWire treats a non-zero return from prepare as fatal, marking the
> >> DP audio device as a dummy sink when the cable is unplugged.
> >>
> >>> The active_stream_cnt guard already prevents any unclocked hardware access,
> >>> so return success instead of -EINVAL when the link is not active.
> >>
> >> [Severity: High]
> >> Is this commit message accurate for the upstream tree? There doesn't appear
> >> to be an active_stream_cnt guard in the mainline driver. Without this guard,
> >> will the DSP push data to powered-off, unclocked DP hardware and cause NoC
> >> errors?
> > 
> > $ git describe
> > v7.2-rc2-4669-gb9810cd75b9f
> > $ git grep active_stream_cnt
> > $
> > 
> > Which tree has this commit message been based on?
> > 
> >>
> >>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> >>> index 41018e82efa10..df222943ae57f 100644
> >>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> >>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> >>> @@ -284,10 +284,8 @@ int msm_dp_audio_prepare(struct drm_bridge *bridge,
> >>>  	 * such cases check for connection status and bail out if not
> >>>  	 * connected.
> >>>  	 */
> >>> -	if (!msm_dp_display->power_on) {
> >>> -		rc = -EINVAL;
> >>> +	if (!msm_dp_display->power_on)
> >>>  		goto end;
> >>
> >> [Severity: High]
> >> Does returning 0 here trick the ALSA/ASoC framework into marking the stream
> >> as successfully prepared?
> >>
> >> If the stream is marked RUNNING, ALSA won't re-invoke prepare() when the
> >> display is later connected. Could this regression result in silent playback
> >> because the DP hardware is never actually configured?
> >>
> >> [Severity: High]
> >> This is a pre-existing issue, but does this lockless check of power_on
> >> race with msm_dp_display_disable()?
> >>
> >> If msm_dp_display_disable() runs concurrently (e.g., from a hotplug interrupt)
> >> immediately after this check but before audio_enabled is set to true, it will
> >> skip waiting and disable the DP link and clocks.
> >>
> >> When msm_dp_audio_prepare() resumes, it will call msm_dp_audio_setup_sdp() and
> >> attempt MMIO operations on unclocked DP audio registers. Could this lead to a
> >> synchronous external abort?
> > 
> > I'd agree with Sashiko here. Do we guard against the unlocked access? Or
> > how do we ensure that the stream will be prepared later?
> > 
> > I think this needs to be fixed on the other side of the pipe. Do we need
> > to define a special prepare error code, which means "working, but not
> > available now" and make PulseAudio / PipeWire handle those errors
> > specially? How is it solved for other platforms? I don't think that
> > msm/dp is unique here.
> 
> AFAIU,There is no special error code for prepare to flag that cable is
> not connected, the standard way is to read Jack events. Wireplumber is
> is one which deals with Jack event, even before getting to there
> pipewire will fail to probe the devices on the card if prepare fails.
> 
> Once we are at Wireplumber level we are good, and stream will never sent
> to the sinks which are in disconnected state (via Jack).
> 
> This has been a known issue for very long time, most of the codecs like
> 
> Its also interesting to note that same Qualcomm SoC drivers deal with
> this situation by returning zero, so why dp has to be different?
> 
> drivers/gpu/drm/msm/hdmi/hdmi_audio.c
> 
> Other drivers that do not care about plug state in prepare are.
> sound/x86/intel_hdmi_audio.c
> drivers/gpu/drm/mediatek/mtk_hdmi.c
> sound/hda/codecs/hdmi/hdmi.c
> drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
> 
> 
> I think there is enough evidence how this is handled in the codec
> drivers, we should consider this patch.

Let's discuss this at the LPC or some other F2F where we can get other
parties. I'd like to sort out the issue. Or maybe next year's pipewire
workshop.

For now:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # same behaviour

-- 
With best wishes
Dmitry
