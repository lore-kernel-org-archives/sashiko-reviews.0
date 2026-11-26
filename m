Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705435;
	b=ot/C2icJueZkBwmJ1RYTvMZkFfGhQwVVS5YhIsAfttqlKJUMvtWy/ZsdYa9onWCTeBGw
	 ShgW6YPMLKFRrGH9jxbVe1DrMotJmpYWhRZRIuBDom2RHW2QO01wtMlcL5aArBNndI+nh
	 qldvmZ1YerQGo6Q2OEvw43/FTNSza+T1/E9U2Uu0g0PAexcwj43Sz1ueo7H8VFhSRScUF
	 vau2cZRUWAg+NcSXgKjEqpFkNX1MKpIZhwSZxi8muZFkd3FnOZLfpndjySg0G2pjTUow0
	 bjqSWRPfE2QwGr9fy5FcMGYE/Ol28nyzhWVU446qfTezzj9bGxBWa9oVGVs7xxrbHOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PJOfhzzym9DT0EIFhuMmQjcHheutHEEjTA2C5YGcm5c=;
	b=y2mq/7ME8Pk45zoVM6K0O3a/r+nsAyu4Wjnu0NT51h34hDpy6OCK3pmXlDHB/hl7PCaQ
	 ex3jML8f4Qhnfd37Vwvyw+YUOL8oCJS4z+vW2aI0SWYrsB/upaFsV7oC3NH9kIWd+xZAE
	 GGuZhF/8JpSpLmBpnVayYxPUXxeBMncSPxVsyC1wbz4xfcpCde1p4XBNMOGKwtAmTu/G4
	 jiGoXltszLUIN2OOLyG3Xz7RFuIvE+7L6T3zi6CN6ZGOEadwEWWOTjBvgZgF/Ct0Q/78R
	 3mPJ4QaZH+U7KZ62k/uX/rKoQlvoLJq+ZfE+V8dQgbM9Jw4BAkheSea5S9k7Qm/z6uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=awGxtwJ7;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E88606A31E
	for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 15:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14E88606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=awGxtwJ7
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-386b8f2f671so3992858eec.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 26 Nov 2026 07:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795705433; x=1796310233; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PJOfhzzym9DT0EIFhuMmQjcHheutHEEjTA2C5YGcm5c=;
        b=awGxtwJ730XEV6fQSbce00eCGrDnIzlOItTZAbKy+TYEJP3TZ6Zu8B/FQJZ8EkC28u
         I6OaDrFk/dI5W1V4qta4p0A3BgyLdxW+nafjbUMZFTNTRpkh7m+7dnHk3x9s3dKMQFIV
         sf0v9WiboATyvN+FrsP1Jac70kvAUUh6G3cdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795705433; x=1796310233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PJOfhzzym9DT0EIFhuMmQjcHheutHEEjTA2C5YGcm5c=;
        b=aDZIXfrrNHcL09ufgp8xZUdxD/rNLd76FI3gNqFN52vikQodVejYFCA7izBW1UqRhR
         OnL3AyjDKxAYCJnEUWrHukN6xz9gR6vulT0E4fiXILq04s0ZN6XiRd985OprQdSZ7NJB
         MCZ5XX6z7oa7+//eNFZc3I+lkz1yApGF8GTEq+EMqdcwa4kmakxawOBysrpvBDezojN8
         WzsRBx3BFg4uz4yXPXw/N3EkJmJgMOHBQ6lrNeOIjMvqKCM7gWP2ss6e4wTFLvKIRM0M
         Hi3xqP0x1zkavABFwDMQOGaJsCyHYuqoPlBtVYkAgCvGbUPw40kW/kbNGzcJlfDkGAsJ
         T4vw==
X-Forwarded-Encrypted: i=1; AL+hErFU7INOsg+QVbk7wwJhgyKZJyqyg+sxav8cI7JjSSLqRbhaxuEymB8pePEDnkjWtl8/fgjQG5ASDYIl6P5kXdk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+7MaGkx3iuflBsyl0oT0AjTDGF1xpmWA+MMNWIcSbHwa8JkMxB
	3uae3YZk8kn/aIAWgQpEX9bSmGxvgif5fpvTYbk1el2WGzusQVEu/yo0wcSZFuct2As=
