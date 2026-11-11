Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371090;
	b=35Lm+OpqQcTd+Nxpedg2CbjhJCxke2ockW1kCM87Lw4Cx/QzMuYYBk/spiRVqeWIN24L
	 bx/1h0IJzPNtAr9hnC5iarkzb9GQld2QcN4N7pS4cS6xF+P4D87GUPDEBQfCvVKyOIAVj
	 qpw+3e9Mkp1Q+Li2IVZ77I47WBkW6IxQnzCFhZDzY+grlLg8a0Ha/wYVkm0WAdouJZPG4
	 VU0BZpG1ScB7vXK5dM1NBkYIIKkvyOlHLl2wkU3NBL4ASaLexu1tmlRS3vn4UnRTEe40j
	 SdbQEeOHHsZNG3VXrAJx7u2BVAEydUBS0cVPMxTyJsBWE3spsiqWDgGKHg0npHCLpFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371090;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5+PpphlpajmWTe2u74lHALG+B1qJVE8FkqGWsdeseUE=;
	b=sonF0sfQg9XPXx/llrcW9BGwsHmoQK9Nt3OHXOcn0dC7o1uaMthQerZkiNhMsSR5wJfn
	 GKQYmhRgPA6l1ksQLRSztNVu9REnkbJIFoRMOOZVZwgnVetocR8K9mPSYK+WUYgqOxsUO
	 4cA+SqF93SlQ01fFPiJGk0ZlcoyX8/ByT6ItCvaHV0gkYg3QcmrXzA1961lpgSlr9K3EV
	 tVYB6HQqrxNSO2z6l32J2USpgN4zpEw3MHKZ4KjfXsr2FzjOnbb62SehhGU4jr2XTJ1jI
	 CjsI5Lv5SNELFW+fAesI8ow+f7uBBjCEu6p0fLN+CtyLmdXSrcc9gDOWR8s3PRB5M2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ia1FKhjU;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1D7606A326
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 04:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC1D7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Ia1FKhjU
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1637580a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 20:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794371089; x=1794975889; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5+PpphlpajmWTe2u74lHALG+B1qJVE8FkqGWsdeseUE=;
        b=Ia1FKhjUg+oOcCHNXnPNsToLvJgzjiGjzt2P4dIqIE9TFL2SFBg/wOlKluyaT+3IXd
         9iNDEZyRsNZRbrYY8MAvmEJEK0RwyIaDhLxLs19u/q79hAPZW/4L3cQcy06APlEcYcgf
         oA/6ag2YOYAGVBpTf6c1KMKqum1hRC1cynTkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371089; x=1794975889;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+PpphlpajmWTe2u74lHALG+B1qJVE8FkqGWsdeseUE=;
        b=BAOpzPM5qujqXALyhycsCZ49vOy9/jZTNd/vSkz+A4WIGzZ0Tm/IL/JmaSTT+j34DU
         CNgxLaEaXsnYHUsEWvF/HITPBb2UhthSSLcM5s2+aeeVriEigvyYoFlWLOpbi0JdzPNq
         +z03NPWiGgiKJtaJQPaJXNJ/F1mDoywjD5tBB26X6Oq46SW84mYvyjil9XKK9Pt78QJM
         NRkiu1WC4rxJK1ftxFE3YmrBF2G0wDuKRtg+N//dDA9g1X4xrNWlnYcNf1OABENCbmRp
         lBQQffQtz7NYXW+iv4pWKuj+lm6K2cdr9mFuHaW3S16HiB99khN1WlQZiZAsSFy0+czO
         cS+A==
X-Gm-Message-State: APuU4Z9+9dfW8dDvwX/ps2Pmtuu/uD3zbtaUdWgmuNCZm08lO+DTCTZu
	wqdIauBnxu42OkdB1fv/4Dxh9Xl6Sj6587r2H17fFObGFJ2eUaRZ5PiQ9VhbQ5xy4MLejXDXz8u
	7x4s=
X-Gm-Gg: AYBFou0weS+UAs5Qjok/+eyY6LzMJAQiiW2sH0NXkP/Qp5guHz1VTRF76wj6aR3CjHc
	3s1A1+5KLLYOGc+Aw5/s8RUoYq9WUgStvWvyPQEYAeknk0ugkf1S2cXTc/8O2tb+kEBbifyH1qq
	tVpyOrhehXtbhzQT+RLNNIGYP6sFqeFM5k9eMJAqWsGlhpWaN6Dm769fR+7VqT1WcRtBzWNeaYF
	+GXWjEXVsjzzQu3C00Cfqcd+c5tlips0OO8bCfBM0h6Q2gpgKswJMn/muZMgsUPNitz8K6+IrHy
	hfAwcfCgK26bJu3yFbbWlDvt+x5k26jtMFn92J5DRSuKT/vBGXckEzsJAmKivnmLJl4T9+X7Tnt
	wWS5u6HQfHR/jL0FPOuryZvq/0kHghJUMlaTKqVwXPRigLugM10NOPmZtC1CArD0RlgvbFj3t5V
	tqI28szpufzQ4kZRn1HLAtcYFiWK2Hwe+j8QEFetgjsExkcsMW8spPrSfj3if4vS7q9V1+uPJDd
	AFpLguuBW2wzwXrE86C04NlThqkIWrBg7FikCHhUDKwPbC1QkPmFUf6VeqDxb5TZl7dFd+I1UuZ
	giPOiCf7ZRKkfquFmAwehnoxsRDpMuuYAGV5tybhgkqIOHUf6J9NTBi1HQYaYo2pS0reVA==
