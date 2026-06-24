Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D1F34846A
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 17:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782322371; cv=none; b=HbRX7KJz3s4zl0kBd9rz7DO5kLx+YGqdA6BdKxQXOp16tSTtcKkAPtm3dLLNgv3Up3C8cRJ98zGjXP0fPvZpdASR4K+/qjQUsyLlg+0VxYtOMcryNVRBnPzglrzBdPizdym0WkoI29nQWfCsv4WkyX01sE84gwyecO6iP4LCFM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782322371; c=relaxed/simple;
	bh=iikYRdViwRtzh9V9/K4oM7wLc4TMqwuuo3WzFq6sMBI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TLTpFKRAOnhRjbfl8DTwMKNQlTa5E3o/C8F63lai+LcqJDyn4QPTyA+Nh4SMIviPA7kcozgoS57TOgceaQHfQMd2p8El/rJwgd3eGAPnLK3wxwBaFsHLDmJpIAVVan+w2mHBM70i9Zp6/SZ8u8mtB+LBsCh3ZNxxEFj6lxO2FM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YV0alfNh; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YV0alfNh"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-84238e83851so990930b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 10:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782322370; x=1782927170; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NuCvG+ANEtYYDDfdrUYBmspYw8vstGpW69KsCXQmcQ4=;
        b=YV0alfNhH2idIGNgU+GJmWeaOU6BJ2tyC7fYARTn6fW1IWCiZ4IexUUA/hpM+S9hMk
         rq1spdbDZ/hQ6KZJURLXd4Evq86syFhP6ihP4yh8U8qLy7qnDIbbc1z1BRoKJkuM0+LS
         oScPDP4vyt2DDb8RFs8cT/jDqe6E5rBTN+inNcq6Qqf0sRymsdBQVOm7ZvnZqw42BF1s
         s2FNvCsFc2y/5fFArgUgGVusUPH583ujVoUBb9lo0CeXyHeQtl++58SnYNIC9RK08FO+
         o3NArCoDJBXY5rs04DVUo5O0XTL3XvyMub0jlzZHmVGr4xVuvdqQd+EVf6+bT2wAmVVf
         4isg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782322370; x=1782927170;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NuCvG+ANEtYYDDfdrUYBmspYw8vstGpW69KsCXQmcQ4=;
        b=cYNsxEESLHEkfGhMZYV8SxmNbOBd1d1Mq6dKk9W3YUpy3Wdp5mUhLrVMCBkpHDRaJq
         4YMreDIQhXYaWVyVh41v2rsUYxJxy8SlLEblzoA4bn74Emn16zbVah7k4en3mQj9fooh
         +B9wIkGYl6KLAGB5fPiOpPHP3xlnvTaSTM4cwWtI5L+LjZVmZGi653ARgv40pCmXYDsF
         PRk+VR+s5RRcWxbm7CdNuQM82YQuY0nNbqRK5HMoFS27vkbzcdkfWLdD1U+qtGkqH73+
         /cj/5sp58seZ+1J5fS721F63AOTxOZsuKSQZUlreHamZvLqxvPmTOWxp8NKa7Ke8kuEp
         M/Sw==
X-Forwarded-Encrypted: i=1; AFNElJ88+QcpPtncnHI39QEYeriLSbd8E++8eeb0q+67ymzkiTUShfXiKT+7aJ/gaF1c/ARJ1/7MzPqadJFgmCf6SEk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFtEI28mmusCVx+vmznmFCFHdbdVUaHPyv3EuLmjfSDKgeD+2o
	rp/nyo5zorYhv/okPEvDACAAbbDb3sHrBNyWE15pbIMir20CHvQ+IAK/MiDuhS6d+87uAOWbce7
	z6mZL0Q==
X-Received: from pfih1.prod.google.com ([2002:a05:6a00:2181:b0:842:9550:318a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:450f:b0:83a:ebec:452f
 with SMTP id d2e1a72fcca58-845a28d4650mr5767948b3a.42.1782322369734; Wed, 24
 Jun 2026 10:32:49 -0700 (PDT)
Date: Wed, 24 Jun 2026 10:32:49 -0700
In-Reply-To: <CAEvNRgE9cLfjDbXuR5wq3fEWZyHxYPxdExxNjXUFO1nT5m==1A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260615155244.183044-1-alexandru.elisei@arm.com>
 <20260615160901.9A1A61F000E9@smtp.kernel.org> <ajA6ogaNiI3KDv5i@google.com>
 <ajKcDRqT5m069PXK@raptor> <ajMPvgA2eHQCj-B0@google.com> <CAEvNRgE9cLfjDbXuR5wq3fEWZyHxYPxdExxNjXUFO1nT5m==1A@mail.gmail.com>
Message-ID: <ajwUwX2xIOLjACh0@google.com>
Subject: Re: [RFC PATCH] KVM: Ignore MMU notifiers for guest_memfd-only memslots
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>, sashiko-reviews@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 23, 2026, Ackerley Tng wrote:
> Sean Christopherson <seanjc@google.com> writes:
> > and purposes, we're conceptually treating conversions as free()+re-alloc().  So
> > while the page might still be in the page cache, it's effectively been "freed".
> > So in that case, KVM really does need to ensure it handles mmu_notifier events
> > correctly to avoid UAF.
> 
> Just making sure: "handle mmu_notifier events" here refers to
> gfn_to_pfn_cache and other parts of KVM that works with memory.

Yes. 

> There's no issue with a UAF between mmu_notifier invalidations and
> conversions, right?

Right.
