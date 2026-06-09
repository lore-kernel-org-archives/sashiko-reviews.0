Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452CF2DE6F8
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 05:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780981224; cv=none; b=Oi4GL+oheAxo0apAbaw0WAUL7TPLcemr00LrUG4KX4a6MfYZLHsT7un7ORLx6LQJlbG3abkayk1aaY7AvDstmZ85QkAEwg7QKuybY2Mp1XacoZhyySSq9n+n051JDe5N9esQ5P8/C1iukoxJ3DKb8aLzxq9KB+uVYMLAP/l8XDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780981224; c=relaxed/simple;
	bh=yaKP7/UvUzQTM1UAwBovHUg+etg/wRkptdb8tOq3nbY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hgaVUiRCcmKWxxh+2b2s7qiCT3DFlCHSKcVoIlk1FrAq920XX1PpG/gxCsj/6T6JstWgLndfS/JtrUVTOkmHvoETemqBJgsKRWK/fDhipDKYv+jNbkgd1xsZUcuWQVM8buG7695Qi4ITcapaEFT2Bbf+PSlJT3VXvLUH/hA5WBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vvf5MQDL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vvf5MQDL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf30d530bdso51660655ad.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 22:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780981222; x=1781586022; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fBlgRbs5zbK19LMQRjJDNeRT5MSpRwsmVLifXE9+D5M=;
        b=Vvf5MQDLl53pFsb50OxteA0GebcygcO+pB3wNJR3bZ/lOoal6KO8qW+yfzLok5A9VY
         yL2jeIK4Yf4CpLxU09qeFUiD7jfTFp8q4P/nk8IGpfLEGeyqT9Q44z+Lcw4oWh5WE5Ns
         cL9XP/+YEK+e0zPh5bJMpWcsPvivv+THSYo/pLm2LCYqIYy0T1uZ2fPB1xHnZHwE2G/Y
         nE/UibWActh2KbpDAWhlos6wWoRBzhdw6DuMHxuvegyvXBfMwmoqF676tcfmwVqmM16k
         DmLYndbYQDQF7JXjRb4RrUiaGndxo5xd0GiplLj4ZfJdkdocqeyYnrbumzTgSD4YivWk
         e+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780981222; x=1781586022;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fBlgRbs5zbK19LMQRjJDNeRT5MSpRwsmVLifXE9+D5M=;
        b=k14av+ubtu7D/7Q9g/7M3NpE2a+s9YJQYZf9Osx72RGyyL9in9M0u17XcCJvdFOGFb
         8P4k1R1V9WZd6G11yWIKbOOlnSCFeZ6DVSTBuixMdkKc7SKQj9wuTNcuaGCowSbJeT56
         osz5wyFNnfPFakaycubIRrYmGbMx2/hVLVxFydVotYumPfiYdsiQVlkipi2Tb3c6K0X+
         7gk7H1AX7R1b+KsPKnmI7051m+StQuaA+KDaaDKtVN4bjDxZq+f7XlF9rBkKkLQzeYRf
         VHqQRu3Avh8H0FZV3T8h1xG5wVVwRaUsEyYju+Y5UG9uyNZH+QwNx1i5IHL0MD4BujlM
         T1Iw==
X-Forwarded-Encrypted: i=1; AFNElJ/9V5RD9MlF02qWqkX1LTk7Gv4PCO7SPtm6OA9E3diKx0oUc0qVoVpfPyMEGmqGiW9qiQ+MKijO2XMGZiNjKJI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSiCoekM9ACrYYrGttfKHT2KaZ7i1UZ2UT+yCuXOzcsos2CrD8
	vwu8F4EZpEojFMO5We76UnGK6caCb53+IW/BQOqE8Wa6fnX8w8ViBLb2
