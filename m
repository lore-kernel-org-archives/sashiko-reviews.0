Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439785;
	b=wfG4auKuvxgbHyc0BUAyIjbGVMS3rjvRNAm5qSQ7Y5+BGEpohkzq8jlGOl90MP+ZjjFg
	 OW8jqcksXP5yqcmdN5lRYBUtF3pwn+2E49fJiMOrYhaWEFcAoRPyoJ/dFvPODHYbFwqpz
	 JJA5w9CP+f3ZlXLBpKIMwNBkz+rVp1hAWMn+0GwrZO7RSS07ATkf8k4WSnINsF4y7M9C3
	 J7K1u7F/eEcxHqEJkQAGmHF8FL1vVnarodQum3Dpx//xzf05Mlm/0V77KH3Wyi7trNQdw
	 tp3sg3ScZxc/LfpDhYFpcLgwyEiYX1AmtO4AI55E5JW67yGem0HO0kA/DRuGHG+Bp+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=2oKp/tQJtJmPQyRUGuL/B7hHZyCcfFAtUoAx9vEXKic=;
	b=G8QjXLD2Tm7i4DKUCFLi7LjWHx60ubJwnKldkXqZByCizcWUvrHfftuXwQYQfpfZhQ6z
	 LyhntVNBFj27R4fBcP6OYn730J1dISvYwv7ieJe59KV8r83CY0ihWNNeDpXsKobjH9PuX
	 apNq2HGhdIhBxCisY8Btyoq2ddMbSyciMPFuv9P12CDkFw9ZPGe59Af1RoffOYWdlHcE8
	 MdacPDmvQxRLX1PVbg4xQdbydzcwJuK18p8SSadrIeX/A4rCq2AC3Xy5NpvbHkxeDb40D
	 eS0s9NivR/e2r7lSm52IBtIiRH4Lc5QRez8Bc6HA2uDLL2BjGZBy73pivIZHBRCg1qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=PuMF7mwR;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4DB606A326
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 19:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A4DB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=PuMF7mwR
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 8B40FE83A99;
	Mon, 19 Oct 2026 21:56:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1792439783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2oKp/tQJtJmPQyRUGuL/B7hHZyCcfFAtUoAx9vEXKic=;
	b=PuMF7mwRer4Ay23WGBD1n7WKnRVZdEAADX5TTbukgC4WRmflzmUzUyCSd/5bA1UL83BWb2
	1CSstiYpEv7D1VHNDdZPp817lsxOb3slY6284pipPi1fyLgNNoQxRYfwjfCbhjPyqwCgTt
	Pw/gL3Lf8ZmCdhlRpsHmDMRjdO90WGYmax8/PVyKddB+T/r1k0DFn/BoF0c2HzbEY6OjZ/
	08bXNB2bzG6xYpe1jv8pbFXOGQix9H6LGbRoBhdlOYlsLstoPEbSxMiULKrFQMvoX7YQiX
	kNu478WHLto+DX4R7uK1XF5bHY/8P/M02G5yG1zSGwuorJ2o79aXOEzxZBrBHg==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id KRX48vnvDOH7; Mon, 19 Oct 2026 21:56:23 +0200 (CEST)
Received: from p14sgen5.. (unknown [91.25.97.186])
	by szelinsky.de (Postfix) with ESMTPSA;
	Mon, 19 Oct 2026 21:56:23 +0200 (CEST)
From: Carlo Szelinsky <github@szelinsky.de>
To: netdev-bot+sashiko@kernel.org
Cc: o.rempel@pengutronix.de,
	kory.maincent@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	piotr.kubik@adtran.com,
	saikrishnag@marvell.com,
	horms@kernel.org,
	kyle.swenson@est.tech,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH net 05/10] net: pse-pd: check the PI state under the lock when setting a power limit
Date: Mon, 19 Oct 2026 21:56:21 +0200
Message-ID: <20261019195621.308015-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179239987339.3135.11130245905103238734@kernel.org>
References: <179239987339.3135.11130245905103238734@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 19 Oct 2026 08:51:13 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: Medium]
> The scenario in the commit message, where budget is reserved for a port
> that is no longer powered, looks closed now. But can the budget and the
> hardware limit still drift apart in the other direction?

Yes, but that was already possible before this patch, which does not
make it worse. A real fix needs the budget update and the hardware
limit write under one lock, and that needs a different structure. As
Kory wrote, PSE PIs may stop being regulator providers, which changes
this code, so I leave it for now.

> [Severity: Low]
> This isn't a bug, but the kernel-doc for pse_pi_update_pw_budget() still
> says:

Right. The next version says that 0 can also mean that nothing
changed, and that callers check *updated before they roll back.

Carlo
