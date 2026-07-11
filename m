Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1BD3A5E7B
	for <sashiko-reviews@lists.linux.dev>; Sat, 11 Jul 2026 10:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783766657; cv=none; b=I/Ks8y3cjK1xz76WTjvMsOYKJkvT0dn481QAmh4Tyv0VFZlJqmzaGeUxetdu7RQcvQ0pSepW5WbU0NI0VzDzUFZiUypq2xihUJdc8NH3S8rCBORVpro/cWZzvtleMK93oltDSSjEKM2A10Vn6PT0/ALC3qw78X6q/G8tr/uk2x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783766657; c=relaxed/simple;
	bh=W/vCSOQnin/or3iCGmUk2clUaLjr1vtr+B8+JtN593Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lSScpdrWZUTjaxWS/8KGdkPhJbKOFw/mNEYgMVP/odW89i2Z7mXtE/xOSmLnBXdtdjH8rnXpHw/z1z275Ob9tUMvGYMCosu159Z+8hM5qUSRO2Fhcjgt/7m+TMdVCiaRYGb9J7lmgHBtK3PYrZpRVZRIo/BHrf3wGDG4nDuEias=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=Q9yn8ScM; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="Q9yn8ScM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1783766651; x=1784025851;
	bh=oN3KjQWEzEtdUMpQJLEgvHTpZHwiwxpxjFr4/akrDl8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Q9yn8ScMFKz5vfSHJJf1NKOFqOXlFjNYxNYQzTs21eSfF+RPUrHTQRMGp/4c6cqCN
	 BbLheNTD6aQiBq6uZ8hdd80glJJtjWFOfYzWtnvQPcceeDutiMeoZeiq0d6kXCGxtv
	 E3TJI+EEZWMO4BxRkG0tZKcYnoix935r9E7kOk6vNhKL+9pSii4yFuD8CNMqeVPxGy
	 rBcs4QMQJNtjprzUZ7+uBAveZTsPUC5fgl8j0nxLTIryfGjxqsveFBnfD286H8yMEN
	 dBk7gzLxqOUGv+S5npZcg3a6CQ9yeaoXG7YCZc9SZcC6/jUHBmmZycgmCh1WCshHt2
	 tef08x3+seEpg==
X-Pm-Submission-Id: 4gy50n3VBfz2ScNx
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] drm/bridge: nwl-dsi: Limit LCDIF specific sync
 override
In-Reply-To: <20260710140910.6C6F01F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 10 Jul 2026 14:09:10
	+0000")
References: <20260710-nwl-dsi-fixes-v1-0-927d918a86ad@geanix.com>
	<20260710-nwl-dsi-fixes-v1-1-927d918a86ad@geanix.com>
	<60cFXTpHRiGiQnHaXBrNOzu6l4AS4jsI0bM3JKHqHfLYd7CPg_dNfAX2Gwc1kNaDVweIYrRG1J4EVab8be5gzA==@protonmail.internalid>
	<20260710140910.6C6F01F000E9@smtp.kernel.org>
Date: Sat, 11 Jul 2026 12:44:08 +0200
Message-ID: <87jyr1ergn.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>
> Pre-existing issues:
> - [High] Dangling pointer `dsi->xfer` leads to stack Use-After-Free if a timeout or clock error occurs during transfer.
> --
>
> --- Patch [1]: [PATCH 1/3] drm/bridge: nwl-dsi: Limit LCDIF specific sync override ---
> commit 36a9bfa60fd8b6568d59af4e95e04fc059970758
> Author: Esben Haabendal <esben@geanix.com>
>
> drm/bridge: nwl-dsi: Limit LCDIF specific sync override
>
> When using DCSS with NWL, overriding the mode flags to enforce active high
> sync is preventing the use of active low with downstream bridges, such as
> ti-sn65dsi83, which will not see such mode flags set by the panel.
>
>> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
>> index 3c9ae93c4f671..915e1bdc73c80 100644
>> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
>> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
>> @@ -110,6 +110,8 @@ struct nwl_dsi {
>>  	int error;
>>
>>  	struct nwl_dsi_transfer *xfer;
>
> [Severity: High]
> This is a pre-existing issue, but could this pointer lead to a stack
> use-after-free if a timeout or clock error occurs during a transfer?
>
> In nwl_dsi_host_transfer(), dsi->xfer is assigned the address of a local stack
> variable:
>
> 	struct nwl_dsi_transfer xfer;
> 	...
> 	dsi->xfer = &xfer;
>
> If clk_prepare_enable(dsi->rx_esc_clk) fails, or if the DSI transfer times out
> (wait_for_completion_timeout() returns 0), the function returns without
> clearing dsi->xfer.
>
> If a delayed or spurious hardware interrupt later triggers
> nwl_dsi_irq_handler(), it will call nwl_dsi_finish_transmission() which
> dereferences the dangling dsi->xfer pointer:
>
> 	xfer->status = xfer->tx_len;
> 	complete(&xfer->completed);
>
> Because xfer was originally on the stack of the returned function, could this
> overwrite arbitrary stack memory of whatever thread happens to be running at
> the time of the interrupt?

That does sound like a problem, yes. But unrelated to the change under
review here.

Perhaps dsi->xfer should be changed into a an embedded struct
nwl_dsi_transfer member instead of a pointer (to stack)? Although I fear
that the same kind of situation will then trigger another problem, as a
nwl_dsi_host_transfer() would then create a new packet while
nwl_dsi_finish_transmission() could be using the packet as well.


>> +
>> +	unsigned int endpoint;
>>  };

/Esben
