Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2CB3815DF
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 04:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174579; cv=none; b=douZYeBlcTDUkkdsiceiK2ymhjslMtM/9EDStAltpo/zLWvro3DGJQ/uKS4yCfscibKJhEU8ChxUhOuDlykKN/tNXyz0cW/Je9xxdP6p7G2efrw1vttBvBlshsD/DTKR/3lCpW15PWyPiLY7ExU2EbBPJAhY9Vr150m3dwYn2QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174579; c=relaxed/simple;
	bh=d7aU3uyKLG34LsTMI0paCwFYeD/+/RMdEYPDr82BvYY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoo6gR5p5EkPQsATaJdQ1gA9pA8i5fMBbOCUADdOdZcWk6gld4iUGv+C17AyiFbq5EOjzq4ytKyFg9zMHrGrHMXUlGR+xVU25QnWxTc2dwcCO7ZtJj87M0vycttTxn8EB2l6Z5q8RUOK+j5uPTU87NPV+0/EAbp2Q52y6zpmmbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+qgXlWW; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+qgXlWW"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c998fd549a8so4134196a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 15 Jul 2026 21:02:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784174578; x=1784779378; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=c/F5UyiFVMTs/o+v2W4iOriLL7VjvVx1zCXRlvh4eUo=;
        b=D+qgXlWWjs7+Z34grXRW/aOpEvQ1YydQl2p3NmJR8FAM+V2CoEXFNyUaNB/YicJGL3
         o/6VfMN+cDs7WdcAj7lypwhPLGx6k9Qvvj2sv4CLl5jPEFu3DRuQG5q23KfLMu1AHSXn
         9sRgBI4ANxFNvlz2n6K5wfIkjIQ3HDTOr/+vvV4vvq3gIxK7mYBsCoNVJdS83Ul4xhIW
         O15MDZ7ySYCIjsHGFkK2yK28GXtmiNWlneO1QJLbjYagqMAuwa9dAujeJdNIOsKNDF6U
         d5sP1fjXrZTgrjvlKmNBhY/Q4SUOLyI9Ues9JEL+EmgQdbVLMh5Ap0wyoTlMF5cD4ZQu
         tZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784174578; x=1784779378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c/F5UyiFVMTs/o+v2W4iOriLL7VjvVx1zCXRlvh4eUo=;
        b=iTUokgjgoMzIP0BrobBgBRfA9iV9JlDSsXvQoJgIPvFWZyoDH1eDgApbeDAgXkFng1
         /r7tj7erRaVY9YAZr02alyENcnHujma9eZZHOaRpPcj44UJnZdAwR0/1AbyEI+IJg8PF
         6UFke53g/qbL81aI1ORCcKab/7Qtl2zNuZrMvCXdWuUhr8PVsuZo/fm31rEj+q9kJTnd
         ktqzYL2S0DpPLH6wseUB1U2+guzlmJC7sAjeuZhSw8lnvhAJk1PJKZP+KyxDphHNKNat
         dbp8IpeOZiHYHO1BkEueKQD6jCZkr46WAr9IGgROC5ePQ7v9Dm1rCOc1qo7s9VmYm1FA
         k6FA==
X-Gm-Message-State: AOJu0Yz3/Iq7p4sPBf1pyAJHCWl8K2ogyWC4F9yNMxSmDktKVTCZaQlV
	o0SMPDPSzvJkAzhHWdpQ391042TSxwxAV4xyDYNZ6hbpbCkM0nyt0tVvrX6MLQ==
