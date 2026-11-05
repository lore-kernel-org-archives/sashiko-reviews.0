Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886001;
	b=qfvfIXPbPZkqwMBibXE5T71iuq07v7GjhNIEdLedrhQKupgIzC8ym4f20djzcuqGxBKI
	 Utxb14nLmCmB18KKk6GGllPJ8j1+LrieibsnzpFg6oyuD7rSBQtvpwZX6Jy368yYS6M8Q
	 U67aTP22qej2CjaxTJxCxxAKfe1WV1EApp1i4AP69cCergQmV2a1MAzXw++pa1+37z539
	 UWiypWh49AGX1QKmbUAYY+HzjrhnaNVyPYuSFYkSBp9ksfqzCEoDIaG8Emq0HApxbAUQk
	 DJGuTf+BWgdwjEID8ZJ+qC+xV0+9sMVy+qyAgmRwY3gqATFMmXkSVfzB6GopPtaG+qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=Zm6TMXmi9ebTqld5yDJqwV1KRDoKAgG1LtJKW3+78Cw=;
	b=YBWUqV0b0qDl/qOm7wc0AYIB6kGwNUgeKlzIvQ+VL0xhk8vYdzWl3lsGEupEHNAPhuIj
	 FZI4ZEgENOcAzbJmhRY/aRUyx9p8fiQEKZpiQD+rIuTZfkSSQ2KyKtE3qXtWXmDruOOxL
	 1tZwakM5Avc/zdhUX6uWAi67W/IbkDXR4/+97QQdO2HD74zQj4v9kYZ17pCdoeaE2Bp0k
	 hnsd5bBKbsYIW9KbcGykSgInPiuHioAI072FmxGIMJNcewKeEwgoRqZJC2od1g/aef50n
	 u057hinI4KsldgHlCjaig0TMP2evXnDKgwhiFmIy7oxm5hBVAnk82ajL2LEuzqLD4Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XqaDFLEp;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6D9606A31B
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 13:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6D9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XqaDFLEp
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so18032645e9.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 05:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793885999; x=1794490799; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zm6TMXmi9ebTqld5yDJqwV1KRDoKAgG1LtJKW3+78Cw=;
        b=XqaDFLEpBo1XIk6wD3o9GvJzhGdsKekh2tzjMyUwIznVL1pij8m+7emxRpWIEN4g2f
         yvlPpWcVML+fpGFsDYv3OhSjGhnH4Oz7BKTalF8ivMIpTkBYoHJqAVQKwYbyOKtZp74t
         baa7ouF72Wy+FD6PtdITKp8otja9/13h7LYcNlMcGCIHTlZrFa3i7vwyel3KFNNVmvly
         pR56KUz1iKceb5DVw5LndwXYq53SUPDEOddyz/SYTUJAWadakoLc27aDJnPsh/pOpTol
         Lqed1dSC12ql+JrOD6Nf8SYNaKWcC+T+B1doEkDsaNJiqdTMFyNhwZjPdmAxRxi9Qrqc
         Ui9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885999; x=1794490799;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm6TMXmi9ebTqld5yDJqwV1KRDoKAgG1LtJKW3+78Cw=;
        b=dUauN13qNleAX3a4mpLtf9G7CJklFuREoQ6XIulfgXZhn0/pik9qOPg2ivgvaZjDP+
         S+04+GwRxISQfLbALnariruoPlArFDjFCrzq8ROgrpmsco3XwVsa+33pciTboW7Zu7De
         Cosh2R16HheTt8p29/4FHsjnlnem8bzXSkILPpExb0nxl+vDv4IFtnf6dVk7sJyzBIPQ
         VsxKZ7qsu4QZDHg5mWbDq01Dej5LcWFsHiwlO89seF0E8GOvD5vF2G8rf7nGNs0W2Eio
         KMiPy4FDs6tfVJnijdEvSUi4U8DkI+Attof6XIxFUTYDip7u7RoCfcmbp70TcCTdbFuJ
         Vpug==
X-Gm-Message-State: APuU4Z/Pu57FL3E+90g5Gomv24Gj9LTM9JX8CHToeknWYTf3p1SnAidH
	wmDjyybKc7g8hndIpkIn+8OsT5kQQtWv0wyGan/z1cZbGGPjEC0HOzSC/REqv27HWZnqIOEaJp/
	mAMah
