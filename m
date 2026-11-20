Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795192794;
	b=ZuJjPdVnsKIActAPv7LTcB/kaPSzLwQaJgquGIE/QRNo76AEc4MiOGKH792qimMwExde
	 b24G3h9FZH6Bym6E8wHiNbw2tu3R+Gm22xwNbKMQOF0LkmRyHOSMcJqJe0emB3qRljZcB
	 Cv1C21vPfIHMv0dMXhEGfvP1iwEnBj8eR/X7Wa3CG5vwhM/2yBeeCo1MrrgrZMO2htW+7
	 WzyOEFiYi71qYKAMWfKzCXNGkzA/KIVeVtDBIc6eKXOoCvZTUlwo1y+5cpdUUOnI8Cn4U
	 FvVZr/qKBuo3tXAwhpIiRNTKXDm4eB0M8jOibmc1O7h/P1k5Ze/+O+8PzJLKYmju/IA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795192794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=X7CKRTq2Up5l+f6XzAeKjlVv2VDwIKbHcnq42YBLBPQ=;
	b=jbaYnwav9gqTr+0xPRMv1HvwTDqh7Mjwb5oYe75MrQ+WDAY/wf/WcrCV6fUbnSfI0U/h
	 2KLIRT3usXUr3GmIuWkk+3jqm3rLDH8qAPMC+GWpAHDd1fX3uxjkbCUyNVO5whj6VSsXj
	 y6vAUuqOFq/IErrkVBr5MvwH1RLULOm6NqWdzj6pZA1f7t3QMmAzyrEXQMfSPtAjO+675
	 QtUAWKgXJEyhCEpkda/t5E4gDDyqnz/HUuHKISGHLiKN4k7aMzVasSqv5ogOryIR81j9i
	 mcVCIQRAFWit17T7hZnIfU3R1sHS5XA+55/u4SU7bIx2vnbVKI9LdTZmGs59/lulQYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iR3YdqU1;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C56E606A332
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 16:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C56E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iR3YdqU1
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f042a34db4so4997735ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 08:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795192794; x=1795797594; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X7CKRTq2Up5l+f6XzAeKjlVv2VDwIKbHcnq42YBLBPQ=;
        b=iR3YdqU1lJzV3HfiQIrMykvagVac+IZKMP9RfAr3bkWgWPnQlN13R3aP5aJph+ZfSl
         KBhrPR8OhVlsZVoOpmcNqYxabLbi69v2DdG4cCoMbml4dJntNhMuSRNn+WSUuT9expFH
         CYLQVaqUmkJ/QLOmTGarpt+Un3sv42I82AmC65R3PbeLymC1Qqzz7txL9a2VLyJzi4Jw
         LZMgqkglgwAIbNgY1qqXLB3Q4FNPUkHUHfjh2uXbfJeM5A/2+JppHlobUy7yIyjEDMP8
         8Oo+yE8J6NMLpAQfU4MIi3GTd/E+7ENBCtd+xhqapom04mISIdaBZKp0zkvlbzmZPsIo
         wMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795192794; x=1795797594;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7CKRTq2Up5l+f6XzAeKjlVv2VDwIKbHcnq42YBLBPQ=;
        b=0qvPsQhR5qKNzFQbs9pHmVqi2TFNCAvIpRGJ4Lon4EisO5vygPV2F73WTIg1iN+gcC
         g/cmLY0cXxtgusI2ImP6wfjcDm1Rgn5vDCt0YX0mY+f/AaChdBG6VbARq/EyL6s3apqy
         ZvzDiT4gq+j+cLm+qkO1LfDJOrTaY00seVIl7yUkrzVABBnpRW0U3KaNC3d9MLkGkPzy
         kjSjdTsvNCbp0VWggXvJlGeVciMgcCooU7obxhtbP6xMkvqZSUcOSyKs28cwiknXCIeG
         xWpLcsTZgkxx0PWRBmHclJvaWcb25cwQzDy/GFl3TQOe5eomG0qZUBTCkIa3V51VC1Hs
         F8oQ==
X-Forwarded-Encrypted: i=1; AL+hErHJYM8YRRVjpUBuNs/+1K6ylUWp/2IxzWAjAuIyX5FEaDVCYVeNodeNh+bUqdJcoXqk+53uPHQPCoB7pYI10L4=@lists.linux.dev
X-Gm-Message-State: APuU4Z+R/2e2IuWEBK9SB7S6eP3rK1HBClB9b6/ql3gKL5pXnRh4/Woh
	JQZOzdASGtbIACdRWj7X2SBDBcJTkX4v/W8LDIK1eVo2siDo+CHPYXe/OY6e8gflEvw=
