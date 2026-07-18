Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E551D31F990
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784400652; cv=none; b=QWTC10GQhRMAU7N3XqMdaOL1tDNsywGumt+5BaiqLvrOb89alYK9ap845havpQDLfwHoDCPanNdBpzslrh9HmPCevA9V58yvn0mUEffeRWgDXAdBEwso8H2W4Nw/EsVCkMrnlbfJd2mBJSeIbX9YCeJAQJLqdwIh9I0nLkvfuYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784400652; c=relaxed/simple;
	bh=GrjrjzQJGTXdMuPMC6ADacVImaE4YxNz3x1F9wTkO5A=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RUeLdwAl0+Uv8sVB8t+NEOuxH1+Rfhjm92qXeKaaKwIblXn/4H35v1ExQDsO4Anena8Y3rTY3z5l+agDt3552rml+Z8TfyP93Vys/v3cuq7tdD6O+HNDPd4jAbHeJODiip3pzDrwzm1CFVatOSPTqaeh/04ZNy/fGFzt7sQNczA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mKXwf8Nk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCQS51Xm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mKXwf8Nk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCQS51Xm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IGPr011181786
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:50:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/gWE/9u3scX7ScXyAJclC+r8DI0Ef3P6oFbYgHHIYls=; b=mKXwf8NkU1im2WKa
	jEQwtcVRi4W7XR96v6m6GEHgwMtRoBm4GvPICdJql7fuzZENJqhFuS/E3xRaZpj5
	+4/S2QFS/Q1bZ1qM0VTTAS/qMpeW2KXgeztZfzyuk+J9ZAfl+dGK26Dd4jTGAzgI
	PObONNXJpsPcJM3hAjkqgcD4uxf+NqufSeWaZ8cvhGCcokeVjSjihZQT7LknhZEF
	qYcmJJe/uu5Tw98gXdEZX3MxSvrcakyPX8vS1Y5wgQUW+A6Po+TjO0JjMoRx4u1g
	DZVmNOvqwcaa6j2DiKzBZuW+E1F2omo2t7LGfVWhSh/fer0K5oCIIoYbKyHIxxfJ
	ZPsM3Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc1csy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:50:48 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e7131849bso32047a91.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 11:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784400647; x=1785005447; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/gWE/9u3scX7ScXyAJclC+r8DI0Ef3P6oFbYgHHIYls=;
        b=dCQS51XmP14PvMG/Mihpz7jpoGZn0mIk53RW3TUwMt6VAAH6o0U2gLoHHXAC9QKGmD
         /OKnvfQyegcSVHROpvureJFSGQ6j+DQcD1y0px60HLJ+qXzl9EtQ/18gQf+WMhUUD2Vu
         XC5kR2GDZI+WCEYmg5pNP0WK0lzFIatNqoAin96hd73skOQeGw0MQnvJe+BCRojRI0Os
         4/APjbpYIgKA4SVksHMAo3EyP8MPa0MGYlN13l4QtHxQeSdORBt8S5K2fkodvFdw6q3A
         ElxtkCwXtCDOpPvM4DiM0zZJXyb+gc15YSK46hx61Id6onFGbr04oP3gk9Zwkp+yP7vp
         7h/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784400647; x=1785005447;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gWE/9u3scX7ScXyAJclC+r8DI0Ef3P6oFbYgHHIYls=;
        b=hKpGgbC4CEdZovktbU1s0bBWdSvow7UUSiPD+QAcJqa196jDnrA8rbg9SP4YVrz20N
         ACAhJhLf87zenoODI1HtaGq08IZ/P7EhxtATmUMKW5d0DBZHEcQacEN3onlB0G0lk1OU
         DJzYY1p9ZlFDXjli+PiM5g5E1q2M9G+tCVue2AIjjyi+uVR8opQNT9PYbFm0ezcMbv/P
         M2D+ymwvlovkfIHtUwPlLCxyGnzikcS/+dkQDr/0D/lDmh/WezuM9heIU5ptd7CC62cD
         BhMwqRLMkPGOs6xLrpQtNlYE+nCPwe6C8KNugftRpqCmFuhyYNGUIlJUr4mJOUYgb8FT
         4gpA==