X-Gm-Gg: AfdE7ckiqLnnVcaql48643aCm2fmhInxFNELNzqY7iBeE3vFcGa3BQ7uQZAv5B4JDG7
	JjHCTeimmwF1PVe0AhhtEwAX8CnFD2GJK3VSH1lURmnkQLIslxtu/MNv34ahDKzNZkbREtPNCcz
	Knd4QlvDkkHB+PMiACe1iRi24tAELCT/85U4PIQitSs7NJTZdhOl43ejShHT6P8Z/okk79VdycF
	bbJ9OmrvdCxRkpadchO6GsBX3lPfNwf4Owfk/3YROADVLvvBRP09EgNIWtehfF3FKJKO9Qrc6je
	KEFG5LL1t0/znOKNm6gTHnfWJd6++g8VBxA3NHVfkECRYJZKk4sSljE/dK6Q2OUtwLs+wfD2tuN
	eyDXBNc32065XFI0w5af7DRa2Rm3VicLRReIUf8smsXtZHWb8fVMz5mtwugaiip6/onxm1TNsX6
	BXEdDa3NjH/c2haeibE6PlB+kbMklyYTsS3HJ/0+D2k/uCJ7PlsKdq2bWpEA==
X-Received: by 2002:a05:6a20:12d3:b0:3c0:9c19:65b1 with SMTP id adf61e73a8af0-3c36c48f699mr6334076637.73.1784174577571;
        Wed, 15 Jul 2026 21:02:57 -0700 (PDT)
