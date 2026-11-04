Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812493;
	b=bz5ghsnp7JIuYhmmVkwzjMriRBH2hHY9QHr/PRQdTKUL1VOlZM7K2S5XF/XyCJ0WPk2/
	 +gJ16PDCQAerqp9r+djC4d9e43I/67NWhpG0Gjy27lSQjqEIqOx/pRzeW2QKg12M2htiy
	 CPWB2rXp6/Cfo5gSFsDLLvnlq7AGsmONyBc/88tPK3iw6vYuKxZCIYJhxG7wSM07+GzlJ
	 wNTIe6MECWGuTlWHr4izTJClqiJ35MVR4EML2AhtEp2vW6eqC+m0+5z8x8wzszP6PgM90
	 GxSITPJdzXSS/XHAqN6/UQV7Sxm6fatjPGLgv++c3ZzCjNm13RXzdQNSQxv+XU+Ydhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=8Tk9o6IieBArsy5b1SnzwwFbc9EAPjVVFMVTbmTMARw=;
	b=WOhvu6OnHRlboC9vH9Fv3ZHDZoD2A2rPaNSgPELM0aBWKRzBnUSHErAin5aI74Zzj2Iz
	 K9K++zaGOpgd5GOG1+0Y3TsC/RILJuEXYeDn8uw9CT0ytgu3O05hUN/VCiPZokDLXpNvo
	 3dH2PR9rVGZkvPllKFdnE9uJ7bqmyZvdd+tsw1qp1nXma8SapFiM1fzZkRVxwbvcAPUyp
	 8AxQZJq8HYJ5xUYmtHtiUP37JN6cInaO2rbqEXu6FMRnWSZKYWPzTTqGq/+Lnnn+yWYn9
	 xFnsdd8aTsZgTy/pWCwMJ9zgRapiDgAEoRAtAdQY0LMRdaWFdm9uKLOeLCTV1CTpDVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfiBCkzT;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FC4606A330
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 17:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93FC4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UfiBCkzT
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-35c76e9614aso1235677eec.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 09:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793812492; x=1794417292; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Tk9o6IieBArsy5b1SnzwwFbc9EAPjVVFMVTbmTMARw=;
        b=UfiBCkzT8mudS3OiLHm3BLd0L9Q1A8NRldmZ+w1u+W1fYyZKuc7zZwIMWFF/Up6eVD
         8xAdLtUbTRoANZyXlvtmkw/LdqP3RxcLZDla4LpyWr9EfqA6KuURrA/BTvPg6YNJ+g4J
         iukdBYgUOFN7aQtNwCxj4EGkb3h5AAiO8fNtzgR6tiXLqGA5Sq32CJH/aTXWl5DXuWTy
         HaIo9gUYgw2jWZNAaZp89PtJaIk7aDEbAFkT08Ii5E92hYMZUSgZBuZqcB1JYLEb15Pu
         BHSiWt7Wrk7RPTgBFlDIQsezx4NeFqAtceK0QgVCWvVA20pI9oYQ7lDACYtaMAvoQn85
         Vf4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812492; x=1794417292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Tk9o6IieBArsy5b1SnzwwFbc9EAPjVVFMVTbmTMARw=;
        b=zQWlzXM+j55wGWbOIp/1LzYilE7achYdteAzm5ufRHyuDTcdTwE9g65hA3VhKOLMZO
         3aFaVB9UAGrKpExpKDGxbcs1hr6fi4CxRBUGqa0zaI09ZkNQJEmXB37wMbcAxqMEqy1u
         pyf7xOkmdB6K3CgjkXEZDmwojYU1QDSMY30bQS6yBV/E7uQ15lqyRRx/vJJyo0ricLyG
         E/mC+jijTpmiDVkpBbdrSboqAy31Nwxuct66o4qppitcfXWa5htU1MiIpeSq4fmxNKvZ
         JpeOcay5Iq6x7Dz61qJ6sClNPYRkeguSlC9JAeDkT5aqHV4VNQxV/uxu69naf0REFHKe
         1twA==
X-Gm-Message-State: APuU4Z9sy3fgFj+xx17NhJc/h1um5ACYsREUjh+UOqJUvMYhf0Z2elXR
	7dr50jbfwj+gKCUXOgsKFm9jHNyrr4T/D2wYz0ZtDBhBOUjz2hGVPgYD0/vYy7Vx
