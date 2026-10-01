Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E34D4FD293
	for <sashiko-reviews@lists.linux.dev>; Thu,  1 Oct 2026 10:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790850872; cv=none; b=RS1kACGfSPhZVSUXBzKibvokMpgal3xQvEhg0Spw/uCEqqOvctnspkU8SLM7PEEPmwYKDPVWbowCPVsWtAObHd7Ug5D9pNcUL3dGHOEp2KVNfA3GytxYFKwlqFtmQn6DzgL5I4pFeXn5ztc/SKSav4N9Xs2crkesDwzRlG9E5mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790850872; c=relaxed/simple;
	bh=mNePTM/9NvicgZgy3VdrmHNu+bAYcaL97JZ2OPGN+bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ewdi8oYUEdwQLhm//rJZi6Tt474lgnueurCZzCIzCtW0yPpB/IoxbB+5gyibAVMpzxL3waiLYT5cIjeKRQEvRbwKnZazk0N5U/448LCtFe4LhBD091+iU20y9soWQGC7YzcS1cqhf8uLy/pAsjIDSgGprziIOHks4M4PvESJtNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GECWB/UC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YqUxcLRj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GECWB/UC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YqUxcLRj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xfsv1511893
	for <sashiko-reviews@lists.linux.dev>; Thu, 1 Oct 2026 10:34:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0Hrk/F1kX5aUJEX6L7wOMR0DiZp1hATNa02ihfJkOY=; b=GECWB/UCqQ8lxgG3
	tCCkWugho/7HcI7hYQzEArTCVP9S5A6Bqg4Q1kzy/55PuDk1EJyJ2apyJ1s450c+
	IT/xVdD5jgvgIozRlSy1z3Ja1EQONC6inz63nJmPA14Ojz2Bi9Pm4ofDUrpyuAKm
	zwOCDuO2ug82JvJfa6wIqyiJibhlcedkLdm4qUpfC3LQjZ29JZgAdAAuxw9CHMlR
	zagM/eaB/hL3rysI2fnwJ09InhS7GO891e2afJuaVHZRM5DjKCX68mB9gpA6m+Rz
	5sjQEZW19Cv6u02ZJrXrCYBvJl41yJJkiV4AG1wp2N4/huF5xzqJ70peSjzqFwl+
	7Gqk3A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188su8d1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 10:34:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93bf4c0af4eso158314385a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 01 Oct 2026 03:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790850864; x=1791455664; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0Hrk/F1kX5aUJEX6L7wOMR0DiZp1hATNa02ihfJkOY=;
        b=YqUxcLRjTIKLdLn1C9dj5GJrQTpPzr3UjaYOAirLO5ENuY6BUpT1SgsKmW0qQlsNPt
         4z9dRxWkvbDbG+S7NitG4WsLgGE8mNKY+56yR8Axaa8+3e9AP7Ts6aBgkKiP/pfQOuo0
         5NET7s2PmFAAqfiFJZiNPXhD8ymCzeWq7+k/fyU3naa9g4rg2OQ9t5iKp1mFUhkYJLUI
         HCbqSqAeb0Bz3/aLNoMXgsLFagsYXRPx2aL6BiqDUAlinOYGdKLTJ3NXFu6bLce+p4Jc
         i1v5HLbnWCJ6xrMEoppm0SgDXZH8y07RaLcmWHT1q29KmfTO2uKBKQz018mGoUdQnJco
         pJMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790850864; x=1791455664;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Z0Hrk/F1kX5aUJEX6L7wOMR0DiZp1hATNa02ihfJkOY=;
        b=FJxGUzNXj1W+kKAq0JhCeK+we49KY6j0tztU5UC0cW1iT3Q6muYFNQ0Dp42E/gmrSQ
         Czw3nsVNeMSt5jQBi9egWdSTfTZYvQJ0kMHlyuomc4BfPYg2GFQa2l/iONHnGAXTZkTg
         qnyEccVxTt6sTeP6KP39SSi4ukGBi0GHeYXfn9GMgDoxslpVULDPsrTrpmv7MICxQ2xb
         AA+ijJiJ66eEyNqabiKDyqGuU3yUYC4UVM5Hvr37C1hUV+AUwzS6tyNRoIYR8UnKXcuk
         0AcVXqHc+TPWPVf0D+w16PwozNROMm6nClHkE2GtXnNNBBB7EF2/74Abh/SWQzg07lWa
         ZnKQ==
X-Gm-Message-State: AFuF++n8DBIx/Mk98m5YK2qbdYl7P4AxF+nSTLpM7uVhGPvx8FAXDwQd
	43V4blnYcr6UnuuDiVsubrfkr+6l3cSo8zQaB5q9YkAckcKpDlQEE+rqjY8fNVRa9C8KhCbsOXk
	TABYzuMGgUkcfFTaHyPNnnWDdEZdfxl1hVfmG989eqXl9HoEhOCtExM9Ej/42xmwrKSwfuvdSvh
	eCiAU=
X-Gm-Gg: AYBFou1SXmowOjCfV1Yx8fhHZIYJjK4+35MLPXCurrdWThhvPpcDd40cW+6+CTFrI31
	4h7HbeFZZP/qIz+3UQn13oktrkbh5grb/lmTt/WIRwXBhEhzWqhDr5gRWiqs2sepfen/J2QlF7x
	6oguc0t/ktegJs2zECSgEYt4i0K7i+A4BWbHaHTLECBZcZwmisWX02Cz7cxTWiaOrJbMBbn+nU5
	wWy1wabblrzcQyIujtcSshDfqpmzck3sor/pbBJFZxoytuB2yshQqyZG/bMooLSveJqeKe96Qo6
	08aiMOPzTK2+qCRIFShA7MMSNCeylQJljbZSGR5ZkEKbDdfzd0hGgnTSi7P1r7yfK3T6R9uyivj
	Kl4DxcLlIInUR6BKrqsnE6ZgLYfL4SCVRnwbZcbagz+VXSFr7OxOwYXsgu0ds5sdilJygf1FovW
	VkPG0CllGEgKb5
