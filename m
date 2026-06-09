Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2AB31E82F
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 04:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780978654; cv=none; b=nqIl9ADXWMD3/F/u5Q4pemz1FqLNYiazkXMabfQCX2HDPHpJKML6vMwZuRYsFYwAiWPPKHucLBTj8ygmEmQeJ8MrdQZ5FF7V8WFj1cysjBHFaCUJoysx1wbuD7Vq1R96oJavhYhBbs+eZf+n7BgkKj/RqIArMmB0e+VOjpw6ml4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780978654; c=relaxed/simple;
	bh=U4Np9Ii9wtElKPYq5/Att3d025QkxteJXmh4QQc94mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZkFlP8W1zE8vtwtUMKB3JM27CqrVwcC8SxqtRf8Xq7FBckAEcjFnUfuQrWVoepPBWLSCG6WEaYLFtWPYjGFX/SLTnn0PTLMyn+7BOA6LonuVlsD2D+AvJPTv4MYDQXmd+E7FNaMcUIY028YfHHKoe8IyMgl0rFuMIQBg5wpR3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEPs58OI; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEPs58OI"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf20f6be6bso38712465ad.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 21:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780978653; x=1781583453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q406pH5lUADnbt61DxG138tUfOLYKP8K5yUgAEXHh5w=;
        b=hEPs58OINfz+UR+TtmN2AUu4V+aiQ6OS3OwZUt0Gp65h9WULfliim6F62jq2OfsWnf
         tGz6DWupi4+l2iFFZYIGpa/CJ445bBPJA5E2etHHdZmk7/lxu8uG2SHS67cmy2TO5267
         u3GL60F3t9+/wXtySsksHrK7gTM7TWT43kmkz5e5wZR0BM0V4hyfrHhz+7nK8WRwFi1S
         YxDubw/yUoiVRzqcpeobomVdzB6tWzAszxR1YwjOYeHw9r3u/f4prQnwBbJkYeNEx7iH
         xd+zRqOk77sxn7sdEUGW1ZGrYTOWEoFgDddLeuELLFeyMB+CqDThZ+qrSllyRUmDlLqa
         S9eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780978653; x=1781583453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q406pH5lUADnbt61DxG138tUfOLYKP8K5yUgAEXHh5w=;
        b=cMuitZcev48Dwe86nMoVWTGYKgGgpU1HmYgHwX6B8T7xy5IcZ4KGV0R4ZttoDdYDyl
         DHFyS492vmd0EufpQtSgIEGaKEPaezM6pnjBzAQ2r4TBZVUnjJtD4sIwWzDRffeg7nka
         ZhR4QvQHCBO4M3U6u/Vfer4zaGM4W1UqVADZcGZ58h4IGjvkum/TUBgxhCwW3hWCINzz
         kWlzYNru3MgTz9yycZKYGrbzgDpdcjLUbDk+PAadwD2dG6PDnb9FG46re0ZAnz99qJJV
         U4FQQ4kzb5VTBIRRrrY6mOU2AH68XS31X0FH3ZkZFcRroOgPM9WD0haKfOA+U33pafa4
         Myzg==
X-Forwarded-Encrypted: i=1; AFNElJ/rWlWIc6WBe05dlemcyeyHaAqjrSYfPXtzwDwGLcq4FEh7zUhOzZrEXju7aadJbHLG+P8WptJhiaF0zOKTNfk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxLNdHTmpkYej/y/iQbU7nT+oe2ooO2/8iOesv/yNefoYNqFFZx
	CEyHOGO5fjuq6anX8OPJdgVlDo+qmE7hwEQyrG7eM37h3ewjy+fL5eSv
