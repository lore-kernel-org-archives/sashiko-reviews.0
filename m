Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DBC30AD0A
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 08:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600069; cv=none; b=ZJ18KU6Ru4eg7mNtAC4fPm4ak5S9U9vAfBr8vFb6b+ITsHem/eP2H+KTTm2tmj/Xl1aedAyJ2d5xuYdD5tDtCEeX1l5hy46FWg+McG1lFPETykE5qG5Ot0Oa3dm5RdEsRDNboEXmxXWqv58v6z+YMvENbTykORyKHEJNrfvrgAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600069; c=relaxed/simple;
	bh=jY2iMCSOh2cMOiEI8qWkxyY9tdmhfIpJYUvoK4sW0Rs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jt9eKOyAynJPwI5Sh7mb5Qd+iY6HMZzmQcLWAyW+SIO9yTUKo5Q66RkQAkTmvH9r0fn6Xt3PNeJzR9aOOS/waGYVGp2lfeCoa5GHpj3dRRDtREMfU0eWAHU4qLHk7SF+gDGWhSiffMyTbM5mCRdTBpyGlGnSFjXfe4ER3hRZOTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=OW1MJ9So; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="OW1MJ9So"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=44
	SW/x8wXDaBWMGB26VUDUNVEBqTyRGs4639vhQHD8E=; b=OW1MJ9SoFmBXa54Qcm
	Z3Cgi4oc8mi351S1tbVSa2uVrJdXChtOmLsTDZbdbPrb/zOEBf96gHl9iO8NsNj+
	JAmiqx0ZHc6+fUPUMbM2Hkx+Bc+3QdoMh+mfTkuh68+L/7PX0s7JVYgWiXyLp+3N
	SGE+81TkHmPZiTroLNQD0sIRU=
Received: from rlk.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDnEpYsDzFqEuHvDg--.40923S3;
	Tue, 16 Jun 2026 16:54:08 +0800 (CST)
From: guoqi0226 <guoqi0226@163.com>
To: mkl@pengutronix.de,
	sashiko-bot@kernel.org
Cc: cuiguoqi@kylinos.cn,
	linux-can@vger.kernel.org,
	mailhol@kernel.org,
	mani@kernel.org,
	thomas.kopp@microchip.com,
	o.rempel@pengutronix.de,
	sashiko-reviews@lists.linux.dev,
	socketcan@hartkopp.net,
	guoqi0226 <guoqi0226@163.com>
Subject: [PATCH v2] can: mcp251xfd: Add ACPI device ID table for MCP251XFD
Date: Tue, 16 Jun 2026 16:53:59 +0800
Message-Id: <20260616085359.89406-2-guoqi0226@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260616085359.89406-1-guoqi0226@163.com>
References: <20260616031332.0F34C1F000E9@smtp.kernel.org 20260616-teal-wrasse-of-conversion-348af0-mkl@pengutronix.de>
 <20260616085359.89406-1-guoqi0226@163.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnEpYsDzFqEuHvDg--.40923S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7tw45tF18urWUJF4kCw48Zwb_yoW8AF1fpF
	4DtF1qyrWUGF4UWa15C3WDZ345X34DAry0grWaka4jqryfAw1UZFs293W5Ars5JFW5GF13
	Zr93AryDG3y5W37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U0LvNUUUUU=
X-CM-SenderInfo: 5jxr1xaqsslqqrwthudrp/xtbC-hC2H2oxDzCohQAA3O

This patch adds an ACPI match table for the MCP251XFD CAN controller,
enabling driver binding on ACPI-enumerated SPI platforms.

Signed-off-by: guoqi0226 <guoqi0226@163.com>
---
 drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c b/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
index 92a86083c896..031967370728 100644
--- a/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
+++ b/drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/acpi.h>
 
 #include "mcp251xfd.h"
 
@@ -982,7 +983,6 @@ static int mcp251xfd_handle_rxovif(struct mcp251xfd_priv *priv)
 
 static int mcp251xfd_handle_txatif(struct mcp251xfd_priv *priv)
 {
-	netdev_info(priv->ndev, "%s\n", __func__);
 
 	return 0;
 }
@@ -2212,6 +2212,14 @@ static const struct spi_device_id mcp251xfd_id_table[] = {
 };
 MODULE_DEVICE_TABLE(spi, mcp251xfd_id_table);
 
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id mcp251xfd_acpi_match[] = {
+	{ "MCHP15FD", (kernel_ulong_t)&mcp251xfd_devtype_data_mcp251xfd},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, mcp251xfd_acpi_match);
+#endif
+
 static int mcp251xfd_probe(struct spi_device *spi)
 {
 	struct net_device *ndev;
@@ -2442,6 +2450,7 @@ static struct spi_driver mcp251xfd_driver = {
 		.name = DEVICE_NAME,
 		.pm = &mcp251xfd_pm_ops,
 		.of_match_table = mcp251xfd_of_match,
+		.acpi_match_table = ACPI_PTR(mcp251xfd_acpi_match),
 	},
 	.probe = mcp251xfd_probe,
 	.remove = mcp251xfd_remove,
-- 
2.25.1

