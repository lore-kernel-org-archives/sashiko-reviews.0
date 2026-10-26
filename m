Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013385;
	b=COs0GtAuZRCxt+KNv99rmOuPmXWYvTT2xFVg2jGCpEu1Dli0uiUWP0Hh/nzJgLf9NJEJ
	 xc+rbV2Vc+K351Mx+rsI8ECs7hwuVxtydUWh5i+B7aYhYNr0AKKWNWz6TA79tZkMH22Qg
	 XGDjRxj/jG1mXBieoIQbq2K82ev2qLmXOefWnATEgr8emxX78Kxrjiz9DwvnrQNw0HJhX
	 +sQMh+AVLpH8qr0974DofDMJ6mGFeezGXL/3w/XbmPprtkAln2D86ELOltqvMHAKRJa9X
	 uf8gzxBO52WOZfJ7xN8+7GC6kxb2bMz6Bio7XPoG90NNTk5S/dcJXvIvYiQu3EIWMNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013385;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=2VGv7zmyiPIxUlIlcouYXRZFICCsX750Zz0xAd41ImU=;
	b=GPT/BcL7joaH/Z+wnaCP98UN3fodbiluhwQHFERjsL4insASccM6d0BMMOYIFDN4L162
	 Acu7RckcC1h3/C69bCPCwkx3rYSFL+xlLvkE32z7O5zm+U8GSUOZo+0MaayJvhsI9oem8
	 CNyrduGDEPkW6/ekO0PteRHBVG5Lx84l+hT7PFN+lA0gAfP+FrTgBdxEt3eYLQZyF/M1e
	 43meWurJUE/QNfgv/TowpwWWLA25aUAElOSc0LULZECk4JsDT+K1wdnG9XoMkDWdXo64g
	 ate3s849zMRLqpG4vnbzi4gH6idhw6zW39TWJk/MMqg46kncvQt/jaL4vs1MZEs3QiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aafh4Fug;
	arc=none smtp.remote-ip=91.218.175.166
Received: from mta0.migadu.com (out-166.mta0.migadu.com [91.218.175.166])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14327606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 11:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14327606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=aafh4Fug
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=zVLJJ+4eoJY1aH0hLOYALGe7rdPcdHKLBR56EI3X+oA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793013383; v=1; x=1793618183;
 b=aafh4FugMImcvvyWPZMyBlQMbh8SMLbSO60Uct2X9DIf0MB9Uv2a9+/nkugfSsSMLRnLLxiU
 9+QDgjD4M4/JVxcOyUXhoQQxtBV+JC8L231DC0iDzMLb/jg3KSd7+zN0ztdLOlrNNkdv3MnHEwp
 E6+/WJ8wMFL5gVQ3bXt8Kn/Y=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id db85d47cdc3cb4c7;
	Mon, 26 Oct 2026 11:16:23 +0000
X-Mizu-Trace-ID: db85d47cdc3cb4c7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be58ad9600so10068e87.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 04:16:22 -0700 (PDT)
X-Gm-Message-State: AFq9FYLalbxDt2/JAO7oMfORwc5bbH9oa42Te5dVXVTK3jSNJZ9x38D9
	0uXNvYPTPBJbZjDRINGFuix1/zdzC8oVZtYuQLfs2WGgKEmpJYwXNJiGivCoGJXG5iBu9tuv77l
	tIjm1NbOrqzVoFiCOsIbfzZkX0C1KStDGkEHt0bV7
X-Received: by 2002:a05:6512:b8d:b0:5be:4ed3:95b0 with SMTP id
 2adb3069b0e04-5bfb79ad14emr152218e87.5.1793013381861; Mon, 26 Oct 2026
 04:16:21 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261026092802.2636798-1-fuad.tabba@linux.dev>
 <20261026092802.2636798-3-fuad.tabba@linux.dev> <sashiko-outbox-184962@kernel.org>
In-Reply-To: <sashiko-outbox-184962@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 11:15:45 +0000
X-Gmail-Original-Message-ID: <CA+EHjTw3gaWFMMHadGKU7XSBOtaOxoMCuTOrMn4BR=bKkd08-Q@mail.gmail.com>
X-Gm-Features: AclHuK8J49WG3XYVsDIVx40bSMv-4UKrGPyD-rkntWYvnS99wpXnppNBQJf0Jf8
Message-ID: <CA+EHjTw3gaWFMMHadGKU7XSBOtaOxoMCuTOrMn4BR=bKkd08-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] KVM: arm64: vgic-v3: Don't drop a pending LPI mapped
 with LPIs disabled
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 10:33:42 +0000, sashiko-bot@kernel.org wrote:
[...]
> > +++ b/arch/arm64/kvm/vgic/vgic-v3.c
> > @@ -552,7 +552,8 @@ int vgic_v3_lpi_sync_pending_status(struct kvm *kvm, struct vgic_irq *irq)
> >          irq->pending_latch = status;
> >          vgic_queue_irq_unlock(vcpu->kvm, irq, flags);
> >
> > -        if (status) {
> > +        /* Enabling LPIs resets the latch from the table: leave the bit for it */
> > +        if (status && vgic_lpis_enabled(vcpu)) {
>
> [Severity: High]
> When vgic_lpis_enabled(vcpu) is false, vgic_v3_lpi_sync_pending_status() leaves
> the pending bit set in the guest's pending table for its_sync_lpi_pending_table()
> to consume later.
[...]
> Could leaving that bit set in guest RAM cause spurious LPI delivery in the
> following cases?
>
> 1. After the guest acknowledges and deactivates the LPI, only irq->pending_latch
>    is cleared in software while the bit in guest RAM remains 1. If the guest
>    later discards and remaps the LPI while LPIs are enabled, vgic_add_lpi() ->
>    vgic_v3_lpi_sync_pending_status() will read the stale bit from guest RAM and
>    inject a spurious interrupt (or if the guest disables and re-enables LPIs,
>    its_sync_lpi_pending_table() will re-inject the already-consumed interrupt).

That's pre-existing: its_sync_lpi_pending_table() has never cleared
the bits it reads, for any LPI pending at the enable. This patch adds
LPIs mapped with LPIs disabled to that set. I'll look at clearing them
separately, outside this series.

> 2. If the guest issues an ITS CLEAR command (vgic_its_cmd_handle_clear())
>    before enabling LPIs, CLEAR only clears irq->pending_latch, and enabling
>    LPIs via its_sync_lpi_pending_table() will resurrect the cleared interrupt
>    from the bit left in guest RAM.

A redistributor with EnableLPIs clear ignores commands involving its
LPIs, so hardware also takes this LPI at the enable.

> [Severity: High]
> Can a race between vgic_v3_lpi_sync_pending_status() on one vCPU and
> vgic_mmio_write_v3r_ctlr() enabling LPIs on another vCPU cause the pending LPI
> to still be dropped?
[...]

Predates this series. Without it, the map clears the bit
unconditionally, so a later enable with PTZ clear drops the LPI,
racing or not.

Cheers,
/fuad
