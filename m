Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EBE45C712
	for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 16:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785341324; cv=none; b=r8113uareSxnzO9v2XNRZdtmGdB7p1KagJT0Hu72+SIK8S6W76SIWVO4D8Ch4ME7wIZrUug0reWcziEXTUaYDksu48mCGboHsp2tLXDq+iu8MC93aKLtjrdwncE3Bpzqd0Is6qsUckK069D7nTCzzXwn1o/OfZ+VxieyYCnETgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785341324; c=relaxed/simple;
	bh=1dxnh5weyzKa6ZVbZ5SNKVN4SnUmIaO9yzv2LW8wPTA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJJsPBuHg6P3ZvCZwlpgZdArx6OYi5qagI5+zsHFPz6CVpqfZZLgCHw06CIQY0clwG8Bkze0ctgpexqLlebNwuBGwL86qLXU/SijxOpcTDrcHY/1sJlR8TXPS28LotuYuUxIeRmOdXlLJiRvIuxKzJ17AchU0fXIY99o/PDNTxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEqfW0Wg; arc=none smtp.client-ip=74.125.227.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEqfW0Wg"
Received: by mail-pj2-f4.google.com with SMTP id 98e67ed59e1d1-38111ea8a88so702146a91.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 29 Jul 2026 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785341318; x=1785946118; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EHJt5WwndMaD+8Zf6CWvma38RBnM0mlbcCQKAC4U0Kg=;
        b=XEqfW0Wgsn+yE7AK95TMm2W04821NXXwUbVRxpPsXP/2sPhCDauU8wejJcKumx/hN3
         HWJPvjkzeyThEQTC464ycAvrk9p2+51tivhTmHjxWduyDQcnPH1cYwEV5md1kBTeNWw4
         B3SQnXCMlFfOzZQRUkMQ8JBN3JliWBdUc6W4YSfdel8WOMeRrnD+/WE7jHRhhgPd16JR
         Eg75MuHX2ZaXMeS0sddELTwvgeMwulZRO2FUcB0HQIOHvMIbq/8aooJ2HVv4d/Bfm5M1
         baV6M10R9YeqFMj+Oz4owPyxdY9uyNxv208Kim94sY+PZVIvuzEMlBCez1kEZXFIw/3A
         VM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785341318; x=1785946118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EHJt5WwndMaD+8Zf6CWvma38RBnM0mlbcCQKAC4U0Kg=;
        b=ZOjuHbPi1L6gjT1S8x2FhBmenW7YrdxWk4qerLqFLnA0F05SUADbPJX+MDN6LzSXCS
         gFoYOZU0mamIUYlQpH5h9Jjs+wk42sJRnqujUmRM2WxfGJyyvISBGmAEpJm54H3ppHmA
         W3kwTHHqP7Xc4tsU/OWuoON3cdsb3tA32iLoL5FC8gbb+VXIduEnbdlbPj9UqkKseb8K
         D3nttMaQMvu8/g5EjvnPEjrIdKVe5z4Dn6GOJ7iUkoWIxvnh0OS+TMNBC7uzxSJFdAdz
         P6VTZfuMfSVVzvtU2p6iwcWFUdYVCn9RG+FkQxMXqJuIh2550jj0zwXvvjfzhaJ0XzpJ
         hzXw==
X-Gm-Message-State: AOJu0Yz5Hi1ZkQk/5d6RGhJugLOWKSftQejFPrr25cwYeECbxCZtHMGK
	lRrXJ5qdV0KxQpcSPucPk1ZzexuTLFtnkB94sy/yQ1PAilJaHrug2mDfsLSjTe7UOQc=
X-Gm-Gg: AR+sD10idu/byV9y+B/qqfqD3LeS1LDkuJtJdWpkJy+w/Gx2lMx4lsPwxf8pyNCf2l2
	QSqAZ66pUZVh/rD9JhC1IUguAwqDKVUXj4dVpEGRmTVJA49QzsjstB2UfjyGJ8D0j9XCiiek0fJ
	XJvmWyhsbWme4xOPVdcxB1udxFUc3yC8SsG2NNS5LNVeaLltqTSrOMGW7MW1LR0glJ49jquOht1
	iZ+mlyyvgTVX0gePbcodg1I7OeF+SG5/JL97vBKg+oW71Fww/ooRQxgRKM4TKFNQ2ASDv90AArC
	cK+arMoo1xsic2K0XXccO1RQVHygsLksr3HLBJEmF3JbHSKXzHHakcLkt9XL7kXfqJHb2aW65o8
	ESnwsayOUfeuiv/9AKmx6cvQ1hROzAFnCJKbt0oojnN1wO4aa/2sKYxV+YUtjyD7l9OTc8XZjr2
	DZnmh0ji4NEPpzGqYngz0d61KPQUnWDdFzbbYFFqmQwof1l5Y4V8BzCw==
