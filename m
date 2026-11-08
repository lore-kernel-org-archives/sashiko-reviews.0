Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146962;
	b=IiT/VShQ3o8fDkdRGgdgOh5+Pgex9zdFrHKc1DJMxhf0aMuOPDGqYT+KdoIaQ0O7L7su
	 NPHxEcV19IIxQO2CtDfNCJwhZqC5WZOrqQonLUZWJvdPmpTx5D9kHYduh6UmI5WuzImbT
	 qX7gNEYXtFGJ6vZoGmoaLT6K0uQnbQfjtc/uxYDQFunK4v9IaH2kauAG6OsxmTHiocSap
	 BaOX46qmkzDfD9EfseEtWA+zJMUqZlSLuefK+S73UXJ0f4CJxrzIZSWsqg8jny6zQzgV8
	 lT7H5tbbdDlG+12OnA+GwxEQtJtpppUo54SVs4VyC25jdu06RmyzCE/qjSSVWj3YIIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=RC3g93Ua+9GSZsKYs8/u9wdNLwZ2Tw8mjMfWg5dLdcM=;
	b=xDJMl0eRx5/9IOHA4OzR0eGzu2xMkWPHQ4t8EE0C9GUfVff1Hb4mPBHT1V7VSMbnUndl
	 6p7StXNAduwq7Tten72aTOosryqe9o4mu8PK+Tru0CZVVAf2np8ZxIi1rs+V2lWunm2D9
	 ID/4bUaMsuc7EGtfOwPQF0ZQWeKJxKPRsHSDLRtQymCMQCC2HqgThAP0Rn0nve1Kzqxs9
	 ENQNlt6gjZXbLXEbD4xzJlmFGLGYBB0RI7T4BzY9iN8moTDeivCaRh7VhSxouNFg6lKcA
	 po4oJiWMhMGprQ8LU8RqIn1SMJExf1UgabMDekpzULkkXRynPOXlwZezg4ImehFUaUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xx/rCGYc";
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489CA606A32A
	for <sashiko-reviews@lists.linux.dev>; Sun,  8 Nov 2026 14:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 489CA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xx/rCGYc
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b77e464208so8884b3a.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 06:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794146961; x=1794751761; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RC3g93Ua+9GSZsKYs8/u9wdNLwZ2Tw8mjMfWg5dLdcM=;
        b=xx/rCGYcu62nF584QzWFV+XBUdN5nUWKj8x6dz4io6mghm27EUjSCKaI+b094nvQa7
         DHuVzeNkg33e3p3IxCTCoSeiEGoOdH+TNl/uC8tOtz2WhRihpaSODJt+gizp3lvNEnPo
         63j07P1cgM+6S/kRSW09NQoxBvJyQXQ5gPRQmmLEU1N2X4LO3uTxLsD66XL6gSf+eg2w
         iLFPY2O03hOdFtErMae8Q+O2OVAgZYd88nTXhT9+gRZrO/+K4Rwnwn5ZgQcZoeUjslm9
         nfKo9mIl+uDNsUUsP2LCj+lLXaLzmvCe8qcjc5UUBOR8WwWAbrsvPGC/rJWyuPgULq+g
         uI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794146961; x=1794751761;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RC3g93Ua+9GSZsKYs8/u9wdNLwZ2Tw8mjMfWg5dLdcM=;
        b=EIcmnFF9c47gC7+GqMYKNQ5p2mN5mNwtn0+ntCxo9fXgTVQGMUli4KSz7E8T/qeKvS
         GlwylLLk4beXpEoFc9uXNSbEOspPQlbEGzd2ir7IhgvLhVNSBEp5mxmiLFCg8yGGgvlx
         OEIViqNLg4VLz3NqZXvUr39v4Fp37ee/bl7jhZS+srjyrK3hytSLy0PIJx7grqn9FEJF
         acBKGYoWilyIK5q/xxTHfBJ75i9+fa6rYdpv11eyB6gS3aI++nnvb7uu7rByDRq4xKzg
         uwjUkK/2ICBwf9nLkyXsm1SHOg9rwzI/Gy4Q0tUNxfe3pCvUUYmFirtd5nWQW/g/sMGt
         JBSA==
