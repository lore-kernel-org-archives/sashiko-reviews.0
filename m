Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48EC03B19D6
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 14:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521912; cv=none; b=Xphpa41Eij9ufC1D+uqBGjD/DODajMCrN4qMqISVM7M8FqL54wQCvvenTiIREc4TJDsT/70bdeU7DauHA0IDiJYMMCrTl0tgaUaXo0vYWc/yX270Ow2kqdNpgtZo6/ZK53AR2JaBNymIfRX9nXcnpgmu1j13VpLqNde/jDm9PYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521912; c=relaxed/simple;
	bh=IeN9WAeJEeMz8vA/hpWE1WXPKajEhYQVcd/X19+dE78=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Ba1PdP9z8nrK7O2Dbbg5Gmy9icmNL9wX+mFB9viq7fYI6NYo69+jSbXvGfbKk4yLCMwSwTw2+beH/NsURtXpTLfq+cBQpfjy5DxYFv9LZYv7tRdIRy05zRacCS/iwaqdzHfmQJ7FdMl/8c0kL7vbeTbA7UMDFoUSJj4N6OJdcYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jgbop/F0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IKG3KSFa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jgbop/F0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IKG3KSFa"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3EN72751436
	for <sashiko-reviews@lists.linux.dev>; Wed, 8 Jul 2026 14:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5HotaLJOpxQKOWfRZToEfRIMXX4F1I/5+Refyn+Gzmo=; b=Jgbop/F06M/fLxuR
	Ld/hazN0kxogXEm0oYZWh3+HLlQXPdoDxHaJXMA6JhYDBG8snm/OiBruJBjQCfrB
	IYLJIe5YdqA5fPqJxLyGTwspMkv5gq4mCarcBG4pFEZEn6Rk5KQmADMzscrV4+BB
	ScPU/O3CasZcORibe7bOkbStOgpLTCWDmYGGe+v3b/ZyogNA9b4Wy4ZjVaCFTM+v
	uJGy7RoVrYP5feyANUoOWZuJ4yLXZLsoEZIhFthnw7i5fziIeaTWqQWJN1UEytCF
	3i0BmEBo9OkxLMeZU134pFbmfSRXsUVFe9/f/GY7c1wBKUyqD9EZOUjdiZaxJqcs
	Q1t6pw==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hj7xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 14:45:09 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-448d61d82e8so359799fac.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 07:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521908; x=1784126708; darn=lists.linux.dev;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5HotaLJOpxQKOWfRZToEfRIMXX4F1I/5+Refyn+Gzmo=;
        b=IKG3KSFaAXNM3DrtLvBoYGw1SiCISUdzda5GMNz/XGO9YtqCz9MIJ9jeqMhHtf9p+9
         Yd8GlGRT4/XqEKWKR8WDdO/aDIM5AnmTdT3fyafsHpgJ8N3q6W8HY0zysopsOrRIi+4Z
         N4oBrgEG6Io2NIqz6d5Njv2WQLTRP0u8GfJMCKqZYiNLcUsvq6ylIWF/sGJbgBrvUdYC
         Hqmht39X+/7WGWPL5WXySoag9ACxWxL4Mgwf6B3BWabtHHr0cs/6j04NvLpyfmAPVtuB
         +lemTmVC1H+7z5QlScn5B1MKv5oYFQE+gSq1UKtuMNpJtjJrUiEhTIYULGYaV6QRWdTD
         UoWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521908; x=1784126708;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HotaLJOpxQKOWfRZToEfRIMXX4F1I/5+Refyn+Gzmo=;
        b=aMVjtHYUnHF2UWq+DlUsPwzQqm0psW1gzDmTOpT0IiNOPMyRh4ukzfyPJ+HWtytfX8
         sgGT3tRBZQ/8LXo26yTXMKtu6LZInRqqYScjlzM1XKGitKtoNeamKooEeZf7I1AGEQaP
         uyCpdZtwuRk1XzwKOIsPy6nTANdXApwGfM6V/Gjv9FzXzxzvRReJsqYDdI+5fw43OeMu
         GcktXTxccFsGMPGJjTaQyw2JGnBWbP8+UuMGBtgR5Cv9GyWkCliJ6tpglsdBVGlFJyv9
         CK5unbI7zq/92epD62yfCshuAoKruzvlzngYLGPK9DChfIVQTQBbMnhW/pe4+NHMgRkC
         KzsQ==
X-Gm-Message-State: AOJu0YxaD8IPk7lKc7FI+fvrLQZXGOL5h/amaSeyHGSFPiA12aX4PKi3
	llC5Ld2+NsuHeFkmDV1tRLrqA2zQuJsedvM9+gsnHI9c67TDnmB2tr8KO1FYUHFnjw2af6ML4zc
	RSnfmMqbHC6MBW5LdzlVyblZEx+9vQvG96IzQVZS337Ki95A319wFpl9zVsBTxXcZnPyGyNugqr
	ReHV0fps/V
