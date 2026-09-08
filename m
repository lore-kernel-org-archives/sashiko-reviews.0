Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F23C53D0C8
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 12:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871282; cv=none; b=lTke/XhYzUAE3TYNQD7kIMYIKBtHpLx0STdFVPmSCl1DzJ9oXwoTYnL8gskQzfsIZ32+qBtqq/IXfLdVY6vRJ890UyaJQERlQCRqRf71+SMh5GHlVyPuOPKPXkY5q9KrGO7qFEuOwDZtcoRJLEJcippqUurZ5ct27s65gguLhTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871282; c=relaxed/simple;
	bh=MmEOV1xIiHnzKeGT+JEiz8mPpX6GepmA3Xk1/pQf0/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJQyjxAiaj1lO9JamiC2KW7Dy/kenfkWZIjCgy+tfUMQI5LPKoLTh63L//FSCEWcgYBDMfgxaczvun8gMRv0G+iyiRhwaqJzy2atA9TWC5OE7imJ1AUBUtaaELTX+zx96/W6Vv82Anp5xEzvwNSXh3XJaEQm0yQKb/Had92DZ6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2646F1F00A3A;
	Tue,  8 Sep 2026 12:41:21 +0000 (UTC)
Date: Tue, 8 Sep 2026 07:41:19 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 01/19] accel: ethosu: Suspend after initialization
Message-ID: <20260908124119.GA2692068-robh@kernel.org>
References: <20260904-ethosu-fixes-v2-0-3767738756a4@kernel.org>
 <20260904-ethosu-fixes-v2-1-3767738756a4@kernel.org>
 <20260905005735.3AB221F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905005735.3AB221F00A3D@smtp.kernel.org>

On Sat, Sep 05, 2026 at 12:57:34AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] IRQ handler accesses hardware registers while device may be suspended.
> --
> 
> commit db83f58315d24bc892c6b008ce7d120f57ecaff1
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> accel: ethosu: Suspend after initialization
> 
> The initial runtime-PM reference is held only while initializing the NPU.
> Release it synchronously from ethosu_init() after the final hardware
> access, before registering the DRM device.
> 
> > diff --git a/drivers/accel/ethosu/ethosu_drv.c b/drivers/accel/ethosu/ethosu_drv.c
> > index 8108622de258f..df76253d01a64 100644
> > --- a/drivers/accel/ethosu/ethosu_drv.c
> > +++ b/drivers/accel/ethosu/ethosu_drv.c
> > @@ -338,6 +338,8 @@ static int ethosu_init(struct ethosu_device *ethosudev)
> >  		 ethosudev->npu_info.sram_size / 1024,
> >  		 ethosudev->npu_info.pmu_counters);
> >  
> > +	pm_runtime_put_sync_suspend(ethosudev->base.dev);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does putting the device into
> an immediate synchronous suspend here expose a vulnerability in the interrupt
> handler?
> 
> Looking at ethosu_job_irq_handler() in drivers/accel/ethosu/ethosu_job.c:
> 
> static irqreturn_t ethosu_job_irq_handler(int irq, void *data)
> {
> 	struct ethosu_device *dev = data;
> 	u32 status = readl_relaxed(dev->regs + NPU_REG_STATUS);
> 	...
> }
> 
> The hardirq handler accesses hardware registers unconditionally without
> verifying the device's PM state.
> 
> If a spurious interrupt occurs while the device is in the RPM_SUSPENDED
> state (where clocks are disabled via ethosu_device_suspend()), could
> reading NPU_REG_STATUS cause a Synchronous External Abort?
> 
> The PM subsystem guidelines mandate using pm_runtime_get_if_active() in
> IRQ handlers to prevent accessing powered-off hardware registers.

Not an issue.

The h/w will only generate an interrupt if a job has been submitted in 
which case we are not suspended.

Rob
