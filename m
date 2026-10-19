Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.214.127.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792439789;
	b=sIaKZ99s0TjBo0fegdc1U89Fuq1YlioYUfc5s1zDBVYk7vML5h+tu5BCFinghFeu+gUd
	 vGWrbb+gUbg4SxFiaQCaBety1a2glXKlDo1luVImU1Uu+s7l3AgX0+ziju/L/kjnqLTFq
	 /sU0rqqKwCiqQahQTYpsMW5kajd5wa3E+RMxsaXusO4lWC2Q/yO56YInUkRSX98tk0yAk
	 5rVYNXDrCifawUSxYTclZOWSrtctMFn5MTEW9IHO5uwDbpOohlJ47cQIZq26d23KBRUsJ
	 mLJHrleF/pDer5zI5c2UCvuv93ja4azNBpi2lU/EaxFlgVJ8PgTsOLyQloFUCbkoRIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792439789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=KVEJtPz8xVzKOd3zloro+LuQB61UUpq0vlCwWFBY5H0=;
	b=LF8RB0Ek4Q5lPX2PI/GFYOvUV/K6u4pfwpEQsgnrCUYEe5f2r4taVIp57viO8RPBb09G
	 LDsPIHYO2lFoEiOkoFWr74+tFPcmTsaAxhA775QLbdQQvfniDB6VGBkPNBKtbhlPCudXk
	 IGjurYP2du3Q2zKv+lNTL7lrzexrD7uvLlp1Jd/HMqSQlsjraccqUi/X6BkuiZayyHnKz
	 Tx79xvL1DPqJ/qCs8dNZe81RE/kF7WeE5iicw/Q+i/WE8DfQ9gGV7sRbRzsfEfiyxR6fI
	 8E9gLUCbHQDGUKpbGc48QM3z+NSLb4f8Q+Ol6hIRMVrlUBjjAMHjLVDQfNtApl2vnPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szelinsky.de;
	spf=pass smtp.mailfrom=szelinsky.de;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=dupV63m0;
	arc=none smtp.remote-ip=85.214.127.56
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0871860A260E
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 19:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0871860A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=szelinsky.de header.i=@szelinsky.de header.a=rsa-sha256 header.s=mail header.b=dupV63m0
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 48CC0E83AA7;
	Mon, 19 Oct 2026 21:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1792439787;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KVEJtPz8xVzKOd3zloro+LuQB61UUpq0vlCwWFBY5H0=;
	b=dupV63m098oHK2pf1A1sX30DDVDh4P9MsLsOVryN/+vTbqFLjQp9s2AQnsAaf6+xS+89e2
	KI+6nF4gVhKvDX3A7mF1q9UJ690Gt1GOEwjYiwcik5yDlbe61LxujZR1M70KOtkV4txKRP
	7ivKBvA9DJP4oZcaFJkV5PbM7znYCTpmcbceCIzxSwjZmg/mcI1uUGX0qP9VQCGTxFal88
	zPva8aVTUpAkOkHRGLH0rISYsPSZqItgxGFH613/P/QistAoQlJ/exo6cCAeU/5WWDdMGu
	+PKG7TiKmajUeIJRkfr+nreBXrOAzcMDekaJ4b4HHoMpHgyLw5o4bZQ0g6SiVQ==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id zA6Oi85ZBx9w; Mon, 19 Oct 2026 21:56:27 +0200 (CEST)
Received: from p14sgen5.. (unknown [91.25.97.186])
	by szelinsky.de (Postfix) with ESMTPSA;
	Mon, 19 Oct 2026 21:56:27 +0200 (CEST)
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
Subject: Re: [PATCH net 06/10] net: pse-pd: do not tie a shared power domain to its creator's devres
Date: Mon, 19 Oct 2026 21:56:25 +0200
Message-ID: <20261019195625.308047-1-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179239987471.3135.11859262024217714390@kernel.org>
References: <179239987471.3135.11859262024217714390@kernel.org>
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

On Mon, 19 Oct 2026 08:51:14 +0000, netdev-bot+sashiko@kernel.org wrote:
> [Severity: High]
> Is the shared domain still tied to its creator through this supply handle?

Yes. That is an older bug, and the cover letter lists it as not fixed
here. It needs a supply handle whose consumer device the creator does
not own. I will look at that as a follow-up.

> [Severity: Medium]
> What happens to the PIs handled before the failing one?

Right, this patch alone does not undo them. "net: pse-pd: unwind
allocations when controller registration fails" does: it undoes them
inside pse_register_pw_ds(), while it holds pse_pw_d_mutex. That patch
moves to this series in the next version.

> [Severity: Medium]
> Can the PI regulator ops still run here and see pw_d == NULL?

Yes, in the short window before the PI array is freed. That is the
same older bug as the freed PI array. I will rework the second patch
of [1] and fold it into this series: it stops the PI regulator ops at
the start of unregister, before this flush.

[1] https://lore.kernel.org/netdev/20260813200653.980170-1-github@szelinsky.de/

Carlo
