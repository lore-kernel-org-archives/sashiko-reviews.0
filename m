Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83E8370AEC
	for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 21:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787607341; cv=none; b=Az/IpfrRI4rYu9I8sEBDMrly2wMQ+/HpIJunMeUU4sOYg/kO2U41ZdIK6/DpW9XAxEFyW+RNNEavVH27yu258xw2mjQUcvMD1JW3T9VNJCSIM1ELRvE0LPnI5UWr7GFARNK1HShH+xwpKtI8hoWxwrIYjvzrwgQqnHD0Zo6tK30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787607341; c=relaxed/simple;
	bh=yWQiJFBQ6Z/CdcZVha4rKQlEjViKMbG4VWIrLOGW3KM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LqBPnTJBRebmy+QmENhuFJHMTVZ0mOKMcztMb9VQ0jnS51C1iDnAa97HbTK7aJhcY38hRm6C+s/ZHJaD5zm68kpfzCUXpE8b545OWJftcPlIHgkY15nzTviQHdZOItvCC1jm5hjKxs4VZBNYdt9RtnmjZ5PgVc5prIS97+ukUds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZJQLVrH; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZJQLVrH"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d049069377so34618295ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 24 Aug 2026 14:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787607339; x=1788212139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWQiJFBQ6Z/CdcZVha4rKQlEjViKMbG4VWIrLOGW3KM=;
        b=RZJQLVrH/q7JpKVtWKBnpQt30mozKLRqYJt00q+P978jnYOE8W3JxxTHGHbaFCbtCW
         9lzmvzmtsYa/aSNEl1v1ZwGJNMIFCIcOXtzdxYVdgYizqpXQ1mOW86/LzmeiT5qkaesp
         +GJmewPcENgUlpQJdcGgWxM80AsbxmtQ7CPux25nJo9WVgLKiH9Q01V2SEmSwPJxIwkZ
         ZqmEBGf7VLR4hihNUYS3qDvGkOIdIuTKaj5WteKIBnHDzpsMd1DH1CoOkdxv2PgPziKK
         VKNV+tGKZEvY3ef2U38MIWqJ/CHfYSaOHM3PzmiV4M1a67Dkc9TNBEmvD2OmXkSncEXj
         aCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787607339; x=1788212139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWQiJFBQ6Z/CdcZVha4rKQlEjViKMbG4VWIrLOGW3KM=;
        b=VwJ+7Hr65EtGxAsTYCxKPHtUmYa92qzvf4w3/fvD0e/TTWhzBW27C0yi8+Gn4yH+KR
         4sBNjVwPAxs9o4GUWgrQMyU/EoQ+kpK9v2QcQ6z0FS84u/LyNICkf0Xkkpfb7PgGyQRQ
         RDhNDpEfaq4pcsNvYgBaHL9x+qrEk8LHYmx0eEiEkdVkRvWDsvqhN4YmLIILqitUwWQh
         WQ3CReuRXP+/Yg6RFFQ9Z9Ah2dw75W8Id/k0827705fNYYeeBXf80sYq48LAPEmTBE2I
         sieFxjxzpJTokhNAvZU4BUlhyi+xgfkggjFa4+m45O29r7mCPUEmhv1hcRpcl5pYPzO/
         T+tw==
X-Forwarded-Encrypted: i=1; AHgh+RplyllPRCRbsF+jeWrl7eEg4zp3jdZMIJaypi2lqSdtnNoCgwIUa4+7j9WWSMk9svGNOBkzn7Ubf+/pPMew19E=@lists.linux.dev
X-Gm-Message-State: AFuF++kHR786obEq2jJRFWQ5IFipy5P13Sl/tOSa82LgoGrQBbcpVsp4
	r1o4Ady1CbEV50sEoVA6+iqNf3k9kCSBVRF6d0dOteAEnuX57+ecTpMB
X-Gm-Gg: AR+sD10MyZ2GflQru07n4sivp/NeUt6ABhqSvnahRJylUWA97IsoUJF+N8vsV35Ykdn
	qrDHGOuqkNVyL/0qQzR4bT6jC9TbMsArN6pdAB7vizNjop2TsOqqW1MJlxGimn6iVoat6i9JhjR
	mc7WzaV18wW0U96NqpQbpKOQwLpHgEhPTD2gNulq1CvYB+0l7AegdebGXr8s0PEisxnEL/j/9WA
	ZXO82HEUFZV1vFS8T8AvkbBKTeVl2SjGXbdqvxh5/1+8QCsDSxA7Cgqn6vvI0H4MWAfhXkZ6xeJ
	vV5EylhDCPZ6kI/PLzTDLqqTbwvo7+P1Sv0kdwgFnz+3oGTUEhStwDW3pLUmoITJMQCHKO02KHO
	7D949i+dB01bdzkhvD20KgbGwR2qjogkXR9e3mQNfsFcxU1WoaXJk1HP5mrsnmw1kxefTDrwhEV
	J2p4xg3KKRRbbUoaANdSQSeLvuxeaU5ep0nXobo10W+6Je13ibNPe+dANOmlSQHVm68HGfhzzzc
	shGsDHRw2HWAim30lpI1RCe
X-Received: by 2002:a17:903:22c3:b0:2d0:cc92:f7a9 with SMTP id d9443c01a7336-2d6dca94914mr40050445ad.4.1787607339160;
        Mon, 24 Aug 2026 14:35:39 -0700 (PDT)
Received: from localhost.localdomain ([2001:4898:a800:1010:84e9:817f:7171:6561])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d67678af7asm21685125ad.19.2026.08.24.14.35.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 14:35:38 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: sashiko-bot@kernel.org
Cc: blbllhy@gmail.com,
	linux-can@vger.kernel.org,
	mailhol@kernel.org,
	mkl@pengutronix.de,
	o.rempel@pengutronix.de,
	sashiko-reviews@lists.linux.dev,
	socketcan@hartkopp.net
Subject: Re: [PATCH net] can: kvaser_usb: validate command format before parsing in hydra receive path
Date: Mon, 24 Aug 2026 17:35:30 -0400
Message-ID: <20260824213530.43827-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819151026.9296F1F000E9@smtp.kernel.org>
References: <20260819151026.9296F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Aug 19, 2026 at 03:10:26PM +0000, sashiko-bot@kernel.org wrote:
> This is a pre-existing issue, but do these error paths need to reset
> usb_rx_leftover_len to 0?

Yes. Otherwise the next transfer retries the same malformed leftover and
fails again. I will clear usb_rx_leftover_len before returning and send
v2.

> This isn't a bug introduced by this patch, but does the parser loop
> trust cmd_len without validating that it meets the minimum structural
> size expected by the command handler?

Yes. The generic parser validates framing, but not each command's minimum
structural length. That is a separate command-dispatch validation issue
and is outside the scope of this patch.

Thanks,
Cen
