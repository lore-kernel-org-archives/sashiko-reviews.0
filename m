Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680424;
	b=oPTnXQQ2GhBBIGE0XKgBTgp+j36MwpYDooAFNpNjDYDJHAL0MdeJ/XBnARJcPwp89AqN
	 Sdwj4IIK1GSJCU9Fr5Lig78QXZnnlKdc2q+w7U5MsTbqnO8VszmyFQ9DrZxWMtmh7KTVq
	 6RNMX+o+M6/vxXw4GwGI2Np/gDpe3XpC4OJtyf8UIoFXjSBxHn9JYLO2RgVKhUJiEqdfK
	 IULH03gjphxPebf4jl6NQK2bxBTbBeSAm4LXMoV1YTCCt3tP6XTGuwAgIEuyFJyK2q2P7
	 azLMGQa9Dn/hyEZ/Cme2oM9MRfM9q8WzDSIf6xSM3ZWojuBI4mucSsziXFEOKnKpyBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680424;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=dZpNjkTiwffgyKVa2xxgH8TcimyQVQdtjc9YVg0y/FU=;
	b=T/ja2I9+FxMjbhT/IV4eIe4KQtzHzxEHL82q7K3TKvsauVc1OGgoD1vHbdvFmpmrNNQf
	 HtkP+IVJ0W3pN2PF1OcfQGtQ3mwM4BWU5nbVa1pSPt3cCN/ORVdLBCR+4aP6hHxQq+2Vy
	 ULGXhlPz8rcEAlWD8wCJZ1fDfpY+JfUte/4cvP9H/aLnxzmKwKPrsTz8FcMAikCjffnoC
	 aGBIELNBMSOjXqCxvLiFUWhNHpmpGm1E+oFLMzpUQ8DJe7krfliqQE1f5YC0OPD2RB5MU
	 tUYVqFp099RQQwdLPD5/+2ozWuEz+tvPL++XGm0uZABwP6zWnIXD2kT+znPcmhpj0iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b="i/Zb7N+f";
	arc=none smtp.remote-ip=103.209.128.6
Received: from mail-m1286.netease.com (mail-m1286.netease.com [103.209.128.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33CA606A33E
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 08:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E33CA606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=i/Zb7N+f
Received: from [172.16.12.74] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 56166db4a;
	Thu, 26 Nov 2026 16:06:52 +0800 (GMT+08:00)
Message-ID: <53afffed-4229-4414-91d2-e75e35ac94f9@rock-chips.com>
Date: Thu, 26 Nov 2026 16:06:52 +0800
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 19/20] drm/bridge: analogix_dp: Handle HPD notification
 from downstream bridge
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>
References: <20261125112141.1434903-1-damon.ding@rock-chips.com>
 <20261125112141.1434903-20-damon.ding@rock-chips.com>
 <sashiko-outbox-233284@kernel.org>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <sashiko-outbox-233284@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0aa216e4a30303a8kunmf83a8f877f83b9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTxgYVktMSRoeTBhKGkwdSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5KVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=i/Zb7N+f/N79FNjRePQWt4oeqpo6bnBzgfo8cbwetlcqxcGzGzQHJPiSPUJClFa9+QqWveZODbFjSon2xAPavUZzjoSmOgr2k5/xTaTlt+FkMk+B5uXXR0MXL2DmK0WJfRr11HrSRGD2arZnLy1cJFsR2lR+w//5We/adXN3uhE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=dZpNjkTiwffgyKVa2xxgH8TcimyQVQdtjc9YVg0y/FU=;
	h=date:mime-version:subject:message-id:from;

On 11/25/2026 7:48 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issues to consider:
> - [High] drm/bridge: analogix_dp: redundant AUX probes in detect and
>    analogix_dp_bridge_notify()
> - [Medium] drm/bridge: analogix_dp: bypassed HPD check and static poll
>    in analogix_dp_get_plug_in_status()
> - [Medium] drm/bridge: analogix_dp: unsynchronized concurrent updates to
>    dp->connection_notified
> - [Medium] drm/bridge: analogix_dp: late hpd_notify_mode init leaves HPD
>    IRQ enabled on suspend
> --
> 
> commit 2e833b8add367c84281267efb779f7ba405e5a0d
> Author: Damon Ding <damon.ding@rock-chips.com>
> 
> drm/bridge: analogix_dp: Handle HPD notification from downstream bridge
> 
> This commit adds an hpd_notify_mode for pipelines where a downstream bridge
> provides HPD notifications without detection, muting native HPD interrupts
> and probing the sink over AUX to cache and report connection status.
> 
> Link: https://lore.kernel.org/all/5609825.iZASKD2KPV@diego/
> 
On using the DPCD probe in v7 instead of trusting the reported status:
this follows other drivers using this notify mechanism, e.g. msm_dp
reads the AUX link status in .hpd_notify rather than the passed
status, and the real sink state is what the controller needs.

Finding 1: will be fixed in v8. analogix_dp_bridge_detect() will
return the cached dp->connection_notified instead of probing the
sink, so the probe only happens once in analogix_dp_bridge_notify().

Finding 2: will be fixed in v8. analogix_dp_probe_sink() will be
used in analogix_dpaux_wait_hpd_asserted() to make sure the sink
state.

Finding 3: will be fixed in v8. The detect path will not call
analogix_dp_probe_sink() anymore and will use the cached result
instead, so there is no concurrent update.

Finding 4: will be fixed in v8 by the "Manage pm runtime and IRQ for
native HPD pin detection" patch, which drops all the IRQ operations
from analogix_dp_suspend() and analogix_dp_resume().

The v8 will come soon.

Best regards,
Damon

