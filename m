Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=60.191.123.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739999;
	b=tGmFshQuMV4l1BdkfsrM5b9xVdFBCWdn4hpwLbiReUflONUormiyb491muwy5gOiLYMq
	 S4WBv7I9kPaJt/rZRCd9EUlV8KQcUho7yIy3gzNobmbIDp4fm5I0MCwGpKQhTaMIbl6ud
	 TyGVruHrQdr10ENKgWS282T0SOYf55GJIUhtJUuqJEcq7CiHFEiEpf1SXrnptnuvaNxhJ
	 ix5VW/CZNhahwtf6X7lzMft8APHa60fJ895kTaBZMJxzqz5gVCEWnmoOGYphL38zl5sWx
	 VTJQfpwEn90d4Db8qMBWVV+Q4jNVfhgYA4GpdeY7qmYY++YhQVwsK6gP1utTpsIzniA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739999;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=jS5B9NhavcIBSgoKzgwmt2BJniq8iKAJOF817wNDYUk=;
	b=AbnAcFg1ybrmvaWb2arixDhNJP4UmTBnyEKoHizqRgyxKqCW2q0uEbiLskiS6QkN4II3
	 ILJIROSKF8L5sToNusl7LTtyvYedvYBNrp7xYSWrNU0IB8ouPD4qm5LMcCV5iZHcYN7xL
	 dbOgt84kb1FEN5kVVpLHmFOxjrKRXc0yE+ySoisBqMEt7x7UBttv2htr1AazIx8nu00Gu
	 ObexbxbHew/E6AOnSrdEH7o+Vw17yBeDyDes3Ac6ck0/7FqMoNu6N4GVJXEcpHqVLci0W
	 E5PNpaA+GKoVKZT6l5dlteGMjf+z8hrimKpenZ+Ss3IIYoxOixZBG7hZKH8ZzbpWfrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=h3c.com;
	spf=pass smtp.mailfrom=h3c.com;
	arc=none smtp.remote-ip=60.191.123.56
Received: from h3cspam01-ex.h3c.com (smtp.h3c.com [60.191.123.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5ACA606A31D
	for <sashiko-reviews@lists.linux.dev>; Fri, 23 Oct 2026 07:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5ACA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h3c.com
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 69N7JJ9e080264;
	Fri, 23 Oct 2026 15:19:19 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from DAG6EX09-BJD.srv.huawei-3com.com (unknown [10.153.34.11])
	by mail.maildlp.com (Postfix) with ESMTP id A9F602284EA4;
	Fri, 23 Oct 2026 15:22:31 +0800 (CST)
Received: from localhost.localdomain (10.142.164.48) by
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Fri, 23 Oct 2026 15:19:18 +0800
From: Nan Lin <lin.nan@h3c.com>
To: <chengzhihao1@huawei.com>
CC: <lin.nan@h3c.com>, <linux-mtd@lists.infradead.org>, <richard@nod.at>,
        <sashiko-bot@kernel.org>, <sashiko-reviews@lists.linux.dev>,
        <wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>
Subject: [PATCH v3] ubifs: zero stale data beyond EOF before file size grows
Date: Fri, 23 Oct 2026 15:11:41 +0800
Message-ID: <20261023071141.3507024-1-lin.nan@h3c.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <9380b1bc-45b6-5d95-7260-5a8dc92acc09@huawei.com>
References: <9380b1bc-45b6-5d95-7260-5a8dc92acc09@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: BJSMTP02-EX.srv.huawei-3com.com (10.63.20.133) To
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:h3cspam01-ex.h3c.com 69N7JJ9e080264

mmap writes can dirty the page cache beyond EOF without changing
i_size. A later extending write or ftruncate turns that region into a
hole, but UBIFS never zeroes the partial page at the old EOF, so reads
expose the stale data.

Zero the tail of the cached old-EOF folio in both size-extending
paths: ubifs_write_iter() for writes starting beyond EOF, and
do_setattr() before truncate_setsize() grows the size. This mirrors
what ext4 does on size extension;

All zeroing takes the old-EOF folio lock without ui->ui_mutex, keeping
the folio_lock -> ui_mutex order of ->writepage(); the reverse order
deadlocks.

UBIFS does not enable large folios, so the EOF folio is always a
single page today; nevertheless, use folio-relative arithmetic
(offset_in_folio(), folio_contains(), folio_size()) throughout so the
code is correct if that ever changes.

Signed-off-by: Nan Lin <lin.nan@h3c.com>

Changes since v2:
 - Move the extending-write check from ubifs_write_begin() to
   ubifs_write_iter(), mirroring ext4_write_checks() ->
   ext4_block_zero_eof(): the hole zeroing runs once per write()
   syscall instead of once per ->write_begin() iteration (suggested
   by Zhihao Cheng).
 - Drop the ubifs_vm_page_mkwrite() zeroing: like ext4
   (ext4_block_write_begin() with len = i_size - folio_pos),
   ->page_mkwrite() does not zero the tail beyond EOF, and mmap
   writes past EOF are the user's responsibility (suggested by
   Zhihao Cheng).

Changes since v1:
 - Both zeroing sites used PAGE_SIZE-relative arithmetic
   (offset_in_page()-style) while folio_zero_range() expects
   folio-relative offsets. UBIFS does not currently enable large
   folios, so PAGE_SIZE == folio_size() and the two coincide in
   practice, but switch to offset_in_folio()/folio_size() anyway so
   the code is correct if UBIFS ever opts into large folios
   (suggested by Sashiko AI review).
---
 fs/ubifs/file.c | 63 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index e73c28b12f97..e94fbcae6d3d 100644
--- a/fs/ubifs/file.c
+++ b/fs/ubifs/file.c
@@ -202,6 +202,53 @@ static void release_existing_page_budget(struct ubifs_info *c)
 	ubifs_release_budget(c, &req);
 }
 
