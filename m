Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780387;
	b=0uB+A2EfhL5EiuQgUqjKbXucFcWp3jMI4/jOzudEbrEZnZL1mDMAjtgrqQPSDfqX5VCX
	 PVonscpnvCAHJCI1kEMLFKDkcP1WPCOP4/adhUwE1OnNwLhLeZi2RywquFepeywpjG6ol
	 CmnMwvtpEL5iJxEbbCttbqluVOJdSFOugZ+Jawb/gSFXTIMSX3VVlkd8OfyFFcLjMYgLR
	 snbh5GPAVbcOyi1Wvx4KTw7cU3Zx51zelfcAB8JVHh63C7OBCcPXpl1a3xh95shTzsHqR
	 7M8R8GyTjIkSr8rhEhtA9wuaiCBUB0XjLHqhbYMojUces/mTZoLXWD1Ob3Gi++RSOrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=RL39unA4d3ZI3cXLW7yNerOshSBsEQH4w6tvhOAE1Tw=;
	b=BunVLCCSrFgKavhbT1R9Yg+CkTxauJ4A1kiECzEWpLO/8UgddHY1Ug7GGYfqQp8vs6ax
	 6k4HIuhTCantR4JNgUnpv3VYfGkL21W0KD9Rbm73egQgZySAJeQEJ2jahM045grRybpaw
	 skso+zspwHRib7zVlMzt7seTGy3ecLC04a8mMyPHa9gT5GEcdJU0nJI2bV8VId8aslpBy
	 IXyjwOlpL2C+41+IYd8ctw8xV3PfBp6LQlGGSgV2mwP2VWdVcHOhs0Qb2zjVmoIjwWdPR
	 aYMm2RoqGz4WWkjx3P2MGDcWI4i1nFaSiudlbvwXwYPm3z9iR0LnJcjZGrdlxGGF5CA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SZ4SZkkF;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F10B606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 11:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F10B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SZ4SZkkF
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so53805945e9.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 03:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795780385; x=1796385185; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RL39unA4d3ZI3cXLW7yNerOshSBsEQH4w6tvhOAE1Tw=;
        b=SZ4SZkkF5hROJgIhsYutrekz3xtPybmqB2V0POoyZz+JX0jHtCLPGFnnaDNyHA93zu
         Zt7gJdWsy3wNx1GiGoyePbEy6SiJlITTgjTtvOQVkD4hQIkbPTVa7eGOUQGQkeBJC3fV
         YiGZQRsP2OUdbdj2A+0zH111NWgC6JPuvUlNzmPUQtMmh12IrPCgo7V3EGUOgK2yQFyZ
         vA/D+rvKVl/zGShgQ+xT7SqAh0tgxCO7G4jiSxrt7Us01M/NxuuRqne9bnxv878u8siI
         nRhTzes8QTf+bIyPg/UpWHfzVwR0uPjRi5ZDMgu09rbg7tbh7ynuWYD6uOdYgl9UHOBH
         03zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780385; x=1796385185;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RL39unA4d3ZI3cXLW7yNerOshSBsEQH4w6tvhOAE1Tw=;
        b=vl++DQ3DQg7aYheNZR4UjB5aZJc2jiy9McbhbSZ5Xy4rqrn9yieGmge9uO5MfzHMoz
         qncGS9TXOiK8edQx3mTW5U3PGDfm+VP/EX0+nYzBywZ5AREoWzku7XcmEOCmfObIFesd
         Oldqazei5pBVfD31IO4eOwIxbLV09K449lTN3UjEkywCVAYb+rn+uzp1Fugu7TIZPDHj
         ZjOHJ82miHkETxUYkEhZL4h6Ew+DouKGvaVbsmFoneU1yJ88kEbvsi7iDVsLN6UbXpOc
         E4KJj5nAmmJCHbrKvj2lEswUeiXmaLcDO/mRTlTCj5H7V6jFpl+ct3VDEmvZim6+8WHK
         Gp/w==
X-Gm-Message-State: APuU4Z96C43TxwuZLI7AkbDisPZbisOqKUr3klTsXLbdPcrQI7CJJTlR
	VzOgfRrVoZFzQG9Za/xjlNNZC8lzmYi5tU9qo9j6tCZXYa+Lj3U6uOYbs7ZwpmknKZKyIM/jyMP
	S1in1zQ+rEz8w64GzT0oWMoWLrfQSaYiZvq6LcI7R/nnwv/ZBMmfqUYNQSy1I3NRv/9AQM5TN6y
	io+ERsTNpAVPlhR3Wghogd6okEVj8sk9ZYLVbO2VJjFxEL0vjr4V3xsHwZOnMZRZ0m
X-Received: from wmxt6-n1.prod.google.com ([2002:a05:600d:8646:10b0:4bb:6c3d:a4ef])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c168:b0:4bb:81b2:c801 with SMTP id 5b1f17b1804b1-4bb889238f1mr480110875e9.20.1795780385227;
 Fri, 27 Nov 2026 03:53:05 -0800 (PST)
Date: Fri, 27 Nov 2026 11:53:03 +0000
In-Reply-To: <sashiko-outbox-237242@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261127-condvar-doc-interruptible-v1-1-d61a13fb0c36@google.com> <sashiko-outbox-237242@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261127115304.1602646-1-aliceryhl@google.com>
Subject: Re: [PATCH] rust: sync: condvar: show interruptible wait in CondVar
 doc example
From: Alice Ryhl <aliceryhl@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org, gary@garyguo.net
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 27, 2026 at 11:34:05AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] rust: sync: lost wakeup in CondVar::wait_internal() [1]
> ...
> [1] https://sashiko.dev/#/bug/linux-1aaf85f4-21a8-45d1-b9bc-cb3fda3360df

Indeed! Please see my previous patch:
https://lore.kernel.org/r/20261126-condvar-finish-wait-v1-1-296b5a05045b@google.com

Alice
