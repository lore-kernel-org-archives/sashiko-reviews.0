Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794192014;
	b=RVjj0Dh0gUOgwnroFAAK1IDqFtNrR1IiNbIGZ2UVfEIiJ3b4A9GxpS3boyLkWcS4nwuY
	 r/C815Xlyw/DMYPPk/xTthJzCZlFXu6v0VZwPAZcHMSte/FBwcJ5eLdeLpklku4RDMyRX
	 +Kl6Oq5nmKljLYL0PNYb1Q0+5zNFDK7y93PdZ512Yzn47qvr6wN1H8d8xJlTazGUhRnkO
	 2mOQ/3jUkFq3gwMNo8ZtYN8AcN+YCEJYdP1UFVXmPmvGsqwNRXrGeZu5Spr3W6eWfkk5M
	 1CDfO0HPMrnsYoadIjXji//ji32GmzkSsnIIz6uPlIoPIbB+K2Q84SZIo/xRcaZKxWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794192014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=peXMP+Uqox2irv+KGdOujRvJkcrEJhKJFHot5k4NW5g=;
	b=Dztjix+vtqVggKH+RWJD+Ps5jWFKXrz8SyuUm0WWZrT482OtnXPvRJlVNDv2cQ6moF9h
	 0FX2co3AJWuEW6BXdIWLB6k5vTqaK/jwKDyFKumGCWC4XqeoXl10ahF+dmjiyAAuXkD44
	 86lcuSmpjmz8CV6/yakwg9wsbWqgD7/IqkUuLu0QCH9npClcbdwzXAq8GEngVyNFDvN2u
	 FXOryjwDZpe6+yr3Iv/KliMTZjhnr0efPaSczGvSzEHkHL4mMHFN8mrDGYw349PQYkUw6
	 S6IZNvomzKzYORVEquEORJndc0S0SIB23PSJNW39qPeYfPvHZy/y46xTGvqnQGX4/JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcjJkpVg;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D518E606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 02:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D518E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DcjJkpVg
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd63b18598dso47220a12.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 08 Nov 2026 18:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794192013; x=1794796813; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peXMP+Uqox2irv+KGdOujRvJkcrEJhKJFHot5k4NW5g=;
        b=DcjJkpVgwcJYPiY+C3AKWqDrVdifaQNpKojil3s+7g7s2VkaPaIei3FRKMfiDRQjSP
         HGDSVy4zi1/rA5kkQIqdVfdcw2a0blSvTLDulOQ9GN4GXLgQnq08w0mwyr63Q+Jnwg3l
         cQCWe9rgBzuKvPtjpSfFzbxKbUfJkmRAmabQLnSXn0mzgsGbBp/YGXgXRQRg8xkcd5gS
         Cb2a8SVI7WfYm1THYu0an/rvUgUsQOm3DkZKpPK4w8julFsorG+ApzoyD5nWLmqfeIhl
         n+SFIdmCc9P0+SXEZ0vCsucBA97bAQ13xs4SwbS0HpSRHmjRHPRH/f6aKk5hGUaRBK+k
         iFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794192013; x=1794796813;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=peXMP+Uqox2irv+KGdOujRvJkcrEJhKJFHot5k4NW5g=;
        b=pLxy0mbkdc/5LIAQDbTfzN+GMHYJWwKp0QGbtAet6C3T7A2cy9RU0QUghQoLBr0ZhO
         dSQPNe9HsVWFv2vpzrJW/GWcBp/ERIPGsNvTg9yMXZ4xOUir+UoJLFEqOJPGiWSk7m/Y
         LHNGmWT1dY71vRFb+JArj+nILOGI09tftxY9vmDJkOpzH1rewlnXHsfkNIKdaKX4af64
         9oHr2rJu7Gabjyfq+Mod1eHvstgxwEhCasulCX2L+RcBcTiZfEquxISE7aFF/WtNenVc
         X6/tqia0IKQe+eniBZEGJouj0XE/Ew3JzeCWeggSosl6pP0mpoYiSBpfUFcRRj6h3SKp
         2Bvw==
X-Gm-Message-State: APuU4Z8ozNE8UoOBkKFhwODMG28t0b449NAiwp6UOQHdUWkZD4qnkOC/
	786zyV20ZcI90xCjQg+oIvpVpBw1qJ0UpjAQFvir2o1g6qmIbFYWkAfBap6FTKlJsGc=
