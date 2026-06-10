Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F45E3955CA
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 20:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781122504; cv=none; b=LNrrTgWuxiJkK642IpeSgg1rHnJXSh7lHeCr6CzBN87OIf8pnkXxbrsMbI9pooXyaNcdkMT00YFR7voU3WzRxYsoz8bgZ4yzkiUD3bJkJIXVabRy5CbMgidV2sWpQi5I/olMFsxwfBb6bc7CteSNBuXr5YKhDYcHJwoOPXHzeSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781122504; c=relaxed/simple;
	bh=0/TGp3mL/zf8reME5kYkhYaPhOH91jl/0E7euIeuEBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rEYBF0gNsoP+BqiqCtWAJCltVkydRtdZ99F9UgkcpLIaxQffVoSla8qvvPzj55EXHALCRIi9FTmxnxIN5KbbZiDyzuVMj1JMi9OB/ngElfqj+D5jQ0HEKwvV62GNrOpo9gAYYrQbTwcXLb74JUbp8MCrYFh7q6Ak7terinVrB+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vyl3434U; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vyl3434U"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8423f1e2f8eso5552756b3a.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 13:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781122503; x=1781727303; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xNT9caAsP3Naf8qE0f2/dE5BKFFF9+5h248zDPqxkMc=;
        b=vyl3434UNLCePyS6L3lVbdROgnYnOm7qKcadBU6piu/aygZEcw+v3CHGhX0GOsFUf2
         jbHTFx+0a50enezJxB6KxxZereASxqK8tAnAZWb6GrxIvYlMTUakDlXmMcCbhDiMQ1KP
         M8WBKmRbZjfBbzfnq9MyPaywftW4NQmHpwe+7uhS/eDk4yLspYoSfhdXRYqvKS7Zp9jV
         HHTpsOr8yevyerK6NdV7Hp8dOEmUhHNbVUBI1rxbdUIHCxOoKbZOB3+W2xWMnAmdF3dW
         RjkpOqytSrjXeMQR6I8lOFcSjRacwlAQm00OePzLGc/6foRDbX5AMgZNEpQTzGdWMraz
         xJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781122503; x=1781727303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xNT9caAsP3Naf8qE0f2/dE5BKFFF9+5h248zDPqxkMc=;
        b=bN8dPJ3bvhPd47yWWUcclbDm5Zf/AyrUWqjGF3im2xI3AwxoWUSIlUM9nOamsNIpQF
         DlMagXobJYgER3zdOcgFV9Vis8Z9I6uQxj9aWg8kUKKMWHpjBPowadwOj2tRKVJ73Jur
         5KLmEcd586ojEDZ9AoQg9vJfVo0RAr4HJwCwNtFMAAiNRXiH7T0dvMnjMEk2IZpU1zCo
         afHi9EpiekN1yyCypKM6EK8TDuQx2OjMIXVOf6KkHy8hHqGK9gv3RD1uuoxJIB2GnDwA
         0e1aueo1X3sTaQsPYmI4kgKuAicSpggfcDWu8QDLdiVx+1a4WW2b4pVuQJUvwQmgNsjs
         E9Dg==
X-Gm-Message-State: AOJu0YzNXMl+kAuHqvyCGj3uaeBSe7xcFWsJZfQyEDjEdtlAzK7Gk9F7
	EU0vjDHMjXPKK01BoRKl9Ea4EYeXDpXmrNKSZAfL6BOAqWqzIjrbEE6sy+m+SbSJWA==
