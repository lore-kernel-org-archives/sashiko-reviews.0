Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EC135C6AB
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 02:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785119550; cv=none; b=jmKckqA0SQeAzUKHVGwZGsbOfEuckuK/x6Xxfn6vTIVi3XUzs37tUohy7Ufe68NlhyMopc+Pt3ooBAIFdV0ofB25pA+Zzjt8bg92YSUbJwnGSdxjFrIQX6pyo7EifMzVaM89xaoiijvC/61xf+15aXTHuBXpE8vK5Mjd26+fsUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785119550; c=relaxed/simple;
	bh=ZVi1BkCcEoRRhtW7Es9yVbwGOjMOQOfVDLTnWiENThM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=PIlzh/7axp4GhyLlM90+zVh+9t6O9P9iMAr1v7GyDXEa3YJejR1QhCCsZIC4GqNCfq6odZMRWbLxkeW3C79UXN5N2IybKOTFYcY4Yz+Xv+ALL21E0+dhqh+91M6feNSwQl/WVwhT6fZzJegvY6q3UxfpAdeZyAhJRgRtIhScews=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=linux.dev; arc=none smtp.client-ip=95.215.58.181
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
Date: Mon, 27 Jul 2026 10:31:56 +0800
Message-Id: <DK9020QQ2KFV.3EXG1HVJL9QUY@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/8] drm/pl111: replace struct
 drm_simple_display_pipe with regular atomic helpers
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: <sashiko-reviews@lists.linux.dev>, "Ze Huang"
 <ze.huang@oss.qualcomm.com>
Cc: <dri-devel@lists.freedesktop.org>, <Frank.Li@kernel.org>,
 <imx@lists.linux.dev>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com> <20260727-drm-simple-kms-removal-v3-4-cd5dc89858c6@oss.qualcomm.com> <20260726195955.A36731F000E9@smtp.kernel.org>
In-Reply-To: <20260726195955.A36731F000E9@smtp.kernel.org>
X-Migadu-Flow: FLOW_OUT

On Mon Jul 27, 2026 at 3:59 AM CST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] CRTC atomic enable and disable callbacks call sleeping functions=
 (`msleep`, `clk_prepare_enable`, `clk_disable_unprepare`), which violates =
the subsystem rules regarding atomic contexts.
> --
>
> --- Patch [4]: [PATCH v3 4/8] drm/pl111: replace struct drm_simple_displa=
y_pipe with regular atomic helpers ---
> commit e2dfe2bacf45ede4c23cfee6fb0f779ed622850c
> Author: Ze Huang <ze.huang@oss.qualcomm.com>
> Subject: drm/pl111: replace struct drm_simple_display_pipe with regular a=
tomic helpers
>
> This commit replaces the PL111 simple display pipe with explicit plane, C=
RTC,
> and encoder objects. It also moves timing and format validation to explic=
it
> atomic check paths, and page-flip event handling to the CRTC commit path.
>
>> diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl1=
11/pl111_display.c
>> index 5d10bc5fdf1f6..deac1dee7838a 100644
>> --- a/drivers/gpu/drm/pl111/pl111_display.c
>> +++ b/drivers/gpu/drm/pl111/pl111_display.c
> [ ... ]
>> -static void pl111_display_enable(struct drm_simple_display_pipe *pipe,
>> -				 struct drm_crtc_state *cstate,
>> -				 struct drm_plane_state *plane_state)
>> +static void pl111_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>> +					    struct drm_atomic_commit *commit)
>>  {
>
> [Severity: High]
> This isn't a bug introduced by this patch, but does this function safely =
run
> in an atomic context?
>
> CRTC atomic enable callbacks execute in an atomic context where sleeping =
is
> forbidden. Looking at the wider implementation of
> pl111_crtc_helper_atomic_enable(), it appears to still call sleeping func=
tions
> like clk_prepare_enable() and msleep().
>
> Could this lead to scheduling-while-atomic kernel warnings or potential
> deadlocks when userspace sets a display mode and triggers the enable path=
?

False positive

>
> [ ... ]
>> -static void pl111_display_disable(struct drm_simple_display_pipe *pipe)
>> +static void pl111_crtc_helper_atomic_disable(struct drm_crtc *crtc,
>> +					     struct drm_atomic_commit *commit)
>>  {
> [ ... ]
>>  	/* Disable */
>>  	writel(0, priv->regs + priv->ctrl);
>> =20
>>  	clk_disable_unprepare(priv->clk);
>>  }
>
> [Severity: High]
> This is also a pre-existing issue, but is it safe to use sleeping functio=
ns
> like clk_disable_unprepare() and msleep() during the disable sequence?
>
> Similar to the enable path, pl111_crtc_helper_atomic_disable() operates a=
s
> an atomic disable callback, which also runs in an atomic context. Could t=
hese
> sleep calls cause system instability or scheduling warnings when the CRTC=
 is
> powered off?

False positive
