Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794046197;
	b=yo/WGMeaG3hcoESYZav7MFH21RSbCnAUtLFp5VEpNqQZJZSsQGH3tn5NUFI/z+gli05o
	 XtuMqmUrdLSNhGUV8iUPglWxD6N2QT0vA/IV8SrUz5Yo3pk2ssL5z5HVnv8q5oZiDbqyj
	 aWYCJjUzuC/Q7vL7kkYMTw/q51wpS50lVCqx1aBdruVk/ruBkzFPAMtncQ3MJBQ25/BxW
	 /2FU1swJTpGWwlG6U2pPm2ArkhnWz4kl+knAo/DZ/huWFXr3+8j8H/RoSVKgnId7wM7fA
	 IFt67kDDB9ka+3PHrkRbrkfT8ewxvWTs+kwpo8kKWXA0ogGvi4oErw6YIlyPTlHiW5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794046197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nf4toMamz5HmACg2rAr+6wL9RYerDTJYC9sj2VukDXA=;
	b=Kk35PlXrNNQeG62Axk64Plc1kVC1oHSlhGDtVeylH2XDiSaspt19aAKLf1IfeUDWk7Ec
	 GXdkNCh3yOUGUGvwK9805LZoWSoJ6m4YJ0UVweqI7iv2Dgp+WXOqqGQGQ1ToJ4kz8XemT
	 py7smlkAIn7cEWd5xwSW+x4qGnCN/HH6QcDg6jVHKMnqTt/AWGJ5d+5qVVEd0JwNLWU7j
	 S6G7Ky4l3ABP6B8wPiKYLqNIbgu6i+JuAcr9i+xjq4+/hy3eprnEXCuhlNv9NXq+kY2yH
	 sHE/XQaUp02cnuD/imAIZ9F4HpZG4szqxL71v4PYujMxFMbWBihsbZNZjFlVnvleIdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VAhPqFMb;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46B1606A326
	for <sashiko-reviews@lists.linux.dev>; Sat,  7 Nov 2026 10:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E46B1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VAhPqFMb
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae1d0caaedso670473a91.2
        for <sashiko-reviews@lists.linux.dev>; Sat, 07 Nov 2026 02:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794046196; x=1794650996; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nf4toMamz5HmACg2rAr+6wL9RYerDTJYC9sj2VukDXA=;
        b=VAhPqFMbMnUMPpLhRu8PEXdlcEXLNj4ffyTzR4iOVN7zQo+d/OkEqvwCsF1o6zyt+H
         qOZs83E2zZBD8zfq5mhFmtKM9PFn4SSIapppFusclb6yuYxZQo8AoRDV/X9ejSz6CwQP
         BlDTwgq/+URIBdVkPLu7kMCnTEGwwxKjeteWUU0R+guXsnsmCMEQ4Q8tLx3ajJZD/6BA
         3hwtzr3CK/1A7ipIVCx9SSd4Y5yWZpx8cQBFS6m7YejDielOAuOmAvIYruOyUgmSw7QT
         3M4cORxKrbUgBALyH+lc1tUqLAr15CGFUjdKwdN7E8Xcdtu0+VVV3U2u5LgeJro6Yg0v
         6vQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794046196; x=1794650996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nf4toMamz5HmACg2rAr+6wL9RYerDTJYC9sj2VukDXA=;
        b=Ump+O1Kq6aAfNiE3ePelMYqMQPqnyBks37YDssitvVlR5n0gOzR9jy5y5SZBRr41ih
         gjT6JcV8JQKkMfASn5rAspgtV1B9NUlVBj5j46Xd9e/vssbxL/Gawco6OtOrshEsn/Ny
         9JYG8X92wiQ/b42c7yyMVWnm471sLePW9eJMg4f2lb73uK5CI7yM/eUZfVLkdO+L9w+o
         feP9RvqVqd2rsxxls+sdKiIPFazbPYppF+yE1SKoAYwmapXKZ/iokWsq+ZxowD5u+NSL
         fs+KYc5WdK/jZfNicJvWQevx3MUGtM+njYW6499SGyFrnLJBSU0vVZU7MPfk0fpw2xbJ
         X9pg==
X-Gm-Message-State: APuU4Z/dYZPuTvt162Gs9yQc24qzM/qqcOTAqd9Wmb2deHX6u/WsWoTg
	ijrm1HBnaKPthwCRDYWyL5qqkswRi8Ngxv7oEBv0RiEbOPjoesUo93VNb6k2wg==
X-Gm-Gg: AYBFou2Tfm7jimoHvuy+4RBbCdxJlVOQzjIrXuW2qnFMmRYIfNCr1IHIvsU37i/lFev
	v/q+V0uawWJigy7MO8ANbWiBHAEaYdB5O+M9YDkWl3/FomR34rywGuNQ52QWvrlZKE8CogT2VuD
	gGzONIk6KsDrEWbt0NKqmWokdU1tQ1GmKgFMazbY6Qipk3/A59SmMCCGzAieM1S97rVUf2gskX9
	q0ylmkqs+CMkHFpzxAD0ZlKz2/gW3cWVgArTJyjDa2NRpebSASKEZSmEwH0kPerBK5k/bm1nxra
	jrBso0qRdjCtjNz4IUi0T0kkVnzk1rjFepX2UNpvEab8MD5761jHzrDs4IPdaEPUSt4nEKL9nh8
	qiGrGuD80xTSBQQ/3Xf8yTCnXCwvp2VgyXSSS9VF0CAWafXLJqo7JFEN8wmZXAMZD3ppNX5kkxi
	DvCA7ecblt6DMtR1wShJtFRnfzps6kokG3EN112q5lGyxV32GIPs6HiiWMiMeUI7O6PXF9jxOCj
	VTh1/33elTfw1EGOCk6gNhYaUB4jhprYD4E8z7nI3Nhv9FvAO57X/IkjKFXl3cIXXz7Hg+TN+SS
	ls8jwXNqDiXCIiY2o2mGH2jjwLasjkPzAhcZ2a4f7boFkFuiz+Sz+gXTRXRoy/7fFNYq
