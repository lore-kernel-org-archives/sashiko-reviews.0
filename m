Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF541E260C
	for <sashiko-reviews@lists.linux.dev>; Sat, 29 Aug 2026 20:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788035252; cv=none; b=AELrHauKN2t3y9r/y+n4lNncAqY2uOjissS6awbBgHrOI2pk/rO4FIu9l9J0Jr8/VGSBAVDt45nRkHkHNdiYZ+SbURVrnaJfmq9M/nMz9yu1AYTAZU98LDUO98wjtsuKdkSt8bDqAaYLvVTFGDR6D61IBzjvWZbxin2GJJbIe/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788035252; c=relaxed/simple;
	bh=w3VO9pZCTThx6C9ledkmpoA08+Tjr8TMZ88br08KTT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ThO1pCuojTyTc+ef8JL/3yfDt3lxVryRaaI+B1J6KZrhhtJLBE2Dp2sghIZhuhQRuj+TKpd5MCsV4NyFYA+ZPGYMxAvVtvmbaRvN1Qw4Wbht34jB0e3mPfPmas33Sp/C/hDyA7lGKVFDbZBdOHJzogLGyayu64hb8a/m5u2SdC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=NM9dvr28; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=TF3Aoo7L; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="NM9dvr28";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="TF3Aoo7L"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788035241; bh=58sfb0BO7dzm+sakUhqkmRv
	jZlXTEsguNitRZcCuRFs=; b=NM9dvr28vPw7iYT4B0y9jM8/OpuCG4jTKIdDDbq4DomYUhlLkp
	5oopLSGGPu+m+P37BsC7aJ0x801f4wZ3PkLKCcw28AjZ2rF8vNuUgKAkJRq+5ml8pHkyEcujwJ4
	bcqBNTIvrA4HKGg1jrMpKOOo7AyvFh6jfMTuUtetK/xHAVrNwEJJhGCJkz2NB8vyHVdDwDaqg5w
	5BmnuNqk19nD74xQHjiANczYvNLRHiyh3I7jHGjNhmtt0OHmtAPGo1DF/7cHgosFhDQuP37BKe+
	mSiXYiOe1jzGn+9FYPkpI20x2/AyUEKbi/u2hoGGQ3cq4ox1EoxSogzRGYNi3MkMxDg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=From:To:Subject:Date:Message-ID; t=1788035241; bh=58sfb0BO7dzm+sakUhqkmRv
	jZlXTEsguNitRZcCuRFs=; b=TF3Aoo7Lp4Q84I6vVJcZFoMH+zdlb3FMDRGop4YtTQE1OACrUx
	GGgz8n874k0hw3Gqxh82/Grj7PFDjO/QsuAQ==;
Message-ID: <251807b0-9775-4391-b212-22afc9b35792@mainlining.org>
Date: Sat, 29 Aug 2026 23:27:21 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] drivers: gpu: drm: panel: Add BOE NT51021 driver
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260829-qcom-novatek-nt51021-panels-v1-0-cc1ca61bd261@mainlining.org>
 <20260829-qcom-novatek-nt51021-panels-v1-2-cc1ca61bd261@mainlining.org>
 <20260829201932.1BFEB1F000E9@smtp.kernel.org>
Content-Language: ru-RU, en-US
From: Nickolay Goppen <setotau@mainlining.org>
In-Reply-To: <20260829201932.1BFEB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


