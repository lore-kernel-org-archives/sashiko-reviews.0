Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F2E336EE1
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 21:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780090422; cv=none; b=u4h6cL8iriUDWQIaxCfp3ViEe8pWrMHSyCHbmxsdg3Mvj7gwOhSIoLRot47JZoVC0xLgDArZDs5H7ElThVJRSpGoyM0swg/gGcSzF8Q3caMajksWe96v4GbXdNZllTJSdStJzu/TF6n4xl/5JvcGcDDJC+72qE+RLn+9Q3JstXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780090422; c=relaxed/simple;
	bh=E/02rMCLOCCTLx/MMkXKw4+cNdDOuDTCpreZlE9RoLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PehLiZyVCYpcpea43asdLDjOOYo1j2C4w7cUk+xuS3SLXDf/7PAEmDIEIxbwcKUmzn29sa9gaItIDAPwVg1G+/7pQIS3TpTJeFIwODcxm6taOkDjTug4U0DtyfjkWj6k6etdBH69r1IIhf8lpfkv6KuwW/yDo/QdYAiMcg9mKts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sz7g0bqP; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sz7g0bqP"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso9824817eec.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 14:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780090421; x=1780695221; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sJ1D2otFLPuWEdsKwzPQvA/v2Ndyxa5XuPg8CM6LTTw=;
        b=Sz7g0bqPaFLTgEqkhyhNaOm90GnLGZtr1aztRV6SkXEDKCCEsrl6jBWAHgZ5dvlsTQ
         o2c2hAP0GXP5yUhx3LWmFBoV64NRjGHh7hmduxy3ZTO4Yt5mUm71+8qVTRU4deoKGbJV
         /KbNpTFuMXTV5WLqta/d9+qUMdHX+9cMqyLRoHUjScatOlfAJBU0M5zg0ubSo694wdfo
         Z+TFhiBEawTz7J4TjwrXBVhJzqPhpVkmDQNr/OcGfemW9T2m/lWkKHhh0jR496yyD10m
         kzXNCOEOn7kC9t/Mns55qNp+75jMezig+GndgUhCdZf+Xa7tobDSJvw/sMCAXihHA5mE
         0fIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780090421; x=1780695221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJ1D2otFLPuWEdsKwzPQvA/v2Ndyxa5XuPg8CM6LTTw=;
        b=gAF5CZ2z0Tr7+a5USAWf48NHI6EOHZwl29vs4kauBAF+RB218N94Et0obbIG6E05g+
         2a0fw0gBfyc6dy6E6Y8C3/zgSfHalbismktgE24zNzbwP6uribxay1Mn5IXQRWC+F3i/
         GQKR5QqQ9+tO22l0BCDvHemefjxyW+H/QFKcIp0Df6i2Ull4uJBbo66fLyWHCXi3P0+3
         XLRFtG+fpdz2wmtGaMS/Iv9s3lc4/atHSzoVv58UPp3GdrJUp3xhXafYNDSpSKvT4lPs
         dTiEvSBPuKczdPPg7WWFt2E0A6wrIqc6m20hOxhF/vr0PGVc5pfXTe4WECcReKRanAtV
         IJkg==
X-Gm-Message-State: AOJu0Yw93kYlR/nC7U2vNASjyQhXrk9yr9O16s7TL7lTkVFZmigZV6ox
	s+up5Xh3SqRS7Aha+r4SU0d+a1xGq/zVQcxaxTHXVAFYz4AT2Iq/P2zqzn+4qw==
