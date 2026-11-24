Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795524488;
	b=OGGx0l3TIMkCEnRdsaTE8xxeo7lJYqBGZMd2470dkpKJctfXspudzlndouRZWq4NbEEC
	 AQcg6HWkD3/DDz/7lD7hE+xJLr8CVR31Rt6YKizWMspVf1118pZuBBI9Rgynqe3AI6VnK
	 5HZHBhMu1sPmSi7ecooY+yFNUx1+OHK2npbPvgYJc4TG4gKlO7RTJ4V9RxmIV0DHxtV7A
	 +CkrXPre8i0jL8cptiI8bUf3QGb/z+UmSdOQCRomA+RkriR55zy4pgRa1qIYWNoSKfgJ7
	 wenaiEXEzqo9x8hbPcNm8aU/dXOFssrTc6vb/yzBdI42rPlXxc7AAt3EhV3edQbU1xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795524488;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HjxIqXJuwDIHgycP8pMxDoncP5M0KhqavR/YXAqM1LY=;
	b=5G/IkfmcRTaJ4J/GNdDb0FAvpPc9T69RPFTBkflUGIriwaFlHISrmAGUDioz4ndxBT7I
	 arWI7sYomnkVWnO0LvUytBeCJoIkXaqJHbA+M/4kKDqRlrfiLxpEqVm+Wtdvo4DT2Gbyh
	 A6qnOc+Mv+YAZhf2nO/pG9xzvFHDwacJkVD6Ly5RvQ0fNrVf4+IbgoYYC8mTsCBrTzA9c
	 nFl5gNBWzj7kiLio+a3FDxrwp0Jjbta441qMdqIvsmV9ZVt5feLOJ7E7KWgddXs5/slEk
	 po0XOPZxRNh6JWGwBKPJHdaISLcUYeY03IOsl/g7piBH3NEn+52cpjP7fncknKiqsCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pvTBkaI+;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941B606A322
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5941B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pvTBkaI+
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so34573445e9.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 04:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795524486; x=1796129286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HjxIqXJuwDIHgycP8pMxDoncP5M0KhqavR/YXAqM1LY=;
        b=pvTBkaI+xMdHRYbHNGcbNM3M8qaQ0/weRkJJgxqezX7sQRpn3cSYd2S3Wo+VbxaO/h
         cCkiSz+6WBwyEWzvrXdwCirWQboDSMYYfGgoCV44cTjcf9f0gxAh2Yv6Q63pih8OHlEH
         pHsP3sk7Nt7d4PHgz71iwQ+plPulSyIFM8CDm7EfwfcCqHoxhM5WvXH+GlPZhKzYbh77
         SQSg8/X8UiP4gu7PKnPQUHWzyf2B475lYpWvRdokwD8yJ3vlWdrX96iaazgRdwZC20QO
         tFtNeSXhhqWlBGcZkQRCpVZFJjMy1eEQu0wD5CZ87TTWhOspRwQkzKfAb/fONxKlx8PK
         GCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795524487; x=1796129287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HjxIqXJuwDIHgycP8pMxDoncP5M0KhqavR/YXAqM1LY=;
        b=ITG4pdIafYyBJouJES8VB9Mhtos2rUHZgCWKfw2lIrEqCvIBmL6p3Bw5U1+iumD0Ph
         iPGGFcxIiEKhvzMxvF1oTg/++vxEgox94edQtfTuOmNyQ8+3wyj/juJnW8LJN0zegRZn
         s/1CxgkYh5tiFyCy8GAG76emCfepBUDRxotfJn8aAkzcolEwUBdx4sHD39tTNh3mAcwK
         J1FdXdziMTFJ43ICeoZghS1kLGikHbYZVw+cJ3JPpBi6fzjVXowaS45IM7veQh1KjuYf
         Srr1IFq7MLaxkmejyYj8F+WuUifPfeqsOetEQVWg6DMXbIB++vaS/S0WCJF4cJMADzS1
         qpvQ==
X-Forwarded-Encrypted: i=1; AL+hErFxcZVKi6l0zNTyUhf+L8BOAm1SQDOfAsjNlzyb6TolmCPOsUiQmCCvH2911kNDSomwFtk/QZADQzzPD1jNmnU=@lists.linux.dev
X-Gm-Message-State: APuU4Z9GgxB++IEOP6a5rQ0F2tx4Fy4HyGIN58IB12vdS9SgEHmyOnzd
	ZI/XgehNqyi924FjowvzeHQpQf+9z1XQ5ya+42mFZs5JxAAi+mqGaize
