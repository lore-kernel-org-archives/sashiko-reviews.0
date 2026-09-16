Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA29938D017
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 04:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789533976; cv=none; b=pPum3yHUPnNlo4sTjv/tnsH32NXWLRrLk6AKWAXke9iNXx2pJX2lUBXQFTsaToJktyq98EBArfjX8fAghs61hBwioX4BWMTpUwvqWTLwkqZklu20JiqUrgRXCRV+Yl63LEFz3X8PkmrKF/uG8A/GiUPQ6XZ2z7JEnK2sKYYclpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789533976; c=relaxed/simple;
	bh=nWAXK5uGotkCh7I/YPn9AT06dBGqGWgcKjwoUi9dO0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jevouGsL+hbplPntBGPKUXrvno+kIOIfvJnTh+Quc6kNkor0TvVyUXzfROPgF80pH6BVAzk/cUq392aqxn8vz15vrNs1kYdCMomlr35c4Z1UwXTZzgAaAKhTBPafy7KALSU0Z0W3jyXXdhQX9eqnGiz1OhiplxWX25N3rFNhcdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n264AguZ; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n264AguZ"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f38so4857605ad.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 21:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789533974; x=1790138774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEXBcYJPnvk5uV+nVCAlRvcg1raCOVIhm5bGvEozAbw=;
        b=n264AguZRT4DLjyxmSEAUazep5xZ0JYHaGgp1egnr+b4pLArmCkMH7jMCev+Z+f5Lh
         2GKZH9gfL8Horw07RniTwWUNuQ8mN2d+iF0zNcLT58yd7udOaI1o7/nYihqeUek18L5C
         wcoaNX2uBV1jZrm/xanRDnx/Octgdy45V8tdp+thc+B8r+22GwcnWS3sT4D02hPoAq6C
         8ijXiXnilMo2IU/uFGp6zsSquROyXgijXCyYmGzPlq7WL66HoVyfDOpWhMXD3blwTmiC
         B77HyDKf9ZEY+qud9dgpp5RoXwRRQ2rDucxGs6UXjXCczTDKoa71jYriIz/N6SEx4zOS
         IoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789533974; x=1790138774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEXBcYJPnvk5uV+nVCAlRvcg1raCOVIhm5bGvEozAbw=;
        b=Z8Ghe5VsRX+zQbDHK6WKqQicTHx1tL///32I6uL3tFQJ3BSiQh6ykELdtWwG6ExnUr
         ZuWmjDqFjM/cuV5FKkWuskbt8sUTbqBKZA6GBBcMop/W4Gg5/TfmAmc3d/HmAPou+711
         uJ1Odjailhycj8XAxgWD8NgDRIALU10fJ3nxlBYa0J4u5P42PM90TnrniPv86qeKchBI
         2a6AQUi6ZpTpfNeGSwqyzl1JEc3zRSjK3oTGimPKU5NnwauULBzIXx5E0Xeid6P2Jk9s
         zVftEG6XVY0v7NEvmOMVPn/z7unTZE+uvwOkH8iLVM1wpA8rvSX+33bIQ1stRVxGvFl4
         wzjA==
X-Forwarded-Encrypted: i=1; AKwUvBzB4rZgBs0ysm0ma2djaPA5B5PLSThG4zG3q6USdinNfdYycAGzofqu5EU8Whdz+eB9WXwTzNhPXdAO7N9ti1s=@lists.linux.dev
X-Gm-Message-State: AFuF++nrT3Ted2G1JC2VUI3ZjWQ7qAPv0To2I0sL0LAc7lrilR8CgRfR
	MfCQdAv2Mshr26JXf5/8BU35nUcLswYiXoY2opnFn/ZenXSQtncDOHTRtHXJWp0=
X-Gm-Gg: AYBFou2cAzqHDch9a9XPJc8Iq9PeJsI5kFephB7i6IlbIFc9GjZX8ptxKzdSNF7Arrr
	5ewowMAcDuPzJgyG8hTLudHEEJsL1TrUj8I/uDFO25ftzz4Spz6Gd6aitI8ZaUHYVoQdTiK7mh1
	maGwe/Us57/tyQVo24+SfWf32/5DQJAXJjrBxqflnq+YMXYmuftUMRZNaJe9g3kwRXKZmskYRT/
	mPGyzAFumXjGnZgfTatZXNkyiOnEUzI4Hh/XmH6O3GSdGNXsOQ9kDF6wF2JtrVr0fYoZM3Qkcnn
	Qol/BaMuWrkV2BdkNIv/kEh4nEMS0yOht8PCw688JkcLAuLQS6auedbbN0kkyPBAizooPV28tCH
	CxIJ9SmBnb0UzedOjAWl8uVu7NZi8pxjLlXiPkyT0LZXKAX2LZOKAXKeb1pEXI1LCCCx0iPjNxc
	Jr7sdcONeQaF5njX7cEsHwgC/ex/I55Pr/Smsn3xEGrv+o/fDWnO01TnCXe2gt8N78nzw+Vj0rF
	4tPZ+HNs9Dh
