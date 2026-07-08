Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC7E3F12CE
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524578; cv=none; b=U8zdEzhxOWoAXJKPDf0cqByLKW8z2hI1uz+8lE6GF+lqOXmdJXDK2wXCoCGDF1L9TShOYid5T7utj8vX9ZghX51wADWSRkYneE1YSKhAY2ju9VX4kh4iDD28gJFCyQMPbFs23b9Uz7ErHAvt29wEdvTcRMRqMvuYro0xFDt0QVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524578; c=relaxed/simple;
	bh=/EWbXHkDyxmRFCrpZ9sOacNz3FNzYc9YRSOdSm46RNw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=AZzeAhrzITsRukG5RxFkmUQVPt7cA2NGYPhmnt3Wsp8WLQy11TQg+fL0dUVytOeNeyv88aHlvtwbFVKOYvRA6pcyTV+6rxtXzPNEfp/ly00BgCbXiNXrvT3jNOJ4sRlngilgP2MLiRSpea6qhFFXvFfKWKJKB5OGVgbhMOpJs2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MJxcrN1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X85zUz/w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MJxcrN1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X85zUz/w"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3Y0H2667599
	for <sashiko-reviews@lists.linux.dev>; Wed, 8 Jul 2026 15:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	70zYiNfQoqGUZwaTbkI3q8uUAT8YrVOohiWmsnW1WKY=; b=MJxcrN1JXBcMtK19
	Pfev8qimb74w+MKw5k/hUYNzgU+zE4Mw0fSpCrFZ7lOHvxSs7oJm7ErpsBWzwnpI
	un/NMMOnDxsNcpt35kidw/cp/zKCBzjBPf5Jt4Mg8aW5zQgbqsPs64EiB9yHTduO
	hOs/FTUhYu8rcejTKUgvikj1tz5ROiKrcsqFKbvtzLjwOzLrBSUFjar/QB5/mBxC
	Vdmmmh+jeVwJkXXyWVzBj6xnOpcug6wFu1X5gsWcMTLci35ybLIj71oZisxgrzwt
	vWPl0BbEThkIZX4pYpJ2aB1KhJwDUSwlzFmsg10/omwf9phFFsq/4ToVgHjd+VlX
	yF+Lqw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f99hgux3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 15:29:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c354050c34so14296725ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 08:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783524574; x=1784129374; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=70zYiNfQoqGUZwaTbkI3q8uUAT8YrVOohiWmsnW1WKY=;
        b=X85zUz/wYPxCRrdYrYxrifMWDdaqu5nolpM75uygUHllxUSZg9pVSZJ/gVuEaKs0em
         U34lfcFbU6noi1xfxxIse61j3y1GUTmUlZeQiDMjNQ+Ywb+iMOLHMgnXdsg9/pwAgVG+
         9BZ7FTTGOowwSIvy9yWu0MpYXyyJuvKUlwkSnbEL8CiXiPF6em4ooGdY6lQwUQGUM/Yu
         3XBY2a8DWY+f17Xch5PABIJE/o1kytuz+95w4gSYMFWnTpuwO7xBqLRuajUYXjYvQ42m
         eQQhafJpkf6y9v6l2WSkbUUhoOdnCc2GRbqlV42JMpX2glj/2C9/J+I72DpLqi9SaqOJ
         w+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524574; x=1784129374;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=70zYiNfQoqGUZwaTbkI3q8uUAT8YrVOohiWmsnW1WKY=;
        b=ISLj70i8+hE8+HkZ4yexb7I2W1l5DKt1foxrRw6YeD52hzrXf8xKy8CTR9w8ds2Eo3
         kh+HLdpmEy4WymJ6ugKQli7tkiS8We62x0fjAOuZcWRHKxWYP8XI43WQ3TNUeC66IBZu
         TGTx6dYlkWGTrOTU5+xSVkiDFr+Q+pRH9bjsFGzo05lLTCL5+soRTLAT+RINiNn2Jkkf
         9BQf1zj1uCU3w4vQFsYWutyQBUinmJPbUdAe3S2IL2lHIa2Qz8JhazZz12A414yjZ+/r
         eiFNzN11AxpFJoY8OtJ7TAydjdksAKX/1HOOvVmoWgkvArV5avVDQ6tjsdFGQKwLhRBw
         Lu4g==
X-Gm-Message-State: AOJu0Yymblzw5O3Xl7J/zU3CqHNn0FYm5pp2ppb5wRN6HbJM6oBbMlSF
	QneiIZ9gP/9uKprCkFyaGmI6ctS8bnci6rusmshHVR1Szn0R35JgnsxReC5gZU26of3K+gb48UU
	9FMzLnSytgs0MhDJhLnPMKSald5fgHoaLqO4gVVOgmrefM0SMkW3uKZ2mXrRS/G83Xq+t+MNhWl
	lJOnFIhjFP