X-Gm-Message-State: AOJu0YxEZCxzJ8VEap5q/9kvzqbwzbjj6aAFSL9KdIwqrzPFDgY0pRpu
	gbTSZNAY4M7J86goLz8SeSywPjZUkvcqGECYZYe66j/ubfZepe2zuri3QJtXGXTDyYvtRSxOEv3
	ygP5QzQ25kQAfP/lGMhocyoi706gFbCAwtDmj3PajjVrAzMiPC3vU9gRvRsUKpVdNRu8o21Cs5M
	lYpXE2CCf1
X-Gm-Gg: AfdE7cn9oXlAeBAkCO7wrHFvR+yUO77/CjjiDylenBNRmBE9g178FYaVn8hjZr8cx7/
	Eccj3vGV8iIJYgR6MFwD/vOtkv+V0WQLqi2p7M5EwQVVEdp3jIfOEIBZvh/0Tbkc5THT7wd4UP3
	0MRIoM8ZWVYtcFPOxHV+8KwzYARHDU0Yc88alVxQWHi/mF7MXY8bQjciNE6GDW/IGhXo0qdLQ/9
	zFbLfnubFAgy0/xdy5tvK2eWnyyXhqKgk5oxyiVMG6qPHHnyb89wwydBb08Xi6NBNyRQnjENb1z
	hfY1NA4TNFE75f6AEPOyUt6Bfz5z0sYlPBJbi6vxWfiqIRubsMtDqsE5KHxtq6Ypp9Jj1APjLwz
	XNQd/mg==
X-Received: by 2002:a17:90b:4a8c:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-38e4b43c580mr8900797a91.2.1784400647532;
        Sat, 18 Jul 2026 11:50:47 -0700 (PDT)
X-Received: by 2002:a17:90b:4a8c:b0:37f:be6c:f3f2 with SMTP id 98e67ed59e1d1-38e4b43c580mr8900747a91.2.1784400647041;
        Sat, 18 Jul 2026 11:50:47 -0700 (PDT)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm16761689c88.14.2026.07.18.11.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 11:50:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 02:50:41 +0800
Message-Id: <DK1X8I3XU0ZV.35WU5KISIRV14@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <Frank.Li@kernel.org>,
        <imx@lists.linux.dev>
Subject: Re: [PATCH v2 8/8] drm/xen: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com> <20260716-drm-simple-kms-removal-v2-8-1133a8fc3785@oss.qualcomm.com> <20260716092822.8E0941F000E9@smtp.kernel.org>
In-Reply-To: <20260716092822.8E0941F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE5NyBTYWx0ZWRfX+N+QV5JtU6yR
 7EsAchrqo/v6uKtofSYvDCBjqRLFm9DIF4JkxuhwWRHssunabtXvYuFQfqK9HT3muv7DgahMLJZ
 OruE6dbAnNkdyrGLMi06onRRmj3e40U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE5NyBTYWx0ZWRfX5C7X2qtg1igX
 1iNcw56SaHVVmcaPmzLvU14QWNSI0D7mRP93jE1kBnnlWIe63fHQaFvmWWM+1joKwATef/HGp2I
 sdm3KuCtDw3z81m5io/EcC5ycmgLm5AgYgt7EnRcPRsjHMh6HxgsbNeGw8hFRrvblCEqvZvPV+4
 pOKvCj/mizS86boRS6P+31owLXdDDGoXQDILbc3OL8VC6QzoPjJLKSe/CwIZQ/HvMy7bkmJvCYL
 BUE6MhHR6R+pKMmP9eXtLzo02eAKLSBDONGDLeyLMAmhjQxy764jbpZcCfeWrAhEJ+5IS0uXnit
 pMARIXShK2JBSrOnu0HxiAfv7ExCrOUp6M/Pthr7yCAydbt0lc+RHPZbOcCDWQJQG+Va8eziXsc
 A3pcModrH5rVYf9uc0xKGyIhmdnWFMEJj6i5IlwkWgGz7FKnqULodA2W0NIsv7lPidhdhRnJoag
 M9OrxQr4vChiU1ANi9Q==
