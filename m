Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5F73D4130
	for <sashiko-reviews@lists.linux.dev>; Thu, 16 Jul 2026 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190190; cv=none; b=pLgWo7x9gpB2wGLsfTgST3dtP0Lk/Cwbf7iLgTRi+Hk6BTZYoKov6YJx3SzrmBkSkuWWWoOEmVd2NApIWeFdlTm5XWdjzVo9thf/7Cet2tbNTZD9wKNivu6KSUquapL2UUYRNOxvZm3rqL/wWRqtWD3B22FyOol2u9r5a3bWbbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190190; c=relaxed/simple;
	bh=RW5q+a1tQ8rzMCw6sEPsHd35hpEa336M/up1FHtobuM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=BC/m16prUGTGqZXkAuLQvTuoP9sKVuzordIL8yE5UbU+uDi38u1UXIEdZyZt38vr2VmMg6XCpNUWoseqbwYjpEdCkhrjr0qXcquemw03sAXXYk1qWHw+IazokMk6I3UQHU7BzbO/+17MDiHhiotlNRXr9HD3bwAf/Q49i6d8DUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=y66iOyDY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="y66iOyDY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CDC404E40E00;
	Thu, 16 Jul 2026 08:23:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CCB1602B8;
	Thu, 16 Jul 2026 08:23:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76DEE11BD39FC;
	Thu, 16 Jul 2026 10:23:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784190186; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RW5q+a1tQ8rzMCw6sEPsHd35hpEa336M/up1FHtobuM=;
	b=y66iOyDYR/9ZIUQuamVzt1KsV9FwV6/h+E94f3BcfP0Eso5D/jblIk1FA/hLcZubcI6VBb
	zSuSlTFDHs6hUhD4NqD8F4BqO2T6gwCzlCiwDEyqVKFzNRG6vVJcnbWplsyKPeKXU4MF91
	C+L+JLmpeGWozMc6Uv20FvWAfaV/eqJwasKCuMz991QQqOIQvLfiNMgPtbXbM3OPM0EfzB
	jXfmwnULE8Fu/0wWiAbUO5Aagb3C5+eQYVag9U4ZUkuymFuXJSmnvhkuyOp0ZXgjNzySxW
	TCGLYlUNS52WAT1sLuTM+NSiS9Awrt5Og0atGFRsk1iFOddKE4pLwGGo644zzQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org
Subject: Re: [PATCH v2 5/7] clk: Use the generic OF phandle parsing in only
 one place
In-Reply-To: <20260710183649.DE6331F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 10 Jul 2026 18:36:49
	+0000")
References: <20260710-schneider-v7-2-rc1-eip201-upstream-v2-0-b4680787377e@bootlin.com>
	<20260710-schneider-v7-2-rc1-eip201-upstream-v2-5-b4680787377e@bootlin.com>
	<20260710183649.DE6331F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 16 Jul 2026 10:23:04 +0200
Message-ID: <87v7afcphz.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 10/07/2026 at 18:36:49 GMT, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Switching to `of_parse_clkspec` breaks out-of-bounds indexed
> clock lookups on nodes with `clock-ranges`, causing infinite loops and
> topology corruption.
> - [High] API mismatch between `of_clk_get_parent_name` and
> `of_clk_get_parent_count` regarding `clock-ranges` support.

These two issues are related, I feel like it is best to make sure that
the semantics do not change, which is doable by making sure we do not
loop over the parents when unnecessary, which avoids the possible
out-of-bounds indexing and the API mismatch.

Said otherwise, in of_parse_clkspec() we may check the presence of the
`clocks` property when looking up clks. If the `clocks` property is
there, either we find the clock, or if we get an error it means we are
out of bounds and can return early. If the `clocks` property is not
present, this is when the clock-ranges property may be useful and when
checking the parent is relevant (normal case).

Thanks,
Miqu=C3=A8l
