Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B031538DC66
	for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 18:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791252; cv=none; b=GMsdyD8pD01w2AEpnSsZta52our1u24oiMsMo3MswhneE6r/fcFO0K3MDx5VrjY92xe/tGFnbyk2LmZZOi0TokBPnpG4HcnunJiwwMSx72w1EtBKdoeAwN8N+2NzP6xEJ1+paYzUj6pdRsxBsFwzfOsLepi62qTSk+Zu3/YqHt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791252; c=relaxed/simple;
	bh=kKJwxmQYGEh4yRpyp3saGtgW5y+BMbbEt6Y9VT7jroM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OemahWnRml91YwTMYGuFoJVAs2KKuMo1R55TeQBuhnhRK7aa1rMgpzzA5ji63kpr9Uu7p38zAzxNIrvtUYtWUMHy8sQJXfuKsNyiReYuHf7xsAW2ZJLFq1wuq1qfbTmE2np9qK0CBAK3+dYO1+ET9WMuSnPKQqSmZC2qOykfJfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vQ85tIZK; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vQ85tIZK"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc795ad1f5aso3180083a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 30 Sep 2026 11:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790791250; x=1791396050; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yi4wlBHO1Ds0bd9dYrKHwvi8qQBb7k8RirKZz6DIk1E=;
        b=vQ85tIZK4A/3JSSEmbmdpJLEI9zSkrSHgAAxmz3baG+XUmvmmb4qR9/geLjzF4kjOE
         JKuVzs72Fl22OXC+pV/h6Dh6OapsdEKIkS9MxBcj/iKPwlteKKnUkE90o8450WwN25HJ
         85/d1VhGkdzxpw3lZE4UuiTXQiUYhO5iClW8OJdVZYmpThs1oKhnZyuwmL2AtQLz/VT6
         KotqCafnKXh2NEDy6TC7fJJZ9ndrywZPU7GjF6vQLen2vbSnULgATPNCq5JKnOb194tb
         8Wbm0VAbyUgPVfIm2gx7SrCC6w49ao74oqbJC1N8Osc83D79+tVeKEyxM9PXDDw65QxV
         Y0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790791250; x=1791396050;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yi4wlBHO1Ds0bd9dYrKHwvi8qQBb7k8RirKZz6DIk1E=;
        b=ErszL2SqbPEEyGdK97vgVIo6UEpgCFMsk0N5W+SBY8WWxk1AQHoZQzv5YrO6iLxzyT
         Fg/CE18anIjM3xeKAV1EMuL9q/JUKrFsGZ/nnhc9CTryLByBlhYpti3wEjKzAXDx2WF5
         mMl0FAIwiC2ys71FUK/4Kj6Xsf8ja1rQ5dhN4VKWjKcwRUnvrp4WL7bh4+2JW9hfxhwP
         BfKN9nUkza+fSNF36WsUjxos8sswV5JQBgZhRA1V4C30tp7t7gFIhz2qMyK9ghEdVhA4
         YHBnZRqoGGQuFgnhLm3s0oOglv0t2n7G2jR6pdSCCIYWmp39IW+wPT6RHJ3slenAoyTg
         1WiQ==
X-Gm-Message-State: AFuF++nmTY9nmuqPzYPV+2PUW6PkR++DQFJWjAJh0Rp8LH5Z7sr8+LoT
	oDNaEq5KFHNDQnmwuMNflOqWTBBcohyLq9nQZrYDNBt5a8sNhGz9YDOiV2ZOQXCx++KR2PAKdxg
	WCOutfDzqF5yrB2MdLw/8P0XRNmCGPDKhn54/VHaiFeF1hbEb4WzOaiC3hhw7qdhmB8t0z5avNQ
	ONMFIokmYiePzMJx5NL0FUTh5f8agoCEm138fVgWzVSH9LWojc
X-Received: from pgbcp9.prod.google.com ([2002:a05:6a02:4009:b0:cc7:ad09:94ae])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a124:b0:3de:138f:a9b3
 with SMTP id adf61e73a8af0-3de9e6e4ddemr2262862637.24.1790791249278; Wed, 30
 Sep 2026 11:00:49 -0700 (PDT)
Date: Wed, 30 Sep 2026 11:00:48 -0700
In-Reply-To: <20260930174504.7738F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260930173635.3362655-1-seanjc@google.com> <20260930173635.3362655-9-seanjc@google.com>
 <20260930174504.7738F1F00898@smtp.kernel.org>
Message-ID: <ar1OUAyYks_n1NJM@google.com>
Subject: Re: [PATCH v3 08/21] KVM: selftests: Rename TSC freq checkers in
 nested TSC scaling test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 30, 2026, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > diff --git a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
> > index 84312146e93f6..e5fc4c9bb9f9b 100644
> > --- a/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
> > +++ b/tools/testing/selftests/kvm/x86/nested_tsc_scaling_test.c
> 
> [ ... ]
> 
> > @@ -45,7 +45,7 @@ static void compare_tsc_freq(u64 actual, u64 expected)
> >  		    actual, thresh_low, thresh_high);
> >  }
> >  
> > -static void check_tsc_freq(int level)
> > +static void guest_check_tsc_freq(int level)
> 
> [Severity: Low]
> The commit message states the goal is to make it more obvious that the host
> version *checks* the result and asserts on errors. However, renaming the
> guest helper to guest_check_tsc_freq implies it also performs validation,
> whereas it merely measures the frequency and invokes GUEST_CHECK() to pass
> the value back to the host for verification.
> 
> Would a name like guest_measure_tsc_freq be more semantically accurate
> given the commit's stated intent?

No, because hopefully humans will understand that even though the check is
ultimately performed by the host, guest_check_tsc_freq() really does check the
guest's observed frequency.
