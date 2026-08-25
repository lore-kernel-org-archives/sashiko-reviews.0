Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97F8348C6F
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 10:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787652840; cv=none; b=X889K2r9jKY8JpSd5U3di1j6xW7INM+b8zE+S4/lVfrpl5VSwvpVA5XIB45iynp8aHtJYAVVBBCkwjj8UVMMFcSyjc2Mw5umm9dEcSa5joYcfAGDk2pNxnb2Lxj/3s9ysRmkRuxTON3UT93jmqKg9vLt3+D69qIoiLhXqgWamZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787652840; c=relaxed/simple;
	bh=cdWDnk+pCmudlmOu4mqCm1nZeyD6KR9y7vFIGoF2kbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TPHjMzj45//E7LrgphiddcRH8M6XtkBQTJuAmo6bHyMrU5b4DguJoJ9JcI0CwKRElq+PUmjaACQSZybIx+h8ifiF9GZcvAduJDt+RunLN7gsJEwbD0/at7DqCIjJCEgLp5q4s0amPfRFs+LhXJjZV1LV777AVo1c17NHMrEWFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=ajKemV2w; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="ajKemV2w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1787652830; x=1787912030;
	bh=mLYnEk4zxlRkMBFZndTuGiFtQNuyUOtWaqNB08diNQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=ajKemV2wRSGrR7EZAwwOpkHiq3/UXYQ7IcUEIfhCpFPgOEXC9FvAUt/t/LRe0pl9G
	 QRFV+q7JyyKivbmz8XtO0HRdfwwvOVJfyXA3wIJk/26aRL78ywV/dVxlre3+o4Nu6T
	 WyMLRiygwMwSxEnWuAKg7pcdNlLJFIyECVSnL4LEQuC6rdtKfxL4Iy7adZp/OP8Ez6
	 obK8yX11FJV6oN+LCb08t5kIU3SFXhDUcjOjtrW/P+7gjkfV/OcDdntgxoOxvwvVzZ
	 n8ShMmy72OGt/xjMPplnuzgB+irO6Hj2H4ewMeNZF/T3xmKudODUQ/eVg9SIb/UG4m
	 MmKm7C2ykWTnQ==
X-Pm-Submission-Id: 4hTkC13Vm9z2Schg
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 4/5] drm/bridge: nwl-dsi: Add error handling of
 nwl_dsi_mode_set()
In-Reply-To: <20260810072257.2ABD61F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Mon, 10 Aug 2026 07:22:56
	+0000")
References: <20260810-nwl-dsi-fixes-v3-0-256da9d672e1@geanix.com>
	<20260810-nwl-dsi-fixes-v3-4-256da9d672e1@geanix.com>
	<5q9c0nOychvLDFd3tAjzhmVICVDZQWFIPqhVqa1FQJGcjJTarKOeTu1dJqvF_NiZXLKlWwb68VedbPjlDsJ8gg==@protonmail.internalid>
	<20260810072257.2ABD61F000E9@smtp.kernel.org>
Date: Tue, 25 Aug 2026 12:13:49 +0200
Message-ID: <87jypeo6ci.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Unbalanced resource teardown and PM runtime underflow in mode_se=
t error path.
> --
>
> --- Patch [4]: [PATCH v3 4/5] drm/bridge: nwl-dsi: Add error handling of =
nwl_dsi_mode_set() ---
> commit 0db3c1cc2f73a9bc66aea2633f754029dd76b743
> Author: Esben Haabendal <esben@geanix.com>
>
> drm/bridge: nwl-dsi: Add error handling of nwl_dsi_mode_set()
>
> This commit adds a return value check for nwl_dsi_mode_set() in
> nwl_dsi_bridge_mode_set(), jumping to an error path on failure.
>
>> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/n=
wl-dsi.c
>> index 3fd41212933c8..e90588299c5ea 100644
>> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
>> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
>> @@ -884,7 +884,9 @@ nwl_dsi_bridge_mode_set(struct drm_bridge *bridge,
>>  	}
>>
>>  	/* Step 2 from DSI reset-out instructions */
>> -	nwl_dsi_mode_set(dsi);
>> +	ret =3D nwl_dsi_mode_set(dsi);
>> +	if (ret < 0)
>> +		goto runtime_put;
>
> [Severity: High]
> This is a pre-existing issue, but does taking the runtime_put error path =
here
> lead to unbalanced resource teardown and PM runtime underflows?

Yes, it looks like it does. Similar to the existing error flows unfortunate=
ly.

> Because the drm_bridge_funcs.mode_set callback returns void, failures can=
not be
> propagated to the DRM core to abort the commit. If nwl_dsi_mode_set() fai=
ls and
> jumps to runtime_put, it calls pm_runtime_put_sync() and returns early.
>
> However, the DRM core still considers the bridge pipeline state to be 'en=
abled',
> and will unconditionally call nwl_dsi_bridge_atomic_disable() during the =
next
> pipeline teardown.
>
> When atomic_disable() runs, it unconditionally calls pm_runtime_put(), le=
ading
> to a reference count underflow:
>
> drivers/gpu/drm/bridge/nwl-dsi.c:nwl_dsi_bridge_atomic_disable() {
> 	...
> 	pm_runtime_put(dsi->dev);
> }

Maybe we should use pm_runtime_get_sync() instead of
pm_runtime_resume_and_get() in nwl_dsi_bridge_mode_set(), and then call
pm_request_idle() on error instead of pm_runtime_put_sync(). This way we
can keep the pm_runtime_put() in nwl_dsi_bridge_atomic_disable() without
risk of counter undeflow.

We would need to do something about the initial early return on
nwl_dsi_get_dphy_params() error, to avoid that causing counter
underflow. I think it should be safe to call pm_runtime_get_synmc()
first thing in nwl_dsi_bridge_mode_set().

Is it possible to do this in a follow-up patch series, so that we can
proceed with merging this without causing more complications by dealing
with this tricky pre-existing issue?

> Furthermore, atomic_disable() unconditionally calls nwl_dsi_disable(), wh=
ich
> blindly attempts to tear down the PHY:
>
> drivers/gpu/drm/bridge/nwl-dsi.c:nwl_dsi_bridge_atomic_disable() {
> 	...
> 	nwl_dsi_disable(dsi);
> 	...
> }
>
> Since nwl_dsi_mode_set() already cleans up its own PHY resources on inter=
nal
> failure,
>
> this double-disable pushes the PHY framework's power_count and
> init_count to -1. The next attempt to initialize the display will increme=
nt
> these counters to 0, skipping the actual hardware ops->power_on() and
> ops->init() calls, permanently leaving the display broken until the modul=
e is
> reloaded.

True. That is a pre-existing issue, but I don't see how it is affected
by this change. In case nwl_dsi_mode_set() fails, it did internal cleanup/d=
isable
of PHY resources before this change, and does so after this change in
the same way.

> While this broken error path already existed for clock initialization fai=
lures
> in this function, wiring up nwl_dsi_mode_set's return value to it exposes=
 the
> PHY breakage on a new failure path.

I don't think that is true. The changed behavior in case
nwl_dsi_mode_set() fails is that we are now skipping deassert of rst_esc
and rst_byte and doing pm_runtime_put_sync(), where as before we were
executin g the deassert of rst_esc and rst_byte and not doing
pm_runtime_put_sync(). The PHY double-disable issue is unchanged.

>>
>>  	/* Step 3 from DSI reset-out instructions */
>>  	ret =3D reset_control_deassert(dsi->rst_esc);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-nwl-dsi-=
fixes-v3-0-256da9d672e1@geanix.com?part=3D4
