Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B62F3A962E
	for <sashiko-reviews@lists.linux.dev>; Sat, 11 Jul 2026 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783772813; cv=none; b=hEjUVIAaG16b2AEM9KcZHn5E20MlaFdtCNZMqOhSk4B/+X/IuVu7WzuV5SXof+b/d15lrcw+TN6zTkPE7zJh0mKtnlXRlxmnuSzsCZUBmAv8Xakaz1od/qws8yo6Uk4oll5/aarqcNHjYqaUAFo9POvrUuNW01feRkZVWnNLWok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783772813; c=relaxed/simple;
	bh=rvYcaJbi7L0lRFe3hBqitLwdR4lteyFKXRodlLYIlVQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CgdAHijuVNXunzH+JXrUftEbuue7sFLwrNJc5Ax/0PjxWxVP+lmtPkJoCnfgpoyAz8Z6NtrWlusDBS19TJ93IJHlUhYSsj82hrz1IuYbQCq/Gqs3qmA/I9fw94qSgMlyyJpwsrJsracz+2bRSw6LiDFCB/1op2nafQ5T1t1kbZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=Z4ZOCfVa; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="Z4ZOCfVa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1783772805; x=1784032005;
	bh=DtiWi6MODkSCkd9+MM7sUob/C9gfrkcTdQDOCr3HaVg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Z4ZOCfVagGLzb7NmPR5unZKbVzq7KvCOf4SkGgYZBXLLlUGfS6ZELqyIIkH2HPyz+
	 /ZoOd1XXK6Qc6S0KwGuPt9ql7JT1eUdu1E1vsvvw9KhwVLq3rNNLDbQAFiKcdohCZQ
	 BB9U+NHAN1uatfLZ5Lcb786L8tz229jYuN/PzEWzealC/ByD35Dp7RLCPG6MGWrdV2
	 Ghl1I0oqZvsx+GEOa4rQX63yjwKy7YAYHu7vK1QYMoA4Cau6KHAoBjy+76F9hWl1Ot
	 MK59kGy/6V2BIH6qGG8Xo5dqNyg83RGsKbIM/OiljQ5Q739M3c0NIb5zEFI0z2ejyl
	 hOUkecvKbs+Iw==
X-Pm-Submission-Id: 4gy7H80M2nz1DDrP
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: Fix problem with
 premature PLL locking
In-Reply-To: <20260711115901.776051F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Sat, 11 Jul 2026 11:59:01
	+0000")
References: <20260711-ti-sn65dsi83-fixes-v1-0-d85eb5342b98@geanix.com>
	<20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com>
	<chBX3JDWouBBGINJdo11hbT-ASZLlDvZuU0gaNJp0MVS_1e6FqR3vrBdulsfPr7_YeAVR4DaEwA3bEJ-sExo8Q==@protonmail.internalid>
	<20260711115901.776051F000E9@smtp.kernel.org>
Date: Sat, 11 Jul 2026 14:26:43 +0200
Message-ID: <87bjcdempo.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [High] Missing SRCU read lock release in error path of sn65dsi83_atomic_enable().
>
> Pre-existing issues:
> - [High] Missing SRCU read lock release in error path of sn65dsi83_reset_work().
> --
>
> --- Patch [2]: [PATCH 2/2] drm/bridge: ti-sn65dsi83: Fix problem with premature PLL locking ---
> commit 0c69248e520fff24e51d45bfab961991fbdb4267
> Author: Esben Haabendal <esben@geanix.com>
>
> drm/bridge: ti-sn65dsi83: Fix problem with premature PLL locking
>
> This patch moves the PLL locking sequence from atomic_pre_enable to
> atomic_enable. This ensures the DSI HS clock is running before attempting to
> lock the PLL.
>
> Link: https://lore.kernel.org/all/20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com/
>
>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> index 32e9eadd7452f..e87bed3a6640b 100644
>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>
> [ ... ]
>
>> @@ -712,11 +697,24 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
>>  {
>>  	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
>>  	unsigned int pval;
>> -	int idx;
>> +	int idx, ret;
>>
>>  	if (!drm_bridge_enter(bridge, &idx))
>>  		return;
>>
>> +	/* Enable PLL */
>> +	regmap_write(ctx->regmap, REG_RC_PLL_EN, REG_RC_PLL_EN_PLL_EN);
>> +	usleep_range(3000, 4000);
>> +	ret = regmap_read_poll_timeout(ctx->regmap, REG_RC_LVDS_PLL, pval,
>> +				       pval & REG_RC_LVDS_PLL_PLL_EN_STAT,
>> +				       1000, 100000);
>> +	if (ret) {
>> +		dev_err(ctx->dev, "failed to lock PLL, ret=%i\n", ret);
>> +		/* On failure, disable PLL again and exit. */
>> +		regmap_write(ctx->regmap, REG_RC_PLL_EN, 0x00);
>> +		return;
>
> [Severity: High]
> Does this error path leak the SRCU read lock acquired by drm_bridge_enter()?
>
> If the PLL lock fails and regmap_read_poll_timeout() returns an error, the
> function returns immediately without calling drm_bridge_exit(idx).
>
> This unreleased lock could cause subsequent calls to synchronize_srcu() to
> hang during module unload or bridge unplug.

Yes, that does look like a bug. I will fix it for v2.

>> +	}
>> +
>>  	/* Clear all errors that got asserted during initialization. */
>>  	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
>
> [Severity: High]
> This is a pre-existing issue, but I noticed a similar pattern in another
> function in this file. Does sn65dsi83_reset_work() also leak the SRCU read
> lock on failure?
>
> drivers/gpu/drm/bridge/ti-sn65dsi83.c:sn65dsi83_reset_work() {
>     if (!drm_bridge_enter(&ctx->bridge, &idx))
>         return;
>     ...
>     ret = sn65dsi83_reset_pipe(ctx);
>     if (ret) {
>         dev_err(ctx->dev, "reset pipe failed %pe\n", ERR_PTR(ret));
>         return;
>     }
>     ...
>     drm_bridge_exit(idx);
> }
>
> Like the atomic_enable path, if sn65dsi83_reset_pipe() fails, it appears to
> return early without calling drm_bridge_exit(idx).

Yes.

But is it enough to call drm_bridge_exit(idx), or do we want to
enable_irq() also? We are calling disable_irq_nosync() before scheduling
reset_ork, so if don't enable it again in case of error, it will be
stuck disabled. But what is supposed to happen if/when
sn65dsi83_reset_pipe() fails?

If we enable_irq() again, are we just going to endure endless pain?

/Esben
