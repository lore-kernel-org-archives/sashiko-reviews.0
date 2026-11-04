Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812422;
	b=fYnnUZ8eZ0fgo4aWv80w2cV7487sXqdu1c8YmQDWeeF5z9/8m2ZsMR/+/kxyu25B/1Zo
	 otLPRKHaTm+WDC8OzZAiXxmFo4CFQ2RIJhxvTDgk+OCXKks2ydgsL52vFAGdta9gxXEbw
	 wUHJnZ+yy9ojU5qvFiHls8Cl8tvaxOsuCfa2MP29fThL7PQMsfxu9m2igsEURPeTa+//7
	 FG8w2dQzM8ytc+j6NDkdE+K/gVysZUgZXaW195o9VZXYobbiBNlSvefVyUgw02IInr23x
	 DgbN47Ms34alcyqKKIdstss6YaE+k/6PdYX53POcG3d8xZ4F6VTGFxE8HZGo50jhtlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Mo6MQgSQwly5/Nd50C4GzzMt65d3gXpbq7S61K6m7jk=;
	b=B1XbVQY/Sx7bECy1gGYT0axoINBptpdggfoA9IOLxOPxFZyidOTscpSr0/rGJXNcoyMZ
	 4QS7tnb7XZ7wAbbmTUNcjmzjrv0FEpX64bto7wH6ObLM/x8TgbN5JZBgi+mGqBRWJbyuV
	 uHq4BAPMC9QNZV2ky0x9T0VGwYBaz+46m0+HYREQE/pUMDkC01UR6wvTVz8LEtlQ43Oev
	 sENk4obmbfcUlgCAWZXvv3sSb21cJOkookLwCD45/igMwvthSdyyOf6nrHSqGxHgflNa1
	 r36tMHTRs1WgbOwnNdDnqcSvyDtvcQBAoTT4JiB0Z69pB54Uscubd+QVgW8pc2Zh2cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMnNuP8B;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C813606A32C
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 17:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C813606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMnNuP8B
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-14fc585291cso929654c88.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 09:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793812421; x=1794417221; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mo6MQgSQwly5/Nd50C4GzzMt65d3gXpbq7S61K6m7jk=;
        b=mMnNuP8BMwtTEIIKmt9fAu0xTtlZrG6I493YNTPEveb0tIrkQxTFuHypgN18pLwHxP
         1seuFGIXXFpYci0s1oloPL/0uj7dFrij0tL16V7CqEE/DQjUs1Ah3lqhXHqBUv0PQl7c
         zx7hdCqjIAjVWuxmHRbBgx8r/k1N5ImDoHdHO1CBH5l6kbgQaAhXd5gxUAPlDkX8EXN2
         gZzRXPtpUXxg6ixNP9S2LiVlelMpIHOHFrS44AY9RwUCFDPDqCCSHXoFJo1qvuj6UcPr
         6DadQ2aLyCMXlzXLmkgbKKx/2DSuMznJH0ur+3sI+J6Xh+PT8WraExwKvRhjUC6xUzAR
         llPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812421; x=1794417221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mo6MQgSQwly5/Nd50C4GzzMt65d3gXpbq7S61K6m7jk=;
        b=iDlBbjUvhRQfKoOXyTrCU3dBHJjaTmPxJdgO4XPXExcFFhtMa/knQ7zIkIs+dYdb4Z
         QSJscLe/Dj3Ztt+p2YkzJRdq17kjf65VOhd8tAAadVh07PEB0Pv0N/3U/R9AbmB541hx
         GNacKNhyua1sGl0XD+gE6rudmkzkQRB5YmMmovW2OkgJ0Jsq4sEHhRE1J8uj7yu8tICC
         NqMsEKte1T/TTHOgyfNIDuI3dJoXrejQ6wsV0ueO/6HlHINCe1KoT8z9M1a7KUiPwlqi
         Em1g9NAMTn2QstMEEdnXMk5BddxiWTHT/2BwJePrjQBNNJ45einfwO6E7iKPnhV1aXce
         TyJg==
X-Gm-Message-State: APuU4Z/XCjD3sOtPZfR92DvwJWs5HtYAGsv2B1joxJPVXh0aP9cVoMuF
	5vaUhBprsIcSYi0mvO+u3TTLdL3t8WsJYOlF/LZPpmMoWA+njYhWVYGG
