Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=23.251.234.58
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424822;
	b=w6C7ifSwGGkuHsM9/YrTrF6PBEj0tXN87Z81D16zJcMC+yGLVxtHSJHHgvs516uWKW7x
	 cm1Ljvf5pjQ2vyGyDdZE4bhy3WMAE8j20xwZmcJy9VvdZ1XYLOAOhKNahS6FXjQpTCCQT
	 rJwmHRYttzcPUuE+0lvgc3P2ehEM9uH9OyJw4VNmtL6sRMGbDBg1Ftg7isK229xApoMro
	 8iNn+hQDJ8tba15hmwdDcYRYcYSsGfF+h3Twlm7BUqgMKJirVj4CLcIdfEtSxv90T2ZqI
	 kkW4w8t+h0R/dKxdnXyhrFwFuqK31EBEEGrfXPnE9k9UPTPog0PrxYuM9yRUxsDaW0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424822;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:In-Reply-To:References:
	 X-Mailer:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:
	 MIME-Version:Content-Type:Feedback-ID:X-SES-Outgoing;
	bh=bA82C24dkHYIS6f3OgsgzKwCX4C0TKB5nurDcZQs6BU=;
	b=2vfdI88aUz0vzohcX0S1D9joBjw78McacMDAWijc1o80TpbZz9qVcsvq0hpYWkEr98m4
	 yegwe8IlTBWl+M7ZXO8sFewjkzzlYGlIc/Hva+lf7CYSI9wlRPtYu4h/ZGauVHSrairZQ
	 XaM/um527HWmWcXoeXS/ZJKGn1DbcLSDz8od+5dI8VpKrz/IE3KdrPzD6Q9BMshtkp2pS
	 3T882d59yhGojN3wJG90HKXvrU9AbbCje3uAGtgVjX9flZ6y3XjWfNH4GDG7uaw0eo1YJ
	 O/v7CY/E1arSsGpPzqxQgiS23ghTje1a8o8drLO/ludGIMH4xee1FfIgnZhrkCeQtHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fqwqf.xyz;
	spf=pass smtp.mailfrom=send.fqwqf.xyz;
	dkim=pass header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=WkEAmPbB;
	dkim=pass header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=r0zLaYPc;
	arc=none smtp.remote-ip=23.251.234.58
Received: from e234-58.smtp-out.ap-northeast-1.amazonses.com (e234-58.smtp-out.ap-northeast-1.amazonses.com [23.251.234.58])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863026078866
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 15:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 863026078866
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.a=rsa-sha256 header.s=resend header.b=WkEAmPbB;
	dkim=pass (1024-bit key, unprotected) header.d=amazonses.com header.i=@amazonses.com header.a=rsa-sha256 header.s=zh4gjftm6etwoq6afzugpky45synznly header.b=r0zLaYPc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1792424820;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=bA82C24dkHYIS6f3OgsgzKwCX4C0TKB5nurDcZQs6BU=;
	b=WkEAmPbBXn5sincNaWpZ/EZwEzUK+EcbGbNyd1y+nZU4XVBOqYdvhwo9HV0IWMvx
	UMgihLiP7BnYazFYubdP2oCExJp/LcdIRasW21YyEsMRZtqEt0brygiFc80Z9AJUD0u
	UZ2+FAv3azWXhEWg8HOlbzkN99i7ELMi1ct/L1hs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1792424820;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=bA82C24dkHYIS6f3OgsgzKwCX4C0TKB5nurDcZQs6BU=;
	b=r0zLaYPcueOoQaA6xyNudF62tLU7HfLnOZlty4CbcAd+oI+hqN8aLMLW+RBjxI2k
	WEyicS8Nweq2nNV1YCkBOawh9wOzJBp5TmJydCAI/IUR/fIi1aWwnJsH0hCD4FaJ+Cd
	EDS+qJYWjdHcB0vEFy4fPu1Uejqs9xpTb54G2JWc=
In-Reply-To: <sashiko-outbox-168888@kernel.org>
References: <sashiko-outbox-168888@kernel.org>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, 
	linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [RFC PATCH v2] phy: qcom-mipi-csi2: round the requested settle
  interval up
Message-ID: <010601a154d83d84-0b2dea8c-14b7-477b-b1ec-3f44b0b55ad4-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: 7bit
Date: Mon, 19 Oct 2026 15:47:00 +0000
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
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.19-23.251.234.58

Hi Bryan,

I checked the zero-count case raised by Sashiko against media-next
(d7e7bca71698) and the rounding patch. Both the base driver and the
patched driver return zero when the calculated interval is exactly
six integer timer periods, and lanes_enable() rejects it with -ENODEV.

For example, link_freq = 600000000 Hz and timer_clk_rate = 66666666 Hz
produce a 90000 ps interval and a 15000 ps integer timer period. The
helper returns zero before and after the patch. This is a software
boundary case, not a clock configuration I have tested on hardware.

Is a programmed settle count of zero valid on the supported PHYs, or
is rejecting it intentional? If it is valid, the helper would need to
distinguish it from an unrepresentable interval, with the caller checking
for an error separately.

The rounding RFC preserves the existing zero-count handling. I would
keep any change to that hardware policy separate from the rounding fix.

Best regards,
Jizhou Tong