X-Gm-Gg: AYBFou2LribMrXSGL7/c/BkFgksu7e94nUKZ+RGn1bHCqilKSVNc7tvuT1+oJRAnSB6
	KmyolGEQQbZwXeV2r4zXDJx7C+lm8K1waZb9nfcOPx9AM0bcVdPMDpROjXCAvMvkiGDLWnGGoOw
	HqRgwtmDfvc5iyTa4Je/OyFmsbFJTMFyTiWYRfxiY7E5f2Nd0ra0asvF5597k/8CclrF0YNMhr4
	tIQPLzrq/u9rtqON948dwD8myBYSCmXqAkms2H+zcApM7oaRMJ+7kmrvi7vf+XwHRunOTjxkHAi
	CiRX161NkZwMSI8PtWiqAhgWKxSyqWZIH1saEHYRJLVz+a/N0rpKSLNZ3o0BA/slD5YWB997inz
	uyj+csgN458NbW9Zymk+0wFSp0rAXVD6Hi9pZfNbgs2XabLYJJ2zmbQqYhlKYMZwXw3BygSv1Bb
	zWZuScrgTTug35u0F6K9xH13fFxUs3lGBQZg9LxaoKnTmG4kmQ022ftkF/mVjMCk9+8ZTjuL5d2
	MfSqLDQtAMmIJ4UWqp1BkOz9wdNmVF1V0sdYyhK7X3zO2eGai6rhOstlf1dJUiJ2ZKZ3S4jwIS5
	a89gl9yIgG6DDCpOQCJlQPEsinpZTYub2PrNq+/c9aO7CkOl7DnhvVk+vsqlhSYrqwxx
X-Received: by 2002:a05:693c:8803:20b0:361:6884:78b1 with SMTP id 5a478bee46e88-36a423bf728mr26348620eec.28.1793812491370;
        Wed, 04 Nov 2026 09:14:51 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9116582eec.13.2026.11.04.09.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:14:50 -0800 (PST)
Date: Wed, 4 Nov 2026 09:14:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 7/7] gpiolib: use bitmap_zalloc() for fastpath bitmaps
Message-ID: <autn9QXRkZuYFD-1@google.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-7-ea46767c9cf8@gmail.com>
 <sashiko-outbox-196638@kernel.org>
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
In-Reply-To: <sashiko-outbox-196638@kernel.org>

On Wed, Nov 04, 2026 at 03:50:46AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] gpiolib: define and initialize __free() variable in gpio_descs_alloc()
> --
> 
> commit 014858138dec2ff00e5cb0fd3fa050587447ef44
> Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> gpiolib: use bitmap_zalloc() for fastpath bitmaps
> 
> This commit converts invert_mask in struct gpio_array to a pointer and
> allocates the get_mask, set_mask, and invert_mask fastpath bitmaps
> individually via bitmap_zalloc() instead of a single combined kzalloc()
> with manual pointer arithmetic.
> 
> > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > index cf311c1a707c9..bba4e5bb125f9 100644
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -5208,13 +5208,28 @@ static void gpiochip_free_hogs(struct gpio_chip *gc)
> 
> [ ... ]
> 
> > +static struct gpio_descs *gpio_descs_alloc(unsigned int count,
> > +					   struct gpio_desc *first_desc)
> >  {
> >  	struct gpio_device *gdev = gpiod_to_gpio_device(first_desc);
> > +	struct gpio_descs *descs __free(gpiod_put_array) = NULL;
> >  	struct gpio_array *array_info;
> > -	struct gpio_descs *descs;
> >  	size_t descs_size, alloc_size;
> > -	unsigned int bitmap_size;
> > +	unsigned int nbits;
> >  
> >  	/*
> >  	 * If pin hardware number of array member 0 is also 0, select
> > @@ -5224,25 +5239,36 @@ static struct gpio_descs *gpio_descs_alloc(unsigned int count, struct gpio_desc
> >  		return kzalloc_flex(*descs, desc, count);
> >  
> >  	descs_size = struct_size(descs, desc, count);
> > -	bitmap_size = BITS_TO_LONGS(max(gdev->ngpio, count));
> > -	alloc_size = descs_size + struct_size(array_info, invert_mask, 3 * bitmap_size);
> > +	alloc_size = descs_size + sizeof(*array_info);
> >  
> >  	descs = kzalloc(alloc_size, GFP_KERNEL);
> 
> [Severity: Low]
> This isn't a bug, but cleanup.h conventions prefer defining and initializing
> __free() variables in a single statement rather than declaring them as NULL
> at the top of the function and assigning them later.
> 
> In gpio_descs_alloc(), could descs be defined and initialized directly at the
> kzalloc() call site after computing descs_size (using struct_size_t(struct
> gpio_descs, desc, count)) and alloc_size?
> 

Yeah, will fix.

-- 
Dmitry
