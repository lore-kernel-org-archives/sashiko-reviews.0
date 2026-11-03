Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712264;
	b=PE5ftKdLERZN4ujWl+ap+mEGeFGgcpmxM32bxSScLdUBkmcIaqAstbIGtjigsYddWx+x
	 yBuOHyev03t546/4x/vcABjzR9IyKFuThoodtgguq7R6LEMHcMfB2pUR6qSGiTgFVyR14
	 mkNIRNMOoEPf10UNYYb8Si0J2EpugwCcN9gXkZpAv3yfDI8nL6eP3WX0KUWA/7hw1vx/V
	 nrD5gHvKV+9/Il/dsL9wdTpQSOnEfZ7sQMHtNhhpG84pBHnGvCyCgGtgZA6wEoBOfTz70
	 pEPZEX/mbHLWOQi1ptj7qI9Wl4qZLSAeNHUjwMEzjDIRaYxseYFVDE0wMWij2P9hoFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712264;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Transfer-Encoding;
	bh=fGCGwjb+9HjVJgbKvPA+oIY0E0Y2IyX0PIx4wtVPsTs=;
	b=ZnFb+omSITWyQksZfkTPHg1SaF6XYlVdUuYd3K7tph9w2hRF8/egQ3zhvZ3pzziJczQ2
	 td8OG+4sl6FFo8qVPPG+iTkIU8WXxOqtmctk6dH4q+8Z36WDp84SmEp69ExmvlK3O5Oyh
	 QNnUleTDJFCJt41EAP7mtzepBroqF91wHxRf6My88FS84xj525blIy55tcepxaUx9wtMk
	 o9+n71hgm3d1jq5xnbdSz1yN96/XqDUvUAEeB+FSzVp8MRLtevX9h2ML4URmrQwJMWvz4
	 Yp5gkJuPApz+y61KsBmI1HboALg3LF2grxpBV/AP3+0KCgl0v0eAHtj1+vHWMNLAaMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WUGUrNAp;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C204F606A334
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 13:24:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C204F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WUGUrNAp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793712262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fGCGwjb+9HjVJgbKvPA+oIY0E0Y2IyX0PIx4wtVPsTs=;
	b=WUGUrNApzTtriekK5qlZoc51pzczit2p1///qd4qFNUTqNenruytjWSPzYwlTmWU66O/+h
	Fgyc9kmoRKQ+uHCzORTjc70T006d9bmecO01COx7guuyCU++by/uDNRoG6r3DMHKKhwgUl
	NEwfTaoUqVt8tPDLxGvqV5r4evhywVk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-zLkpqxBRMze7PpfsONlalA-1; Tue, 03 Nov 2026 08:24:21 -0500
X-MC-Unique: zLkpqxBRMze7PpfsONlalA-1
X-Mimecast-MFC-AGG-ID: zLkpqxBRMze7PpfsONlalA_1793712260
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48c46582442so2553682f8f.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 03 Nov 2026 05:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712260; x=1794317060;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGCGwjb+9HjVJgbKvPA+oIY0E0Y2IyX0PIx4wtVPsTs=;
        b=xSf6gWNjEGpMvcorb4viv2I7k4RZzv/xq41C44K3cMsiTNOwpGs5Rcr2GOvcpVjy+c
         Cr6SWZLc9fDU5elTvjyJ57y3KPymK/PMH0FLfjdOL1gc/cuf8jsKVxACZ6zWrgdMbiMU
         79O3dcsI3xV0Bn0LY+jY/yus+z4IQ1P4/87owlGkjeDyYXuoHLZaM9qaNa3vkB3D8Fap
         oTgHo7HgwFSZwSuRKYDYVZ0AnIvk1x+udy8TdjxpVRSxT5Vhopnj+ypW7R+h6SecRnih
         qZ+uYoVlXQ5mZ/RYT5xaYlbQugKIT3HQ8qc0H51VI6s9+NgfRnIgWwfx1/b0/8h0k+z/
         DYIA==