X-Gm-Gg: Acq92OHUZ3+uVAYv06v3xDxJxw9THDvc/kIx3z49UKqKjXTd/i2tW92t0oa0zIsoD3m
	uGcE0/TK1hgf/r2ZkIP+9g7PHoKw4nM/fBbvKg4+YGbarRYL3Ez70SVrSueIeDLfBxJ7bFrlWYk
	+wWWNul0HGLbA7EufPA3tZR6+lsCSvGQW6ZP6symo8Wy0YV18ivSM2xMS2/NeBclHGHE8M1tzmi
	kQQ4RumLAXm5j3vktVz5yLLncrePwrgXIS0obDzlfCNmXiPwv3A6zT5Cul500Tzvi3dzpIcNZj+
	r7p/bI0R3tg70X/uzKbQcNNfoiNS93oustlgjLcEb1UKUtjeJgPygZW0hTGJNUKmJx4sQl/t1Ig
	zVpw7s+P7g/YAH9v56yq7MeDrFEImhyPXRFoCdFgSrT+3Az4k4FpOsWxssd99rseFJpwuk07WQP
	wp4WaopRZypXXYUpLBWftDG9wECWP8KkMrAwHGf43AJP+axqt4PDXP5wrh2S5qgAuuBcuCaNw/K
	kwhYi1RTGOPvg==
X-Received: by 2002:a05:7300:a10c:b0:2ed:a58c:942 with SMTP id 5a478bee46e88-304fb1df763mr494445eec.8.1780090420516;
        Fri, 29 May 2026 14:33:40 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:307d:2a52:8823:4a01])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2f2904sm2450179eec.9.2026.05.29.14.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 14:33:39 -0700 (PDT)
Date: Fri, 29 May 2026 14:33:36 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jinmo Yang <jinmo44.yang@gmail.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH v2] HID: wacom: fix slab-out-of-bounds write in
 wacom_wac_queue_insert
Message-ID: <ahoFk5Ox-TMtgKHM@google.com>
References: <20260528175945.2987781-1-jinmo44.yang@gmail.com>
 <20260528184231.1F0581F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528184231.1F0581F000E9@smtp.kernel.org>

On Thu, May 28, 2026 at 06:42:29PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] wacom_wac_queue_flush() allocates memory with GFP_KERNEL while executing in an atomic context, leading to a 'scheduling while atomic' panic.
> --
> 
> commit 70e9615b93de485ba1816f95e27e25b054df4b6a
> Author: Jinmo Yang <jinmo44.yang@gmail.com>
> 
> HID: wacom: fix slab-out-of-bounds write in wacom_wac_queue_insert
> 
> This commit fixes a slab-out-of-bounds write in wacom_wac_queue_insert().
> It prevents kfifo_skip() from operating on an empty fifo and validates
> the return value of kfifo_in().
> 
> > diff --git a/drivers/hid/wacom_sys.c b/drivers/hid/wacom_sys.c
> > index a32320b351e3e..489ca68f1560f 100644
> > --- a/drivers/hid/wacom_sys.c
> > +++ b/drivers/hid/wacom_sys.c
> 
> [ ... ]
> 
> > @@ -62,7 +62,9 @@ static void wacom_wac_queue_insert(struct hid_device *hdev,
> >  		kfifo_skip(fifo);
> >  	}
> >  
> > -	kfifo_in(fifo, raw_data, size);
> > +	if (!kfifo_in(fifo, raw_data, size))
> > +		hid_warn_ratelimited(hdev, "%s: report is too large (%d)\n",
> > +				     __func__, size);
> >  }
> >  
> >  static void wacom_wac_queue_flush(struct hid_device *hdev,
> >  				  struct kfifo_rec_ptr_2 *fifo)
> >  {
> >  	while (!kfifo_is_empty(fifo)) {
> >  		int size = kfifo_peek_len(fifo);
> >  		u8 *buf;
> >  		unsigned int count;
> >  		int err;
> >  
> >  		buf = kzalloc(size, GFP_KERNEL);
> 
> [Severity: High]
> This is a pre-existing issue, but is it safe to use GFP_KERNEL here?
> 
> Looking at the call chain, wacom_wac_queue_flush() is invoked via
> wacom_wac_pen_serial_enforce() from the driver's .raw_event callback,
> wacom_raw_event().
> 
> For USB HID devices, this callback is typically triggered by hid_irq_in(),
> which is an URB completion handler that runs in an atomic context.
> 
> Since using GFP_KERNEL allows the allocator to sleep, could this lead to a
> scheduling while atomic panic? Would it be better to use GFP_ATOMIC instead?
> 

This looks like valid analysis. Would you be willing to send a
[completely separate] patch?

Thanks.

-- 
Dmitry
