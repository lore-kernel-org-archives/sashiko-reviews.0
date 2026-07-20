Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0223C2BAF
	for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 07:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784532812; cv=none; b=fjpwd2APeL3CPlmsPRLxCiM+TAKzO2jTlWIP0PLxL/f7toby/SXjudQBPCvk7bZn/ECIvSR78U4/0Fsi7k4Bz9wgigLOZat37EBXSRF2u911SyZpQKkeQE/4Dhb957JzkYSBxHjuGRmkr49aOisqlGavJY7UHWiuUHnS9aOuyKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784532812; c=relaxed/simple;
	bh=EtFr7SpaBZPqMsLgiZiW+YfjFccwIhevLWBpka1ep4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RMxaJZtSELLt8jLS28EM/mE1xQ7iE3l81ff0yjP3+K3tsm+ftmIjCzaHS5e+vImZHU59N21Z4GuTDok8aKcrb/yUfFYLqjiDUvCIX45z9n+en/Bfu1OQnEh3lhZoC1Zy9oBJ6CP9bjFbDk7M3pM1Y2HAXvx9dVsGFEtyQJDBOis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GtRvascR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GtRvascR"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f71156e1aso487538f8f.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 20 Jul 2026 00:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784532805; x=1785137605; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9dlR1VSEOP+P+zQGfaFMhFwH/x1vDY3bfx6C3cbYWvs=;
        b=GtRvascRAJVDP/sggulm45cTzob97sCHSzAxUL4DssajD0RZaF5oEGWU4wm5HWU+qj
         5mIN4jX1C+tDtRIU8KoEEQmyNl+uhosjVz5XM0jhU9Y13n601EmPalqKo0rBp6PX4z78
         3YcuAlmrK5LdwY5cz6+UiXsM2JP64NjSbrcPXGlCayLmXNmrV58SePAs0ft6Sal95eOx
         /WK/X+bYplEY5dpMccWCgEjYe2trdeLWuNqAzRiJuO4BR4dpc2GhlYN7XgsjZKN5usZV
         ZHzcsghPO246dn8y+sp3OBHBKn4sbQvbwW3hzfGuER7XlYxDJglyecfYw84Ky6VQ4BMU
         Xzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784532805; x=1785137605;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dlR1VSEOP+P+zQGfaFMhFwH/x1vDY3bfx6C3cbYWvs=;
        b=Pxls9VP+JyNBjJwAqcR1AcqB/BhfNc2b6mSLkU6ijMlC4ngGPMrmrRzGBt0FNYTVhX
         oQC2HmY4NsQl4DlcozlbQiz7orv3ws2s+i1n9x67yAfJxn5i1GcJHc4hO/UQcZWXLSD4
         e3qDi7KZilAnTmxcQKdYGNehRXvl1bn3OgV23f13RYKTHxlmOVpZtQ2TPPriFm8S8UxU
         G5O/MNVl2p7Mzt2MZjrpvYecNPZOS5kNaFzNAICNe9q6OCF+BtQ79lpeW8Wwu6VT5MjX
         kD83mhTSuglSuWFMbTThspHjdEv7PqRYaqrjxPwRiUnn+cEwlaFuUFPTYY5t4/ZcN8SW
         n8kw==
X-Forwarded-Encrypted: i=1; AHgh+Rozmk7MI0iyDxbDZapYWxPuWS1MTfn335YBmQJIe+XQK8hLr9O8yz1nej3JjSsq3uicG6GxbRDg7O6ZZ6e1IMY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzasoevuvQZkKGLguYCGtUuv1ZDcZ0z572SLFeQq5U7v3cxQ1Gl
	a+st61UFhS+EvSuw2UR5SH96k9zh6Rpf3oIIgmJEKukLMAfCa2qkeCWObsM9Ef70+/g=
X-Gm-Gg: AfdE7cmN4TUf8BM2fARCYPUYKveD518IQaS03Zh9xLfPGbAb6i+nRmUstNcGv85XrwX
	YuenNpT+fXi6Web9iXWSVyzX3HsGhjrW9bSa6I7g/pnbW/9VElPn32JlXD7D4OjRcgXWFbJJIoj
	uJUM4bC9b0pr5d1I83XtwFhrCXREPQSfoNhDctJq6SE4XyWdHlfTRo5Pon4a869JkZ0znPtB3kx
	wlrsRK80w+DunbZNkLJxwBMvH6wgKMJPzfMXP01tJlXLwDnY0ei7W3okUClxhtm8vGX94OvVmQj
	biUAp6vgNxX7W+9BIS/wRO7TJRhE2lfTnMDflxgjqxxtvplV6ydZBe5Aks/OW8jNnjed8ouKuRA
	l8aVdMGWkge1slRsNxM7VY90G6Qk+3SikGPvTjMnUHBLmH1u+9zzQyGTpw6ul3sUUZwXcp5re/p
	CrIW/X1MTWRR3bbg==
