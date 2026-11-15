Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782675;
	b=4rTxhGLkksgRPb0G6DowGvOUUuS8F/iLyIUhrHvqqljR8PP2wd7cjceIqIc0XW/5xv3O
	 W1747kEQfMFcDvKu0wMfURKwhGpGst+M+A5ORG8VAzrtkYzBJV5mYnQ1sO5jMXj4dLeOu
	 Q1BSlGkJc27sYA/4akCNCESkc0Tqca9NSQ+3BmiwoKGRxEbCxVcXhokQM8utMPWav6NhL
	 pWnGQR19NTvYQcDl2DNLae/or2h76R0KwCx/OVtTeuKLjiG0lScRMAx/J3LZVBeWynkd8
	 XQTsh/wELbIWJzImwOO/o4PmQYSq4CEg4PEhecxOxJZASv3cZjMB1iQsN844gNmSbZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782675;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=/6G/M/AT0gyJOgfB8EJx11GQl1a1nFgjs1t6sNM0uEw=;
	b=UQoAcPJo45+Ywf0eXeoHapRaDcr4yKmRFxSt7ErTXwke6cCMg5pz338oraBq9khNLOE9
	 7N3OsFRtJmElfSgr/k9SQ72oy0vtsFvzjB2PP0ePI4d6hXMzRBlO7fezjzRCSRuf1F8M2
	 P/D7hRCnWH9Q1Hq+VW32UZywId23E1T/achl0PVHgG06HDvjFYrqlzrmKQ1NE1ys+XYpf
	 nVpGskGiwMdoKAMar0OR08Dsi/WEDFrh2HNiwcIr/Q5yorwJldZDv5mVUlCwU69lUDzja
	 S9wZfKTa7kqUK4t5GBMmSFAwafqYUTzHTnBwhvfgJ0Q+QfN5Rr8QjPce1zrRnVBldfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WD858LjN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30069606A32C
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 22:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WD858LjN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4BB1F000C5
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 22:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794782674;
	bh=/6G/M/AT0gyJOgfB8EJx11GQl1a1nFgjs1t6sNM0uEw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WD858LjNeviKlK3pSp+WCNm68NBP3MBYkBuMbCZ6zlxuftxsi+uDkoVsrUZCSmPcy
	 VP8pkuB0guXcQH2MpRtA1PspbZ10S4SeWw4VtXx2GhP9wmIVbng64+y9ku4iFIl+2T
	 kATA3vz717cNRjHbq5l3DPi4uJJ01NyTERCTvTH9qyNAR7Vp1Rt8xa7diOz4Cyk203
	 f1tPmIqzEOQxWdkiVdbSPpMbBotZRT2jBPATuq/4tA8H3Sn3udyFuGTB8esnMoBG8z
	 8zQsdCj76LmuvWVQOHJ38i9hdDB+FBScmoan2KVmnzKfb4BeA04PHQ141+DdCqvjs2
	 g2lghZsCIJlcQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3adfe77d336so29372291fa.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 14:44:34 -0800 (PST)
X-Gm-Message-State: APuU4Z+pBKLjjVGXW9x7dI4RYcHg8lO/0XwYYFXh/64mB9KkURChSuVT
	CDRE13uGSB37m/9umcswdX26WHdKDy7kiBh2LU1De1lH/Tr9RHC2j7Hc0vsIuaqZhH9FQiQ+wIv
	VQBkR8BVXKlENu7gvWVwjoLArxqI1o2A=
X-Received: by 2002:a05:651c:418f:b0:3a7:6090:e0b3 with SMTP id
 38308e7fff4ca-3ae2b4e69b9mr24992451fa.20.1794782673464; Sun, 15 Nov 2026
 14:44:33 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261115-ux500-drm-mcde-powerdomain-v1-1-afdc326cceb7@kernel.org> <sashiko-outbox-215719@kernel.org>
In-Reply-To: <sashiko-outbox-215719@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 15 Nov 2026 23:44:21 +0100
X-Gmail-Original-Message-ID: <CAD++jLmk3wX8jn60rgYPzbn+prWESh7DwGUmy5WRAxFsq-fdOg@mail.gmail.com>
X-Gm-Features: Aa3M54oX1H_4B1BZ85Nc9T7LS4auKWWeLkh57cDnNi9fqT55V3hlYKnQfTuLQz0
Message-ID: <CAD++jLmk3wX8jn60rgYPzbn+prWESh7DwGUmy5WRAxFsq-fdOg@mail.gmail.com>
Subject: Re: [PATCH] drm/mcde: Use power domain for display power
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 7:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] drm/mcde: TOCTOU race in mcde_clk_div_recalc_rate() [1]

I'm happy to work on this *SEPARATELY* and on top of this one
since this functional patch is important, I don't want to build up a
typical Sashiko-tail of patches after this one.

Yours,
Linus Walleij
