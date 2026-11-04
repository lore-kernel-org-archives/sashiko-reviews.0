Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823647;
	b=znA60mH7WJhjDIGH4Rz5mOYaS0itb86M5YxnDNsWFvG+1A1GC/ltRu9aT5HojofnYzzI
	 DcLOalP+dzZruucH+OWJUUqFdmzGTtvbDBntybJEZDuJZl3RoqrrQsvmxXObYTYB6uOEY
	 RGeSyGXuiWtlIT9MyVFUxcOO/xCODq8eMuyWMTd6jAE7LDQSramwYdot134tR/AuudPDC
	 ojbSvWHdi71GxSlbaOHym2KZ90QilPqg/sxjGNWlh611EvDZWRa75k2oPm0EbMZAjzLTt
	 dwf3rRTh3+dQIc5GYLgcTCcATTr5woaJ6muRRuHCEIdagEhtD1IjuF1AayIzoKFDJBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=YBF8x8sJdLXwce+ZD1baPxrZukLcOjCkutFhGRoX8Ps=;
	b=bSZ05d3jxdcIS6bcjQn9BLd8twmaOBxRblH5NQybedZm1SlnfS+gabs5GStn3yzVP6US
	 zYF4FCeIGHoPZybEqNsVn/Ocfn3beRUxAxkPz4y83JCpJSKBfuV5zBintZ5ud5/aqa6vo
	 /roi4wzuXlmMasApQhNP4UyrfZw7yJyDp8jN5730a7sQMqPGMGHdWfEZpw/j87/UmFhhM
	 xnoWgvm/vSDDexmkQ0E09uhdixSuVkiqR2oM2NYhGJFQ4R+siTSHy+TmklnwechI2gnTi
	 SqCiHUZ+sMVvMiLL5Z8n9Ro+ZuRTF6nawcG8o7LX+pHvpfO0P0D8o/h+GaoUauIa2ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dDeXxGkB;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC4C6072649
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 20:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC4C6072649
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dDeXxGkB
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b07b06027eso1380637a91.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 12:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793823647; x=1794428447; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YBF8x8sJdLXwce+ZD1baPxrZukLcOjCkutFhGRoX8Ps=;
        b=dDeXxGkBtx6OxZWtC6O7LxPZ8x8+TO80Kz2m5cLBDftobrTe3YSxMhxbM8z0Jtz4U4
         U+onSa3yiE1Gl5kOUse6Sc4PlY1B5Cz88IGU7T8DE2gUmGOuYFFC8Jv1bAJc4O4AYtKi
         0yi6v1zzi6TMHcPZileIeaZqHrftdux8n5+7XVM03FavcRfnP51KACMhIaOvdLQvapnA
         7MuQKgRdcxCItsXCdZzPv4LzzIaIKlf6iN8VsJJSjgEbXSb/048Udp8tl5ac2bAxTtSK
         e6ARLzk4ykSXjc1pKCBXwgtnmHRsl77Xd6iLgPJJg7/2Jsfeb1hQzL7ZbOZrH9LKmRdK
         iKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823647; x=1794428447;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YBF8x8sJdLXwce+ZD1baPxrZukLcOjCkutFhGRoX8Ps=;
        b=VqXVbPNG/viKD5TSsMUpabV+Ct5n3xkBY3rYxPGP+sYKtOJpt1clVibcQxMWE5qne4
         wjyZH9fBZrtMJ3XxjeFJXvy74qda1i4ITOdrSYY/rpPMXJ4kImjc5Mbt5wXZxG97O6rp
         M/xGRQxh2UyeWq8IuxoP+Br3BymTP+bepiXm2hLbrmZYII+Hk7tUh5Q/fYiTvpn4J4TQ
         tsIK4A9k6o7bOmXdbBV4jdzrATTNbutUf7NYXPtm5YAFB/xwbJ5ikz0UjANAQezDBfox
         ZWJSimaquEtKgna6M3SCKi3hTQ3M9lGnETLB+hNKKohX8QjXFsWZvEp3GYZ9+EmziLAN
         myqg==
X-Gm-Message-State: APuU4Z+mPy4xcmzG5ZpZxrMBbVdKQjJB7ZbimuuOyCf0JJUhesyKBg3Z
	Vd4f42hui4bYbJ7ymEuXpE8/NUClHoPhLxQ4jQ1LsjnyTP6+lumXrYHq9xdYguVIZBx9LnQSjOu
	PMytKDw==
X-Received: from pjqv12.prod.google.com ([2002:a17:90a:af0c:b0:3ad:ce09:ff3])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:380c:b0:3ad:13fe:41ba
 with SMTP id 98e67ed59e1d1-3ae897c8968mr13887718a91.52.1793823646440; Wed, 04
 Nov 2026 12:20:46 -0800 (PST)
Date: Wed, 4 Nov 2026 12:20:45 -0800
In-Reply-To: <auh_-EkrjCjUaiA9@8bytes.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261102114137.1198982-1-joro@8bytes.org> <20261102114137.1198982-3-joro@8bytes.org>
 <sashiko-outbox-193355@kernel.org> <auh_-EkrjCjUaiA9@8bytes.org>
Message-ID: <auuTnRi2EhuY0HT6@google.com>
Subject: Re: [PATCH v3 2/8] KVM: SVM: Implement GET_AP_APIC_IDS NAE event
From: Sean Christopherson <seanjc@google.com>
To: "=?utf-8?B?SsO2cmcgUsO2ZGVs?=" <joro@8bytes.org>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 02, 2026, J=C3=B6rg R=C3=B6del wrote:
> On Mon, Nov 02, 2026 at 11:52:44AM +0000, sashiko-bot@kernel.org wrote:
> > [Severity: High]
> > As reported by Sashiko on v2 [1], GHCB_HV_FT_APIC_ID_LIST is added
> > unconditionally to GHCB_HV_FT_SUPPORTED and sev_handle_vmgexit() dispat=
ches
> > SVM_VMGEXIT_GET_APIC_IDS to sev_snp_get_apic_ids() for all SEV-SNP gues=
ts
> > without host userspace opting in.
> >=20
> > When an SEV-SNP guest queries hypervisor features via GHCB_MSR_HV_FT_RE=
Q in
> > sev_handle_vmgexit_msr_protocol() or SVM_VMGEXIT_HV_FEATURES in
> > sev_handle_vmgexit(), it will unconditionally observe GHCB_HV_FT_APIC_I=
D_LIST.
> > If a guest uses this feature and is migrated or restored onto a kernel =
without
> > SVM_VMGEXIT_GET_APIC_IDS support, guest execution will fail when invoki=
ng the
> > NAE event.
> >=20
> > Should this new guest-visible feature default to off and be gated behin=
d a
> > capability via KVM_CHECK_EXTENSION and KVM_ENABLE_CAP so userspace can =
manage
> > feature exposure and live migration compatibility?
>=20
> No, this feature is for SEV-SNP guests only, which can not be live migrat=
ed.
> Live migration for SEV-SNP guests will be built on-top of this feature (a=
mong
> others).

True, but they can be live-updated, and in general changing the guest/host =
ABI
without input from userspace makes me more than a bit nervous.  E.g. if the=
 guest
side is buggy, downstream users will have no recourse other than to rollbac=
k the
kernel.

Is there a need for this without KVM_CAP_SNP_DIRECT_VMSA?  I.e. can we tie =
it to
that?
