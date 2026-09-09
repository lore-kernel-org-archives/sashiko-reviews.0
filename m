Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3D057ED98;
	Wed,  9 Sep 2026 16:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788970850; cv=none; b=lG7rzwwEA94YmslYWujSEJ5iG1YKTv4u6zW4DaeEl77iCdt+M/I+G5ogI51yIOAmscuzx4fWmbxfCIprQbs+BvXcQgOtOeEHDOZtAQ9iJv8XC73pLWJhMV7/evJOVjV18bNhP+PRc2My5MNJwvWEqonQ30PJg3JTL+norhuImWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788970850; c=relaxed/simple;
	bh=A4lXcmHuLyBO3ZloXy4NlfPdbB2CaT/5zvM3EPfYXvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAM5t6HaMqEBquK3s4ULekMPGXARJLPJdrnbUVDGhwe9Z0iTERIa0G2KEo24r4PPwC1mA15dPe1eqDLI847LiZhdv05u1cjyeWNg8OqPUecG4kVqGKUOU/ZJz8mPamdfOwOAqaqa6N8kiYa+QToysnue8+q/DdOKpevRAtX5Dqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxyTUe67; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxyTUe67"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F1A1F000FF;
	Wed,  9 Sep 2026 16:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788970848;
	bh=leIrVQVXW+QhJ3hOd6m/tDP8maIK1bWAszwnTM8GUA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hxyTUe670bHi3JnViXht5R59hqNiodnNbF481OnFkSi6Jm0Jultxl+tVZQi4VkbPg
	 qx1cVKnLLrnLBSuI0/7ItoZg5S5KVQ0Mh1PsMTNPROU/kTAzeN9apGbVfwkPrmzDsP
	 oByuT7rn4OwEU9V8IDaPRn9ombJIoz0sqD6iTcx/SsI9VAN6ZlV3wlx9feifQGCbRO
	 693JK4HdlI0+6FdXagMzK01SfGS86BZr40i0FvR6GXi8emc4HFAKMHTDooWNXSmx4M
	 DYmDhdtD1AvXRyinokx5N/NclZlHkqJS2PRvWyUS35ygdsX7QZ1euvyqtJowGZmSGL
	 zwTT6FLylKdyw==
Date: Wed, 9 Sep 2026 17:20:45 +0100
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Qunqin Zhao <zhaoqunqin@163.com>, mfd@lists.linux.dev
Subject: Re: [PATCH v6 2/2] mfd: loongson-se: Fix miscellaneous issues
Message-ID: <20260909162045.GI2133376@google.com>
References: <20260907023827.14905-1-zhaoqunqin@163.com>
 <20260907023827.14905-3-zhaoqunqin@163.com>
 <20260907025000.577791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260907025000.577791F00A3A@smtp.kernel.org>

On Mon, 07 Sep 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> 
> New issues:
> - [High] Read-modify-write operations on the SE_S2LINT_EN register are inconsistently protected by two different spinlocks, causing a data race and lost interrupt masks.
> - [High] The loongson_se_stop cleanup handler uses an interruptible wait, allowing pending signals to bypass hardware teardown and cause DMA use-after-free.
> - [High] Re-initializing an actively monitored completion structure dynamically in `loongson_se_init_engine` causes a race condition with active IRQ handlers.

Please review, explain or fix the Sashiko review(s).

If this is a set, this request includes the other patches too.

