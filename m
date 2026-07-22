Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A9381732
	for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724493; cv=none; b=OA5xQi5Ubz1TNZlEK8XJH+YDDVCxFF9LIgSzPdF6dYTyP9KVmyVI0/kbKJq//rjgDTxrqtEaMu5J1m+ee+fQmIcCYx+SAzri5fqvob7sQThmmRWL7D6hDZKob0FvzwKdnNQOGcfSWybUi03LU2JVzQra99WwjeGnhugLIZSgbJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724493; c=relaxed/simple;
	bh=LSan+qsl/PdUzA+3tf/f+0lljAi+xqioinYXzBQFQpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LY1v6s6WL63bAQzcFH9OgLtwU65IrLJ8jyLERypPDOX3JBoviYSi1UtXWEUhue+Eedlm462AcgknTCo8BEhKPCpFIM4uuyD81gUfPacKuIjMguoDkdhuE9JyGwIV1C43APEm2AFO9YRAJWSw3RRGEy/T5SMNOZ6wo1NX5boefrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JwsnWPze; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JwsnWPze"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49553515a8bso46933215e9.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 22 Jul 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784724490; x=1785329290; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3vll96HvxjohoJS+PNU+ieDa/RF4H+N4kRxOCCao22w=;
        b=JwsnWPzeVlgN2PmIBxeppbxkxUj6EB2KQhzy3AKSj3CnmJs9lyfprtBF/4Y4+eNQQV
         aZU8jZ0olrRTDsgOg2pX95US1gMhnqGA8daS6nMv9uqUdk9igbEGuX/bDJfuSxExBlQP
         oCw5hXEQlAsLehdJVtorqKsIU2ncADdC7WGjpYDEUX+8eCT538IRrC/wA+iiTbMMM1hC
         pmcgRWKEhxl+FFWWgDE01J4pepatjqOYJvt1t7A+vkvtqjR3f+FSPQw7dIe3QM0XGTCA
         qOxzavXgNVWfPOaeg5TLf44SBV+iIcxxsDWJ+fng046c2+2aVIINPVTJIqCWnjHIRjiC
         dDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724490; x=1785329290;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vll96HvxjohoJS+PNU+ieDa/RF4H+N4kRxOCCao22w=;
        b=mDotc3fIL/gNiH1aGlGan/Fpw5h8gHaSzxFCWg4zaNq4qWTQYwClZJc7TLwfgEtgR5
         3foxOFwwnNWt0tYLE7getxq7pzWSTVqsQG7oYh+ffYORa9VQNBOMAc/rd6NvbVFyYUE1
         af/JIK+oUVRjKCTISrQwbFA84kB/PjRyqPvF7OszNSPM2DB6jDzU947r4YlPQjqGYmwJ
         w5Tf3+TcIsD35bxw7EfYIIa/awEbNkhVnL2/tdCwycGdwgTCdAggE7qBeUJA+w16TyI8
         mtw/0Knm2jl4mhxFSSWT9d5YkP1QnNLkgmlgmVDQnikM5nLuxVx0+pD1kIQ0w65QLg4n
         0Dfg==
X-Forwarded-Encrypted: i=1; AHgh+Rrc+I2BEebXgEmO14UKmtevKAQcamW0hMuEVH2fYeYuQIJAEgEh3zdqbYri7VJni9gZVB/kD2848foYQ3YS3TM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzusuXOkHqnt+xpEWr1NNdb+j5yBMo99P5+TOVwbP2smqmfpn6h
	mQk682acyUvQyKUsBjYmWAmQGFZNqd1U4k5A7PFGgN1tbTZ9yWD7HVQrhPjos03l/Ig=
X-Gm-Gg: AR+sD12vdrxfSJA6D8RjjqLUtDBOIjKFaAUZSr6h9VIpOFBBodjY2C40xkOu/7/225D
	KG+A579EkDVwfEaN8MQPJij5quV9yuiVrQD8u7NZIaICtamQZjLK+41fxsEViccZG44eyWI4uZn
	7av3ysaQvoHNwgxAPv/AoGn8N5347oSAAdiVe2Zlz4uklAnExXoeQDCDTZSlkmXVDnCWq/mE71k
	yv8ufg6YEKdXEXbFrxwPrJh76uqNCK96yv2zDFdym3TDSwGPXyKVRRQKx3I7uBX6HYb9a3b6nMT
	zV9F51ZCCeKkxe5h5+pOzz44tudsEpuDQhkrQ/lHq7XYJMGTzMLBdtz5CpxSjPes1ESks+FlF7m
	y/L6Fw5M4dJ76tmZQ/c30D5/l5oOT4iRUM8B0tXiT2NudLxjJtxzQZy85CVx4+RPcUUo0svnJ39
	BCzRjo4939bmzH
X-Received: by 2002:a05:600c:474e:b0:493:915b:dc4a with SMTP id 5b1f17b1804b1-4954a3d005amr297618495e9.8.1784724489524;
        Wed, 22 Jul 2026 05:48:09 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:7ae3:a857:e482:495])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bffefsm131520645e9.9.2026.07.22.05.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:48:08 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:47:56 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>
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
	linux-arm-kernel@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM
 locking
