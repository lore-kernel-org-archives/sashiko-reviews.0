Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62157368D55
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 20:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785531051; cv=none; b=gYNIu3nIhtSN0MYOngsrhsGFXamP8idOy82hcYOWM5aPIlSujjQ67WQ1szu+NTT+HagpZluldV6bjrpTeWHACpMc6eVc04OTcNltTZgDQuiUZQGdmMl8q5LM7taDdZS+tmbBKwn7KPQGhjJiKshvor6m+zUu6mYlN1O/UIDrjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785531051; c=relaxed/simple;
	bh=Hbhi6+KMjpxoERuBtIxFEqObdZKUIZ5jGtT8v620HxI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jAyE4JC6ENlihSH4ZIlLgFC/PyJ2wM1E0Bb2vy3uM5uBPaTVoNNyCH7E5xfRUuKFnDUX7A6ff48pIM88bIGjEANIqg85PVnWzexzBk4SSrgYZApWnnrrgoz1nigV+klbnpF+n8toVSk02FRrQVKSsWdk0a95iBY+JIlCQetEp6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s2CQz9Pw; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s2CQz9Pw"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8485d853b08so2531405b3a.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 13:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785531050; x=1786135850; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MJ+1zz4bd0vi4BfDFozlsEf5MBhzPjdddShFFlbqKaE=;
        b=s2CQz9Pw09ls1iBGr5yjIcZzzb/JJg+nUOw3JteH7TaBGOgVT3hCf/iFvGNNFJRMS1
         gjoXxTDxCxKoLLKjBvTKiC65y9IMBjp5dBV3aOjd2V81STj2SKExAefseRoIvo04/5uu
         9iNDP/YZUm+E+ctsHKGwVSyB/PCAW1ETyb4Q3kp+N82tuqlxvyF++DBe4jbkC7akufZ7
         ldn1oErQTVneHRlxB4zA7hMVYiNQnX6dzGCv5EjSq6RWXqSzqpXhk6aw25QZAY2ePOJG
         0oAo+RQarATDJPIpo65GwhKZMTT+93zdN3zPZlIpXxjGq3MKMUxVS+lEzoesMDq+xutY
         9JQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785531050; x=1786135850;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MJ+1zz4bd0vi4BfDFozlsEf5MBhzPjdddShFFlbqKaE=;
        b=LpcclpHSxfCGSeI48WqpVXKRzGr1E2qq1WhDyDoCBrPXanZydB7QGGROe6vm63/AV/
         fdofreSW7gwGgjKubuXo6lLKPfkk0DIoWOh8qV5h8VPaELML9JPc/gAI7H23aKM02UX9
         MIzrd1nXdLJa3aBoKdgXs9UA/hyjHVqkOOfF+GWWVdKplhT18iudQwuY1qElksd6JWB2
         D6M7405MfXgWJjrFhRYaLvSK2kkJzv9WBLKpkNw708Nn5yGvreo03Vqh+Mk4W+rx0Rdq
         J3HzhMPXmBIo+IMCjXPbeL3g4o24So2IY8uhCe5v09eV4HHgWZbe1FdxYdLS421xIaAx
         bLrQ==
X-Gm-Message-State: AOJu0YwzfRgATq0vZZEnAgX8YsBC7jByEq/X3DW/EzhTllRwYvOBokog
	hLBhsY5HkAfjgQoshPrdJ7RRMZ+IiCnKMViZedauhRfO34Ziz4zphHxWhWxPidsE9JepXZPc6Vj
	1bcvtogn4VTdpsrunwO+QEb+cmLS9AwyOvL7nNBQC/rRseb1KE7skhwCCMyrsuDK3ugCLOHS5AR
	n7Ft3nhA43DyAgqiG9y/jRPdIPBxySk1A4qPiqw6YTicNxQbjh
X-Received: from pfn38.prod.google.com ([2002:a05:6a00:a226:b0:84b:be30:8d22])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1785:b0:848:2f84:732
 with SMTP id d2e1a72fcca58-84ee493ea6emr863311b3a.69.1785531049266; Fri, 31
 Jul 2026 13:50:49 -0700 (PDT)
Date: Fri, 31 Jul 2026 13:50:48 -0700
In-Reply-To: <20260731201140.5AF0C1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260731195612.2697986-1-seanjc@google.com> <20260731195612.2697986-4-seanjc@google.com>
 <20260731201140.5AF0C1F00AC4@smtp.kernel.org>
Message-ID: <am0KqJOD-FiC9BXs@google.com>
Subject: Re: [PATCH v3 03/12] KVM: selftests: Pre-set threads affinity in
 hardware disable test when possible
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, Aqib Faruqui <aqibaf@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

+Aqib

On Fri, Jul 31, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/tools/testing/selftests/kvm/hardware_disable_test.c b/tool=
s/testing/selftests/kvm/hardware_disable_test.c
> > index f088b4af3ccc7..b4edeadfa3f45 100644
> > --- a/tools/testing/selftests/kvm/hardware_disable_test.c
> > +++ b/tools/testing/selftests/kvm/hardware_disable_test.c
> > @@ -36,7 +36,9 @@ static void *run_vcpu(void *arg)
> >  	struct kvm_vcpu *vcpu =3D arg;
> >  	struct kvm_run *run =3D vcpu->run;
> > =20
> > +#ifndef _GNU_SOURCE
> >  	kvm_sched_setaffinity(0, sizeof(cpu_set_t), &threads_cpu_set);
> > +#endif
>=20
> [Severity: Low]
> Since the KVM selftests build system unconditionally defines _GNU_SOURCE,
> will this fallback code ever be reached?
>=20
> [ ... ]
>=20
> > @@ -80,22 +84,28 @@ static inline void check_join(pthread_t thread, voi=
d **retval)
> >  static void run_test(u32 run)
> >  {
> >  	struct kvm_vcpu *vcpu;
> > +	pthread_attr_t attr;
> >  	struct kvm_vm *vm;
> >  	pthread_t threads[VCPU_NUM];
> >  	pthread_t throw_away;
> >  	void *b;
> >  	u32 i, j;
> > =20
> > +	TEST_ASSERT_EQ(pthread_attr_init(&attr), 0);
> > +#ifdef _GNU_SOURCE
> > +	TEST_ASSERT_EQ(pthread_attr_setaffinity_np(&attr, sizeof(cpu_set_t), =
&threads_cpu_set), 0);
> > +#endif

Aqib,

Do you happen to definitively know which is the "right" macro to check to d=
etect
support for pthread_attr_setaffinity_np()?  Belatedly, I saw that you used =
__GLIBC__
in a patch that ultimately wasn't applied[*].

I initially used __USE_GNU here, but then Sashiko yelled at me, so I switch=
ed to
_GNU_SOURCE based on Sashiko's suggestion, and now it's yelling at me again=
 :-)


[*] https://lore.kernel.org/all/20250829142556.72577-4-aqibaf@amazon.com

> [Severity: Low]
> Could this break the build on systems using alternative libc implementati=
ons
> like musl?
>=20
> If _GNU_SOURCE is unconditionally defined by the Makefile but the libc
> doesn't provide pthread_attr_setaffinity_np, this might result in a
> compilation error rather than using the intended fallback.
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731195612.26=
97986-1-seanjc@google.com?part=3D3
