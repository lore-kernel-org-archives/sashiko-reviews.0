Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0732361656
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 18:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786039864; cv=none; b=Hrjo2na1DfSyqkJfiHB4BMz2W8VsCDz170VXY7+5VYyD4TUExxzLU+qnkQB1Q4L8uUWUo3SajoW3exzdeVxIm4c+bJovSzvhrdennbu8vi15CK90xUtkxXGZQsAdYiIFLy68ScACBdcCpWoXRtexIP0uHiKgTgMtfwOmL43hiq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786039864; c=relaxed/simple;
	bh=5LtdVhcoevxaYMFWpuGUrwt2xnJVWoRAhm65donaF0k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X+jeyB/VBh43o0Y4t6Qvam3shxxxhR6NdypudNMZGyJa8qAt6GmYMrtzxcUkxXw8dhY95DdNWLXl+K9JVZnvAT/yYNIkSxPym4UuMJodtjXkszVM1Jep6rNgYTl3QRhtGxPIcNTYMUg66EfhMKw9QWQas0Uul/vPEnqX2zpsNgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CAMhkjNz; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CAMhkjNz"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so4171818b3a.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 06 Aug 2026 11:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786039863; x=1786644663; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8NDXlvuU5iaMcvHK7I7xV9onstvlMkGv+ggfJ4d2KnM=;
        b=CAMhkjNziJGbjeprpexr2erFUqXkYwpKADB/voj1aj/g1wGliLHVsJgmnr7BRj6AiI
         TJnaDCwCZYE5CmbUPM/Hs4Nob7LEmgE9xNNtG9vBT1IVEC5KhlwGq7VJsVhOIdq8soMN
         udqWdjYN5kg7uCJupgVFnhH1SKZKjlE/I213DGWCMEaV6ZCUs/7KCph2LgL4JYsJ7dhD
         k58qGAwQkvAWfeueIQWw5DqVCJGqOZl87Q6F6Yv5CS+toKLvBMrhrLyUmSYbwzT0y3EB
         r10uOcEcHsm5oWZ0EgNtMupAyCDyBH4hw5ZicN/Yupqk7Y17G+NcXTQgzBmlFeLYbI0/
         5/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786039863; x=1786644663;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8NDXlvuU5iaMcvHK7I7xV9onstvlMkGv+ggfJ4d2KnM=;
        b=m3AYorkyAm+cSOErSHpYWJAr7u5+Epgnnw4RT6tGn/FLJoTegBCRYAUtRc2+v2um+d
         oK8Y9NhnDTlwnC2Ki1zcDGq/F+kqzSVqoIgYLa8RIEV8HPd5+buxnjzO7EYHhJbPWNE5
         nFzFDxggrKv5wfBlOmiwcVGL/UrukNqTYW7tsK2xp6ujvAKszA2L9Kx55BTyFw1VlD/R
         OaENRMjDXyVLRZcZX6msvP13MWoRlxGknYltHyuo0l95TC+/dWzES8AbT1bTp75EW6lw
         9tkqczQFCXIg6yyPx5mnZfHAxZBnBUr7Z6xIsb6V6HunnyjDkX50t6wRhKduul2+WnfP
         OXIA==
X-Gm-Message-State: AOJu0YyfpX3e2irXM2bKw0zTN8j5o+teg8IRu/TQ3V8eyAqmSzrOKeV7
	3C1p68tsiwVUT6T6cEbgQ024mtvtY/lHrj808ayBGh3zeciGByWSZMH4Dux4wEtRJX1JeWGmYIP
	hBJFZ/g==
X-Received: from pgv15.prod.google.com ([2002:a63:154f:0:b0:c8f:f76a:4b22])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2295:b0:848:62ab:7b7
 with SMTP id d2e1a72fcca58-84f2e0402b9mr18010383b3a.16.1786039862668; Thu, 06
 Aug 2026 11:11:02 -0700 (PDT)
Date: Thu, 6 Aug 2026 11:11:02 -0700
In-Reply-To: <bbb2ad42d2ee3b2c20cfc31c3d58a9fecebb77e4.camel@amazon.co.uk>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260805195528.3853473-1-dwmw@amazon.co.uk> <20260805195528.3853473-4-dwmw@amazon.co.uk>
 <20260805203608.D3CA61F000E9@smtp.kernel.org> <anS8C4Cxqy6ehCo3@google.com> <bbb2ad42d2ee3b2c20cfc31c3d58a9fecebb77e4.camel@amazon.co.uk>
Message-ID: <anTONuMjSSD0CepY@google.com>
Subject: Re: [PATCH v3 3/7] KVM: pfncache: Use RCU for readers instead of a rwlock
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 06, 2026, David Woodhouse wrote:
> On Thu, 2026-08-06 at 09:53 -0700, Sean Christopherson wrote:
> > On Wed, Aug 05, 2026, sashiko-bot@kernel.org=C2=A0wrote:
> > > Replace the per-cache rwlock with RCU for the read side.
> >=20
> > I don't hate the idea, but I am very against using RCU.=C2=A0 Unless it=
's "impossible",
> > e.g. because synchronize_srcu() allocates memory and breaks OOM kill, I=
 would
> > strongly prefer to use SRCU, probably with a dedicated kvm->gpc_srcu, s=
o that
> > synchronization doesn't need to wait on all CPUs in the system.=C2=A0 T=
he tail latencies
> > for synchronize_rcu() are horrendous, especially for many-CPU systems.=
=C2=A0 If it
> > were only mmu_notifiers that got hit, it miiiight be acceptable, but si=
nce this
> > will affect vCPU tasks in the refresh() path as well, normal RCU is pre=
tty much
> > a non-starter.
>=20
> Yeah, the refresh() path got pretty slow in my first attempt, before
> optimising that *not* to have a grace period if the memslot generation
> changed but the actual GPA=E2=86=92uHVA (and memslot) don't *change*.
>=20
> > Even SRCU could be problematic: if synchronize_srcu_expedited() is forc=
ed to wait,
> > the wait time can easily get to 20+ milliseconds, which again is a non-=
starter for
> > things like steal-time updates and nVMX pages.
>=20
> But we don't have to synchronize from the read side. The code path
> which will do so most often is gfn_to_pfn_cache_invalidate_start(). And
> the refresh() path which is already the fallback slow path which can slee=
p.

It's probably a slow path for all current users, but it definitely won't be=
 a slow
path for nested virtualization, because a refresh() will be required any ti=
me the
GPA changes, i.e. any time the vCPU runs a different vmc{b,c}12.  That's wh=
y I
think we should treat GPCs that are strictly bound to a vCPU differently.
