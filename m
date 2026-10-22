Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678345;
	b=qVpcq0PcYxK4r5CEIjtqJG1V9PGyW0lfZ7ahxPRw6x/O1V4l1jqdjPqYEclwYQpajwFn
	 I4HFO4t9H78Gg24vsNgjwnWBijD7CNCryWNtkeKBR3+N1t8dW+YhUB0CBt9JyvWwigtd2
	 jadDYxhw4vId9KS1zQZIJD0dFNrtze3y8mOTOELlqHiEao9hTI64StJ2XIbXOuiP5Zy+U
	 kD7UzUbVQJqAh9UAxqWFMWPViHFqjP80jHLVE8kwupAbiK4hV7BhZSO64yZ+R97Z/B/e4
	 vp85RR77v9MH9K8E0kG0MSSp4d/CG120viJIhbv6/g7byEdDsnrnsP9waJ0YiYmnaJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678345;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dn+bqUyiG43quJhaeIvl5QRJPo7TdDZ3kxVAyYu34Zo=;
	b=gXfJcajxht52e1/22mk/roUkBNMkZv6WF4NcsLBsyZApjQfGl4mUOqGNJCDwqN99PvtM
	 F5lDD9zkmuEWq8Yh0suHV92SqMQ/lJunRdbMHJ7Jy8ExgZbtVfcFXOBmDiZGIZlHSPDJ0
	 RqnIzcM13U3eevZm17PpWGgxPtKpg3AQSk0oz4cplHcJ193ykU/TaKrhf0V6lkaWbh1Ym
	 vb0l9zT4Urme0l0p3xKLiavi68nw0YZOeVIGbr8dko/MiL+0rweCkFgmzYFIGP3tkQMGq
	 /RHYy/QItYvFejzSRm4I765bqESZDL8JF/u7GSlGxTB6sBU+AFhL1b9d+224MWNKt6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=nNwTUC14;
	arc=none smtp.remote-ip=212.27.42.1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683B0606A323
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 14:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 683B0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=nNwTUC14
Received: from stf-laptop (unknown [IPv6:2a02:8424:8fef:6e01:68ea:cb82:d40f:9275])
	(Authenticated sender: stephane.grosjean@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1A47CB0059C;
	Thu, 22 Oct 2026 16:12:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1792678342;
	bh=dn+bqUyiG43quJhaeIvl5QRJPo7TdDZ3kxVAyYu34Zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nNwTUC14qqAMkhjdsSru87RNjdoyHsdq1Nzh7ZDYx2VWj2Qmd+qoDOv7zYrHBGME0
	 omq3cNkuMcCid5SbOA0LCnneBAcuEaGexIDOHgEtxq9CWSbc5o7oE4nN/PlTN4B2Mx
	 uVBaBZJb7a/DIARAglyw6C5fuLY7ENi0UviKLiav7zdfnZ97Tn/tAOxhXLrBe/OUUX
	 mvp88zVGlqGM2cFlx5lZ0nEWsD82A6rS0FNOrHS1GgnhqrVesFUW37bgrvKXupB66q
	 PhupcyDvZiQZ7qXGpJDYd7hTTPHD1/qdu6rv43S21zJLIJETu/MC3HZsaznGw6uueT
	 tx3ty20Q3HRYw==
From: =?UTF-8?q?St=C3=A9phane=20Grosjean?= <stephane.grosjean@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: linux-can@vger.kernel.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Vincent Mailhol <mailhol@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Subject: Re: [PATCH v5 07/10] can: peak_usb: fix RX cursor desync for self-received RTR frames with SRR
Date: Thu, 22 Oct 2026 16:11:55 +0200
Message-ID: <20261022141155.221110-1-stephane.grosjean@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-179124@kernel.org>
References: <20261020-canfd_check_channel_idx-v5-0-a62b35b867f0@peak-system.fr> <20261020-canfd_check_channel_idx-v5-7-a62b35b867f0@peak-system.fr> <sashiko-outbox-179124@kernel.org>
Content-Type: text/plain; charset="utf-8"
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

On 20/10/2026 16:25, sashiko-bot@kernel.org wrote:
[...]
> [Severity: Medium]
> In drivers/net/can/usb/peak_usb/pcan_usb.c, pcan_usb_decode_data() now
> increments mc->netdev->stats.rx_bytes inside the non-RTR branch before the
> PCAN_USB_TX_SRR bounds check.
[...]
> Doesn't this leave mc->netdev->stats.rx_bytes incremented for a malformed
> frame that gets dropped and is not counted in rx_packets?

Good catch, this was introduced by moving the SRR check after the data
copy. v6 updates rx_bytes together with rx_packets, once the SRR byte
has been checked.

Thanks!

Stéphane
