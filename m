Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018961;
	b=0W164wwrhloZWEWfztZxaNC23MuoMEPG5FSqc5QGmpFeIax+p7tFEXJiZViFMH/uYMq+
	 Q62EcP3fgR7tGPjNBNCnXaZxuIY8UcvYpyTwDv1B4c0+LKsLfSZP/c/RpK6gntinWDYQC
	 fwAKwFCf1t+HNTn4kr0SaFetn9GJVyAHy+1aQJWFrwLQni2qfYdNT6pPMJTs9A6gghlAt
	 g9AtPmb45dF4Gze/3KdwPrl3uktsOXslTofUdFzE17WIXDWjCRuqNpo0DSW9PaPPwSqqs
	 kLwA+4FyHW7E0GQk/k8z9W/rUaDVHgzmQJd3Oq678eUMfsOVcHmVJ7Tg1+EdkXX1X4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
	b=N+j0Bv+uw/MSezROz0oAkc9O/vUz1/THqwxLHUnBr5uJ7mReBw0GzIR0yvz4/TiyS8zO
	 MwymVEwnog8WrW/zKjnu4DocamAIp6AQdGjhtrDRmwzuTfnkLXPkmD81G3Yy6x1f9Wfbd
	 CxibwlvL/VTiXkZnXTyWHLLLoifsYS+fR+knRYmF4QpFrMeHrN3zD+s2o7AfOda0e0sh6
	 84CbdWgPcG37neIgvBFI3iKSdqi2BIBzXIQ9WABS529RKrsvtdYAlza+RCNMto8J7DXu6
	 6AhKFHWzksmWdpd4ouNPhiHChUn/9ctfJj0C0/54qHewWyFA2wzbVAnothynSQvBwAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=svhHM7Xz;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED57606A331
	for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 16:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED57606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=svhHM7Xz
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so837280f8f.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 18 Nov 2026 08:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018959; x=1795623759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
        b=svhHM7XzpxTDo05DvdnGKkJ04H3d4T1WNbMnN2TDcmzh92iWDOYBAuqvb29E2DCOqy
         hM8gYp9DDAwCkuTRzyq9/PQWpQSTlZdZRh/Je0LEMlehuBU8T0V4rhnXSErcH9ovrU6B
         HDKBzPYr6VBANED6+BH6qw7eyXxDqYh8UWG3DZ5rSsWy9GjaID3xysEmirVOyGE+qLlN
         3M72uAuCMaYO0avWmz0m7UfrkM19i/r7W4fFB9AnkCqMFaVt6KpAJ8AetcU76BUCIlsJ
         /eBApvw6+tSuVhJEl46JjjuYyqQM7bm4mIfGEiZOkKVll7sBnnKenS3xb+Mki80WYgZ1
         tLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018959; x=1795623759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
        b=qF7vDRMSYLyUeHhGq6ff98GR+eVKpXfp8/VvNRzGRE5+Qe+woxAc/MJJ/JyoU0ZEVc
         XRKOQClDvkXjTBA9y/7I7D2y0bKnQUK73QMaRIAy3u7tBwjpgbiE6c1Grd7HnzEK/k0u
         zV6V6w+8Oc68R9VVQC0pTpCa/oW5D4wEUulZv9ts9uUewt5mzU+CraJR0/518CAJ7ArI
         1GT1i9Jr7ziTUTegNyFVkqJBsMpsSMzAIvqTL8+T9KHFDhEyEAnEgLWi2YV9pyw0UJPo
         niovgwfm1Uzr6XMxxp8urdq4xoMTGv+hRw1QIdbuvJX45OLqaOi2w6IG1LxHUrFBO3Oq
         G2Dw==
X-Forwarded-Encrypted: i=1; AL+hErFfMxQGBUjPkQieuZcmH1KkpTD8s2SmNIofhCK/ApBg+EhxwZweI+967XaeGSXLCHkRYGrFTnWGJvdZYHVK8cg=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Z4PGXel9DovMOy8t49reC79jC0ijz0rW43VzOT33MhGgWnyix
	fzPP5maJUArIn+B/nd24uFlOhxsLrgIiyrKu7jp9JgT5eC0cj+2r2OWu
