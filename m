Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B946EF8E
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 18:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784659682; cv=none; b=nXn5ZDEymnHjzxQiudtoTCo96F9kZoEIF0m2nUBSRmoBiKKWCkGYcgpiZhsCW3Qtq6Re/W8E8ZTXsCugNtav2Ijt9JHFFzGkd7axa1yS0YjL2iCFgi3OwbgFonG1BYbWYPafRyuxr/0O9iK2fty0PPuYeHjQVIzcupcthHe/fio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784659682; c=relaxed/simple;
	bh=ludcGqxBikBfaAJ7asu9+tqBzIZ/T3OSDEkyCLtZbVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3+Jvz4tYi14pafEbZu5hXOls7F3s3hRjiJWu+4ae71JWxOzgKzRm14tpL5qVySJPQZk2OQy7KbMCf5b9KGjGH9TK0SRK3X5yFIwZOneimZuXnT9SpBDVMv1zBiYeE5bqaWKV77dSod3ZIQPvfOMsuNw3J9DM+m1YFp7bYzZdic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p02EeJxV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E2wkvgds; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p02EeJxV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E2wkvgds"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2hXw2418325
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 18:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AlT487GjgIuItMOY/9Z1aN2h
	x+ACKb8H7eDtCUp9i6E=; b=p02EeJxVrgZk3DaDlRZ/z97I7DX4YBz4l2+BQJLj
	ilVzwXuLHWycF158bJN7kJHVKSYgu0DLz4HqodhybyftbTnNaqTFP+Cd/kSGWzEB
	eJ9WfqnmGCIWPNRm6tg4CnGx/q8Lq8bXi6zYUD63IpHZ74EdACzYBRnSSGkvu84u
	5lRF3Gc6msOgVP5xSzq9sTDDiQ2xAfnGxVUvQGEbSM3afrqiVy/mO4o+agLaHQBv
	pPjoGiYkVcY3jrrYxgdBIclGpntN+sIpQj6iw4jRtBgdP9uYoqhPXUe3+F9fjhNe
	rK5JAfJl/hs4A0hgVMvtVLVG9OumuP9itb65BDrtC5S78w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs9p1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 18:47:55 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c075c1e25so166618331cf.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 11:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784659674; x=1785264474; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AlT487GjgIuItMOY/9Z1aN2hx+ACKb8H7eDtCUp9i6E=;
        b=E2wkvgdsjLA33iSOsphFRG9/QF/70XSbJajHfGnfJTbT2+FxMXMYAdx7pDHLIdOgau
         6qzz1m4sqydHPl7Sfs5vLO6AoHEg5FCVeQPPgbx2Y1Bqf6521cIdLHd2fg0OH9NCfjJC
         4vsSb/sBoUSr62VsqLpoOVCNNofV1h3jWLij1I3GlVGnl8fMipeRJWDSQ0azJrSnav0a
         Ywa/fZtCAta6NN4RDlV4cKoHZaNYYX/B42ekk+IZ/Ts9gGhZ/jtbFZ39Y59CugHAYsN3
         VJ0IkJ20dVM6zJsoLUBRHrkiygyWLkE5w+cu6xN7a9YJ5WHYow83axE81RVKHzodqcEA
         Tt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784659674; x=1785264474;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AlT487GjgIuItMOY/9Z1aN2hx+ACKb8H7eDtCUp9i6E=;
        b=STkhs4tfHF3kiUmK5/DoF6ZNEzGUmwYRJZeaONMPCBZP+4YRc+sEW0C0HvZ0xEajD/
         qNfl2SAZWtz2lwMHx8teNfaHAs7aj6imD75icl9+2rRjHY27fJUwbl9G7ToqS6uHwfvW
         TpUl66FApcf879ytREbLl76KfBiHDGl5wvOSnHeciZeo1F7BiL4qU7MxyhBK8Gh+3bMX
         W84iKL2qJ87kIL8dc0yaNu7RWmBHeHhT5gnhn/1IsqxFWivd67O7ZR1Ku52Bn1KJGRkJ
         7fGb04w+gOfiSm/wLPpK+17uEVVchVY2i2NWKitlHojI4RtytaWgKratDNduNIx5XC77
         RQEQ==
X-Gm-Message-State: AOJu0Yylmb3vT8ZwjnRhCZVIG2QsBsgjBd7KdmixEX1cg06+EB4jKN0H
	8pFgsx07O9bWADzSE8exwAVLefpiQL2D4T/hkXGMd7+ZMd6+h26skqa0T4WhUDxv4ky8QR/LjCV
	nAvJ6qGGnLA2ZRVGjlnqgqnPfwaNmmZwY+lPtetwN3HvI/XaRk1Qy3bqS7YdCO7W1B8/nEeUZWb
	BV9mM=
