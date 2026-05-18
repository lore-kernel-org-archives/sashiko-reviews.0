Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088B723C8A0
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 16:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779123427; cv=none; b=B9Fy5dfzoLYFEHSK20/uevOyjxJTJxMFZApbcmTfaNCrF64eS6h3ctvehq7bTdQ4NiN1XO6b6v70QyhrA3+Nf0bw+S169SqPMvtGregyYBnA4cyED96Z3EVsemyXtgKyHd+43mAlcy7oWabwSp1/GyICbE8P/xmROkRknMKVMJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779123427; c=relaxed/simple;
	bh=L7EFjFkV+ekmx6ISZwCAua/z9nmPaGFZNSZCc34ryNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gQ8cpgBVLE2f1QwXS9RDClJIFg+6jWVN40OmMdFiqUKbgSuAKJfBIKqGGZNryCKPD9Gdf8FJY9wRPzSR67y0LJdZhCT+Rxqyu4kEaACzTZIGux174pab+rXELln35LtmmOJgzKw3e7On1Fn5FJdo5LPClIk+7gmeqqD8X+cYXQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lph9lkhM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j14VR8gy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lph9lkhM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j14VR8gy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IEnX2e2975778
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 16:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oS80oywX8PrOdUvnsdr0tbCl87/qMb146EIaDFpi5Qw=; b=Lph9lkhM7RHB4WJS
	HYRdYQSyQ3AnizgjyRgzxFIQBeX/gTDJLudMB3GRZvILp9QiDVJud9WHBfnYU/1K
	VvL9POgcn//6SJj/XUYnT5RKDTylTlQE3c2hf3nGg+Ck7wnffXXSDqMmeXy9n47u
	gw4bpObSEdVqSiXh3h7rWraB8ZR5YNvP+UaAL55Y22g0A+6I156jx300itfJv/0Z
	2dklDRwyGjhdPckjE2SZiz/wIhduNHTLBg2tun+b4rJWo2tbCtGUsp8BeHqZMI2I
	mrV0TTsyOqDofyElMGj3XMz1pU/FSq/0v9+S3y3ki+wgK9gZecky9zYRFBUTK3mA
	TawYng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e84v48fvb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 16:57:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e575a50bcso29936911cf.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 09:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779123424; x=1779728224; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oS80oywX8PrOdUvnsdr0tbCl87/qMb146EIaDFpi5Qw=;
        b=j14VR8gyLt5cn4cJHjVX/uOiPpwTRG7NAmP5LkavWeVqe6oTjrBSHDny5ykwQcYmSJ
         0WzcYHdQfuWVJ3nrT88yKyP9Dz5SI7zyIQI1fgkZAA/vqWP4y6sPxaqkNrEIShAYjH6x
         seYRikr9T0aXF3pjtHU0lxfRGomyGgCbXFPtoRHJhtS0Ixe8GqF2mlaYjJgJ1PleOuNo
         9/H3xVQJ8z2C388/SYWpOMqoKzXQHsznt3xYiLhLr50VyVa6Z0/wSxQnaMeSds3LxqFf
         /P8fxJofNppf+YP/kv5h+f5d8KQxFNjgZOHYLwV+IsnJYhzSa6jhdezja93TKY+Xk8yN
         MOiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779123424; x=1779728224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oS80oywX8PrOdUvnsdr0tbCl87/qMb146EIaDFpi5Qw=;
        b=MKVyvD02HfegCXk7R6gkgSi9yW4Zn4xvu2qgRZ5zBG8zO/cXSMlShsT2VyxyrIf/YX
         hkoeb6VMr1UkwkeQTc5KgC4Bzsb/Qf3b4EaGKt9cOzvunkcLON0lADE4mCYNwoBBAV4G
         gtsm46i0GQpzwGt8/ADidf1VH12fuboyDD7D1Ta4h9s7teKB8uUxWCtLfAclFal5zT91
         5nkek8a0caRhgAzFl2i+AjOqRpLXwxOvbUohcGzciRGR7ClOWqBSLGaG1jsEa25YuZec
         I3BOXI09zNNg8glZ4lnhc+qSyAkxPvbrE2+jnQ2apIKJspQl9+0MgunbzaeNKxgdo7Zx
         UgFA==