X-Received: by 2002:a17:90b:3c44:b0:3b0:d365:f8ed with SMTP id 98e67ed59e1d1-3b182efb65bmr1194697a91.21.1794371089135;
        Tue, 10 Nov 2026 20:24:49 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17dfb7a84sm2353036a91.2.2026.11.10.20.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:24:48 -0800 (PST)
Date: Wed, 11 Nov 2026 13:24:44 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-mm@kvack.org
Subject: Re: [PATCH v2 08/11] zsmalloc: encode 1-based obj_idx so valid obj
 is never 0
Message-ID: <avPto_ATpOqET8af@google.com>
References: <20261110054836.1515030-1-senozhatsky@chromium.org>
 <20261110054836.1515030-9-senozhatsky@chromium.org>
 <sashiko-outbox-207590@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-207590@kernel.org>

On (26/11/10 18:37), sashiko-bot@kernel.org wrote:
> > @@ -169,9 +170,6 @@
> >  static_assert(ZS_OBJ_IDX_BITS >= ZS_PAGES_PER_ZSPAGE_BITS,
> >  	      "zsmalloc: ZS_MIN_ALLOC_SIZE would exceed ZS_MAX_ALLOC_SIZE");
> >  
> > -/* ZS_MIN_ALLOC_SIZE must be multiple of ZS_ALIGN */
> > -#define ZS_MIN_ALLOC_SIZE \
> > -	MAX(32, (ZS_MAX_PAGES_PER_ZSPAGE << PAGE_SHIFT >> ZS_OBJ_IDX_BITS))
> >  /* each chunk includes extra space to keep handle */
> >  #define ZS_MAX_ALLOC_SIZE	PAGE_SIZE
> >  
> > @@ -189,6 +187,11 @@ static_assert(ZS_OBJ_IDX_BITS >= ZS_PAGES_PER_ZSPAGE_BITS,
> >   *  (reason above)
> >   */
> >  #define ZS_SIZE_CLASS_DELTA	(PAGE_SIZE >> CLASS_BITS)
> > +#define _ZS_MIN_ALLOC_RAW \
> > +	DIV_ROUND_UP(ZS_MAX_PAGES_PER_ZSPAGE << PAGE_SHIFT, ZS_OBJ_IDX_MASK)
> > +#define ZS_MIN_ALLOC_SIZE \
> > +	MIN(ZS_MAX_ALLOC_SIZE, \
> > +	    MAX(32UL, ALIGN(_ZS_MIN_ALLOC_RAW, ZS_SIZE_CLASS_DELTA)))
> >  #define ZS_SIZE_CLASSES	(DIV_ROUND_UP(ZS_MAX_ALLOC_SIZE - ZS_MIN_ALLOC_SIZE, \
> >  				      ZS_SIZE_CLASS_DELTA) + 1)
> 
> [Severity: Medium]
> Should ZS_MIN_ALLOC_SIZE align _ZS_MIN_ALLOC_RAW to ZS_ALIGN instead of
> ZS_SIZE_CLASS_DELTA?
> 
> Because _ZS_MIN_ALLOC_RAW uses DIV_ROUND_UP() with a non-zero numerator, it
> is always at least 1.  On 16KB and 64KB page kernels, ZS_SIZE_CLASS_DELTA is
> 64 and 256 respectively, so ALIGN(_ZS_MIN_ALLOC_RAW, ZS_SIZE_CLASS_DELTA)
> rounds _ZS_MIN_ALLOC_RAW up to 64 or 256 and overrides the 32-byte floor in
> MAX(32UL, ...), eliminating small size classes even when ZS_OBJ_IDX_MASK can
> index 32-byte objects.  As noted in the comment above ZS_SIZE_CLASS_DELTA,
> ZS_MIN_ALLOC_SIZE only needs to be a multiple of ZS_ALIGN.

Hmm need to think about it.

Those min-size-classes are never used anyway, e.g. compressing 16KB to 64
bytes is just not happening often enough (if ever).
