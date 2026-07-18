Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C89217704
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 17:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784397173; cv=none; b=JTcLGB4pekjX9xmCtIoMTutlKSL2pgZx7feHl8qvOYF9akuJ3rcNN+DPniLvlyEzppwgkRqr1fc2Z2x3FZ0JnzW/VYrA+OkqyDPQM8KjXdSsqp5cd1t9/fBq7FS71v6wjLDByR1v/0w9NkcO6nH1JacuMxbZPHrlkdEv5w91CMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784397173; c=relaxed/simple;
	bh=BwOpSe7JiGk12m8cUmf5cb6VBW1WNos65J1jQjtaDWw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=kZbqKSUyGZwfz2Ctmobp8EkofHvMEGAER0GsazrUYMj9exgtdGNxEcHa6ub7WVdrhlCFLrNO8hraSiJnM02POE634ltP3BSYH1tShe+iDH6dcYZYs3jJ1eJsG13zH9KXFcqrxpJZB7rhDdXz+PRgAU1Kz8ePfVgeUtZd2kuM6A8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmFR5E0X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxnjqJa9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmFR5E0X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxnjqJa9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IGOToL1179082
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 17:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ClAQZqqpLrSxh/ilTgA975QpkExyJZmFR6ENFCfm7tI=; b=hmFR5E0X/+1xE8EW
	qd3ZPOT5/IAiqwzLyYhjTjLTveCAW77lVphkLvzn9l1iua5G/HJ1p+6IFxAGzDnU
	hQiZlK+/AyENuM9ndPkeGU5owVIa/tl16ycykf45J27jKP9UCvGeEtLDGmV578sS
	GDrn/M2DCmPNGp6om6Fmbfg3cBHnvlLpWlLMSIMCys1/vv9SZYldDCWewLBtk+qX
	vKY3fDK/WQ+gTrJkWL3zYWkNImprLTBbPzujsSBXoT2BH/tH81AWjYGTGWJmhKCG
	BAF1+JOY64FvG3Cpn3NqxPVcsfoOc2E3WUatEUGuplXM48coZMbxiZbkp/npysLI
	iYrKvA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc18gb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 17:52:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbe39ce62so2802577a91.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 18 Jul 2026 10:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784397169; x=1785001969; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ClAQZqqpLrSxh/ilTgA975QpkExyJZmFR6ENFCfm7tI=;
        b=WxnjqJa9RsnctTNMHPgI2EYmzJiDtQ3+PZ3U/aRke0SmfMy15KWnW/p2i2+8Ifk1Vl
         5y5qtmxr8zatcFq6eVSwrDOyu1mqmJ03nZc4jpSRocqm+dFOGUBSqQQg6rY9GuG+p6PJ
         F9AOWltrP31NmdoWSJUaDQ3kHdXMteJhvBCy0wJJHgp0zFhZJPeLGzNuJG5F+zq02mTO
         AKJjXN+Z4BLNEq+heHZVn1WxwLWsnR0pcMmTIILEmvnuRNL1PRW+0dPrw5xafxZB2AkY
         lCNK8WxEa8HuMeWD2KqREbIBoSxTlY/z4n3Ggn7Qqubz4UrbSd9qwX9qyzCjM4sS1PgA
         NWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784397169; x=1785001969;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ClAQZqqpLrSxh/ilTgA975QpkExyJZmFR6ENFCfm7tI=;
        b=bpmkxWUixVEEad5uNNkcaFz8ioikxCJIEo5ayj4t0VRNi9WhuYFKVFthvMvVB6PSSR
         m7JW5n6j2IyKmwS0ADLskFIEDLGw3zzI+/GqKuw/yRX3KiUZA9QbQ6rD9G2ClPT8R3FQ
         UxawDNH0H/MFLuIJhtci4Oh2khc5Mcjd46LxvqaLy0I1/YD70C/GIv9VcOHfTd49dAtn
         EaZTh8OWhc3q3kZ6DBMbulRjh2geK53pSFxbs8/5a216+mRpt4nKYo/1TpfVy5PuXlZN
         1BM+tKvtaRmmENnLYrj9qR1HEF7nrsOMuA7Ntze0s7YhWWocG3ovmnA84PMH4kEJu0Kh
         Gmiw==
