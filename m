Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DB743F084
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784398600; cv=none; b=AJUSfWdU0Rt5MDuFAYo6HP7B3v/l492a6rF4+nJgLn0wBiyAKuVhlXJzJe1u2lhCPpq0c6+i1U/cjbVjbzluQIBWGuGyLG/R6+xjrBIVzQTyY2raQZLKgXbKYLvz2whLdaGqNnMI3YCtMbshlBsk/P+Q0A3aiQR0sYbM721bnj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784398600; c=relaxed/simple;
	bh=zyIXv5YN4QuKfmu+YUDfsaC3kp/sDw1VWkkkxQyrWNk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=X/e6cUaJTbyXrXurG/c5AkoyofTKEakNTH8UnXf8Gk7i6ziBr1wtGQSPsdop3EF0WDVs11e2M4c/vVxL+a/Ww4isOanSS6NdCNfltnyOlKLa5SH9j4MdtcuQDFID03/SW4OeMXZURktcXd/sf+uE1jypZ6h8AefI2D7R1f/HMU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OPe5zs5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c6+JOhyN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OPe5zs5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c6+JOhyN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IGPjd8933537
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tCNRVTRkp/G6AntkwvDscMObFkyZh4fS2lMKxSwqpm4=; b=OPe5zs5+pTUkQtnJ
	MynoCpHFquH225osLPTuLNdd7c4UDs9VsLgOQLa+C6aIstNdSUQcl/sXSepeEhpK
	UAq30piwryTlIEe2AIf59DLlsKr0K4LVcCs7JF1mbkY/ui30FeJXQtVReabViqRJ
	Vn1FVlpEm4rb8XetTnhNsVyYLDx0g80+3jbzE+Fv7dwKNtRs42eUaxTIbIMd1scB
	O8usezDnmh98mPQqQDSgxhVvbtSDod7MKCXY8HojVjYaHkKenxZlEpHASMfjNU82
	4eTmKgjDqFcZjGsiJ5J9KaQaGpaeFc97MeAf7Td7hO5wQEfc+Xu4mPqOsIwTUQT3
	ac1MQQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2s7s8gd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 18:16:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso670853a12.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784398598; x=1785003398; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tCNRVTRkp/G6AntkwvDscMObFkyZh4fS2lMKxSwqpm4=;
        b=c6+JOhyNFtglPEUJEUvPHqwXRTbr/jGBIakshbwiJ4ppxPEAYwRStManSVS+pg/Z31
         MCVVuKDfUEFIn7+qf0Y1brvitTXNclDNRPRqgbJ+hpSqVy3B81yPa1nmC2/dwq2nLMfp
         Qmw0PdZ7n9m+fsukfI1gCAtGuK9jmNXC26NfxI2jSQje8GE4M+ppyQfHdUXmlJelClZ3
         1p8puQOqVA2hWOMpuDVKXqfo8leXuULrRM61+a8unR7cYlOEmBgawmfs0LzVlzIfrx9/
         CaB0oZ54lInbqqAZX2PgLcLhHB+EOhMIsz45QAU+kBU58sJpiFEy/1QzWMUOZ8qabMZk
         uyQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784398598; x=1785003398;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tCNRVTRkp/G6AntkwvDscMObFkyZh4fS2lMKxSwqpm4=;
        b=QE3FjCXD3GlZ7Rofn+YcHcIKht69YWc2niLiy0eQQhYfCngmrl0kY+2fWRxEBd8SC6
         WuD6BhV47OjesJtvDUExMb4UGizrdJzCwDXHCy5XgGy8o7h2vjSzsGrqWSrDQu6Nxlz9
         aGd6Zs8R3inmQiXGEmf/daYwH2Z6XZNpTCHck24numg8L16Ox/4Tc3J8VYLIjpvsA2A/
         +opuhXroqFAn3c4/XcTbCG7v8SztL5GHzXCYNG2h6hHdO87lGPjxl0ZBKt6I29WwAITj
         LUygZ2akxx6TCxNRXv4PcwtNiTJNgEhvSKWKu5GWaTgzyaLeroYnroXHiFC/7gllMC7o
         Z2hQ==
X-Gm-Message-State: AOJu0YzsjOv1xwtFUtKRHXxK2DY1GpYNRgYfQmro5Y/srKJg6sNOhye7
	a1FO51j01app5irgU6vR+GsRAZBg+cpfVkGe8eB5QD9Y/EjDl00loGZgo8I1jsD+u1Tro6az5Pq
	Kn3lruXjZVNkO1AxfTyNX+An06ZkRe+zafaZKZ6NbqQD65fLNILQUuUacPtvSrk0+K+M3gJjq4I
	6Nf2BMVvWE
