Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952559;
	b=WwY3jvjO0+pBWJvOr14i77qk7m1U9KlrXIvNrhLWTM4d0JMw5qXcBCgvNziksdjG3fpi
	 91uR4rsU5wvEgEUBmLP8PZlkgPv8ae0/lZVLSJCQuQzPEDiBSkr4xIklhx48s1kPziFzG
	 aOMRBcaZv57uJerxBlm+aCZ07OeHK7GhE+51JIxZUBXZqVn2NMZ29/+7X7CtjOgIIGSAM
	 zEk7C/PpmIuaGiplvRfrvInZQx16q8SLE1N+eW2FIfPW6+/oMX3nBPj0iHxwP/O71Bs5s
	 wx7R8WsYgzMH2lV86L6bOfIHcf9E24fd4Uiv4ryP98G83c1i9nfrH/MRZHlVeythzrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=2JQa7rqZUcilixNgol3luV0Hy2c7F5fvWLd3A2v5vDc=;
	b=iNx381VzXVEwM3GMp337yRspB5Hmf5iL7N8DiPdTbCQ1YGnvxYBza8aJezBrAxMEEvpi
	 LC+jVXzgeqd9gU2zrrc8qrxzwMI9XZ2ttJmuFSmysTtKNTkRcgIJkIt/3kXFeUlHjz0qb
	 NgA7UJeF2d6+EQT6yW2oC1KTW8kJ9Ta8xqjmgwkNlrqKtWWcI+Kk8pmR+8cVt79pMClvj
	 eEWy8+O6N8hNxyAoIdRV0nC9Nlgc3aoyLIS5nk4M15npT0yOGFX2cGWtaEMKQd9UOoYpq
	 9nCvhjxboFh8w9bDMHyPto/rY2QmHjQJJCsHqzTAwv9z13MZyF2g3sDtm8qaCX3Qfyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JKiPxIOr;
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA608606A881
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 21:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA608606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JKiPxIOr
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso208961a91.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 13:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794952558; x=1795557358; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2JQa7rqZUcilixNgol3luV0Hy2c7F5fvWLd3A2v5vDc=;
        b=JKiPxIOrwXDKBytcZhwmePmgo5NsWtGpFPZ8MqyE35FTsKs2TbrjSCDXyK9+2OaT2D
         0AphbqF5B8A7KnNxjDuLWPTmyrfrNaC6SD3yXAxQQ8DZB1YBuqVOjTubD8n6BCi+6OSy
         hudqB9QNDlOeM/s0F/cmCgmTJEXTSNhdfSRejq9WucNnS0XFEEYjQyd+b21itfnNiZAi
         CMwF1ED0ryQW35wrbjMYIR2v9vMg0PkFAW7c7IHWS2FqDAKQWhoDKQbgOJ5MwRVyr5EV
         N9KJDRsdDZ7QeoJI5taMKQoWTpJrdDOqVM9k4fF4OYeRj+mb+dHu8wbcwQcfqEfvA7qm
         BAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794952558; x=1795557358;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2JQa7rqZUcilixNgol3luV0Hy2c7F5fvWLd3A2v5vDc=;
        b=I603HUiSNULcQquejZdcRR/08GNL5TPsvJQPHdxluE2Sh9XHSFcaLu1HwKuHtEWJnk
         WxyBcyd1s6wHpi5RSgFxSywQSoYylPO1n/BUuABFEeJhK4qarvVQpMXVvSQXqMo/Zh8+
         OvH6gZQLUOVPWnrtKwF3jO+KAi+NmB3TeTiCfOKcCBNcZLISXeXTXcTX8VM8HAB20Q8l
         H78oRMe0jlUFFSCSLpDGgfj9EmqBJfrNIS8cmzwn/YbHIxncXMfh3WD0ewJOlWePWWP2
         LV6cC4WBfQyXNjH7ptC+kyccrvlq6mlDSh5UoD+0Wv1k89RgNhjjWnpKlH0FOSBcbTes
         ImGw==