X-Gm-Message-State: AOJu0Yw+JBAz+ZRUKSb5sWqNNmKFib3JINRlpwXRhbaZMABLeuxJ+wmR
	thkQ3q7zfLEcIgeeuKrwITCe8rIFeI0WXEMMW+DeEdOWvqSQwQ6BY5S7epT7svKy4qTGVpsaV02
	1mIO+0vaPhCK/3mV2RVlwdJdZhq3jVy/Y4GL4fuYbkSYVcBKLuiLOZtT6zsn4FWmQyzWq6PmPkN
	84Q9g=
X-Gm-Gg: Acq92OF7Lg9Tgq1TY/p/5TGGovM3uPK3XHZPzzjSpcEo0Izqc6tLKgBVX4VOqe02ECO
	/KE2SU8Z5xfh+YGVW5SPpbpUP7NHU7v+4KqrSjTkqlVNLO58SPD8KGlrIoW+8JZ5qmiHYwo9y/V
	V+87hID1LOwqdJifjyg+qkvpOxS4YxrzfjwvKTyRcYLaFDvM03kAxpxFOU6ymnsAWh7z8xsHz71
	HMiaGHUS21XVdlMANieEm4F9q1yZKeUzjcYdmE0SC6AJaZelhXawLpTqi7u+/Jpj2Nm/vuKN30i
	wBV1iEZVJRgaGDWvGmR3uJZMimQCZmQtWDzk9I4425GSshJiFGi+/98y0Bb1jDa4OWLI+em/+aC
	yNPk7p1IJj7q3+s1egmysVOkEymoG/yS9rh3tPHVZEBWWOmkA0Zn1om7rDUchQlVrc4fXXio/Uv
	SeZh2IZo+U53dfhwKwPs78XBxzfOdgK4e6gWQ=
X-Received: by 2002:ac8:580e:0:b0:50f:b465:94ae with SMTP id d75a77b69052e-5165a1db136mr220005431cf.29.1779123423018;
        Mon, 18 May 2026 09:57:03 -0700 (PDT)
X-Received: by 2002:ac8:580e:0:b0:50f:b465:94ae with SMTP id d75a77b69052e-5165a1db136mr220004851cf.29.1779123422479;
        Mon, 18 May 2026 09:57:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a91c33ddb0sm3454888e87.78.2026.05.18.09.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 09:57:01 -0700 (PDT)
Date: Mon, 18 May 2026 19:56:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
Subject: Re: [PATCH RESEND v3 1/6] drm/connector: report IRQ_HPD events to
 drm_connector_oob_hotplug_event()
Message-ID: <c7fcmligd5jys5645spcmx2ydlh53fqllsx2cf7e4ffcqqkb3t@25ff5u7xhhpg>
References: <20260513-hpd-irq-events-v3-1-086857017f16@oss.qualcomm.com>
 <20260514104424.04B3FC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260514104424.04B3FC2BCB3@smtp.kernel.org>
X-Authority-Analysis: v=2.4 cv=VJPtWdPX c=1 sm=1 tr=0 ts=6a0b44e0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8 a=OU9p-j7wOag53X3kEogA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 93VIxYgM9KaJgY9WTS8cUKueKc8xB7ON
X-Proofpoint-GUID: 93VIxYgM9KaJgY9WTS8cUKueKc8xB7ON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE2NiBTYWx0ZWRfXxj4O0t6vAbaR
 +pvbosvfq4A8Ibd1+zp2n2yX0qGvbJ2G64ARVk1n6W8Be/Bp3CJnkgrZeJwcTYUHzVL8EmYSjjg
 en68HxxN+WRjTZTz4+/yiCo13VFtAkkm0FmnVT/aRuUmxuTLXY+ginCmgoWhUnvBGkNu1XdSwrY
 Ns9SoFxhoKXqnnkTxIrZ2uPzSiKL0LKdq6VJ469z2LBGGWp4460LOJ2IALSojFKNbpSLeqRSgl1
 n/Qc+RoFaSlH4DO+RIwLBzKwnoQZLbaX8J1CTQXbpIqFiL3om+JN+o8Ach9aPSClahLG8u5/XtZ
 u8tZgczKpk4CoQzPanrSC2u5DCM5Hf8IYalg8ggnOX6rcyarvZa7oRTLKPYf/T4PzYNNXna/zeu
 RGr4QF2H56Ophs22eMgeS6vjyd6xEACX1iLZpfs6nGGC0rqBKcSEE7rTCpEOMr6l72ivgtH9uB4
 Z0tdONvHLuDvrhHrWeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180166