X-Received: by 2002:a17:90b:56cf:b0:38d:c0f9:30be with SMTP id 98e67ed59e1d1-38f6a480100mr7074408a91.38.1785341318384;
        Wed, 29 Jul 2026 09:08:38 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:51::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f642e342esm2990713a91.15.2026.07.29.09.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:08:37 -0700 (PDT)
Date: Wed, 29 Jul 2026 08:58:57 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Subject: Re: [PATCH net 6/6] xsk: validate metadata when processing requests
Message-ID: <amoilMU-WhjXVRNG@devvm7509.cco0.facebook.com>
References: <20260727161959.885642-1-sdf@fomichev.me>
 <20260727161959.885642-7-sdf@fomichev.me>
 <20260728162044.B2D9F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728162044.B2D9F1F00A3A@smtp.kernel.org>

On 07/28, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Zero-copy drivers unconditionally parse XDP TX metadata ignoring the XDP_TX_METADATA option flag.
> - [High] The stmmac driver drops AF_XDP TX frames without generating completions when the frame length exceeds max_sdu, causing the AF_XDP completion queue (CQ) to permanently desynchronize.
> --
> 
> --- Patch [6]: [PATCH net 6/6] xsk: validate metadata when processing requests ---
> commit 8967b4032038ba439c0a13ce2dc4cab303b87c2e
> Author: Stanislav Fomichev <sdf.kernel@gmail.com>
> 
> xsk: validate metadata when processing requests
>     
> The zero-copy path validates TX metadata while obtaining the descriptor
> context, then reads it again later when preparing the hardware request.
> Validate the metadata in xsk_tx_metadata_request() and use the resulting
> flags snapshot for every feature check.
> 
> > diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
> > index 5a18d00deb4f4..7b6cdc037c00f 100644
> > --- a/drivers/net/ethernet/intel/igc/igc_main.c
> > +++ b/drivers/net/ethernet/intel/igc/igc_main.c
> > @@ -3082,7 +3082,7 @@ static void igc_xdp_xmit_zc(struct igc_ring *ring)
> >  		meta_req.tx_buffer = bi;
> >  		meta_req.meta = meta;
> >  		meta_req.used_desc = 0;
> > -		xsk_tx_metadata_request(&meta, &igc_xsk_tx_metadata_ops,
> > +		xsk_tx_metadata_request(pool, &meta, &igc_xsk_tx_metadata_ops,
> >  					&meta_req);
> 
> [Severity: High]
> This is a pre-existing issue, but do the zero-copy drivers unconditionally
> parse XDP TX metadata while ignoring the XDP_TX_METADATA option flag?
> 
> Looking at igc_xdp_xmit_zc() (and similarly in mlx5e_xsk_tx() and
> stmmac_xdp_xmit_zc()), the zero-copy path reads metadata directly without
> checking xdp_desc.options:
> 
>     meta = xsk_buff_get_metadata(pool, xdp_desc.addr);
> 
> If an application sends a standard AF_XDP packet without requesting metadata
> (by clearing the XDP_TX_METADATA flag), the driver ignores desc->options and
> unconditionally reads the metadata memory. Since the memory might contain
> stale data, meta->flags could contain valid but bogus bits.
> 
> Could this trigger unintended hardware offloads, causing data corruption
> (bogus checksum offsets) or TX queue stalls (bogus launch times)?

That seems like a valid pre-existing issue, will address separately.
 
> [ ... ]
> 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > index 3f5111969c414..eb666b0bcdd22 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > @@ -2747,8 +2747,8 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
> >  		meta_req.set_ic = &set_ic;
> >  		meta_req.tbs = tx_q->tbs;
> >  		meta_req.edesc = &tx_q->dma_entx[entry];
> > -		xsk_tx_metadata_request(&meta, &stmmac_xsk_tx_metadata_ops,
> > -					&meta_req);
> > +		xsk_tx_metadata_request(pool, &meta,
> > +					&stmmac_xsk_tx_metadata_ops, &meta_req);
> 
> [Severity: High]
> This isn't a bug introduced by this patch, but does stmmac_xdp_xmit_zc()
> permanently desynchronize the AF_XDP completion queue when dropping oversized
> frames?
> 
> Earlier in stmmac_xdp_xmit_zc(), if the frame length exceeds max_sdu, the
> descriptor is dropped via continue without issuing an XSK completion or
> posting a dummy hardware descriptor:
> 
>     if (priv->est && priv->est->enable &&
>         priv->est->max_sdu[queue] &&
>         xdp_desc.len > priv->est->max_sdu[queue]) {
>         priv->xstats.max_sdu_txq_drop[queue]++;
>         continue;
>     }
> 
> Since xsk_tx_peek_desc() reserves a slot in the AF_XDP completion queue (CQ),
> dropping the frame skips the hardware descriptor setup, and no completion
> interrupt is generated for this packet.
> 
> When a subsequent packet completes, xsk_tx_completed() will advance the CQ
> producer. Because CQ entries are positional, would user space receive the
> address of the dropped packet as a completion instead of the actually
> completed packet, permanently leaking descriptors?

Hmm, good point, will send a patch separately to reorder xsk_tx_peek_desc
and max_sdu check.