X-Gm-Gg: Acq92OE4qDJAFwJPJ1WrH+7XoeuNaxmBOwBqTcyJ8GDlNYIRE3gVbWPPMWUHh5Eqs0r
	AKadkqwPeA+McGMXoqdt1jpdhi0xFGAS9irdCts1RyTGvj/Ko2hGZ6/a3jnorVr7VTUzOkjkxlv
	b+msXiKz+r0M3/dVUe72ztKmC24koU4buhzVD60hvfP3vG7U2EhjPp5uhwiujfzE9Tj67IPTElk
	X0NkmBFcWBlqV2J9vM92CanajZXRPaxE0+f5E9AgV0HHK8HczapGjF5l+84ymVjjBfkUQspPOy4
	Ezsu3mSfWgeoWLi042iMbjj1kItxSF4DqRapfsXVcWl+tGR8uhFFtqSKUQ93z5kVoEoC4nsCElH
	r1ILZhbRxqon/8jcokvX6tDkLVpANGU27L2WALgBJKf1JxF5lBcNizQUownRocPCIJ9qWyB9ksS
	d4vtJcUsjNLkW43SMk8CAe27WfeWVZm67jw1OV2AxKLZfYJoBRiJ7rK1E/EX9MjDI03M3nwLh5
X-Received: by 2002:a05:6a00:b90b:b0:82f:280a:d888 with SMTP id d2e1a72fcca58-842b0db894cmr26207134b3a.12.1781122502162;
        Wed, 10 Jun 2026 13:15:02 -0700 (PDT)
Received: from google.com (56.149.168.34.bc.googleusercontent.com. [34.168.149.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828e21c8sm30824970b3a.49.2026.06.10.13.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 13:15:01 -0700 (PDT)
Date: Wed, 10 Jun 2026 20:14:57 +0000
From: David Matlack <dmatlack@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org,
	Josh Hilke <jrhilke@google.com>
Subject: Re: [PATCH v6 01/18] KVM: selftests: Build and link
 selftests/vfio/lib into KVM selftests
Message-ID: <ainFwSTb5-8itT9y@google.com>
References: <20260610005338.2967132-2-seanjc@google.com>
 <20260610010314.DB8861F00893@smtp.kernel.org>
 <aim4lld49oqLrthg@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aim4lld49oqLrthg@google.com>

On 2026-06-10 12:18 PM, Sean Christopherson wrote:
> On Wed, Jun 10, 2026, sashiko-bot@kernel.org wrote:
> > > diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> > > index e0ddd3ff9472d..14316358fd9fb 100644
> > > --- a/tools/testing/selftests/kvm/Makefile.kvm
> > > +++ b/tools/testing/selftests/kvm/Makefile.kvm
> > > @@ -257,6 +257,7 @@ OVERRIDE_TARGETS = 1
> > >  # which causes the environment variable to override the makefile).
> > >  include ../lib.mk
> > >  include ../cgroup/lib/libcgroup.mk
> > > +include ../vfio/lib/libvfio.mk
> > 
> > [Severity: Low]
> > Does including libvfio.mk here break the "make clean all" sequence for KVM 
> > selftests?
> 
> David and/or Josh, can you verify whether Sashiko is hallucinating or has a
> legitimate concern?

That is a legitimate bug in libvfio.mk. Want me to send a separate patch
to fix (see below) or do you want to include as part of your series?

diff --git a/tools/testing/selftests/vfio/lib/libvfio.mk b/tools/testing/selftests/vfio/lib/libvfio.mk
index 9f47bceed16f..1f1ab180f42d 100644
--- a/tools/testing/selftests/vfio/lib/libvfio.mk
+++ b/tools/testing/selftests/vfio/lib/libvfio.mk
@@ -21,9 +21,12 @@ LIBVFIO_O := $(patsubst %.c, $(LIBVFIO_OUTPUT)/%.o, $(LIBVFIO_C))
 LIBVFIO_O_DIRS := $(shell dirname $(LIBVFIO_O) | uniq)
 $(shell mkdir -p $(LIBVFIO_O_DIRS))

+$(LIBVFIO_O_DIRS):
+       mkdir -p $@
+
 CFLAGS += -I$(LIBVFIO_SRCDIR)/include

-$(LIBVFIO_O): $(LIBVFIO_OUTPUT)/%.o : $(LIBVFIO_SRCDIR)/%.c
+$(LIBVFIO_O): $(LIBVFIO_OUTPUT)/%.o : $(LIBVFIO_SRCDIR)/%.c $(LIBVFIO_O_DIRS)
        $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@

 EXTRA_CLEAN += $(LIBVFIO_OUTPUT)