X-Gm-Gg: AfdE7cmU2gG/Eh3DOicPrk9GZpZsXhMUjvxcixCDTzrXyoKRTMEioldsjc6TljC+7LI
	lKJ7c+ZG3MhB40eNlUckBbRTi/ToY6hdvt1lanRigZ8g3pRDjTziOS1vMlx14KT0jkr4CZuV7D4
	twEU5tnNfLuaBa53nUpS2HBIWvIoUgPf2+Rjwmx3zJdsNZFeDjknfbcQoha+FqInEIf2oLUUWA4
	e/Th8yusaRPRHSoqdL+s1EzIP2Qv29ZBXkFdlL7sKbF9woFsCU19zc+U5Ou7gU9B19SorprbuyM
	6iwXuEIPbF2wH4F4XJGYhZytWhfV0sr99OnsZJxiZeG9STQtx9RUERcOUe7sa4K/sZbtSiKdl6O
	q1FlPpMjDNESsKPo=
X-Received: by 2002:a17:90b:1f83:b0:380:540:d499 with SMTP id 98e67ed59e1d1-3893fe5c05dmr3200408a91.6.1783524574188;
        Wed, 08 Jul 2026 08:29:34 -0700 (PDT)
X-Received: by 2002:a17:90b:1f83:b0:380:540:d499 with SMTP id 98e67ed59e1d1-3893fe5c05dmr3200358a91.6.1783524573598;
        Wed, 08 Jul 2026 08:29:33 -0700 (PDT)
Received: from localhost ([151.243.38.149])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d3c675b1sm2862308a91.15.2026.07.08.08.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 08:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 23:29:18 +0800
Message-Id: <DJTAOV6K82ZR.3T4EZDN7HVQ28@oss.qualcomm.com>
Cc: <imx@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
        <Frank.Li@kernel.org>
Subject: Re: [PATCH 9/9] drm/xen: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com> <20260705-drm-simple-kms-removal-v1-9-b4e1ca053623@oss.qualcomm.com> <20260704185346.627B61F000E9@smtp.kernel.org>
In-Reply-To: <20260704185346.627B61F000E9@smtp.kernel.org>
X-Proofpoint-GUID: Tp9g9Z42p79dTusU15aY_GoCxSbVfR4r
X-Authority-Analysis: v=2.4 cv=CviPtH4D c=1 sm=1 tr=0 ts=6a4e6cdf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=cNux22OjBTKCC6TmznXXXA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=cXiuqu8dGSoeSI90gQIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Tp9g9Z42p79dTusU15aY_GoCxSbVfR4r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MiBTYWx0ZWRfX4gGKTdbs4lvf
 UDw0bWe9bTuVFWvwuoAWW5ve3xJ9+YZIoD2sBdeoyAJrEk3TZFOMc7Gr2cvLXwIg3dbgYC9W9fp
 h8Q21LowIXYH+6XymDr7LGNxHtjbuyA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MiBTYWx0ZWRfX+Ve1PIehEK4t
 1QOzY7BH3lAQCxcnHHzoqMfu68o26w5QKLwmczJntp88D88sOX2mCsGzRKQ9tfFu8sttY3qEYkA
 tARabso4jnxFAXPdZK2P14nY/+P49u6VHYluikO7HtiWOfIBr02hFq4J4DLhKHRIo24WiC/QARy
 2P9J0+eyu4ymqQXtg1L+x2WKqTCKeq2ALw1rd7mx0xbpq3BhdNxDIzlHSz89lMHKKUZRvpx23ih
 D3+vZYuJ/9GBmv2x3ZsDpEa/T1cQrdnpw6hd4VC4HSZSqm3zW0D/QtrbqZM56EgVPSE/Lh41GNa
 VUFpP45302WwglCa5q670enNoyg5yfhfoDwJ0+l4ZkjZ6bG69uscCsa5h3O65JrQPNIqMLg6gk3
 I1Mko0710GzodX4HOSmh1lgta6vj8OcekLXdgfDXxsTIAwuskkZDFlD0NZt+Bfb3t5H7Bpc+OEw
 rZL66yWz5qm7n0m4Awg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080152

