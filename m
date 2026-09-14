Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B0F45A284;
	Mon, 14 Sep 2026 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389682; cv=none; b=ppFaYWk5HKj/UrVdz7LvD5TIoPKEDCxTh2HjlkIGBxXb1QQrqzJTJAoquPIXM39Ln9n7phQZeqz9UdcZSKkL2GPXK5iBIq9fBOltQdrHVGv0gTUL/ElG5dy/TWSqO9x7JDGnbPgH+Q+ng6dFkwF1UjQEegkwu7H22QgcktxluOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389682; c=relaxed/simple;
	bh=vCLorVAVxanrta8JLN2PLiWfTClU2E8uYbyKYvMDCFo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFBU2VPs2CUL4Pku/qfSKyoSwFIA4ogrIYo/Wxc5I5oIUlaJ4YD75pVIxo2BHRGEVJ/YF41otiamSj+vbiphP6hV5zjqDL31p0oNfvY2ZKYg9f9pHSp9v5fdTGDJPEZlglm9bpSs1jlHf0nMNdvT6zXv/oa9imwp07948od99ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=jCJsQUhd; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="jCJsQUhd"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=6YH4J9Hj8sLaEx3AOney7Tm4RlI3Wg0dMrSsHpFTSN0=; b=jCJsQUhd3GoW4jDTzzDez2xbPo
	YN7TxoSGk5ePWPE1euZQN+3SyWufUmNSjMvSOhjv66GzABXdo3igMWSjZuJwsQU7PcEvaqygWGzpb
	4nuE3idrPu76NW0SHqg1ck5oT7xm4vMTPnEmpYqURQ2EMmnnecAX88pztz2ltVagp5hk=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x65zo-0000000AOwK-2Zrz;
	Mon, 14 Sep 2026 15:41:18 +0300
Message-ID: <63327c15-47f8-4491-a7e5-f90ab931f4e6@minlexx.ru>
Date: Mon, 14 Sep 2026 15:41:15 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] drm/panel: novatek-nt36672a: Add 3 panels used in
 Xiaomi phones
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
 <20260913-nt36672a-panels-v1-6-ce097402c6ea@minlexx.ru>
 <20260913063414.8C27C1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <20260913063414.8C27C1F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.09.2026 09:34, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Duplicate execution of DCS display off and enter sleep mode commands, causing redundant panel instructions and excess delay.
> --
> 
> 
>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
>> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
> [ ... ]
>> @@ -361,6 +361,90 @@ static void tianma_fhd_video_send_deinit_cmds(struct mipi_dsi_multi_context *dsi
> [ ... ]
>> +static void lavender_tulip_deinit_cmds(struct mipi_dsi_multi_context *dsi_ctx)
>> +{
>> +	dsi_ctx->dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>> +
>> +	mipi_dsi_dcs_set_display_off_multi(dsi_ctx);
>> +	mipi_dsi_msleep(dsi_ctx, 20);
>> +	mipi_dsi_dcs_enter_sleep_mode_multi(dsi_ctx);
>> +	mipi_dsi_msleep(dsi_ctx, 120);
>> +}
> 
> [Severity: Medium]
> Could this result in redundant panel instructions and an excess delay?
> 
> When the panel is disabled, lavender_tulip_deinit_cmds() is called as the
> panel-specific deinit sequence by nt36672a_panel_unprepare(). However,
> nt36672a_panel_unprepare() already unconditionally executes these exact same
> display off and sleep commands, along with their corresponding delays,
> immediately after the panel-specific sequence completes.
> 
> This appears to result in turning off the screen twice, incurring an
> unnecessary 140ms sleep and redundant DCS commands being sent to the panel
> during every power down operation.
> 

Hmm right, I should perhaps move tianma-beryllium specific deinit
sequence out from common nt36672a_panel_unprepare() to its own
tianma_fhd_video_send_deinit_cmds(), so each panel can use their
own deinit sequence if it's needed.

Will be done in v2

--
Regards,
Alexey Minnekhanov
