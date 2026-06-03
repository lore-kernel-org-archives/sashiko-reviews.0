Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5202874F5
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 07:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780470509; cv=none; b=iwomBdc3mnbpIcVS3mHt0SdPqUD8Fhw9xJ9EvBkQDUWxj3o8lb3w/Sho1DO4Ta/pqRyxrqdetKH2d+mAeVq3qRqkxiTrWB9vKiwv83NWW1FHjkp5QhZeWnsZ4sTIKcOt/dzYKQ7So01JD4gSRRcFp+sWCDrXfo/RyN6+2Xb1sD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780470509; c=relaxed/simple;
	bh=Kbrvj/D4m44n+fVnPZMGjLwLQAVkrjvj4DoZ39oGgMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IAp6v6f1e/TWzvP/0ufZf7B2QxNT2imCba4zyUZTo7mU+ODokHGytZ36T8u+cm9brfYmY2H6MpGhIzDapcui6uCbI2cgkarbi8AqrGQcxvjiXN1T9ypjKyS3APbm0EoVJIK7/7FFxpjOE3lSjrXcC5BLjGUwL3c/sywhtRtA/lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=qiHtvPi6; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="qiHtvPi6"
Received: by linux.microsoft.com (Postfix, from userid 1134)
	id 5485F20B7167; Wed,  3 Jun 2026 00:08:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5485F20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1780470493;
	bh=pMpoimDnxQqeddLZUN8/Gi26Uji4c+dX4bVmvuEn19Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qiHtvPi6/hm6XEOztYMr71u+tyvLIXOq0BetZVa8IURExK5Z9jY6GqcLQssan8dUG
	 FNwfofXUpXD62nvBHSiKj9NvKJNQKl7TLL3HUvkZhe6VHtY5DQTadgY9PoaBXjgikW
	 jrYSjnIAiPC9vETQ0FLJ8u8Ed+IVn5AumPH88qxc=
Date: Wed, 3 Jun 2026 00:08:13 -0700
From: Shradha Gupta <shradhagupta@linux.microsoft.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org
Subject: Re: [PATCH net v3] net: mana: Optimize irq affinity for low vcpu
 configs
Message-ID: <ah/S3W386bLstSZf@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260601102749.1768304-1-shradhagupta@linux.microsoft.com>
 <20260602102811.A83AD1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260602102811.A83AD1F00893@smtp.kernel.org>

On Tue, Jun 02, 2026 at 10:28:11AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Missing error check for xa_store() leads to resource leak and potential kernel oops on allocation failure.
> --
> 
> commit 853688f50dc4ca56dd74698a3ecfdfeaf857e716
> Author: Shradha Gupta <shradhagupta@linux.microsoft.com>
> 
> net: mana: Optimize irq affinity for low vcpu configs
> 
> This patch optimizes irq affinity in the mana driver for low vCPU
> environments. When the number of allocated irqs is greater than the vCPU
> count, it ensures that queue irqs are spread across all available vCPUs
> to prevent softirq handling imbalances.
> 
> > diff --git a/drivers/net/ethernet/microsoft/mana/gdma_main.c b/drivers/net/ethernet/microsoft/mana/gdma_main.c
> > --- a/drivers/net/ethernet/microsoft/mana/gdma_main.c
> > +++ b/drivers/net/ethernet/microsoft/mana/gdma_main.c
> [ ... ]
> > @@ -1767,13 +1784,42 @@ static int mana_gd_setup_dyn_irqs(struct pci_dev *pdev, int nvec)
> >  	 * first CPU sibling group since they are already affinitized to HWC IRQ
> >  	 */
> >  	cpus_read_lock();
> > -	if (gc->num_msix_usable <= num_online_cpus())
> > -		skip_first_cpu = true;
> > +	if (gc->num_msix_usable <= num_online_cpus()) {
> > +		err = irq_setup(irqs, nvec, gc->numa_node, true);
> > +		if (err) {
> > +			cpus_read_unlock();
> > +			goto free_irq;
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but looking at the error handling
> path for goto free_irq, is there a potential resource leak if xa_store()
> fails earlier in the function?
> 
> When setting up the irqs in mana_gd_setup_dyn_irqs(), we call xa_store()
> with GFP_KERNEL:
> 
>     xa_store(&gc->irq_contexts, i, gic, GFP_KERNEL);
> 
> However, the return value is not checked. If this allocation fails, the gic
> pointer is not saved. If a subsequent operation like irq_setup() fails and
> we jump to the free_irq label, the cleanup loop attempts to retrieve it:
> 
>     gic = xa_load(&gc->irq_contexts, i);
>     if (WARN_ON(!gic))
>         continue;
> 
> Because the store failed, xa_load() will return NULL, causing the loop
> to continue without calling free_irq() or kfree(gic). Could this result
> in an un-freed irq handler that might trigger a panic later if the
> module is unloaded and the hardware raises an interrupt?
> 
> > +		}
> > +	} else {
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260601102749.1768304-1-shradhagupta@linux.microsoft.com?part=1

Since this isn't a bug introduced by this patch, I will fix it in a
seperate patch. Will submit the fix for this bug by next week.

Thanks,
Shradha.