29.08.2026 23:19, sashiko-bot@kernel.org пишет:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The panel initialization sequence lacks the DCS 'Set Display On' (0x29) command.
> - [Medium] Missing reset assertion and stabilization delay during panel preparation.
> --
>
> commit 864f3dccc86bc8a97845ebafd73a7df32e9d6b9e
> Author: Nickolay Goppen <setotau@mainlining.org>
>
> drivers: gpu: drm: panel: Add BOE NT51021 driver
>
> This commit adds support for the BOE NT51021-based 8-inch and 10-inch DSI
> video mode panels used in Xiaomi Mi Pad 4 tablets. It includes panel
> initialization sequences and content-adaptive brightness control.
>
>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt51021.c b/drivers/gpu/drm/panel/panel-novatek-nt51021.c
>> new file mode 100644
>> --- /dev/null
>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt51021.c
> [ ... ]
>> +static void nt51021_boe_reset(struct boe_nt51021_desc *ctx)
>> +{
>> +	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
>> +	usleep_range(10000, 11000);
>> +}
> [Severity: Medium]
> Does the panel require an explicit reset assertion pulse before de-asserting
> the reset line? The current code only de-asserts the reset line here. Without
> an explicit assertion pulse and delay prior to de-assertion, the hardware
> might not be guaranteed a valid minimum reset pulse width once power is stable.
>
> [ ... ]
>> +static int nt51021_boe_8_init(struct boe_nt51021_desc *ctx)
>> +{
>> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> [ ... ]
>> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>> +	mipi_dsi_usleep_range(&dsi_ctx, 5000, 6000);
>> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8f, 0x00);
>> +	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
>> +
>> +	nt51021_cabc_on(&dsi_ctx);
>> +
>> +	return dsi_ctx.accum_err;
>> +}
> [Severity: Medium]
> Does this initialization sequence miss a DCS "Set Display On" command?
> The panel is awakened from sleep mode via mipi_dsi_dcs_exit_sleep_mode_multi(),
> but it is never explicitly instructed to turn on the display output here in
> nt51021_boe_8_init(). This could cause the panel to remain blank on some DSI
> hosts.
>
> [ ... ]

The downstream init sequence (that this driver generated from) doesn't 
contain such command.

>> +static int nt51021_boe_10wu_init(struct boe_nt51021_desc *ctx)
>> +{
>> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
> [ ... ]
>> +	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
>> +	mipi_dsi_usleep_range(&dsi_ctx, 5000, 6000);
>> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8f, 0x00);
>> +	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
>> +
>> +	nt51021_cabc_on(&dsi_ctx);
>> +	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
>> +
>> +	return dsi_ctx.accum_err;
>> +}
> [Severity: Medium]
> Similarly to nt51021_boe_8_init(), the 10-inch variant initialization path
> also appears to omit the mipi_dsi_dcs_set_display_on_multi() command.
>
>> +static int nt51021_boe_off(struct boe_nt51021_desc *ctx)
>> +{
>> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
>> +
>> +	nt51021_cabc_off(&dsi_ctx);
>> +
>> +	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0x8f, 0xa5);
>> +	mipi_dsi_msleep(&dsi_ctx, 20);
>> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> [Severity: Medium]
> The power-off sequence explicitly turns the display off using
> mipi_dsi_dcs_set_display_off_multi(). Should there be a matching turn-on
> command in the initialization sequences to ensure the display activates
> correctly across power cycles?
>
> [ ... ]
>> +static int nt51021_boe_prepare(struct drm_panel *panel)
>> +{
>> +	struct boe_nt51021_desc *ctx = to_boe_panel(panel);
>> +	struct device *dev = &ctx->dsi->dev;
>> +	int ret;
>> +
>> +	ret = regulator_bulk_enable(ARRAY_SIZE(nt51021_boe_supplies), ctx->supplies);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
>> +		return ret;
>> +	}
>> +	nt51021_boe_reset(ctx);
> [Severity: Medium]
> Does the panel require a stabilization delay after enabling the regulators
> and before de-asserting the reset line? The current code immediately calls
> nt51021_boe_reset(ctx). Without a delay, the reset logic might execute
> before the regulators have fully ramped up, potentially leading to unstable
> hardware initialization.
>
> [ ... ]
In practice, My xiaomi-clover-plus' panel initializes fine every kernel 
boot
>
-- 
Best regards,
Nickolay

