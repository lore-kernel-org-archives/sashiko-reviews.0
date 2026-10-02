Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB1B468C39
	for <sashiko-reviews@lists.linux.dev>; Fri,  2 Oct 2026 21:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790978108; cv=none; b=Jj8cTJGMKFGlwW0P9FrWalgS2tVPzKkQxV/ASukXAjuXhs+qsxf2uBjqSggyYYWRhUOs1W2xVumZNcC7Y9wk/ZiKi8zxcku/BDS0fKLz6JiD4EIcOrlIGIZ6uQxmEjKXNGDEwJ5kATbespEymevo+5JQidnHb0DgDOPu9UvTejY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790978108; c=relaxed/simple;
	bh=EhqcVucYSakqM14c2cM72pxGNwF8rHEoxZY5/G9rgTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSkZokgPqUGHMd5Ey1NvFPVqCPFraCLP59KsR2ZFNsZUeSll17qrHLIgX3kiuSUPd0Uf8oMYohAb1Sz2rYXmQ85e1tapPQBJlzLziaxGPYkCogRzZMHlsDF/oBiD2sCGRTmJLwFwTknvYpawI3frb136Rib8RM14za7QTMgaMHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxGw0zY9; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxGw0zY9"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb751so2250a91.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 02 Oct 2026 14:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790978106; x=1791582906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwlbxNoSoLRMmJKLl4CKJFzcuVtF8rGKpkUB89vx4iQ=;
        b=gxGw0zY9+HVUj7m33o27xG+QKTs38LaoW6FxfLIIEIlgQk1kMv/gsGp5Oq4Mpg1qdJ
         nfJtoKr3DdE9FcxzWv3asLGjtPSBr3PXAzr6kw+r6GaFavRbrLu18tEOcOIrZYBtRTGi
         5CJpSLEaqXYmJuAwv4M4S3O2fQJyYXqMYgnNNDTRYVcaJRVkdHI8+bQt1KEHux1FoD49
         Y1LW/yCxKT/75s4KNsmime8J4okisgDS1fTqVvykePSuWpp2+7qth8LW2D6KS0ppIW/v
         12ksS6xFUFRO5VZAGQKmNsw4uJBK4/UKdtQKtpedrrecgfSCtMKNqI4qzkZzwHgH8/TP
         XM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790978106; x=1791582906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vwlbxNoSoLRMmJKLl4CKJFzcuVtF8rGKpkUB89vx4iQ=;
        b=w8nVvR/NEI1ro3GbjdH6FR2KfZ8ZGBePBki7RAwSJdDuKjbWKh2wKtdGVDdMBaKfS0
         9sUBXtj+aOQ4d6zGfLIo9Ks1VuP5H11vQv8/UWsYgthiM1tlCSP3sftRUyvF9B8Eq1Qk
         wkOtvA6Mz3V4oZK90lCoiVAk8mn1wDzyHBZzv4hNUzqjMeQHNe9IrkD+83P/9ZfE/2s7
         hofRoXdOU9W7li7cL9uQczygOoCU+mH95mwYGT2AiQu0BssXWpNzesMoFDwDBUEj5Lc8
         vs0D0aSHMGgpQ7cMbhptxtYYgo13i3s7AaZmV5cRDjLWtTjrh+NGaXe5R0hJoMxUcGTw
         Wd+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzjpmnwBYDlYp0o1ihZ+UkL5QAc68yJSQ69BGjV/CG91ZCluzsaAQer86aA5Ko4d7Dvs+xd96QgcJsMZptelJU=@lists.linux.dev
X-Gm-Message-State: AFq9FYLzDgpO5BosMCVt4Jv5uYQB3BGWwqPHPqSxkAlEFHMwlFMVq/FD
	9iIFdGKjPo7oeTKHRyiN/Y9NWVwZEOxO78LcMhULRoDZp4U2ypW2JgY/