> Pre-existing issues:
> - [High] The exported API `loongson_se_init_engine()` lacks bounds validation on the caller-provided `id`, allowing array overruns and DMA buffer overlaps.
> - [Medium] The parent driver exposes bespoke accessors and driver-level callbacks to child drivers, directly violating MFD subsystem guidelines.
> - [Medium] Driver-specific header file is inappropriately placed in the global include/linux/mfd/ directory.
> --
> 
> commit d7b07e09007f31031f54d602ea81c002547a5aa5
> Author: Qunqin Zhao <zhaoqunqin@loongson.cn>
> mfd: loongson-se: Fix miscellaneous issues
> 
> This patch addresses several issues discovered in the Loongson Security
> Engine driver, including adding bounds checks, serializing command
> submissions, handling EPROBE_DEFER, and setting up an explicit stop
> cleanup handler.
> 
> Link: https://lore.kernel.org/all/20260618095949.GB1672911@google.com/ [1]
> 
> > diff --git a/drivers/mfd/loongson-se.c b/drivers/mfd/loongson-se.c
> > index 7f552a8ee6a26..1d332c418bea7 100644
> > --- a/drivers/mfd/loongson-se.c
> > +++ b/drivers/mfd/loongson-se.c
> [ ... ]
> > @@ -42,7 +44,7 @@ static int loongson_se_poll(struct loongson_se *se, u32 int_bit)
> [ ... ]
> > -	spin_unlock_irq(&se->dev_lock);
> > +	/*
> > +	 * Re-enable the interrupt that loongson_se_reinit_completion() masked.
> > +	 * The hardware guarantees that once the interrupt is re-enabled, only
> > +	 * interrupts for the command just issued can arrive, so a stale
> > +	 * interrupt from a previously interrupted command can never complete
> > +	 * this command's completion.
> > +	 */
> > +	writel(int_bit | readl(se->base + SE_S2LINT_EN), se->base + SE_S2LINT_EN);
> > +
> > +	spin_unlock(&se->poll_lock);
> 
> [Severity: High]
> Does this introduce a data race on the SE_S2LINT_EN register?
> This modifies the register under poll_lock, while the new
> loongson_se_reinit_completion() function modifies the exact same register
> under dev_lock. If two child drivers submit commands concurrently to
> different engines, their read-modify-write cycles could interleave,
> causing one thread to overwrite and erase the interrupt mask modifications
> made by the other. This could lead to permanently stalled commands.
> 
> [ ... ]
> > @@ -75,12 +108,16 @@ static int loongson_se_send_controller_cmd(struct loongson_se *se,
> >  
> >  int loongson_se_send_engine_cmd(struct loongson_se_engine *engine)
> >  {
> 
> [Severity: Medium]
> This is a pre-existing issue, but does exporting this driver-level
> callback directly violate MFD subsystem guidelines forbidding tight functional
> coupling? The guidelines state sibling or child drivers should not make
> direct function calls to each other bypassing standard kernel APIs.
> 
> > +	int err;
> > +
> > +	loongson_se_reinit_completion(engine->se, &engine->completion, BIT(engine->id));
> [ ... ]
> > @@ -93,7 +130,7 @@ struct loongson_se_engine *loongson_se_init_engine(struct device *dev, int id)
> >  {
> >  	struct loongson_se *se = dev_get_drvdata(dev);
> 
> [Severity: Medium]
> This is also a pre-existing issue, but does exporting this custom parent-child
> accessor violate the MFD subsystem guidelines? The guidelines state
> that bespoke accessors or helper functions should not be written in the parent
> to pass state to child devices.
> 
> >  	struct loongson_se_engine *engine = &se->engines[id];
> 
> [Severity: High]
> This is a pre-existing issue, but is it safe to use the unvalidated id
> argument directly as an array index? If a caller passes an id greater
> than or equal to SE_ENGINE_MAX, it would cause an out-of-bounds memory
> access. Also, if id is 0, the assigned data buffer would completely overlap
> with the command streams of all other engines.
> 
> > -	struct loongson_se_controller_cmd cmd;
> > +	struct loongson_se_controller_cmd cmd = {0};
> [ ... ]
> > @@ -188,6 +226,17 @@ static const struct mfd_cell engines[] = {
> >  	{ .name = "tpm_loongson" },
> >  };
> >  
> > +static void loongson_se_stop(void *data)
> > +{
> > +	struct loongson_se *se = data;
> > +	struct loongson_se_controller_cmd cmd = {0};
> > +
> > +	cmd.command_id = SE_CMD_STOP;
> > +	loongson_se_send_controller_cmd(se, &cmd);
> 
> [Severity: High]
> Could this cleanup handler fail to stop the controller if a signal is pending?
> loongson_se_send_controller_cmd() waits for completion using an
> interruptible wait. If a signal is pending (like the user hitting Ctrl-C
> during probe failure or module unload), the wait instantly returns without
> waiting for the hardware. Because loongson_se_stop() ignores this abort,
> the devres core would immediately free the coherent DMA memory while the
> hardware is potentially still active, causing a use-after-free.
> 
> > +
> > +	writel(0, se->base + SE_S2LINT_EN);
> > +}
> [ ... ]
> > @@ -195,19 +244,34 @@ static int loongson_se_probe(struct platform_device *pdev)
> >  	int nr_irq, irq, err, i;
> >  	dma_addr_t paddr;
> >  
> > -	se = devm_kmalloc(dev, sizeof(*se), GFP_KERNEL);
> > +	se = devm_kzalloc(dev, sizeof(*se), GFP_KERNEL);
> >  	if (!se)
> >  		return -ENOMEM;
> >  
> >  	dev_set_drvdata(dev, se);
> >  	init_completion(&se->cmd_completion);
> >  	spin_lock_init(&se->dev_lock);
> > +	spin_lock_init(&se->poll_lock);
> >  	mutex_init(&se->engine_init_lock);
> >  
> > +	for (i = 0; i < SE_ENGINE_MAX; i++)
> > +		init_completion(&se->engines[i].completion);
> > +
> 
> [Severity: High]
> Could this duplicate initialization conflict with the existing
> init_completion() call inside loongson_se_init_engine()? Since hardware
> interrupts are fully unmasked later in probe(), a spurious interrupt could
> arrive concurrently while child drivers probe and call
> loongson_se_init_engine(). If the IRQ handler calls complete() exactly
> when the dynamic init_completion() resets the internal wait queue lock,
> it could corrupt the spinlock and cause a kernel panic.
> 
> [ ... ]
> > diff --git a/include/linux/mfd/loongson-se.h b/include/linux/mfd/loongson-se.h
> > index 07afa0c2524d5..8237ccab7bf1e 100644
> > --- a/include/linux/mfd/loongson-se.h
> > +++ b/include/linux/mfd/loongson-se.h
> > @@ -9,6 +9,7 @@
> >  #define SE_SEND_CMD_REG_LEN		0x8
> 
> [Severity: Medium]
> This is a pre-existing issue, but does placing this driver-specific header
> file in the global include/linux/mfd/ directory violate MFD guidelines?
> The guidelines state that header files only used by the parent and its
> immediate children should be kept local to drivers/mfd/ to avoid global
> namespace pollution.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260907023827.14905-1-zhaoqunqin@163.com?part=2

-- 
Lee Jones
