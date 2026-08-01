Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDC31FDE31
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785576628; cv=none; b=YZSrEX/EPHchjUAiALR+KwUlTqNTcHgkwn9XO5AU3PnivNSwvXw1QjYJC0i5+ZgwI0e2WQg/NTc/3+KYrBhqXBt2PffPP44H/2bNLv444rn1FSpu42Fm+kSh+S59pbl+n3cBSuXDmBVk2JS5stCS/foj78aT0AwZ7EGgYw3ouYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785576628; c=relaxed/simple;
	bh=HdEmUDwZLn0wW9dQa+nd1AhK2b3wr4gNpcv6lOn/g6c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rW0OFkyIJjo+y1zoMMQOaD2Aa5l4bgZj4muPd3FlgjNHURzyvGet3kS6kIbBu52BEwjegtH3RW1Bq1/XslXZ341TuyIRyQ/Z+5WHHDVE5axsO8Ce/5hDDBuNAValmgLjni4koFLWPdjRHxDAWhlrp8i5BgXCSfS4KqSQwWtZyts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deY2ubXF; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deY2ubXF"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e58034d05so1886508a91.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 01 Aug 2026 02:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785576627; x=1786181427; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ypHZlXSUXCKVXUtnVdQ6FQwUu/1gI9U0Sj1QazJgXTg=;
        b=deY2ubXFo9rZqswQKW9SkOOLmKylFVGONMjzde/rWzgAJSjQhwo0LnX6fu+uHBP2gb
         w8Q0uJwN/vKwi72p2JZTzVJ58SzRKt4V66mDxYI3WbJHpNd2usZtqQwZL0rrP1I08bYC
         qbdFZDOBEh1zmP5EThWM860hODXOqBJXrSAYARS+DlYwHJrvjozhIyflPqaaWHG73K+X
         D/nPr8wjiKF4h8sy0+CKKQVHQifG22rVMSGbgkitP9+H+v4Ro2hrjdDzTOFDY5O4/RHm
         8R5a+5EQpk8g4orRFGv7hlPoh+o1WwB8V058qx+rmLDHot4VgKVol/DlrfiK6qtut42n
         9nsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785576627; x=1786181427;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ypHZlXSUXCKVXUtnVdQ6FQwUu/1gI9U0Sj1QazJgXTg=;
        b=orOdQF/zQFUQ0/0OYMRUVgMFW881aVFirJez4mdMcDzKusKbb7t6isbT5RVa/pKQvB
         7K5zAFAIkWaOQ1p5pPLBUnlIoFa3ALgLuR13bL3XhVST8mNRRBmXMINjRh3SfeqeXppr
         FLgWTbxSKFYrRG/cJY575qbHExeqrdTO1E2ZA6GTJF+a0RrNiHSPBf0EdFDUqlAmTw2Q
         u/lMnFMJyjOiiivg07l34fa97H4Y0cAXpXQT9UHJMX4hy1OnJ+D2OuRplgR3eNjIiqsJ
         +p8SatYOqgRt80u19JblfX9GLpunMmEoycXKTIBCPyEJFkU0QTvcWd9BnCN/YbGmLkL8
         6kYA==
X-Gm-Message-State: AOJu0YzPhTwcmA2YWUoSC1iud6KE/IC7+gnK5oRagWO172nSlrOKG1xr
	5ESGxrKZQJ0KQV41wBwNXsgcv4159/Z34x5ZXQeLaS3QfdmTI8Sdqkkzu4hXgA==
X-Gm-Gg: AR+sD12IZztvF4ZlcuZMNef7K31LQIQtEE66W1PkjKYXkDT7TjdWWMidNLKu9Smggoc
	qTwxPwLiiPwKPk6TrauUKeZJjhox2SZp9rWkIamPm+cCLV+Up2qgPIIs3uxq/Be9Cri1O2pSWcP
	IFI8DlyDL3hprpCj8TPKOdE4TVJfVvRwdEGshJSY3KmNlIbzx8oFdJPqVXrGnIYJXWuOKQX6NlC
	4jtrmuSLf79pRsj4cvTDMhwLB3NW2BgGFVYr4b2hPpOfP1MTZu/z15kbNOO520l64jcI9zVVIjH
	H5hT8EmoKLsS4RGT7OLtUpsVABtPxDMOOL0AAdlgAa7tXy7RC8JlodIbkJyoZK+07hb4UJMLrsx
	wGGdOtnCOlJNuQdnOJIqQyK8z/PY1+k+dHa14U6sY+1LZs9C1vvAaJ95A3A3BGncRpyVwCzq4u3
	a6f59b6BST9itCIzlhEIKJzzLzdyMZHWaZ7fVXi54Wt62NQARHWLCRY8vMXQTQva06biy4D+tac
	V8izKLSw/IihvqC88qYuA8pR5ovGcYOWmqVE9PeUKkf
