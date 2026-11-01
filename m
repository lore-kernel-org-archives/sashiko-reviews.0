Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793565220;
	b=ZyYNa8C2pIyXfwVgZ4C/5zrJf7CQYMxwdWA/CkbziiAgDNhKZtidj+gzylFVo5rgodlR
	 PUsl2kwRUO27oryMTBlGOvFZ7QFHsAhZrA6ew46c34PpLFCmgE+m8cMkOwaCRKXxpTgD2
	 2AFBgddiMYcVMZwZGdEiQh5UPDHakHF0b0xSDHysgU7fweD4m0sdOAjuvDXvYmaBzo2US
	 lTDbFa9PCspRxaAeJ9z/d1zqsrUlFUeOsxrOfD5S4v5anMt7w5DcW2kXo5gfeTzLufgO7
	 JirAnObKdV2LuDtPI9F+N0qmQHMguyJMdHwXdzCJ/gIuJUYZPhOTPq0vy3HGkBKEiFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793565220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r/raweGofl46CtJCMVWjd1et4wuYTKczZRtzeHYjdwg=;
	b=u8e8198n4h8IddL8d90Dxp9m2p97XKxJ9ObxZYm3rIkW8AzFDTqJ7TNfbpxnwlTyfGPb
	 95lsByQlGTIzgEGcrvxypstIFt/Yrd/Q/eVRCl3nEIUaK+QN/CioZaa2ZR49czVp2kHRt
	 lo+KO6r/sshWtfSybftSCkdeelpspkyQj41GhxCRdGYlccPRIMwVYztzXTYQrxdu8KFGj
	 nE9Sh2kj7vLyknx9W3FWS9sopT2M95wdkWJyztHInAMWy5vXiHpGlMXfK805v34LZO9C1
	 1kK88LWiTt5RNxHOrLAM36VBBEBy7GiMQp+BBVrwU71sM14+zoHwsArNrEjj3oWuG6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayog8F7b;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17B0606A324
	for <sashiko-reviews@lists.linux.dev>; Sun,  1 Nov 2026 20:33:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D17B0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ayog8F7b
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dee593f18so2123242f8f.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 01 Nov 2026 12:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793565218; x=1794170018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/raweGofl46CtJCMVWjd1et4wuYTKczZRtzeHYjdwg=;
        b=ayog8F7btGJw3CNz6kgKA8+sVNDA+NnGnPEfc810MDYFO0PB2M0aH1Va3F/sLTAJdh
         Z+szfMjRiXOAfYMPZNNYeTTXxtx8agH0gaXFjZMMsRnf10OdHiHCXDKRAtLfjV33te3r
         Rf00tPhy0qk3mAry5jD/hU95RmW8NcXn6oFqj58hWevURv6/RNN0K8NjyIyKZUwi+mGH
         OEhDSCxu/p0Cgic778mz02C2U3Wkxu1FBa35Wd5X4lZeymbzrWPIHXcxqjcC8Q34pRyu
         HszuTeylISSjJoh7k5a61cMiqM6KQ8YmSUkgKlZvqQvQ8hoaeZv6iYi6WA4Hc6cP4Z77
         seXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793565218; x=1794170018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/raweGofl46CtJCMVWjd1et4wuYTKczZRtzeHYjdwg=;
        b=C6TYM71ArY1zSmRfc2oYHeTUgOGsUmqA5ulBhqBdj5FNIe196oAB9JncpZ770Omi6A
         BLgYnwi9YeFE9Axhkd+/m2JgbdYVc1G0NbGHg8PjRqafdBVy9yKI7Pge2lY8I1f4pals
         KNymNeH/r8r9+a04od84PmertXJCooVTReQKZ/h5U95arNTZFZG3qCF/YkcSdGerQs8L
         8X0UI4sYVYs5Y9b49XNwWmjPBxsKJayhnTX7TmgD7DISZ3ZreFNK5x3XvVVIVjuv/7rA
         p7daYap/EBKOEJD9bcqTftMMa/qylx6PQ3XkDONrsg4gpazIN4k6OeTGRrDjcaTno0ge
         Yn9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwptGo4R1ZMp0I3QDo9rgcACLrhuKI9ZkirKGHY3n8hAt2ai5DTzqHeFyp24RkUbG5Oh8fw+CjbE6y4jP3NNFM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+tn5Vb6PhgbikzJLKNRSQRo78z4A+TrdcJjbsfAVWozBacvrgp
	BOXyfRssuH1UEKUqN9WDjVAU2uGJYJNp5CXKQTJZidq+6JbWTZQKl5Hr
