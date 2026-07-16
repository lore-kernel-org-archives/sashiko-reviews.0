Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370E438757C
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 04:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784177623; cv=none; b=MW9GVmxL3GSVZt1mvof0rC0KAkmQodtgGv5JZ1gYZLLbdND+E3W0awQoIPKgDNkDr2HJ8eKzEpLluUwk/y2JGmR7WJeHSHBEJkp9pmAwUQ/1bx6v6ypaagQAIZn+SBCS3SyTP+0KHYLtO05yIE8tgjYNz/YEvQwZBsRuMhk+N6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784177623; c=relaxed/simple;
	bh=cyIUse6rdIINUmJMuDe20rWMLdtFCRJOhWxbsLdHauk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hooEHYiyAKmzjEUiq1vZTcxT8sR7/LhoShcEolUPjTIjkRuRXXu+LYMIIkSvFJo6gt2DX9yLg1n7/YXQbOCwp7eFQd66akjK+s8U6OFT6E7iB2TcPa4K5+BGkU1DWzUJVuDBcwA5/EzZI8/5tYusMgnaZlcFtwcZFy2qYtGUChk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHA6v/jI; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHA6v/jI"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso4470329a12.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 21:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784177621; x=1784782421; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sx8AIaAR3RInGCLFLAiX7ZQYpG491PmBlyZ/gwBf0XQ=;
        b=aHA6v/jIHe0520jr0DMF8qb3OYct9g9plp7Pm5oESwrhe8I4pg0ZQOLxN1CTOXkSCv
         q5NUP3lFFSVDEk+ZjDMJfaj4DBo2aNHTTUms6e7/WCuTvE0UJDM7OvRZgAiU0QFfNR9i
         UG9SJ8AFasTQWIWxfPYEccdPoMk3DrwUaLefeRX6pGNbwPShQk5XPr9meJJDyiuCuLGl
         d3AGmzzhTOp/J7d1ibOuz7lMSL5jnt08qGknH9+t+UI5saRcQhZjHDcLv6cp7bkowCd1
         KrBMRZznbhzc4jmijtBolXx5C3R9QlXWxBLiQuZ1NGOJyagkUUKJ4OhUfF7l2aDwyFEU
         frcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177621; x=1784782421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sx8AIaAR3RInGCLFLAiX7ZQYpG491PmBlyZ/gwBf0XQ=;
        b=WoriqQ3+72EqZk6MpcZ5vL8uoxHFGYGlJCZn2E9BlVdhiY/C02AdWhvtmtp7ZAhCKN
         beZFMIZj3F+1YpZrJZUic9EfG6MfKq+05n0YcaDtjaTu2qw83YjrOnlPe7asZ19K1PL6
         vTnLx2039ggPKKPCI4OBKt/NPvFK6Uy5BJxRbb3dnmuujAXZHOoDBCH8OAY666ZFedua
         k0sKTPCvmTv1yF3lp1ZR2Bh/5uaHEJSJfS6wFUWGK5zNmr5ePF9yX43W+N0S82uoW9Oj
         0ds9Vo/UTPYHe1rqmrGWb/5RgfLS0V8pAo6Cbi84SZh96ByAd2AzYqM6UaIhK5/YP6WZ
         Dt0Q==
X-Gm-Message-State: AOJu0YwZrKIVJIpvkB/fzE5YMKhyLGbSujzPsYGUWgF8XT555zxFW5KQ
	5/cne5xph3rjTIhGChXEj/7eMcJulsB6aaPaQsttFh0fpGYJNadGqfG4KQ1dnA==