X-Proofpoint-ORIG-GUID: qKFMQkVGi4D595sLhkPr1uRdidrD3Q4O
X-Proofpoint-GUID: qKFMQkVGi4D595sLhkPr1uRdidrD3Q4O
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5bcb08 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=2wNEMWLOeZIxy7tF4AQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180197

On Thu Jul 16, 2026 at 5:28 PM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] Global state data race in `atomic_enable` leading to a NULL =
pointer dereference.
> - [High] Pending vblank events are leaked when the CRTC is disabled, caus=
ing userspace to hang.
>
> Pre-existing issues:
> - [High] Global state data race in `atomic_update` causing stolen events =
and userspace hangs.
> --
>
> --- Patch [8]: [PATCH v2 8/8] drm/xen: replace struct drm_simple_display_=
pipe with regular atomic helpers ---
> commit 545da3a98a8e32db9ed9bc44680620afafb3b601
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/xen: replace struct drm_simple_display_pipe with regular atomic helpe=
rs
>
> Replace Xen frontend simple display pipe with explicit plane, CRTC and
> encoder objects for each pipeline.
>
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/x=
en/xen_drm_front_kms.c
>> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
>> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
>> @@ -105,24 +111,21 @@ static void send_pending_event(struct xen_drm_fron=
t_drm_pipeline *pipeline)
>>  	spin_unlock_irqrestore(&dev->event_lock, flags);
>>  }
>> =20
>> -static void display_enable(struct drm_simple_display_pipe *pipe,
>> -			   struct drm_crtc_state *crtc_state,
>> -			   struct drm_plane_state *plane_state)
>> +static void xen_drm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					      struct drm_atomic_commit *commit)
>>  {
>> -	struct xen_drm_front_drm_pipeline *pipeline =3D
>> -			to_xen_drm_pipeline(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct xen_drm_front_drm_pipeline *pipeline =3D xen_drm_pipeline_from_=
crtc(crtc);
>> +	struct drm_plane_state *plane_state =3D pipeline->plane.state;
>> +	struct drm_framebuffer *fb =3D plane_state->fb;
>>  	int ret, idx;
>> =20
>> -	if (!drm_dev_enter(pipe->crtc.dev, &idx))
>> +	if (!drm_dev_enter(crtc->dev, &idx))
>>  		return;
>> =20
>>  	ret =3D xen_drm_front_mode_set(pipeline, crtc->x, crtc->y,
>>  				     fb->width, fb->height,
>
> [Severity: Critical]
> Can this sequence cause a NULL pointer dereference?
>
> In xen_drm_crtc_helper_atomic_enable(), the global plane state is
> read asynchronously and fb is dereferenced directly.
>
> If userspace submits two non-blocking atomic commits rapidly (the
> first enabling the CRTC and plane, and the second disabling the plane),
> the global state pointer (pipeline->plane.state) is swapped
> synchronously during the ioctl.
>
> When the first commit's worker executes, it reads the newer state where
> fb is NULL, and unconditionally dereferences fb->width.
>
> Would it be safer to extract the state from the commit object using
> drm_atomic_get_new_plane_state(commit, &pipeline->plane)?

As replied in patch 5, will do

>
>>  				     fb->format->cpp[0] * 8,
>>  				     xen_drm_front_fb_to_cookie(fb));
>> -
>>  	if (ret) {
>>  		DRM_ERROR("Failed to enable display: %d\n", ret);
>
> [ ... ]
>
>> @@ -131,13 +134,13 @@ static void display_enable(struct drm_simple_displ=
ay_pipe *pipe,
>>  	drm_dev_exit(idx);
>>  }
>> =20
>> -static void display_disable(struct drm_simple_display_pipe *pipe)
>> +static void xen_drm_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +					       struct drm_atomic_commit *commit)
>>  {
>> -	struct xen_drm_front_drm_pipeline *pipeline =3D
>> -			to_xen_drm_pipeline(pipe);
>> +	struct xen_drm_front_drm_pipeline *pipeline =3D xen_drm_pipeline_from_=
crtc(crtc);
>>  	int ret =3D 0, idx;
>> =20
>> -	if (drm_dev_enter(pipe->crtc.dev, &idx)) {
>> +	if (drm_dev_enter(crtc->dev, &idx)) {
>>  		ret =3D xen_drm_front_mode_set(pipeline, 0, 0, 0, 0, 0,
>>  					     xen_drm_front_fb_to_cookie(NULL));
>>  		drm_dev_exit(idx);
>> @@ -147,6 +150,11 @@ static void display_disable(struct drm_simple_displ=
ay_pipe *pipe)
>> =20
>>  	/* Make sure we can restart with enabled connector next time */
>>  	pipeline->conn_connected =3D true;
>> +
>> +	/* release stalled event if any */
>> +	send_pending_event(pipeline);
>> +}
>
> [Severity: High]
> Does this function leak the vblank event when the CRTC is disabled?
>
> When moving away from drm_simple_kms_helper, the driver loses the core
> helper's automatic consumption of crtc_state->event during CRTC
> disable.
>
> If userspace submits an atomic commit that disables the CRTC and
> requests a vblank event (e.g., modeset to 0 or DPMS off),
> xen_drm_crtc_helper_atomic_disable() completely omits the consumption and
> signaling of the event.
>
> This leaves the event dangling, which causes a kernel warning in the
> commit tail and hangs the userspace compositor indefinitely as it waits
> for the pageflip event.
>
> Should this function pull and signal the event from
> drm_atomic_get_new_crtc_state(commit, crtc)->event?
>

I would like to preserve the original xen frontend behavior here.

> [ ... ]
>
>> @@ -242,12 +261,12 @@ static int display_check(struct drm_simple_display=
_pipe *pipe,
>>  	return 0;
>>  }
>> =20
>> -static void display_update(struct drm_simple_display_pipe *pipe,
>> -			   struct drm_plane_state *old_plane_state)
>> +static void xen_drm_plane_helper_atomic_update(struct drm_plane *plane,
>> +					       struct drm_atomic_commit *commit)
>>  {
>> -	struct xen_drm_front_drm_pipeline *pipeline =3D
>> -			to_xen_drm_pipeline(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_s=
tate(commit, plane);
>> +	struct xen_drm_front_drm_pipeline *pipeline =3D xen_drm_pipeline_from_=
plane(plane);
>> +	struct drm_crtc *crtc =3D &pipeline->crtc;
>>  	struct drm_pending_vblank_event *event;
>>  	int idx;
>
> [Severity: High]
> This is a pre-existing issue, but can this code steal events from
> future commits?
>
> In xen_drm_plane_helper_atomic_update(), the global CRTC state's event
> is accessed directly:
>
> event =3D crtc->state->event;
>
> Since crtc->state is swapped synchronously, it may reflect a future
> commit's state by the time this worker runs. The worker would then steal
> the future commit's event and clear it.
>
> When the future commit's worker runs, it finds no event, while the
> current commit's original event is stranded on its old state object and
> never signaled, resulting in userspace hangs.
>
> Should the event be fetched reliably from the specific commit object
> using drm_atomic_get_new_crtc_state(commit, crtc)->event?

Will access crtc state with drm_atomic_get_new_crtc_state(commit, crtc)