On Sun Jul 5, 2026 at 2:53 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Hardcoded `possible_crtcs` mask restricts all primary planes to =
CRTC 0, breaking multi-display support.
> - [High] Direct access of global `plane->state` and `crtc->state` in atom=
ic commit hooks leads to race conditions and stalled events.
> --
>
> commit 8a32b307abb3d8e006d032d01a1802aa1e4ae6f0
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/xen: replace struct drm_simple_display_pipe with regular atomic helpe=
rs
>
> Replace Xen frontend simple display pipe with explicit plane, CRTC and
> encoder objects for each pipeline. Keep generic plane-state validation
> before Xen-specific checks, and install GEM framebuffer prepare helper
> explicitly.
>
>> diff --git a/drivers/gpu/drm/xen/xen_drm_front_kms.c b/drivers/gpu/drm/x=
en/xen_drm_front_kms.c
>> index 48772b5fe71cf..57e1bef452f83 100644
>> --- a/drivers/gpu/drm/xen/xen_drm_front_kms.c
>> +++ b/drivers/gpu/drm/xen/xen_drm_front_kms.c
>
> [ ... ]
>
>> @@ -105,17 +105,15 @@ static void send_pending_event(struct xen_drm_fron=
t_drm_pipeline *pipeline)
>>  	spin_unlock_irqrestore(&dev->event_lock, flags);
>>  }
>> =20
>> -static void display_enable(struct drm_simple_display_pipe *pipe,
>> -			   struct drm_crtc_state *crtc_state,
>> -			   struct drm_plane_state *plane_state)
>> +static void xen_drm_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					      struct drm_atomic_commit *state)
>>  {
>> -	struct xen_drm_front_drm_pipeline *pipeline =3D
>> -			to_xen_drm_pipeline(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct xen_drm_front_drm_pipeline *pipeline =3D to_xen_drm_pipeline(cr=
tc);
>> +	struct drm_plane_state *plane_state =3D pipeline->plane.state;
>
> [Severity: High]
> Is it safe to access the global pipeline->plane.state directly here? If
> non-blocking commits overlap, this pointer might point to a newer,
> uncommitted state. Should this code use drm_atomic_get_new_plane_state()
> to extract the state from the drm_atomic_commit object instead?
>
>>  	struct drm_framebuffer *fb =3D plane_state->fb;
>>  	int ret, idx;
>
> [ ... ]
>
>> @@ -242,15 +259,19 @@ static int display_check(struct drm_simple_display=
_pipe *pipe,
>>  	return 0;
>>  }
>> =20
>> -static void display_update(struct drm_simple_display_pipe *pipe,
>> -			   struct drm_plane_state *old_plane_state)
>> +static void xen_drm_plane_helper_atomic_update(struct drm_plane *plane,
>> +					       struct drm_atomic_commit *state)
>>  {
>> -	struct xen_drm_front_drm_pipeline *pipeline =3D
>> -			to_xen_drm_pipeline(pipe);
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> +	struct drm_plane_state *old_plane_state =3D drm_atomic_get_old_plane_s=
tate(state, plane);
>> +	struct drm_crtc *crtc =3D plane->state->crtc ?: old_plane_state->crtc;
>
> [Severity: High]
> Can accessing the global plane->state pointer here cause race conditions?
> It might be safer to use drm_atomic_get_new_plane_state(state, plane)->cr=
tc
> to ensure the correct state is referenced during the atomic commit.
>
>> +	struct xen_drm_front_drm_pipeline *pipeline;
>>  	struct drm_pending_vblank_event *event;
>>  	int idx;
>> =20
>> +	if (!crtc)
>> +		return;
>> +
>> +	pipeline =3D to_xen_drm_pipeline(crtc);
>>  	event =3D crtc->state->event;
>
> [Severity: High]
> Similarly, does reading and modifying the global crtc->state directly ris=
k
> fetching state from a concurrent commit instead of the current one?
>
>>  	if (event) {
>>  		struct drm_device *dev =3D crtc->dev;
>
> [ ... ]
>
>> @@ -331,10 +395,37 @@ static int display_pipe_init(struct xen_drm_front_=
drm_info *drm_info,
>> =20
>>  	formats =3D xen_drm_front_conn_get_formats(&format_count);
>> =20
>> -	return drm_simple_display_pipe_init(dev, &pipeline->pipe,
>> -					    &display_funcs, formats,
>> -					    format_count, NULL,
>> -					    &pipeline->conn);
>> +	ret =3D drm_universal_plane_init(dev, &pipeline->plane, 1,
>> +				       &display_plane_funcs,
>> +				       formats, format_count,
>> +				       NULL,
>> +				       DRM_PLANE_TYPE_PRIMARY, NULL);
>
> [Severity: High]
> Does hardcoding the possible_crtcs mask to 1 restrict all primary planes =
to
> CRTC 0? For pipelines with an index greater than 0, the CRTC might fail t=
o
> find a compatible primary plane during atomic validation. Would using
> 1 << pipeline->index allow multi-display configurations to work correctly=
?
>

Will change possible_crtcs to 0 to populate automatically.

>> +	if (ret)
>> +		return ret;