X-Gm-Gg: Acq92OEfr937yIvLDFTSHf3DXrEqSrVqJB52M8i3PgzQ6FvemldugRdf9fYrO4RtPGk
	BCaAw0ejSV9ym5fvvjdT4e+p/O7kCkEzGfp5h+CpKoGM1Cra3Ckeeoa4gMhCCkboX94fccp4EpM
	Glnr4y79WT0a+o3A7tTeL+OjckomSjNzJGn0p52ZigSCym/5PWjoglQy9I434UeHPISa+ef2w7C
	HlYh5YTkkOQ4PRo3w5xXZ+CSeYOvYD66SMWcCUz8l24PBHN20v+cu4NX7hnkpoyiKNDQlNiv3kt
	pk25uT+HMdLM3q0pTuklnZoxba59rq6pJKvzA317DEB8JP556rQukgJFWrlci04fB9K+KhCiIIB
	PY25lREPOIU8CB0NtjA7OCatyqT0cHrvXRyES0mPKBYVBm+q3E2kllpz1oM/PVrgk1t3QesvgHw
	j2DeEWHGoy+lGX4Sa74+TW7tXcwnffKhX24Ee6zthRrR5miMMm//bH0oDT1l+2DjtQ9DC/g2+yq
	SfDO7n7HwYW6gU9H7C4/zAF86uACW7+E2Hi6ZC+ad9lOa/YZ+nzOWkljMZPdR9HeCsebcaDrRep
	4VuvqpYWRpv7vPAGbfh3kLrOwFoyplEZ7IxY8WINSYXenjVngA==
