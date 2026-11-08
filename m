Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794126089;
	b=pMZ6xX/lioCSYO9jvts5uWSHbIp1AEYyAbcTrUGRBXpRDGEK7cbZFnxAMy8uomfJKlGQ
	 wXEiaKcNDN1O6snwNq0jcfaCS0stIz42z6VYAIyZO9qKuQbdclRm7qzYfHDVtRJ4CxEtH
	 DHuC+u0evou1NMh7RP7MRKG7IDFGDA7lM/ymt5tlvT6PDBvLodHu3MiAVwiLOtvixNLTw
	 3+H3BJ39LsmlaKlkoDSN5QRDDbic9LtYwXELOFpyJz9oaQemei7WRRboBYamD2VDG3KKA
	 4VXHpIhRlcsUvNLmZQ1kgmFv+ja7BOI9Z8K1VDBchHmKO/N6ymWxQtj/TPjq6Xn6MDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794126089;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Sent-From:X-URL:X-Accept-Language:
	 X-Accept-Content-Type;
	bh=Sh+EvXa7InZYFHvxyvqCT83wd1+QiDmmAkbvSna04x4=;
	b=yNfON4Gls0RzxHhbQxMvz6AmHid2k6GOnOcISFDb4voFFTyLfIaPWgv6sWPjOuT3LYzk
	 F6lVpD2Y13WAfgrtYa9nzHx6nKJQ7inOVkoi+UmjA/vFT/wsPq8Rk04wFDTfyf3Yqw4PI
	 EN6sOjJortao2KiP+uPnZWGGbxEfaD/3ZrnsgB4e0lIbm4DfU4707Y4BPWoMp9o/xPm6r
	 PnL263RsPiGfuYLzf9Nqmpyz0UBT4v4JjcxrvmQSh/MusfsWcgf8n+G5i0U2prcgzotEk
	 LkIpEOsWZjJ/9LNlxmSEgR0yGytTsx/Bj93ClcgH1Ekr2jd5t28WYhddukqqeM/HZMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NulXcHZ9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08251606A330
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 08:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08251606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=NulXcHZ9
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B8495200243;
	Sun, 08 Nov 2026 09:21:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794126078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sh+EvXa7InZYFHvxyvqCT83wd1+QiDmmAkbvSna04x4=;
	b=NulXcHZ9vS8n9VZHOPLi+flPp7xe5E/Ztd3HVb/kFMfgsXDvzmSpayYsxrvEJxmqFzg5on
	juwkNIGb/TjDxSR4cWkwpyCKFmk0W1cH9ENGuHRtsKN8BUxDStC/gpghaGU434fF27yybE
	phMbpYV7SAhtSTJfT79MggvIylC0ArlPNlZ78PyvU3vhH+2k1iA1Kd05NZiiBf6ozC8IbP
	I8EHhAZmVRk72+w8N4Xh4vZ3t/6EH7qSsFPh1fTfPM2UmZ2nUw+RpHpMGKOG7iJmuy3wLR
	MXbSPhfivZiBijZrCFGuhEHBSvLhniZQfZao2IoDYmityVFpeCQJy+u9iE22PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794126078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sh+EvXa7InZYFHvxyvqCT83wd1+QiDmmAkbvSna04x4=;
	b=BfvGNxC+kRt7TsFKfqNMRQYOpaUHmGYNQNWDOXdafQNwFdSotHLclmwKx/dtCB3/F2naqY
	yVGKcn3pIxJdokC+VwZmLdvSShEwRe3WVFx5rQuIFZECIofsLoVj/Q3Nu423cS2SQvOy3f
	QH3zuni7Or1aINSBULul77NKUkYzcoIJ3uj1Zn//0K7sonQfT7Rzr2+DKmS6h+9ik6HT5d
	ipgOjckAGJoPtyeYCzmGaxeShh2lyfJz/Kn2fQsq6p4LhJQmCXJkbuOy1drbjmjGx1arsM
	xZqt9wzjjwGY25MNmgqzSYvkzrmgmwDH3jv81hlSGLUXfRGVdx0whmCK5Ldrww==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794126078; a=rsa-sha256;
	cv=none;
	b=W8UtQRkCywwhXPRFbNQI4tXy9nRM/cSpLyTUi0J+ukBBtHEvxIPmldxnlhY5ezj5iQXFzv
	VLCPNXynYKL2ZmGH1qhTLSMViArW0NYPUUZ70UT/M5mRtB5Vsy1s3WQsH48mnslndwvBhS
	F8zW+1PvG3b70bnOWDj7n0jVGlxLTX6dWbpUQH5g364ogCm/s9cqI8XPmSGNwm/dwVummU
	8pP9y1b41FUYkkrWaqXGizanMU8ffRkWHoZ7JDMK2vKaBrt2E+5aFykhNDdMrnwpBjMGjO
	fQmkdHX/sfTh75zeoMQ/D32H9cq5Dp2eMwo0Mdd8cZ3uGieNLToMjyzUhU0OOw==
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1xPy9O-003AIo-2B;
	Sun, 08 Nov 2026 09:21:18 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1xPy9O-00000006JV6-2Pps;
	Sun, 08 Nov 2026 09:21:18 +0100
Date: Sun, 8 Nov 2026 09:21:18 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Hartkopp <socketcan@hartkopp.net>, linux-can@vger.kernel.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>
Subject: Re: [PATCH 3/3] can: enable memcg accounting for user triggered
 allocations
Message-ID: <avAw_riXXY6rKC5i@pengutronix.de>
References: <20261107-can-bcmlock-memcg-v1-0-482d9f5be1fd@hartkopp.net>
 <20261107-can-bcmlock-memcg-v1-3-482d9f5be1fd@hartkopp.net>
 <sashiko-outbox-202902@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-202902@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain

On Sat, Nov 07, 2026 at 01:14:06PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [Medium] can: j1939: non-zero setsockopt return value in
>   j1939_sk_setsockopt_flag() [1]

Thx!

Adding to my endless TODO, except some one will address it.

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
