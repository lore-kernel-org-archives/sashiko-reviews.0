Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F736494C
	for <sashiko-reviews@lists.linux.dev>; Mon,  3 Aug 2026 03:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785728484; cv=none; b=psU1hM536zpZpq269tz7nx6m1dTu0Qav9xdXscTp4G0lT+CuUdKUFXqT1qfu/8wuY8lkPUP5CY6YbJeFZAru5unO1Pe84vLaOWF9kTqarwD2ai1IJebU3ZYJSydZ++C4cjQ+CyngQatvDYnFf04FczwR96YswkEMBIZE3P0nEoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785728484; c=relaxed/simple;
	bh=NCMW4kQRyBWSj2E3oOTBkzWRrKKMpt0eKzLDMpatx9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHCJ1g/PhQwe3sdbMJ0fXcS7lxEGnASxNIdGnsAG8D3P8qgDRh/IGXtq2cdF82uuiKwAgOBOU4R+401KKAJ6ZC8gtqvTjphM7X7tp76e63GbXxklq9xTmMDhdFy6MCefoYQqBc0xDv3IZzVOtxG1HzgdVMU2DSu7fSWlUE/tJG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=0s7cHd5P; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="0s7cHd5P"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso2226656a91.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 02 Aug 2026 20:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1785728482; x=1786333282; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NCMW4kQRyBWSj2E3oOTBkzWRrKKMpt0eKzLDMpatx9c=;
        b=0s7cHd5P9c4CKjT9m99bGgcJtZyPgSmA2lX4StjaD1tyuG/D2l7ERzEDghvj9OTSVS
         I5L3xY/UqjF77iVzRJ4kT1PRsRixNDQBpKmEfIK7nMmbXE5GJ7VRc6CLi8c1DpeXrHKX
         ZKt/bob0BTYYJVZY55xWcyZQOpg3ATljr6NDPwpOWeoFEGP7/oz5vFdDjN3f2LzXe/h8
         Di/+Xb6UGRtKlQj+4uJ9P47zXnhxC1RXrX/WWTldd+hXiLHIv4qUk0Xqpdiuhe6rRR9z
         g4p+S6kyVE4mWNa32dNmzWxkQElro4N3yMg58m+TojPGnfXdsb7wcCwtNLPot3WeFwLk
         tQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785728482; x=1786333282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NCMW4kQRyBWSj2E3oOTBkzWRrKKMpt0eKzLDMpatx9c=;
        b=ln4gYHqK/w2Vk9E61devDNnp4d+sKadQ9beO7E8jgnl0+WQqO21HVRoNb10v6SjDbr
         Ht+s1zk22WSVFsxega80TXfa2i45Jpmw4+0GAWCSaXr+Jdz1W/I/nHqPmiUdmz9psO5c
         rHPQsalhOTItEAbHGrEfyFEj3Ho/Kbk6oW9KIC46hi097Zj3j40AZIWG4Q6vbAxK6svR
         JftUR+1zTdfuY4qWZSpUPyQGFExrjyJRXBu7dsi/sO9BlYRKxOLzASz+kEAAXij3NhcD
         ze2T3p3xGXtmwGurFF+AodmcfK+iWTJpMeg/2r5lTTQuBHxpzbRUvFjIvSlMrEnjj/Dx
         8Rpg==
X-Forwarded-Encrypted: i=1; AHgh+RplopZXXyLbqwSFF+Idh28FUEM++mbEoYF44VtZ3mJwq3j39eCcNgnVoW3bRoEcsMuurXHgmjEm14Qgcl5MYHU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwXYdamASc4+US9nEYBKe4KO57j1HG9zAGlN3XUg/kw/9yIca0U
	UMsYzpZkkq6aP8nfQtTZ8Nz0qvwthXrqvaE3h5x4n8MFlB55wvyoikcp1k6pQ0fmQK4=
X-Gm-Gg: AR+sD13wphxO8AyDdxE4Jz+6PiRAzrCdc4ynbZ49Idz49kFpcbNe1x35LGrUMKjVGbq
	77Di+dBRitqjEslgPfgb379/OphyiPx+u58fBxK7jyaJMbcnQHRZ35raugHToktwHWqFmr48+2U
	wIdxmHPrAtRTOAMc2HJdVj4F34C9Eove0rgF3GVjSPX0UK7N2nO8n34PigGY00hq08m6OCZOGUg
	QGLSVbON0bUiGpqafjPGIxdSOVpVhUM1r2M311iyxyphifA+KrTGIsEYKxw8tcEOiYz7nS/BmWd
	GSxovRFgAsAuJTBu1zObZlKOcDSQeHBweX14lCJjVDIfYXlldk67S9+0DTaHgfyv7YMHmGSYwIT
	o+DBXE30O8ioW0qa+GuB9fPwXXlmQ1Iq+0w2uh0JSp4eaa7M/11soUomA/BJ3/0cDv6Zy9JsjjS
	gPkyBaH/jozvRWTW4sSjDc9uOo6kIh3DmHpr0ZMDO9PjhvL7bL83rvx82ad8JQmW/xv9Oi
X-Received: by 2002:a17:90b:50c4:b0:38e:447c:9a15 with SMTP id 98e67ed59e1d1-38fbc516655mr7151775a91.36.1785728481711;
        Sun, 02 Aug 2026 20:41:21 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2bac654sm3299609a91.10.2026.08.02.20.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:41:21 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: alibuda@linux.alibaba.com,
	dust.li@linux.alibaba.com,
	sidraya@linux.ibm.com,
	wenjia@linux.ibm.com,
	kuba@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com
Cc: horms@kernel.org,
	mjambigi@linux.ibm.com,
	tonylu@linux.alibaba.com,
	guwen@linux.alibaba.com,
	guangguan.wang@linux.alibaba.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	sashiko-reviews@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: Re: [PATCH net v5 2/3] net/smc: bound the peer rkey counts in SMC-Rv2 LLC messages
Date: Mon,  3 Aug 2026 12:41:05 +0900
Message-ID: <20260803034105.2051552-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260801094208.1937951-3-yhlee@isslab.korea.ac.kr>
References: <20260801094208.1937951-3-yhlee@isslab.korea.ac.kr>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Does this bounds check allow processing of stale memory?

It does, and 3/3 of this series stops it. This patch bounds by the size
of the buffer the message landed in; 3/3 copies the tail of the message
into the queue entry and bounds by its length instead.

The bound in this patch never fires on a link with a shared v2 receive
buffer. It works out at 507 rkeys for ADD_LINK and 2046 for
DELETE_RKEY, and the min_t() above it has already capped both at 255.
I measured a 44-byte DELETE_RKEY_V2 declaring 255 rkeys: mainline and
this patch draw the same response, and in two of the four exchanges an
rkey read past the message was live and was deleted. With 3/3 applied
the response reports 9.

It does fire on a link without that buffer, where it becomes 9. That is
the out-of-bounds read this patch fixes, and why it carries Cc: stable
while 3/3 does not.

Best regards,
Yehyeong Lee
