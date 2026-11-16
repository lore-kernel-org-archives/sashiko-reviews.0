Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828464;
	b=4MpHPepZUYZ24NkR54Rtd9ISuXcru1fHiY3QkbQov+zKYMA+T4aiOB9jW750JpTBvRmN
	 B5kbyX1MZixOQynIdQp70l1Begle8WEFLMH80JTvPwRHqoUex2e9NOX0C/mJqoaDsdGID
	 1ITbAiwVfumhMfqrbs8jer9mnBiDd9odhjGZVF0WTp/qCviM1Ste2zi+ml2duZzLAM0rf
	 9j3jU54QnSMLfUJILcvNHxmsvTZyCBA/xbhm/Oci7bfHZbiP0nj/GvpYwDKWwn0Qr/L5N
	 8kLA5taqw6npE6D223nT4hQkQO6qBtBN/VvJCZ+w4AZOVxxY2ukwvRVEYsYJgI8pT7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=5BStpc8jowDmC9B6cxbOb1co1bGTg3WHKFG1Ve9+btE=;
	b=Zj0+NJhxa4Rf0TodxJHSRIeiNKs6mISiPNIeoj8yaIwjlTIfq1NCr8hSHTySD33igoSx
	 M5MlwzAYHJmIv/9m768mqHcrGKqrog3cIMvktvp7i8l0wMw4oHlliulluUYIb5Igv9eRX
	 LnaVKwHt10EUVCdq6WodJz8Fo3w0hwk5V0EuQGQ0mtE636po9pcEzKF1j18YQokHgSjgU
	 6QYQAKhUp+DaTgNDB8TCUS1gc30AJRqAP4rxfrsH8MwWcJ0xvPT4/l6bXVMiZpDBDH39V
	 MjF9IrZIDMZ1RLf8Tdz/EUfTsLUpge4ydnk9+JPr0u8ft/CWdFmZ8pimZE0O38KH8Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlLDTAZ6;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D81606A887
	for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 11:27:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28D81606A887
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wlLDTAZ6
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b094d5f1b4so661021a91.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 16 Nov 2026 03:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794828462; x=1795433262; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5BStpc8jowDmC9B6cxbOb1co1bGTg3WHKFG1Ve9+btE=;
        b=wlLDTAZ6dVo/IfiZperTVHwywTLaSXK9o+NPphf560iieFxXLei+3pP6TcW0WCqa5b
         +kUciIH+0r0ZVmjwymviWYJp54Bv3jRRW2uQWRxtbAkaTMD7DfFVa5b1GkDkznJ+TODY
         s45DkjyseCNvk0Q00YfFUkxsYejlEnlweYuLZPUy3fxxLI16zQvdvzoa7aGCY6e9fLzQ
         bsmhdmCqy8/MwX0yIQbleKWmeB4QTZ7Tffs1OvyCKJf49UzMNN1T2lov7W2To8oksZ+W
         9UbivHAN7tVrJV4B3z/4uiSvxv2Ml/ErwRnsYweEEkmMI9syo+PX3bOiazEe5bD/geXM
         tKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828462; x=1795433262;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5BStpc8jowDmC9B6cxbOb1co1bGTg3WHKFG1Ve9+btE=;
        b=NCjwdnJysLRQ7UhStvBcDBs81jC9Yx5jf9BWx3KGLwqrFn6n7iEzpMOdo4xZWrLaye
         AHWbZMXiJvc+7Q+b39A/3KytDkpY5ecS4HZv9SpyrhdLshWj0IevMVOW+dADEIjVJKQN
         2iigfBjgixojQIegZqu/DNoSKwEM9W6Vxg3oELc9G+Z7ku2N/uFtwtPgs2l4c9ML/3kr
         HiSbHF/bP6pSpXRDJggEruRWIgbS3hceLrpkkpooE1EBp5D+TeRWUBNEk6MQaZdCREyv
         SqgpTE5BMWYozrCToUszBRa9PUoXuGJWNO2HCIdDsKAAYjHzmEOPxofHuxltVP6yR06Z
         atZQ==