X-Gm-Message-State: APuU4Z/kTXumy1oNP870BGb/uny5v3HV7Ae9O+s7IMPfIQJ76aABP8TA
	IOKZh3jVBx9skjB3GarWKpWU7HVbkYWfNP1ImFl0Ct7M7zEhjRZZpZo3iNHRyow/dxF3/xthvBN
	DPxVOZsFb25VFJu8sgbcU11jao+6CF6g3q7pYiBAlJgwULg8kAcKtR4r7dq+jxtadxjwpk1YeDu
	z2dctR8FWIKACSY44na+gkoj4xgUuKQ1DFUhh1CPIlvHu13a7bW91nQYk=
X-Gm-Gg: AYBFou0W9KwyvBMTcXynHZ88W8Tu5pptppVxLNBQLg80+As+G1mgxxzPn0sSvaaTlbk
	Iunf96p8eeZuQi9H1LSIjLiwYdw2I+XqGagAAs7+1R/Mbucma2lVW7X2eFMj76aSJvhUq75t7sJ
	P/aeBvlYBJ3JmZzd0xSGDFUUoSpShzTxMaX1OEj1P2yNtcI3nYNvLK7hgK6LEFN3HRG5A32xvzl
	iF4rZ8ol0FQbkGuiHhvbadEFwwWKkT8u80CKgY5HsTAGBgft14IeDRfsnNV
X-Received: by 2002:a05:6000:468f:b0:48e:6710:ecd8 with SMTP id ffacd0b85a97d-48e6e2fcdb9mr18138796f8f.26.1793712260143;
        Tue, 03 Nov 2026 05:24:20 -0800 (PST)
X-Received: by 2002:a05:6000:468f:b0:48e:6710:ecd8 with SMTP id
 ffacd0b85a97d-48e6e2fcdb9mr18138767f8f.26.1793712259755; Tue, 03 Nov 2026
 05:24:19 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261103124930.2278671-1-pbonzini@redhat.com> <20261103124930.2278671-2-pbonzini@redhat.com>
 <sashiko-outbox-195309@kernel.org>
In-Reply-To: <sashiko-outbox-195309@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 3 Nov 2026 14:24:08 +0100
X-Gm-Features: AclHuK-7YhzMy4DVyFsS5_QDuT7fH1tC2gLQTOF_gW8Or8OMBgi9QzQJZPCSNes
Message-ID: <CABgObfa7m0Fma=u_aGc==8iYH-u3AKSRKZ=Zt0WQKR38VoScgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: register asynchronous page fault waits with
 interrupts disabled
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kHHL7550eamcgcNo8lu8_n29TknOgTRODxERryik2aA_1793712260
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 2:09=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> [Severity: High]
> Can splitting kvm_async_pf_queue_task() from kvm_async_pf_task_wait_sched=
ule()
> cause a race on vcpu->arch.apf.host_apf_node.wq if the vCPU task is preem=
pted
> and migrated between VM-exit and kvm_handle_page_fault()?
>
> CPU B (vcpu task)                      CPU A (page-ready IRQ)
> -----------------                      ----------------------
> kvm_handle_page_fault()
>   kvm_async_pf_task_wait_schedule()
>     prepare_to_swait_exclusive(&n->wq, &wait, ...)
>       /* adds wait to n->wq.task_list
>          and drops n->wq.lock */
>                                        kvm_async_pf_task_wake()
>                                          raw_spin_lock(&b->lock);
>                                          apf_task_wake_one(n)
>                                            hlist_del_init(&n->link);
>                                            if (swq_has_sleeper(&n->wq))
>     if (hlist_unhashed(&n->link))
>       break;
>     finish_swait(&n->wq, &wait);
>                                              swake_up_one(&n->wq);
>
> Because apf_task_wake_one() unhashes n->link before calling swake_up_one(=
),
> and kvm_async_pf_task_wait_schedule() does not synchronize with b->lock b=
efore
> returning, CPU B can observe hlist_unhashed(&n->link), remove wait via
> finish_swait(), and return from kvm_async_pf_task_wait_schedule() while C=
PU A
> is still about to execute swake_up_one(&n->wq).

True, but pre-existing.  kvm_async_pf_task_wait_schedule() must take
b->lock. Will send v2 once I get more reviews.

Paolo

