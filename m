Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFE33559C9
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780898149; cv=none; b=HKgCdSiWGzurLK/nSbTbbnotYffVlUqkXTh96icDP4DothurfQgXpy32FNBZ06Qt0LFisDQKWyOiYbPf/x18ZO47pZRN8J1GkzP23Wmystwuqdv40iVSnOLMveMwCc6gupLHbGN7k6/h23/DkxW3on8bl+Z/Q/4llhRAoliiUjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780898149; c=relaxed/simple;
	bh=lg2DgbPwBLHogtvNmaTCgs1u2gHUDZnx0Yqh6XoBWnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FKsW5X3rhp7M3X1ZzV0bhAfF1Vu0FIpUjUHxiS+LBIArDeLoVayXsAgIXh3OaBhQW+aL3bzLjVFJ2a7wi+1X1vmlowGetnwt8MzLyxOMG/wan4PQDwCUAwP9v/df9QTD7XiKmPbWoJkHN8ONbdq+7uc/TuoWcaNA/6F9cI84L7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WaUSHASV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SSwJbgq/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WaUSHASV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SSwJbgq/"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6580FgPl2023635
	for <sashiko-reviews@lists.linux.dev>; Mon, 8 Jun 2026 05:55:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=luzPiyxgZAG14iAJcnVjDkWg
	HoqsvHzvRtaW6X+R/so=; b=WaUSHASVCqICihMkuQJ/O6Mh7HQilB+NkWIfd6IS
	rj/7etYN1IV+2q1PBBXT6S0bU5bjX58VrfBCOy+7uYMfUCRpPCkbmyBwgSuTV2ud
	d+tAKnpaWVZwEQlhlFbmns2i23MibgvhvEw00B2cxdeKnm0YqNCGXHQHX6nS9h2H
	KAMJVJ2buGNnGZU5KAQHvbo4ItbJxAbRr31WLltc3m5X/QXpUBBtg4aEzUCAUuEI
	2T6Duw+aXSh893NDsGexUj62E7dgm9HWmFxAT3kUMWvkBNjhVhvTPJ7+YRC0hwu/
	PPkKA+p27zJ/cIAlRabPFzLQ8lDYMtIlUQ9Fc7BCfnNE3g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4embmre6dd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 05:55:46 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6751c50552dso1897813137.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 07 Jun 2026 22:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780898146; x=1781502946; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=luzPiyxgZAG14iAJcnVjDkWgHoqsvHzvRtaW6X+R/so=;
        b=SSwJbgq/jvV4nyKXAoKYTNk9ef+aCK7eKmncu0L1kUuRk7tiU4bRUU06yhF8fcEfh/
         wJprt1We6I4irZmPmYXsyQv1XuRzEUu9GPFsSnmb+olDyK81FDpXgLqbdfpB9a1+jaYw
         71+D0nzLDQFadjrVuTHhynWzH5+nYPG6fXgut/vbmXvQivu2aT58ywMQPurCW6/i3AA7
         j+NuUmJh/anacJFSdedc1oC7xancJMbFrD0AoQ6QoBZ9HDsyf7rB4vbKK8zg18KAHJ0r
         vdiFbjRtyk9m5qvYyFZ6x1unfuJtKr1dNH2gxtUXBqy057+5VLlHMOjiB3pVrJ3eOg+a
         l/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780898146; x=1781502946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luzPiyxgZAG14iAJcnVjDkWgHoqsvHzvRtaW6X+R/so=;
        b=rPGdNsYMB2wFZpPfePrRlNSlrVQgJwaxu5uxAl1Ehl/KFLZ5ks3+C+ffJWegWGtuoq
         Out72zJq8nCKPoKP+t4HkjrsKypOOmu9we5x+DqmDffWFQ4HXyCTEbVYjrjLYKNVDVtC
         8r4VFPMFqdVfkZ699YPR2wEaVWqW6HyVhvTd1eho6MC+S3tH9566rUA9SOdhK3hWy/qT
         JykJQ2F1nYafYwzFZ/yskPsWqkRr4ihaGvFtnx5SbgnfyGPNPp4H12K7kjkWjbG+2348
         MnnsqF0HbB6zAE67QkvLHahGXqciJVF7bWmC5zTDx3HOYVmdhJvYXSBznXuwHYVgaeY5
         NTGg==
