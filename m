Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288728;
	b=3/1u7uDzUGt3Fwzxtj5HoBKCJ1OEkEhVdXrXMwfg6fVE8B656VGLYVRXzbHPTrkGVarE
	 6uQOelHPKVIjgbWGWXYioDlaZ0LixvC6pmJQYUKwNYJl2J3AdisarYUr84uhU4bhSE7X5
	 jacvl7uI+vSMeIdNsBl14sjDz3tL614WbxSu3UwK0c/U2L1DdEhyuyPsVQ/hz32IX/1Xo
	 3+E8A08uqsepOEt0l+Ek2VMVt6AKAVA3yh8kCn6ULkA8ZdUZXlzuaUqiiXpTKbJC74PGD
	 Lc7lQS/2IvLHBwsx2z6lO8dJEqYwRQ7RC12OlnDnTwbEvGbc3XZ3/L99xTeKvR6n9Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=xnocq1WZWdoAPVGSUgOgkKPWt/rTa6IdAGYk7ooAxeo=;
	b=3ufIFPmhqpr9VQFGYr/WRtxCmcNuhg6RX2Xt7Xust/H0++hRJzTsjQsK2hNTAoNie8ad
	 H4uTn1PuBgqUfPV/UvD2ETHwJK+UAxfR4IwnpbVc9VbkseXEWYzwJCiUlZqJl/HGUmVjN
	 EPXqNeZJ2ayNoB0iQLS32FCurYBCnetFLTn1oYGuikK0U7WW/rNo8b2XIcTTjwKSISjVk
	 EU88CQjGzyBREJwoQiUFHNyM4qrW7FJ/6vRaEmf2xMCg53WVqmGuw00DZmcwS9yWWkJC7
	 kEjZGqRgBYrxEW/ZnQDUExnDP6KncBtuFmHzi1JdZBxmKfmrA4EoOnzTK0bgJZlsufw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Tb6xAAqz;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00065606A325
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 05:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00065606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Tb6xAAqz
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a070781f63so706244b3a.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 09 Nov 2026 21:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794288726; x=1794893526; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xnocq1WZWdoAPVGSUgOgkKPWt/rTa6IdAGYk7ooAxeo=;
        b=Tb6xAAqzET9+OhRFZm7ig8LuMcWPnyt9KH12RpM4nhzmDCzeLA0D3A7T0O/TUaOyaC
         j71aOgc0euobQjFdXujaQQX4lLEobsI93/AuhxZzoWb6waqcTtacYma9bCXCghjvbUCE
         y8a3luDNGzbaCQD8l3Qxn0q0HVZLOzPVQJbG0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794288726; x=1794893526;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnocq1WZWdoAPVGSUgOgkKPWt/rTa6IdAGYk7ooAxeo=;
        b=uw8Ql+tZpp9s16Mgk+1G500UPd9Rx0F+fkpKlb0xTpKnwL6FfIQtJ1j6G/eu72JIfZ
         QxKpwd35TB/zfX/7/9N4GkwfeGk+ppAUxpQn+l0OaZNhPD1+pxnyJ7zGyhdPqHrE6end
         wet4wcSJ2RVE0heG6OdUue/oPruRhmUDefpm5iI+do5CyCZSgMHEh9JHMep204stl1pG
         bp82LtNGwwlb62RSHcnHxZwXudyPOp+vlrdWnDSpE2DDmuOhy92Ye1q74woKewleex9T
         bKhF7ToBQAaJihepB60GMwIv4OZpZcaCzaRw/ze0plywYJlsUJlFo8Tks60MNUc/Ztoh
         0eEw==
X-Gm-Message-State: APuU4Z8Scj6nsZDLDTjuDCr/ziwrCIfb9+rJGEr9JfLTH2lWtaUBxwgL
	uU6B3eVK7Mt1+BVXXrcXnFkqWvxf4HHLTgzdx4tbt0DQXCrF65c6SZHcQI8G9EVi38Qp336u5sP
	Cv4Q=