X-Gm-Gg: AfdE7cn0a18i994TMxUQWv3gTUAvV6BQ8OWiv0a1HQMdLaWCkiYxxDWOPUCqVr3ER6T
	tkBdjR5RNA+hKFA1FrXB9tT2c6+N8bJBMyhYh+iGfviU+dORjDJSJn4JipJCjaMRxpj5ZJnjESr
	7YFPGGGpsAjq1b9A5a7ZMoNE6P6dF5qncJa4E45PtDOBsMouIN9Dv0JF5dC2kRaxu+oY3rjq0dP
	xyKBFw3le8axPFHnL1ru+nbAAIqZLH+g6NSHkp8hgYWyhXBVEjlJNVPGNld8gEGgk5atqurN4ZJ
	8qZ5KSLPSk3LdvV0tnURh0fTZw8fwoWLFsGpEe5w3q7yImgA2iFLX49sTTCwnn7LYGgPigeEJG3
	6O3PtpA==
X-Received: by 2002:a17:90b:520d:b0:380:534f:58c2 with SMTP id 98e67ed59e1d1-38e4b59bd1amr7780802a91.30.1784398597660;
        Sat, 18 Jul 2026 11:16:37 -0700 (PDT)
X-Received: by 2002:a17:90b:520d:b0:380:534f:58c2 with SMTP id 98e67ed59e1d1-38e4b59bd1amr7780778a91.30.1784398597223;
        Sat, 18 Jul 2026 11:16:37 -0700 (PDT)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cd6e6esm16268841c88.13.2026.07.18.11.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 11:16:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 02:16:32 +0800
Message-Id: <DK1WICQ7ML3R.302LNW6ENFBSP@oss.qualcomm.com>
Cc: <Frank.Li@kernel.org>, <dri-devel@lists.freedesktop.org>,
        <imx@lists.linux.dev>
Subject: Re: [PATCH v2 6/8] drm/repaper: replace struct
 drm_simple_display_pipe with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com> <20260716-drm-simple-kms-removal-v2-6-1133a8fc3785@oss.qualcomm.com> <20260716092142.355731F000E9@smtp.kernel.org>
In-Reply-To: <20260716092142.355731F000E9@smtp.kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE5MCBTYWx0ZWRfX5BRdEW2a4v8j
 MHk0HjMEtPN3DBcBjK92TBSaviVyv5di0+nRoN3Q0FJ0aFBScKaIb235e4BlRrMhety3fTLT5hV
 IPQQ3EcblT6YjCYhNofwLDCqL7tUbc70ow3MnlP0Zs4ydrm2bY2dPZkN24iMIoH1O7hrkJ8N9Km
 jZYAuTLJkZVBbZhd/RGgP7aWO74Gupe6KmxeBZrF7KzsekdNhCUax3aZN5qjUu4RMYlkBwtl6e3
 JlvS5Piq6n0q6pfRAhCEPCsg71dGTXFGjhlZ42jlCNRuSy6+LNCPvj4Q9/dtJdVEB8AWN065F04
 qCSxzhGSk4ZH0no+SZ3ek4LtGC6UwVKJNfwXnbgHVgGOwATW3/tlnqeRg8fBI6nERgxifI0vm0p
 cWqwLBRiifdTEHrjCTYJ2XzCuyhtbKoyCjfx3ah/v8vWWnjFqtA67F+u527ZCdUzgX/GmxL0lCA
 dmuA1N03rUZeeso4x4w==
X-Authority-Analysis: v=2.4 cv=eKsjSnp1 c=1 sm=1 tr=0 ts=6a5bc306 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=wfJsz4XN5BKgQ9I0DyMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: gFjOcIOu1NUQveRB0bzeKUPWdgRWNWiI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE5MCBTYWx0ZWRfX9bXWorvI0lVW
 0r8okvF0LTKOZOxY4R03j+QzSB2eizm0Cm1CyTWK5JEWI/WybTqLGgpIi7xvgpnvCAVcO5XQ79e
 +AV7sL5bOEOG2OyctdL31kuIUWjssb8=
X-Proofpoint-GUID: gFjOcIOu1NUQveRB0bzeKUPWdgRWNWiI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180190