X-Gm-Gg: Acq92OGNysTy2OigO5Yq/opgmRnF9c4d0abQKZumU1XgQDkd4KznVro7JhlegT7C6HN
	8W7PuTq+mvO3Wxqd7OB+fl2uloNUvDsKZ6ehkes+oKKOvicc3OtwjjgmExKfg7cFzrKQFuUWIp5
	LcDsXs+gYPIqZu0FLGr3m99GgyBvrqVNBTyMmSVrDBwNqrYKUAtmXEOM4Zt8jA7Dcer5h1iKB5x
	eE9dPmXnRtbcCnUQZ0gakcf/ZxjwhBhj6RmYpWdqkjChaWu1ptqd37dP9mwYSesAC+r4EeMITRT
	uNE4jotCnnqQNuiObSADS4+cpLmOy+6XbQgjiUuxaI8j1I4ZCXlmG0tlg0O3H0Jy55tWGcWIkif
	b652EqRPzoEZa4lDOlkm8tEnddAdKDNmVJBq5IGkYDpt+pS9dcIeSa5CUFmwcf6KVQnSY5Mlvts
	pdZaa9MZvtSmS2eEKOSo3DfeLtAd7y5sD+6STdRIuZSJKwTEsjpPkrPeGoyJpfQM8R3SilGLvvL
	AWUvhDmLAIejQMHiE+wyaH040+QqBeierwwbQatIIc4upSUZZb+9o/Y7YZwTaPwcCWH/PUH5GjR
	zFEIGY1i3PEv2W6B1DBjceKGMYdWN7ISZycWlGPznX4KFLbRsA==
X-Received: by 2002:a17:903:2450:b0:2c1:27a3:6859 with SMTP id d9443c01a7336-2c1e79e22dcmr216110905ad.7.1780978652716;
        Mon, 08 Jun 2026 21:17:32 -0700 (PDT)
Received: from cs-1047136853211-default.asia-southeast1-b.c.d33bddc1d573818c7-tp.internal (192.152.126.34.bc.googleusercontent.com. [34.126.152.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c249aeb62csm74641005ad.68.2026.06.08.21.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 21:17:32 -0700 (PDT)
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
Subject: [PATCH v2] ext4: fix kernel BUG in ext4_write_inline_data_end
Date: Tue,  9 Jun 2026 04:17:03 +0000
Message-ID: <20260609041704.1709-1-aditya.ansh182@gmail.com>
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

Reported-by: syzbot+0c89d865531d053abb2d@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0c89d865531d053abb2d
Fixes: 3fdcfb668fd7 ("ext4: add journalled write support for inline data")
Signed-off-by: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
---
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
 fs/ext4/inode.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index c2c2d6ac7f3d..d6c934b2ae31 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -1455,6 +1455,13 @@ static int ext4_write_end(const struct kiocb *iocb,
 		return ext4_write_inline_data_end(inode, pos, len, copied,
 						  folio);
 
+	if (unlikely(!folio_buffers(folio))) {
+		folio_unlock(folio);
+		folio_put(folio);
+		ext4_journal_stop(handle);
+		return 0;
+	}
+
 	copied = block_write_end(pos, len, copied, folio);
 	/*
 	 * it's important to update i_size while still holding folio lock:
@@ -1560,10 +1567,18 @@ static int ext4_journalled_write_end(const struct kiocb *iocb,
 
 	BUG_ON(!ext4_handle_valid(handle));
 
-	if (ext4_has_inline_data(inode))
+	if (ext4_has_inline_data(inode) &&
+	    ext4_test_inode_state(inode, EXT4_STATE_MAY_INLINE_DATA))
 		return ext4_write_inline_data_end(inode, pos, len, copied,
 						  folio);
 
+	if (unlikely(!folio_buffers(folio))) {
+		folio_unlock(folio);
+		folio_put(folio);
+		ext4_journal_stop(handle);
+		return 0;
+	}
+
 	if (unlikely(copied < len) && !folio_test_uptodate(folio)) {
 		copied = 0;
 		ext4_journalled_zero_new_buffers(handle, inode, folio,
@@ -3231,7 +3246,7 @@ static int ext4_da_do_write_end(struct address_space *mapping,
 	if (unlikely(!folio_buffers(folio))) {
 		folio_unlock(folio);
 		folio_put(folio);
-		return -EIO;
+		return 0;
 	}
 	/*
 	 * block_write_end() will mark the inode as dirty with I_DIRTY_PAGES
-- 
2.47.3

