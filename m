Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7D043304D
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 21:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789160987; cv=none; b=A3ufNq9RS7s+PN/8sn6Qz3Q5JUgOUy51GAstIUf2Bi+5WXiKsyR+GDKaeB+r7DhTc3yp/hR8oInyBxxOXzmNhYtvkpctP07Z+0pcOlPrGXbnvR6Aj9hG4QP28CAUh9ZBkry6wD/KwtqjQQrVlb4HSr7ZIvdklwo5gJPMAEC9ZEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789160987; c=relaxed/simple;
	bh=eB4CBPrFTEd8vrWk3XvtPspRZVWOG+R1TCjX59sRmdU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rs58a4+dVGiHhC880n1GHb+rmvYgfUFI/W6pjcOYoGy2UZRW7E/4mqWURWrC5VhMVmQHPaEtGZCGcsNzennDmR6mlNzLQd3wBGAdhR0JWX64lbl3Dwi1jev+F6Rt6m9N4hm5oEfwaH6zKyEpkt56AE8HRMzH0/6huUTOHm8RyUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MnRKsXX2; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MnRKsXX2"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8abdfso7962a12.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 14:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789160981; x=1789765781; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGMfoTpezrZDm/cqA3KkUYo7Tw7rc2tYb+GVefN1YGU=;
        b=MnRKsXX2xLTGx6MwsLn7+akQPU77FTnlCSr/5260wxBwRi/qQAZKTZG/gjQlfDA4Z8
         xM57nbuAEpMr8sywoit8gL0AeZj3CbY6FBH5sqqmFXyQp9RuN3FpbaoYReM0DbQhCdY7
         LXYzJ7p9dNDPDstq/UVDFijM2KMo4e9JDcBBE+9zY5CdfgkOjJwPu8qeetWMCP1ieWV9
         ffSfalZMqQBG6URzkz00bN8oHSOc23mC3kXm/v5ZKpNerf2R4THBSaIJEvl1RyWFrqth
         Fn5q1Gxqzl7EuZKQxEnPtB0Nq7B6KMldhvkaRl6ThCSFEx+P4ywKxjdnBC+M2M3dlgcw
         W2/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160981; x=1789765781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MGMfoTpezrZDm/cqA3KkUYo7Tw7rc2tYb+GVefN1YGU=;
        b=XymNQc1SUMxokzWwTPT3H1qxNxjFE9httUi4ltQPR317nGUWnE3k9JhhrLt6os3srU
         gHiexyLUdNHiCscCDz/4rweYoAzqJRNCAVf8KkGq6XLpMCvX2I/zfRcsjxwFtW8Xuw16
         G7DyFltRsybclRQZ/DjBJ4qWP9d8J4SYBdAFj1wiI/NTzMrByuVDxMw15u7pSA9dn8xB
         eh9iHEe3yH6KsbWGf0o9kZctTGaa5LLwJAK0XDTJriFz7ppw+JOSk9IIypsS1MLeMzKh
         YRECejQXNlNkABtkQuTHqOQC0ab5Lb+RM8ZOB3h8Fm4L+W8/G3sRaTrfaDaMDd0W+Dcc
         dQmA==
X-Gm-Message-State: AFuF++mulr7fs3mW0bAwbPVeztXwXSf8MlXgdosLevC+rz2eHmqRYwCJ
	r+2pYakkOGKvDSZ76GoiAcApZCK5Se81gdDBhkNg7RcqayANHDJyhvxupXP36wUv
