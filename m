Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85E0390CAA
	for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 22:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779489660; cv=none; b=gMssLXY5715/aflpc53g7tKkahYFfC+vha5aYCcKjUItqaeT968P8fqVXlcFhWaUfL9BHCph39YCcCNxOD3ImzFKALkflZ6AV5IOcm/sii5OhNUOiz2Ptnm2kgEf7CGiYo6k1yV+Q/Cka307qJuqXzYdLsKdvXPuc8RfEQTrDqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779489660; c=relaxed/simple;
	bh=QlKCarQpTs0S5O3qv6nymBsauPruUAakuykggcKDs9A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q2XUnSROrZc5Qo7wb4gloEa5bCNqV08aYnnbxJ8UVldO5kOLriyb+RuGLwZq/PB6eYRVZ004L//oLBm2s74xS1nkkiOL404lQweWkpKRGI1gJulX99LtN/uG3nrFMUfnTEBrvBsJNN6J1nsIHk6RssE6zqMkC33wkL/zDqzRUr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mfHF2g7V; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mfHF2g7V"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2ba86e35aa1so126397885ad.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 22 May 2026 15:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779489658; x=1780094458; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ObH5PxgW1tY/Cptx/+ADLCZSx6CiOrfWCelMhJ7vjzc=;
        b=mfHF2g7Vu+1PlxWUsRETMWm0oga+RP3TIyEZFj47ittxThGTZCYRbaCenoR1AcLAEv
         u3Vvqb+INCy8bFVYj1oNrzjGv8Ka2DCWIloqdeK7nOkpcELbWJfI6KS4bC+KDyDZj+rx
         tBHNyaSd2xkw4ZjW3RAwGDaaYWqQ1o6GRjFxlmL+bahmJgbCzn5kS/CbyyO+srxTvfQ/
         QjUqVYnuxuuThPkhNzWr95g5L12S3Yxot+Ceh2/rZMghk8LNoi2JAp80gs1T6PZY//yH
         88Pn65KwPxialamaUZNIyJLRSzUh+AwMFulodwrpAnPw8a5h+S0O86UxDi+J/Uc3ZK6t
         OPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779489658; x=1780094458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObH5PxgW1tY/Cptx/+ADLCZSx6CiOrfWCelMhJ7vjzc=;
        b=X8h+VQoVb6a70gLbe4rHPAqaScsnFwI/5lMay7nQU4C4jSSXdito5KVY4oND7/X2L6
         Fai92PJjXK6Ea2qhGbDsSM0L2iu/5ZucBVlgrbMMe2EcF1/nStITvDDpivcDAcizfX9s
         espZdRq3fxsjaXEPdoo3GaeFh9cEOz7rp/tISH3EH9JB7RQ8uMrFQtPLlpOOPRAztACI
         /mdt8ryreOQeZDChNMYMQ0hzZaexe3PCEEwuxxTLAsLzo/niajaoBPYeNYvPxWmtCnUN
         ZWmAA9x1aaoacbY34s1OdIfNo58CeuQHNgTEZjdyNEIpvvoXN0CwrXdJIHYp+v8CM+Dn
         +ncQ==
X-Gm-Message-State: AOJu0YymwNnvV32eauskFQyrHjZY3WsgdmGBFUW+qsw6jvi/nBGRWA/A
	a/iJOs+QLfZ2MgUV2bpp47l1vIWJSfPGL6HO3jzQ3I0z89XLtLr+xpaPwiY6uUd3A5W42ueypMB
	RAxNQh9ZCU1uidBX/Vio7XV13AMnooL81GlGmCgEMyIt7MsWrG5Q4Gh3ZVKeHuCvujfzRlUR+LC
	85ciZnHPOASUtreqDtdd4PL+1kULbFfK4boSSCmfV3ZOrVXaDX
X-Received: from pllk9.prod.google.com ([2002:a17:902:7609:b0:2b4:5bcc:fc4a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b43:b0:2b7:abc0:3bd7
 with SMTP id d9443c01a7336-2beb035b8edmr61076785ad.9.1779489657741; Fri, 22
 May 2026 15:40:57 -0700 (PDT)
Date: Fri, 22 May 2026 15:40:57 -0700
In-Reply-To: <20260522215442.F0E711F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260522-fix-sev-gmem-post-populate-v1-2-9fc8d6437b65@google.com> <20260522215442.F0E711F000E9@smtp.kernel.org>
Message-ID: <ahDbeeM7emoO9G-I@google.com>
Subject: Re: [PATCH 2/3] KVM: guest_memfd: Fix possible signed integer overflow
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 22, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/virt/kvm/kvm_mm.h b/virt/kvm/kvm_mm.h
> > index 9fcc5d5b7f8d0..23813d74ce709 100644
> > --- a/virt/kvm/kvm_mm.h
> > +++ b/virt/kvm/kvm_mm.h
> > @@ -72,7 +72,7 @@ int kvm_gmem_init(struct module *module);
> >  void kvm_gmem_exit(void);
> >  int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args);
> >  int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
> > -		  unsigned int fd, loff_t offset);
> > +		  unsigned int fd, u64 offset);
> >  void kvm_gmem_unbind(struct kvm_memory_slot *slot);
> >  #else
> >  static inline int kvm_gmem_init(struct module *module)
> 
> [Severity: Low]
> Does the fallback stub definition of kvm_gmem_bind() for !CONFIG_KVM_GUEST_MEMFD
> also need to be updated to match this new signature?

Yes.
