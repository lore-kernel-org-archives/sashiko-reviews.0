Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935799;
	b=xmRBQAOIbn9Nz/PMWeh/TjTG139w6iJU9yuiwfKn/FemNiHkB0BLGVlAjgpoye4AG+n+
	 qVZZ7RvCycH3kktiWoE2FR7LZg2yPbDFPX4XLF3EUrZV4UeV4Lis+ptCwHWtIMFH2INkN
	 bihyauZfdvfNiZG/y93YczOOdnVkRfkzkZ3kx+W3tZpYZkTJHmS61x8KC9Tl1jXVh3u88
	 zktTI6XXiOJDsacijZV0l99mQN0mo9DGmKql70CTBIiOtanK9x7oVezagjpzC9f+1dOGl
	 cvq8tbT6S42RxkS3oJPL8abrvOPcYTFIJhZONcJHc1YioQfJoV2WjkvYt2neabGykEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ROucTsPnyYTVcMujmRdSC63nWVbZidpBxQo25fxVF2Q=;
	b=BqsZZqtuSDvZXHMDqS72qJ/GNvEuP3SJuxZvGMLglTDiQoZpjeK1zUYtnbrcjBFPEKAj
	 mnpAXB7fYqmNKi8uFUIHOm53UniTdUwDn9pOeZCnnNrlAdgW8i8EqPRzoAwpRTuxe64gr
	 sIN9bxzA1q2x9x/4bKTiRLDaXhNsJ/EbSHBx5L02zAneEIxWREVdcghILoBmXktxU0lAh
	 wWlWJ8OT1z3yFQyeAH1XIsJ7yC+2W7OHAe+dfnva3upsMzLhipVoHKdv1ptQ1+ZbuwzI1
	 0MwX8TiK5JOwAAiCrZyNt32BbUaitEssqHNQ6JKxdoblsJx6gaLWNDJ4zNalu3rrdqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vBj2l2Xq;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7FF606A332
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 17:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C7FF606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vBj2l2Xq
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd9d0d40a4so29050a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 09:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935798; x=1795540598; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ROucTsPnyYTVcMujmRdSC63nWVbZidpBxQo25fxVF2Q=;
        b=vBj2l2XqAYfO7wxBHkXYr1CnxoQa0r0tVGyEp3kU8oFex7s1CXXyRIatXfgxXI6O/D
         Q+qSLJR8/1x12VBbMTAFizNXlSOWZZdYhsELdPykvMTCRuOaFcqJti3Q+6bizlpw4nK7
         sUdZ/WSydNgr7yxNlf+g32/988MozIhX7iZkBClotj0uNR/G5gDr17PUUliK6Lmym/Y8
         DjZ3PNW7benJEzrsw86jrpf9PUp4DAeECi4RWZLPtFG9fzb5v9FirNSoLcN/rOrvUq9v
         I/OqzQynFZvKDm6d+HvfEBNyZqEtzCuPVoz67HqeQ4D00qHu56zA1GuvG0OCzJHfm9/b
         oozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935798; x=1795540598;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ROucTsPnyYTVcMujmRdSC63nWVbZidpBxQo25fxVF2Q=;
        b=tMeywacIFbVqbYEG/Ib5UakXvBr2CtCfCkctXcNi3XDR+PH/NBE32UiwpodWigJ4HO
         hRQu0TVQ+VxZcTKV0e7o/Re+9H2UwS7b1O16Ax0zVzdoEzQic2Qu9tjgKrRvvv7p1IM4
         VNXUWHFcqxoqz542h6ZDLU9dJ10gK3Y7RGLYXx/8y1dxeNYq5bp6Y1NE2biLlzpCMHf1
         lMlu8wqjFH7pxGiRnpE8Ol6fj4lbpVqWo6LsAF+p9atqrUMeo0EYlT0Fui8doMkw1cii
         mNEdsdraWyo86BOOUg1B2TNB9c0vpt/anZoRNmfaF487n2IdtKghu/QawKs6a33+gk6m
         eaew==
X-Forwarded-Encrypted: i=1; AL+hErEoIRwLBRRHNkTFF5RpalYaFJmjbkrXG7doVErkAIlN8CbnazD/sAkML3S1VfiduZySPtIsO4cP/RRpEt6Zj7k=@lists.linux.dev
X-Gm-Message-State: APuU4Z+FT72ow6dbemV2+hAGFYYRA8ZvUNOg8DcPIfHaJO4HIusUKLBq
	Zj7IlJ7cILaFl/cX9mcuoStCRgSIFyB3n5U3BJp1EWyqvEig8V7YJ3vY