X-Received: by 2002:a17:902:fc4c:b0:2c2:1982:527a with SMTP id d9443c01a7336-2c2198254f0mr152300195ad.16.1780981222155;
        Mon, 08 Jun 2026 22:00:22 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-b.c.d33bddc1d573818c7-tp.internal (192.152.126.34.bc.googleusercontent.com. [34.126.152.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c166391d53sm254648635ad.65.2026.06.08.22.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 22:00:21 -0700 (PDT)
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
To: Theodore Ts'o <tytso@mit.edu>,
	Andreas Dilger <adilger.kernel@dilger.ca>
Cc: Jan Kara <jack@suse.cz>,
	Baokun Li <libaokun@linux.alibaba.com>,
	Ojaswin Mujoo <ojaswin@linux.ibm.com>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Zhang Yi <yi.zhang@huawei.com>,
	sashiko-reviews@lists.linux.dev,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aditya Prakash Srivastava <aditya.ansh182@gmail.com>,
	syzbot+0c89d865531d053abb2d@syzkaller.appspotmail.com
Subject: [PATCH v3] ext4: fix kernel BUG in ext4_write_inline_data_end
Date: Tue,  9 Jun 2026 04:59:55 +0000
Message-ID: <20260609045956.1910-1-aditya.ansh182@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the data=journal mount option is used, the ext4_journalled_write_end()
function incorrectly calls ext4_write_inline_data_end() without checking
if the EXT4_STATE_MAY_INLINE_DATA flag is still set on the inode.

If a previous attempt to convert the inline data to an extent failed (e.g.
due to ENOSPC), the EXT4_STATE_MAY_INLINE_DATA flag is cleared, but
the EXT4_INODE_INLINE_DATA flag remains set. In this scenario, the next
call to ext4_write_begin() will not prepare the inline data xattr for
writing, but ext4_journalled_write_end() will incorrectly attempt to write
to it, triggering a BUG_ON(pos + len > EXT4_I(inode)->i_inline_size) in
ext4_write_inline_data() since i_inline_size was not expanded.

Additionally, a concurrent ext4_page_mkwrite() can execute
ext4_convert_inline_data() between ext4_write_begin() and ext4_write_end()
since it only takes xattr_sem. This concurrent path converts the inline
data to an extent and clears both the EXT4_INODE_INLINE_DATA and
EXT4_STATE_MAY_INLINE_DATA flags. Since the block buffers were not
allocated in ext4_write_begin(), falling through to the block fallback path
causes a NULL pointer dereference because folio_buffers(folio) is NULL.

Fix this by ensuring that the write_end functions (including
ext4_write_end() and ext4_da_do_write_end()) safely return 0 to trigger
a VFS retry if they detect folio_buffers(folio) is NULL after falling
through from the inline data check. Returning 0 signals
generic_perform_write() to revert the write iterator and retry the
entire write operation, which will then properly allocate block buffers.

To prevent transaction handle leaks and subsequent filesystem hangs during
retries, we stop any active journal handle via ext4_journal_stop() before
returning 0. We also explicitly check that the retrieved handle is non-NULL
prior to stopping it, preventing a potential NULL pointer crash inside
ext4_put_nojournal().

Reported-by: syzbot+0c89d865531d053abb2d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0c89d865531d053abb2d
Fixes: 3fdcfb668fd7 ("ext4: add journalled write support for inline data")
Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
---
v3:
  - Fix journal handle leak in ext4_da_do_write_end() by stopping the active
    handle before returning 0 on the fallback path.
  - Safely check if the retrieved handle is non-NULL before calling
    ext4_journal_stop() in ext4_write_end() and ext4_journalled_write_end()
    to prevent a kernel crash inside ext4_put_nojournal().
v2:
  - Address TOCTOU race condition (reported by Sashiko AI review):
    A concurrent ext4_page_mkwrite() can execute ext4_convert_inline_data()
    which takes xattr_sem and converts the inline data to extents, clearing
    both EXT4_INODE_INLINE_DATA and EXT4_STATE_MAY_INLINE_DATA flags between
    ext4_write_begin() and write_end().
  - Safely return 0 from write_end functions if folio_buffers(folio) is NULL
    to trigger a VFS retry. This prevents a NULL pointer dereference in
    ext4_journalled_zero_new_buffers() and ext4_walk_page_buffers().
  - Add check for ext4_write_end() and ext4_da_do_write_end().
 fs/ext4/inode.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index c2c2d6ac7f3d..bc2688e03c19 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1455,6 +1455,14 @@ static int ext4_write_end(const struct kiocb *iocb,
 		return ext4_write_inline_data_end(inode, pos, len, copied,
 						  folio);
 
+	if (unlikely(!folio_buffers(folio))) {
+		folio_unlock(folio);
+		folio_put(folio);
+		if (handle)
+			ext4_journal_stop(handle);
+		return 0;
+	}
+
 	copied = block_write_end(pos, len, copied, folio);
 	/*
 	 * it's important to update i_size while still holding folio lock:
@@ -1560,10 +1568,19 @@ static int ext4_journalled_write_end(const struct kiocb *iocb,
 
 	BUG_ON(!ext4_handle_valid(handle));
 
-	if (ext4_has_inline_data(inode))
+	if (ext4_has_inline_data(inode) &&
+	    ext4_test_inode_state(inode, EXT4_STATE_MAY_INLINE_DATA))
 		return ext4_write_inline_data_end(inode, pos, len, copied,
 						  folio);
 
+	if (unlikely(!folio_buffers(folio))) {
+		folio_unlock(folio);
+		folio_put(folio);
+		if (handle)
+			ext4_journal_stop(handle);
+		return 0;
+	}
+
 	if (unlikely(copied < len) && !folio_test_uptodate(folio)) {
 		copied = 0;
 		ext4_journalled_zero_new_buffers(handle, inode, folio,
@@ -3231,7 +3248,10 @@ static int ext4_da_do_write_end(struct address_space *mapping,
 	if (unlikely(!folio_buffers(folio))) {
 		folio_unlock(folio);
 		folio_put(folio);
-		return -EIO;
+		handle = ext4_journal_current_handle();
+		if (handle)
+			ext4_journal_stop(handle);
+		return 0;
 	}
 	/*
 	 * block_write_end() will mark the inode as dirty with I_DIRTY_PAGES
-- 
2.47.3