X-Gm-Gg: AfdE7cmjPpO2fBpUfVhSQl+iaxEf9oOd88oZ4/ruJ5QdAHCyPck6kQdRPMfN9hFqoIn
	1iI5zXMQpUPnRVgD9LdCN16ot8z0bMf0P/7Q8j9bexJ+Dwd7n8f4+zVj+NvUEKZR7YzLpFnYtT5
	v9pgDP+xkinp0mUa7vG074VE6LF9IfRDIJDvxwguioKqD0NkR8Ij1ErPPF4w/SiKSVizdvlw4Ue
	/hwbZwCZ80xRu+9PQ+fJT/S8TuWJgLBWs6etozjrOgO4fRZJxlNMrNP+S9NX2fkLwtdYX11Ht5u
	ikqZEaJtImL5v9RpSapHMBgu2/Q3z/lT/3ZBhu4YAw83EPPEOZUr2A4xLe8VkftbZxycBvGxJhh
	Must1RQmfOxwrABk=
X-Received: by 2002:a05:6870:2150:b0:449:bccf:bb6e with SMTP id 586e51a60fabf-451637bc19bmr1788789fac.7.1783521908555;
        Wed, 08 Jul 2026 07:45:08 -0700 (PDT)
X-Received: by 2002:a05:6870:2150:b0:449:bccf:bb6e with SMTP id 586e51a60fabf-451637bc19bmr1788765fac.7.1783521907887;
        Wed, 08 Jul 2026 07:45:07 -0700 (PDT)
Received: from localhost ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb559559sm17037998fac.9.2026.07.08.07.45.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 07:45:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 22:44:52 +0800
Message-Id: <DJT9QUB9KH7L.ULPE8GOZ3RS1@oss.qualcomm.com>
Subject: Re: [PATCH 4/9] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <Frank.Li@kernel.org>,
        <imx@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-4-b4e1ca053623@oss.qualcomm.com> <20260704184456.8C1571F000E9@smtp.kernel.org>
In-Reply-To: <20260704184456.8C1571F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NSBTYWx0ZWRfX9di7vgC1Hn+x
 aSkAcdWA6Y9JfuIb1mCd4PgK7VGS0D56GrT1xNmK7AWRyUupk9D3X4upG5YrHw+0ez6nPXbWzFg
 RxBEawnNGq8IEN3oX71+VWuK0hLF8kaClBvngzBEcd7s9gT+n627JsyHjNflSmCL+8BnSrJHo5i
 URzR2MGxCaPJ1n0X+UF/C7fxg8g5GP7dIREBn1t4670/ygXEdGk125oDM/cBm/lBywEd/yije7y
 8asECkHfwTV8ayPeJl4MsDniEYTK7Rkl2KIP5e+e7d26XqkQr0E9ctF26r5iO/RqVRKV6Rxe8m3
 llsYcDmLJ0D/S+mP/ym+HfPWhOd+Pr9R4BDFYR823/ibMEB8/KPEXR+4iV/5pnVdI54ZKGGX4uZ
 gy1/4pmIjZdQhdcnJO8CwmYOdmjl2NpAeSq4m4KkSMSHbyUvYXDpe164I3BEiwvZlsqs2W9W5mO
 U/N5X12mF8m4uH+YAeQ==
X-Proofpoint-GUID: RW0xEz8pSrCNwG0vn3vSrthwhB5YXmSz
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e6275 cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=yd_HwtBYiBPprMbcnowA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NSBTYWx0ZWRfX/HcoFzwTI1nl
 6ff0beDTza2y2LUGgbeWtlu3Mj1eK3HkIlWIg9H6Wdc6VcmcqSYAGr1JdJgZ9h6LmHSjN5orGZ5
 bzKkcqiYM6kpv/HCIyurvfiZ0eWBwf4=
X-Proofpoint-ORIG-GUID: RW0xEz8pSrCNwG0vn3vSrthwhB5YXmSz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080145