X-Gm-Gg: AYBFou0Jyw7M/0yKxKey85Rju8KoEh8/8pwFSZuk1eP+PglHMwH5wdfUMTGhHeGvVT2
	Vit/cqMfoLazmBRn2hBkGPn4RAEhXGGH1SD0NyYMzESkkMmvaoqbbBw84RhPjKR+oB9e9n12H5+
	ZzZzkgFrk/HUMf9cj3b9B87eIi0uF3/ugbmFjUmi1M8SZUetjZ2250pe85P7OgXQqvctL0ou7Jk
	g2dj+6JqtoDTLmUw/qbt9XUG4rueNPv0llX6SkqOLXZzYVzui9l0UF2e7rwMLVjQZQNLV8VKURR
	f8yl1phYTvC+EIoj4AAqzzMuDSq2bwl+SfLmCgkEFxwHAjQdHpFM3jIg68nNroRDRn6EvoCfpDu
	NM2lmt5siWM1n/CTq2GtHBmtKuaFFC2S25RlPcEh7SVufOOIjbpq/j2Sv7t9Y0hFmUGEyjutd7t
	aHKB0FKC05h5KOPe3Zmyut9tKYvlfbvejJLiRySCZ57tBnY91EKPb5TIAmePuN9VYe+x7CkZGVI
	V5ZiaywHE50452g0a0UvUZxKLFoyJJRZXa2p/IUker3nYltq9MMQMD6dO9eghbYD1Mwj/HQI2V4
	ykDAD4YxsEJ8QdbC7wsYmPpqaQtk6Iu8PMRWqhuETtCaZE09CSTrzIqGQ+dG+Lw7/+EcvA==
X-Received: by 2002:a05:6a00:408b:b0:8b5:f9b1:a8cf with SMTP id d2e1a72fcca58-8ba87550f4fmr1854484b3a.51.1794288726218;
        Mon, 09 Nov 2026 21:32:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:e137:9384:7cd8:6e40])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dccc7sm400979b3a.52.2026.11.09.21.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:32:00 -0800 (PST)
Date: Tue, 10 Nov 2026 14:31:51 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jens Axboe <axboe@kernel.dk>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-s390@vger.kernel.org, Yann Collet <yann.collet.73@gmail.com>, 
	Nick Terrell <terrelln@meta.com>, Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Eric Biggers <ebiggers@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, David Laight <david.laight.linux@gmail.com>, 
	Sungguk <sungguk.na@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v2 03/15] zram: lz4hc: reset the dictionary stream once,
 not per page
Message-ID: <avKrj0h8fBNSrfCi@google.com>
References: <20261106-lz4-vendor-upstream-v2-0-ee04c3f0d7dc@samsung.com>
 <CGME20261106144252eucas1p272c9e37d66ad385db070f941879aecb1@eucas1p2.samsung.com>
 <20261106-lz4-vendor-upstream-v2-3-ee04c3f0d7dc@samsung.com>
 <sashiko-outbox-201613@kernel.org>
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
In-Reply-To: <sashiko-outbox-201613@kernel.org>

On (26/11/06 14:49), sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Medium] zram: high-order memory allocation using kzalloc in
>   lz4hc_create() [1]
> --
> 
> commit 2f51683dc7418bdcd0730283cb7003d8754fcd5f
> Author: Michal Wilczynski <m.wilczynski@samsung.com>
> 
> zram: lz4hc: reset the dictionary stream once, not per page
> 
> This commit moves the LZ4_resetStreamHC() call for dictionary-backed
> streams from lz4hc_compress() to lz4hc_create() so that the stream state is
> only reset once at creation time rather than on every compressed page.
> 
> > diff --git a/drivers/block/zram/backend_lz4hc.c b/drivers/block/zram/backend_lz4hc.c
> > index d8aa01bb258fe..06286c805cf7c 100644
> > --- a/drivers/block/zram/backend_lz4hc.c
> > +++ b/drivers/block/zram/backend_lz4hc.c
> > @@ -72,6 +72,7 @@ static int lz4hc_create(struct zcomp_params *params, struct zcomp_ctx *ctx)
> >  		zctx->cstrm = kzalloc_obj(*zctx->cstrm);
> >  		if (!zctx->cstrm)
> >  			goto error;
> > +		LZ4_resetStreamHC(zctx->cstrm, params->level);
> >  	}
> 
> [Severity: Medium]
> This problem wasn't introduced by this patch, but should zctx->cstrm be
> allocated with vmalloc() or kvzalloc() instead of kzalloc_obj() [1]?

That's how I have it in my local tree - vmalloc(LZ4HC_MEM_COMPRESS).
Michal, I suppose you don't base the series on top of linux-next or
Andrew's tree?

We reset the stream when we setup params, so I don't think we need
to do anything in lz4hc_create().
