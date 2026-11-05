Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856440;
	b=J3VqmsQ9OwJqtwNxt8cBZdcFgxQDeq4HWpDrOfMf34CshC3UHK1z8qsWhTLrkxnBYYzP
	 VF8XScYEeDiMOk5LsUNDR12Iv3Apryy88hiBoieWUraCpy5lQEDVh/uN27EQmYnprmP9/
	 iCe9n40XPp1WVQg3RN74SeQxo3iIvkcsdwYrmGU5GD2vkOA6yw/7ECbsWNDYwv0gDv6sP
	 GrCjGhkzWCcJz4q7uwFZskA+rQ4WC0bjWe9Rku2SiyIVr4fb4ihxiiK74nsy8p8/0TYJD
	 UwhjjOj+QdmQ0oXoJuxoqOo8OGuyMTzcJnvDU28LmwSUZzCIzj2txRGGEwd2xZ/RBmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856440;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=9Daa3FHwpcJFP597PrdbQcKKPLxvw3pFmtT+70N8AzY=;
	b=J1Vzme5c3w1AJODi/KnwUyjakmHtJqt30T2c1Eg2LRnoUckwQfDmWM3ojFHgnL7QXGXr
	 5pl2Xc58h7SoFtXAvPTaDPvbOSrie9g0Ky6oaCh0knfmizT3UNcAlZ4ygqv9xR2SxXwv9
	 GeHhwl867sTZ7ju1uOXSRO5VuwvnDjQo5FJTP4eltNoRF9RUOnyfIaxaj/1grEgbDy467
	 0zoGQUukDi8ygzypOIpqb9cYXhQl+6qV+6Tx1x4L6/r6admbelyotJUn1+CcYhOH4Qju1
	 HizN3QcrdfPXKsO2MEdqT8GJgSydF8S3M6a17j7j8PDpoUKiorG+cv92KsfwCAG+WFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=XMr3VomP;
	arc=none smtp.remote-ip=61.135.153.170
Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE0D606A328
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 05:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBE0D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=XMr3VomP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793856435;
	bh=9Daa3FHwpcJFP597PrdbQcKKPLxvw3pFmtT+70N8AzY=;
	h=From:Subject:Date:Message-ID;
	b=XMr3VomPfWVSYGGwbDWZZBz21tXIkoTErDKgYCWNBe2eLpCKduqlXZ8jIEVl8d/b/
	 hPeJUQL1WXqJFoMKSS1lS8jGuvVzPhRgK/Ebs1I8bmO0lQ5iqi3r+im0J3+PWCxvb6
	 OEWHosfk4YB6M09hgHaQZBCe6zYaC2wyqONtAQs0=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6AEC13AC0000536E; Thu, 5 Nov 2026 13:27:10 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6849496291662
X-SMAIL-UIID: F141B9CBB75B49DAB820F25088968A10-20261105-132710-1
From: Edward Adam Davis <eadavis@sina.com>
To: sashiko-bot@kernel.org
Cc: media-ci@linuxtv.org,
	sashiko-reviews@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org,
	robin.clark@oss.qualcomm.com
Subject: [PATCH v2] dma-buf/sw_sync: Optimize the retrieval of fence reference counts
Date: Thu,  5 Nov 2026 13:27:07 +0800
Message-ID: <20261105052707.55911-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <sashiko-outbox-198550@kernel.org>
References: <sashiko-outbox-198550@kernel.org>
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

There is a race condition between closing a sync file and the SW_SYNC_IOC_INC
operation on a sync obj. When a fence is created via SW_SYNC_IOC_CREATE_FENCE,
its reference count is initialized to 1. When the sync file is closed, the
fence's reference count drops to 0. A race occurs if SW_SYNC_IOC_INC accesses
the fence whose ref count has already reached 0 before dma_fence_release()
calls timeline_fence_release() to erase the corresponding pt_tree node from
the sync object, potentially hitting:

refcount_t: addition on 0; use-after-free.
------------[ cut here ]------------
kernel BUG at lib/refcount.c:34!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
Call Trace:
 kref_get include/linux/kref.h:45 [inline]
 dma_fence_get include/linux/dma-fence.h:323 [inline]
 sync_timeline_signal+0x6d9/0x8a0 drivers/dma-buf/sw_sync.c:224
 sw_sync_ioctl_inc drivers/dma-buf/sw_sync.c:405 [inline]
 sw_sync_ioctl+0x7b4/0x13f0 drivers/dma-buf/sw_sync.c:470

Use dma_fence_get_rcu() to replace dma_get_fence(), if fence reference
count is 0 then do like timeline fence release things: remove pt link
and erase pt node.

Fixes: e531fdb5cd5e ("dma-buf/sw_sync: Avoid recursive lock during fence signal")
Reported-by: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=cba1a1f459230395a076
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
v1 -> v2: use dma_fence_get_rcu() and remove link & erase pt node

 drivers/dma-buf/sw_sync.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 8df20b0218a9..261bc98b1ed6 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -221,7 +221,11 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 		if (!timeline_fence_signaled(&pt->base))
 			break;
 
-		dma_fence_get(&pt->base);
+		if (!dma_fence_get_rcu(&pt->base)) {
+			list_del_init(&pt->link);
+			rb_erase(&pt->node, &obj->pt_tree);
+			continue;
+		}
 
 		list_move_tail(&pt->link, &signalled);
 		rb_erase(&pt->node, &obj->pt_tree);
-- 
2.43.0