X-Gm-Gg: AYBFou1L1frk6eQ+C+xxRO8ZHme3LkKqGGkLBbTIhlxXxisgWoC1tBEcCzb/ldy7SPo
	9wzSJgiUzjZnRefspqJOjykBnx8IUDaS3Ulbx7cWHgCtc0rJHw4WEgZ6o4ycaq9O2O3lS46y2fH
	43BNcZw/5wHNaeVwc7i4x57tDsaQ3pmav8sC37EJLD88uLtgkudtygwlgr7UD6cqBv/J55h7YcQ
	/eSQ5jNIp7v9gL6shADByk7Aqrk1S4o05shtjlKCcOEWBcMWCkJeWX/TpgoaCss4IktKIKl7TBt
	JB5/p9Z53OF89uuFrtpCj7MfglY4NYnXM4OA9ZJ7hdVY989MpQmzB+TiaDj+u591k6ELB/MXT20
	CBy6XptM7+2EpIFCsqHcHdOzHPjIoGpfRKJhiu/STuUZnZlFELDgQpBRlrTBHVSDnOMQrB/iDBn
	xb0IIN2wZyt3Gxu2SWxnmUVqMzUtzoprHnhKok+eZ3kFvhBHvQvLdLJmjE40Iu892DQXuY60ZU+
	GuSbBLB5uPXiFD3FwrW90Y4dYiFi27MjZM/
X-Received: by 2002:a17:90b:2d88:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-39dbc0c2aeemr114833a91.7.1789160981260;
        Fri, 11 Sep 2026 14:09:41 -0700 (PDT)
Received: from cxlqual ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d95095946sm6817101a91.5.2026.09.11.14.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:09:40 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
Date: Sat, 12 Sep 2026 06:10:57 +0900
To: sashiko-reviews@lists.linux.dev
Cc: Anisa Su <anisa.su887@gmail.com>, linux-cxl@vger.kernel.org
Subject: Re: [RESEND PATCH v13 6/8] cxl/mem: Configure dynamic capacity
 interrupts
Message-ID: <aqRuYaUt9qAvPA3W@cxlqual>
References: <20260908102124.2231730-2-anisa.su@samsung.com>
 <20260908102124.2231730-8-anisa.su@samsung.com>
 <20260908104327.DF5E61F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908104327.DF5E61F00A3A@smtp.kernel.org>

On Tue, Sep 08, 2026 at 10:43:27AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] If a CXL device is surprise-removed or a fatal PCIe error occurs, `cxl_event_thread` enters an infinite loop, pegging the CPU at 100% and deadlocking device removal.
> --
Surpise removal is unsupported. Jonathan mentioned the same on a similar
thread: 
https://lore.kernel.org/linux-cxl/aqLZP3ORYzCLfSgR@acer-nitro-anv15-41/T/#m8e12567a42b07fae8aa307406e6e017fe24ad832
> 
> commit f11145933c61ad9c3ba90b62e3f38dc571f856c5
> Author: Ira Weiny <iweiny@kernel.org>
> 
> cxl/mem: Configure dynamic capacity interrupts
> 
> This commit configures Dynamic Capacity Device (DCD) event log interrupts
> on devices supporting dynamic capacity. It disables DCD if interrupts are
> not supported, and carefully preserves firmware-first interrupt policies
> if selected by the BIOS.
> 
> > diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
> > index 7b754af2168d0..1ea505b1f40e8 100644
> > --- a/drivers/cxl/pci.c
> > +++ b/drivers/cxl/pci.c
> [ ... ]
> > @@ -523,8 +535,8 @@ static irqreturn_t cxl_event_thread(int irq, void *id)
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
> >  		cond_resched();
> >  	} while (status);
> 
> [Severity: High]
> This is a pre-existing issue, but does this loop lack a check for PCIe
> surprise removal where MMIO reads return all 1s (~0)?
> 
> If a CXL device is surprise-removed or a fatal PCIe error occurs, readl()
> will return 0xFFFFFFFF. When this is bitwise ANDed with mask, it leaves a
> non-zero value, causing the loop to continue. 
> 
> Since cxl_mem_get_event_records() will also read ~0 (e.g., when checking
> cxl_doorbell_busy()) and return immediately without changing hardware
> state, won't this loop spin indefinitely, pegging the CPU at 100% and
> deadlocking device removal when free_irq() waits for this thread to exit?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908102124.2231730-2-anisa.su@samsung.com?part=6