X-Gm-Message-State: AOJu0YytI0LH0BkTakiD0Q6sUGST0WlvHJplDB6ZQv03Dq1DS/C3whgI
	KgKaCPkLMNrg3ulhxHLCxWAyYFGsndASLRJZyeHrjNWD0W3qvIeFF7j6enBTa5NSodr4oq4K7er
	JYiwA5Krmi0ryd4wi7YDQGz8JWIQmwV4M2qf42q+iTR2Zl36vkmp7tekmrglp0PLBOB27iQnJS3
	wAaLhNw0jI
X-Gm-Gg: AfdE7cnncpOFTcHp2Wmr/EnNwpeRVkpsGfDAhHQ/5S6dQjd22lPwq97i9/nXzIOxbt0
	A3FJEaqjQMTU7FcImtZOtEBy/dMMLJFolexiy/ZGXJY6yfBnObmhvYNN42ppoD/4dgePjL+QlYc
	QlKit1/iiGuFxZWMq1taE//iMzBIWQw3lt3kF74AYoRImKYrDfAtNQX77qRUOoAXuTdeWrWoc4G
	+uzfBG7AhsQFPLXw+HbWcnFQbjpYm1K0kDpNu0glffjEJIoPTR+YMfgDCeUuN0xyQzNhp3nLTtK
	cir+9w9Vg7yNrHYFESX3qat/EbCQ5G9FOzGaAbViT1GtYj19bf0tlGAZDlKL8dEDhYYKZbugKJC
	3OZ6Ufg==
X-Received: by 2002:a17:90b:590e:b0:387:d5bd:622f with SMTP id 98e67ed59e1d1-38e4b691d21mr6469920a91.18.1784397169425;
        Sat, 18 Jul 2026 10:52:49 -0700 (PDT)
X-Received: by 2002:a17:90b:590e:b0:387:d5bd:622f with SMTP id 98e67ed59e1d1-38e4b691d21mr6469894a91.18.1784397168875;
        Sat, 18 Jul 2026 10:52:48 -0700 (PDT)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429f9d439sm23819967eec.5.2026.07.18.10.52.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Jul 2026 10:52:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jul 2026 01:52:44 +0800
Message-Id: <DK1W04LF68WN.3LEHUKMBX3JJO@oss.qualcomm.com>
Cc: <imx@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
        <Frank.Li@kernel.org>
Subject: Re: [PATCH v2 3/8] drm/mcde: replace struct drm_simple_display_pipe
 with regular atomic helpers
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com> <20260716-drm-simple-kms-removal-v2-3-1133a8fc3785@oss.qualcomm.com> <20260716092109.A755F1F00A3A@smtp.kernel.org>
In-Reply-To: <20260716092109.A755F1F00A3A@smtp.kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDE4NyBTYWx0ZWRfX5FsqjOKMruFq
 J7mvaMGM+L+tsn1ZB68CGsC0ysQhWBH8vsD4/oOwmdD3Xf/sSYoinbu4rsqm6KCkLJU21QO/6kd
 7PGsyhea3jNLo0rsEY5tLVQrt5GzgY4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDE4NyBTYWx0ZWRfX/Fnk9kSXPCXW
 YOqJwBJ2Tlv2njqzv6YMDUMti7VvcMHCegMWHJRS286VYicrFO2ukkLW0T9H+8laRQr647R7yt5
 5ZMMToh5RErOY0dQLLP7+0xELii3kjki6/rCGFVY3UPdo+eucNpXxpGF+Y4SlzeyTVI/tPiGCPP
 lVLTGCjds+jKM/Y+uUT2u9fKO2UobAqcj0DiiGL8fxJtLRnZbrXbAouOlUoKTo+EY3bUHihaj4K
 CG/f+Q//Y7RPONwnOxu4M2q97vA5/yES0gVgU/pYi8u1NzQMlFmpwQ20LTkDxn3srvfnuBuQ02e
 Suy7teOWD58lHopuf98XZnlCvxjH+Cnpa2jzjvopB7FCky5bepWMCQXJPV6wHS3CFhB8BZBjTct
 nxlhBsVNQj61Lkah/Lit2BE6bqrLq6uWu2e/pynDBDVJLtY6jXY/pkKM1HXLXTKiY/FuQ498H6k
 +YiQ/t3wuYGypPRM+zA==
X-Proofpoint-ORIG-GUID: qpF-USjHzbbOfhoWUdFyPI3gnYwj2490
X-Proofpoint-GUID: qpF-USjHzbbOfhoWUdFyPI3gnYwj2490
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5bbd72 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Xo--NF9sZlCFNlXQFFYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_05,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607180187

