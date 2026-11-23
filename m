Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795424294;
	b=Xx9jbFsq/XaJl6CowIf/33o3b1G+ZA/hpG0ox7Nk2PuR5uNW3cqGXZfwiabmM5vF1DCi
	 GzWsv9eamHYpcbaPXvLzXpCXq2YCh4NONEjHlGVrvxN+TdDAKJ5SQH2WCYsdeihppvJVh
	 C5DOw4/Mvc3QMdUHzIBuvmCcpYEvbk/KrqtVdvRnG3XmqbIG9g6dJ5BajM7W5ksdsls92
	 QABYuTFVJMD1J0/iBcWfaL1KPuhv/f9KSg9QZCLQtcMHzz7wpBBoiJIdyLaG1o/HE8xeh
	 PmK/ZqTbcWV296I23KId4Wl8+M0LsTWHH8ET9rYsxqfSZvHoenCrry8FJVjSpz6OtMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795424294;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aR0tmA1/eSKWhAkyRRrHigR/ndR4gGbRzgjxSxU95kk=;
	b=1JJ/FnN8SHEIuMetjwDB3VjOyltxPyBiJwrX9YEPbN5Kd9yUpRW/geKvpqtxOkwJVq8P
	 uoZ0qVVMImRXE+sSwmrdTUJCu7uVP1T0jzUl4BMxbhoooVOHGJ3kJ54uoDpPtLIiOF3tm
	 8y61wNLMYtvCIKK/0QoKJoBCzxO2tvOIWfAqxh10Eec/YFNdSr83CxOE/acbE5uFWBquM
	 nLugkZaa+IfxdPo0QwarymKb30+MTOlIIb3yxJJOz/2NQ0qlyI7HK0HjhZ8bw9RegOn8n
	 rROkAmMKlP2WjNgLYuq5pjr2yAlaEblKWL7c2z0bVu0RUZv9cZos1/d1d/0LVEwyP/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=Z3t8nNVt;
	arc=none smtp.remote-ip=202.108.3.163
Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB265606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 08:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB265606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=Z3t8nNVt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1795424292;
	bh=aR0tmA1/eSKWhAkyRRrHigR/ndR4gGbRzgjxSxU95kk=;
	h=From:Subject:Date:Message-ID;
	b=Z3t8nNVtWMZttQCtngZxpcOmrl5loHSoO2shopEXkKc/7l8n0nMs96s6+7AklV6hM
	 sVxwuL8EkzewX3UVM743nknCHzOfZJ34Ki01Of0VIHhFKacNloYysTye67H5C4Jjvb
	 oa5Ss1xRQzKNskdugg7VnB9x073yEf+qcYqq2DB0=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.225.163])
	by sina.com (10.54.253.34) with ESMTP
	id 6B040016000026E2; Mon, 23 Nov 2026 16:58:00 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 5481496291758
X-SMAIL-UIID: 968F27132CE0417C82722B29A6077732-20261123-165800-1
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
Subject: [PATCH v3] mtd: phram: Use I/O memory accessors when in uncached mappings
Date: Mon, 23 Nov 2026 16:57:58 +0800
Message-ID: <20261123085758.152229-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261120094434.107278-1-eadavis@sina.com>
References: <20261120094434.107278-1-eadavis@sina.com>
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

phram_point() exposes a uncached pointer that obtained via ioremap() in
mtd->priv, which leads callers to perform standard memcpy() on it.

In phram_read/write/erase(), standard memory accessors are used when in
a cached; otherwise, I/O memory accessors are used. Only register _point
and __unpoint when cached mapping.

Fixes: f3d45ac21e46 ("mtd: phram: Module parameters add writable permissions")
Fixes: 285133040e6c ("arm64: Import latest memcpy()/memmove() implementation")
Reported-by: syzbot+ee09ee2112d03c35f1f7@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ee09ee2112d03c35f1f7
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
v1 -> v2: use phram_mtd_list cached, add void __iomem* and write use toio
v2 -> v3: update subject, conditionally register _point and _unpoint

 drivers/mtd/devices/phram.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index b42cadcd76b1..d7a074a69e62 100644
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
@@ -147,8 +163,10 @@ static int register_device(struct platform_device *pdev, const char *name,
 	new->mtd.size = len;
 	new->mtd.flags = MTD_CAP_RAM;
 	new->mtd._erase = phram_erase;
-	new->mtd._point = phram_point;
-	new->mtd._unpoint = phram_unpoint;
+	if (new->cached) {
+		new->mtd._point = phram_point;
+		new->mtd._unpoint = phram_unpoint;
+	}
 	new->mtd._read = phram_read;
 	new->mtd._write = phram_write;
 	new->mtd.owner = THIS_MODULE;
-- 
2.43.0

