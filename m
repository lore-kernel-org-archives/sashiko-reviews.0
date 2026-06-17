Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF865340402
	for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 21:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781731323; cv=none; b=GnUab2x/w40E+jx/gV/NmWE0q9OVgitwWbfCOdqQgIK16SasZ+vvhq+qOahbsRw+W6x2uQYPSkthzz6X3Y8/u4pDEky3bkORzpLDp7DWs220NO6YovH5nGYDpwvClf2RqL2C3ERUNVDFNFZ1+PSmI8Zy81lfVrDDOmQPTOTgIuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781731323; c=relaxed/simple;
	bh=MGYaW/kGXMvXvkG3YNsp5PL2xIZorPYpsNyujv+1Wxk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ea0AORZKHVNLQoO8TSaSSmhfUjtdQv8ddt0atq9HvdZv32v1J6gCsU2Z0ikZ0AnIe3P6yVYyKK709qKgQn/heCcLZVvOfVIogAx4MgtyxRNi2ZwyCD60kOrWKH6vXq9V2ElV7M1RFwVWpRceyVfJ5y7MJS7/2fMfMRFkD+NoKPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oXbTLRuD; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oXbTLRuD"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2c2a4babe45so1439905ad.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 17 Jun 2026 14:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781731322; x=1782336122; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g6AeAWlBOIBCo1eUsPzrvFR0RxSzMS/bNs/bO5JhUb8=;
        b=oXbTLRuDcXg6izZ/HQmnu2x63ddR89z5OYlSc/iQVQCm5KAdJzr4nvfiXUayC3boBR
         fiQl18zfOOo/OqRi+Epy4edkAm0wqho22kdc45s1ygtohyN31BcDCJXWY0Cgy7DxuDUg
         2Hc3AD0dBhLPFoiYGV0WMU2Ez48hwziZrxpcL1UEjcGn+4fnkK8BMmy9FvM6JNJDeDGk
         kD/M4ff9sHlFSgr5EIrKJgiYEw1jPms/U4LsKMhA4W53Hg8j7qH58Fk2FKofzZsSFeeA
         DTO9zeh7cp7Ev40l3GTzvH9WOcvr6r0wTtWc5yXM23C2dOin5567gDu5g73oVEos/Q38
         kJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781731322; x=1782336122;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6AeAWlBOIBCo1eUsPzrvFR0RxSzMS/bNs/bO5JhUb8=;
        b=cp2vkYFZOlT442y71A7brRQEHys/niB7rj0qHqJSlDeybgEh/mWKK97Wua8uxPDXpg
         wB99LmfohwuoQpb5W6tPp3wVgeal9mE2f5KiQVATrO+L6erJ4r6iyV9orcVIejDlJbYr
         P/9OsSTX5lleq2UTDeu0Vq5LWXltZeN53CwFtEfrvcmkSDfJbbU3vaEDdnPuWMcx5PvX
         dXx6ToWz9xFDtEy31hkj6Lzuj3SLHgSGoTsdvvlqk2J1hg8aJVlNGQYIXoCxSYKjuXEr
         0k/siDxZiPqDas2dNZjOmA88CzfHeklAXY1af9QplcwmdhNrElxwx2Rmmj3rhart1+Nu
         fVTQ==
X-Gm-Message-State: AOJu0YyVOqboTa6ZNkz6CT6gxqpr63QX7sxD1SjysxK+FoGQ/FBmGHb9
	7Ujl2iYY54FiV12oGFu4fC3RFOXFTofo3qM/dmjlSskgMh4qUrBtbsK/V9kMnbQjPt49bVfki9Q
	/le9nTQ==
X-Received: from plnw11.prod.google.com ([2002:a17:902:da4b:b0:2c0:b770:dcd7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1590:b0:2bd:606d:b342
 with SMTP id d9443c01a7336-2c6e529338amr6910895ad.26.1781731322053; Wed, 17
 Jun 2026 14:22:02 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:22:01 -0700
In-Reply-To: <ajKcDRqT5m069PXK@raptor>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260615155244.183044-1-alexandru.elisei@arm.com>
 <20260615160901.9A1A61F000E9@smtp.kernel.org> <ajA6ogaNiI3KDv5i@google.com> <ajKcDRqT5m069PXK@raptor>
Message-ID: <ajMP-cUia1I-sVAE@google.com>
Subject: Re: [RFC PATCH] KVM: Ignore MMU notifiers for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: sashiko-reviews@lists.linux.dev, Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Wed, Jun 17, 2026, Alexandru Elisei wrote:
> Hi Sean,
> 
> Thanks for the reply. Just to make sure, once the bugs have been iron out,
> you're ok with this idea?

Yes, I'm more than ok with this idea.  The only reason I didn't push to do this
right away is that I completely missed it :-)
