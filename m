Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90031357CF3
	for <sashiko-reviews@lists.linux.dev>; Fri, 21 Aug 2026 04:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787285360; cv=none; b=oP9uZYBglsGTgIA/1cM73nJCVz+WN2rPZAnCco7mHiib+85nrZcU5zYrN5YYry7KP0Cts8S5PwV4IE5nxXOpT/x49XjSO+3HhnMYqNy3qPiLC4WSAp0UOn6RTPFiQnPys0ts1mUkjYKPPAKmAumJTKAFzEuLGWfeMfJvKOfocEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787285360; c=relaxed/simple;
	bh=PcGNx992EdYK1LyIkTkLCSIHkNzubUCmgLAxDBJBKMM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KpUK44QOkqDfV7pldtsoSZZKpEUdNCU84LmGh10sXutfUxx5D1jGbPjrqkvkUbrsrUwldQymTojXBt4Ktp68F0XZCx/lMohgLui32h1KM6rglIGWy1lCnBDH1bKn+Y9yjVh1NZNK7OF4ZabER3dSfPi8SwApGXohZHcX+CNavOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWMATaHl; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWMATaHl"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca00f126b7eso433279a12.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 21:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787285359; x=1787890159; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NL0QMLbb5CnWsto8yJ2XYwKTXgoQuJxGA8ecQsMppg=;
        b=AWMATaHl11rHwR+Dc3fG6vPx8/r9k+h1N+Je+3O0Ec/rfdLduRTdYCuVGSnY0RdABt
         u4QlFS2ppy7bFGHHLnlPUqONzU6UaCpFvEN3S57s8UjIaZDo60aHeZklrf6aNg6Q14gG
         SR5SKR0VplOrf/riETDg5rLGXDpna/F4HdzuZuD+cpKiMrfxb+iKh89BzUkU5N/k/rJj
         mMA53jdMlbr8rOMepUpPjqQyWinsjjm6scUxBM858rxJCjP4ktoAcAiV0AAA3tSUhCWx
         iLOIjWjTCcbUUXfi6GTnoUretIXYN49adfkrqACIdDfn5YhpKOhwt6DmmcxUaCm5BJLZ
         Ez9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787285359; x=1787890159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NL0QMLbb5CnWsto8yJ2XYwKTXgoQuJxGA8ecQsMppg=;
        b=O825D0Ru/7gTthfHD7i8qhH5Iwp4mJFoXURsGHYZHpQpK+IMHFc3YtzbKiCyVDfU5z
         abL6fCirIVmie+T6W4p+geUS0AUwRrWwsnHXmONvlRxC62D+HxVlqEh2nwZciyOfAc2b
         rPNUUuQImZ4ai3Qnw5S8A9v9cDMkOmdCd8f6KPF5X/PHMqLlRImwef5aojXkYQYVihyC
         WPsFq8MTJsvZIIfYNINY1ENGJhHN/kpX5GazJ7n1zFAtGZ+gGoALZYirUa9IaEqFq0hb
         QRwkSndJxG3kULBcklCaoybz7r1hY/SteT1dPGmteYdA4XASeHYbTXWwd/FbfpfIIMjm
         SeMA==
X-Forwarded-Encrypted: i=1; AHgh+RpElfj7j+8qYbDGyeyqstTRd4v42trlrR7oT9raG9tD3MXHzAFz41O9vrYgMIv/GxZLDev0NL9BMt1NJXK2vu8=@lists.linux.dev
X-Gm-Message-State: AFuF++ltCnqcpil/wClBd27UYi2q+QhdS/LoOToMUaXJB71ow4k04Uk1
	TSrFEeM84CYntkg9z/c83RBiMF4/olFxpNzHxrPB0KRzT6ykZLxmiHg=
X-Gm-Gg: AR+sD12AYChEYpAQGuk+0nyMwLYtupveaYkOOFm8qmmf96VJRO4ghSUIRXIGCmn9VI/
	e4bEnunQTTf7n1CSxyo7pWUBq7UC5FtZUeopLYD3agASmpnlcZUJEX6b9o5wTCFSziY0xdu+RGy
	NtKnE0UfwRBXlF1Og7J/VtDC7EPjw81ZFSEfAdke2hG+qf8dRGrQlaFE4+yvzBZQPn9Xru2hJXJ
	o8L2Fx6wf/b0vl4tfilNGvetD03lW06nsqGg4scd3MYW2t5zX4pSc5at6palUBcq9etqA/SUXFf
	OkM57k4+qE0Ee0MAHWrJyP0GYUbR11V/fw61+3LZXTVt3kZ4+fEG3yDP2kY34j0Zwl6yidVx1vl
	IzF6F8ly7oI519P2fwVicJwD7D24E3T5n2yzsMP1i5SerPhunFZJv997mbEon+a7D7EAHo3foql
	r4UIAVNkFitsjQ+A3hPUFDsUMpNbGRE3lqePHCE0D9tSYYoeVSsZ8UYZQMSuDaEG73Wr8/f2yEs
	w==
X-Received: by 2002:a05:6a00:368f:b0:846:8b22:4933 with SMTP id d2e1a72fcca58-851fa1ad69bmr5052274b3a.17.1787285358771;
        Thu, 20 Aug 2026 21:09:18 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389e83sm2339233b3a.16.2026.08.20.21.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 21:09:18 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sashiko-bot@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	triet.hoang.dev@gmail.com
