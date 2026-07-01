Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0C2374A00
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 04:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782880281; cv=none; b=aucYshiNG2+jAS1spQeZrvRas7ZdhGBj+cARfgATF02jsL710zMtBckghZYPjLEzUm4zwgxElrf9G9vExhW4/gnA8dKkBUfwyegpqFsOtD5pct/zmM5g4NLd4LtD07hI9lBenS4Yu9wLkv29FN+aVE5mmuslcLLhBPFXD28PrTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782880281; c=relaxed/simple;
	bh=AWKY4cc9CqfC8Hk+fcXwx0sO+5n7MEB7rG8uG7Wszik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCPQwFAhSr6shtY8ZPhKnlSPrVnGlBqvU4/+gCMQBbCiB52j6eCzHQ2dmrcZtbb5B8UwJ1qhURP1wkzCU3D3K1uTkRF6cPr1203OpdQK3/rnKJgpeTxelYzaAgzayS4GYBoqzeYYEYohbcyZugbzFDK9tgXwHe388VyQD2DtFUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xl7Y/yUa; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xl7Y/yUa"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-37fcae0ecb3so93517a91.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 30 Jun 2026 21:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782880278; x=1783485078; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fBDjdsdXK93fPolwyRglgWnhTKiV7F2AKwYz1juHAG4=;
        b=Xl7Y/yUanbNX5wo3/nYEveQeiz9JRVVMy6PB+8cSghDY0m1JXC2h/at1KdsUsyUoE7
         a7mzn6Q+fMAmNwHofv8FU1vGwcY3kPOrd17ETei7JHwhgPKQ948Q/uT5MbuOUU/t9wO/
         xwjk2tM8cWlSeQkiuMzDwFXgSMUbFfbZhHYLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782880278; x=1783485078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fBDjdsdXK93fPolwyRglgWnhTKiV7F2AKwYz1juHAG4=;
        b=bKyuvuAAOu1GKc4DomGnQG8uxuyhHKSmvtVwHtAl8UXlI1gv0rjV3NjQtkP09uRV7c
         THnSkMv4pd+38mdockHAOhKEAInFWHyPW+BCzC/xjL+hFhKXrq6W+mzyfpOg3No71TaY
         nRU2HHu+pc2mxsNYR50+mRxttZf/67CzD1/Wb8t/TqM0zyflMtHjMPDMuOPxd1z+LcGT
         ktX+4XkZQ17JyMPbaij0uL6EKmRSIXmMN9hEjOtac2W1mQEWnrk046OyKQDwnRiOVq1r
         gB5mMtATdDUcFUPtVORIgZNliWHGJcvIRLmR8U92zdVkY9L1tdiybKf6Oz/YG0giZioq
         vtWQ==
X-Gm-Message-State: AOJu0Yz0Bvz9FIfC6noEQpLraKleChVUGgzp34782uwIlDs2r3HZ1Uyy
	4S8FS2tAtyMZfAVPZeEMv3+gONiwgv3FCeICkl6b1/ndQN4/e7Q08HjhYmuRtUNF5LuW2peiJNV
	HF+i7ow==
X-Gm-Gg: AfdE7cnSXXXFz1LO1pKBcKSNxwQyxGtfqK9B1iuS8/KzDgn6pQQRkyoCIDOTvFUAb2o
	W0y/G3ZKIjNnhyuKeSEfjLNOfnyb7iVEr6NZ/HZSAPdNBTQK08DqyCliuNq1ik7SdF72Js4Nmm5
	QYOiQqtdBYv7cVBgwP7Jali7eKPR+cNCqs6RjqtqBAg5y9IDd3LbUulW3PmXimlKWX/u1cgBn2a
	A0j6EmiPt0Vw710RaiJ6nlwANgAT9fREhPW06FbgaPNTc5F02sj8V0Pzf5GfAbMpphsBwOnppkM
	D8IsTTykAVXsiDjmyEwUJZUJyLfSdpSdDSr7Rc/xLs+XH5DM+Wh/nRC6YUoLmk/+Fwx3I21l3g3
	taRUttgK7VWypZ4PQsd0gcGSvCIpfNXT9/+2p2o7L5iC6g2sUpx38pmzzDiyuEcJEJ/WlCitN9E
	otlMW9L/gNgvTppae+/nt6twngdQhYfvqrh1j+9jN2cwjswu0jKF6c
X-Received: by 2002:a17:90b:4c07:b0:380:7d9f:81f1 with SMTP id 98e67ed59e1d1-380aa098483mr158214a91.3.1782880277528;
        Tue, 30 Jun 2026 21:31:17 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:1379:da2f:9be6:bff2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097ba48d0sm360301a91.1.2026.06.30.21.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 21:31:17 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:31:12 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-scsi@vger.kernel.org
Subject: Re: [RFC PATCH] usb: storage: uas: limit consecutive device resets
 in error handling
Message-ID: <akSXFydSPAQGi-4b@google.com>
References: <20260701040335.810297-1-senozhatsky@chromium.org>
 <20260701041700.EB7971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701041700.EB7971F000E9@smtp.kernel.org>

On (26/07/01 04:17), sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Prematurely clearing `devinfo->resetting` and dropping the lock before calling `uas_zap_pending()` creates a race window with `uas_do_work()`, leading to a kernel warning and Use-After-Free.
> - [Medium] Time-of-Check to Time-of-Use (TOCTOU) race when reading the `uas_reset_limit` module parameter.

[..]

> > +	spin_lock_irqsave(&devinfo->lock, flags);
> > +	if (uas_reset_limit > 0 && devinfo->reset_cnt >= uas_reset_limit) {
> 
> [Severity: Medium]
> Can a concurrent sysfs write cause a Time-of-Check to Time-of-Use race here?
> 
> The module parameter uas_reset_limit has 0644 permissions. It is read twice
> in this condition without a READ_ONCE() wrapper. If it is modified from a
> positive value to zero or negative strictly between the two evaluations, the
> first check (uas_reset_limit > 0) could pass, while the second check could
> evaluate against the new zero or negative value, prematurely failing the reset
> and offlining the device.

Sounds reasonable.

> 
> > +		devinfo->resetting = 0;
> > +		spin_unlock_irqrestore(&devinfo->lock, flags);
> > +		uas_zap_pending(devinfo, DID_NO_CONNECT);
> 
> [Severity: High]
> Does clearing devinfo->resetting and dropping the lock before calling
> uas_zap_pending() introduce a race condition with uas_do_work()?

Yes, this looks wrong.  Let me take a look.