X-Gm-Gg: AfdE7clW9qpfX3TYnYlLr997F027jEoKXuhQjljP3T02SJmor++PPaZBYfY5cbo38rs
	MF3LC9/NgyIUAAQlNcY9kgq/7CxonWhtUDgSql+yowzrHvKswSiCVF/zXWeGlZtOR85uzM3+z5X
	hWaEw+56uAqWw+SeRUo2By1lg/Lk31/NOjyujLrWq41ZexITkoWCX8Gz9HA1Z2T9gpxgKa7TpUJ
	P0HYKsjf4DFuyYMt4wy9EWoQSdZ5NpTL9YHCPJEOYhh+wQsX4sc4oWAIuUGFUzZ0wTZPIGmNnW6
	vu2YCuE1g/lPJMtzZ2HqOj9yg8SEbvrfU28UaLfJBD5VdZ3VFfLRfGQibPm69tUXwcwoNoS7Oeu
	fC32j8r0hKcSmw1RPWZwypZH+5yCoQ+jRul5+iv/wwo9Wd+xkF9QTaK08sJZT/PpnPo72A2LUxw
	A4S4qNq8DKiJyaEA==
X-Received: by 2002:ac8:7fd5:0:b0:51c:7b11:41ad with SMTP id d75a77b69052e-5213ed76967mr189500921cf.73.1784659674515;
        Tue, 21 Jul 2026 11:47:54 -0700 (PDT)
X-Received: by 2002:ac8:7fd5:0:b0:51c:7b11:41ad with SMTP id d75a77b69052e-5213ed76967mr189500591cf.73.1784659674039;
        Tue, 21 Jul 2026 11:47:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9e45fa5sm70740e87.66.2026.07.21.11.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:47:52 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:47:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v8 02/15] drm/msm/dp: drop deprecated .mode_set() and use
 .atomic_enable
Message-ID: <ldznbgwysgo4ya6h2s57wytjjhhljkfyiagrce4z2gvty5suye@bdc3gfzl7xff>
References: <20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com>
 <20260720-dp_mstclean-v8-2-bea261bf4e7d@oss.qualcomm.com>
 <20260720063317.CFCFF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720063317.CFCFF1F000E9@smtp.kernel.org>
X-Proofpoint-ORIG-GUID: mua9WQdqjCf3ST30QOQZbOEtJ5ix-d1Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NyBTYWx0ZWRfX4aqGO1iIX4g1
 sjFQ2I59KaAlaSi5pKGMOd9cDGM1IKLtvimsmV++5GZ57iLAWnD78rxOeV6qo93sTLiR+XKy23l
 FUPUrHg47m0cbrrYU33jAEihc7cb1TNjN/RHLdhUuJlhwb384gtAEjxryO0qa1Y6RNZRXi3Dr2N
 KIG4L7auO66CKTusbQmWW32dKo6sHKjDVKmHuTdj5ZuzqEIWJ+8zT0w+ww4lAxmZq9fv8TtjZSs
 UPkF5GliXO6tHWj6NzeI2Pc/x+sSTUsFW3mXH2+81lGuJP+cu4YSnROVUPjZvs6beorTd8H2gDj
 K+6harBIFvU2MddX2J22MJWEJiqG0B53uS6W0oTxbc6gzC6tKnG7tzIvnVPRz7RPtR1NIbHGOm9
 ++uaer6YBUajtuBRkJHN7vivdUQEc7zGUH8VjnlgUP5+Oh7XN80Z1mXXdkFuZaSm98nNW9cgPmy
 S2AyAxJIzGu2cb3LTRg==
X-Proofpoint-GUID: mua9WQdqjCf3ST30QOQZbOEtJ5ix-d1Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NyBTYWx0ZWRfX/T3FAtwd59d0
 wsLlexnPR96hr3sU5r+nm2A4y+x6A5qZS5IJJHIXnDKXYnkj/L5z1feYPUO4S74bHdTW51cyB+B
 tkjuYdxzo5GXiafvUy+BEab+078YxHY=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5fbedb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=10R1qcJeZEgYezoHLQYA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210197

On Mon, Jul 20, 2026 at 06:33:16AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] Moving mode state updates to `.atomic_enable` causes the DPU encoder to read stale wide bus configuration.
> 
> Pre-existing issues:
> - [High] `mode_valid` incorrectly evaluates wide bus availability based on the currently active mode's state rather than the candidate mode, causing valid modes to be rejected.
> --
> 

> > @@ -1386,7 +1406,7 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> >  	if (msm_dp_display->link->sink_count == 0)
> >  		return;
> >  
> > -	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> > +	rc = msm_dp_display_set_mode(dp, &crtc_state->adjusted_mode, msm_dp_display->panel);
> >  	if (rc) {
> >  		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> >  		return;
> 
> [Severity: High]
> Does moving this mode setup into .atomic_enable() cause the DPU encoder
> to read a stale wide bus configuration?
> 
> In the DRM atomic commit flow, the encoder's .atomic_enable() (which executes
> dpu_encoder_virt_atomic_enable()) is called before the bridge's
> .atomic_enable().
> 
> Because msm_dp_display_set_mode() updates the format state 
> (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420), the DPU encoder will query
> msm_dp_wide_bus_available() before this new mode's format has been stored.
> 
> Won't this cause the hardware to be programmed using the wide bus state from
> the previously active mode, potentially causing display corruption or a blank
> screen when switching between RGB and YUV420?

Indeed, both look like an issue. Please add a patch before this one,
adding drm_display_mode to the msm_dp_wide_bus_available() call. It will
solve both issues.

-- 
With best wishes
Dmitry