X-Gm-Gg: AYBFou1AGVjoXxiJQksRCuf7JdwuqT9IR3uZ3Z1XHxi3eDThEBx7uop/Go3WDRQE+jk
	xzBosnHFLah5kXSgvu0FG/Z9nQHB4yGfUeVwrk/g8tyXfxZrk8kLFkac9Xa3dBVafZAaRLeMkQC
	0HmRbc/t6+4EhTnzsEgVKRQVArsB85C6xNofjrUwGSCxqjAitfuwsMtVNcIsInb3WH1yfsd42GC
	L68TYsr4Dvj2dDFGiAA9cBlrJeDcxMC5tK3mJ2PpPkTAwrxFML4J+NAJJFqH0fX3RUYBFEEC+ET
	t8I+xE4ns2f2qZ2yrPialBT2VrWvmvK1qLvc8pwKyM/8kfmedFUF4V0cMKzQRYQF2U5kK1bKKQG
	1wA+cvwpTDjKrY3e1Wves4TrzUOigSACI1Cy++5NV1onRW88QcoqPeM0LrzlmxBivROf0piMxKg
	TudJkt7ky9wcQikqwyQpQmDJE8cTQ6+Up41GHWkvilcfElmoJlJacq+8I39tWpoXq83yzSuqGHa
	s3F07n8NFIPm72QrAj42oBGXafcAwsOg41A9mSpPSjBohKmE9YRlYLN9K2Q5ucduPuMTRIEXIPx
	apHK8WHe2iNwIMIxxRwfDq1Nl6c9VMh90MjVCUk4coBLqshMrdFk/nUE2azNlB+a5e6bp0lUkBI
	9KWHvxUmGs+7bUUpZSnhIqFAn7izQ4RLxoHDf8lyDHYaYWfiuQ9V8hEJ0VGhHuYdmtCI6xLX4Vl
	JaircPSRY=
X-Received: by 2002:a05:6a00:3008:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-8beb374dd2cmr12162924b3a.4.1794935797654;
        Tue, 17 Nov 2026 09:16:37 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5b38f2c39sm99770b3a.34.2026.11.17.09.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:16:36 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Wed, 18 Nov 2026 04:04:33 +1100
Subject: [PATCH] mm/damon/paddr: avoid truncation warning in high-address
 KUnit test
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-fix-damon-paddr-sparse-20261118-v1-1-3a0e943406d5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NOw7CMAyGr1J5xiLJ0AaughicxNAgkVZ2QUhV7
 04CAxvj9z9XUJbMCsduBeFn1jyVCnbXQRypXBlzqgzOuN5a6/GSX5joPhWcKSVBnUmU8ecH4w/
 GDb1PA9SVWbhWPg+n85f1EW4clzbbEoFqPwiVODap4f7PA2zbG7eW2xe2AAAA
X-Change-ID: 20261118-fix-damon-paddr-sparse-20261118-fb08902768d7
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
 Justin Stitt <justinstitt@google.com>, lienze@kylinos.cn, 
 linux-kernel@vger.kernel.org, 
 Linux Memory Management List <linux-mm@kvack.org>, 
 kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
 mm-commits@vger.kernel.org, Bill Wendling <morbo@google.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, oe-kbuild-all@lists.linux.dev, 
 rdunlap@infradead.org, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev
X-Mailer: b4 0.16.0

Hi SJ, Andrew,

The kernel test robot caught this issue in my earlier addr_unit KUnit
patch. Feel free to fold this fix into that patch.

Thanks,
Aveline Noir

-- >8 --
When phys_addr_t is 32-bit, Sparse warns about truncating the u64 address
passed to damon_pa_core_addr() in damon_test_pa_addr_over_4g().  The
runtime kunit_skip() does not prevent Sparse from checking that
conversion.

Compile the high-address assertions only with CONFIG_PHYS_ADDR_T_64BIT,
and keep the test skipped otherwise.

Fixes: 7a983cc1b573 ("mm/damon/paddr: add KUnit tests for addr_unit conversion")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261117170155.fEdeuuhm-lkp@intel.com/
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
The reported warning is gone with the original i386 config, Clang 22.1.8
and Sparse v0.6.5-rc1-21-g84ec0658. All executed DAMON KUnit tests passed
on x86_64 and i386 with and without PAE; the high-address case skips
without PAE.
---
 mm/damon/tests/paddr-kunit.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/damon/tests/paddr-kunit.h b/mm/damon/tests/paddr-kunit.h
index 9839cc233071..2b11f0e67a12 100644
--- a/mm/damon/tests/paddr-kunit.h
+++ b/mm/damon/tests/paddr-kunit.h
@@ -26,15 +26,16 @@ static void damon_test_pa_core_addr(struct kunit *test)
 
 static void damon_test_pa_addr_over_4g(struct kunit *test)
 {
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
 	unsigned long addr = 0xffffffffUL;
 	unsigned long addr_unit = 0x1000;
 	u64 pa = 0xffffffff000ULL;
 
-	if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
-		kunit_skip(test, "phys_addr_t is 32-bit");
-
 	KUNIT_EXPECT_EQ(test, damon_pa_phys_addr(addr, addr_unit), pa);
 	KUNIT_EXPECT_EQ(test, damon_pa_core_addr(pa, addr_unit), addr);
+#else
+	kunit_skip(test, "phys_addr_t is 32-bit");
+#endif
 }
 
 static struct kunit_case damon_paddr_test_cases[] = {

---
base-commit: 7a983cc1b57309a875a9e07a934c9944bf3d088d
change-id: 20261118-fix-damon-paddr-sparse-20261118-fb08902768d7

