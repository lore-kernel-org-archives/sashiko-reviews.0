Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881021;
	b=RmqfIXMCeoraxk2w64nWZaoiKttchpy2Dn4jBLpoM88chW0kLIdsnQFucbKCA8UAhzTg
	 F/n5eHsDbPmeeclcpM0olvhB/Rro2esnn9jvSFwrPCRvOevBpOGTccLBXhBARAwpDeKZn
	 nVl30HDJJNYNZz0YN2PPOBe9JwSarxGB++dFEuHFmnWkbr0VtZAxVeFGgPCtNkeRzmbvA
	 SmiKGS9isMzT9Rso7B6FCNYgnGXQcUjMo/x5l8DaAO9rEeUHeMEnAsP9NPxzZH//DiG2x
	 U8MVm5PFaVwvq8Dgz08slDuP+QfKpIxxltiX7ks4f7Uchv7H4SFswrtqU+NHXo3dwXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881021;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=IA2WY3yNmb+K5Fpsg52O2Iq7E8rleDjZAuLC45egiIs=;
	b=j1Y0cddhwKMJB/FtGJSafPCS1WUH/aZSBKpn94KSCa0zOrvP0pntRNLB3C42CZS+CnHY
	 oQ6lDdxqvmY/+u325IxMh2mwE4mGlNqCLGNbwtPNkjx/Zn1F+Q9LfZl5qDtfUwWSYHCRe
	 W4Rsdejog4CU66CsURqYao4N9+wglKWQr/r3ru3nQaI06u2XVCo4yPk4mOkkRdoD524WV
	 eVqT/M565CBeczAAF8Gf/BmCj7u/Ncj+bJFPg5L3ZwkoH0D1+fNWlRvNPhqhuWFZmjwEe
	 hVqwvxlibtNfqLw70DWTMOqfEG3dOoB+rTrobjF9Xn3e7rbRC6zNdZ2AuPScZ9VOuFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dsXY7XDX;
	arc=none smtp.remote-ip=91.218.175.95
Received: from mta0.migadu.com (out-95.mta0.migadu.com [91.218.175.95])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C445606EE84
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 12:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C445606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=dsXY7XDX
X-Envelope-To: sashiko-reviews@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=exIR8W8oCZROFJI2uk7aiMwrPmf06QUD4IziM5WiRos=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793881018; v=1; x=1794485818;
 b=dsXY7XDXidksExMMGQkbhbNnDuVNSS6N91/EMbX1+1N5Xbv0rneEPY/neit1N1nZz680ixBM
 ohJhbAJvoRq/YCUxkWhHpAXBdsF3HbYuYC0v+wA+BqX7O8dg6zVS/JO/ibkDLJxDFyTZ5IPQaU7
 Opj/MU5i7Pq+W+GMatoefLGU=
X-Envelope-To: sashiko-reviews@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d4e3f83733bf5743;
	Thu, 05 Nov 2026 12:16:58 +0000
X-Mizu-Trace-ID: d4e3f83733bf5743
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bff701efa5so5937e87.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 05 Nov 2026 04:16:52 -0800 (PST)
X-Gm-Message-State: APuU4Z8w3b92NUjZuFp5bKlkwWMbQmPH+fX+7ygThPkrPSI10g9PmNjM
	jNkELanYFeWsVRUuGzHfXo9EnwwHYpUU5vFob4OUpZpm7QiGxgYbYCCqsd2SV469qJrPai+KFUJ
	13ftNOrHfgrGZEx9s9Hyfaop/JOnmSZharHTpbokO
X-Received: by 2002:a05:6512:2387:b0:5bf:d1d4:d678 with SMTP id
 2adb3069b0e04-5bffa4669efmr169831e87.1.1793881012035; Thu, 05 Nov 2026
 04:16:52 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105110050.1244525-1-fuad.tabba@linux.dev>
 <20261105110050.1244525-4-fuad.tabba@linux.dev> <sashiko-outbox-198943@kernel.org>
In-Reply-To: <sashiko-outbox-198943@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 5 Nov 2026 12:16:15 +0000
X-Gmail-Original-Message-ID: <CA+EHjTy6+eybqqOoOPr0TxKfexD+gjcvpGQ-kCMmaKz2yQGiKQ@mail.gmail.com>
X-Gm-Features: AclHuK-wbPaGOFcnKWXZun6kQfFeB-tajjKRV0aOkS7s2VVDPjtOHTnCjBx72tA
Message-ID: <CA+EHjTy6+eybqqOoOPr0TxKfexD+gjcvpGQ-kCMmaKz2yQGiKQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: arm64: vgic-its: Don't read the pending table
 when mapping an LPI
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 05 Nov 2026 11:23:34 +0000, sashiko-bot@kernel.org wrote:
[...]
> > diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
[...]
> > @@ -2717,9 +2714,25 @@ static int vgic_its_restore_tables_v0(struct vgic_its *its)
[...]
> > +        /* Enabling LPIs read the pending tables before these LPIs existed. */
> > +        kvm_for_each_vcpu(i, vcpu, kvm) {
> > +                if (!vgic_lpis_enabled(vcpu))
> > +                        continue;
> > +
> > +                ret = its_sync_lpi_pending_table(vcpu);
>
> [Severity: Medium]
> Can calling its_sync_lpi_pending_table() here cause KVM_DEV_ARM_ITS_RESTORE_TABLES
> to fail with -EFAULT when a vCPU with LPIs enabled has a pending table that
> does not cover LPI INTIDs targeting other vCPUs or unmapped collections?

Yes. Unlike the map-time read, this reads each LPI-enabled
redistributor's table at the bits of LPIs targeting others. Will fix
in v2 by skipping those LPIs.

[...]
> > +                if (ret) {
> > +                        vgic_its_free_device_list(kvm, its);
> > +                        vgic_its_free_collection_list(kvm, its);
> > +                        return ret;
> > +                }
>
> [Severity: Medium]
> If its_sync_lpi_pending_table() fails partway through syncing the vCPUs'
> pending tables, does this error path leave already-queued LPIs referenced in
> dist->lpi_xa and on vcpu->arch.vgic_cpu.ap_list_head?

Pre-existing. On kvmarm/fixes, vgic_add_lpi() already queues a pending
LPI as the restore maps it, so a later device-table failure leaves the
same state. The early return in vgic_add_lpi() on a retried restore is
a separate bug.

Cheers,
/fuad