X-Gm-Gg: AYBFou29yrgcoSXO19pbVETjISRGhBfK7/aSbOF6MoZjXSTxdoiKKG4ZnCjQNolhiFx
	AzDKFS5IIIcENq6iqZIYV1hIRCLChrPdghvRgi/n2nS4n+OCybIMKrgyKlGv20C5gSV487q5zMA
	3RT4SHDgZxQDrLObZV6o9qO9jOvZt1Z+h8LI0Xb4591SPHwjIp0ofVTF1DKSTrTknqxq7i1gIBi
	3uf54q96W7pdK6Y3f/QlstbGJQ2d2jq7DNm9+/ejRrOmIh4rR2UPygdeo0bNH1EZl/RylB33mBY
	+Y0jOePE6Ong7YD3EWeZGC9YQPB9q/fN8kVeulN0vwYZ6mopv0iGQHfnDBQWrxuc2vtjVb4Yq7q
	Arq6YPcWZzInfFzjLEXL/csZZUJQndK7JKuLToDd5lUyUfJMETEuB9aYwfC3jQvn2Ai/LPJgIAK
	4M0nXJKZ9bfReTUSK78r7v6pAOsdeJnoDKpqYwAWGW+QmQj2QaS5E0GbPelm+Pjlb8Y+kfxEGmR
	IxHQtgY7R/cM2HzFwk/yvxG6/wJTrsTcaEWrlDF8V8De2SxshJPnWWvP87R1rZ1wM+iaNZkq1h0
	sqPWSTZd28flNtONiuLREYARpqRivdC7xQwbeEgfczqZW6g=
X-Received: by 2002:a17:90b:28ce:b0:3a0:b40d:827 with SMTP id 98e67ed59e1d1-3a6f321f4b9mr1342400a91.0.1790978106232;
        Fri, 02 Oct 2026 14:55:06 -0700 (PDT)
Received: from 0xiviel.ip (122-63-128-121.mobile.spark.co.nz. [122.63.128.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4a1bfesm185515a91.12.2026.10.02.14.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 14:55:05 -0700 (PDT)
From: Eva Crystal <0xiviel@gmail.com>
To: Lizhi Hou <lizhi.hou@amd.com>,
	Min Ma <mamin506@gmail.com>,
	Oded Gabbay <ogabbay@kernel.org>
Cc: Max Zhen <max.zhen@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev,
	sashiko-bot@kernel.org
Subject: [PATCH] accel/amdxdna: document trusted mailbox ring geometry and drop the power-of-two check
Date: Sat,  3 Oct 2026 09:58:14 +1300
Message-ID: <20261002205814.178031-1-0xiviel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <67698952-6394-44a8-01fe-3e3558b7cb4c@amd.com>
References: <67698952-6394-44a8-01fe-3e3558b7cb4c@amd.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mailbox ring buffer geometry comes from AMD signed firmware, through
the management or mailbox information block, or through the CREATE_CONTEXT
response, and the driver trusts it by design.

The power-of-two test on rb_size was a firmware debugging aid. Nothing in
the driver derives a mask, a shift or a modulo from rb_size, so no code
depends on the property it tested. The ring index wrap is handled by the
explicit comparisons in mailbox_send_msg() and mailbox_get_msg().

Replace the test with a comment that records the design, so that
automated review does not flag the absence of a bound here again.

Suggested-by: Lizhi Hou <lizhi.hou@amd.com>
Link: https://lore.kernel.org/all/67698952-6394-44a8-01fe-3e3558b7cb4c@amd.com/
Signed-off-by: Eva Crystal <0xiviel@gmail.com>
---
The pkg_size check in xdna_mailbox_send_msg() is left in place on
purpose: it bounds a driver-supplied size, and with Max Zhen's pool
patch (20261002161122.1350075-1-max.zhen@amd.com) it is the only bound
on the write into a pre-allocated message slot.

 drivers/accel/amdxdna/amdxdna_mailbox.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 05c3786de135..c4a36858668f 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -513,11 +513,13 @@ xdna_mailbox_start_channel(struct mailbox_channel *mb_chann,
 {
 	int ret;
 
-	if (!is_power_of_2(x2i->rb_size) || !is_power_of_2(i2x->rb_size)) {
-		pr_err("Ring buf size must be power of 2\n");
-		return -EINVAL;
-	}
-
+	/*
+	 * The ring buffer geometry, rb_start_addr and rb_size for both the
+	 * x2i and the i2x channel, comes from AMD signed firmware, through
+	 * the management or mailbox information block, or through the
+	 * CREATE_CONTEXT response. The driver trusts those values by design
+	 * and does not bound them against the mapped region.
+	 */
 	mb_chann->msix_irq = mb_irq;
 	mb_chann->iohub_int_addr = iohub_int_addr;
 	memcpy(&mb_chann->res[CHAN_RES_X2I], x2i, sizeof(*x2i));