+/**
+ * ubifs_zero_eof_hole - zero the stale tail of the old-EOF folio.
+ * @inode: inode whose size is about to grow
+ * @new_end: new end of the file, only used to bound the tail
+ *
+ * Zero the cached folio containing the old EOF for [old EOF,
+ * min(folio end, @new_end)) so a size extension does not expose stale
+ * data left beyond EOF by mmap writes.
+ *
+ * Must be called without ui->ui_mutex held: we block on the old-EOF
+ * folio lock, and ->writepage() and ->page_mkwrite() hold that folio
+ * lock while taking ui_mutex; the reverse order deadlocks.
+ */
+static void ubifs_zero_eof_hole(struct inode *inode, loff_t new_end)
+{
+	loff_t old_size = i_size_read(inode);
+	size_t from, to;
+	struct folio *folio;
+
+	if (new_end <= old_size)
+		return;
+
+	folio = filemap_lock_folio(inode->i_mapping, old_size >> PAGE_SHIFT);
+	if (IS_ERR(folio))
+		return;
+
+	/*
+	 * Re-read i_size under the folio lock: a concurrent truncate may
+	 * have shrunk the file, turning this folio into valid data.
+	 */
+	old_size = i_size_read(inode);
+	if (new_end <= old_size)
+		goto out;
+
+	from = offset_in_folio(folio, old_size);
+	if (!from)
+		goto out;
+	to = folio_contains(folio, new_end >> PAGE_SHIFT) ?
+	     offset_in_folio(folio, new_end) : folio_size(folio);
+	if (to > from)
+		folio_zero_range(folio, from, to - from);
+
+out:
+	folio_unlock(folio);
+	folio_put(folio);
+}
+
 static int write_begin_slow(struct address_space *mapping,
 			    loff_t pos, unsigned len, struct folio **foliop)
 {
@@ -1220,6 +1267,10 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
 
 	if (attr->ia_valid & ATTR_SIZE) {
 		dbg_gen("size %lld -> %lld", inode->i_size, new_size);
+
+		/* Must run before the size change loses the old boundary. */
+		ubifs_zero_eof_hole(inode, new_size);
+
 		truncate_setsize(inode, new_size);
 	}
 
@@ -1433,7 +1484,17 @@ static int update_mctime(struct inode *inode)
 
 static ssize_t ubifs_write_iter(struct kiocb *iocb, struct iov_iter *from)
 {
-	int err = update_mctime(file_inode(iocb->ki_filp));
+	struct inode *inode = file_inode(iocb->ki_filp);
+	int err;
+
+	/*
+	 * The write may extend beyond EOF: zero the stale tail of the
+	 * old-EOF folio first.
+	 */
+	if (iocb->ki_pos > i_size_read(inode))
+		ubifs_zero_eof_hole(inode, iocb->ki_pos);
+
+	err = update_mctime(inode);
 	if (err)
 		return err;
 
-- 
2.33.0

