Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9196B3939A3
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 02:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785120930; cv=none; b=dIqKBLK2xNpXRMrJ4PIIs1JqS9iCyzQ1U9HCBwudeTsOOwvHUH0bUlEtosAP6WvPX2CXVHi4/XxNwXfZoj5AzqPQ8a3DP3DLT3fOzdmdy6lhvaCfvIzk5cO4PIYzd8R/6CUUTxSYcFt5y7VC5n6Y0XAf2xB8fEIHptJcwS1CBxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785120930; c=relaxed/simple;
	bh=Hs5XCOVnLLoZebaVnZ1YGkfnAnC6CwUqsdxjOjK2gPc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=O7PxY3KfZL8hSNa1I23y5t8Wyz0FAsw7JxHmhMk7RZOwe+nEVc3x35Exz2EwYyF1IPVqIOx0muGopAXpf1H42v2SF7b83pBaJ39jiL0cSJmBDEqlc6z3ySSKI0N9to7pUVdgjBdOYu+7RBHZmwKfQxX6Cx3QDeUS7UtXAITfDwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 10:55:10 +0800
Message-Id: <DK90JT5FE5UR.1AGN06O8YZ371@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <Frank.Li@kernel.org>,
 <imx@lists.linux.dev>
Subject: Re: [PATCH v3 7/8] drm/tve200: replace struct
 drm_simple_display_pipe with regular atomic helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-7-cd5dc89858c6@oss.qualcomm.com> <20260726200006.687F21F00A3A@smtp.kernel.org>
In-Reply-To: <20260726200006.687F21F00A3A@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon Jul 27, 2026 at 4:00 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Calling sleeping functions from CRTC atomic enable and disable c=
allbacks violates atomic context constraints.
> - [High] Setting `cstate->mode_changed =3D true` inside the plane's `atom=
ic_check` callback bypasses downstream modeset routing, leaving bridges act=
ive during CRTC resets.
> --
>
> --- Patch [7]: [PATCH v3 7/8] drm/tve200: replace struct drm_simple_displ=
ay_pipe with regular atomic helpers ---
> commit c9e2ab55e3b69f124e64f349a1ced762885b2aea
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
> Subject: drm/tve200: replace struct drm_simple_display_pipe with regular =
atomic helpers
>
> Convert TVE200 to explicit plane, CRTC and encoder objects. Keep generic
> plane-state validation before TVE200-specific mode, alignment, pitch and
> format-change checks.
>
>> diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/t=
ve200/tve200_display.c
>> index 26b6c65ef6fd0..beb3a5a63b5d5 100644
>> --- a/drivers/gpu/drm/tve200/tve200_display.c
>> +++ b/drivers/gpu/drm/tve200/tve200_display.c
> [ ... ]
>> @@ -69,13 +71,34 @@ irqreturn_t tve200_irq(int irq, void *data)
>>  	return IRQ_HANDLED;
>>  }
>> =20
>> -static int tve200_display_check(struct drm_simple_display_pipe *pipe,
>> -			       struct drm_plane_state *pstate,
>> -			       struct drm_crtc_state *cstate)
>> +static int tve200_plane_helper_atomic_check(struct drm_plane *plane,
>> +					    struct drm_atomic_commit *commit)
>>  {
>
> [Severity: High]
> This is a pre-existing issue, but does setting cstate->mode_changed =3D t=
rue
> inside the plane check hook bypass downstream modeset routing?
>
> In tve200_plane_helper_atomic_check(), the code raises a mode change if t=
he
> framebuffer format changes:
>
>     if (old_fb && old_fb->format !=3D fb->format)
>             cstate->mode_changed =3D true;
>
> In the default DRM state check sequence, plane checks are executed after =
the
> modeset checks. Because mode_changed is raised late and the driver does n=
ot
> explicitly loop back to recalculate modeset routing, the downstream
> encoders and bridges may miss their disable/enable hooks. Could this leav=
e
> bridges active during a CRTC reset?

Yes, the DRM helper path does use mode_changed to drive modeset
routing and the bridge/encoder/CRTC modeset hooks.

As mentioned for patch 2, I would prefer not to mix too much fixes into
this simple-KMS conversion series. If we want to make this stricter, the
driver can grow a custom .atomic_check wrapper and rerun
drm_atomic_helper_check_modeset() after plane checks, but that should be
a separate follow-up/preparatory patch.

>
> [ ... ]
>> @@ -119,16 +142,72 @@ static int tve200_display_check(struct drm_simple_=
display_pipe *pipe,
>>  	return 0;
>>  }
>> =20
> [ ... ]
>> +static void tve200_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					     struct drm_atomic_commit *commit)
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>> -	struct drm_plane *plane =3D &pipe->plane;
>>  	struct drm_device *drm =3D crtc->dev;
>>  	struct tve200_drm_dev_private *priv =3D drm->dev_private;
>> +	struct drm_crtc_state *cstate =3D drm_atomic_get_new_crtc_state(commit=
, crtc);
>>  	const struct drm_display_mode *mode =3D &cstate->mode;
>
> [Severity: High]
> This is a pre-existing issue, but does this code sleep in atomic context?
>
> The DRM core invokes CRTC atomic enable callbacks during display commits,
> which run in atomic context. However, tve200_crtc_helper_atomic_enable()
> calls sleeping functions:
>
>     clk_prepare_enable(priv->clk);
>     ...
>     usleep_range(30000, 50000);
>
> I see this logic was carried over directly from the old
> drm_simple_display_pipe hooks. Since sleeping in atomic context can cause
> kernel warnings and potential deadlocks, is there a safe way to handle th=
is
> enable sequence?

False positive

>
> [ ... ]
>> @@ -240,9 +319,9 @@ static void tve200_display_enable(struct drm_simple_=
display_pipe *pipe,
>>  	drm_crtc_vblank_on(crtc);
>>  }
>> =20
>> -static void tve200_display_disable(struct drm_simple_display_pipe *pipe=
)
>> +static void tve200_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +					      struct drm_atomic_commit *commit)
>>  {
>> -	struct drm_crtc *crtc =3D &pipe->crtc;
>>  	struct drm_device *drm =3D crtc->dev;
>>  	struct tve200_drm_dev_private *priv =3D drm->dev_private;
>
> [Severity: High]
> This is a pre-existing issue, but similar to the enable path above, does =
the
> disable callback also sleep in atomic context?
>
> tve200_crtc_helper_atomic_disable() eventually calls clk_disable_unprepar=
e(),
> which can sleep:
>
>     clk_disable_unprepare(priv->clk);
>
> Since this runs in the atomic disable path, could this lead to a deadlock=
?

False positive