On Thu Jul 16, 2026 at 5:21 PM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Missing CRTC active check in the plane's atomic_update callback =
causes the driver to send SPI framebuffer updates to a powered-off display =
panel.
>
> Pre-existing issues:
> - [High] The CRTC atomic enable/disable and plane atomic update callbacks=
 execute sleeping functions and allocate memory with GFP_KERNEL, which is f=
orbidden in atomic context.
> --
>
> --- Patch [6]: [PATCH v2 6/8] drm/repaper: replace struct drm_simple_disp=
lay_pipe with regular atomic helpers ---
> commit 3d9748839d37276a557c720301a5a848296e54b7
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/repaper: replace struct drm_simple_display_pipe with regular atomic h=
elpers
>    =20
> Convert repaper to explicit primary plane, CRTC and encoder objects.
> Keep shadow-plane helpers, framebuffer access handling and no-scaling
> plane-state validation from simple-KMS path.
>
>> diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repap=
er.c
>> index c8270591afc7f..7057075161c4d 100644
>> --- a/drivers/gpu/drm/tiny/repaper.c
>> +++ b/drivers/gpu/drm/tiny/repaper.c
>
> [ ... ]
>
>> -static void repaper_pipe_enable(struct drm_simple_display_pipe *pipe,
>> -				struct drm_crtc_state *crtc_state,
>> -				struct drm_plane_state *plane_state)
>> +static void repaper_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					      struct drm_atomic_commit *commit)
>>  {
>> -	struct repaper_epd *epd =3D drm_to_epd(pipe->crtc.dev);
>> +	struct repaper_epd *epd =3D drm_to_epd(crtc->dev);
>
> [Severity: High]
> This is a pre-existing issue, but do the CRTC atomic enable/disable and p=
lane
> atomic update callbacks execute sleeping functions in atomic context?
>
> The DRM subsystem explicitly forbids sleeping in CRTC enable/disable and =
plane
> update callbacks. However:
> - repaper_crtc_helper_atomic_enable() calls usleep_range()
> - repaper_crtc_helper_atomic_disable() calls msleep()
> - repaper_plane_helper_atomic_update() calls repaper_fb_dirty(), which
>   allocates memory using GFP_KERNEL
>
> Since these operations are now wired directly to the standard atomic help=
ers
> which run in atomic context (for example, during non-blocking commits), c=
an
> this cause system instability or deadlocks?
>

I think it is a false positive.

>
> [ ... ]
>
>> -static void repaper_pipe_update(struct drm_simple_display_pipe *pipe,
>> -				struct drm_plane_state *old_state)
>> +static void repaper_plane_helper_atomic_update(struct drm_plane *plane,
>> +					       struct drm_atomic_commit *commit)
>>  {
>> -	struct drm_plane_state *state =3D pipe->plane.state;
>> -	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_pl=
ane_state(state);
>> +	struct drm_plane_state *old_pstate =3D drm_atomic_get_old_plane_state(=
commit, plane);
>> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(comm=
it, plane);
>> +	struct drm_shadow_plane_state *shadow_plane_state =3D to_drm_shadow_pl=
ane_state(pstate);
>>  	struct drm_rect rect;
>> =20
>> -	if (!pipe->crtc.state->active)
>> +	if (!pstate->fb)
>>  		return;
>> =20
>> -	if (drm_atomic_helper_damage_merged(old_state, state, &rect))
>> -		repaper_fb_dirty(state->fb, shadow_plane_state->data,
>> +	if (drm_atomic_helper_damage_merged(old_pstate, pstate, &rect))
>> +		repaper_fb_dirty(pstate->fb, shadow_plane_state->data,
>>  				 &shadow_plane_state->fmtcnv_state);
>
> [Severity: High]
> Can this cause the driver to send SPI framebuffer updates to a powered-of=
f
> display panel?
>
> The previous code checked !pipe->crtc.state->active here to ensure we
> do not update inactive displays. During a DPMS OFF request,
> drm_atomic_helper_commit_modeset_disables() runs first and disables the
> panel by calling repaper_crtc_helper_atomic_disable().=20
>
> Next, drm_atomic_helper_commit_planes() will still call this update
> function because active_only is not set by default and pstate->visible
> can remain true.
>
> Without the crtc_state->active check, doesn't this result in writing data
> to dead hardware via repaper_fb_dirty(), potentially causing SPI timeouts
> or driver hangs?
>

OK, I'll restore crtc state check here.

>>  }
>
> [ ... ]

