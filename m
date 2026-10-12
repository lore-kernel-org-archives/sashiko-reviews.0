Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4170847798E
	for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 12:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807377; cv=none; b=H2pZ1SZ/hy1jTgM3N7CPdy6gNdWvmdt+XcrSOMuDk31bdozXWq5Cv7mPv9lk2Y3hoZ5GYe2hLn6yfMHb+REJTc8+XK76YPTm/2ZN0YfC2jLvzDWmJhS0NFrU8EsALMFU1fMivijEDRKtjEo/nbLJE2erCczC1Xdrkhqq68SSGj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807377; c=relaxed/simple;
	bh=ug2SZVPl89ENEQR7M1tByPrxlFqHv5XwrZnkPgJJuQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hgUAfG/7xOYO+c1NO6ydlLktmHSHMtFBSanU2CfJ1iWrA3X2W6Id9ziEht5zQAGDNTtQro708uKaez4mOJ3Xdp931km2tLUzA3b+2m24AYaSiAMIrxr/KwEgVv9HLErO6QMv8r80vgsxkyfCnywb/9dDiXAFe8vc35I65/kkYWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=fEKipV1j; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="fEKipV1j"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ab98332238so820987a91.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 12 Oct 2026 05:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791807375; x=1792412175; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ug2SZVPl89ENEQR7M1tByPrxlFqHv5XwrZnkPgJJuQw=;
        b=fEKipV1jaNATiNpw6/vjWAna6yokVE14FuTJ1XFMClQSimKfvEUlJCrd+a5YWINfTB
         6mnX50UbMwcdpR6fchO7ORYqpCKe0CmrGC1tFki79so3UhKKokW4PqNYfaUuxVC7cq2t
         hOGhU3sdSMhkLBCb4CS6gCZEuPS/EGqQKclE/ZBTryZ9HQczoNFck6pLWcdWG5vSStbY
         OMJOXLGpf3Yuo0CGxDFXGzvzp0AGFrNsP9Q6LlNN7Zu5bKVbfrbmzZTRsrOIx5m22r5w
         sdwzquXETlIR8p81gw8TzGmn0pAKTBNegZtsEZHGeKLV9XlWcUusnMTHy/xmNOrQlzCd
         LnUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791807375; x=1792412175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ug2SZVPl89ENEQR7M1tByPrxlFqHv5XwrZnkPgJJuQw=;
        b=x39SfcUzAR5WDr6LBeHtX+hCRIOVMrqvudYMeEhr91f3eVQza1fswBN6AeZQ4eqOC5
         /IcOWjNTFYlBTYY5drny9S4w5voAMYch8zZ5K+C0V6wzqwgaVLHyng1oMg5q5+eN1+i8
         AC5kyEMuxK+zSSsYWzdEB4YVceSBIo8BRh+05pyRh6TqqxisdkXOu7GpNRLCsFM48Dbd
         m2ORoi4RNkT7roJV5eXhddglXXaJmtt054cxAA2W7mF5zVN0Njg7nEXddngKpR3KRxjx
         bpXRI8C+lShgq3FkmNxJso1e0fpfU6dKOvbbi/TnZCG/v4IHUWo8ZNMOsg4QkLA/zUvU
         JzBA==
X-Forwarded-Encrypted: i=1; AKwUvBzSdfL0uoyuNRTuR6vx617TKmtT0aiXxujQA801EsBn6pwQwzeO/GVcKNHwBmQmzPEzkACSHWwNacZUNqTVJ94=@lists.linux.dev
X-Gm-Message-State: AFq9FYJR3akSCLNdgWuO+xm7rroOFcOjKnR+ukHJdTTsQUPwpcZqOcoA
	KNIqGKDVwHUVGaAALgTgsIXJ/APtfOsTfZueSlK3vTJnyZdrdh06JgV4mzDTi6WozWw=
X-Gm-Gg: AYBFou07O904wPUORrmpgvBkikt/xajn8TSGb8hGYQH7WiFoT2L9V2Ct2ZGOq8xbon4
	iV792w/9Cj7i8hLl3QHc8Kyj1g5JiLDHeUP1/9YVRWCjQLALGGMoyNszSxIvmaq1wKMYOM4vIeU
	eNDoPeWb8LAcj/nmod5x36Gt+l8Mpujx5iaO1+g4+10bHzKK+3ENXR+pcalbDnPVH4ulSEOnzPy
	avQEZiS6LtZzvxbBfbXq1nn8XCaehZ1DooIIUTgvbdMbzoqblO3NFNWAaJW5qCNKv9bk2FyEgNQ
	iud0RGFcC7gm1Tbi66BLhcax6QTPAzzs3+Yxqf9PCT5PRubs5i4JSd5KnmfXiYqR7KzYWZtE+2V
	r1SVHv0nSzpUpSlzpV8OZYcnEv7o82FzgXT/7A080eTrOomGNEQi8zRGuM4JFAQx/ofDAJjgD+J
	D24q9ncDQa/A7iAZ4lZuIJ1JMcBWajfCUQmrGVSUFSm3AO6KTIyyTh5N+kLRMcBdOkh8hVXpBjK
	eM9HC5rjZUXP+ebuE8XBg==
X-Received: by 2002:a17:90a:c88b:b0:3a5:1b:34a5 with SMTP id 98e67ed59e1d1-3ab3af73a91mr7437909a91.49.1791807375539;
        Mon, 12 Oct 2026 05:16:15 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:7bd2:1202:246d:44ce])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38ff0ce7sm17212536a91.15.2026.10.12.05.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:16:15 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: linux-scsi@vger.kernel.org
Cc: ching2048@areca.com.tw,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	thenzl@redhat.com,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v3 1/3] scsi: arcmsr: bound the firmware-supplied message length
Date: Mon, 12 Oct 2026 21:16:02 +0900
Message-ID: <20261012121603.2335651-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-168035@kernel.org>
References: <cover.1791803953.git.yhlee@isslab.korea.ac.kr> <adc1e1512a87ff16e99d066c2e96e18a1d28e610.1791803953.git.yhlee@isslab.korea.ac.kr> <sashiko-outbox-168035@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Agreed, and as you note this predates the patch. The clamp here only stops
the out-of-bounds write into the 128-byte staging buffer and deliberately
leaves the rqbuffer accounting alone.

The double fetch is a separate issue: the free-space check in
arcmsr_iop2drv_data_wrote_handle() and the reader each read data_len on
their own, so the firmware can grow it in between and advance rqbuf_putIndex
past the unread data. rqbuf_putIndex is masked with ARCMSR_MAX_QBUFFER, so
this corrupts the message stream to userspace rather than stepping outside
rqbuffer. I would rather fix that on its own by reading the length once and
passing it down, so this series stays a pure bounds fix; I can send that
separately.

Thanks,
Yehyeong
