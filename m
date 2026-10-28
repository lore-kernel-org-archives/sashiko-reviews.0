Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194797;
	b=rqySQ73MPUCZYsn0+7ViJ7VY/8uRTmcGyjWRfbD7jKwzDcB3uJm7HIr1kbrslHnvyxbr
	 PnZ86xQBw+wz0meMXULJNXju8K5RzV1DyWFSnQCYJ6H5fMoQw6mXWEY+3RpLAGsWOl6Ok
	 PgD7HW+tsXwkpPAabibGVvVWaILHHGicqopQxKw5RtJfxRyWRB/crErd8LYeLAWcoW627
	 p1NyJw9hkNQxqq6pPWryJeJ91JwU4AHFECD5ZQGkj0k3QvOzODZh1GadZx8OD/5zmWLMO
	 iRkNml0Td4PUXf9SggYpddR0HCOuLrE/KP06IfvFI9lhS+C7MEuWzVNLS3wjtCEY8uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=xZLmLgFNAyARHxSBRStR7OWRqN4IR/DocC51szk/rqU=;
	b=uXJ0QWoi3PmHfm4+e71hvWbKitrOynLKeFzIRLLxO2/G0xHwNjvYGbM6tFRpBLAKKejy
	 SrN1wK5/vYcozg2ZrsckqJtpIQ5bFL4vPmc2UwXYhQWfeeaY9TqWGaNs1PQkIsRvBHuhn
	 wKjmYBGZRVmWV03GCBapfARFrDAHcZBoLMLBIvI4abWwnqPNP3jyVSPN0WQ2mn3uZEjOX
	 pzdPGAGFZN2HzDsRpdms6X3TdzTYzQ8JFPh0tibUjCaKrvAmnKZezMvJ6E4ABm1KCxWz/
	 kcBqj2lolXxL8sXztrEEF0ZsX7JcbhDnTWvaXQfwoWs27E/D7u8sqfAXb1L61qLC+Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oNncf38l;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E716606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 13:39:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E716606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oNncf38l
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06750c74fso725388b3a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 06:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793194797; x=1793799597; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZLmLgFNAyARHxSBRStR7OWRqN4IR/DocC51szk/rqU=;
        b=oNncf38lNwMgk1Rj9irLcHUmeRrkInblMRdg3WiTCfVfbUBzrwhBrdW1YpOlyK0n3U
         qjrN3sMpB/87y700K0s6lVPK3h/Mh4C2GHyeKPBBNiyL+0GxhU9XtmmZ+RhCgttpBcpx
         raEEUVfNxC2VFG5LRmARz6yTaIp9UKCd8uz9wQKZ6EU8nOctz1AbTQWEcAohfdSaEge9
         yYozmzAvwbtdjEDFajFW9yGWT1UcpW4X+p+eyE3+3Sq1q/ifr8Kp3ixyC9h9z7kpZzjr
         xc9X3oZ0gitU8vgb4WgcSEhsGYiwkSqkdP4OaagN4ZIL5s7iBV8FX4qCaW7kKZZUqZX1
         NcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194797; x=1793799597;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xZLmLgFNAyARHxSBRStR7OWRqN4IR/DocC51szk/rqU=;
        b=vFHx0FI06GcHgghFWgRQjjJC2pa1Gxnw2ToC6A3QJQM4E/e0IE+PUfUeczjBTFh6Fm
         cT8Vr5jg4Li6P8/cSRd7e2lsXM7VBQeCLeipkN26pDBg3zzm6mW+pAXby57u4l5wtMcP
         fECWU41GYuajYXr4IzCjdlBm1OZ7u6t0YKUgnI6Tozrn6lxp7MVesJdBtV2K6ULdTG9Q
         4ZzP64CpwXsLBOjrfqIAlWnv1l+AtH4Z0J9ZQpfGm/GOXoK/IuiDMT+qbsX89znrJCrE
         W3iV3iCiPI6Zp9lxjSKvHx5thJTAvNmdeJ8l3+MTNpxxUvEvHHRjQUb6tdyh2jcCs8mc
         1qMg==
X-Gm-Message-State: AFq9FYLibqUQGQBbqTaUpn7qb5oFohleS2Ywf6jB+i6sUREQ4rUiPh37
	AKFs8tH8JVcDJIko9V62C3xHgdbTT8wXWuFFmHHDAZ0Cw5Ou8LJ3ufIYPBLf1RkZ92S3XjnNFg5
	k2+ozC9WaKjNq9fTwoSGXQ++vJrIit8PNoHcln6nRUWzxFiVek3ty/P4i+gJfGD0rwSgVzR3yUy
	qwtbKhK4xqlhwUkg/CDCTV3s7MHNlx+WSKd/muFHCUp9cQhrT9
X-Received: from pfaa28.prod.google.com ([2002:a05:6a00:a61c:b0:89f:30c1:9a96])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4fd4:b0:878:6ee:672b
 with SMTP id d2e1a72fcca58-8a6e6ff34e6mr1964985b3a.35.1793194796562; Wed, 28
 Oct 2026 06:39:56 -0700 (PDT)
Date: Wed, 28 Oct 2026 06:39:55 -0700
In-Reply-To: <sashiko-outbox-187201@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261027224914.1574319-1-seanjc@google.com> <20261027224914.1574319-5-seanjc@google.com>
 <sashiko-outbox-187201@kernel.org>
Message-ID: <auH7K0Sq0KcApJGq@google.com>
Subject: Re: [PATCH v2 4/6] KVM: x86: Recompute EFER.LMA instead of inheriting
 the current value on EFER writes
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 27, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] kvm: x86: guest- and userspace-reachable WARN_ON_ONCE() in set_efer()
> - [High] KVM: nSVM: guest-reachable WARN_ON_ONCE in set_efer() due to stale EFER.LMA

As explained in v1, I don't think any of these are actually reachable, and if they
are, they are pre-existing bugs that need to be fixed.


> - [High] kvm: x86: missing MMU context reset in set_efer() when EFER_LMA changes
> --

This is a legit flaw though, though also pre-existing.  I'll tack on yet another
patch in v3.
