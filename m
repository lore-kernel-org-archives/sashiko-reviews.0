Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795322266;
	b=kITrg76LnjFXBHZ5UDyt19ch5MoFigcIwmhSnNgHjvJeMjimp9PpyY9jqKcrbrilevdk
	 +nKXuoePPXb0hx8D2FFFS/FdBF1XBWfnyh2mlI6ZiT9QWcdEPfEjViRnTtZqkj5ntGfhj
	 8kQ7ZkemO/D/Sk0deJ1h+jxrI5kYLOzR0NGu8qzAdzJD5s4gdJAOEtTkEG1NXyTp+8Yb/
	 10XXS4S0MtWB7uO36I0wp875PlCQ4S2rOTFx4QoXJdERj6/jey6Ytsjh8LjMbmPxzRl00
	 3nq+FMCRVm+jlVAn7xgS/Q6sEDzyRs8imiiMdoeK9vV6ZMwugA9177nOjeWfH0LJvLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795322266;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:X-Scanned-By:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=uT1GKmOpOEmDr3TcXo7O2Gx87y3WQ7fIKW+zuqBtBT8=;
	b=R1KbEE48RHmm/A+GJHkVxT8VKGns4laIykgk4YYQiCrXK44KrkZkQYG+dV++wWSrZbm2
	 AvBWgDFeLD4snmlnv6sfLlv7xGlxCGI9KhB1EMXzkv9buV/cQYWKiTF6SWnsSEM193WmK
	 0a1KUBT8/1PoSseDsdndkGwvaEGLoRMcpQ7Kfs5puli8s0xhHXtcLu/6h2rOuvZIyziNJ
	 kWvfIya3n3GcopcoxY20ncs2ovJe9vRwAU9vj16F/y/DR5p/31oZi+LVnwYerP31UZIbO
	 ziCGgKjmVQoUtUgxHBaODr4KvW2ad7d42b8TI6W+ronFCZYz5WWTvA3fqA2mhHCVGDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i13JYMdD;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F3B606A320
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 04:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30F3B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=i13JYMdD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795322265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uT1GKmOpOEmDr3TcXo7O2Gx87y3WQ7fIKW+zuqBtBT8=;
	b=i13JYMdDihQEejfHaQGulFg9dKhyqyceVDD5JNexrsgZuH0I0Z+BPQgtdVMoyOwLhkTT/I
	uVwwnlUFmPR8pGGuxqQju7r3R6v51h78nK3wKWYgRIUft+oik7Rhy1rAtnHopxN+GrumnU
	tlR4lyqBQsgLp9zdJLvRzv6buEpLhoQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-411-1cwIQmz0N7axuHD_9XaDGg-1; Sun,
 22 Nov 2026 04:37:41 +0000
X-MC-Unique: 1cwIQmz0N7axuHD_9XaDGg-1
X-Mimecast-MFC-AGG-ID: 1cwIQmz0N7axuHD_9XaDGg_1795322260
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D56D518004F6;
	Sun, 22 Nov 2026 04:37:39 +0000 (UTC)
Received: from snishika-thinkpadp16vgen1.tokyo.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B48330000E3;
	Sun, 22 Nov 2026 04:37:35 +0000 (UTC)
From: Seiji Nishikawa <snishika@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Hannes Reinecke <hare@suse.de>,
	Chris Leech <cleech@redhat.com>,
	Seiji Nishikawa <snishika@redhat.com>
Subject: Re: [RFC PATCH 1/2] nvme-tcp: remove the direct send path
Date: Sun, 22 Nov 2026 13:37:32 +0900
Message-ID: <20261122043732.2002424-1-snishika@redhat.com>
In-Reply-To: <sashiko-outbox-227628@kernel.org>
References: <sashiko-outbox-227628@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: J2-b4mwJ-V-fBV7zXQPIyp1ixp7hHi7_7hQF0YNBdYA_1795322260
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

On Sun, Nov 22, 2026 at 10:49 AM <sashiko-bot@kernel.org> wrote:
> [Severity: Medium]
> Does removing the inline send from nvme_tcp_queue_request() break polled
> I/O on HCTX_TYPE_POLL queues?
[ ... ]
> For SCHED_NORMAL tasks on queue->io_cpu, waking
> the WQ_HIGHPRI worker sets TIF_NEED_RESCHED, causing blk_hctx_poll() and
> io_iopoll_check() to abort polling on need_resched() or forcing two
> context switches per polled I/O.

This is right. I ran the test with poll queues on the same two machines.
The host connects with --nr-poll-queues=4, and fio runs with io_uring and
--hipri, 4k random I/O at queue depth 1, on the io_cpu of a poll queue.
Average of 3 runs of 60 seconds, latency in usec, ctx is the number of
context switches of fio in one run:

                     IOPS   slat    clat     lat      ctx
randread   base      5017   4.72  193.95  198.67      553
           patched   4179   9.35  229.70  239.05  251,318
randwrite  base      3619   5.60  269.94  275.54      542
           patched   3621  10.62  264.53  275.16  217,806

For randread, lat goes up by 40 usec (20%) and IOPS goes down by 17%.
ctx shows why. Without the direct send path, fio is switched out for the
io_work kworker once per I/O. With it, fio stays on the CPU and keeps
polling. randwrite shows no difference.

So removing the direct send path costs about 20% for polled reads at
queue depth 1 on this setup. One way to avoid this is to keep the direct
send path only for poll queues. Poll queues then still have 2 senders,
so send_mutex stays and patch 2 goes away.

I will send a v2 that does this, unless the list prefers to remove the
direct send path for all queues and take this cost.

Thanks,
Seiji