Received: from AnisaLaptop.localdomain (c-73-170-217-179.hsd1.ca.comcast.net. [73.170.217.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd426b36asm5404870c88.2.2026.07.15.21.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 21:02:57 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Wed, 15 Jul 2026 21:02:56 -0700
To: sashiko-reviews@lists.linux.dev
Cc: Anisa Su <anisa.su887@gmail.com>, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v11 12/31] cxl/mem: Set up framework for handling DC
 Events
Message-ID: <alhX8FgHlb39VLFN@AnisaLaptop.localdomain>
References: <20260625112638.550691-1-anisa.su@samsung.com>
 <20260625112638.550691-13-anisa.su@samsung.com>
 <20260625181219.4E8B51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260625181219.4E8B51F000E9@smtp.kernel.org>

On Thu, Jun 25, 2026 at 06:12:18PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Missing DCD response on memory allocation failure leaves the device state machine permanently blocked while unconditionally clearing the event log.
fixed

> - [Medium] Stack-allocation optimization in `memdev_release_extent()` is defeated by an internal dynamic allocation in `cxl_send_dc_response()`.
false pos

> - [Medium] Invalid `__counted_by` attribute on a little-endian struct member breaks bounds checking on big-endian architectures.
fixed

> --
> 
> commit f5333550094fcaacb4e98dbf0c270b32ec17b506
> Author: Ira Weiny <iweiny@kernel.org>
> 
> cxl/mem: Set up framework for handling DC Events
>     
> Adds the support for receiving DC event records but defers
> the real add/release logic to subsequent commits. Simply refuse all
> extents for DC_ADD and ack all DC_RELEASE events for now. Forced
> release is currently unsupported.
> 
> > diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
> > --- a/drivers/cxl/core/mbox.c
> > +++ b/drivers/cxl/core/mbox.c
> 
> [ ... ]
> 
> > +static void memdev_release_extent(struct cxl_memdev_state *mds, struct range *range)
> > +{
> > +	struct device *dev = mds->cxlds.dev;
> > +	struct cxl_extent extent = {
> > +		.start_dpa = cpu_to_le64(range->start),
> > +		.length = cpu_to_le64(range_len(range)),
> > +	};
> > +	struct cxl_extent_list_node node = { .extent = &extent };
> > +	LIST_HEAD(extent_list);
> > +
> > +	dev_dbg(dev, "Release response dpa %pra\n", range);
> > +
> > +	/*
> > +	 * Stack-allocated instead of kzalloc'ed to avoid potential -ENOMEM,
> > +	 * which would prevent sending the release DC rsp.
> > +	 */
> > +	list_add_tail(&node.list, &extent_list);
> > +	if (cxl_send_dc_response(mds, CXL_MBOX_OP_RELEASE_DC, &extent_list, 1))
> 
> [Severity: Medium]
> The comment mentions stack-allocating to avoid -ENOMEM so we can ensure the
> release DC response is sent.
> 
> However, cxl_send_dc_response() uses kzalloc() to allocate the
> cxl_mbox_dc_response message:
> 
>     struct cxl_mbox_dc_response *response __free(kfree) =
>                         kzalloc(pl_size, GFP_KERNEL);
> 
> Doesn't this dynamic allocation defeat the optimization, since memory
> pressure could still cause kzalloc() to fail, preventing the release
> response from being sent?
> 
No.

In cxl_send_dc_response(), we send an empty rsp if kzalloc() fails.

struct cxl_mbox_dc_response *response __free(kfree) =
						kzalloc(pl_size, GFP_KERNEL);
if (!response) {
	/* Refuse all extents rather than stall the device. */
	struct cxl_mbox_dc_response empty = { };
	return send_one_response(cxl_mbox, &empty, opcode, 0, 0);
}

Originally, this function kzalloc'ed the node that was the input for
cxl_send_dc_response. If that failed, we would never reach
cxl_dc_response(), and no rsp would be sent, which is why it was changed
to stack allocation.

Anyway the comment is deleted since it seems misleading and stack-allocating
two small local structs for a single extent is the obvious choice and does need
extra justification. There is no issue of correctness.

> > +		dev_dbg(dev, "Failed to release %pra\n", range);
> > +}
> 
> [ ... ]
> 
> > +static int handle_add_event(struct cxl_memdev_state *mds,
> > +			    struct cxl_event_dcd *event)
> > +{
> > +	struct device *dev = mds->cxlds.dev;
> > +	int rc;
> > +
> > +	rc = add_to_pending_list(&mds->add_ctx.pending_extents, &event->extent);
> > +	if (rc) {
> > +		clear_pending_extents(mds);
> > +		return rc;
> > +	}
> 
> [Severity: High]
> If add_to_pending_list() fails and returns -ENOMEM, we return early without
> sending the required CXL_MBOX_OP_ADD_DC_RESPONSE command.
> 
> Since cxl_handle_dcd_event_records() drops the error and the event is cleared
> from the device log, will this leave the device state machine permanently
> blocked waiting for a response that never arrives?
> 
Fixed.

This only applies in the case for a More chain with a single event
record. So the first and only event record has More=0 and the 20s
watchdog is never armed. Otherwise, the watchdog would catch it.

However, we may as well send an empty response anyway for both cases. So
the fix is:

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

> > +
> > +	if (event->flags & CXL_DCD_EVENT_MORE) {
> 
> [ ... ]
> 
> > diff --git a/drivers/cxl/cxlmem.h b/drivers/cxl/cxlmem.h
> > --- a/drivers/cxl/cxlmem.h
> > +++ b/drivers/cxl/cxlmem.h
> 
> [ ... ]
> 
> > +/*
> > + * Add Dynamic Capacity Response
> > + * CXL rev 3.1 section 8.2.9.9.9.3; Table 8-168 & Table 8-169
> > + */
> > +struct cxl_mbox_dc_response {
> > +	__le32 extent_list_size;
> > +	u8 flags;
> > +	u8 reserved[3];
> > +	struct updated_extent_list {
> > +		__le64 dpa_start;
> > +		__le64 length;
> > +		u8 reserved[8];
> > +	} __packed extent_list[] __counted_by(extent_list_size);
> 
> [Severity: Medium]
> Should this use __counted_by_le() instead of __counted_by()?
> 
> Since extent_list_size is explicitly little-endian (__le32), using
> __counted_by() on big-endian architectures will result in the bounds checking
> instrumentation reading an inflated integer value, leading to out-of-bounds
> errors or kernel panics.
> 
Fixed.

Also updated spec reference to r4.0 Section 8.2.10.9.9.3; Table 8-350 & Table 8-351

> > +} __packed;
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260625112638.550691-1-anisa.su@samsung.com?part=12