X-Gm-Message-State: AOJu0YyRYVXoJNdBZSlVgpP7ax6FWlmxnT0QAtoGdw02r9khn8Dc4VBB
	cAIxWsJB0Eg8gNjCE2octV9PRAZDXNg0r6EGEGd22nn2LWB6lE6xJPhK8W6XMuugEP6zyBhobhG
	xcJ6Y1Vw63GuqWW1VUpvQ0welVPO+U2yWOnXuXJUNMykLkgt/sjCBRxtn/Cuu3ewBX0oWSrQ=
X-Gm-Gg: Acq92OGL1pJClJ+/fYn4fIQSVTdHwq+cfJXpYfCT/gbGnyEs0/ByFQLH8Am2Rno6Jmx
	03mBHF73dgPCFigl5LEUsHjYWwdrIWB1I/3Kip8W5dtr/6ywegrq4Eju1okRVLVt7sicemlQ+gj
	6/KFK8yU6XhupZ81yNsyO+QxJCbMUCi3YRqR1Pg9vRtHxgNwDDc8hfJ20cfGaRmH5P4YibNfJ/m
	ZNo5iHBy200dIlpdZA9i23ehxl+xnAuYS+zQHFlbD1oSdZUFxSjsdNm3P2WdPUPZKk8ES7N401L
	4kBlth5tg1bdut/zDsG0NJ7Ed2/DHoSRF1nKsRZ14htHRnFgjapaF9vb0JiRHzg5vji7z5TWIfX
	ZHWOhr/e+b7Hiy/ZFvTwZzn8YPcLzAVcAuPt5vVW693th6XgbvoZ63kgfoRUCCIICNza9FfNGYm
	pZicpWr1niFhQC7zXh6tzfAY6wb46NWKpdNE76EM+JnVFl0g==
X-Received: by 2002:a05:6102:290e:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6fefee62e5fmr6355198137.26.1780898146006;
        Sun, 07 Jun 2026 22:55:46 -0700 (PDT)
X-Received: by 2002:a05:6102:290e:b0:631:26f6:7009 with SMTP id ada2fe7eead31-6fefee62e5fmr6355186137.26.1780898145570;
        Sun, 07 Jun 2026 22:55:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b97b04esm3656975e87.40.2026.06.07.22.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:55:44 -0700 (PDT)
Date: Mon, 8 Jun 2026 08:55:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 05/12] media: iris: Enable Secure PAS support with
 IOMMU managed by Linux
Message-ID: <57owm4mtcve4t24cqjnpvpcbzljxi4eugmxnop32sraxzqrcj6@z347jmrvx6v2>
References: <20260603-glymur-v7-5-afaa55d11fe0@oss.qualcomm.com>
 <20260603143923.58E1E1F00893@smtp.kernel.org>
 <e0650526-a616-8155-26ae-642790a43084@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0650526-a616-8155-26ae-642790a43084@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA1MSBTYWx0ZWRfXwJWmUS444sRT
 3e8gSVFUBRBHauNsIotnCJz5/xK52P9H6/9nVHqxgLTqcpB2kK46vHBSXMjKLeWcDSME4732JBG
 SVyuQYZX+2IC1wMRf4fAqGlAsd09V53OfZruoWGBQwOtUJOzhoKCxQ5UEhO2MthW06omxg4fJ+n
 WHfYhP6NuoaETUX0O4SBO3tNVWzkSrLJi3VA0eu0scJzOj6yy1mn7T8KAM/FWySLR9OwVlZAd4s
 A4rHB8c0cTcCYTwPHejka5OnVUCra7qK8EjnhW4ICme+nmeGcpWTo7zMNZmGbEXqCaxnD2m1k+n
 SWVwT7v0+hJqUN+6LJV93t2KZhoT/Yl/DW8nP8MfqrjvyZldKOIm9vc0HNeTPjonxnAAz47EI/G
 LWCkUe6PUzrlS5k7reMRPTAwC/pejpG8HSFrcBPMycko2OMBw87HCtNh2urBljKW7J8a5iB+J7v
 NLa4w6qq7rSav4OUlEQ==