On Sun Jul 5, 2026 at 2:44 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [Critical] Uninitialized NULL pointer dereference when attaching encode=
r to connector.
>
> Pre-existing issues:
> - [High] Atomic callbacks directly access global `obj->state` pointers in=
stead of using the state passed in the `drm_atomic_commit` parameter.
> --
>
> commit 098f44a54758ae5b340970e3384cc9330909fb06
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/mcde: replace struct drm_simple_display_pipe with regular atomic help=
ers
>    =20
> Convert MCDE to explicit plane, CRTC and encoder objects.
>    =20
> Keep FIFO, event and framebuffer update sequencing intact, and install
> GEM framebuffer prepare callback explicitly.
>
>> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/=
mcde_display.c
>> index 257a6e84dd583..4d86fa5030ebf 100644
>> --- a/drivers/gpu/drm/mcde/mcde_display.c
>> +++ b/drivers/gpu/drm/mcde/mcde_display.c
>
> [ ... ]
>
>> @@ -1149,16 +1171,14 @@ static void mcde_setup_dsi(struct mcde *mcde, co=
nst struct drm_display_mode *mod
>>  	*dsi_formatter_frame =3D formatter_frame;
>>  }
>> =20
>> -static void mcde_display_enable(struct drm_simple_display_pipe *pipe,
>> -				struct drm_crtc_state *cstate,
>> -				struct drm_plane_state *plane_state)
>> +static void mcde_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					   struct drm_atomic_commit *state)
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_plane *plane =3D &pipe->plane;
>>  	struct drm_device *drm =3D crtc->dev;
>>  	struct mcde *mcde =3D to_mcde(drm);
>> +	struct drm_crtc_state *cstate =3D crtc->state;
>
> [Severity: High]
> This isn't a bug introduced by this patch, as it was inherited from the
> simple-kms implementation, but does this newly added line introduce a dat=
a
> race?
>
> In non-blocking commits, the DRM core asynchronously executes the worker
> thread while simultaneously swapping the global state pointers. Reading t=
he
> global crtc->state here instead of fetching the new state from the state
> parameter (e.g. using drm_atomic_get_new_crtc_state()) can race with
> subsequent commits, potentially programming the hardware with mismatched
> states.
>
> [ ... ]
>
>> -static void mcde_display_update(struct drm_simple_display_pipe *pipe,
>> -				struct drm_plane_state *old_pstate)
>> +static void mcde_plane_helper_atomic_update(struct drm_plane *plane,
>> +					    struct drm_atomic_commit *state)
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_device *drm =3D crtc->dev;
>> -	struct mcde *mcde =3D to_mcde(drm);
>> -	struct drm_pending_vblank_event *event =3D crtc->state->event;
>> -	struct drm_plane *plane =3D &pipe->plane;
>> +	struct drm_crtc *crtc =3D plane->state->crtc;
>> +	struct drm_device *drm;
>> +	struct mcde *mcde;
>> +	struct drm_pending_vblank_event *event;
>>  	struct drm_plane_state *pstate =3D plane->state;
>>  	struct drm_framebuffer *fb =3D pstate->fb;
>> =20
>> +	if (!crtc)
>> +		return;
>> +
>> +	drm =3D crtc->dev;
>> +	mcde =3D to_mcde(drm);
>> +	event =3D crtc->state->event;
>
> [Severity: High]
> This is a pre-existing issue, but does accessing crtc->state->event here
> continue to expose a time-of-check to time-of-use race?
>
> If a compositor queues multiple rapid non-blocking commits, reading the e=
vent
> from the global state might clear the event belonging to a subsequent com=
mit,
> leaving the later commit's worker with a NULL event and hanging the compo=
sitor
> waiting for a page flip.
>
> [ ... ]
>
>> @@ -1510,11 +1577,30 @@ int mcde_display_init(struct drm_device *drm)
>>  	if (ret)
>>  		return ret;
>> =20
>> -	ret =3D drm_simple_display_pipe_init(drm, &mcde->pipe,
>> -					   &mcde_display_funcs,
>> -					   formats, ARRAY_SIZE(formats),
>> -					   NULL,
>> -					   mcde->connector);
>> +	ret =3D drm_universal_plane_init(drm, &mcde->plane, 0,
>> +				       &mcde_plane_funcs,
>> +				       formats, ARRAY_SIZE(formats),
>> +				       NULL, DRM_PLANE_TYPE_PRIMARY, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_plane_helper_add(&mcde->plane, &mcde_plane_helper_funcs);
>> +
>> +	ret =3D drm_crtc_init_with_planes(drm, &mcde->crtc, &mcde->plane,
>> +					NULL, &mcde_crtc_funcs, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_crtc_helper_add(&mcde->crtc, &mcde_crtc_helper_funcs);
>> +
>> +	ret =3D drm_encoder_init(drm, &mcde->encoder, &mcde_encoder_funcs,
>> +			       DRM_MODE_ENCODER_NONE, NULL);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mcde->encoder.possible_crtcs =3D drm_crtc_mask(&mcde->crtc);
>> +
>> +	ret =3D drm_connector_attach_encoder(mcde->connector, &mcde->encoder);
>
> [Severity: Critical]
> Will this lead to a NULL pointer dereference during probe?
>
> mcde->connector appears to be a zero-initialized struct member that is no=
t
> allocated or populated prior to this call. Because
> drm_connector_attach_encoder() unconditionally dereferences the connector
> argument, passing it a NULL pointer will lead to an immediate kernel oops=
.

Will drop drm_connector_attach_encoder() as mcde->connector is not used.
