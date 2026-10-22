Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676054;
	b=X4Kyvi5KKQEwRMgsoGPAVbqGd4jQJj5/EkdEJqhsn99PLz3eALW+8g62oANlOqwB9Mqm
	 MFISg5G5+LJFHffd9KsrXoMd+ZbeaJs/4w6F/7RTztp+iKxd8Ac/qkkcHlYZDJzNbGib6
	 +GcQ6JtCwuZkivyZco1YS3hKPzYZYnTfMLciYz1YYj7aGs1jjgaA3dORyTBYe+Vc91wyR
	 le2TuTsNQaVUbwHwxMi4MySU+Kjal7bvvDXgYoZuo3VeAHKb/dzRDmpMHnrLPIiIguPIZ
	 tQ8ZKlrYLrqQd71KX8FE5hoilWCDoZAysOZJmQcesDtE2lqJxRPH+FRCu863LneKayQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=s6fpI41ldXRDTZ3theMUIYhg/aGv3nEmbSPbCA6hXnY=;
	b=qi/131jX0cW6KWm4PHhcqXhkR/qFYX+Ymr0QgzI7qkxZa3r0D8eDb6+9/aWiR+9IVI+Z
	 LlpIIRYAl0/Yn1N+3XulEl/AfydxV4oUvvy7GzoEZbIoKV1AUzgVS9c+NaFkqKiSK7b85
	 614TSdWezGuHXKwbl1s9BNEeU9ugRpqc0mpZReJqcr9IcUueOixN2dMhdCgKS+qJQIqye
	 iLBh+RDmdYbDc9GGJVKMKRqlbavIB5x/mDAhi9udOvHVmPtKO3CzS3y1FqqFd6sXvNyW3
	 pgoX8RcxmjnaGbAp88N6L+Dkm8I1504UEeMugFrS1veklGdBQHCgiumQpCwPj4pOFWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cxjcMkOY;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFDA606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 13:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFFDA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=cxjcMkOY
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so1950350a91.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 22 Oct 2026 06:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792676053; x=1793280853; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s6fpI41ldXRDTZ3theMUIYhg/aGv3nEmbSPbCA6hXnY=;
        b=cxjcMkOYftZa6QOHu5P7sKBXsOmArPfP2f0CdMJPj7qJZQZVkcksYkhxLHJF+WnJkJ
         kSE7xPlfQOoIEDmpAqzMNa/M+mG74t12Tgigo91ALNjWZ3F/gJsewqmRwWMbT91TOqsv
         hyM+GUCpfirCi+f1YMuVEd1RbrB/bssANKM8csnWw+XuHy2L3MbPHCNfaFcUNNxRL9nd
         2IyhFes2onvAjPY01dbLc/jdMHG7ROrpMr1hqiaw8M0+ANyW0/yMVGM89upsq0HWgkzY
         33AIo1izfa04iSTa7r+a0S32G7o5R0R4K0VqbUZq3xnUevmtU906zWNK41wo/BgNgh0u
         c6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676053; x=1793280853;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s6fpI41ldXRDTZ3theMUIYhg/aGv3nEmbSPbCA6hXnY=;
        b=iks5Yw+lWHP7jh0Jeyox58nndKa/jIedJPgjxt/uVlQMdXt5qs3ZNnJcXl9FHLm5er
         DZrXcsXncJ2AXdd2g8VmrjGmSrGn4H8f+1nflWhYuBiwmUgxhcXEjlPdR6j7rWmJnP5N
         FJoJfZGIOjF0+xpf6hKii1se85baPk2l/oD18m/y1OJT/3lQcCDp2ISpfqPx+JGER5ol
         fAGmB1tEULxlYl51jDu21m+ZpNZeCDbmJ2n+ZeIUItr4IG/XHcJ93RgyIJTmr+qF9voT
         HWeMxW7FbEffFl3O0r2LEYTE2UqFk97+npXeTIPre2IVMk/6UndTvL4CSdPUQ32EbIz4
         hlbw==
X-Gm-Message-State: AFq9FYLg0TaRIAMnHspomYynV3DmlyFP9CaKXj4agZISFygEcGnsp1jV
	Lyyvckt+O7IcBS0SvRc/AzHKArUDD16Yv5k7shJb1hhab2OMOGs5AbzOv6aPJ1yueauhlPyX8K3
	y6clVaB1udSfsvrSa7OgqdmOuG2oacm0tUcXSPGrvITGlkEsZTjN+ecBYub2ZxRqitUCNrvOQeU
	MTGN8rtBYaiEUOCDTe6usk3zm/l/WZKDFABU1tQW4GUJ08uXJ6
X-Received: from pjhz8.prod.google.com ([2002:a17:90a:5408:b0:3a8:8e16:d986])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4483:b0:3ab:9f1a:3825
 with SMTP id 98e67ed59e1d1-3ad86dcaf5amr4303123a91.4.1792676053000; Thu, 22
 Oct 2026 06:34:13 -0700 (PDT)
Date: Thu, 22 Oct 2026 06:34:12 -0700
In-Reply-To: <sashiko-outbox-180886@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261022022209.300964-1-seanjc@google.com> <sashiko-outbox-180886@kernel.org>
Message-ID: <atoQ1Az63PUL8L0l@google.com>
Subject: Re: [PATCH] KVM: x86/mmu: WARN and flush TLBs if TDP MMU replaces
 present SPTE with MMIO SPTE
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Oct 22, 2026, sashiko-bot@kernel.org wrote:
> When a shadow-present spte mapping a valid memslot gfn is overwritten with a
> non-shadow-present mmio spte due to gfn truncation in the tdp iterator, does
> flushing iter->gfn via kvm_flush_remote_tlbs_gfn() flush the wrong address
> when range-based tlb invalidation is used?

...

> Should this path call kvm_flush_remote_tlbs(vcpu->kvm) (or mask iter->gfn to
> the root's address space) when !is_shadow_present_pte(new_spte) triggers?

Eh, I don't think we should bother.  The right fix is prevent the truncation in
the first place.  If kvm_flush_remote_tlbs_gfn() weren't limited to KVM-on-HyperV
I would care, especially since this requires userspace to effectively misconfigure
the VM.  I.e. someone would have to go pretty far out of their way to run afoul of
this exact scenario.
