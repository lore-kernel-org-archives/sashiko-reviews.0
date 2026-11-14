Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794692693;
	b=tAEeAmVgcIbFRWALycU4mepOx4FgQKq6iZGTOxHYY/exllj2vhq3Ak6ZVF7xRjSaRVgz
	 Unw+DcjZEW2oNFpM6yp2PCghE7byxvhzIKqgqAu5HT8eSOW03rq9xmaVmULyAbxYIzrDc
	 ru2mwID7fZ25vDQHVlsmFhnsWpN3+yGBsFGLjoK9lCMetRHtzQHB4HLwMQICdcfl8OV5U
	 HN4yxeqBSNKbR0hmAwhebQmXDYdcyAQCw28oSxPmSCrGHsG4/pqq9IwoYjL3KqnGDAHXj
	 CRvG4sP4j3pagpfM7DXVke7mW5e1bXpbrw62Dqke5mEg87+eNjFRgQ/AH4RHKc26sYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794692693;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=v6NxdjJjQL36OTTvzD1oqqfX5SLRSErId6XzHf4YkWM=;
	b=4It4xhQ7Uj4i5iHTjt/vyzhZtllJnpZnLCRnNiBYMjPWvEzIawbbmay/mQ9eJnmQzyTP
	 uNUTj8OkZfm39Le4y/paIOjzWqT339hsbelV/QxsKnlr5kXj2DKOBZ38a03qghr6ieAko
	 9gcxgsU8fXyrnDBqMWVN3DByrad4RxT2B/26a8xD8HjxvjPlrDujsf2s49K+fE/SeE5rm
	 JsMOfTGQZVo7YJ8nfr8B4/IbaVHejhJzK3Q/myz+ClhYht4ot4REBnNXYLqiZb0TCi4aw
	 Mpih+W7Gem8+YRty8A5/plgyxPVuRqOuRID1sqEYvtQKpEVw3CcSU523gC/XyhdX1vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ao3LF58o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145DC606A323
	for <sashiko-reviews@lists.linux.dev>; Sat, 14 Nov 2026 21:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ao3LF58o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B55481F000C5;
	Sat, 14 Nov 2026 21:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794692692;
	bh=v6NxdjJjQL36OTTvzD1oqqfX5SLRSErId6XzHf4YkWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ao3LF58ovnn0pkc75f0Q6ybVOmqamTvXcQzw8Qcj8CFm44wa9tRndr0rh0dy+b2oC
	 6xa4vLb4m0QsYMg2Eqb0LcpBxhaKVx7JTDqy3bEFLpSEfFWpdYVCC0OMjQReuddaYW
	 3Kze0S8ecpOOYRak2TQzZQZDW9P3vXDL1xg2vjaddm63xYpj59t5xk2X2GDagnfD09
	 8W0EmXw8HG79Zo6+p1DTAymwUU9QFB1Aw9OJKgxW/tw/1FOYveWeWBQ5KPSR8uXxLH
	 ww0JH4CU3yPPHFirT1IIQqv29nbsb1Wi4CX0e8oAoycxC2FzP6M9iA0rxLoQnzKPIP
	 b2ThBGpq0n0fw==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: sashiko-bot@kernel.org
Cc: akpm@linux-foundation.org,
	axelrasmussen@google.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev,
	hannes@cmpxchg.org,
	hui.zhu@linux.dev,
	kasong@tencent.com,
	kunwu.chan@gmail.com,
	liam@infradead.org,
	lianux.mm@gmail.com,
	linux-mm@kvack.org,
	liuxiang.277@bytedance.com,
	lyugaofei@xiaomi.com,
	mhocko@kernel.org,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	ridong.chen@linux.dev,
	rppt@kernel.org,
	ryncsn@gmail.com,
	sashiko-reviews@lists.linux.dev,
	shakeel.butt@linux.dev,
	sidchintamaneni@gmail.com,
	surenb@google.com,
	wangzicheng@honor.com,
	weixugc@google.com,
	yuanchu@google.com,
	zhangbo56@xiaomi.com,
	zhuhui@kylinos.cn
Subject: Re: [PATCH v9 11/16] mm/mglru: Run aging when one type is drained
Date: Sun, 15 Nov 2026 05:44:38 +0800
Message-Id: <20261114214438.70148-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <sashiko-outbox-215014@kernel.org>
References: <sashiko-outbox-215014@kernel.org>
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

On Sun, Nov 15, 2026 at 4:50 AM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] mm/mglru: scan_folios() scans seq below min_seq at
>   DEF_PRIORITY

I guess reparenting could be a corner case where it's difficult to
properly preserve the cold/hot ordering.

As mentioned in my earlier reply, I discussed this with Kairui,
and we still prefer having `lruvec_populated_min_seq()` return
`max_seq` instead of `min_seq`:

https://lore.kernel.org/linux-mm/CAGsJ_4xbDy8Qy=5yqmn+59jfxPm3WOgAH7zX9gwhJyO-6fiT6A@mail.gmail.com/

But for sure I can skip the scanning in scan_folios()
if (seq < lrugen->min_seq[type]).


> - [Low] mm/mglru: missed eviction retry in try_to_shrink_lruvec() on
>   concurrent aging
> --

[...]

> When a concurrent reclaimer advances max_seq after scan_folios() finds no
> folios and before new_seq is read, do_drained_age is skipped because
> max_seq != new_seq and should_run_aging() is evaluated against the already
> incremented new_seq.  Comparing lrugen.max_seq against new_seq then sees no
> change and breaks out of try_to_shrink_lruvec() without retrying eviction
> on the newly aged generation.

I actually considered this before sending the patch. I think either
approach is fine, and comparing against `max_seq` instead of `new_seq`
would also be reasonable.

Comparing against `new_seq` still gives us a chance to retry, since
we call `try_to_inc_max_seq()` here, which may advance
`lruvec->lrugen.max_seq` beyond `new_seq`. By the time we reach this
check, `new_seq != READ_ONCE(lruvec->lrugen.max_seq)` may already
be true.

Overall, I think the following fix should address both comments:

From: "Barry Song (Xiaomi)" <baohua@kernel.org>
Date: Sun, 15 Nov 2026 10:24:32 +1300
Subject: [PATCH] Fix-mm-mglru-Run-aging-when-one-type-is-drained.patch

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
---
 mm/vmscan.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index a6c6c7c1c5e1..a5b8244d4768 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -4788,6 +4788,9 @@ static int scan_folios(unsigned long nr_to_scan, struct lruvec *lruvec,
 		seq = lrugen->max_seq;
 
 	seq = lruvec_populated_min_seq(lruvec, type, sc->reclaim_idx + 1, seq);
+	if (seq < lrugen->min_seq[type])
+		return 0;
+
 	*scanned_seq = seq;
 	gen = lru_gen_from_seq(seq);
 	max_gen = lru_gen_from_seq(max_seq);
@@ -5278,7 +5281,7 @@ static bool try_to_shrink_lruvec(struct lruvec *lruvec, struct scan_control *sc)
 
 		if (!scanned) {
 			/* Retry once if aging advanced max_seq */
-			if (retried || new_seq == READ_ONCE(lruvec->lrugen.max_seq))
+			if (retried || max_seq == READ_ONCE(lruvec->lrugen.max_seq))
 				break;
 			retried = true;
 		}
-- 
2.34.1

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261114200803.23129-1-baohua@kernel.org?part=11
