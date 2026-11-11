Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370811;
	b=OOhJA/faAAiZwPgex8X60LZEojuMeiHhUqvgJ+dDXzUoXnsIUuxSSS31+Qg5I8PdTXFB
	 GJxLSEzx3R6o3j2BxokMzVj9rmr+o6UarIP0M2kOX/Ys1Fil9/A1UUb1zZPdoIOZwy4PC
	 GTxKCIKaM7poXiUrCZFWi5nuAPTMRPilCIP74FG7zB1+Kjsf7hn9oiw4Cip2yBEGLAxDS
	 s86QV0F4cl0dmAxv8nrya0y+fj8Z4J6EP/4ikujK1Ez4fX+xtOkuGhQEWEgZ127qsnDQ9
	 FnGvp/Dtqfo8HkncEhFZ9lFyNhV8q0qtzKtX1kaAVtD86qf4DvWAESWqXUw67zycZyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=tUypj32nZSwBas8qX97kQX7vq5hG+6Yam8/Va9N0Am4=;
	b=VgUjRoxTbZAx4Owd33XxP21krNhiFttp4pXeWtXONi7M3TwRyzz+gmmVVfNerAzbUOzX
	 tmn95eR9fRNyC/8u2pcLpr9kF4cPzxl8TAgTMXyC+jD4xJhnflbfNfFfz2foykbkbpxGE
	 t6Gvh5o2r9exh3kIgvJ+OYMT69bdi/8b8KHTzdMZZvILcBpZw3RrvyTEBg5tq0ME9ql36
	 y53WVfk629IYY8uMaqXF6WTgcP8toeddyMdNk45hhyvR6O+FyNa/0vX9VWSOAUvUwLEVs
	 j3MyjILx+0z2VVTkMFTOAARzDu74W43+bzXelYI+Tpk0ZVUVHC/acLZgBnWO0bJGgHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DuAb90Ve;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797B8606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 04:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 797B8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=DuAb90Ve
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b147e06befso1291600a91.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 20:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794370811; x=1794975611; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tUypj32nZSwBas8qX97kQX7vq5hG+6Yam8/Va9N0Am4=;
        b=DuAb90VeHrc+qtH8pge+G0aejfllD5jrMkLi84rI28ttRP25/FxzpBBqQGV1wkS9uH
         GmiqRx8H/yLEbwXnslX1R+0t429ftQSP+JMeyI/vQ4/6rdk9tLhrlrNEpCREE5cAwQH9
         8Jb7tiu2+dMq1a/1zAwsKOak/vuExB3bJfThE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794370811; x=1794975611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tUypj32nZSwBas8qX97kQX7vq5hG+6Yam8/Va9N0Am4=;
        b=CT4WvVUZ5Ozq4boBvDoMTTlq0YMYlR9KSXlHbgTr/KXhf8POMfA45JkUWz+JptHAsX
         uvvNNO5a01K0tbz0FB5jkzsQdw5vfd+QcYZlXjSkEzeWrflx9njA/ymnYAn0Zkp3YDch
         LE6w+SrTbigxEFDILXojN3RWLVn2qxlDsOEnDpmHucXdOs1QJWL17Dui5Ypl+Uw5TIIm
         8PHAFEwHe+/GEPNMchuafPTVV5TAEzfDOtvLv1gQqZZSzacHnpWFnOnMfsPejfrBuq8M
         7ZBK3AHDOJ4LNLCrXwtow5v5dgUnCioutpZr8V+NMLLE1Lof6ievnCQFivqjKWO6MldZ
         YC4A==
X-Gm-Message-State: APuU4Z96NDEL9uCpCUSFwYAAOe0dWzXEZH2q9OLmLcMYvEs5NkXmT10r
	xBagMy25tk1YKzeOL/A9XfBfHqpuijojZyL8/p3UJr/q4DQ7gZYGnvpkBypp7QoqIeyKy/Jsma7
	7RqI=