X-Gm-Gg: AZFdTZftUV1ZOFV4nK95BTBvH8OZHfCW7OzNRkziGyv1PgngQp/Y9oFgi0eVsoMLq3i
	GWhp8mw2X6CqVscdsMky+v44nh8JKwHFEdjaoKiy2qMKsrmf42zNDnWDzHmWUxekEejpKgkoBFD
	4bvpPtwfgp0is94iBuEuitTVxOeazJB/6I6HhM/QcKx4klRiGyp+dG1crK3CmDYpSF2qZkMRxKB
	kYNk1h+KwHl/Yzc1loV8kcUuS5ujewN5jFjjrKw2d3JKRNDzLOR+NKM5tVA8U58Y66/e40XByXH
	MkRa1saWBKneKHM7oa+GmMMjd5DeyxTU4tVKfXdTnjSSl0CHZqhRBjbw3aI1ABt1774FF+3DVUb
	oGNSp2PKSRiIT9CBcppRp7IfFWBnVjbwfw27bXIJKn0fs0N7FLq7Gbyb0WEbP+tlg9Vpc0OOsBE
	oiPADZlzRntgmXRRe7ZqmrddQyeofWnDsAc63oWqi805Hy5ZAv1C/PjPftq02ZcVRlEAK7q4+KF
	JmRN2OA7FIgB+KQgEpyyewoSJIny9qOijySUoDe6tXhBSWtXiaDRGwJY8oZwrGp1lQv/dx54D4W
	NazCqzDs5HRkNFLnXrogtC00cP5MrprtmtxVVFLhGhBFKSb9WoeU5dLpl4xO5HZFvemhti1LVla
	Z1JerAcygWhwpxZNGlwsO/okeGmFqICS8QTyAPLclFx6p30ev9dAI9pk1Z/iX5L06
X-Received: by 2002:a05:7301:78c1:b0:386:a3fe:44de with SMTP id 5a478bee46e88-386a3fe4616mr15220865eec.28.1795705433115;
        Thu, 26 Nov 2026 07:03:53 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm72602013eec.26.2026.11.26.07.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:03:52 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Robin van der Gracht <robin@protonic.nl>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Oliver Hartkopp <socketcan@hartkopp.net>,
	Vincent Mailhol <mailhol@kernel.org>,
	linux-can@vger.kernel.org
Cc: kernel@pengutronix.de,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kapil@presceralabs.ai,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH net v2] can: j1939: reject an out-of-range data packet offset
Date: Thu, 26 Nov 2026 20:33:46 +0530
Message-Id: <20261126150346.2110171-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <sashiko-outbox-233959@kernel.org>
References: <sashiko-outbox-233959@kernel.org>
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

Thank you - both findings are right, and I have read each mechanism in the
tree rather than reasoning from the patch.  v3 fixes both and is posted
separately.

[High] session leak in j1939_xtp_rx_dpo_one() on repeated invalid DPO

Correct, and the leak is as described.  j1939_session_cancel() only acts
below J1939_SESSION_WAITING_ABORT:

	if (session->state >= J1939_SESSION_ACTIVE &&
	    session->state < J1939_SESSION_WAITING_ABORT) {
		j1939_tp_set_rxtimeout(session, J1939_XTP_ABORT_TIMEOUT_MS);
		__j1939_session_cancel(session, err);
	}

so on a second out-of-range DPO it does nothing, while the
j1939_session_timers_cancel() in front of it has already cancelled the
500 ms timeout unconditionally.  The session is then on
priv->active_session_list in WAITING_ABORT with no timers, holding its
receive skb and its netdev references, and unregister_netdevice() waits
behind them.

v3 deactivates the session in exactly that case, as
j1939_xtp_rx_rts_session_active() already does for a second RTS.  It tests
the state before the cancel, so the first bad DPO still cancels and lets
the abort frame go out with its timeout running, and only the session that
was already dying is deactivated here.

[Medium] aborted session completed in j1939_session_completed() on EOMA

Correct.  j1939_xtp_rx_eoma_one() checks the PGN and the message size and
not session->state, so an EOMA arriving inside the abort window completes
the session.

One clarification on where it comes from: j1939_session_completed() has
always called j1939_sk_recv() on a receive session, so an aborted session's
data could reach the sockets before this series too.  What v2 changed is
the extent - looking the message up at offset 0 hands over the whole
reassembled message rather than one window - and the second
J1939_ERRQUEUE_RX_ABORT you describe is queued either way.  Since v2 made
the delivery whole, the state test belongs with it: v3 returns from
j1939_xtp_rx_eoma_one() when the session is at or past WAITING_ABORT and
leaves the session to the abort path.

Tested on 7.3.1 with KASAN.  The reproducer from the v1 posting still ends
with the session rejected and no fault, and net/can/j1939/transport.o
builds
clean.

pw-bot: cr