On Thu, May 14, 2026 at 10:44:23AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] IRQ_HPD events are silently dropped if a status update triggers a reconfiguration while the HPD state remains unchanged.
> - [High] Deferred events in `dp_altmode_configured()` unconditionally report the display as connected and leak stale `pending_irq_hpd` / `pending_hpd` state.
> --
> 
> commit 53d82f9a5286a8fa5530ca1be94f61940637586b
> Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> drm/connector: report IRQ_HPD events to drm_connector_oob_hotplug_event()
> 
> This commit extends the drm_connector_oob_hotplug_event() interface to report
> DisplayPort irq events. These events are now forwarded through the alt mode
> messages to the sink drivers to support multi-stream transport handling.
> 
> > diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> > index 35d9c30869900..7182a8e2e7101 100644
> > --- a/drivers/usb/typec/altmodes/displayport.c
> > +++ b/drivers/usb/typec/altmodes/displayport.c
> [ ... ]
> > @@ -212,7 +214,10 @@ static int dp_altmode_configured(struct dp_altmode *dp)
> >  	 */
> >  	if (dp->pending_hpd) {
> >  		drm_connector_oob_hotplug_event(dp->connector_fwnode,
> > -						connector_status_connected);
> > +						connector_status_connected,
> > +						dp->pending_irq_hpd ?
> > +						DRM_CONNECTOR_DP_IRQ_HPD :
> > +						DRM_CONNECTOR_NO_EXTRA_STATUS);
> 
> Are irq events silently dropped if a status update triggers a
> reconfiguration while the hotplug detect state remains unchanged?
> 
> Looking at dp_altmode_status_update(), if a status update requires
> reconfiguration, the code attempts to buffer the event:

Only if the DP isn't configured at the moment of the event.

> 
> 	if (!(con & DP_CONF_CURRENTLY(dp->data.conf))) {
> 		ret = dp_altmode_configure(dp, con);
> 		if (!ret) {
> 			dp->state = dp->plug_prime ? DP_STATE_CONFIGURE_PRIME :
> 						     DP_STATE_CONFIGURE;
> 			if (dp->hpd != hpd) {
> 				dp->hpd = hpd;
> 				dp->pending_hpd = true;
> 			}
> 			if (dp->hpd && dp->pending_hpd && irq_hpd)
> 				dp->pending_irq_hpd = true;
> 		}
> 	}
> 
> It only sets dp->pending_hpd = true if the hotplug detect state has toggled. If
> it remains unchanged, dp->pending_hpd stays false. This prevents
> dp->pending_irq_hpd from being set even if irq_hpd is true.

Because it's all about the pending events. If there is no HPD set, then
there is no point in processing IRQ_HPD events too (please correct me if
I'm wrong).

> 
> Could this cause DisplayPort irq events that arrive concurrently with a
> configuration change to be lost, preventing downstream multi-stream transport
> topology updates and link training?
> 
> Additionally, does this deferred event unconditionally report the display as
> connected and leak stale state?
> 
> If multiple status update messages arrive before configuration
> completes, dp->hpd can transition to false while dp->pending_hpd and
> dp->pending_irq_hpd remain true.
> 
> Similarly, if the alt mode is exited via CMD_EXIT_MODE while
> dp->pending_hpd is true, these pending flags are never cleared.
> 
> Will this cause the drm driver to receive a spurious connection event and
> irq when configuration completes or when the alt mode is later re-entered?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260513-hpd-irq-events-v3-0-086857017f16@oss.qualcomm.com?part=1
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
With best wishes
Dmitry
