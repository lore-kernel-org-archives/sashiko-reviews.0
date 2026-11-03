Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696382;
	b=GNQeOIQikN7VG2jgKSr+Y3XKeUwKzXSCkTEyq5CUZSQ3AUbbOB6xjovQH1olzHZzTQQA
	 jN7LWRYag+tyv8vPcwAdj6hNLI1Rgjz76VOZ9JE8UarL0HBVaCnygSCEb6+Z91A2XKiCW
	 NYt9IK2v+R91xzQf86Hpd2DT0CMVBJxWr13rPYoymlGKN1hCtQlnySTcPrzFlRbjyJBiU
	 ECkr7RfUiZnxttRJtOhMV8ZK62PbmipJihykTgwvmYmSJplg5LHD9wn/81FPI9IjqStN9
	 /ScxKIHCz2Y9G6nWUbEsj70QLIuM+ym+IObvlb/776KuclNiKvogc0q5E1Hk8ZT3jZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696382;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=bMSZL4dh788kj1Ij3zhdAk/RFep5+LgNTfn0MJBEZW4=;
	b=3ZWdQJqh1s+QFsmvwa1o5cKd3yMU5qS6S3xRmn4U6nhptuLRGYLwvQSvQ7HLaZwvC+Du
	 jZVjXTCs9EE6fsFI2Uw2JBPmeusGFmL93HdVmRH6zr0pDxNFYKpmqe0UurGm6BDjMTLGJ
	 SVizXwrdJBQMMLc4E5JZltnyCrkfrBx5c1Z7wiay+b7R2fU4E7sjuNzrgexe7/6qXszj4
	 79spvjXtSpTQ9WHbLG+VRBccU/9J+u3HcTuDqRAxyOxBS4SZ7+GsGv139epZuCj/B1PD3
	 ygM3w8l+bXoZBx0RfOpr2djq//ghrhGT34Ltv//H7CbqX0wuO4JdZW0dCa8Na9Dl/Xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EKFRULxu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8096606A324;
	Tue,  3 Nov 2026 08:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EKFRULxu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 560A41F000C1;
	Tue,  3 Nov 2026 08:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793696381;
	bh=bMSZL4dh788kj1Ij3zhdAk/RFep5+LgNTfn0MJBEZW4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EKFRULxuEvrfwa5a1B5fBPNy9FTfqCZSjsz6vH2uMOV5fFUD2F9HsKeDSjWQvrGKh
	 GVSvUbd1fq+mF0DVRo3VkBXRER/QcMFPEpYOeA2sAbDtwkfP4x7wnnhE9duFcrB9Uw
	 ASYrgMRibIYVxdZc5TV5i3PqjPq5XNq2CT7QH7uZpuG5gCf3plq+rJO3Tv+su4Et5v
	 wS3Dr+xcFqArD3X2xPEj7ZTAj9F1kmIdvk6JLxyGmO5lD30jd2zdB1GtHi3HGPz1FM
	 BrUdT5BPDd1ll9wgfnbFZkdzMhzU+nbPZs/z/wnJ0VIQfMY5y7HK35dXw+8XucOo5z
	 jhhBYM2ajD7PQ==
Date: Tue, 3 Nov 2026 08:59:37 +0000
From: Lee Jones <lee@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@oss.nxp.com,
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>,
	imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH 1/1] mfd: stm32-timers: use dmaengine_desc_set_callback()
Message-ID: <20261103085937.GE13023@google.com>
References: <20261102174656.3939832-1-Frank.Li@oss.nxp.com>
 <sashiko-outbox-193875@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-193875@kernel.org>

Note that this is the first I've seen of this patch.

You may need to [RESEND] it.

On Mon, 02 Nov 2026, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] mfd: stm32-timers: call to undeclared dmaengine_desc_set_callback() breaks build
> - [Low] mfd: stm32-timers: uncapitalized commit subject description after prefix
> --
> 
> commit 90e59ce1010cceb53a7009d41c5cc59f1c853e30
> Author: Frank Li <Frank.Li@nxp.com>
> 
> mfd: stm32-timers: use dmaengine_desc_set_callback()
> 
> This commit replaces open-coded assignments to the callback and callback_param
> fields of struct dma_async_tx_descriptor in stm32_timers_dma_burst_read() with
> a call to dmaengine_desc_set_callback().
> 
> >     mfd: stm32-timers: use dmaengine_desc_set_callback()
> >     
> >     Replace open-coded assignments to callback and callback_param fields
> >     of struct dma_async_tx_descriptor with a call to the
> >     dmaengine_desc_set_callback() helper.
> >     
> >     No functional change intended. Prepare make to struct
> >     dma_async_tx_descriptor private to the DMA engine.
> >     
> >     Signed-off-by: Frank Li <Frank.Li@nxp.com>
> 
> [Severity: Low]
> This isn't a bug, but MFD subsystem conventions expect the commit subject
> description after the prefix to be capitalized:
> 
>     mfd: stm32-timers: Use dmaengine_desc_set_callback()
> 
> > diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
> > index b3dbc02aaf798..4f344f2a5a26c 100644
> > --- a/drivers/mfd/stm32-timers.c
> > +++ b/drivers/mfd/stm32-timers.c
> > @@ -102,8 +102,7 @@ int stm32_timers_dma_burst_read(struct device *dev, u32 *buf,
> >  		goto unmap;
> >  	}
> >  
> > -	desc->callback = stm32_timers_dma_done;
> > -	desc->callback_param = dma;
> > +	dmaengine_desc_set_callback(desc, stm32_timers_dma_done, NULL, dma);
> 
> [Severity: Low]
> Does this break the build when CONFIG_MFD_STM32_TIMERS is enabled?
> 
> In drivers/mfd/stm32-timers.c, stm32_timers_dma_burst_read() calls
> dmaengine_desc_set_callback(), but include/linux/dmaengine.h does not declare
> or define dmaengine_desc_set_callback() in this tree:
> 
> include/linux/dmaengine.h:
> struct dma_async_tx_descriptor {
> 	dma_cookie_t cookie;
> 	enum dma_ctrl_flags flags; /* not a 'long' to pack with cookie */
> 	dma_addr_t phys;
> 	struct dma_chan *chan;
> 	dma_cookie_t (*tx_submit)(struct dma_async_tx_descriptor *tx);
> 	int (*desc_free)(struct dma_async_tx_descriptor *tx);
> 	dma_async_tx_callback callback;
> 	dma_async_tx_callback_result callback_result;
> 	void *callback_param;
>     ...
> };
> 
> Is this patch missing a prerequisite commit that introduces the
> dmaengine_desc_set_callback() helper?
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261102174656.3939832-1-Frank.Li@oss.nxp.com?part=1

-- 
Lee Jones