X-Gm-Gg: AYBFou3mb+H230BvtJI5Nb+iW4+fdzzszzAVJdy3Fnw8U6AAxWZqwhyVOxUDYZOPbv7
	mzQHeZhO/RC21ACp75GxCWSYavIPprEho8voTIRBWN+i9FItWNR9LT4ySaH2sY/HQCo9cE4imi6
	hWfAwkpqcbuumu0QmhTaF1tFIz+FkozOgBLDuYdLh24Rd7eFuG54dtymy4IPk6VkvEoO4oJEBAK
	kSZrRz/+asKh/OnzyLUBWPwpzHf9EgKyu8XHRFPO2XUkiMWFQDmsjmKa6gObRIhd+vwmxaolPi/
	zL71/vwGBfwr7ckuUYlUqVHm/njBIJXWm/oGh4k+yFRKki+yFsYSJMSAWJrhxiAb75BwrUJlVnH
	SpWc9R0Sl8KNBkcosIFOEagsku6USSVfSNbNgqqpIiEU/26mMSmUY8dr7TjWk5a3Hb5ltf//H0x
	9cR03ltF2ZT3BLXgUUqnVuodvQbuiI2DVCMKZjEAanJrSrsWZ/Vb1lVA6iAUcVJj7h+ZPDfYg7h
	SkCam4MCRHhd2dzQCEb51f83isoH0pRKautxh+Raxwf734hwEPvz7TgZexesFZkrEOux5aj95Yj
	fSuRfplEiItiUUXuGZGoirux3e+OmAEMOa10EEAZSFL8k7L6HgVkL7HrjgWq4rNrnvOE5w==
X-Received: by 2002:a17:90b:37c3:b0:3ab:413:49bc with SMTP id 98e67ed59e1d1-3b182ee2462mr1396102a91.37.1794370810775;
        Tue, 10 Nov 2026 20:20:10 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:ad6a:b446:df00:78dc])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e0d0e16sm2532464a91.5.2026.11.10.20.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:20:10 -0800 (PST)
Date: Wed, 11 Nov 2026 13:20:06 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Nhat Pham <nphamcs@gmail.com>, 
	Yosry Ahmed <yosry.ahmed@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Richard Chang <richardycc@google.com>, linux-mm@kvack.org
Subject: Re: [PATCH v2 05/11] zram: check mem_limit before allocating
 zsmalloc object
Message-ID: <avPshTNHkZ5O64Xf@google.com>
References: <20261110054836.1515030-1-senozhatsky@chromium.org>
 <20261110054836.1515030-6-senozhatsky@chromium.org>
 <sashiko-outbox-207587@kernel.org>
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
In-Reply-To: <sashiko-outbox-207587@kernel.org>

On (26/11/10 18:37), sashiko-bot@kernel.org wrote:
[..]
> [Severity: Low]
> Can zram_can_store_page() return false when mem_limit is cleared to 0 at
> runtime?
> 
> The write path does not hold zram->dev_lock, while mem_limit_store()
> updates zram->limit_pages under it.  Because zs_get_total_pages() is an
> external call, the compiler reloads zram->limit_pages afterwards:
> 
> CPU0                              CPU1
> zram_write_page()
>   zram_can_store_page()
>     if (!zram->limit_pages)
>       /* sees non-zero limit */
>     zs_get_total_pages(...)
>                                   mem_limit_store()
>                                     zram->limit_pages = 0;
>     return pages <= zram->limit_pages;
>       /* pages <= 0 is false */
> 
> When at least one page is allocated in zram->mem_pool, disabling the limit
> causes an in-flight write that was within the previous limit to fail with
> -ENOMEM.  Reading zram->limit_pages once into a local variable with
> READ_ONCE() avoids the second load.

I guess I can READ_ONCE(), but this scenario is extremely unlikely.
(I'm not even sure if anyone is using ->mem_limit.)