X-Gm-Gg: AYBFou3FRuGmnQa/PsUA6LWoGLBcF4QnhCEeFYGxdvUCSW1Z7rsPkocZZLHN3O8NcaV
	qh+GOi3nCyH5YZthorFMX9nWzV1uOPcEqasWuPvaLCdN6D6WoxFvwmiQc1/IbWL6anOHJykvpYT
	ROcTd4XaeAXvzTDaWzoLdMp48Lpn7zbMaRqpmDiUBjVsuY+WtbMq0gF+z84jAmDyYnxV7wsZ/X2
	+wQjDCF7pWiIL/tmZgEXmA2wKujzBm5dBw1fP6buUNX54EiNPwzUSw0bkPjZQ2Fx4yLBJ6Wbmb4
	Jtyq4MkzKJEkt8iJANwE0rAEINsAwnilJ5jjgf8tD2YtfbWQO5g13cCWTg9aUrdDAD3mPYPrWaV
	pkIsR7CKCtyLyb0UWDgtWUnq6/W9akQRnt2hTHRdncX7X62gsAYtRAXosW/9Iz9VIGWRniGpOwP
	Ge2+2pzKHQDxlwcHZF7LFL4yCs63ItQXe3SMT+oyXllk1taLtoqtMhehF8aNfp/eli5Gfl3Qoq4
	zTCMKFgzHr7n9dXCfRGIvXFieJP1M/L+DOSO5oDSPUqFgmzCaws3mMSyBPbLrU9WqhkaGI7JZx0
	29ZZf/mL/qd3iuGyuRLCKJhTW13e3IwTBmeXVmgDhZNdyrJ5rGdW7RdkmTf9TrQfVzk7qmIKfVJ
	90e7Q/5BgyaMVEOl0YkFQLTIsfRJInTQGrOSgSQUo9gnwSAMUVqX6cxBb0zMpZIV3PQ==
X-Received: by 2002:a05:6000:310c:b0:48e:5cd4:aa60 with SMTP id ffacd0b85a97d-48e6e2fbc14mr20001368f8f.42.1793565218073;
        Sun, 01 Nov 2026 12:33:38 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d5dfsm18722895f8f.3.2026.11.01.12.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 12:33:37 -0800 (PST)
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
Subject: [PATCH] clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations
Date: Sun,  1 Nov 2026 21:33:36 +0100
Message-ID: <20261101203336.1360239-1-romain.tisserand@gmail.com>
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

The N-K-M rate code computes parent * n * k / m in an unsigned long,
which wraps on 32-bit ARM as soon as parent * n * k passes 4.29 GHz.

On the A33, pll-mipi (parent pll-video at 297 MHz) with N = 14, K = 2,
M = 14 runs at 594 MHz, but 297 MHz * 14 * 2 wraps around to
4021032704 and the code computes 287.2 MHz. ccu_nkm_find_best() then
picks these factors for a 288 MHz request, and clk_get_rate() reports
287.2 MHz while the PLL runs at twice that. On a PocketGo S30 (A33,
ILI9488 panel on one MIPI-DSI lane) the lane ended up at about
594 Mbit/s instead of 288 and the picture broke up.

Do the multiplications in 64 bits, saturating at ULONG_MAX, in
ccu_nkm_recalc_rate(), in both best-rate searches, and for the parent
rate request of the parent-adjusting search, where rate * m overflows
the same way.

Without the saturation, a candidate above 4.29 GHz in the search would
be truncated again on return and could look like a valid low rate.

64-bit kernels are not affected. On 32-bit ones, every N-K-M clock can
hit it (A31, A23, A33, R40, H3, V3s and F1C100s use them), whenever the
parent rate times N * K goes above 2^32.

