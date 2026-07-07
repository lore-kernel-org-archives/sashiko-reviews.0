Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946B4314A6
	for <sashiko-reviews@lists.linux.dev>; Tue,  7 Jul 2026 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440200; cv=none; b=fApVg7im1K3CG3EC0aSo/4+PoX+xckyetNEaMzE98fH8JQ63ExhFpOHOzbaTuUq1hnCKVp4WZZ9HWpol6KBvHa8U4TQF2UMDJb3Bsv2JtLtAqMMEFuZNXK51nWYnJhVWJci9vwF8BS1GJ8uisi7OpKyMkwpTX8Mn0oHyUMstTAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440200; c=relaxed/simple;
	bh=MRwZ9no6SnLvgcrAWxdx1p+YVT0L0Ns9i5czUpMcAKY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bW91RcNK7Pj5LrTKTfFEJi+KSEK8DeedNHuQWsPCf2OjI+b8lvYOPCIn87J/w+iiCEvgoQjzcJQhHjCWXGz0C7tIp/nSC4kPEjYU1uKh7CNKOjfxmGizzlm7L1AIv86fFImSCus/b3JZ0ExFBohDsu+JjAmuUFTj0kdew3uDXGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OhAuo6IO; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OhAuo6IO"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c9e9cb6a44so37499715ad.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 07 Jul 2026 09:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783440199; x=1784044999; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pL69ZVdKR5D25APZYCYruCm0FglFMWTjtZf4734SenU=;
        b=OhAuo6IO4CgTUxhvwhlQshILnabynFUyO7UfOD5aED4ZA+ERjvuJXlEQ8lWIdGeimt
         x/P0lbjcNCsYa20UskrkmrICyRK2xiHVkcTipYyZPS/Sfi6xxeMv2IQT79nAEpcEYR75
         VusUTnY3aelOPnZAYk4u9lYc8dfwX2fwwvIFsO0AounlgA5IIEB/me1qv93sKDA5teOY
         OraaoFSO/S/eNIUpbVjg6UKiwSc5SkkCaJx1Ofztt1FbFQUBXDslaXj+WGA2+U5NPzYc
         sA7YW5htyrcKEwBtGfGVWcpgGG1zt0j9CQUBf5OxTFoXABRxL9Oq9OJbepfp/wWmszy0
         J0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783440199; x=1784044999;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pL69ZVdKR5D25APZYCYruCm0FglFMWTjtZf4734SenU=;
        b=NZggXEv3QNjoFnOaXUkuH6mlqZ2nfC13sf1/6vLnmbdBj6+xaODbuUkG4xlS6//qS9
         z1TPiXJTD/7MaI8f1nqheU4z8JWTKa0lodZRVOVt3HqwKOqmBYwor/9o+dp9BmCLpmEY
         RHHPmkFZFtObEjhpWiyZhm/YDPbu9mRKwWCbdN4czQOSqdIOU8MGFVW5iOL5Agq/7Emu
         uc5AtVnN92iVACG8DNz+qJ6AqxLTSHowy/Q5g0mOIi4r591jXm3h7Dh8/9aVNRuzSBoc
         Of04XNupVyf+TkMihBCQOpriN7WC/0PMZwQRZ0zPWLKjHtAIOe/N6xUXWuV60hYn7o5p
         hd1Q==
X-Gm-Message-State: AOJu0YxUvljOoy9V68yLUS3x9T+D5qKKPrF43Sxct7UCWjMiscrFHNFB
	Z38g8fmQVF4aGxSsqgov9fRQtcdMuBfemdzGDGQVbL93UqQafsIfktWPbyx/+JB2/NJmDliZTRN
	LALzVFgLhhLVIn7WLjfHGODFBIpXPz7Xs+X3t+mINTEWj4NVlhMOHCFcvfXInhGR+A4TXr9r01s
	yQud7/Wo1byPC6vm4xbwY65NO89bUmA2O33twp8RLQNqeqAiBW
X-Received: from plpk2.prod.google.com ([2002:a17:903:3da2:b0:2ca:c401:c941])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:3d0f:b0:2c9:b48c:fdde
 with SMTP id d9443c01a7336-2ccbf057775mr60146615ad.26.1783440198329; Tue, 07
 Jul 2026 09:03:18 -0700 (PDT)
Date: Tue, 7 Jul 2026 09:03:17 -0700
In-Reply-To: <20260707152105.8FE671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260707150706.1198541-1-seanjc@google.com> <20260707150706.1198541-2-seanjc@google.com>
 <20260707152105.8FE671F000E9@smtp.kernel.org>
Message-ID: <ak0jRanrFxDC8F0P@google.com>
Subject: Re: [PATCH v2 1/2] KVM: selftests: Drop superfluous use of pthread_attr_setaffinity_np()
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 07, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> > index 76fcdd1fd3cb4..a244bf9f701f7 100644
> > --- a/tools/testing/selftests/kvm/steal_time.c
> > +++ b/tools/testing/selftests/kvm/steal_time.c
> 
> [ ... ]
> 
> > @@ -558,7 +555,11 @@ int main(int ac, char **av)
> >  
> >  		/* Steal time from the VCPU. The steal time thread has the same CPU affinity as the VCPUs. */
> >  		run_delay = get_run_delay();
> > -		pthread_create(&thread, &attr, do_steal_time, NULL);
> > +		pthread_create(&thread, NULL, do_steal_time, NULL);
> > +		pthread_getaffinity_np(thread, sizeof(cpuset), &cpuset);
> 
> [Severity: Medium]
> Can this assertion spuriously pass if pthread_getaffinity_np() fails?

Yes, but that "flaw" is "fixed" in the next patch.  All in quotes because IMO
neither scenario is truly problematic.

> Because cpuset is not cleared before calling pthread_getaffinity_np() in
> main(), and the return value isn't checked, cpuset will retain its previous
> value if the call fails. This could happen if the child thread completes
> its execution before pthread_getaffinity_np() is called.

No, because the underlying kernel task is alive until pthread_join().

> Since cpuset was already populated with CPU 0 earlier in main(), the
> TEST_ASSERT would read the stale data and pass even if the thread did not
> inherit the affinity.