X-Gm-Message-State: APuU4Z8RvPE88DNTkGdcIaYVPP1LHvnH3l7vJNwxyu5IuSjGWi7sZYD/
	dzomkI2iIczrCBmd5yFTw64WM3LjCHdslLuhubrljdC7M73Fl5Gu2cMtS/OOR2REuzJRqw==
X-Gm-Gg: AYBFou2lxQQzxninlsJa5Y4u7HEGbb7zWYXeKq7pkmxK1p3Xz3UzPu7gTHdNGsaGMUV
	MmvCwPK9CHEbefOZ5O9fU/OeE1hNUEAxmPubIaQ0F18jN5c+CoW/VV/VUCyqBxBhzxV3kKlORHZ
	ySYOEnX0RyK6b67unO48HU+oUKlBf3N4KiRJdJ+ScVY+NSteTk3wJeEgMhmL8w5IXU8EPoW4uZy
	cM+TVKDb8LJbB0gV9Q8/LMcXIFRTUSFFoGur6ivij3eSgipFY3j3GntUZt008Zw4Pz+Td9VTv4i
	qCjd5PL72FY6t8ZPWc1qVURtq7ibDZr9KErn/e45564a7C7+N+wc9Ut2yjde7W2b2e6Ko2lRVQ9
	TrnlOsQfhMTdxiNi195bqkHYqUSVhps+TEJoPQxyeBFalq6P8rSETucHipBW07sW5bXWPdBFQOK
	nOFYbWfu7go1MxORy7NE5Sa7VUHZPVu9mM7kWRYWHm7Ouzcs/j9ZGpms1/z44RNEgRDWwD8BrCa
	LJzh8n/mVjmO599qDhzbXWAoTLfaHtNciYAFtDTcv2S1+toEgp0x94lYnfCA6Fhr0Don+lRDZBl
	2IAhCYQ2xQAluiGFsFCHO4ap2xodcfLe71VJjODRD1vjfHwe2njYP+eiis7y+f1MV7O1THdj9UA
	NKfzEu6poCu9MCTkHGKrqQqRB
X-Received: by 2002:a17:90b:1c8f:b0:3ab:be66:ddc5 with SMTP id 98e67ed59e1d1-3b12d4cfcdamr2132665a91.6.1794146961392;
        Sun, 08 Nov 2026 06:09:21 -0800 (PST)