X-Received: by 2002:a17:90b:3bc8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39e1e504f3fmr3291211a91.20.1789533973937;
        Tue, 15 Sep 2026 21:46:13 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bba0696sm2232093a91.7.2026.09.15.21.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 21:46:13 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sashiko-bot@kernel.org
Cc: linux-watchdog@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	tzungbi@kernel.org
Subject: Re: [PATCH v3] watchdog: msc313e: Propagate error code in resume()
Date: Wed, 16 Sep 2026 11:45:57 +0700
Message-ID: <20260916044557.74124-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912164221.966851F00893@smtp.kernel.org>
References: <20260912164221.966851F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sat, 12 Sep 2026 16:42:21 +0000 Sashiko wrote:

> [Severity: High]
> This is a pre-existing issue, but does leaving the watchdog framework state
> flags intact when the clock fails to enable cause a system crash?
> 
> If msc313e_wdt_start() fails, the clock remains disabled, but WDOG_ACTIVE
> and WDOG_HW_RUNNING are still set. The Linux PM core ignores device resume 
> errors and proceeds with system resume.
> 
> The watchdog core's PM notifier then calls watchdog_dev_resume(), which
> immediately invokes msc313e_wdt_ping(). This unconditionally writes to a 
> memory-mapped register:
> 
> drivers/watchdog/msc313e_wdt.c:msc313e_wdt_ping() {
> 	...
> 	writew(1, priv->base + REG_WDT_CLR);
> 	return 0;
> }
> 
> Can accessing these registers with the bus clock disabled on this platform 
> trigger a synchronous external bus abort and a kernel panic?
> 
> Additionally, a subsequent stop operation unconditionally disables the clock:
> 
> drivers/watchdog/msc313e_wdt.c:msc313e_wdt_stop() {
> 	...
> 	writew(0, priv->base + REG_WDT_CLR);
> 	clk_disable_unprepare(priv->clk);
> 	return 0;
> }
> 
> Since the clock enable previously failed, would this extra 
> clk_disable_unprepare() cause a clock reference count underflow warning?

Hi Tzung-Bi,

I think we can address the problem Sashiko mentioned by making the clock ownership 
explicit in the driver.

If msc313e_wdt_start() fails to enable the clock, the driver should not subsequently access
the watchdog registers or call clk_disable_unprepare() as if the clock had been successfully enabled.
In particular, we can track whether the clock was successfully acquired and make ping() and stop()
operate only when the clock is enabled.

diff --git a/drivers/watchdog/msc313e_wdt.c b/drivers/watchdog/msc313e_wdt.c
index 4a5cce2a16b1..437b8ace0a00 100644
--- a/drivers/watchdog/msc313e_wdt.c
+++ b/drivers/watchdog/msc313e_wdt.c
@@ -29,6 +29,7 @@ struct msc313e_wdt_priv {
        void __iomem *base;
        struct watchdog_device wdev;
        struct clk *clk;
+       bool clk_enabled;
 };
 
 static u32 msc313e_wdt_get_hw_timeout(struct msc313e_wdt_priv *priv)
@@ -60,6 +61,7 @@ static int msc313e_wdt_start(struct watchdog_device *wdev)
        if (err)
                return err;
 
+       priv->clk_enabled = true;
        msc313e_wdt_set_hw_timeout(priv, wdev->timeout);
        return 0;
 }
@@ -68,6 +70,9 @@ static int msc313e_wdt_ping(struct watchdog_device *wdev)
 {
        struct msc313e_wdt_priv *priv = watchdog_get_drvdata(wdev);
 
+       if (!priv->clk_enabled)
+               return -EIO;
+
        writew(1, priv->base + REG_WDT_CLR);
        return 0;
 }
@@ -79,7 +84,10 @@ static int msc313e_wdt_stop(struct watchdog_device *wdev)
        writew(0, priv->base + REG_WDT_MAX_PRD_L);
        writew(0, priv->base + REG_WDT_MAX_PRD_H);
        writew(0, priv->base + REG_WDT_CLR);
-       clk_disable_unprepare(priv->clk);
+       if (priv->clk_enabled) {
+               clk_disable_unprepare(priv->clk);
+               priv->clk_enabled = false;
+       }
        return 0;
 }

How do you think about this idea?

BR,
Triet
