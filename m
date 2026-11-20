Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795152291;
	b=t7AgjTgQUi4sThlOrHYwM9kJKejAC/TkppAEetKSd3ki1pAncRnXyBPjl/nMZAs9hCVK
	 N7NAFNqXcH5VcuDufFKvM8wQSMk8YJujvyRk3+Cl0BQ2jGXcO2CCNHRWpVnLAmlUxnDYf
	 en2jkVTnl1Zi3FS7e59rmE6h8rdXOIYPEK5mGMoXf7B/2GSv5ggcf+gnCuDJUxGTtLzeb
	 Ms1sxYFmcgECk6Sf5aDNhqepEgz0ZFKffrA+U3XIQSpZby5ONEd0nbd9mawWro5Y3jYl6
	 arjTEk8bwj3honRWy2EHZHDPJEwiB7+3elcAqX05fSyBLOBa0BJKXDGwJ01QSuvNr9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152291;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=TItee/T03NTRENeR4cH4C0LDyn0Kmlrpb5BazOHyBL0=;
	b=I0+yrVNk3ix3rKCfYRknLelgNhN7ryNAnqaAXPSvbLCdErM9K+csTGn8ZqkjtRMGCf8F
	 MamzYT9KzQMK4Mtuc9+6Gw4ueXHmRJj+vs05sCI6FU6FETBCrib61CISwf7cMmx39LRWE
	 /S+aJZBjxVgANVv4/cB58p1be2SbzUfRA3Lu8j7YWIeSsYsjBnC5p2ruJ6QNDL70AulUm
	 2Q3orP9p7x3K+5VludzGEZfRMn95v+Q2ohvphpOq5qtUWxmXDCRA3yvp27/eR3UZNpqyZ
	 PeVbWH3spscqIj3tRcRNxFCF+xF1Yb1zZ2Y2CWRfdJ3KyX9SHrnlyLP73qsSEhOr/1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=dJR9n2tA;
	arc=none smtp.remote-ip=61.135.153.168
Received: from smtp153-168.sina.com.cn (smtp153-168.sina.com.cn [61.135.153.168])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC3B606A325
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 05:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC3B606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=dJR9n2tA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1795152286;
	bh=TItee/T03NTRENeR4cH4C0LDyn0Kmlrpb5BazOHyBL0=;
	h=From:Subject:Date:Message-ID;
	b=dJR9n2tAoCDEicpmRr+ZFweFQb44zRfWCU+z0nfJ7SUjYxG2umQNo7WnY4bqaQffq
	 MKGzs2MBE7MG0+qIhLgi9VY0k7XzcNaWcEoLkXmy7HFJ1SID8sqDX0PK2qkaekI7oB
	 i9IC+Pr3bxQTzdvBX6Ml5cFig4USEA94k8dIuo2c=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.33) with ESMTP
	id 6AFFD99200004AB0; Fri, 20 Nov 2026 13:24:37 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 3965716685128
X-SMAIL-UIID: B96F6B02782F4AC6A66F80A8AF9D5791-20261120-132437-1
From: Edward Adam Davis <eadavis@sina.com>
To: sashiko-bot@kernel.org
Cc: eadavis@sina.com,
	joern@lazybastard.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	sashiko-reviews@lists.linux.dev,
	syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	vigneshr@ti.com
Subject: [PATCH v2] mtd: Use I/O memory accessors when in an uncached
Date: Fri, 20 Nov 2026 13:24:34 +0800
Message-ID: <20261120052434.101613-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-224471@kernel.org>
References: <sashiko-outbox-224471@kernel.org>
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

When registering a phram device via module parameter or sysfs invokes
register_device() with pdev = NULL, which causes new->cached to be false.
As a result, phram_map() maps the physical memory region using ioremap()
(mapped as PROT_DEVICE_nGnRE on arm64) and forces the pointer into mtd->
priv, yet phram_read(), phram_write(), and phram_erase() access it using
standard memcpy() and memset() instead of I/O memory accessors (like
memcpy_fromio()). When scanning partition headers (e.g., ftl_add_mtd()
reading a 68-byte header via mtd_read()), arm64's memcpy implementation
issues pair-load (ldp) instructions at unaligned offsets, which triggers
an alignment fault (FSC = 0x21) on Device memory and crashes the kernel.

In phram_read/write/erase(), standard memory accessors are used when in
a cached; otherwise, I/O memory accessors are used.

Fixes: f3d45ac21e46 ("mtd: phram: Module parameters add writable permissions")
Fixes: 285133040e6c ("arm64: Import latest memcpy()/memmove() implementation")
Reported-by: syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ee09ee2112d03c35f1f7
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
v1 -> v2: use phram_mtd_list cached, add void __iomem* and write use toio

 drivers/mtd/devices/phram.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..802da960d840 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -43,8 +43,14 @@ static LIST_HEAD(phram_list);
 static int phram_erase(struct mtd_info *mtd, struct erase_info *instr)
 {
 	u_char *start = mtd->priv;
+	struct phram_mtd_list *phram =
+		container_of(mtd, struct phram_mtd_list, mtd);
 
-	memset(start + instr->addr, 0xff, instr->len);
+	if (phram->cached)
+		memset(start + instr->addr, 0xff, instr->len);
+	else
+		memset_io((void __iomem *)start + instr->addr, 0xff,
+			  instr->len);
 
 	return 0;
 }
@@ -66,8 +72,13 @@ static int phram_read(struct mtd_info *mtd, loff_t from, size_t len,
 		size_t *retlen, u_char *buf)
 {
 	u_char *start = mtd->priv;
+	struct phram_mtd_list *phram =
+		container_of(mtd, struct phram_mtd_list, mtd);
 
-	memcpy(buf, start + from, len);
+	if (phram->cached)
+		memcpy(buf, start + from, len);
+	else
+		memcpy_fromio(buf, (void __iomem *)start + from, len);
 	*retlen = len;
 	return 0;
 }
@@ -76,8 +87,13 @@ static int phram_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
 	u_char *start = mtd->priv;
+	struct phram_mtd_list *phram =
+		container_of(mtd, struct phram_mtd_list, mtd);
 
-	memcpy(start + to, buf, len);
+	if (phram->cached)
+		memcpy(start + to, buf, len);
+	else
+		memcpy_toio((void __iomem *)start + to, buf, len);
 	*retlen = len;
 	return 0;
 }
-- 
2.43.0

