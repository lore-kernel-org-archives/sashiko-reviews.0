Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703311;
	b=Gj9g04+TpS6xwR03EQdBTLQQuODuhy2hyLXEfVFPUkZBw9TJXICz1b2dMKeuKoavxkO8
	 iBgM2aa4V7g0xBTnK+yLAtw1HjiuoAvJOt18OSqtPJjeFli5eup5wNzBtBE7UdbtbUHSD
	 xFN8sQXHbW5Ef7iP89VXEwaPQWk7YAUDGtIk2DZDIlaQVLVfqNZlGavOR21dR3feCJmGE
	 0dS2RlEk3blCOSMib8yNymsKJBHbgFCb7NTcSom+oSSGSpKFGKB1v6vB496V61gYqo295
	 5SXC2OaqR4fWYo5cnw0om0EzWhsV/6MYckvQYZujPZzkz0WdqgeiUjNlOI1KP4hemkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703311;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 X-Rspamd-Queue-Id;
	bh=WR9/R5hfbdftSEre9025L4a+8Fnlc6MBwz2WQ+WX4xQ=;
	b=QSJIHQGoNwFG+ctMuNEpgOKR3JkqJaE1hooQmC9KKlyxA+Cs1rSIZ9lWlY+IPlNStWu0
	 5ai7RBfmpdGKFWW7A742J6vbsaqupkdXMVTCUqgQsH903UFKvSu6XRmQ1M2MH2N4Fdo7u
	 V4DdTI3rc+Zu1rUkowvOD0KA37Hzv9/ZWpf7MshKHzM7LvMHJVn0wpQcy9qeQzrpsc1LA
	 cUOSUI6StTE+Qjd03VuhdsTmNoi3Rq/NM9uIQ39adpIjx/6eFyPEGOV98tPNLW32xMu4u
	 SZxgOeMibThsYKWus1OqH5p5BFaMy/WIXZSHrXPX3VnsSpkN+QOP1ekwIaAM7u3lR5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=kNulOq5r;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFCC606A323
	for <sashiko-reviews@lists.linux.dev>; Sun, 15 Nov 2026 00:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBFCC606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=kNulOq5r
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jRsd154GYzKnNh;
	Sun, 15 Nov 2026 01:41:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1794703301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WR9/R5hfbdftSEre9025L4a+8Fnlc6MBwz2WQ+WX4xQ=;
	b=kNulOq5rm6zGyROdT1UO3Kd379gPrcJxeAm2UQnno6i4XJWyoSbfJYlogw5SiLNhJQgU6W
	Y9nU/x8WSnLn7XG2XGC9fSfU2PtMtZUHIHCZT+QB536hDh/I6RU58TMJcNgxZF+dGr9Fdk
	ENHMmnfmNoA13s575OF2GmsMJaHZXTa+8bRI+B2c8VzLyPAxBtfmPm3WehiG+T/sJzwRGy
	RJ0oF7myk71E7cbRQo7c+Y5HNP/YVTsheiEjcNPM/MbjawAkDhwEXAvvz9YKwHf2LNKWuY
	wv0hiPRhDn90oUfotq+OWdqGjlkj3ca4JDTOwczzu0KTXHJbHrcbUfjPWomOxQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: =?utf-8?Q?Fl=C3=A1vio?= Amieiro <flavio@amieiro.net>
To: sashiko-reviews@lists.linux.dev
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org,
 conor+dt@kernel.org, lee@kernel.org
Subject: Re: [PATCH v5 2/2] leds: is31f132xx: Add support for is31fl3206
In-Reply-To: <sashiko-outbox-215144@kernel.org>
References: <20261114-add-is31fl3206-support-v5-0-332db80233df@amieiro.net>
 <20261114-add-is31fl3206-support-v5-2-332db80233df@amieiro.net>
 <sashiko-outbox-215144@kernel.org>
Date: Sat, 14 Nov 2026 21:41:23 -0300
Message-ID: <87ld6vncy4.fsf@berlin>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 4jRsd154GYzKnNh

sashiko-bot@kernel.org writes:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] leds: is31fl32xx: mixed declarations and code in
>   is31fl32xx_init_regs()
> --
> [Severity: Low]
> As reported by Lee Jones on v4 [1], placing the shift of value before the
> declarations of num_regs and i mixes declarations and statements in
> is31fl32xx_init_regs(). Could the shift be moved below the variable
> declarations or folded into the initializer?
...
> [1] https://lore.kernel.org/r/179370064610.793788.8239015594326628135@kernel.org


I missed that change in the new version. I'm sorry about that. I will
fix this, but I'll wait a while for more feedback before I send a new
version in case there is anything else to change.