X-Gm-Gg: AZFdTZcsN0/VbIS7oomgDvnOZPS6AR2oAqqPM1P9QT/zGhnF2P0jqUQW8cNt/ei4M+F
	zUQZfsP/t60fslzb/Bvk3ICLgk0JMPLAFaJpZy3jh2znEaiLpp+TGe3VNuH9AaMcHK/wc9u0gnw
	261i7e/Pw9JZ58OG7SY+GLB5S69+UxrSpCMpojk4Lh5+R34QsaCsKqsG8SU0OsxvY3zGAeB78HD
	MTERBEvbYo1+jP2jt0XsQ+Zj+elYW7vPKXtIwp1vysTuXM59MDc7sTT/iFiobg8F10wiJfoKNls
	fObHBcWore56Rsdvv4wVQ/+uP+b/VOPnGYEYU5KD/zWCKX5iRqoJIP2zs95taSzBDG/5r/UvYvE
	0xgEEBOk+AfRQS+ykULMf9o6m3r0DdIDF8xa0lqyPQB+/zXbe8Q78IYu+2rgIdAnvvv5M4SpNLK
	yUH9ZLRryGrqY7A7tMWsjtXLftBKDtE8uc5LQi7qPJRFKXHPeuyZF3ba1hogwHV8kFlELKSV7by
	TLF2tFki8XqUfRf7Zma/O8qJwv14rN81vh87XadfPdqcAc+LfU5z1VwsXmwjhX5aCaRB2FgI8yH
	DW31OzIR6q6iJB70TyJFjx/jrix0U4FsbJFGPk2H
X-Received: by 2002:a05:600c:64c7:b0:4bb:872a:f500 with SMTP id 5b1f17b1804b1-4bb887c2697mr314184245e9.3.1795524486402;
        Tue, 24 Nov 2026 04:48:06 -0800 (PST)
