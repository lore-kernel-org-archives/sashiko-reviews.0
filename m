Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612565;
	b=SUwpJc1CR2lNTs6N8d+BDgR/W6W97mLoqURNspx1mHPE+vBQbmNWiwle9M1QF77BVX34
	 nuLe/WdCOf1oLfKHgFI7U6I/sMzMsHGg3el4kR1e2BnaR7roi3o/4R4iFe+jSZ1TaBIBn
	 bXOSkobIqHZ3hpEwZ5o6HfTpKVVyEa+K/Dwq2QWpWcXIHNaaqsz9g+wIJX+nkiCzDfBFC
	 uhAdQT4rFYHXFmM8qbrCQ6CZhsW+aUMV5C3t3CJQguadcmBMMScvNXi726XjuvMcnwlGD
	 BBoBanMEvLkXvH3YTMDTKoOaSXO84KDicFX73UydrwiKK4MX8ScqkbgqEBBKBeyGy1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612565;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fS3fd1kxqIasLSOLsWPb3nWgBbFcJfSOZ+BlIh18+/s=;
	b=MGXFaMCIfs//U73jCI3n0a7oKXDWE91BmK4McKeOlnvRk5b0IHU+tX+Yhhmrv8VjJ+al
	 EUaMP7uat9HVIAUVpGWRtj5IX5UeumLsQfgXlAaznu3kE1XAmVVQhGk9Bg7kUxSf0XsP0
	 xqTzpbc0T9BkSPIrDWEjtTuH/rY5+wxMMTq/YWc4cZJH5/7DYASyZxraZu/eCEQ1Lbrc5
	 mXtXsv3LneeEM8bIchaiqrB9FJtNcHgUOQnzbxiOlkV1WtsupWgftJgIpUlqRTiRlggHP
	 BNrjGEtqYDpOdKbdyO/d1lqrHJ0LpOsM6v+BfPg0CKGsvxyVo46hhgn8qULHAnr6sDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezbkTwrC;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B3A606A324
	for <sashiko-reviews@lists.linux.dev>; Mon,  2 Nov 2026 09:42:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21B3A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ezbkTwrC
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e9d7791b00so20912145ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 02 Nov 2026 01:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612564; x=1794217364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fS3fd1kxqIasLSOLsWPb3nWgBbFcJfSOZ+BlIh18+/s=;
        b=ezbkTwrCIGgUCVWozwf8jFrXVt5WXxuYQiu/LGqpS2mIBG2i8OhJ31Zw1/6vi69t21
         MpI7TwrNTI1KpQq7BUknwiWD9xly2R0tM8hQJW/oVRY/B2NnLGmiPrm8rhALv9cpb2QW
         y1ZvaR/cZOzvhGIfuRgJ0K1zbsQS6+POagbco7/LHHEA3TUMRAjjzY9uJakdYv0UJxkY
         iH8H2abZTBJgQLfWJGuDcu8Qs10YKMkECqOVoeICBIvORMKMDIvCtGZ7wfylAdgvA1YG
         KWv4UQ1aeVaHcumAjWk2gSq3MSKBIkbzYY4ntGmoAZ5VHJny6g+Zl4eGnZ3ANULJhxnN
         hBZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612564; x=1794217364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fS3fd1kxqIasLSOLsWPb3nWgBbFcJfSOZ+BlIh18+/s=;
        b=Ev3pFqUTqnkr9pxjSCDfg1J2Q+pOxsTzvn3Kpi3Pgik6WIiW5+Sx6wzkBvlmszE7Lv
         sdxFc2kNqw2o6zspgiExti/EHEddKXc/gLEgkoRgZpTZq02Oh+LMPqtmK0Y1barL4Stj
         0nFrTmixo7rn7vBT+geRC5ImugXjqC2z7IzaqtclzGWSnmVyUsNb8efx6TryhIzpoYsI
         AgrPXPl/e6sbgdO8KayeQSHH1qbMQns4J3QcW6ip+Vk0WkTdhdRkV/CSHfXqdONXXjcG
         GTZ+CZZjuf8DSuB4Qit896iL+50sUWqDpTZ6ims8epyC76/sezMbgMAytZpZcWYCtAtm
         vmtQ==
