Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5602D47F3DA
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 14:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789567935; cv=none; b=WMNGTtTHBjOVRa2wi62UX6w2buw24L6D+Xsvk39SfrPYJ8w6e7tr2UTHbjc98J/ej+VUYeDbxQ7dRtRVJ8exAHpvwVh6dYXtQilx1w3z8PLemOgNXjk47xvcOollZzD6ZU/lnta5Hs2GiML0IZgeL7EqYOlaOXrteBCz77Yv1JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789567935; c=relaxed/simple;
	bh=Bz9SWBLA/1RUN89ZB/1c7INvPOzJTqABef8L2hV1+9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9uVZY303wAxUxdbyerfwrRc98FLw9Dfdi2HkLgi7zX9L3WSnR9lEEHQreJwu5GvKtcDm5Py3fiG/I+nHEP1LYHTrF7jBBb7Yc+5hazcVceNw4jP8TRW6FiH1u+U7l+aFyeb7+ZCvnHQnGfNIOpaYgojyM5EfAWP8PDFmgb1cN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTZYSLea; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTZYSLea"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910a0cb7aso86621285a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789567933; x=1790172733; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qgJdcm+eEONTUrvoohdyqwlV+G7FBK9fgCXEE2k/YEU=;
        b=GTZYSLeai2R5KEsT1r+dNEuG2dZZSgnLUcj9u6N86HTzfD2wfcFvsoG9jxyHlTI8wg
         BLXVB3ub6BnzROKxE98i6vaz4Nb3AGyiUVW469LtlHdQHEi+m8DhomSPemDFRO+vCzkp
         OnFwMotcL++/tBAvTL8qrknU9E47tb8BE3HJUKk8zGQIuynUg0fYdhmjBi0ztCJPxh1I
         Col7boD5KIvPFK/gRv4mo4sJBrqkAx2FdOj9Jixfou1DFfOPYrK0voOEO0cuFGJBoat1
         T2BTISbDcvpBsqUmuMHDGdo2cj7oCiE0FxL0/w46oGvndURpfoh0KBFiJaNTjipFNpcz
         S4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567933; x=1790172733;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qgJdcm+eEONTUrvoohdyqwlV+G7FBK9fgCXEE2k/YEU=;
        b=aeneJKVfNWYcWPaPGpMnhiGSCLhdsY5ehPTGzIoca90rTmlPxPmPSs+lfrX6NaARVk
         R0WrIRLFYBEw58jaYIQMcr+0hnWlp+D9VcxjaKWtexp44f0wGv44iVFGtkYHcctsF96A
         NkPS69xC8f65iQcj1BKwSgrtaDHFbW+/5t23S0doouhwdTdZQLTmD5uK6v06ROgSXZW4
         /sHjBHjJTSXSBg6Tb6Gw/x+e7FdU7U9xghIQg9siocgX+neMmg6fdAZHfvKHhUrkDGDj
         l0AChhgItVn0TAcjeGWG4eQwHGsOj9FeY4JzBVoYzo891dgU0ZSF1K8tR/cxs4OzbbPI
         nQIA==
X-Gm-Message-State: AFuF++knsC+hwhLivP8QviisTC0Gnsqem60lk7fUySiiYaYRTvC2yjIA
	wM9mG0ulPfSF9uPn2SzADzVJX8hm69dgU6CHi5PYAR6nArZq5NZp1cd8FzyhFB6H
X-Gm-Gg: AYBFou0Ek+vYAYbrP+CqvMs2fdvOwDrcv7PrG9h27VISVPPNLYJY9xZPX6WYHjRB6bN
	5tpyIpGzSzAqZDjUXqlz2/uZe2+RACRJ3UBoDBi9Z1CgR82r1EnueeD3cwWX/hgulzPOo7n5mEe
	zpGW7a6+ShVPGPaOAnRohFP2h1miM+uJcuKPX3kc5kS/nOrGDfY3F+Eq7yvLossHt/PaXw4SwmX
	Hg3/77I/HiwqRzh572/OSjKMHBAIUyYbmzo0leCAEMBnhlaUcU8hkybVBXzZFd3zrNKgIFGWB1A
	5Ud5EafvLckR9y7nirNhq4QZFBgqpmNHS/7hmQ0U0cOJxE9MYQDA7BBLpB94TlVQDBA3djC1sBq
	F/Ad7HCDjQvAbrUoxVsvbRCH8aOfypeqq43NVaI8Gft6kVdJKG3lSm6RqooMCZ+ZAgFqj3KLtJy
	6jpjw435Q5eJZ567u/WVIYlm5n60EQ3HDRtcuEpNS0K1QhOqoJUvFvO8EVOWtfRV8E5JAq/TQwH
	Q==
X-Received: by 2002:a05:620a:172a:b0:93b:6f87:ff60 with SMTP id af79cd13be357-93bb7774174mr417814385a.14.1789567932952;
        Wed, 16 Sep 2026 07:12:12 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b81d18e5asm229043985a.44.2026.09.16.07.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:12:10 -0700 (PDT)