X-Gm-Gg: AYBFou3KImMchGln8p8cm2pX80vwMLejA+6+WSSJ8ENSpoQ9n0iAAWNnCl/d0DsL3T/
	RphTXLRb+60C0dRQ2SSJTSQfMOhTWfYPmg1ZtTcs0eei6HtsL4JwRUGrrB7lvITGhfseqJJgVmh
	XJXV2neb3tiFIvnx9Lv2o4eiV8LksApd4x7dBQhDcnum6bao5IOtx5ae5Il6IoNr2+7Ni4iB6lK
	aTY0IisVby3mORxrhlIIiW5eZrhtFhGl6j8JNcvTyFYXepM1+4DrBu/TorDOoDt3wL2L8FBkABb
	XzvNsWJikAHwwI85jvwDJC5kmYhEgMu67XEoXTxLPgOSEdV3uY9RqMySuMMXibpTcebpCuiXprE
	qdNhZfLBXoZ15pCmnhcPWBRHpSGyWAG44aZUIb7aisQ0n9MC7gfWuPY8UvaUxxR4aRtSORylHgO
	kewptwcZXizYK5Vg+ok1V8btuaH3jbIoyL/5UaRv+sq+fs0ZlATxtr4JIcbAlL/NBUOMfG6dCtq
	0b2oam1mgtz1/oFysAabkDTruo6PbCXjDpjMnQWxVgqs0sUytBPJhw0CwcfV3gUUh26/bgHRvlQ
	+8NwiKNlfowqIXciaJ89rUevhl/JVoO8ABLB/PPUv3EeQz2raRPXyfBFhicYjf0HfjUHAIjqNF8
	LANQ3FCRNbUrGvkNhqscrGlfzgydhP0igge+n6sU=
X-Received: by 2002:a05:6a20:4b1a:b0:3eb:65fc:1a5d with SMTP id adf61e73a8af0-3eed10650cfmr3137646637.1.1794192013021;
        Sun, 08 Nov 2026 18:40:13 -0800 (PST)
Received: from 1.0.0.127.in-addr.arpa ([139.159.170.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b646bd34c4sm808997b3a.4.2026.11.08.18.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 18:40:12 -0800 (PST)
From: Qihang <q.h.hack.winter@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: virtualization@lists.linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
 "Eugenio Perez" <eperezma@redhat.com>
Subject:
 Re: [PATCH v2] fuse: virtio-fs: stop new requests before draining queues
In-Reply-To: <sashiko-outbox-203803@kernel.org>
References: <20261108135830.29924-1-q.h.hack.winter@gmail.com>
 <sashiko-outbox-203803@kernel.org>
Date: Mon, 09 Nov 2026 10:40:09 +0800
Message-ID: <179419200903.34516.7461247025134970821@gmail.com>
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

Thanks for the review.  Both Medium findings are valid; v3 fixes them
and adds the missing Fixes tag.  The v3 patch is a separate thread.

#1 (-ENOSPC can bypass aborting)

Agreed.  virtio_fs_enqueue_req() drops fsvq->lock before returning
-ENOSPC, and virtio_fs_send_req() queues the request in a second
critical section.  Teardown can complete in between and leave the
request stranded on queued_reqs, which fuse_chan_abort() does not walk.

v3 re-checks connected/aborting in that second critical section, and in
the dispatch worker's -ENOSPC requeue path.  A request now either joins
queued_reqs before aborting is set (and is counted in in_flight), or is
rejected with -ENOTCONN and ended through end_reqs.  After aborting is
set, no request can newly enter queued_reqs or the virtqueue, except
FUSE_DESTROY.

I instrumented the window: enqueue returns -ENOSPC for a FUSE_STATFS,
send_req() waits before re-checking, and conn_destroy() sets aborting
and drains in that window.  Three runs:

  VF_INV: q=requests.0 in_flight=0 queued=0 connected=1 aborting=1
  VF_ENOSPC: rejected
  VF_ENOSPC: STATFS returned -107
  VF_INV: q=requests.0 in_flight=0 queued=0 connected=0 aborting=1
  umount rc=0

No stranded request, no warning.

#2 (dispatch worker may_block self-deadlock)

Agreed as well.  Rejecting requests earlier means a DAX release can be
ended by virtio_fs_request_dispatch_work(); its end callback issues a
synchronous removemapping request, which is rejected and needs the same
worker.

v3 offloads endings with req->args->may_block to a separate work item
that only calls fuse_request_end().  virtio_fs_request_complete()
cannot be reused: it also consumes argbuf and drops in_flight, while a
rejected request has neither.

I verified the path with a synthetic callback: a background STATFS with
may_block=true and an end callback that issues a synchronous STATFS.

  VF_DEADLOCK: queue outer
  VF_DEADLOCK: offload may_block end
  VF_DEADLOCK: outer end error=-107
  VF_DEADLOCK: inner returned -107
  VF_DEADLOCK: outer end done
  umount rc=0

The old inline fuse_request_end() would stop at "outer end error" and
wait for itself.

#3 (missing Fixes)

Added:

  Fixes: a62a8ef9d97d ("virtio-fs: add virtiofs filesystem")
  Cc: stable@vger.kernel.org

Thanks,
Qihang
