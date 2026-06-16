Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8015A42EEB8
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781605866; cv=none; b=U8EtGd6siXfmz7VEMmEW0N50SDS0uBtYTeUOBDkt1pCIKdK4MxaGIDRJjsB+JYUO29Yja9RmiG0stY1k7tCTAU4DsxWW3K0ai78BC2CXCcfvyN+OyOkwyc6bGflBXktfyJMwc2mzSQfeKDQ8ODAuJpVrntwgoIVeSi3xFsKaVvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781605866; c=relaxed/simple;
	bh=Na/0hInjZlFy+f86HfBHZHKRIRVzmWQctb3rA9JSGr8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HBg4ArctlSmiJqFve6Zs/XquP2QIswBIPI2SQUBSU1IqArmr0Oxr/Zjnjm/B7zWFTNVW3jcHvut2BOx7UkrkQYHx87so700jh1z1hFMxGMCh2eCNuHAuFuFSswSvDlmE+s/rNbVGo5ucejk3EBvA3mN8/PKHv6SdSUpzcOruUQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=KrLLQWKb; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="KrLLQWKb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4A
	lWpfHRD20svlbvEuxneUYoPiBFZmx61S/n6SJjTfA=; b=KrLLQWKbSC4EUqbFNj
	Une4N1qJJ7UlCGpaaQoNLkaR7OtAatgExQqm2EGXyRuGtlJc4z3cUGqTdjQW7sBq
	hH43OEKnW+4GiAap1XL10P0ca3PeDNfA0n7Y/TB1peovChqbWGlITU67XYee0ILF
	8/cliWWjnC+vZGOdcOOA5oK6g=
Received: from rlk.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDnrK69JTFqGSqCDw--.29972S4;
	Tue, 16 Jun 2026 18:30:29 +0800 (CST)
From: guoqi0226 <guoqi0226@163.com>
To: sashiko-bot@kernel.org,
	mkl@pengutronix.de,
	Mark Brown <broonie@kernel.org>
Cc: guoqi0226@163.com,
	linux-can@vger.kernel.org,
	mailhol@kernel.org,
	o.rempel@pengutronix.de,
	sashiko-reviews@lists.linux.dev,
	socketcan@hartkopp.net,
	linux-spi@vger.kernel.org
Subject: [PATCH v4 2/2] spi: Add NULL check for spi_get_device_id() in spi_get_device_match_data()
Date: Tue, 16 Jun 2026 18:30:18 +0800
Message-Id: <20260616103018.105612-3-guoqi0226@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260616103018.105612-1-guoqi0226@163.com>
References: <20260616092614.00ED51F00A3D@smtp.kernel.org>
 <20260616103018.105612-1-guoqi0226@163.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnrK69JTFqGSqCDw--.29972S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gry5Gry5GFWruF4ftrW7XFb_yoWftFb_ur
	15ZryxWr1fKr97JF1Fqr1avryfKF4YyrZYvr4vqF9aqws8ur47AFWvvrn8AayDuFy0yr1D
	WFn3Xay3Ar43ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUj8pntUUUUU==
X-CM-SenderInfo: 5jxr1xaqsslqqrwthudrp/xtbC-gVhyWoxJcVajgAA38

Prevent NULL pointer dereference when spi_get_device_id() returns NULL,
which can happen when using driver_override without matching SPI ID entry.

Signed-off-by: guoqi0226 <guoqi0226@163.com>
---
 drivers/spi/spi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 104279858f56..079ac01a2229 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -355,12 +355,16 @@ EXPORT_SYMBOL_GPL(spi_get_device_id);
 const void *spi_get_device_match_data(const struct spi_device *sdev)
 {
 	const void *match;
+	const struct spi_device_id *id;
 
 	match = device_get_match_data(&sdev->dev);
 	if (match)
 		return match;
 
-	return (const void *)spi_get_device_id(sdev)->driver_data;
+	id = spi_get_device_id(sdev);
+	if (!id)
+		return NULL;
+	return (const void *)id->driver_data;
 }
 EXPORT_SYMBOL_GPL(spi_get_device_match_data);
 
-- 
2.25.1