X-Received: by 2002:a17:90b:57cb:b0:381:11eb:d78e with SMTP id 98e67ed59e1d1-38fbc4431dcmr2875847a91.14.1785576626663;
        Sat, 01 Aug 2026 02:30:26 -0700 (PDT)
Received: from AnisaLaptop.localdomain (c-73-170-217-179.hsd1.ca.comcast.net. [73.170.217.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c1casm15122663eec.10.2026.08.01.02.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 02:30:26 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Sat, 1 Aug 2026 02:30:24 -0700
To: sashiko-reviews@lists.linux.dev
Cc: Anisa Su <anisa.su887@gmail.com>, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org
Subject: Re: [PATCH v12 6/8] cxl/mem: Configure dynamic capacity interrupts
Message-ID: <am28sIX7a6Z7QaXr@AnisaLaptop.localdomain>
References: <20260731084901.1512819-1-anisa.su@samsung.com>
 <20260731084901.1512819-7-anisa.su@samsung.com>
 <20260731090444.558491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731090444.558491F000E9@smtp.kernel.org>

On Fri, Jul 31, 2026 at 09:04:43AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] Infinite IRQ Thread Loop / CPU Spin when handling DCD events
> 
False Positive. DCD events are ignored because DCD is turned off
(mds->dcd_supported = false).

> Pre-existing issues:
> - [High] Out-of-Bounds Read and Information Leak in Event logs
> - [High] Out-of-Bounds Read and Information Leak in Poison logs
> --
> 
> --- Patch [6]: [PATCH v12 6/8] cxl/mem: Configure dynamic capacity interrupts ---
> commit 5b173c122c3602992c4ceeafd1c2d87a80accacb
> Author: Ira Weiny <iweiny@kernel.org>
> 
> cxl/mem: Configure dynamic capacity interrupts
> 
> Dynamic Capacity Devices (DCD) support extent change notifications
> through the event log mechanism. Configure DCD event log interrupts
> on devices supporting dynamic capacity. Disable DCD if interrupts
> are not supported.
> 
> > diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
> > index df13fb8802c38..6cb344ec4f3a7 100644
> > --- a/drivers/cxl/pci.c
> > +++ b/drivers/cxl/pci.c
> > @@ -509,11 +509,30 @@ static bool cxl_alloc_irq_vectors(struct pci_dev *pdev)
> >  	return true;
> >  }
> >  
> > +/*
> > + * Event logs the driver drains: standard logs when native_cxl, DCD when
> > + * supported.
> > + */
> > +static u32 cxl_event_drain_mask(struct pci_host_bridge *host_bridge,
> > +				struct cxl_memdev_state *mds)
> > +{
> > +	u32 mask = 0;
> > +
> > +	if (host_bridge->native_cxl_error)
> > +		mask |= CXLDEV_EVENT_STATUS_ALL & ~CXLDEV_EVENT_STATUS_DCD;
> > +	if (cxl_dcd_supported(mds))
> > +		mask |= CXLDEV_EVENT_STATUS_DCD;
> > +	return mask;
> > +}
> > +
> >  static irqreturn_t cxl_event_thread(int irq, void *id)
> >  {
> >  	struct cxl_dev_id *dev_id = id;
> >  	struct cxl_dev_state *cxlds = dev_id->cxlds;
> >  	struct cxl_memdev_state *mds = to_cxl_memdev_state(cxlds);
> > +	struct pci_host_bridge *host_bridge =
> > +		pci_find_host_bridge(to_pci_dev(cxlds->dev)->bus);
> > +	u32 mask = cxl_event_drain_mask(host_bridge, mds);
> >  	u32 status;
> >  
> >  	do {
> > @@ -522,8 +541,8 @@ static irqreturn_t cxl_event_thread(int irq, void *id)
> >  		 * ignore the reserved upper 32 bits
> >  		 */
> >  		status = readl(cxlds->regs.status + CXLDEV_DEV_EVENT_STATUS_OFFSET);
> > -		/* Ignore logs unknown to the driver */
> > -		status &= CXLDEV_EVENT_STATUS_ALL;
> > +		/* Ignore logs unknown to the driver or owned by BIOS */
> > +		status &= mask;
> >  		if (!status)
> >  			break;
> >  		cxl_mem_get_event_records(mds, status);
> 
> [Severity: High]
> Since mask now includes CXLDEV_EVENT_STATUS_DCD, status can have this bit set.
> However, cxl_mem_get_event_records() does not appear to handle the DCD event:
> 
The mask never includes CXLDEV_EVENT_STATUS_DCD.
Above in cxl_event_drain_mask:

if (cxl_dcd_supported(mds))
              mask |= CXLDEV_EVENT_STATUS_DCD;

mds->dcd_supported is set to false in Patch 1 so the DCD bit is never
set.

So status &= mask becomes zero and we break from the loop.

- Anisa
> drivers/cxl/core/mbox.c:cxl_mem_get_event_records() {
>     ...
>     if (status & CXLDEV_EVENT_STATUS_FATAL)
>         cxl_mem_get_records_log(mds, CXL_EVENT_TYPE_FATAL);
>     if (status & CXLDEV_EVENT_STATUS_FAIL)
>         cxl_mem_get_records_log(mds, CXL_EVENT_TYPE_FAIL);
>     if (status & CXLDEV_EVENT_STATUS_WARN)
>         cxl_mem_get_records_log(mds, CXL_EVENT_TYPE_WARN);
>     if (status & CXLDEV_EVENT_STATUS_INFO)
>         cxl_mem_get_records_log(mds, CXL_EVENT_TYPE_INFO);
>     ...
> }
> 
> Will this fail to clear the DCD event from the device? If the event is never
> cleared, will the hardware register retain the bit and cause the while (status)
> loop to spin infinitely on the exact same status bit, potentially causing a CPU
> soft lockup?
> 
> >  		cond_resched();
> >  	} while (status);
> 
> [ ... ]
> 
> [Severity: High]
> This is a pre-existing issue, but I noticed a potential out-of-bounds read when
> fetching event logs:
> 
> drivers/cxl/core/mbox.c:cxl_mem_get_records_log() {
>     ...
>     nr_rec = le16_to_cpu(payload->record_count);
>     if (!nr_rec)
>         break;
> 
>     for (i = 0; i < nr_rec; i++)
>         __cxl_event_trace_record(cxlmd, type,
>                                  &payload->records[i]);
>     ...
> }
> 
> Does this code validate the hardware-provided nr_rec against the allocated
> payload size? If an untrusted or compromised device returns an artificially
> large count, could this read out of bounds?
> 
> Similarly, when clearing those records:
> 
> drivers/cxl/core/mbox.c:cxl_clear_event_record() {
>     ...
>     for (cnt = 0; cnt < total; cnt++) {
>         struct cxl_event_record_raw *raw = &get_pl->records[cnt];
>         struct cxl_event_generic *gen = &raw->event.generic;
> 
>         payload->handles[i++] = gen->hdr.handle;
>     ...
> }
> 
> Could this write the out-of-bounds memory values into the clear event payload
> sent back to the device, leading to an information leak?
> 
> [Severity: High]
> This is also a pre-existing issue, but a similar pattern exists in the poison
> log handling:
> 
> drivers/cxl/core/mbox.c:cxl_mem_get_poison() {
>     ...
>     for (int i = 0; i < le16_to_cpu(po->count); i++)
>         trace_cxl_poison(cxlmd, cxlr, &po->record[i],
>                          po->flags, po->overflow_ts,
>                          CXL_POISON_TRACE_LIST);
>     ...
> }
> 
> Does this validate po->count against the buffer size, or could it result
> in an out-of-bounds read if the device returns a large count?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260731084901.1512819-1-anisa.su@samsung.com?part=6