Message-ID: <amC7_M-HjVZ3sQuT@linaro.org>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
 <20260721-qcom-qce-cmd-descr-v23-6-1be02deffda9@oss.qualcomm.com>
 <20260721134853.2B2401F000E9@smtp.kernel.org>
 <amCGXUUd4VmuQRGD@linaro.org>
 <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfBNB0pvv1kPPcswE4Y2m7PXBO49bwJg=v0+aY=JmJKWw@mail.gmail.com>

On Wed, Jul 22, 2026 at 02:34:52AM -0700, Bartosz Golaszewski wrote:
> On Wed, 22 Jul 2026 10:59:09 +0200, Stephan Gerhold
> <stephan.gerhold@linaro.org> said:
> > On Tue, Jul 21, 2026 at 01:48:52PM +0000, sashiko-bot@kernel.org wrote:
> >> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> >> - [High] State leak causing hardware misconfiguration on channel reuse due to uncleared `lock_scratchpad_addr` and hardcoded direction.
> >> - [High] Channel state corruption when `bam_slave_config` fails validation.
> >> - [High] Infinite BH workqueue loop and unratelimited log flood on memory allocation failure.
> >> - [High] DMA API violation: `lock_ce` buffer shares a cacheline with frequently CPU-modified struct members.
> >> - [Low] Unused assignment of `hdesc` in IRQ handler.
> >> --
> >>
> >> --- Patch [6]: [PATCH v23 06/14] dmaengine: qcom: bam_dma: add support for BAM locking ---
> >> commit 8b44c5e4935cbb61832adb3262df00b3b606a283
> >> Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >>
> >> dmaengine: qcom: bam_dma: add support for BAM locking
> >>
> >> This commit adds support for BAM pipe locking by prepending and appending
> >> dummy command descriptors with LOCK/UNLOCK bits when starting DMA on a TX
> >> channel. It uses a peripheral-local scratchpad address communicated via slave
> >> config for the dummy writes.
> >>
> >> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> >> > index f3e713a5259c2..411c60c4433e2 100644
> >> > --- a/drivers/dma/qcom/bam_dma.c
> >> > +++ b/drivers/dma/qcom/bam_dma.c
> [...]
> >> [ ... ]
> >> > @@ -1064,6 +1197,7 @@ static void bam_start_dma(struct bam_chan *bchan)
> >> >
> >> >  	lockdep_assert_held(&bchan->vc.lock);
> >> >
> >> > +	vd = vchan_next_desc(&bchan->vc);
> >> >  	if (!vd)
> >> >  		return;
> >> >
> >> > @@ -1072,6 +1206,24 @@ static void bam_start_dma(struct bam_chan *bchan)
> >> >  		return;
> >> >
> >> >  	while (vd && !IS_BUSY(bchan)) {
> >> > +		/*
> >> > +		 * Open a LOCK/UNLOCK bracket around each fresh sequence.
> >> > +		 * Sentinels inserted by bam_setup_pipe_lock() are skipped: they
> >> > +		 * already have bam_locked set and must not trigger a second pair.
> >> > +		 */
> >> > +		if (!bchan->bam_locked) {
> >> > +			ret = bam_setup_pipe_lock(bchan);
> >> > +			if (ret) {
> >> > +				dev_err_ratelimited(bdev->dev,
> >> > +					"failed to setup the pipe lock, deferring transfer: %d\n",
> >> > +					ret);
> >> > +				queue_work(system_bh_highpri_wq, &bdev->work);
> >> > +				break;
> >> > +			}
> >>
> >> [Severity: High]
> >> Does requeuing to a high-priority BH workqueue upon ENOMEM cause CPU
> >> starvation? Because system_bh_highpri_wq executes in softirq context,
> >> requeuing immediately without sleeping prevents the memory reclaim needed
> >> to resolve the GFP_NOWAIT failure, leading to an infinite spin loop.
> >>
> >
> > It looks like my suggestion to queue_work() again in the error path of
> > bam_start_dma() wasn't great if we end up causing an infinite spin loop.
> > We do need to retry somehow or report an error though, I don't think
> > aborting and leaving the desccriptors completely unhandled is an option
> > either... :(
> >
> > One option would be to try to avoid the allocation and write the lock
> > descriptors directly into the FIFO, but this will probably get really
> > messy as well, since you would need to carefully modify the FIFO
> > management in several functions ...
> >
> > I don't have a good spontaenous idea how to solve this right now. :/
> >
> 
> Pre-allocate the lock descriptors (if needed) in bam_prep_slave_sg()? As in:
> call bam_make_lock_desc() in bam_prep_slave_sg(), store the descriptors and
> make bam_setup_pipe_lock() return void as it will no longer be possible for it
> to fail? It would just grab the preallocated descriptors.
> 

I considered suggesting this, but how do you know which descriptor needs
it in bam_prep_slave_sg()? It's just the allocation, afaict it doesn't
tell you anything about the order in which they will be submitted. :/

We could always allocate the extra lock descriptors and waste the extra
memory for the descriptors that won't need it. That should work, but is
also not great ...

I was hammering at the code a bit earlier to try the "write the lock
descriptors directly into the FIFO" approach. It has some advantages,
but also makes the FIFO management quite a bit trickier, hard to get it
right without full concentration. :')

I _think_ it could potentially work, but if you have a simpler idea I'm
also happy to throw away the mess I started. :-)

Thanks,
Stephan
