Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44341419A4
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 01:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784855720; cv=none; b=fSQe+dlpcqTqKZGA/4BlO7FxHE3IL7F4iFW0Z0EfGlHU0rj/CU3zQpASIGKcjOCyeCtz6JL1m2ImdP2+ulO4IXfwv0fgAf+X/hqDnRdoTeQi5yxAxM9/5SyWZMtRHS4VhCvWlTCMynIhmOgcJcNOEO5v3gAbsdr7l0/rfli9L9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784855720; c=relaxed/simple;
	bh=gukJnQ/fidrxu6I2IMO9Xl5r2VkEX+ATv+e1LpUZl1g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q26aaft6pFgAOkOstpphFfVgrAiS2lR8SWyaBCDcEIIvghCiIuFd00W+tN8x/0UWzSgixGQ6iiYhiLt9xyxtdrRe7ChqiwA2sN/+3biuMRk4Dy5TWuoQ6K0QRRAQmW3wjAf22efsItvpf8Z6yRsJaRT96EtAs27YJ+qsR29v1pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e4iGoPe3; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e4iGoPe3"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cceabd70f5so33829545ad.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 18:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784855718; x=1785460518; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTzG3eWbWHLelTuypq5zycVXMDqGngOZQFBOY8+dasM=;
        b=e4iGoPe38OJfbV68rHlKCLtdkph9cG8J+icp1oNhbNMFaxx6SvIPubC+6hYkU0XxC/
         YyOnE8vFLNyxFdVMKHiNaslm/rcxGL2G9eRrDXB24yLsdlMSlDKm88Q97JmxF4vd7Aat
         VulNjVwXckRHFiadLOOHrj9MipFIpt0GMkwAD/HTXvoRMcNuAIuYqSMiqnzDS79lA06d
         flwjZEWjcZ1GICk23dHi9sZw095aR9FDun1gEGwqReGS7/x5VnM8U1+YmSlwY51ncj92
         Gu+ner49TFJBXNK5iuiVr8GteAa41HZr88OuMizvZN9327u0SNOYoPTLhZu8v4O2ZQpQ
         oGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784855718; x=1785460518;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTzG3eWbWHLelTuypq5zycVXMDqGngOZQFBOY8+dasM=;
        b=Q4BxXmSCcZMgWq4pVQGAAULipFeGH5dTqU7i7j2d2PPvMRXjRCB0P1hG63PitmZEA6
         cuG+3ebk6yguDf5Uw6JmjexN7+GkwkLi3wqWLqDBOZipTqTInolDVqZKuAAyzTwIbs7l
         YuxEoB415Y7QqJEuJrZtsp1DtP8woGjWEvkCOQ0EPPil9VJDT9KomcBOrGbslOVxbGvA
         kbAvntAMGP1DvBJiMxAnJS8XUSF52oEx8NC60rpRooru/7egRBEAFdpDGrhOkyKCdW10
         1qE/tt8Uc4JcGKX+olGuBxHJtEzjblbI4YT/FeiQO/MoFR6E232krWW3dvPTvWaV16sx
         Bstw==
X-Gm-Message-State: AOJu0Yy+4bJ9WP2wwTNcj38hMJg7B5cZoazhqMFyNz4NRGbgB+k9FqdG
	R3ASiKa7MInE/qAbgQoBWK1uT2Genr8jVXQrvuXXuDHo9QBf7ce59uhj4nG/7/JIjdo34W+I9cw
	zQKU663F76yXjjKcvyQrZlX4tc+l/aC7SxfuRhNsSLUPHWdhlnmTwPU4xQLvhEFzgxMG/6LgzDT
	0bgM+rGEHZ+rM2EJ1RmryZiuoWZRI3oNOyKqUgmRauQRzIoaXC
X-Received: from plhe2.prod.google.com ([2002:a17:903:1c2:b0:2c9:a5a0:a677])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3508:b0:2ca:61bc:317c
 with SMTP id d9443c01a7336-2cfa71d8e4amr64163005ad.13.1784855717861; Thu, 23
 Jul 2026 18:15:17 -0700 (PDT)
Date: Thu, 23 Jul 2026 18:15:17 -0700
In-Reply-To: <20260724010336.16FCF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260724004757.131420-1-seanjc@google.com> <20260724004757.131420-6-seanjc@google.com>
 <20260724010336.16FCF1F000E9@smtp.kernel.org>
Message-ID: <amK8pbPT4i4GswBk@google.com>
Subject: Re: [PATCH 5/6] KVM: PPC: Use CLASS(kvm_vcpu_map_local_readonly) for
 patching dcbz
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Jul 24, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] The commit title claims to use
> `CLASS(kvm_vcpu_map_local_readonly)`, but the code uses the writable variant
> `CLASS(kvm_vcpu_map_local)`.

Gah, copy+paste fail.

> - [Low] The local variable `r` is declared but never used after the refactoring.

I'll fixup both of these when applying, assuming nothing else needs to be fixed
in the series.  Otherwise I'll address them in v2.
