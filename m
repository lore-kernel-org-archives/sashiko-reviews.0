Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B033F9F21
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 22:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780093717; cv=none; b=dMCfSnl/8xFoIeNJletEpO2+qIl+vEew+m4K4baQd1t7VDeKJhhSN7U51FB9TrIgspeh8HMqWz00yFb87+hQVyQ4UkA8LQn/La8J3IjXQM6yynXxgBX90mhnpdr0aqdHXAvGp1QREFvxGZmJzr6facI5yzqdzq5OQ4+lrlblXa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780093717; c=relaxed/simple;
	bh=VbnVXTEYv+JqDUa0Q19zWIbV7AepmZ6eJ3qhtJI8NKI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K1mT7PkAO43wp38X/FKlsHzeAWVemUKcBBV6UGrIRqNkH2mEyPODJVCD+Hph+EmtvwE9Ix3bGANU8vVFOhuiKLYQqnMvFL+oVcS5S0XuI9FrHvyASaCYT7kS71vU+ZGlq1HFYChEZtz8qS7ihLzI20lcQyl5F1YnkkSXiJxYxD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ItJs7r1P; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ItJs7r1P"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2bfdd99f6b7so3357105ad.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 15:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780093716; x=1780698516; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UyvYYju/kOsku7tj1RfdIRz11t6+0rPHfTSkECF0MAQ=;
        b=ItJs7r1P/yb3ku7C8MBfNWsOC4dXb155p2x3WL1kaIWQs9oliUe2rCP6/uXYrSOcJV
         xHGqKe8KXXj47sB/w4gvO7pzrZqdZlz0L0XlUN19/fFaTwDao9YWNeAgrcPj0T4/Jfh5
         EE4bOGBdYBFvw4SvypzvPOJxE7VTX6zYe9M+JZzduHFDc09NBlvtAY6wOdYzA0bdOSZG
         6uFoC0utK0zowf1/F9SPt+srHtcsRxJV3gfjXZanwOKSHlC1rseHuEj4eyGIuKyF7ohz
         5//EC+Bpq5YwkNg3xZXbTcDyZLzBuY4otLc8BONqqEjDVkNaxjzaZVDAG8Px+y7quhXr
         /FSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780093716; x=1780698516;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UyvYYju/kOsku7tj1RfdIRz11t6+0rPHfTSkECF0MAQ=;
        b=PA9mV62lfL7sS8eI4irdMvfXKPtWnkxCvCrhz8favrGIIxTSKBkTv2feapjqqU8bAR
         YWWJxo5vwy5HG7aAnBCM9Xp1aow1JE7JeyyDKi2yPBWwjTaPZJN+0g/rwprlMlfU1WhY
         pkYZL/+SpCq4yRvtHnFYMkJGMcBzqdq6S1kDRBn4pjdpljSLoUPajCWH1LHJDug/w5Wc
         j4cEQniu15PECNzh15y/9/oTfBYqVYE+21tntUPbrk20Wy6IbDWK0+eWMtT6IEis1urd
         1djgER78mLPRB2cM8EMhPQ7Aw3vsyq9VE3eEueLQ3W3x1BQJj/rOOoIo0aUXOHGrf6Xw
         eraQ==
X-Gm-Message-State: AOJu0YyHB9xoLbBi5BghSXnQDt5qXYFJDNF3aRcwVKxLDQfu6X5YO4BU
	jd5Xrv5owalrDzXRdJDrAGPc4E0hXuWEN91Dxgnda3mB3B4zidT7/Ej56zqrrNWYcQUzxpURLDh
	N5LqfxQ==
X-Received: from plgo6.prod.google.com ([2002:a17:902:d4c6:b0:2bd:55dc:a132])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e54c:b0:2ba:4e84:966
 with SMTP id d9443c01a7336-2bf368ad611mr19077965ad.36.1780093715569; Fri, 29
 May 2026 15:28:35 -0700 (PDT)
Date: Fri, 29 May 2026 15:28:34 -0700
In-Reply-To: <709d9ca6-59bb-4f82-b48a-0aa67a4d6ba2@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260528-sev_snp_fixes-v1-1-d67a08151779@meta.com>
 <20260528235151.9E59E1F000E9@smtp.kernel.org> <709d9ca6-59bb-4f82-b48a-0aa67a4d6ba2@linux.dev>
Message-ID: <ahoTEgTSVcEmUMvM@google.com>
Subject: Re: [PATCH 1/2] KVM: SEV: Do not allow SEV-SNP VMs from intra-host migration
From: Sean Christopherson <seanjc@google.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 29, 2026, Atish Patra wrote:
> > Because the mirror's vmsa_features is zero, KVM treats the mirror VM as a
> > standard SEV-ES VM (since ____sev_snp_guest() will evaluate to false).
> > 
> > When vCPUs are created for the mirror VM, KVM allocates standard SEV-ES
> > VMSAs and fails to perform SNP-specific initialization, such as registering
> > the VMSA pages in the RMP via SEV_CMD_SNP_LAUNCH_UPDATE.
> > 
> > When KVM executes VMRUN for the mirror VM's vCPU, the hardware evaluates an
> > ASID bound to SNP execution using an invalid, non-RMP-registered VMSA page.
> > Will this trigger an RMP #NPF (Nested Page Fault) on the host hypervisor,
> > leading to an unhandled hypervisor crash and denial of service?
> 
> Nice catch! I don't think it will lead to hypervisor crash though. As per my
> understanding, the fault on VMSA page would be sent to user space and just a
> VM instance will crash which is not that critical.

RMP #PFs on the VMSA will typically crash the host.  In this case, I would
expect VMRUN to fault, which would trigger the BUG_ON() in kvm_spurious_fault().
So assuming the "bad" VM can get far enough along to attempt VMRUN, this is
likely fatal.

> Having said that, we should close the gap for such mistakes from VMM side
> though by rejecting mirroring of sev-snp VMs. I will add a patch and update
> the migration kselftest as well for sanity checking.
> 
> > >   		ret = -EINVAL;
> > >   		goto out_unlock;
> > >   	}