X-Forwarded-Encrypted: i=1; AL+hErEFkj/gz4sHbt7dTlQ6bmUPLsRCDh+v7+C8LyDLKGoECUVemuCDa9uK/OVHuRBY0uNkAB6B9UA6VSVyMQPUsOE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8c4aDJL3ib+AhP8bHgVC/7y2OknR6pftbGNNHy6jPZzBfx7sKK
	rJUBI5JIDkRtXZUm5HNBIrDvJw7fCYPWe0CO7os801OBmAHG877n/JwQVo5f53moq2n2BjsbVm7
	XAim6Nlrm5JbaJn+lVoL2pQ==
X-Received: from pglk22-n2.prod.google.com ([2002:a05:6a02:6b96:20b0:cc7:b263:342e])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2642:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b3d0765fffmr663064a91.36.1794952557723;
 Tue, 17 Nov 2026 13:55:57 -0800 (PST)
Date: Tue, 17 Nov 2026 21:55:57 +0000
In-Reply-To: <sashiko-outbox-219706@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <sashiko-outbox-219706@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261117215557.3756787-1-jthoughton@google.com>
Subject: Re: [PATCH 4/4] KVM: selftests: Verify KVM doesn't reset unused dirty
 ring entries
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, sashiko-bot@kernel.org
Cc: jthoughton@google.com, kvm@vger.kernel.org, 
	sashiko-reviews@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On 17 November 2026, sashiko-bot@kernel.org wrote:
> [Severity: Low]
> Should dirty_ring_reset_unused_entries() clear flags back to 0 on
> dirty_gfns[0] and dirty_gfns[1] after kvm_vm_reset_dirty_ring() returns?
>
> When kvm_dirty_ring_used(ring) is 0, kvm_dirty_ring_reset() breaks out of
> its loop before calling kvm_dirty_gfn_set_invalid(entry), leaving both
> entries with KVM_DIRTY_GFN_F_RESET set when vcpu_worker starts.  In
> kvm_dirty_ring_push(), KVM increments ring->dirty_index before overwriting
> entry->flags with KVM_DIRTY_GFN_F_DIRTY:

[...]

> If the host reaping loop runs while the vCPU is pushing its first two dirty
> ring entries (for example when reap_i is 0), kvm_dirty_ring_reset() can
> observe the stale KVM_DIRTY_GFN_F_RESET flag together with the incremented
> ring->dirty_index and reset an entry that userspace never collected:

Yeah, this is possible. Sashiko's suggestion is the right one, I think.

Sean/Paolo, if nothing else in the series needs a v2, would you mind squashing
in the below when applying? Otherwise I'll fold it into v2.

Thanks!

---
diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index 96a4048..b03ce06 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -381,13 +381,20 @@ static void dirty_ring_reset_unused_entries(struct kvm_vcpu *vcpu)
 
 	/*
 	 * Mark unused entries as harvested, and verify KVM doesn't reset any
-	 * entries, as KVM hasn't pushed anything to the ring. KVM will
-	 * overwrite the flags when it pushes to the entries.
+	 * entries, as KVM hasn't pushed anything to the ring.
 	 */
 	dirty_gfn_set_collected(&dirty_gfns[0]);
 	dirty_gfn_set_collected(&dirty_gfns[1]);
 
 	TEST_ASSERT_EQ(kvm_vm_reset_dirty_ring(vcpu->vm), 0);
+
+	/*
+	 * Clear the bogus RESET flags, otherwise a reset that runs while KVM
+	 * is pushing to the entries could reset them before userspace has
+	 * collected them.
+	 */
+	dirty_gfns[0].flags = 0;
+	dirty_gfns[1].flags = 0;
 }
 
 static void dirty_ring_after_vcpu_run(struct kvm_vcpu *vcpu)
