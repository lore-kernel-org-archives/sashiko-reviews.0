Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882255;
	b=H3RAC3z/Kx+Z8xqAUk/nKc9eJB+/6gWgsxbn0P2hGqETT2Q4OXudAdBxWl7Y5evN+DW5
	 QqPmTXtBt3bCKtY43HvJSrJj/mrOvkNIk9XF+1UI4aCvCP3zhiovR0UgnstC2j/CLqdqm
	 z4yhVZ8q9VoqDyJK2U43LRm7wDPSF6GMk4vbL1RZpos2dmYu6kqUTDCYvwoSRo6V/KLQ0
	 pJBCYAaMLYJ6u6x+6Qzkogjh4/FO8rpIgasjkGudKPOnGnein9JEooqAHGrDNWGpqHic2
	 wjFJ4Zhqagm7l7H3ki7kT4x3tTE/MKX76c8TJdHqe6X+BW+CxQBnaRpApsa+r2I8Vtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882255;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=K5laUMU2KJoz9qNykR8nk12tulWxuY+wCYFSFpscv3s=;
	b=349RRclM9v/INSu/Fc5SRsutwawE9Pt+rRyir49t3woXumaLMXu/nqxTSaK1R76+QkFs
	 C8Tw9KZjImbMPG6SO/2H8y3U87zDEyzNrMmd/VLhN4nCU3nmGVsh2c7PJ78+H0PDJm6hb
	 YI6XWel4CpVxZkupHAqE2y5v4HSIVDv+OG8NOZpV8VT5KYRwazznQAa4voyJgzbV/SgBN
	 l/aX5wtA5+4FvGipcWKeA+qUFyz+dfoFvH03j+UDbKuDUTLxDmiP5C1iEO/2bG6T/xjJ1
	 KSFZDt85gawztJN6oTWWX/9hzv+owlMgJOGRs+n/Fy9etIGGZCvt0iWFRwdXWAHOGTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=IgEQ3rza;
	arc=none smtp.remote-ip=61.135.153.165
Received: from smtp153-165.sina.com.cn (smtp153-165.sina.com.cn [61.135.153.165])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4880A606A328
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 12:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4880A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=IgEQ3rza
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793882250;
	bh=K5laUMU2KJoz9qNykR8nk12tulWxuY+wCYFSFpscv3s=;
	h=From:Subject:Date:Message-ID;
	b=IgEQ3rza7NNIlV1Y49IIb4iHG5zNmqwsum61siGKfCiLmleCOhrUjPBCQzRlQm1E4
	 +g1+TfEOpngSrYte+TMruWkEfnB6CwZM6sv6eDosPO34LgF3AoeU3AAwF+9/g5EvpW
	 glqvcn5vrx0U/IogsNSt1vd8RSsvK4Vpb99ikq8E=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AEC787D000079EE; Thu, 5 Nov 2026 20:37:20 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 8249174456693
X-SMAIL-UIID: A4384A86C4F04932A99FAA12BF8C2C2B-20261105-203720-1
From: Edward Adam Davis <eadavis@sina.com>
To: christian.koenig@amd.com
Cc: media-ci@linuxtv.org,
	sashiko-reviews@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	sumit.semwal@linaro.org,
	phasta@kernel.org,
	robin.clark@oss.qualcomm.com
Subject: [PATCH v2] dma-buf/sw_sync: Optimize the retrieval of fence reference counts
Date: Thu,  5 Nov 2026 20:37:13 +0800
Message-ID: <20261105123717.66572-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ad203438-ddbe-4445-bb3e-9632e738c1a5@amd.com>
References: <ad203438-ddbe-4445-bb3e-9632e738c1a5@amd.com>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, 5 Nov 2026 11:03:10 +0100, Christian König wrote:
> > There is a race condition between closing a sync file and the SW_SYNC_IOC_INC
> > operation on a sync obj. When a fence is created via SW_SYNC_IOC_CREATE_FENCE,
> > its reference count is initialized to 1. When the sync file is closed, the
> > fence's reference count drops to 0. A race occurs if SW_SYNC_IOC_INC accesses
> > the fence whose ref count has already reached 0 before dma_fence_release()
> > calls timeline_fence_release() to erase the corresponding pt_tree node from
> > the sync object, potentially hitting:
> >
> > refcount_t: addition on 0; use-after-free.
> > ------------[ cut here ]------------
> > kernel BUG at lib/refcount.c:34!
> > Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
> > Call Trace:
> >  kref_get include/linux/kref.h:45 [inline]
> >  dma_fence_get include/linux/dma-fence.h:323 [inline]
> >  sync_timeline_signal+0x6d9/0x8a0 drivers/dma-buf/sw_sync.c:224
> >  sw_sync_ioctl_inc drivers/dma-buf/sw_sync.c:405 [inline]
> >  sw_sync_ioctl+0x7b4/0x13f0 drivers/dma-buf/sw_sync.c:470
> >
> > Use dma_fence_get_rcu() to replace dma_get_fence(), if fence reference
> > count is 0 then do like timeline fence release things: remove pt link
> > and erase pt node.
> >
> > Fixes: e531fdb5cd5e ("dma-buf/sw_sync: Avoid recursive lock during fence signal")
> 
> Please completely drop that. This is not something which has any justification to be backported.
OK.
> 
> > Reported-by: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=cba1a1f459230395a076
> > Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> > ---
> > v1 -> v2: use dma_fence_get_rcu() and remove link & erase pt node
> >
> >  drivers/dma-buf/sw_sync.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
> > index 8df20b0218a9..261bc98b1ed6 100644
> > --- a/drivers/dma-buf/sw_sync.c
> > +++ b/drivers/dma-buf/sw_sync.c
> > @@ -221,7 +221,11 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
> >                 if (!timeline_fence_signaled(&pt->base))
> >                         break;
> >
> > -               dma_fence_get(&pt->base);
> > +               if (!dma_fence_get_rcu(&pt->base)) {
> 
> Well that is at least better than before but still needs a code comment explaining why this is possible without holding the RCU read side lock.
> 
> Something like /* It's possible to race with timeline_fence_release() here */.
> 
> > +                       list_del_init(&pt->link);
> > +                       rb_erase(&pt->node, &obj->pt_tree);
> 
> What happens is that you race with timeline_fence_release(), so that here is superfluous and potentially even harmful.
timeline_fence_release() and sync_timeline_signal() are synchronized using
the same spinlock(timeline obj->lock is same as fence->extern_lock), so
there is no race condition between them. Instead, a race condition exists
between sync_timeline_signal() and sync_file_release(), which causes the
fence reference count to drop to zero prematurely.

By removing the link and re-initializing it here, list_empty(&pt->link) will
evaluate to true when the spinlock is acquired within timeline_fence_release(),
preventing the redundant execution of the link-removal and node-erase operation.

BR,
Edward
