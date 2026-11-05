Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.181.97.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891545;
	b=UqjIQn4zWSGfCvmoATdxSOTk7cl3jOljPmA2M6zuG8At+lDjYaoOya3OI2RTmRM2PgQf
	 g6aBXeTE+4A8x+6n5ozxw1Vtq4BogvaU8TO96pGjAnXLNncMFoXaUwxxp8wmlpRIWITdh
	 7GVQVpYuDmrFtQ7/mB0RW5+o8S4nxA/jVAtft0FLYRlV0y8SoBUzFS4+Td4ALtCbh50/5
	 MYxRwNBAeKk6lDKCt7J85+62LkBj2e8ZqHej6hAm3Th3oX6G4ptKLN/r5vw4wkQ3Nkkaj
	 P5HdAn5c0M2gY7hx4+pqRuRSBTjdi/+D+yjRiDz6Dx66yxWT8RfUai4iQLO51uizsUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891545;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Virus-Status:
	 X-Anti-Virus-Server;
	bh=WElitZFefKv0rgpm3AguagYp7WsTnrfiJcI5GKSEC6M=;
	b=osGNnfgJDWM3IdYE7wmB6zsMaJxzw6SPJoVuHR3vY1tpWpyhki75XHumiHEnSJWh00ax
	 cohblyFes4h/CTfkZOAFU3O+/pZVgfIlGsku3VGIQJFrS0xIjtQ39eFN52m9v2pcuXrFK
	 qgt3X/pLt4dTGFLPZFPb92f/kI1aep6y1TxYBodiR5qWoaQK8k2Xxqf+45f2+sfiowPsp
	 iAU4bDwm9hYKnpmdLYFyKD1hwK11QCB8FC44TgMTrBiWsNOl1VEUq/KnlflR2xu2SDNiG
	 0v8cyziQqyq6+xD/r3pTlkJlonuY7KXl73yIsXGFDm/xmaheB90ONSAz4fEwRs9q/7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=I-love.SAKURA.ne.jp;
	spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp;
	arc=none smtp.remote-ip=202.181.97.72
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBD6606D802
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 15:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DBD6606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 6A5FCAql097941;
	Fri, 6 Nov 2026 00:12:10 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072072000.v4.enabler.ne.jp [106.72.72.0])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 6A5FC9LE097937
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 6 Nov 2026 00:12:10 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <32fe7f0c-4f2d-4a52-98cc-84c63bee9d3e@I-love.SAKURA.ne.jp>
Date: Fri, 6 Nov 2026 00:12:06 +0900
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] can: j1939: fix "struct j1939_ecu" refcount leak
 in j1939_ecu_map_locked()
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: sashiko-reviews@lists.linux.dev, linux-can@vger.kernel.org
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
        Oliver Hartkopp <socketcan@hartkopp.net>,
        Vincent Mailhol <mailhol@kernel.org>,
        Oleksij Rempel <o.rempel@pengutronix.de>
References: <3d7e48fa-9af5-43e2-84f7-884e61f9d179@I-love.SAKURA.ne.jp>
 <cc9950f0-a9e8-4639-b2b3-28d64f8a906b@I-love.SAKURA.ne.jp>
 <sashiko-outbox-199025@kernel.org>
 <50c77aa2-acda-496a-b0f1-c48ffcf0665f@I-love.SAKURA.ne.jp>
Content-Language: en-US
In-Reply-To: <50c77aa2-acda-496a-b0f1-c48ffcf0665f@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Virus-Status: clean
X-Anti-Virus-Server: fsav414.rs.sakura.ne.jp

On 2026/11/05 23:42, Tetsuo Handa wrote:
> I tried "rmmod can_j1939" while the kernel is unable to make progress due to
> "kernel:unregister_netdevice: waiting for vcan0 to become free. Usage count = 11351".
> 
> The "rmmod can_j1939" operation is blocked at NETDEV_UNREGISTER event until
> the vcan0's refcount drops to 1. Since j1939_ecu and j1939_priv are holding
> a ref to the vcan0, module unload operation won't complete until all j1939_ecu
> and j1939_priv are released. Therefore, I suspect that "[High] can: j1939:
> use-after-free in j1939_ecu_timer_handler() on module exit" is a false-positive.
Well, this is not a false-positive when teardown of a network namespace is not involved.