X-Gm-Message-State: APuU4Z/cw95Kz+XhLU9U9peBtJNnNK2E70x9jfYjsw//VUMvP+aZExyU
	+pwOhhedvuVETgYWvuq2U5EigLkO1CI0uQNtEHnALLK5mTa2o32ljkWxbr2YdACkRo1Wyg==
X-Gm-Gg: AYBFou1OpJa+zI5jnxH7pLxEVkygRN4qkbOiOT+5UOLWqa5sTEmxtmCSRKHlzhutpFP
	+NDHMlfqVlI43oOcRwwTFU2YNinCRwOxkOixlIwCVvDRaHpmh9dqA9yr6NahvryyIeyFrUsN39n
	nykYV6F98Xgm/JRPk0QywxmS2ja8Cd0Hc6Pk2d7XRS/eo5eMvASZtHQ7cx4jDmmKChz1KHDd7EN
	i89nmFNBiGi48HVN2NEIzd6WCGfAtD520y+cgDzROBM0VlP12RuvBnHnwkRAbhey2ruCBjtxAe4
	qV2o09cSdxT4cchA5o1VSgqQuDt/dlbIq/CBL4v8/kdwbxHA1WluwCJ89tBiaJ4ufMp1HxrSjgt
	OHyI+m9SMARtbRfcXU6f/ypzHHpCb4yQsTJXfRRBvZ6zPPpCWZcNlg2m73n9VpwTUvYIAGtcnnm
	6VuGtPumEdO4G8QuDd5VAYmGSrC1yOSpkgI7+awnj47AiNgchZxq5r0u6OdDRND6OwSsmXa/vtO
	CtSPXz37LKoSbPI1r/5pW/HZY3W2biAgF0jhAUyGIGPiUdGYvY658moxQs9f7zWEry7X6tF6/7r
	xh2es2I8qj6NNphRb7Toyip79OqQ1bLv+fyPR8yqIRS5VRypDNqVYXk=
X-Received: by 2002:a17:903:13cf:b0:2ea:7180:3a82 with SMTP id d9443c01a7336-2eb36402562mr93347925ad.1.1793612564355;
        Mon, 02 Nov 2026 01:42:44 -0800 (PST)
Received: from localhost.localdomain ([155.69.168.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb77df90casm70975ad.0.2026.11.02.01.42.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 01:42:43 -0800 (PST)
From: Yuqiang Sun <izaiahsun@gmail.com>
To: sashiko-reviews@lists.linux.dev,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: amit.kumar-mahapatra@amd.com,
	luca.ceresoli@bootlin.com,
	harshit.m.mogalapalli@oracle.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: virt-concat: Tear the concat down when its master goes away
Date: Mon,  2 Nov 2026 17:42:35 +0800
Message-ID: <20261102094235.34511-1-izaiahsun@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <sashiko-outbox-193135@kernel.org>
References: <sashiko-outbox-193135@kernel.org>
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

On Mon, Nov 02, 2026 at 08:45:12AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Critical] mtd: virt-concat: partition order corrupted on rebind after partial teardown
> - [Critical] mtd: virt-concat: use-after-free when master unbinds with concat held open
> - [High] mtd: virt-concat: double free of eraseregions after add_mtd_device() failure

Thanks, all three are right. I reproduced the reordering with a concat
across two flash devices (it comes back as kbb-kba-concat after the
first one is bound again), and the held-open case.

v2 will keep each part in the slot of its DT node, register the device
that mtd_concat_create() returns instead of a copy in the item (which
also removes the double free of the erase regions after a failed
add_mtd_device()), and keep the concat, its name and the parts of the
master that went away until its last user puts it.

One note on the held-open case: a plain partition held open while its
flash driver is unbound also gives use-after-free reports in the MTD
core and the CFI driver, since the driver frees the master while the
open device is still around. So v2 makes a held-open concat no worse
than a partition there, but does not fix that part.

I will send v2 tomorrow, to leave time for comments on v1.