X-Received: by 2002:a05:620a:2682:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93cb5a52e38mr429966885a.12.1790850864105;
        Thu, 01 Oct 2026 03:34:24 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93cb5a52e38mr429962985a.12.1790850863536;
        Thu, 01 Oct 2026 03:34:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba4405974fsm456585e87.4.2026.10.01.03.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:34:21 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:34:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 12/35] drm/msm/dp: add support for sending VCPF
 packets in DP controller
Message-ID: <t3klzrnzq3oicg6djkv6ixwy6oteo6c6zvnpddbqk5pjhsodoh@qz7pcou23no7>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-12-4b81473185e7@oss.qualcomm.com>
 <20260929045000.55AE01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260929045000.55AE01F000FF@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MiBTYWx0ZWRfX/grxk0ljmrh9
 DIgJw/SYysM06E8IwluKqSOhSLPsnSWQD5WkgRZLsaSRNKmlFY5TZnXOeHMzxaZa4+ljt/RImeB
 ZeJXA1tyIvJiDTrQlZ6X+dmQ4TaVsyM=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe3730 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=A2aZpUCA50j1Os7HS88A:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: BhMXz4W7JpsFRFfm1aI2gegLP8r1svrl
X-Proofpoint-GUID: BhMXz4W7JpsFRFfm1aI2gegLP8r1svrl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MiBTYWx0ZWRfX4mQa9XmxqIyd
 ANgGhTYWBzRu9i1G2Q8f5sWDmNWyBh3YdZdPhqfBt49rJzlosK5hRqBXZzAlOqoAve3ByURlI0W
 hT4j5VdFXCIengN6/aFEWvylq42+Kc4rlPCAxdzrRjxtOxBfUqTtkO3pzPxxQeIRI3XNNleTmH4
 wzs1DH2qspoSFLO4mwFcVH4+MxhRmlFaNohZilALHZqY8hpgJGy2+aG31gApV1q/5Emw+pIIDBM
 +Zz/HKJ4KlAlbZ6XqboubN0RxIHohn6w35LGmPPb5mECOFKre+spyRXQTi4uFhatxLplJMSiO5O
 sqsKdfhCgSln6WjUyyWFPmkWv1Eh5shFkUlxOrcjR+znTsMwIh7A5TSzguS4BsWz03e04tGvVFP
 kDtIfHkmrOb5PhNxEJ8mnyOKHIYPV/Cmp6I08rOsujsXdFWlEx4S3y2cmRaxCv/o4iU0eo2xn4W
 y+CQLH+BHxyScf3VEkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010042

On Tue, Sep 29, 2026 at 04:49:59AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/msm/dp: bitwise OR of STATUS5 and STATUS7 without masking in ISR
> --
> 
> commit 987123505b6cfcc4664c72feae6b070ad91b79a8
> Author: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> drm/msm/dp: add support for sending VCPF packets in DP controller
> 
> This commit adds support for sending VC Payload Fill (VCPF) sequences in the
> MSM DP controller when stream symbols are absent. It introduces interrupt
> handling for streams 0-3 using the STATUS5 and STATUS7 registers to signal
> VCPF completion.
> 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > index 9a0c9737e6d00..929e0f94f8ddb 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> 
> [ ... ]
> 
> > @@ -2801,6 +2877,16 @@ irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
> >  		ret = IRQ_HANDLED;
> >  	}
> >  
> > +	isr = msm_dp_ctrl_get_mst_vcpf_interrupt_0_1(ctrl);
> > +	if (ctrl->num_pixel_clks > DP_STREAM_2)
> > +		isr |= msm_dp_ctrl_get_mst_vcpf_interrupt_2_3(ctrl);
> > +
> > +	if (isr & (DP_INTR_MST_DP0_VCPF_SENT | DP_INTR_MST_DP1_VCPF_SENT |
> > +		   DP_INTR_MST_DP2_VCPF_SENT | DP_INTR_MST_DP3_VCPF_SENT)) {
> 
> [Severity: Medium]
> Does this bitwise OR of two different status registers cause false positives?
> 
> The msm_dp_ctrl_get_mst_vcpf_interrupt_*() functions return the unmasked
> register values. Since the values from REG_DP_INTR_STATUS5 and
> REG_DP_INTR_STATUS7 are ORed together here, bits from one register could
> overlap with the VCPF bits checked for the other.
> 
> For example, if an unrelated interrupt sets bit 18 in REG_DP_INTR_STATUS5,
> and it gets ORed into `isr`, the condition will see bit 18 set and assume
> it's DP_INTR_MST_DP2_VCPF_SENT (which is bit 18 of REG_DP_INTR_STATUS7).
> 
> This could cause a spurious completion of ctrl->idle_comp during a VCPF push,
> allowing the driver to proceed while the hardware is still executing the
> pattern.
> 
> Should the return values of msm_dp_ctrl_get_mst_vcpf_interrupt_*() be masked
> against their respective VCPF bits before returning, or should they be checked
> independently instead of ORing them together?

Please respond to this comment.

> 
> > +		complete(&ctrl->idle_comp);
> > +		ret = IRQ_HANDLED;
> > +	}
> > +
> >  	/* DP aux isr */
> >  	isr = msm_dp_ctrl_get_aux_interrupt(ctrl);
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com?part=12

-- 
With best wishes
Dmitry