X-Gm-Gg: AZFdTZd7El34PHi/Q9hMUtf1XNoLab+H2GpyDC/Mnv6GbhUoKtzbAxuhjePGtj7eJQe
	Jp7wpkL2k96WDY2ibw81l7oPR4NuIaSy7CwMOls0YzPjG8m3cE4QZTwQAOVleBv0r1voNbywaTx
	xWvUUIKmJ3G4icQoXIjpIHG5luvSqbvIcP0g2QG+aVfRIQvyyUb081nMW3WTjlLhu8oKh+dHQNt
	GcawknwH8rBfTdogsr+nnq4wmjrYGFNq1SLJbWP4XJME5NIAA+qR08Gf7aogZZnME9k3E9wi36e
	LZEV0VD70xCq/G/YfMhtEsDauB9ry72PTBL4lF+OJYa6ycnNME37UVNTmKamdJWKzhmRF/CxG/a
	5yC5PclcGA3hMROXcjaukGVMf8rIQ4uBmQlqE0Ex1UjTOU4OiY5hiazOhfMR6GsjbkHv4iAEGMI
	Mjpq0yBuLPrwzFMqYDuwxKjPF3w3qUzKWzTTEp783SHotoJvsHUtBXg/E9VLV0ia/pWRYM9NQrD
	ZVO+uhsOqvvznNZff3FkVjDipkCgXvFY/uUXoY0zfXqhaW6EIvKKELtQJGib1CAQH2YGk0+Vb4N
	GIeTxk2OsnRBG1ftI1KnHALII+JqJwYab9scDH7WPJbfr+MPG/rJi2L2d3U8GutVzEqBvW6XLFm
	u/M7r2wcudFM+SlY5jJIroiqBnIve/bJqen2S
X-Received: by 2002:a17:902:e847:b0:2ee:1c36:e25 with SMTP id d9443c01a7336-2f03f211940mr28621045ad.35.1795192793950;
        Fri, 20 Nov 2026 08:39:53 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f14a432sm16865065ad.75.2026.11.20.08.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 08:39:53 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Lee Duncan <lduncan@suse.com>,
	Chris Leech <cleech@redhat.com>,
	Mike Christie <michael.christie@oracle.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] scsi: libiscsi_tcp: hold back_lock across the copy of a Data-In
Date: Sat, 21 Nov 2026 01:39:48 +0900
Message-ID: <20261120163948.3238659-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-225445@kernel.org>
References: <20261120145243.3124991-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-225445@kernel.org>
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

On Fri, Nov 20, 2026 at 03:15:55PM +0000, sashiko-bot@kernel.org wrote:
> Should iscsi_tcp_hdr_dissect() verify that task->state ==
> ISCSI_TASK_RUNNING before accepting a Data-In header and setting
> tcp_conn->in.datain_task?
>
> iscsi_itt_to_ctask() only checks task->sc and session->age, so it also
> returns newly queued commands in ISCSI_TASK_PENDING on conn->cmdqueue.

It already does, in the series this patch follows up on: 3/4 makes
iscsi_itt_to_ctask() return NULL for ISCSI_TASK_PENDING and
ISCSI_TASK_FREE, and 4/4 adds the task->state != ISCSI_TASK_RUNNING test
to the ISCSI_OP_SCSI_DATA_IN arm of iscsi_tcp_hdr_dissect().  Against
plain mainline the PENDING case is real, but it predates this patch.

  https://lore.kernel.org/r/20261117101500.1894608-4-yhlee@isslab.korea.ac.kr
  https://lore.kernel.org/r/20261117101500.1894608-5-yhlee@isslab.korea.ac.kr

> Can dropping session->back_lock before segment->done() let
> iscsi_tcp_process_data_in() complete a newly queued command that reuses
> the freed ITT slot?
[...]
> digests are enabled, iscsi_tcp_segment_splice_digest() sets
> segment->sg = NULL before receiving the 4-byte digest, so a subsequent skb
> carrying the digest skips the if (segment->sg) check and reaches
> segment->done() after the task was already freed.

No.  iscsi_tcp_process_data_in() never touches segment->sg: it verifies
the digest and, for ISCSI_FLAG_DATA_STATUS, calls iscsi_complete_pdu(),
which takes back_lock itself and completes through __iscsi_complete_pdu()
like any other PDU; a task in ISCSI_TASK_PENDING is refused there by 3/4.
That a target can send status for an ITT whose command has been
transmitted is not new.  The digest path is the same answer: after the
splice, segment->data is the four-byte digest buffer, so the copy that
skips the test goes nowhere near the scatterlist.

> Does unlocking session->back_lock at skb_done leave segment->sg_mapped
> mapped with kmap_atomic()?
[...]
> spin_lock_bh(&session->back_lock) while inside kmap_atomic() /
> pagefault_disable() (which violates sleeping spinlock rules on
> CONFIG_PREEMPT_RT).

Not a problem, on either half.  On CONFIG_PREEMPT_RT kmap_atomic() does
migrate_disable() and pagefault_disable() rather than preempt_disable()
(include/linux/highmem-internal.h), so a spinlock_t may be taken under
it.  And a mapping of a page that has since been freed is not
dereferenced: the next skb hits the segment->sg test first, finds
datain_task gone and fails the connection before any copy, and
iscsi_sw_tcp_recv_data() tears the mapping down once tcp_read_sock()
returns.

> Does the conditional locking across copy_locked trigger a Clang
> -Wthread-safety-analysis warning when CONFIG_WARN_CONTEXT_ANALYSIS=y?

Correct, three of them, fixed in v2.  clang 23.1.6 with
CONFIG_WARN_CONTEXT_ANALYSIS=y gives one "spinlock
'conn->session->back_lock' is not held on every path through here" and
two "releasing spinlock 'conn->session->back_lock' that was not held" on
v1.  v2 moves the copy into a helper so the lock is taken and released on
one path, and the file builds clean.

  https://lore.kernel.org/all/20261120163857.3238489-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
