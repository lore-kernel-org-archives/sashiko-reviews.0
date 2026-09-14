Received: from sm24.hosting.reg.ru (sm24.hosting.reg.ru [31.31.198.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A9E443312;
	Mon, 14 Sep 2026 12:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=31.31.198.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387409; cv=none; b=kJbAw4ZLdV7nA3xrJD6A0p7L+wEjI+Ftx3rmZQMHcq5+RMk05XQtzTxaTzc0CY8B9mWpjHZDcQWbdBuuvbnuttJQjoEUO6ZPDu2EwGP90wJB9OPe7gRQhiUvMM5nqgJ/iD86hHS30ocoEFPG5da4krA1Iz3SMSLCIVAd/1jfCA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387409; c=relaxed/simple;
	bh=4rVs1G60SquvRPm8LGN3T+Gv7XLhQnHJjEFlJY9TsJA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJ0YnzfKLPgSpE8Dk1ZL0TOleI2TePZ7vXo1qPS4MALu6U9zAK2OR5zwC6ApjmO3ygNHC6h/7HjESk5KQTxRJ7NsRJ0J7tnM18Q27igu5axjHHiKd7y4gsnK85aePgdzVf4tTzA9L9IFZdoq+pV7HYhbQXUQT4QeqvO+ShTwIKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru; spf=none smtp.mailfrom=minlexx.ru; dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b=n0P2cKvZ; arc=none smtp.client-ip=31.31.198.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minlexx.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=minlexx.ru header.i=@minlexx.ru header.b="n0P2cKvZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=minlexx.ru;
	s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
	Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=SLMQO28uQgqrnJh6++zlcI3D9Cp6DaVv2tStRpu6n7g=; b=n0P2cKvZQr1mhdDWSiR/mWQvv9
	QwGVwbL+cXUCOdfFgwoP9HfIcnCDWHOX9tk/IYM5XmtD37kmexj416VjVqtdn/isteChz3Xh6hcFA
	opQs9C8GFARll7Kd8mN3dQlX0i+S2pv12U8bxbgP77ndK/EygG6uKdihsPTcZ3Bx0GO0=;
Received: 
	by sm24.hosting.reg.ru with esmtpsa (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(envelope-from <alexeymin@minlexx.ru>)
	id 1x65P7-00000009zfN-0vLA;
	Mon, 14 Sep 2026 15:03:23 +0300
Message-ID: <3eb4f6f6-e8bb-4094-b5bd-8b65fd843243@minlexx.ru>
Date: Mon, 14 Sep 2026 15:03:20 +0300
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] drm/panel: novatek-nt36672a: Add Tianma panel for
 Xiaomi Mi A2
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20260913-nt36672a-panels-v1-0-ce097402c6ea@minlexx.ru>
 <20260913-nt36672a-panels-v1-7-ce097402c6ea@minlexx.ru>
 <20260913063102.0BEC71F000FF@smtp.kernel.org>
Content-Language: en-US
From: Alexey Minnekhanov <alexeymin@minlexx.ru>
In-Reply-To: <20260913063102.0BEC71F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.09.2026 09:31, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] Direct use of `usleep_range` instead of `mipi_dsi_usleep_range` bypasses multi-context error tracking.
> --
> 
> commit 883b76cff93d823c9430acc0b7cfca0a77f61ed2
> Author: Alexey Minnekhanov <alexeymin@minlexx.ru>
> 
> drm/panel: novatek-nt36672a: Add Tianma panel for Xiaomi Mi A2
> 
> Add support for Tianma TL060FVXS16-00 video mode panel based on
> Novatek NT36672A, used in Xiaomi Mi A2 smartphone (xiaomi-jasmine).
> It shares some code with already supported panel in this driver
> for xiaomi-lavender, so we can reuse the same panel deinit function.
> 
>> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
>> index e6971ba6ef464..1bfa808365874 100644
>> --- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
>> +++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
>> @@ -445,6 +445,29 @@ static void lavender_tulip_deinit_cmds(struct mipi_dsi_multi_context *dsi_ctx)
>>   	mipi_dsi_msleep(dsi_ctx, 120);
>>   }
>>   
>> +static void tianma_jasmine_init_cmds(struct mipi_dsi_multi_context *dsi_ctx)
>> +{
> [ ... ]
>> +	mipi_dsi_dcs_set_display_on_multi(dsi_ctx);
>> +	usleep_range(5000, 6000);
> 
> [Severity: Low]
> Is it intentional to use usleep_range() here instead of mipi_dsi_usleep_range()?
> 
> Using usleep_range() directly bypasses the multi-context error tracking in
> tianma_jasmine_init_cmds(). This causes the unconditional 5-6ms sleep to
> execute even if previous DSI commands have failed and set dsi_ctx->accum_err.
> 
>> +}
> 

Good find, this is likely not intentional, will be fixed in v2.

--
Regards,
Alexey Minnekhanov
