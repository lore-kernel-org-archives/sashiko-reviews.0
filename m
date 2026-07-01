Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E0E2C11CA
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 20:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939299; cv=none; b=fN0lo4L3ls8UHSu3kj7lqzT7hug7Opv4tCEQPKTsu106quSmBiiWw3BuZIdT+VlkuxU1oTpiHjhn+OkhAUmfg1iq2YmkjjWR/PDPciz8C6Dp9Q8baeEej4blrsSV1pkTUqT3M1ypxQaIhYRAhBG1NgUMvxX4mUGfwHEBebmFDiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939299; c=relaxed/simple;
	bh=vrG7DV3XMjvehaBvAHY3d6fzypEbpc6iWjoNWIjk38c=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WFqxcYApFLvp6jH+XqKPM2NbQsbui1G+aif+0p7qSPIYF9PL+hkrS6kwXdyEfAbxaAe1WLIZRMw+mHCZp/kj7CjH9MBH07q+gfcCuQKWtp+rMpDvEQvS6UDbs2J4osegD15U1/+7B1cuD9IrSxg/ZJtTOFWYHwZe1mmmscFjPSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a8YbOkLL; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a8YbOkLL"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-8478947e047so1009429b3a.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 13:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782939297; x=1783544097; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0jRX7NnLp+Ssuusck8PUjzqP7NAa84Kcqnt+k1PSlo=;
        b=a8YbOkLLHtawtjiifuH8XYpbir24Rbf80V6htwGA00uu9g/zwXpEktjInF7ujK69M8
         zO0XYoseZs2/xrvPTFSFGsjNLTCyMmKYljOK+GSq3oQt89QAmfNgUVd90o0S7CTwBmWp
         jMMVVkQbJfcfxeJhUariTMoVvElCNG2rf6sPl4pX1GFCT6FX5PHfOXd5WUKVyeMtO2pG
         JA7MkJBJ4bSaBNoqJQkgFLIJGL1Wy0WDW4plv9W9jtB55vnPEJn/cHa1FVpUhknpjfqr
         jnhK1MfrURp2hgFtabaZZwyyfFl167MW17d2nM9zHfyhOqheg9xyojJIKwvnLFmFSpZp
         TioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782939297; x=1783544097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0jRX7NnLp+Ssuusck8PUjzqP7NAa84Kcqnt+k1PSlo=;
        b=GFzvWEHPfP7BjO056NC0jzrJe0i1UyhmHpqlmcMz8ULotG/enGzYysoYQdejKhCO8f
         u/R3/76hemOsQIxEuuVYKoT/u1YrEfYFLrIUC9u3CDmNBY4ItZ3vjCRcuaTlUBRkq1HD
         8fk+hBqWOP+wouDC8S+6mA4XJVeobENv5KWmF9CbUoTYwFLylfe8mIyLJfHQE1eNfEk9
         IzGR5l5uQGuVnZfTbcaWTZJzpYT64cvLXY/HOWT9Aq6mTVtCLnP9I4sgx9upa7S53HjF
         EFUhrSgZhCnjPJVnocaUA+PU0OtK+4XhhDq+AuzYS06XTqZxITTiIA6qOU+YH+5DVyVh
         ciTg==
X-Gm-Message-State: AOJu0YyNM0a6m1352WFf27pz6Q/aTVnCIHD/QC+zL7Dp31ZSabFNIwLQ
	DAqOdSaEq8BTxalcjkigzDNnuIzBisedIosTb4zHic8X6bbfcTssmpvYoGxZs31pcbhRw5WR1HM
	Ym5hPOA==
X-Received: from pfwp10.prod.google.com ([2002:a05:6a00:26ca:b0:847:a740:48f4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:27ac:b0:842:2ae0:968d
 with SMTP id d2e1a72fcca58-847c098651fmr2693616b3a.32.1782939296527; Wed, 01
 Jul 2026 13:54:56 -0700 (PDT)
Date: Wed, 1 Jul 2026 13:54:55 -0700
In-Reply-To: <CAEvNRgHt1F28iDegRxtYDfy95iQysLkFW=7YPruwky_stf5TLA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260630213711.479692-1-seanjc@google.com> <20260630213711.479692-3-seanjc@google.com>
 <20260630214952.98C851F000E9@smtp.kernel.org> <CAEvNRgHt1F28iDegRxtYDfy95iQysLkFW=7YPruwky_stf5TLA@mail.gmail.com>
Message-ID: <akV-ny84UPMpsnez@google.com>
Subject: Re: [PATCH v2 2/2] KVM: TDX: Return EINVAL, not EOPNOTSUPP, for NULL
 INIT_MEM_REGION source
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Jul 01, 2026, Ackerley Tng wrote:
> sashiko-bot@kernel.org writes:
> 
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] The `region.nr_pages << PAGE_SHIFT` calculation can overflow a 64-bit integer, bypassing GPA boundary validation and leading to a host denial of service.
> > --
> >
> > commit a54da29c3e4be3226e4ebf9df2f4182c350df998
> > Author: Sean Christopherson <seanjc@google.com>
> >
> > KVM: TDX: Return EINVAL, not EOPNOTSUPP, for NULL INIT_MEM_REGION source
> >
> > Return EINVAL instead of EOPNOTSUPP if userspace attempts to pass a NULL
> > pointer for the source page of INIT_MEM_REGION, so that KVM's ABI is
> > consistent between TDX and SNP.
> >
> >> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> >> index ffe9d0db58c59..b0ec054732b90 100644
> >> --- a/arch/x86/kvm/vmx/tdx.c
> >> +++ b/arch/x86/kvm/vmx/tdx.c
> >
> > [ ... ]
> >
> >> @@ -3247,8 +3244,8 @@ static int tdx_vcpu_init_mem_region(struct kvm_vcpu *vcpu, struct kvm_tdx_cmd *c
> >>  	if (copy_from_user(&region, u64_to_user_ptr(cmd->data), sizeof(region)))
> >>  		return -EFAULT;
> >>
> >> -	if (!PAGE_ALIGNED(region.source_addr) || !PAGE_ALIGNED(region.gpa) ||
> >> -	    !region.nr_pages ||
> >> +	if (!PAGE_ALIGNED(region.source_addr) || !region.source_addr ||
> 
> Since we're changing this, how about separating/grouping conditions so
> that adding validation is clearly different from alignment changes?
> Perhaps like
> 
>     if (!region.source_addr)
> 	return -EINVAL;
> 
>     if (!PAGE_ALIGNED(region.source_addr) || !PAGE_ALIGNED(region.gpa))
> 	return -EINVAL;

I'd rather not do that as part of this patch.  I'm not opposed to refactoring
this code, but I don't want to make the diff harder to read by throwing in
non-trivial changes.

> And this one might need more code if we're fixing the issue Sashiko
> pointed out.
> 
>     if (overflow)
> 	return -EINVAL;
> 
> >> +	    !PAGE_ALIGNED(region.gpa) || !region.nr_pages ||
> 
> Looking at this again, why should region.nr_pages == 0 be -EINVAL? Why
> not do an early exit and return 0?

Because nr_pages == 0 is nonsensical.  And as a general rule, don't return success
for uAPI unless it's necessary, because it's much, much harder to extend
functionality if a path can succeed than if a path is guaranteed to fail.

E.g. very hypothetically, if we want to repurpose '0' to mean "delete this page"
or something, then returning -EINVAL now provides a more viable route to supporting
such an operation.