Received: from localhost.localdomain ([91.223.207.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90655f5asm251567345e9.1.2026.11.24.04.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 04:48:05 -0800 (PST)
From: Benjamin Saiz <benj.saiz@gmail.com>
To: linux-scsi@vger.kernel.org
Cc: mkp@kernel.org,
	James.Bottomley@HansenPartnership.com,
	Sagar.Biradar@microchip.com,
	bvanassche@acm.org,
	thenzl@redhat.com,
	aacraid@microsemi.com,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC] scsi: aacraid: free aborted management FIBs on late completion
Date: Tue, 24 Nov 2026 12:47:58 +0000
Message-Id: <20261124124758.3485-1-benj.saiz@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <sashiko-outbox-231035@kernel.org>
References: <sashiko-outbox-231035@kernel.org>
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

Thanks for the review. Both findings are correct, so please do not
apply this RFC as is.

Before a v2, I would like to agree on the direction, because the fix
touches the ownership of abandoned FIBs in several callers and I can
only test one of them. The question is at the end; the findings
behind it come first.

I had the RFC and the surrounding code reviewed again, and checked
each item below against the v7.4-rc4 sources (file:line refer to
drivers/scsi/aacraid/ in v7.4-rc4).

Made worse by the RFC on controllers handled by aac_intr_normal()
(a second free, or a write to a FIB the interrupt handler may already
have freed and handed out again):

 1. aac_hba_send(): done = 2 is written outside event_lock
    (commsup.c:761-762), and done is never reset before delivery
    (only aac_fib_send() does it, commsup.c:561). This is the pattern
    commit cacb6dc3d7fe ("[SCSI] aacraid: fix File System going into
    read-only mode") removed from aac_fib_send(); commit 423400e64d37
    ("scsi: aacraid: Include HBA direct interface") reintroduced it.
    Dan Carpenter flagged this block in 2017:
    https://lore.kernel.org/all/20170213184101.GA4762@mwanda/
    Without the RFC, a stale done == 1 already leaks the FIB when the
    reply arrives before the unlocked write, as the review notes.

 2. aac_send_safw_bmic_cmd(): completes and frees the FIB
    unconditionally after -ERESTARTSYS (aachba.c:1736-1753). This was
    harmless while done == 2 turned both calls into no-ops. Commit
    8fb391827f57 ("scsi: aacraid: Create bmic submission function
    from bmic identify") added the -ERESTARTSYS to -ERESTART
    conversion, and commit 5480aa18375e ("scsi: aacraid: Change phy
    luns function to use common bmic function") dropped the
    -ERESTARTSYS check its old caller had.

 3. ioctl_send_fib() with a replaced hw_fib (size > max_fib_size):
    on -ERESTARTSYS the cleanup frees the coherent buffer and restores
    hw_fib_va/hw_fib_pa (commctrl.c:80-102 and 146-155). With the RFC
    that FIB may already be back on the free list.

 4. aac_get_adapter_info(): if both DMA mask settings fail, rcode =
    -ENOMEM overwrites the -ERESTARTSYS of GetBusInfo before the final
    cleanup, which then frees the FIB (aachba.c:2238-2248, 2306-2312).
    This needs both dma_set_mask() calls to fail, so it is unlikely.

Controllers whose replies go through aac_response_normal() (rx.c,
sa.c) already free abandoned FIBs unconditionally today
(dpcsup.c:126-132), so items 3 and 4 already apply there.

Pre-existing, independent of the RFC:

 5. fibptr->event_wait is initialised once (commsup.c:169) and never
    re-initialised. If the reply posts complete() while the waiter is
    leaving on a signal (done already 1), that completion is never
    consumed and may wake the next user of the FIB early. The same
    applies to the polled and sync_mode paths.

 6. Block layer tagged FIBs reach aac_fib_free() on error paths (for
    example aachba.c:2490-2507, 2598-2599, 2686-2687, and
    dpcsup.c:346-349), so the management free list does not only hold
    the 8 pool FIBs. My changelog was wrong on that point, and also
    in saying that cacb6dc3d7fe introduced done = 2: it moved the
    abort marking under event_lock.

 7. Buffers released while the controller may still use them: the
    BMIC buffer (dma_unmap_single(), aachba.c:1749, then freed by the
    callers), the wellness buffer (dma_free_coherent() right after
    the send, commsup.c:2207), and the replaced ioctl hw_fib (item 3).
    Raw SRB instead strands its SG buffers and leaves its DMA mappings
    unmapped (bugzilla 220504).

 8. Polled sends (wait < 0) that time out or see the adapter offline
    (commsup.c:640-662), and sync_mode on a signal
    (commsup.c:604-610), return after delivery without marking the
    FIB as abandoned, and their callers free it.

I see two directions:

 (a) An explicit, scoped ownership handover, for controllers handled
     by aac_intr_normal(). ioctl_send_fib(), on its plain path only
     (no replaced hw_fib), marks the FIB before delivery as handed
     over on abort, in a dedicated field rather than in fib->flags,
     which is updated outside the lock. aac_fib_alloc() clears the
     mark, and so does aac_fib_alloc_tag(), since tagged FIBs reach
     the free list (item 6). On a late reply, aac_intr_normal()
     decides under event_lock whether done == 2 and the FIB is
     marked, then completes and frees it once. The completion is
     re-initialised before each synchronous send. This fixes the leak
     I observed (plain FSACTL_SEND_FIB on a Series 6). Every other
     path keeps its current behaviour on these controllers: it leaks
     an abandoned FIB but never frees it twice. A FIB whose reply
     never arrives stays lost until an adapter reset, as today.

 (b) A series that first fixes each path above (aac_hba_send()
     locking and done reset; ownership in BMIC, GetBusInfo and the
     replaced ioctl hw_fib; buffer lifetime; items 5 and 8), then
     frees abandoned FIBs for every caller, in aac_intr_normal() as
     aac_response_normal() already does.

For reference, the Microchip out-of-tree driver 1.2.1-60001 frees the
FIB in both done == 2 branches of aac_intr_normal() and only returns
pool FIBs to the free list. It marks done = 2 under the lock when a
polled send times out. But it keeps the same aac_hba_send() and BMIC
patterns as mainline, and an unlocked done = 2 in aac_fib_send() too.

Testing: my only affected controller is an Adaptec 6805 in production.
I can observe the driver there with kprobes, but I cannot load a
modified driver on it. I have no hardware for the native HBA or SA
firmware paths.

Which direction would you accept? Sagar, could Microchip test the
native HBA and SA paths on Series 7/8 hardware if we go for (b)?

Unless someone prefers (b), I plan to send (a) as v2 in a week or
two, with the remaining items listed in the cover letter.

This analysis was done with the help of AI coding assistants (Claude,
and Codex for an independent review). I checked each item against the
v7.4-rc4 sources.

Benjamin