X-Gm-Gg: AZFdTZeuq7ABV+obx3GixZOa6/zyii196Eonuw6G4CfIl1wx00T/oAfGFgf0j2scXmK
	QyeR/lfXIqHID60LY74sJu1JFsxoqOlprZFOUagRK9URpSeQgCJhAMrIzXSz1iVeGAZf4qgvmh4
	3vo34lCiZaLRnEa3b73MfVDFNWIVlvEM3l1Z3t9IrR6Zawa/wgN+5BiXyzp5gd6BvUDuBuos68p
	LETDjpwkcXqOS+TJUJSBR/WNAWBkma6Ubws57UvRMRQpZOvg6j2tz67zZ7VtfP2u30096K0ScZU
	aOiSI4Zdd+za/wbp6DKjqkME3cQ/RIy76fSlh1WQf4dajaDgtilT9/lJuLa3ywhT/xo5q10UPql
	TrPKN1ck+B628c2/9wYZfXFBjcbsU1HP1q4WmaU9kwtPMXCTMrZXFfwCtRdZKRR5ajJaYFoJGgR
	meuIR8b4gYmUwxkVEs/Cx6EJuOVx0KbWfo6KxONSz68g/OoS9n6uprPje2X9KDBGJ51uJTXaae/
	ai0l/cHdwevMK+upzsh3wPceRfuAssyQjTLOqh3yFsZevN5pnp12tbq9duqxITHtOe+j74rS/gf
	N38CU2Edgx9sAUPkRaYwFK8cfywIgHIc9wFR8jfwevggPL34oTP4zwLjlkHQsdnCWiWlo5NZJyB
	ST2M/E7xtKXUzutqHwLddV9xCZnaG8do=
X-Received: by 2002:a5d:6f0f:0:b0:48c:4f6f:62e3 with SMTP id ffacd0b85a97d-4a63c65829bmr5664866f8f.18.1795018959207;
        Wed, 18 Nov 2026 08:22:39 -0800 (PST)
Received: from localhost.localdomain ([2001:861:39c2:e340:26a9:c0e4:d23b:6722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm5780458f8f.36.2026.11.18.08.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:22:38 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] clk: sunxi-ng: nkm: use div64_ul() for the rate divisions
Date: Wed, 18 Nov 2026 17:22:37 +0100
Message-ID: <20261118162237.1664352-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ccu_nkm_calc_rate() and ccu_nkm_calc_parent_rate() divide their 64-bit
products by an unsigned long (m, n * k) with do_div(), whose divisor is
32 bits: on 64-bit it would be truncated. The N, K and M factors keep
it far below 2^32, so the results do not change, but use div64_ul(),
which takes an unsigned long divisor, as coccinelle suggests. On 32-bit
it is the same do_div() as before.

Fixes: e9d9dae0d248 ("clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611151822.QXTOs54d-lkp@intel.com/
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Follow-up to e9d9dae0d248 in sunxi/clk-for-7.5, for the coccinelle
  report of the kernel test robot (do_div() with an unsigned long
  divisor); squash it into that commit if you prefer.
- No functional change: m and n * k stay far below 2^32 for every NKM
  clock, so do_div() never saw a truncated divisor.
- Testing: built with W=1 for arm (multi_v7_defconfig with the A31 and
  A33 CCUs) and arm64 (defconfig), no warnings; on arm the divisions
  still go through __do_div64 (no __aeabi_uldivmod). Not run on
  hardware: the generated code for the rates the hardware uses is the
  same division as before.
- Tool disclosure: prepared with Claude Opus 5.5 (Anthropic) as a coding
  assistant, from the robot report; I reviewed and understand the change.

 drivers/clk/sunxi-ng/ccu_nkm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index e5a8f22d50f5..a11d51dd0f2a 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -35,9 +35,8 @@ static unsigned long ccu_nkm_calc_rate(unsigned long parent,
 				       unsigned long n, unsigned long k,
 				       unsigned long m)
 {
-	u64 rate = (u64)parent * n * k;
+	u64 rate = div64_ul((u64)parent * n * k, m);
 
-	do_div(rate, m);
 	return min_t(u64, rate, ULONG_MAX);
 }
 
@@ -45,9 +44,8 @@ static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
 					      unsigned long n, unsigned long k,
 					      unsigned long m)
 {
-	u64 parent = (u64)rate * m;
+	u64 parent = div64_ul((u64)rate * m, n * k);
 
-	do_div(parent, n * k);
 	return min_t(u64, parent, ULONG_MAX);
 }
 

base-commit: 3f8438336a3b340ffbda9e89480630436423782d
-- 
2.43.0

