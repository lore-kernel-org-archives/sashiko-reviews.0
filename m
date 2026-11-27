Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745183;
	b=TTJlmNWG8irp02YpWBmpjPd//pe2o/2FpbJMtSeY9Fkrzrl+t6CXIqjcmluyssosVuGp
	 Q0qH+bu/ixwseU33Fx7abbK9Xnk/IqcDAXliQeHUYPPZCohtKtFyTD78h5Hh1xp6uwJnQ
	 a1icwqCOmId8YXO745x48xqAXtxVpXPs1Q3ddnO1uIlxX2ykJScGFJb2A28YUunry7juc
	 UJ5cUgJq1kmyTQItckepK3Gjo+g2Xaij8H9wCG3IgieYGfQIn7TtZrUbQMDTgtY2iKFd8
	 axSA/otLkl2CDqBr1sznvxz22SLQ7mxN8r7m+EfB1QKbhhivIG+r3UHSE2WFA5Bwwvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745183;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gi8i700zgzoGE4wii+o6F4mqGWTqx4rmov+vyFiH2zk=;
	b=bN9dKvdz1+Uj27fzuNwy77WUdotaSx/0R0XJozgFSZDei5oC2hUdMN5xLgKQKFoAEOrT
	 vrSj8/ncQrbXEI/0FMyp6iDyPqjceO8kq9eIgXZRd5nuSd4TzEQDHIH9sySHQ4khiJjWa
	 nxFjY57lwrJJT3hxSI5t+PHL4RZ+f9yLx+GOGEn17jb/Wcp1Z2/R4aAFQ7a0d0jeAw8h0
	 8p08ZQPtOYk8Vwlmbl+xCbvd3Vv4a7hqIl2fPE88oi1myPDj7Qxmt/3c5CK87RxzzHfCB
	 0TM1MQfKbIrvaqjFKBIXRFvngIVgsBzxOxOViX6D8ssAeQkFKJCcW282vAkPOZ1Xy7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Z0dl/2kl";
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D937606A327
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 02:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D937606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Z0dl/2kl
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso4303349a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 18:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795745182; x=1796349982; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gi8i700zgzoGE4wii+o6F4mqGWTqx4rmov+vyFiH2zk=;
        b=Z0dl/2klwSY6bDeXVTfXWMrUVFsylkgEqH9A+cskSbzrKUwcVvVz7MJ+x0ebxdVICU
         1fxB1oS3VOyT2CD5y0zUsAtsRWF5/CuwsnOdHUCchRUuqYLeUUxdXIF5I1hI+8nchDm1
         DfGZ6ibIhByqInpMDZMF1rQPgp4OKxeoEMsWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745182; x=1796349982;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi8i700zgzoGE4wii+o6F4mqGWTqx4rmov+vyFiH2zk=;
        b=EQkIlQAlxhRX3tFUs3ooHFRmxBTn1GmTjlviq2OmDAQXKzuoe5xgz2lhTWU6lF/5xh
         kctkCCNSHeF01z1TzdTSEVBmaISJiqfO5bivWhJWyhfd7NknwUQIMongE1BADnwH2IER
         wxNaO5zhYu2lsPXaQ6XrHsYW6FkVFpVybnQxb1NkmXgaFcWd7q/BfoGxEZPWFQtpVPxs
         TnepHy8Eji8t8rWRkrfT3gJXyNgajGpibwpTCmqvyFucxIYGEGhpcLIBWTIWyjk9cP10
         fbztEBCtXA16SPl8UOZZuQayiML7ed1Rt6bryXMLCxUjG1XRFjA34AvVry5uU+e1iUAJ
         keew==
X-Gm-Message-State: APuU4Z98vq+xwbraXJiOB+58nsvAla4BHgTx9drceQURlYhU3x+as9p8
	INuswl7wS2rUjXUv2Yit12X8JUWgspA+ohGpBAGCVHXkE90H0lgdejczfxcw7Qsao+IMkzd5Hn9
	4Lmw=
X-Gm-Gg: AZFdTZedapLu8v4UAlxN6964C8Jb9fWvXoWQlEe0UPaFG1M1wHPr/VbDG2fP5OJFPM6
	BL5B0GZhLE/Nj/ZX0Zx5Rfju4TvwB0omzX16uCkKsoRECPJIaqHOhxikGPYMB8mdZgGQ5GEolJa
	DwpESOQe7SEcgUy6ZxQIbInzQet/xgehxAz+DY7ru3wG2pfe8j8gupcJS7ZcrNWcjfnwl5YTd5r
	NTyJkrn8GiRuXxlhK9z/Ci/PL43C+u5zSelCoeXwGAxzlO9KRqw6jkzmzm3Tc7IkDV6wZqNHUUV
	qycTtkTbs8O9ikFx8GJvzh5prnV+QciyQiRfUCCRImSo0m43j/7blxwO1R37MEWYezByMKQD+G7
	toNrIxWsC/xHeK2Vc2KU0kai3MZHK8XcPoM6q1PCOWV7TLqmdXygaIn2VLNKt/01GNrHL/kUcC3
	HnE+diWyVYDg1RsDjimMbUV6bxvKRIOrWV8QbKjc5s9J1tBO4ojGLhbEO6kxWIABNynAPTlf7PP
	IWkN5EM9zOIvTccZCDNk+S7K3zjvilX+TMBF8d1ir4eFzL70o0xuul0ChAOuxrbDUequ8lR6pmV
	i5jo7zb4UHCKFjcU776JfpHnxLJ/WWKvMg9R7Ci9oZCRo0Vm6/Z9EQtfG9Xb6l+poKi5Bp8muFo
	2zJU9pPeKV3zAug==
X-Received: by 2002:a17:90b:5407:b0:3ac:9ad9:6afe with SMTP id 98e67ed59e1d1-3b41c961ed9mr14310208a91.39.1795745181825;
        Thu, 26 Nov 2026 18:06:21 -0800 (PST)
Received: from google.com ([2a00:79e0:2031:6:5bf8:984e:5bb:e51d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b52dsm38236079a91.5.2026.11.26.18.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:06:21 -0800 (PST)
Date: Fri, 27 Nov 2026 11:06:17 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: sashiko-reviews@lists.linux.dev
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	Alejandro Colomar <alx@kernel.org>
Subject: Re: [PATCH] zram: do not modify cont sysfs store buffers
Message-ID: <awjlWfhrLyoHcy_Y@google.com>
References: <20261126014518.1318583-1-senozhatsky@chromium.org>
 <sashiko-outbox-236427@kernel.org>
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
In-Reply-To: <sashiko-outbox-236427@kernel.org>

On (26/11/27 01:59), sashiko-bot@kernel.org wrote:
> [Severity: Low]
> This isn't a bug, but include/linux/cleanup.h recommends defining and
> initializing __free() variables in a single statement rather than declaring
> them "= NULL" at the top of the function and assigning them later.

Yes, that's a recommendation.  I decided to follow the existing zram
code flow/style.  Like you said, this isn't a bug.