X-Gm-Gg: AfdE7ckcDVTo5ryWIZ/NxDFqjTQbY4pkzXrqZG0RMAtQzjrIUudkEssJwrOF8SOm11+
	a0JQ8N4E9zXk0CqSHWXe4SazZc3B3h4gfB4b80cAzEav1hFiFyAFiCJL1+XkO8agUsw8oP9sSlz
	mIm+98lfF7aBj5hfkJRi52JwDkDMMCMxLwRZWE8xzJL4/TJkq44q7RT28Qu4gK3nPP/gbG4P62h
	iv3InOS4tZHmRrSrcGyGYOPhKGxYOdqw9QurUfsCqnmhKCrcMOgaUExNqBeugwZj3JmvV4cKec8
	aV6Ixqd+07xC/t1Xg9Fg+widug59BcGOa7BRbDIPzkHHOXdNdLY4oKfaqVtCwKJmTS/UoRjEe2n
	ZNZf0bsuFi0fkoF5D7L64gVXkx9BqMcsr3A9s0soFW+UdwKGgxLkO4hlGKfLwUW2Ke01lTMkaT6
	qKjsfPp/wQIlCFTKjVa+b43W6mU0JMSaAiE1vWmywfuZfZWRc+Ylev/GQOuA==
X-Received: by 2002:a05:6300:4c:b0:3bf:6c08:fba7 with SMTP id adf61e73a8af0-3c357637b55mr11735006637.59.1784177621403;
        Wed, 15 Jul 2026 21:53:41 -0700 (PDT)