Fixes: df6561e60244 ("clk: sunxi-ng: Add N-K-M Factor clock")
Fixes: 3492e4f6db5f ("clk: sunxi-ng: nkm: consider alternative parent rates when determining rate")
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Testing: built with W=1 for arm (multi_v7_defconfig with the A31, A23,
  A33, R40 and H3 CCUs) and arm64 (defconfig), SUNXI_CCU=y and =m, no
  warnings; on arm the 64-bit divisions go through __do_div64 (no libgcc
  helper). Tested on a PocketGo S30 (A33) running 6.18.54 with this
  change, without the ULONG_MAX saturation (same results for rates that
  fit, which is the only case the hardware hits): before, pll-mipi was
  programmed with N = 14, K = 2, M = 14 (594 MHz measured as a 2x lane
  rate) while clk_get_rate() returned 287216621; after, N = 15, K = 1,
  M = 16, 278437500 Hz in both the register and clk_get_rate(), and the
  panel picture is right. This version, with the saturation, then on
  the same board on 7.3.1: pll-mipi again programmed with N = 15, K = 1,
  M = 16 (278.4 MHz from the 297 MHz pll-video0) and the picture is
  right. Not tested on the other SoCs.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to bring up the PocketGo S30 display. It found the mismatch
  between the pll-mipi register and the rate the clock framework
  reported, traced it to this overflow and drafted the fix and the
  message. I reviewed and understand the change and tested it as
  described above.

 drivers/clk/sunxi-ng/ccu_nkm.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index 401fbb7524..e5a8f22d50 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/math64.h>
 
 #include "ccu_gate.h"
 #include "ccu_nkm.h"
@@ -30,6 +31,26 @@ static bool ccu_nkm_is_valid_rate(struct ccu_common *common, unsigned long paren
 	return true;
 }
 
+static unsigned long ccu_nkm_calc_rate(unsigned long parent,
+				       unsigned long n, unsigned long k,
+				       unsigned long m)
+{
+	u64 rate = (u64)parent * n * k;
+
+	do_div(rate, m);
+	return min_t(u64, rate, ULONG_MAX);
+}
+
+static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
+					      unsigned long n, unsigned long k,
+					      unsigned long m)
+{
+	u64 parent = (u64)rate * m;
+
+	do_div(parent, n * k);
+	return min_t(u64, parent, ULONG_MAX);
+}
+
 static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common,
 						       struct clk_hw *parent_hw,
 						       unsigned long *parent, unsigned long rate,
@@ -44,12 +65,13 @@ static unsigned long ccu_nkm_find_best_with_parent_adj(struct ccu_common *common
 			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
 				unsigned long tmp_rate, tmp_parent;
 
-				tmp_parent = clk_hw_round_rate(parent_hw, rate * _m / (_n * _k));
+				tmp_parent = ccu_nkm_calc_parent_rate(rate, _n, _k, _m);
+				tmp_parent = clk_hw_round_rate(parent_hw, tmp_parent);
 
 				if (!ccu_nkm_is_valid_rate(common, tmp_parent, _n, _m))
 					continue;
 
-				tmp_rate = tmp_parent * _n * _k / _m;
+				tmp_rate = ccu_nkm_calc_rate(tmp_parent, _n, _k, _m);
 
 				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate) ||
 				    (tmp_parent == *parent && tmp_rate == best_rate)) {
@@ -87,7 +109,7 @@ static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
 
 				unsigned long tmp_rate;
 
-				tmp_rate = parent * _n * _k / _m;
+				tmp_rate = ccu_nkm_calc_rate(parent, _n, _k, _m);
 
 				if (ccu_is_better_rate(common, rate, tmp_rate, best_rate)) {
 					best_rate = tmp_rate;
@@ -154,7 +176,7 @@ static unsigned long ccu_nkm_recalc_rate(struct clk_hw *hw,
 	if (!m)
 		m++;
 
-	rate = parent_rate * n  * k / m;
+	rate = ccu_nkm_calc_rate(parent_rate, n, k, m);
 
 	if (nkm->common.features & CCU_FEATURE_FIXED_POSTDIV)
 		rate /= nkm->fixed_post_div;

base-commit: 5243bd55dfe63a5f806622878f6fbdd78172fac9
-- 
2.43.0