On Thu Jul 16, 2026 at 5:21 PM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Race condition in atomic commit causing display hang in oneshot =
mode due to premature hardware start.
> --
>
> --- Patch [3]: [PATCH v2 3/8] drm/mcde: replace struct drm_simple_display=
_pipe with regular atomic helpers ---
> commit 24a767bb6a2c4adfefe9e0a5de7e9c8bbe7b2a64
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
>
> drm/mcde: replace struct drm_simple_display_pipe with regular atomic help=
ers
>
> Convert MCDE to explicit plane, CRTC and encoder objects. Handle pending
> page-flip events from the CRTC atomic flush path using the commit-local
> CRTC state.
>
>> diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/=
mcde_display.c
>> index 257a6e84dd583..86edf94c52372 100644
>> --- a/drivers/gpu/drm/mcde/mcde_display.c
>> +++ b/drivers/gpu/drm/mcde/mcde_display.c
> [ ... ]
>> @@ -1381,44 +1398,13 @@ static void mcde_set_extsrc(struct mcde *mcde, u=
32 buffer_address)
>> -static void mcde_display_update(struct drm_simple_display_pipe *pipe,
>> -				struct drm_plane_state *old_pstate)
>> +static void mcde_plane_helper_atomic_update(struct drm_plane *plane,
>> +					    struct drm_atomic_commit *commit)
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_device *drm =3D crtc->dev;
>> -	struct mcde *mcde =3D to_mcde(drm);
>> -	struct drm_pending_vblank_event *event =3D crtc->state->event;
>> -	struct drm_plane *plane =3D &pipe->plane;
>> -	struct drm_plane_state *pstate =3D plane->state;
>> +	struct drm_plane_state *pstate =3D drm_atomic_get_new_plane_state(comm=
it, plane);
>> +	struct mcde *mcde =3D to_mcde(plane->dev);
>>  	struct drm_framebuffer *fb =3D pstate->fb;
>> =20
>> -	/*
>> -	 * Handle any pending event first, we need to arm the vblank
>> -	 * interrupt before sending any update to the display so we don't
>> -	 * miss the interrupt.
>> -	 */
>> -	if (event) {
> [ ... ]
>> -		spin_unlock_irq(&crtc->dev->event_lock);
>> -	}
>> -
>>  	/*
>>  	 * We do not start sending framebuffer updates before the
>>  	 * display is enabled. Update events will however be dispatched
> [ ... ]
>> -static int mcde_display_enable_vblank(struct drm_simple_display_pipe *p=
ipe)
>> +static void mcde_crtc_helper_atomic_flush(struct drm_crtc *crtc,
>> +					  struct drm_atomic_commit *commit)
>> +{
>> +	struct drm_crtc_state *crtc_state =3D drm_atomic_get_new_crtc_state(co=
mmit, crtc);
>> +	struct drm_pending_vblank_event *event =3D crtc_state->event;
>> +
>> +	/*
>> +	 * Handle any pending event first, we need to arm the vblank
>> +	 * interrupt before sending any update to the display so we don't
>> +	 * miss the interrupt.
>> +	 */
>> +	if (!event)
>> +		return;
>
> [Severity: High]
> Does this split introduce a race condition that could hang the pipeline i=
n
> oneshot mode?
>
> Because the DRM core executes the plane's atomic_update callback before t=
he
> CRTC's atomic_flush callback, the hardware flow is now started before the
> vblank event is armed.
>
> If mcde_start_flow() is triggered during mcde_plane_helper_atomic_update(=
)
> (which happens just below the quoted block), it could complete the hardwa=
re
> transfer and fire its interrupt before the vblank event gets armed later =
in
> mcde_crtc_helper_atomic_flush().
>
> The relocated comment in atomic_flush still notes this exact requirement:
> "we need to arm the vblank interrupt before sending any update to the
> display so we don't miss the interrupt."
>
> If the interrupt fires early in oneshot mode, it will be missed, and the
> atomic commit could wait indefinitely for an event that will never comple=
te.

Hi, Thomas

Would it make more sense to move this pending vblank event handling to
the CRTC's atomic_begin(), or should it simply go back to update()?

From the comment in the original code, the event needs to be armed
before the update is triggered, otherwise the completion interrupt could
be missed in oneshot mode.

Thanks,
Ze