X-Received: by 2002:a17:90b:28c4:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b0db7114f1mr4659716a91.40.1794046196073;
        Sat, 07 Nov 2026 02:09:56 -0800 (PST)
Received: from localhost.localdomain (vmi2317719.contaboserver.net. [84.247.152.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b10585df83sm2937536a91.16.2026.11.07.02.09.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 02:09:55 -0800 (PST)
From: Lian Wang <lianux.mm@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	nphamcs@gmail.com,
	baoquan.he@linux.dev,
	baohua@kernel.org,
	youngjun.park@lge.com,
	shikemeng@huawei.com,
	kasong@tencent.com,
	linjh22s@gmail.com,
	kunwu.chan@linux.dev,
	kees@kernel.org,
	gustavoars@kernel.org,
	tglx@kernel.org
Subject: Re: [RFC PATCH v3 12/18] mm/swap: bound synchronous discard during allocation
Date: Sat,  7 Nov 2026 18:08:52 +0800
Message-ID: <20261107100934.39149-1-lianux.mm@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <sashiko-outbox-188141@kernel.org>
References: <cover.1793106426.git.lianux.mm@gmail.com>	<1de96c68db9d3ac83ae485a1eddabcea1a2524a1.1793106426.git.lianux.mm@gmail.com>	<sashiko-outbox-188141@kernel.org>
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

On Wed, 28 Oct 2026 16:14:58 +0000 sashiko-bot@kernel.org wrote:

> Is it safe to call swap_discard_one_cluster() here while holding
> swapon_rwsem for reading?

The reader should not span synchronous discard I/O. A writer that closes
reader admission can turn one device's slow completion into a wait for
new allocators on other devices as well.

I have moved the order-0 discard fallback outside the allocation reader.
The fallback pins a live device under a short reader, drops the reader
before issuing one cluster's discard, then releases the device reference.
Each retry starts a fresh task-local allocation walk, without reusing a
ring pointer or cursor saved before releasing the reader for I/O.

The per-request bitmap permits at most one cluster to be processed
synchronously per swap type. Empty discard candidates do not consume that
budget. Large folios retain the pre-patch-12 retry/split policy; they do
not enter this order-0 fallback.

The generic reclaim-to-swap deadlock needs qualification: the loop
worker's PF_MEMALLOC_NOIO prevents its ordinary direct reclaim from
allocating anonymous swap backing. There is a separate conditional
inode/topology lock-order concern when loop discard and a concurrent
swapon use the same backing inode. I am not claiming a runtime
reproduction of that lock cycle.

> [Severity: Medium]
> fail prematurely when si->discard_clusters is populated during cluster
> reclaim?

Yes. With an invalid cached hint, a nonfull-cluster scan can reclaim its
last cache-only folio after the early discard check. The newly empty
cluster then enters DISCARD and cannot satisfy that allocation. The
reader-external fallback catches this case and retries allocation after
discard, while retaining the bounded work per request.

A peer can still take the freed cluster before the retry under a
one-cluster budget. The bound does not guarantee that the caller consumes
the freed cluster, and we should not turn it into an unbounded drain to
guarantee allocation success. This is distinct from missing a newly queued
cluster without using any budget.

For the paired KUnit comparison, I used identical fixture sources on v3
and the revised tree in isolated x86-64 guests, with configurations
differing only in LOCALVERSION and the expected-outcome selector. The
tests use the production allocator, swap table, accounting, locks and
discard BIO path on a private test SI; no production return value is
overridden.

For late nonfull reclaim, v3 returns -ENOMEM without caching the new folio
and leaves one empty cluster pending discard. The revised tree returns 0,
caches the new folio and leaves no pending cluster after one 4096-sector
discard (512 pages at 4 KiB per page).

In the already-queued-discard control, both trees issue one 4096-sector
BIO. At submission, lockdep records all 4096 sectors under the reader on
v3, and none under either the reader or writer on the revised tree. The
three-pending-cluster control processes one cluster and leaves two pending
on both trees. Lockdep remains enabled, with no unknown lock state.

All ten cases pass on the revised tree: four scan cases and six discard
cases. These are helper-level tests, not a swapon/swapoff syscall race,
page-table swapout, or a complete backend deadlock reproduction. They do
not provide large-folio performance results or prove the budget against
an indefinitely replenishing producer.

Separately, syscall/data smoke tests on the revised tree passed with a
single device, equal-priority devices, different-priority devices and
MADV_HUGEPAGE advice. Each phase verified 900 MiB of anonymous data twice,
with nonzero pswpin/pswpout and no OOM kills. Both equal-priority devices
were used; with different priorities the lower device remained unused.
Swapon and swapoff succeeded. This is additional correctness coverage,
not an old/new performance comparison, a concurrent swapoff-race
reproduction, or proof of specific mTHP swap orders.

Thanks for the reports.

Lian