Received: from AnisaLaptop.localdomain (c-73-170-217-179.hsd1.ca.comcast.net. [73.170.217.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6f0dcdsm5961555eec.31.2026.07.15.21.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 21:53:40 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Wed, 15 Jul 2026 21:53:39 -0700
To: sashiko-reviews@lists.linux.dev
Cc: Anisa Su <anisa.su887@gmail.com>, linux-cxl@vger.kernel.org,
	nvdimm@lists.linux.dev
Subject: Re: [PATCH v11 13/31] cxl/mem: Add 20 second timeout for stalled
 DC_ADD_CAPACITY chains
Message-ID: <alhj0wV7a7x3fc68@AnisaLaptop.localdomain>
References: <20260625112638.550691-1-anisa.su@samsung.com>
 <20260625112638.550691-14-anisa.su@samsung.com>
 <20260625181544.67B691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625181544.67B691F000E9@smtp.kernel.org>

On Thu, Jun 25, 2026 at 06:15:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Error paths in handle_add_event fail to abort the DCD event chain properly, leading to a stalled device, leaked watchdog timers, and partial chain acceptance.
Fixed.

> - [High] Watchdog timeout clears the pending list without transitioning to a discard state, leading to a double-response protocol violation if the chain completes.

Unlikely and also a spec issue.

> --
> 
> commit f4b4a95fd0c56d91f06baa4811e9a05ea46012ee
> Author: Anisa Su <anisa.su887@gmail.com>
> 
> cxl/mem: Add 20 second timeout for stalled DC_ADD_CAPACITY chains
> 
> A DC_ADD_CAPACITY event can span multiple event records. This patch adds a
> delayed-work watchdog to prevent indefinitely stalled chains and enforces a
> maximum limit on the number of pending extents.
> 
> > diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
> > index 7dd40fb8d613c..4e887b5cdc3ed 100644
> > --- a/drivers/cxl/core/mbox.c
> > +++ b/drivers/cxl/core/mbox.c
> 
> [ ... ]
> 
> > @@ -1208,15 +1208,78 @@ static void clear_pending_extents(void *_mds)
> >  
> >  	list_for_each_entry_safe(pos, tmp, &mds->add_ctx.pending_extents, list)
> >  		delete_extent_node(pos);
> > +	mds->add_ctx.nr_pending = 0;
> >  	mds->add_ctx.group = NULL;
> >  }
> 
> [ ... ]
> 
> > +static void cxl_dc_add_timeout(struct work_struct *work)
> > +{
> > +	struct pending_add_ctx *ctx = container_of(to_delayed_work(work),
> > +						   struct pending_add_ctx,
> > +						   timeout_work);
> 
> [ ... ]
> 
> > +	if (cxl_send_dc_response(mds, CXL_MBOX_OP_ADD_DC_RESPONSE,
> > +				 &ctx->pending_extents, 0))
> > +		dev_dbg(dev, "Failed to send empty ADD_DC_RESPONSE on timeout\n");
> > +
> > +	clear_pending_extents(mds);
> > +	ctx->armed = false;
> > +}
> 
> [Severity: High]
> If the device is just slow and later sends the remainder of the chain
> (including the closing More=0 event), will the driver treat the delayed
> events as a fresh chain?
> 
It will, but the kernel has no way of discerning the remainder of an
aborted chain from a new chain.

And this would only occur if the device exceeds the 20s timeout in the
first place, which is unlikely. If this needs to be fixed, a More chain
ID would have to be added to the spec.

> Because cxl_dc_add_timeout() resets ctx->armed = false and nr_pending = 0
> without marking the chain as discarded, it appears handle_add_event() would
> process a delayed tail of the chain as a new chain.
> 
> When the More=0 event is processed, wouldn't the driver issue a second
> ADD_DC_RESPONSE for this single event chain, violating the CXL protocol?
> 
> [ ... ]
> 
> > @@ -1239,10 +1303,20 @@ static int add_to_pending_list(struct list_head *pending_list,
> >  static int handle_add_event(struct cxl_memdev_state *mds,
> >  			    struct cxl_event_dcd *event)
> >  {
> > +	struct pending_add_ctx *ctx = &mds->add_ctx;
> >  	struct device *dev = mds->cxlds.dev;
> >  	int rc;
> >  
> > -	rc = add_to_pending_list(&mds->add_ctx.pending_extents, &event->extent);
> > +	guard(mutex)(&ctx->lock);
> > +
> > +	if (ctx->nr_pending >= CXL_DC_MAX_PENDING_EXTENTS) {
> > +		dev_warn(dev, "DC add chain exceeds %u extents; dropping (firmware bug)\n",
> > +			 CXL_DC_MAX_PENDING_EXTENTS);
> > +		clear_pending_extents(mds);
> > +		return -ENOSPC;
> > +	}
> > +
> > +	rc = add_to_pending_list(&ctx->pending_extents, &event->extent);
> >  	if (rc) {
> >  		clear_pending_extents(mds);
> >  		return rc;
> 
> [Severity: High]
> Do these early error returns fail to abort the event chain properly?
> 
> If the limit is exceeded or memory allocation fails, the code calls
> clear_pending_extents() and returns an error without sending an
> ADD_DC_RESPONSE.
> 
> If this happens on the first extent, wouldn't the device never receive a
> response and stall indefinitely?
> 
> If it occurs on a subsequent extent, does this leave the watchdog timer
> armed to fire spuriously later?
> 
> Additionally, because clear_pending_extents() resets nr_pending to 0, if
> the device continues sending More=1 events for the same chain, would the
> driver incorrectly process them as a new chain and potentially accept the
> tail of a chain after dropping the head?
> 
Fixed.

rc = add_to_pending_list(&ctx->pending_extents, &event->extent);
if (rc) {
	clear_pending_extents(mds);
	/*
	 * If More chain only has 1 record and errors before watchdog is
	 * armed, cxl_add_pending will never be reached, so no response
	 * is sent. Return an empty response. Also sends empty response
	 * for multi-record chain pre-emptively rather than waiting for
	 * watchdog to trigger.
	 */
	if (!(event->flags & CXL_DCD_EVENT_MORE)) {
		ctx->armed = false;
		cancel_delayed_work(&ctx->timeout_work);
		if (cxl_send_dc_response(mds, CXL_MBOX_OP_ADD_DC_RESPONSE,
					 &ctx->pending_extents, 0))
			dev_dbg(dev, "Failed to refuse chain after staging error\n");
	}
	return rc;
}

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260625112638.550691-1-anisa.su@samsung.com?part=13