Subject: [PATCH v2] input: touchscreen: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 11:09:05 +0700
Message-ID: <20260821040905.104590-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260821025514.31AE01F000E9@smtp.kernel.org>
References: <20260821025514.31AE01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from the resume and suspend callbacks.
Also reduces kernel size when CONFIG_PM
or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
Changes in v2:
- Remove DEFINE_SIMPLE_DEV_PM_OPS, use only EXPORT_SIMPLE_DEV_PM_OPS for ad7879_pm_ops
---
 drivers/input/touchscreen/ad7879-i2c.c | 2 +-
 drivers/input/touchscreen/ad7879-spi.c | 2 +-
 drivers/input/touchscreen/ad7879.c     | 7 +++----
 drivers/input/touchscreen/cyttsp5.c    | 8 ++++----
 4 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/ad7879-i2c.c b/drivers/input/touchscreen/ad7879-i2c.c
index c1ccdf86b74c..7ee5c0abd551 100644
--- a/drivers/input/touchscreen/ad7879-i2c.c
+++ b/drivers/input/touchscreen/ad7879-i2c.c
@@ -60,7 +60,7 @@ static struct i2c_driver ad7879_i2c_driver = {
 	.driver = {
 		.name		= "ad7879",
 		.dev_groups	= ad7879_groups,
-		.pm		= &ad7879_pm_ops,
+		.pm		= pm_sleep_ptr(&ad7879_pm_ops),
 		.of_match_table	= of_match_ptr(ad7879_i2c_dt_ids),
 	},
 	.probe		= ad7879_i2c_probe,
diff --git a/drivers/input/touchscreen/ad7879-spi.c b/drivers/input/touchscreen/ad7879-spi.c
index 064968fe57cf..66dcd4aa4711 100644
--- a/drivers/input/touchscreen/ad7879-spi.c
+++ b/drivers/input/touchscreen/ad7879-spi.c
@@ -58,7 +58,7 @@ static struct spi_driver ad7879_spi_driver = {
 	.driver = {
 		.name		= "ad7879",
 		.dev_groups	= ad7879_groups,
-		.pm		= &ad7879_pm_ops,
+		.pm		= pm_sleep_ptr(&ad7879_pm_ops),
 		.of_match_table	= of_match_ptr(ad7879_spi_dt_ids),
 	},
 	.probe		= ad7879_spi_probe,
diff --git a/drivers/input/touchscreen/ad7879.c b/drivers/input/touchscreen/ad7879.c
index 31d2a3029d5f..10f8574f478e 100644
--- a/drivers/input/touchscreen/ad7879.c
+++ b/drivers/input/touchscreen/ad7879.c
@@ -301,7 +301,7 @@ static void ad7879_close(struct input_dev *input)
 		__ad7879_disable(ts);
 }
 
-static int __maybe_unused ad7879_suspend(struct device *dev)
+static int ad7879_suspend(struct device *dev)
 {
 	struct ad7879 *ts = dev_get_drvdata(dev);
 
@@ -315,7 +315,7 @@ static int __maybe_unused ad7879_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ad7879_resume(struct device *dev)
+static int ad7879_resume(struct device *dev)
 {
 	struct ad7879 *ts = dev_get_drvdata(dev);
 
@@ -329,8 +329,7 @@ static int __maybe_unused ad7879_resume(struct device *dev)
 	return 0;
 }
 
-SIMPLE_DEV_PM_OPS(ad7879_pm_ops, ad7879_suspend, ad7879_resume);
-EXPORT_SYMBOL(ad7879_pm_ops);
+EXPORT_SIMPLE_DEV_PM_OPS(ad7879_pm_ops, ad7879_suspend, ad7879_resume);
 
 static void ad7879_toggle(struct ad7879 *ts, bool disable)
 {
diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
index 9266c07314be..7b0613156fc1 100644
--- a/drivers/input/touchscreen/cyttsp5.c
+++ b/drivers/input/touchscreen/cyttsp5.c
@@ -942,7 +942,7 @@ static const struct i2c_device_id cyttsp5_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, cyttsp5_i2c_id);
 
-static int __maybe_unused cyttsp5_suspend(struct device *dev)
+static int cyttsp5_suspend(struct device *dev)
 {
 	struct cyttsp5 *ts = dev_get_drvdata(dev);
 
@@ -952,7 +952,7 @@ static int __maybe_unused cyttsp5_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cyttsp5_resume(struct device *dev)
+static int cyttsp5_resume(struct device *dev)
 {
 	struct cyttsp5 *ts = dev_get_drvdata(dev);
 
@@ -962,13 +962,13 @@ static int __maybe_unused cyttsp5_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(cyttsp5_pm, cyttsp5_suspend, cyttsp5_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(cyttsp5_pm, cyttsp5_suspend, cyttsp5_resume);
 
 static struct i2c_driver cyttsp5_i2c_driver = {
 	.driver = {
 		.name = CYTTSP5_NAME,
 		.of_match_table = cyttsp5_of_match,
-		.pm = &cyttsp5_pm,
+		.pm = pm_sleep_ptr(&cyttsp5_pm),
 	},
 	.probe = cyttsp5_i2c_probe,
 	.id_table = cyttsp5_i2c_id,
-- 
2.53.0