X-Gm-Gg: AYBFou3c9sg+o6qnA1QhUhNqhK1dDeTxZNqlJOwx8KB6oV3pEzqVFEJPbCrSP6jRzpk
	HdVLSHqYiG2vEEEc9xz8Mi392D43Hgenri6HaHOtIIk6ck9W1xIUHoJ9OZKJZv76lHsHlXqHshV
	QP4pqrzk8vXbjfaoSsTgH6DkrI6fCqIdBuqfdHUUl329sfVzCPer8Wj/G+Jd8GdWeaADQV9ZvYN
	uVGLhmeiBZ3YDnHy8qY4+cv+L8tdzczccvp6msB+n+L/EQfTrzQGNqP2FoI/zMwjoWOLQnIn/4O
	2kJjJ2Rq87ez4M+a7xNsdqy3hqF+LsIGqDPvyYR0Ge9QdNXshnfw2mSZ8zUi4kghzpVKGGFeBOD
	FMqYr5v/n3CexdlDx64onySGT+oJfj4PYrHNc5iwivPHJoWQWWVLsmeBh2ERBXFdD5Ge8TIS7IC
	fRt6Jj8G88FeeoomuK2WZ7mEDFu4rYzj9oSJ7arVJwkJPGGmycjOPp6esTAFbGVgysvViYmLEID
	mZfEc+wZWI5cd5tjac4QvvX5raNkLnK7VSFTrc4uflJ5sPg2f+iB6n6JouaI1d2y3mvvXPmAT6X
	la6/2svzRtvHHWs56XdmiLWA5HkpAl08840gQBO0lZ1Ji0b9
X-Received: by 2002:a05:600c:83c3:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4ac174711afmr407422615e9.18.1793885998746;
        Thu, 05 Nov 2026 05:39:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4107b7198sm64630215e9.0.2026.11.05.05.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:39:58 -0800 (PST)
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
Subject: Re: [PATCH RFC RFT v2 2/3] clk: divider: add
 CLK_DIVIDER_INVALID_ZERO flag
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: sashiko-reviews@lists.linux.dev, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
 conor+dt@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <02476c54-d8ae-479d-898f-cd89ee2f7c24@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-2-ff4ac74e527b@amlogic.com>
 <sashiko-outbox-189068@kernel.org>
 <02476c54-d8ae-479d-898f-cd89ee2f7c24@amlogic.com>
Date: Thu, 05 Nov 2026 14:39:56 +0100
Message-Id: <179388599696.2573818.3573650064673131943.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2459; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=jY1a/cgO/AsaKMem8B+RlbZOedbhgH1XS158DQz6dbc=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlv2nXPrdC+L/KnMu9R1D1tRzX9vYd/SKduvDY96+S2Z
 Tdu393N11HKwiDGxSArpshSw10t/k5S68us6Tq3YeawMoEMYeDiFICJTN/N8L/a3f2p9Iup1qle
 KoeWqkfJv4jpybA4dudj29W9U+WudrgwMpy/8nfisn7WmB+KC1myC7YbqbNEOAjPtn3JYzfjRZr
 FGTYA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-04 17:07:10+08:00, Jian Hu wrote:
> On 10/29/2026 5:47 PM, sashiko-bot@kernel.org wrote:
> 
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [High] clk: divider: unhandled zero divisor in divider_ro_determine_rate()
> > --
> >
> > commit 5ec3118aee2f03855552c58a4a8533e035b565bc
> > Author: Jian Hu <jian.hu@amlogic.com>
> >
> > clk: divider: add CLK_DIVIDER_INVALID_ZERO flag
> >
> > This commit introduces the CLK_DIVIDER_INVALID_ZERO flag for dividers where
> > a zero divisor value represents an invalid hardware state rather than a
> > pass-through. When this flag is set and the divisor evaluates to zero,
> > divider_recalc_rate() returns 0 without emitting a warning.
> >
> > [Severity: High]
> > Should divider_ro_determine_rate() in drivers/clk/clk-divider.c also handle
> > a zero divisor when CLK_DIVIDER_INVALID_ZERO or CLK_DIVIDER_ALLOW_ZERO is
> > set?
> >
> > When a read-only divider has a register value val that maps to div == 0 via
> > _get_div() (for example, when CLK_DIVIDER_INVALID_ZERO is combined with
> > CLK_DIVIDER_ONE_BASED or an unmapped table entry alongside
> > CLK_DIVIDER_READ_ONLY), calling clk_round_rate() or clk_set_rate() invokes
> > clk_divider_determine_rate()->divider_ro_determine_rate():
> >
> > drivers/clk/clk-divider.c:divider_ro_determine_rate() {
> >          int div;
> >
> >          div = _get_div(table, val, flags, width);
> >
> >          /* Even a read-only clock can propagate a rate change */
> >          if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> >                  if (!req->best_parent_hw)
> >                          return -EINVAL;
> >
> >                  req->best_parent_rate = clk_hw_round_rate(req->best_parent_hw,
> >                                                            req->rate * div);
> >          }
> >
> >          req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
> >
> >          return 0;
> > }
> >
> > Unlike divider_recalc_rate(), divider_ro_determine_rate() does not check for
> > !div before calling DIV_ROUND_UP_ULL(), which will trigger a division by zero
> > in the kernel when div is 0.
> 
> In this patch, the dividers which set CLK_DIVIDER_INVALID_ZERO use 
> divider_determine_rate(),
> 
> not divider_ro_determine_rate().

Yet the point raised is valid. The change must work for everyone, not just you.

-- 
Jerome

