Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013286;
	b=QTkyjCBUDN2jOFTppQcNj+foizRqtn8bMBiM5VQ5YTKV6kyiI9m2y6s9/CmiKKon6PW2
	 SpqKWnUeSx5bOpeatKbuBpWQWcQOf3riV0hxL0uvjTYOBpvuGOg8uOU95BvixttDBZk9B
	 FrzFZt7s/UX7zodg9yNJBGranyfsUB2MdVURaj+Y+28nGF/dFWULg+C1GTnNgP7R00NGx
	 85ZN+tOriOMfArypHlYZpQXu16smLRB2h0Y4iFYrCW+NxEsew3uXdJtiEUO1hCC1yz1bU
	 ejX0kbE4i997xKpvPQDSulGqaBYFb+/4RfqBJuZw0ljzdLxyfepVZvRiF+IWM4sHPzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013286;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=D7xYMUq8jcHCw/udL91J2awlO7GtcxDGTY/T8x3DLkQ=;
	b=1rf17WwsxL2+ra3RV8WBkzgir8Dp9WojnF3mQ5YxqNlt2+dcwiq78JeCEf93utbQvL5e
	 z6HdEU6bl6i0qwCo12u5LsAvY5K3GUPvdhOWnR7LAvO6O7sns4YG4iq5/OY16OGbZUy55
	 b1rDOkScKT36Q/3lGeyIvoLFOXY7BQMI7ZntPRIbTkkxHj04FYqIawb1/K7zQKJroIPr7
	 39ewlWbApNn7O92KqXRPGOxHB496tJN5mSFqwsS9dH/HncT+O4QD6LvkkHYgRU9kgxpc/
	 I4CpncjUzON8bB68LwQyFdzV+0Me2vHytTp1YZxL/p/FfS3zGGvB6lel2ZwWQLYloDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=atoyCzAN;
	arc=none smtp.remote-ip=91.218.175.146
Received: from mta0.migadu.com (out-146.mta0.migadu.com [91.218.175.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803E3606F824
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 11:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 803E3606F824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=atoyCzAN
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=/kw6LIbxjBOzGprj6R15Znq++scfwHjoCNzPIlnqSgo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793013282; v=1; x=1793618082;
 b=atoyCzANM8SYlAaHNlRoxUI+0CKXBkFYIsIz17gI7+ljTyvcOPl32EHKTfUErs3JbWNFeKje
 WDRJiUgsZbePAbUixw/yRkBtxMtdUJBYUFmTbRSQL7dpTdOEeMd6+ktIOB2MZzFLi2jH61HUcEp
 0pZaJoW+7qoGNDXRkLUJAtnI=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 4275aca2c02c91d7;
	Mon, 26 Oct 2026 11:14:42 +0000
X-Mizu-Trace-ID: 4275aca2c02c91d7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4a7b9e6fso7332e87.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 04:14:38 -0700 (PDT)
X-Gm-Message-State: AFq9FYIFxQGgchnminHd0tU08FGReQJXPCKJ2TQhMMkneuYjgADcfyFC
	s/Bl4hT1dBl40Ghx+CuQFtykbVDts/44qODnx5lmVKk3NYS1ZRCJJi16tYYEiHm9CLdNwEMUpwR
	ooUhWuAmNETdxm/kISi4IMtw8XS3BpXLUxSZbYEJY
X-Received: by 2002:a05:6512:1056:b0:5bf:c3e1:532b with SMTP id
 2adb3069b0e04-5bfc3e1545fmr10691e87.5.1793013277753; Mon, 26 Oct 2026
 04:14:37 -0700 (PDT)
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
 <20261026092802.2636798-2-fuad.tabba@linux.dev> <sashiko-outbox-184898@kernel.org>
In-Reply-To: <sashiko-outbox-184898@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 11:14:01 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwG44zRA3c4UcZ3ynDsK-pqSG2LJ8Z8QCDLDLrZuQRaUg@mail.gmail.com>
X-Gm-Features: AclHuK9o2uKydOCj3eQ0PTMJbxnin7clpegfUuD7yjIGSfLi1gluUuhbM1DRizM
Message-ID: <CA+EHjTwG44zRA3c4UcZ3ynDsK-pqSG2LJ8Z8QCDLDLrZuQRaUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: vgic: Don't forward LPIs to a
 redistributor with LPIs disabled
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 10:13:14 +0000, sashiko-bot@kernel.org wrote:
[...]
> > +++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
> > @@ -293,28 +293,31 @@ static void vgic_mmio_write_v3r_ctlr(struct kvm_vcpu *vcpu,
[...]
> > +                if (ctlr == GICR_CTLR_ENABLE_LPIS) {
> > +                        vgic_flush_pending_lpis(vcpu);
>
> [Severity: Medium]
> Is kvm_pause_vcpu() sufficient to prevent vgic_prune_ap_list() from seeing
> !vgic_lpis_enabled(vcpu) and dropping pending LPIs off an ap_list without
> clearing irq->pending_latch before vgic_flush_pending_lpis() retires them?
[...]

No. A prune on a KVM_REQ_VGIC_PROCESS_UPDATE request, or on the vCPU
the LPI was retargeted away from, can drop it with its latch set. The
guest still doesn't take it with EnableLPIs clear. Taking it after a
re-enable with PTZ set is a pre-existing bug, which I'll fix in its
own patch, not in this series.

> > +++ b/arch/arm64/kvm/vgic/vgic.c
> > @@ -273,14 +273,18 @@ struct kvm_vcpu *vgic_target_oracle(struct vgic_irq *irq)
[...]
> > +                if (unlikely(vcpu && irq_is_lpi(vcpu->kvm, irq->intid) && !vgic_lpis_enabled(vcpu)))
> >                          return NULL;
>
> [Severity: Medium]
> When an MSI injection races with clearing GICR_CTLR.EnableLPIs in
> vgic_mmio_write_v3r_ctlr(), can returning NULL here leave irq->pending_latch
> stuck at true and leave a live entry in its->translation_cache?
[...]

The same latch, with the same limit and the same separate fix.

Cheers,
/fuad
