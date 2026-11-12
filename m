Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487771;
	b=nVXuSgdM4vdIZcymPKC8+ENxEmSAw6QH8ZQbvUn8KFg28HDVV52I5SfqdR/SxQbJpGFM
	 x+GHDWtmXf55nLFz6Iyx+B5Qw8KAtMO3CZbxcesE4vxl83ayh9/vyDHvOXlboFc1IPn+e
	 BOJXNqOtn43zwAcSVfY+Y+z2YF4K+6awMQjNEegyCB2pY1H28NUmhduECFURb4JCNXETS
	 m0yWcAATKoWWY3SAoLGbxkQnXxXQ9qxUK5YktVnnUZtM/A1Fi0Dn29HGCi9UhwuF2vcjo
	 NGS8fdFcvNucDkc46MqPUhXuKvVq6ZDusP4B5hsSsdq5uTlG3x2iV7IrPK+tIt2TFEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=h0ijg/8uzd3pYGV3+WsooetUbMY+nJz4nlPIGNmDd58=;
	b=tF2edHA08pADjdggPYN20hdNdl+7rheiD4JYMLnXFqdfe+S9A2elDr0EqhfhyRuUUzaa
	 prq32iIeGw7+g+u2P9hbWoH+YS44VfVF8M68LKVzihKFovjZn7uh8LWu0wHGOGo9e0v69
	 V817BhabDhBvEIvvtHd8gajM04hb47iC7Xz59GPnANm9EAxoFwyt5qGs14YKT11q7lUTn
	 c5rD828DD4VX/+x4c/1mEOfLnHlBd/FfrFswjg3XekVHC6fMeWDxRCZNQFcfO2lv5Ytn+
	 O8JNu69fraTOB1bNhVsBGDUuTCB5G4KRTZUMwiP0q6nyeYxR+XXw6dpUr0S61DsX78g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Np+W54va;
	arc=none smtp.remote-ip=209.85.161.48
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED242606A323
	for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 12:49:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED242606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Np+W54va
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6f59f7fa086so50054eaf.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 12 Nov 2026 04:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794487770; x=1795092570; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h0ijg/8uzd3pYGV3+WsooetUbMY+nJz4nlPIGNmDd58=;
        b=Np+W54vaeuL6/9nnkxxKg+mzWEGWaoegFDdM35++T7IWhR9OB1O6rCG0PchCo6bqMU
         K5sDSPltPyT2QCD9U/0dI1+6/wODut8EIFzjtnwf1SlL1TIE5mkTkwqBMHDzrQdvGayD
         Dm03QE/rBNJXXFWacdoJM5JvoEEx4AZQwwX3DL/7zkNV7+tPS4NLtO+P8VjC8intqlyr
         yz1XFkoQ7DZy+yP2gTTeL9GOFDtRvOpHdyV90vW00sudTNa1uFNqqfUh4HwZVpqTapta
         e/Y/hYGHokeRU9vLWLXzwbZX5ESS2KKtkHQkE9Prwl76gqFK4vmPYS/dOyVWH6XUXfQK
         i6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487770; x=1795092570;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h0ijg/8uzd3pYGV3+WsooetUbMY+nJz4nlPIGNmDd58=;
        b=F4dY8UF9WkR5+IW77GvysD1tB81FioXEvHEVjK9zUPwZiZojfxSDw/KSTxgfe6OV+M
         r7YppSrI1Tb03Y6GKGKoWo2paaikYX4cv4VQrPevmD1Nt4DyZPYR5nZFh1QRY23rrp7+
         u9H3VG5hVt0/9WjTeBloRePjGlRemRR99Ke1pQ4IRcX2oA+w54h3Dvjt5wHsNT055CpC
         tbnwytt1km9XoryXeZ9LAdOjgdNR6+przrRLeDVU4kKd2QS9JGNHQJ1S+2loxQTfYlJz
         9G0bzLxEmHtyCkMf8je7kv6eJes0LD+pHAjSlSjMiUtTay5MVyAURy1z36S2ImfuMM2I
         W79Q==
X-Gm-Message-State: APuU4Z8hKjlFZrJSHFiZDDsXM88u1f8xihX/5PC3qHOAIRZN7u9btZu5
	BmlelyocB0Baswu6cuuw0oFu3bdgL9GqYuZnC/IrCQqEeNSIvw9F5+K4KtcME61f
X-Gm-Gg: AYBFou1xDT/IxCD68VlZ9/8v8qLQT5TsMP/EjQfwFv76kRxJLjVhOTOEjGmy27J08ED
	v6MfbtOjhNJiVsWcg07l/zDA/iPM9m9JUF87BFy+ixEr9OHAisCn6O0pgZc6y4D2vHxIpCD1zOv
	IjHkc57QLevy9gkQMOIHlejM4hyZW8ufjQay8wKSHCGRK2VrHEb/r26+fIbQeS/zCxeP/cDJz7e
	mvW1BDhL6iKes4sj/NMUMszgT6mxIYJpvdWDGdh3UJ+AQX9ETmr35StxWsn2aShbV3mypqdEJ0F
	vSDqYewPofrCNHdj8R4kFGSzQW4vQlKxjXYZtiSRi+I8onqPYdJhXapKE5BB2drpRh2ydHJ6yc8
	l9QjHPcm5IYnTjW21vyYaS2pT6RMc1wzb0Z2LDGavP1HmDeZxi/TVhNp/ZJLxi88pauKSf9nwi3
	oK3P4bm1dIJwnvbaGWuTRfsRKOFdNsmtp9D++EJBgEX85bhLRIVsUBxsIE8tKiUbyBIb7Yd9Lm3
	1nEyh26TtTHzFbDstTou6ENdyCg8ajtc6h3vH+YbwrHfZ3Ph6ZEo4ZCtiLZGQV/XRuwJSB184t/
	/TOfQ1IzbvqzjlWhVvZAGEH8