Date: Wed, 16 Sep 2026 19:42:08 +0530
From: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-cxl@vger.kernel.org
Subject: Re: [PATCH v2] cxl/events: Return IRQ_NONE when no event is pending
Message-ID: <aqqjuLNtbROumYj_@acer-nitro-anv15-41>
References: <20260912093815.14455-1-shaikhkamal2012@gmail.com>
 <20260912094807.65E461F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260912094807.65E461F000FF@smtp.kernel.org>

On Sat, Sep 12, 2026 at 09:48:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The threaded IRQ handler `cxl_event_thread()` can enter an infinite loop if mailbox commands fail to clear event records on the device, or if a PCIe surprise removal causes the MMIO read to persistently return all 1s (~0U).
> - [High] The driver blindly trusts the `record_count` and `count` fields returned by the device in mailbox payloads, leading to out-of-bounds kernel memory reads and potential information leaks.
> --
> 
> commit 659b756fc25aa4e783ce4a882044a537d7b5d643
> Author: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
> 
> cxl/events: Return IRQ_NONE when no event is pending
> 
> This patch tracks whether the CXL event handler claimed the interrupt and
> returns IRQ_NONE when no supported event is detected. This allows the generic
> spurious-interrupt detector to identify and disable the affected IRQ during
> interrupt storms where no handler claims the event.
> 
> > diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
> > index c7c91e8dc51dc..8b560cae91f2e 100644
> > --- a/drivers/cxl/pci.c
> > +++ b/drivers/cxl/pci.c
> [ ... ]
> > @@ -515,6 +515,7 @@ static irqreturn_t cxl_event_thread(int irq, void *id)
> >  	struct cxl_dev_id *dev_id = id;
> >  	struct cxl_dev_state *cxlds = dev_id->cxlds;
> >  	struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlds);
> > +	bool handled = false;
> >  	u32 status;
> >  
> >  	do {
> >  		/*
> >  		 * CXL 3.0 8.2.8.3.1: The lower 32 bits are the status;
> >  		 * ignore the reserved upper 32 bits
> >  		 */
> >  		status = readl(cxlds->regs.status + CXLDEV_DEV_EVENT_STATUS_OFFSET);
> >  		/* Ignore logs unknown to the driver */
> >  		status &= CXLDEV_EVENT_STATUS_ALL;
> >  		if (!status)
> >  			break;
> 
> [Severity: High]
> This is a pre-existing issue, but can this loop become infinite if a PCIe
> surprise removal or fatal device error occurs?
> 
> If readl() returns all 1s (~0U), status & CXLDEV_EVENT_STATUS_ALL will
> still evaluate to a non-zero value, passing the if (!status) check. The
> handler will then call into cxl_mem_get_event_records() where mailbox
> commands will fail on the removed device, exiting without clearing the
> hardware event status.
> 
> Since status is never cleared and the error handling doesn't break the
> loop, this evaluates to true at the while (status) condition and repeats
> indefinitely. Does this IRQF_ONESHOT threaded handler need to check for ~0U
> to avoid monopolizing a CPU and preventing device teardown during hotplug
> removal?
> 
> > +
> > +		handled = true;
> >  		cxl_mem_get_event_records(mds, status);
>

On the drain loop: Jonathan already responded to the same report on v1 — surprise removal isn't supported today, so there's no evidence this is reachable in practice. 
link : https://lore.kernel.org/linux-cxl/20260907194400.17bb5f5c@jic23-huawei/

Li Ming and Davidlohr made the same point on Anisa Su's series: the Event Status register is device-owned and the spec requires the device to clear it, so a device that doesn't is a firmware bug, not something the driver should work around.


> [Severity: High]
> This isn't a bug introduced by this patch, but does this code blindly trust
> the record_count returned by the device hardware?
> 
> When cxl_mem_get_event_records() calls into cxl_mem_get_records_log(), the
> driver reads the count directly from the untrusted payload:
> 
> drivers/cxl/core/mbox.c:cxl_mem_get_records_log() {
>     ...
>     nr_rec = le16_to_cpu(payload->record_count);
>     ...
>     for (i = 0; i < nr_rec; i++)
>         __cxl_event_trace_record(cxlmd, type, &payload->records[i]);
>     ...
> }
> 
> If a compromised or malicious CXL device returns an artificially large
> record_count, could this read out-of-bounds kernel memory and leak it to
> userspace via tracing? 
> 

Valid, and not introduced here -- different file, different Fixes: tag, so
I'm not folding it into this patch.

record_count comes from the device and records[] lives in mds->event.buf,
which is sized at probe. Nothing checks one against the other, so a bad
count walks off the end of the buffer.

> The same pattern appears in cxl_clear_event_record() and
> cxl_mem_get_poison(), where the untrusted count is used as a loop bound.
> Should the payload size be validated against mbox_cmd.size_out or the
> maximum allocated buffer size before iterating?
> 
> >  		cond_resched();
> >  	} while (status);
> >  
> > -	return IRQ_HANDLED;
> > +	return handled ? IRQ_HANDLED : IRQ_NONE;
> >  }
>

These are pre-existing issues and independent of the IRQ_NONE versus
IRQ_HANDLED change in this patch.

Anisa is already taking care of these checks in her upcoming patch series, 
so this can be handled there.

Anisa's patch link: https://lore.kernel.org/linux-cxl/20260901002912.958-3-anisa.su@samsung.com/


> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260912093815.14455-1-shaikhkamal2012@gmail.com?part=1