X-Authority-Analysis: v=2.4 cv=B5eJFutM c=1 sm=1 tr=0 ts=6a265962 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OdMo0-_2X9zdE8NeE7AA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ZzixjFIP8vibWE8CzQ2BmATsBFQvjgwk
X-Proofpoint-ORIG-GUID: ZzixjFIP8vibWE8CzQ2BmATsBFQvjgwk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_01,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080051

On Mon, Jun 08, 2026 at 11:08:35AM +0530, Vishnu Reddy wrote:
> 
> On 6/3/2026 8:09 PM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> >
> > New issues:
> > - [High] Unconditional devm_qcom_scm_pas_context_alloc of pas_ctx causes a memory leak during repeated iris_core_init failures.
> > - [High] Double invocation of qcom_scm_pas_shutdown in the qcom_scm_mem_protect_video_var error path.
> > - [High] PAS metadata memory is permanently leaked upon every firmware load.
> > - [Medium] iris_fw_unload() skips iris_fw_iommu_unmap() if qcom_scm_pas_shutdown() fails, leaking the IOMMU mapping.
> >
> > Pre-existing issues:
> > - [High] The sys_error_handler delayed work is never canceled during driver removal, risking use-after-free and locking crashes.
> > --
> >
> > commit 85711dbb43a8f02c3f39064784fe37381f80c2c5
> > Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >
> > media: iris: Enable Secure PAS support with IOMMU managed by Linux
> >
> > On platforms without a hypervisor, Linux drives the firmware loading and
> > authentication steps directly. This commit extends the Iris driver to support
> > Secure Peripheral Authentication Service (PAS) on such platforms by creating
> > the firmware context device and mapping the IOMMU when the firmware device
> > SID is present.
> >
> > Link: https://lore.kernel.org/lkml/20260105-kvmrprocv10-v10-0-022e96815380@oss.qualcomm.com/
> >
> >> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/media/platform/qcom/iris/iris_firmware.c
> >> index 1a476146d7580..8bdc9273036ce 100644
> >> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> >> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
> > [ ... ]
> >
> >> @@ -30,14 +34,18 @@ static int iris_load_fw_to_memory(struct iris_core *core, const char *fw_name)
> >>  	if (strlen(fw_name) >= MAX_FIRMWARE_NAME_SIZE - 4)
> >>  		return -EINVAL;
> >>  
> >> -	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> >> +	ret = of_reserved_mem_region_to_resource(core->dev->of_node, 0, &res);
> >>  	if (ret)
> >>  		return ret;
> >>  
> >>  	mem_phys = res.start;
> >>  	res_size = resource_size(&res);
> >>  
> >> -	ret = request_firmware(&firmware, fw_name, dev);
> >> +	pas_ctx = devm_qcom_scm_pas_context_alloc(fw_dev, IRIS_PAS_ID, mem_phys, res_size);
> > [Severity: High]
> > Does this unconditional devm_qcom_scm_pas_context_alloc() cause a memory leak
> > during repeated iris_core_init() failures?
> >
> > If a subsequent step in the firmware load fails (e.g., request_firmware()
> > returning an error), iris_core_init() returns an error, but the device remains
> > bound.
> >
> > Because iris_core_init() is called upon opening the V4L2 device, userspace
> > could repeatedly open the device, failing each time and allocating a new
> > pas_ctx without freeing the previous one.
> 
> If the dedicated firmware device is not there, will check and skip the repeated
> allocations.

No, the path is the following:

iris_load_fw_to_memory():
   devm_qcom_scm_pas_context_alloc() -> succeeds
   request_firmware() -> returns an error
     return

Now you have a dangling PAS context. It will be freed only when the
driver is unbound. If user is persistent, the driver can eat memory and
possibly other resources.

> 
> >> +	if (IS_ERR(pas_ctx))
> >> +		return PTR_ERR(pas_ctx);
> >> +
> >> +	ret = request_firmware(&firmware, fw_name, fw_dev);
> >>  	if (ret)
> >>  		return ret;
> > [ ... ]
> >

-- 
With best wishes
Dmitry