X-Received: by 2002:a05:6820:7054:b0:70a:992e:f3da with SMTP id 006d021491bc7-719172d2fc0mr5072889eaf.0.1794487769803;
        Thu, 12 Nov 2026 04:49:29 -0800 (PST)
Received: from gmail.com ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a6f2a264sm6286182eaf.1.2026.11.12.04.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:49:29 -0800 (PST)
Date: Thu, 12 Nov 2026 20:48:55 +0800
From: Wenwu Hou <hwenwur@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tracing/hwlat: Do the latency calculations in
 nanoseconds
Message-ID: <avW1t81WLQ9YrylB@gmail.com>
References: <20261112121502.2070755-1-hwenwur@gmail.com>
 <sashiko-outbox-211086@kernel.org>
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
In-Reply-To: <sashiko-outbox-211086@kernel.org>

On Thu, Nov 12, 2026 at 12:28:19PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] tracing/hwlat: get_sample() leaves NMI callback enabled on
>   goto out path
> --
> 
> commit b2b5eb31ef0ca8b02c68fc0666337a94df8c67b9
> Author: Wenwu Hou <hwenwur@gmail.com>
> 
> tracing/hwlat: Do the latency calculations in nanoseconds
> 
> This commit changes get_sample() to perform its latency calculations in
> nanoseconds so tr->max_latency is stored in nanoseconds, converting the
> durations to microseconds only when recording the hwlat event.
> 
> > diff --git a/kernel/trace/trace_hwlat.c b/kernel/trace/trace_hwlat.c
> > index 3fe274b84f1c2..b230cf14de93e 100644
> > --- a/kernel/trace/trace_hwlat.c
> > +++ b/kernel/trace/trace_hwlat.c
> > @@ -203,14 +203,12 @@ static int get_sample(void)
> >  	time_type start, t1, t2, last_t2;
> >  	s64 diff, outer_diff, total, last_total = 0;
> >  	u64 sample = 0;
> > -	u64 sample_width = READ_ONCE(hwlat_data.sample_width);
> > +	u64 sample_width = READ_ONCE(hwlat_data.sample_width) * NSEC_PER_USEC;
> >  	u64 thresh = tracing_thresh;
> >  	u64 outer_sample = 0;
> >  	int ret = -1;
> >  	unsigned int count = 0;
> >  
> > -	do_div(thresh, NSEC_PER_USEC); /* modifies interval value */
> > -
> >  	kdata->nmi_total_ts = 0;
> >  	kdata->nmi_count = 0;
> >  	/* Make sure NMIs see this first */
> > @@ -229,7 +227,7 @@ static int get_sample(void)
> >  
> >  		if (time_u64(last_t2)) {
> >  			/* Check the delta from outer loop (t2 to next t1) */
> > -			outer_diff = time_to_us(time_sub(t1, last_t2));
> > +			outer_diff = time_sub(t1, last_t2);
> >  			/* This shouldn't happen */
> >  			if (outer_diff < 0) {
> >  				hwlat_err(BANNER "time running backwards\n");
> > @@ -240,7 +238,7 @@ static int get_sample(void)
> >  		}
> >  		last_t2 = t2;
> >  
> > -		total = time_to_us(time_sub(t2, start)); /* sample width */
> > +		total = time_sub(t2, start); /* sample width */
> >  
> >  		/* Check for possible overflows */
> >  		if (total < last_total) {
> > @@ -250,7 +248,7 @@ static int get_sample(void)
> >  		last_total = total;
> >  
> >  		/* This checks the inner loop (t1 to t2) */
> > -		diff = time_to_us(time_sub(t2, t1));     /* current diff */
> > +		diff = time_sub(t2, t1);     /* current diff */
> 
> [Severity: Medium]
> Can the "goto out" paths when outer_diff < 0 or diff < 0 leave
> trace_hwlat_callback_enabled set to true?
> 
> Previously, time_to_us() passed the delta through unsigned div_u64(), which
> cleared the sign bit and made the negative checks unreachable.  Assigning
> time_sub() directly makes those error paths reachable on a backward clock
> reading, and jumping to out skips clearing trace_hwlat_callback_enabled:
> 

will fix in v3


> kernel/trace/trace_hwlat.c:get_sample() {
> 	...
> 	trace_hwlat_callback_enabled = true;
> 	...
> 	do {
> 		...
> 			if (outer_diff < 0) {
> 				hwlat_err(BANNER "time running backwards\n");
> 				goto out;
> 			}
> 		...
> 		if (diff < 0) {
> 			hwlat_err(BANNER "time running backwards\n");
> 			goto out;
> 		}
> 		...
> 	} while (total <= sample_width);
> 
> 	barrier(); /* finish the above in the view for NMIs */
> 	trace_hwlat_callback_enabled = false;
> 	...
> out:
> 	return ret;
> }
> 
> Because nothing else resets trace_hwlat_callback_enabled, NMI tracking stays
> active while kthread_fn() re-enables interrupts and sleeps, and remains enabled
> even after the tracer is stopped if kthread_stop() wakes the thread before
> another sample finishes normally.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261112121502.2070755-1-hwenwur@gmail.com?part=1