X-Received: by 2002:a05:6000:491c:b0:47f:73d3:bfc3 with SMTP id ffacd0b85a97d-47f73d3c0fcmr5580169f8f.61.1784532805224;
        Mon, 20 Jul 2026 00:33:25 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:b6d9:bb37:a20c:1c55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63edd7d3sm26586179f8f.25.2026.07.20.00.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:33:24 -0700 (PDT)
Date: Mon, 20 Jul 2026 09:33:13 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Udit Tiwari <quic_utiwari@quicinc.com>,
	Md Sadre Alam <mdalam@qti.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, brgl@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v22 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <al3POSAJKHkLYVgW@linaro.org>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
 <20260717-qcom-qce-cmd-descr-v22-6-ff0d18b27246@oss.qualcomm.com>
 <20260717085136.E0FBC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717085136.E0FBC1F000E9@smtp.kernel.org>

On Fri, Jul 17, 2026 at 08:51:36AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] DMA API violation due to mismatched device pointers in dma_map_sg and dma_unmap_sg.
> - [High] The client-provided physical address for the lock scratchpad is silently truncated to 24 bits.
> - [Medium] Transient allocation failure for lock descriptors causes a permanent channel stall.
> - [Medium] Pipe locking is restricted to TX channels instead of RX channels, contradicting intended design.
> - [Medium] The dummy lock descriptor clears the `reconfigure` flag using a hardcoded TX direction, potentially misconfiguring the channel.
> - [Low] Missing integer argument for `%d` in `dev_err_ratelimited` call.
> --
> 
> --- Patch [6]: [PATCH v22 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
> commit c786d3c51276cef4b55a461357b399c32982316b
> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Subject: dmaengine: qcom: bam_dma: add support for BAM locking
> 
> This commit adds support for BAM pipe locking by prepending and appending
> dummy command descriptors with LOCK and UNLOCK bits set. It aims to prevent
> writes into config registers while the engine is busy.
> 

Thanks for all the changes! It looks good to me for the most part, so
I'll just comment on the remaining Sashiko comments below.

> > Add support for BAM pipe locking. To that end: when starting DMA on an RX
> > channel - prepend the existing queue of issued descriptors with an
> 
> [Severity: Medium]
> Is this intended to be restricted to TX channels? The commit message mentions
> starting DMA on an RX channel, but the implementation in bam_setup_pipe_lock()
> aborts the lock setup if the direction is not DMA_MEM_TO_DEV.
> 

Is this a typo in your commit message? I guess RX vs TX depends on the
perspective (kernel or peripheral), but I think "TX channel" would be
clearer here (or even just put DMA_MEM_TO_DEV).

> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > index f3e713a5259c2..edaa694eb9df0 100644
> > --- a/drivers/dma/qcom/bam_dma.c
> > +++ b/drivers/dma/qcom/bam_dma.c
> 
> [ ... ]
> 
> > @@ -859,6 +887,15 @@ static int bam_resume(struct dma_chan *chan)
> >  	return 0;
> >  }
> >  
> > +static void bam_dma_free_lock_desc(struct virt_dma_desc *vd)
> > +{
> > +	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
> > +	struct dma_chan *chan = vd->tx.chan;
> > +
> > +	dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
> 
> [Severity: High]
> Will this cause a DMA API violation? 
> 
> The scatterlist is unmapped here using the client device (chan->slave), but it
> is mapped in bam_make_lock_desc() using the DMA controller device 
> (bchan->bdev->dev).
> 

Yep, we need to change all those DMA calls to bchan->bdev->dev.

> > +	kfree(async_desc);
> > +}
> 
> [ ... ]
> 
> > @@ -1046,13 +1090,101 @@ static void bam_apply_new_config(struct bam_chan *bchan,
> >  	bchan->reconfigure = 0;
> >  }
> >  
> > +static struct bam_async_desc *
> > +bam_make_lock_desc(struct bam_chan *bchan, unsigned long flag)
> > +{
> > +	struct bam_async_desc *async_desc;
> 
> [ ... ]
> 
> > +	bam_prep_ce_le32(&async_desc->lock_ce, bchan->lock_scratchpad_addr, BAM_WRITE_COMMAND, 0);
> 
> [Severity: High]
> Can this truncate the physical address and cause memory corruption?
> 
> The client-provided lock_scratchpad_addr is a 64-bit phys_addr_t, but
> bam_prep_ce_le32() masks the address to 24 bits:
> 
> bam_ce->cmd_and_addr = cpu_to_le32((addr & 0xffffff) | ((cmd & 0xff) << 24));
> 
> If the physical address is above 16MB, the BAM engine will perform its dummy
> write to an arbitrary truncated address.
> 

This looks correct as well. It seems the address in a BAM command
descriptor is more like a "address within the peripheral" than an actual
physical address, so the same applies to the lock_scratchpad_addr. Can
you clarify this inside the struct bam_config documentation comment?

This also means there is no point to accept a phys_addr_t in
lock_scratchpad_addr, u32 is sufficient.

> > +	sg_set_buf(&async_desc->lock_sg, &async_desc->lock_ce, sizeof(async_desc->lock_ce));
> > +
> > +	mapped = dma_map_sg(bchan->bdev->dev, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
> 
> [ ... ]
> 
> > +static int bam_setup_pipe_lock(struct bam_chan *bchan)
> > +{
> > +	const struct bam_device_data *bdata = bchan->bdev->dev_data;
> > +	struct bam_async_desc *lock_desc, *unlock_desc;
> > +
> > +	lockdep_assert_held(&bchan->vc.lock);
> > +
> > +	if (!bdata->pipe_lock_supported || !bchan->lock_scratchpad_addr ||
> > +	    bchan->direction != DMA_MEM_TO_DEV)
> > +		return 0;
> 
> [Severity: Medium]
> Does this restriction conflict with the commit message? 
> 
> The condition limits pipe locking to DMA_MEM_TO_DEV (TX), making this feature
> dead code for RX channels (DMA_DEV_TO_MEM).
> 

Clarifying the commit message should fix this comment as well.

> > +
> > +	/*
> 
> [ ... ]
> 
> > @@ -1072,6 +1205,22 @@ static void bam_start_dma(struct bam_chan *bchan)
> >  		return;
> >  
> >  	while (vd && !IS_BUSY(bchan)) {
> > +		/*
> > +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> > +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> > +		 * already have bam_locked set and must not trigger a second pair.
> > +		 */
> > +		if (!bchan->bam_locked) {
> > +			ret = bam_setup_pipe_lock(bchan);
> > +			if (ret) {
> > +				dev_err_ratelimited(bdev->dev,
> > +					"failed to setup the pipe lock, deferring transfer: %d\n");
> 
> [Severity: Low]
> Is this missing the integer argument for the %d format specifier?
> 

Yep.

> [Severity: Medium]
> Will this cause a permanent channel stall on memory pressure? 
> 
> If bam_setup_pipe_lock() fails due to a GFP_NOWAIT allocation failure, the
> loop breaks and leaves the descriptors on the desc_issued list, but no
> mechanism appears to schedule a retry.
> 
> > +				break;

Could be true, if we break out of the loop here, where will this
deferral happen? Will anything call bam_start_dma() again?

Perhaps we should have queue_work() here?

> > +			}
> > +			if (bchan->bam_locked)
> > +				vd = vchan_next_desc(&bchan->vc);
> > +		}
> > +
> >  		list_del(&vd->node);
> >  
> >  		async_desc = container_of(vd, struct bam_async_desc, vd);
> 
> [ ... ]
> 
> >  		/* on first use, initialize the channel hardware */
> >  		if (!bchan->initialized)
> >  			bam_chan_init_hw(bchan, async_desc->dir);
> >  
> >  		/* apply new slave config changes, if necessary */
> >  		if (bchan->reconfigure)
> >  			bam_apply_new_config(bchan, async_desc->dir);
> 
> [Severity: Medium]
> Could the dummy lock descriptor clear the reconfigure flag with the wrong
> direction?
> 
> The lock descriptor is created with async_desc->dir hardcoded to
> DMA_MEM_TO_DEV. If pipeline locking is ever enabled for RX channels,
> bam_apply_new_config() will configure the BAM engine using dst_maxburst
> instead of src_maxburst, and clear the bchan->reconfigure flag before the
> real data descriptor is processed.
> 

Err, what? I think we can ignore this one, since I don't think there is
a use case for locking on the RX channel.

Although, looking a bit more at your changes, I think you should make
sure the direction is correct already in bam_slave_config():

+	/*
+	 * This is required to setup the pipe locking and must be done even
+	 * before the first call to bam_start_dma().
+	 */
+	if (bdata->pipe_lock_supported && peripheral_cfg) {
+		bchan->lock_scratchpad_addr = peripheral_cfg->lock_scratchpad_addr;
+		bchan->direction = cfg->direction;
+	}
+

I don't think there is much point to store the direction at all if we
just support DMA_MEM_TO_DEV in bam_setup_pipe_lock(). I would just check
the direction inside this if statement and return -EINVAL if some user
tries to setup pipe locking on a TX channel. Then you don't need to
store bchan->direction at all.

> >  
> 
> [ ... ]
> 
> > @@ -1191,8 +1344,11 @@ static void bam_issue_pending(struct dma_chan *chan)
> >   */
> >  static void bam_dma_free_desc(struct virt_dma_desc *vd)
> >  {
> > -	struct bam_async_desc *async_desc = container_of(vd,
> > -			struct bam_async_desc, vd);
> > +	struct bam_async_desc *async_desc = container_of(vd, struct bam_async_desc, vd);
> > +	struct dma_chan *chan = vd->tx.chan;
> > +
> > +	if (async_desc->is_lock_desc)
> > +		dma_unmap_sg(chan->slave, &async_desc->lock_sg, 1, DMA_TO_DEVICE);
> 
> [Severity: High]
> Does this share the same DMA API violation mentioned earlier? 
> 
> The abort/cleanup path also unmaps using the client device instead of the
> DMA controller device.
> 

Same thing here as above, yeah. Should be bchan->bdev->dev.

Thanks,
Stephan