X-Forwarded-Encrypted: i=1; AL+hErH/48cvdBUlYLG0xPjCZfGZ2GmHwv2FuePIJ9jZnFjkeeQd4hGK5u8F2M8LDU85z3B8p3id2PfZ/JjTbOaUz+c=@lists.linux.dev
X-Gm-Message-State: APuU4Z/q+n0BqrkdjKRhbls2DSmIoWSPHXTqn7j5tRA0XjCHFz7iHmXZ
	B0DOxZOW2gtu030ieRSTIyAJWI5hIjIpIGtxnnYn0W46QIEkj0FfIFvc
X-Gm-Gg: AZFdTZcgKvR7XPeFvD3jM/RXZo4+dgd/h5JJ78P9wxT1jq+lrkO88O2axk5ViHgtIII
	1jDXki0rW52ULKYPqwddcc+2JDC5ViGBVOOFJzTjmvWv2iN1Y9c3I8ynijSIoeMjRvG9wq8FOOd
	aR8dJ31z/Rl8HKlcWgGz9vSYMB1sLWnOvQdnemkOGqRo+i6e7YsJXKxIVapwjsWXr0w44rALklJ
	v36+oc6Jd4ixYhC9/3wnKrLMs3miUeVeBBo+sanAGfA48AdD4cMR2WvSDWLRU8GFpOUYJb0BgVh
	c2xr6SCfB/DbWrlw1h3Id/P6QxSSQwufl5KUZ17n0XoXiUTGyD6Tv5EZpOty8XDXsLjeE8Uo2Og
	y9NVMKEF2x2xW1NAiQ2G1zQpMd4x5IhDeD1UWVEYt4bKb/uYIh6KuXfKTEyeByhdPA02/0Y3qfd
	sScixh84zoJuQTxv9PcYz1c5XGYtyV4pTLC6efvlgamwUTbupZ4kfjxn8rkuGv0wIdkYuDQc1hj
	gyPu1Z2CGc4A3HfTeuJ9mXymyjT7NWirv9Q+99z8mgif0d20hXpSBmSLeqrdYWVHGff9xJHBLJa
	OqG3tyfnpVARaH8HYiKsVw6uRZG2IlY+VEqSwv0HmXUWhZ4lh7XlbGdzx8Jzqu3ldvle+hFIlga
	naOa/Zhf+Ls3tsMSCJLbxmyGBVlUN3iCqDznRr6XYlupRK6fUi3BxS/1inoDFdg==
X-Received: by 2002:a17:90b:570f:b0:3aa:f2c4:12e9 with SMTP id 98e67ed59e1d1-3b1b0815b4amr10210516a91.3.1794828462318;
        Mon, 16 Nov 2026 03:27:42 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm8411247a91.3.2026.11.16.03.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:27:41 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 0/3] mm/damon/tests: add KUnit coverage for age_ms
 filters
From: Aveline Noir <jm5905938@gmail.com>
Date: Mon, 16 Nov 2026 22:25:52 +1100
Message-Id: <179482835290.151538.5686597403158226303.b4-reply@b4>
To: Jason Angelov <jasonangelov@ucla.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev, SJ Park <sj@kernel.org>
In-Reply-To: <20261116-test-age-ms-filter-v2-0-3b265d59ec98@ucla.edu>
References: <20261116-test-age-ms-filter-v2-0-3b265d59ec98@ucla.edu>
X-Mailer: b4 0.16.0

Hi Jason,

On Mon, 16 Nov 2026 03:06:20 -0800 Jason Angelov wrote:

> The DAMON core tests do not cover DAMOS_FILTER_TYPE_AGE_MS. Add tests for
> committing valid and invalid age ranges, identifying the filter as
> core-handled, and matching ages at and outside the range boundaries.

LGTM, thanks for adding these tests :)

Reviewed-by: Aveline Noir <jm5905938@gmail.com>

Thanks,
Aveline Noir