X-Gm-Gg: AYBFou1EPmFKyHMiLRUdjFhWpJDLq7aiz5TrCB6uog9j+URiYzZvfc5qFyO0BrZeoR5
	yHqpiiQnvzF8pBOKdo9XviZmzg2qQpMbrscetQG6YExAZDzkOBmCdbaC+asK9hl1CUOwkhgymqE
	x6frgz1zWtD77rZomzNtZEJ2hoHkyKbYJZGprsUVk3eriHOV3jGpcGJTgoDnPtugFnX5ydB9Aj/
	KRN1Bc5ZadoBK2uVod5p8tq4/27rnPoxHSXDtuIHaC8XR7vRyRML3c4MGJcZQvEgZcCdRuD7NBA
	2DeLnENoa4NvPrvKaLUPbxLkx6I9Vzf0s3nBdxCbrugqXjWXDbX3b5Vk1mgLcC5d1Vt9EkMAt/i
	/61KwEbtxxUe0DE2zCn17fBRbdev7A2jMmLW/bJM2qP2JHlQ8VtXdIkVFAU/mRqJUopOIKWnAKI
	n7sgvVMv/v7sXVVnXzNJIGsAeoa7DrzKwgRMHCgofuW7s2ohBkJ0JFuYBSMVmv0rrKT8NMCGEpq
	dXvqD0d2H5ihGt57s5N25IXOTGwVQrVjSCa6JbjORdg7VgfgFlRE/SSGjeB8A/gjX9oUq/+sfwK
	5ZXUUoSJMIzgnUjwjgyq9jpeeXoaoE0Fefcf4M4W5vtHVU1H9kzeTaLzqcmq0yuAluYO
X-Received: by 2002:a05:7022:b05a:b0:19c:c396:37aa with SMTP id a92af1059eb24-1ac5d1d058amr24439664c88.22.1793812420949;
        Wed, 04 Nov 2026 09:13:40 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1bcedsm9021788c88.7.2026.11.04.09.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 09:13:40 -0800 (PST)
Date: Wed, 4 Nov 2026 09:13:37 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 6/7] gpiolib: avoid krealloc() in gpiod_get_array()
Message-ID: <autm__StHhgBMcdd@google.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
 <20261103-b4-gpiolib-free-v2-6-ea46767c9cf8@gmail.com>
 <sashiko-outbox-196636@kernel.org>
 <atiydn7hetz4pfgpgybjfcdcwugp3rnqqbovtm6h45kaeh5bov@tqkc4qqm5zbx>
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
In-Reply-To: <atiydn7hetz4pfgpgybjfcdcwugp3rnqqbovtm6h45kaeh5bov@tqkc4qqm5zbx>

On Wed, Nov 04, 2026 at 03:23:26PM +0100, Bartosz Golaszewski wrote:
> On Wed, Nov 04, 2026 at 03:48:34AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] gpiolib: delayed initialization of __free() variable in gpiod_get_array()
> > --
> > 
> > commit ab11568406b8d4aa5255ce95e09509f3e6c86285
> > Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > 
> > gpiolib: avoid krealloc() in gpiod_get_array()
> > 
> > This commit defers allocating the gpio_descs structure in gpiod_get_array()
> > until the first GPIO descriptor is retrieved so that it can be allocated in
> > a single pass without needing krealloc(). It also factors descriptor
> > allocation and fast-path checks into helper functions.
> >
> 
> ...
> 
> > > +			descs = gpio_descs_alloc(count, desc);
> > > +			if (!descs)
> > >  				return ERR_PTR(-ENOMEM);
> > > -
> > > -			descs = array;
> > > -
> > > -			array_info = (void *)descs + descs_size;
> > > -			array_info->get_mask = array_info->invert_mask +
> > > -						  bitmap_size;
> > > -			array_info->set_mask = array_info->get_mask +
> > > -						  bitmap_size;
> > > -
> > > -			array_info->desc = descs->desc;
> > > -			array_info->size = count;
> > > -			array_info->gdev = gdev;
> > > -			bitmap_set(array_info->get_mask, 0, count);
> > > -			bitmap_set(array_info->set_mask, 0, count);
> > > -			descs->info = array_info;
> > >  		}
> > 
> > [Severity: Low]
> > This isn't a bug, but in gpiod_get_array(), descs is declared at the top of
> > the function with __free(gpiod_put_array) = NULL and then assigned later
> > inside the loop when i == 0.
> > 
> > The cleanup.h conventions ask that __free() variables be defined and
> > initialized in a single statement at the point of resource acquisition
> > rather than initialized to NULL at the top of the function and assigned
> > later. Could the first descriptor be fetched before the loop, or the
> > allocation structured so that descs is defined and initialized in one
> > statement?
> >
> 
> Hi Dmitry, please follow the cleanup.h conventions here and in the
> subsequent patch.

Hi Bart,

The convention (combining declaration with allocation) will not work
here because that would make the allocation have wrong scope.

If you want I can move declaration + NULL initialization just before the
loop. The topic of pulling allocation out of the loop was discussed with
Andy, it would result in duplicating the code and making the result much
worse.

Thanks.

-- 
Dmitry
