Received: from h3cspam01-ex.h3c.com (smtp.h3c.com [60.191.123.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203CD377ED9
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 03:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.191.123.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792380851; cv=none; b=nU5lYto2uMf3fXcS5hIak/G6A1/1dk6lr+pcmTdPjV9ERLdzM9100hxAtQ4U4+aWS3mnhNCTsADX5lJ9KVyriYfyldGUhmpVxXAA3zVaxjNeku/zvPGfsQs6qCo+G8gWVS4kiGuLUhQpwZl8xITaUseeRb9Fy6h+lX0ADJotRSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792380851; c=relaxed/simple;
	bh=GlDFamdmV7uagRt0szWh3vWqD1k8yemQuuVgfqOFn9Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JeeMInOGHns2cFoQI0S/xnyI/M1yJXfukG04U6r5aJRTRbfMaPoBDf6yedOeGRFsthzae/k2VeTk8mNN5+xYriYP0OR5SMrI/2ds7tcDCpeBDCnz6L4c7AdDDR3tGJvBVZSrlHgaOX/xOU2ChZiSudkdl3eebjz5kQ+V8KN4kls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com; spf=pass smtp.mailfrom=h3c.com; arc=none smtp.client-ip=60.191.123.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h3c.com
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 69J3XML9077055;
	Mon, 19 Oct 2026 11:33:22 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from DAG6EX09-BJD.srv.huawei-3com.com (unknown [10.153.34.11])
	by mail.maildlp.com (Postfix) with ESMTP id 3544E2284EA2;
	Mon, 19 Oct 2026 11:36:26 +0800 (CST)
Received: from localhost.localdomain (10.142.164.48) by
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Mon, 19 Oct 2026 11:33:20 +0800
From: Nan Lin <lin.nan@h3c.com>
To: <sashiko-bot@kernel.org>
CC: <chengzhihao1@huawei.com>, <lin.nan@h3c.com>,
        <linux-mtd@lists.infradead.org>, <richard@nod.at>,
        <sashiko-reviews@lists.linux.dev>, <wangxiaoqing@h3c.com>,
        <zhou.kete@h3c.com>
Subject: [PATCH v2] ubifs: zero stale data beyond EOF before file size grows
Date: Mon, 19 Oct 2026 11:25:30 +0800
Message-ID: <20261019032530.2212601-1-lin.nan@h3c.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <sashiko-outbox-174089@kernel.org>
References: <sashiko-outbox-174089@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSMTP01-EX.srv.huawei-3com.com (10.63.20.132) To
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:h3cspam01-ex.h3c.com 69J3XML9077055

mmap writes can dirty the page cache beyond EOF without changing
i_size. A later extending write or ftruncate turns that region into a
hole, but UBIFS never zeroes the partial page at the old EOF, so reads
expose the stale data.

Zero the tail of the old-EOF folio in all three size-extending paths:
ubifs_write_begin() for writes starting beyond EOF, do_setattr()
before truncate_setsize() grows the size, and ubifs_vm_page_mkwrite()
so mmap writes cannot leave such a tail behind. This mirrors what
block_page_mkwrite() does for buffer_head filesystems and what ext4
does on size extension.

All zeroing takes the old-EOF folio lock without ui->ui_mutex, keeping
the folio_lock -> ui_mutex order of ->writepage() and
->page_mkwrite(); the reverse order deadlocks.

UBIFS does not enable large folios, so the EOF folio is always a
single page today; nevertheless, use folio-relative arithmetic
(offset_in_folio(), folio_contains(), folio_size()) throughout so the
code is correct if that ever changes.

Signed-off-by: Nan Lin <lin.nan@h3c.com>

Changes since v1:
 - Both zeroing sites used PAGE_SIZE-relative arithmetic
   (offset_in_page()-style) while folio_zero_range() expects
   folio-relative offsets. UBIFS does not currently enable large
   folios, so PAGE_SIZE == folio_size() and the two coincide in
   practice, but switch to offset_in_folio()/folio_size() anyway so
   the code is correct if UBIFS ever opts into large folios
   (suggested by Sashiko AI review).

---
 fs/ubifs/file.c | 73 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/fs/ubifs/file.c b/fs/ubifs/file.c
index e73c28b12f97..1726714161a1 100644
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
@@ -423,6 +470,14 @@ static int ubifs_write_begin(const struct kiocb *iocb,
 	if (unlikely(c->ro_error))
 		return -EROFS;
 
+	/*
+	 * The write starts beyond EOF: zero the stale tail of the old-EOF
+	 * folio before budgeting takes ui->ui_mutex. do_readpage() only
+	 * sanitizes the write folio, not the old-EOF folio.
+	 */
+	if (pos > inode->i_size)
+		ubifs_zero_eof_hole(inode, pos);
+
 	/* Try out the fast-path part first */
 	folio = __filemap_get_folio(mapping, index, FGP_WRITEBEGIN,
 			mapping_gfp_mask(mapping));
@@ -1220,6 +1275,10 @@ static int do_setattr(struct ubifs_info *c, struct inode *inode,
 
 	if (attr->ia_valid & ATTR_SIZE) {
 		dbg_gen("size %lld -> %lld", inode->i_size, new_size);
+
+		/* Must run before the size change loses the old boundary. */
+		ubifs_zero_eof_hole(inode, new_size);
+
 		truncate_setsize(inode, new_size);
 	}
 
@@ -1494,6 +1553,7 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 	struct timespec64 now = current_time(inode);
 	struct ubifs_budget_req req = { .new_page = 1 };
 	int err, update_time;
+	loff_t i_size;
 
 	dbg_gen("ino %llu, pg %lu, i_size %lld",	inode->i_ino, folio->index,
 		i_size_read(inode));
@@ -1553,6 +1613,19 @@ static vm_fault_t ubifs_vm_page_mkwrite(struct vm_fault *vmf)
 		filemap_dirty_folio(folio->mapping, folio);
 	}
 
+	/*
+	 * Zero the part of the EOF folio beyond i_size so mmap writes
+	 * cannot leave a stale tail behind (see ubifs_zero_eof_hole()).
+	 * For a folio-aligned i_size the mkwrite entry check has already
+	 * returned SIGBUS, so @from is always non-zero here.
+	 */
+	i_size = i_size_read(inode);
+	if (folio_contains(folio, i_size >> PAGE_SHIFT)) {
+		size_t from = offset_in_folio(folio, i_size);
+
+		folio_zero_range(folio, from, folio_size(folio) - from);
+	}
+
 	if (update_time) {
 		int release;
 		struct ubifs_inode *ui = ubifs_inode(inode);
-- 
2.33.0