Received: from fayedeMacBook-Air.local ([14.150.132.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm6954683a91.0.2026.11.08.06.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:09:21 -0800 (PST)
From: Qihang <q.h.hack.winter@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: virtualization@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
 "Eugenio Perez" <eperezma@redhat.com>
Subject:
 Re: [PATCH] fuse: virtio-fs: don't process completions of aborted requests
In-Reply-To: <20261020135350.7751-1-q.h.hack.winter@gmail.com>
References: <20261020135350.7751-1-q.h.hack.winter@gmail.com>
Date: Sun, 08 Nov 2026 22:08:45 +0800
Message-ID: <179414692575.30170.3327784588587339913@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi Sashiko,

Thanks for the review.  I did not extend that patch: tagging
completions was the wrong layer, and it introduced the sticky-state
problem you found in #2.  I replaced it with a v2 patch, which
prevents the request from becoming device-visible in the first place:

  [PATCH v2] fuse: virtio-fs: stop new requests before draining queues

One new per-vq flag, fsvq->aborting, is set by
virtio_fs_stop_new_requests() before the first drain in
virtio_fs_conn_destroy().  It is set per queue, not with a global
barrier, and that is enough: each queue is drained after its own flag
is set, and for a request that reaches the device, admission,
virtqueue_add_sgs() and the in_flight increment happen under the same
fsvq->lock.  During teardown a request therefore has only two
possible states:

  1. it observes aborting under fsvq->lock and is rejected with
     -ENOTCONN before virtqueue_add_sgs(); or
  2. it passes admission, is added to the virtqueue and is covered by
     in_flight - either incremented under the same lock on first
     submission, or already counted when it was queued - so the
     drain waits for it.

There is no state observable by the drain in which the request is
device-visible but not accounted for by in_flight.

FUSE_DESTROY is the one request intentionally submitted after the
first drain: it is the teardown request itself, issued with
args.force, and fuse_simple_request() waits for its completion before
fuse_chan_abort() is called, so its lifetime cannot overlap the
abort.

#1 (post-drain request -> DMA UAF; Sashiko's "in-flight at abort")

I agree the normal entry points cannot reach fuse_chan_abort() with an
in-flight request: virtio-fs has no userspace /dev/fuse fd, disables
fusectl (no_control), and sets no_force_umount.  The only path is
fuse_conn_destroy(), preceded by a drain.

That drain only covers requests counted when it starts.  A request
submitted after it returns is added to the virtqueue and counted, and
is then freed by fuse_chan_abort() while the device still owns the
descriptors:

  CPU0 (umount)                    CPU1
  drain returns (in_flight == 0)
                                   enqueue_req()
                                     virtqueue_add_sgs()
                                     inc_in_flight_req() -> 1
  fuse_conn_destroy()
    fuse_send_destroy()
    fuse_chan_abort()
      ends and frees the request
                                   device still DMA-writes into the
                                   freed request and argbuf

This is the reachable variant of #1, and what the patch closes.
Unpatched, I could land the post-drain submission in the virtqueue
and get a KASAN slab-use-after-free in
virtio_fs_requests_done_work(), with umount hanging afterwards;
patched, the same submission returns -ENOTCONN and umount completes.
(Full dmesg is in the reproducer.)

#2 (aborted never cleared, second mount's FUSE_INIT dropped)

The v2 patch has no aborted/completion-suppression state.  aborting is
reinitialized by virtio_fs_start_all_queues() on every mount, so it
cannot leak into a subsequent mount.  I verified mount/read/umount
across repeated remounts; FUSE_INIT completed normally.

#3 (queued_reqs not handled by abort/drain)

Requests on the dispatch queue are already accounted for by
in_flight, so the drain covers them even though they have not reached
the virtqueue.  If the dispatch worker retries after teardown starts,
aborting makes virtio_fs_enqueue_req() return -ENOTCONN before
virtqueue_add_sgs(); the retry passes in_flight=true, so it is not
counted twice, and flush_work(dispatch_work) then waits for the
worker to finish.

Measured with a forced -ENOSPC so the request really takes the queued
path:

  in_flight seen=1 after 2 ms
  VF_INV: q=requests.0 in_flight=0 queued=0 connected=1 aborting=1
  injected STATFS returned -107
  VF_INV: q=requests.0 in_flight=0 queued=0 connected=0 aborting=1

#4 (argbuf leak on aborted requests)

There is no skipped completion, so there is no new argbuf owner.
Rejected requests free argbuf in the existing error path of
virtio_fs_enqueue_req(), the same way the !connected path does, and
the stock abort path is untouched.

I also checked the two teardown interactions.  remove() only narrows
admission: connected=false is set under fsvq->lock before the
virtqueues are torn down, and enqueue_req() checks connected before
dereferencing fsvq->vq, so it cannot race into a cleaned-up
virtqueue.  For a new mount, sget_fc() keeps finding the extant
superblock until SB_DEAD is set, and SB_DEAD is set after kill_sb()
returns; conn_destroy() runs inside kill_sb(), so start_all_queues()
cannot clear aborting during teardown.  Both were confirmed by
running umount against unbind and against a concurrent mount.

Tested with KASAN, prove-locking, DEBUG_LIST, DEBUG_SPINLOCK and
DEBUG_MUTEXES: 23 mount/umount cycles with read/write load, the A/B
above, and the queued/remove/mount window tests; no WARN or KASAN
reports.  The tests used one normal request queue plus the
high-priority queue (nvqs=2); the multi-queue loop is the same
per-queue code but was not exercised.  The test kernels are
instrumented (injected STATFS, widened teardown window), so their
timings only show ordering.  A FUSE_DESTROY that is never answered
still blocks umount; that is pre-existing.

v2 also words the /dev/fuse point precisely: virtio-fs exposes no
userspace fd at all, and no_control disables fusectl.

Thanks,
Qihang
