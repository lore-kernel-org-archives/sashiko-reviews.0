Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0070C369D55
	for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 19:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781119129; cv=none; b=VQRLIPcxbX3WiynsS60ygfp1vndkfsbOr9ZVKuJEnqJvNKXTnEpl2Z0+wZ+nEjOHrkm32hLCS64ApOsJioXmv3xpQpqXt+oIb1Eai1g7ieduFIr3/DJW2gnXk4d8z48hPsIzeNfM7swRokS+5GaHzJkpdsOXef1KffuJzqBi1jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781119129; c=relaxed/simple;
	bh=bWOieN7hFnS5AkVT6IUrpQaoTZ6d+J/rfYok78HffKw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MFdlueLbW5gw7Zt/xr4wD8Sfz0CCQI4TU3p5LhcOP1E8fycByWvD91KUjEfDWqEzb8nrbKhZnG38dBNSgdUqkgJNp1TqeBn57E3nXrPS6biN0YmfNZoK6cmpXrup0rlfM/xMX39rdEip5GXVVEGXpr0az8lOkGZjTSwgS93QTe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aYeNaPrv; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aYeNaPrv"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36d98b5a68fso12208860a91.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 10 Jun 2026 12:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781119127; x=1781723927; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EEBmDx98caEzFpRXeIqJTAyOlpfmMPXYTcbS9AlAlm8=;
        b=aYeNaPrvkBP2RktM9qXUz/WQ6tucHeJyaabydxdZBFEFOW3qgLxvDU7gmqo4VQlTjq
         4JmJL1iMB19QPwt/a0BP3C/Nz/87H+hTDWHKhdeVMVPa9bhS3bqmF4GiqBPaVLK96kLN
         SzX3fByG5qb1mLyLSr5SVqxPQjX2CYanHsGFDth5WA8Xp3DMNSq639nPnHErsU/ppDhC
         hXBgm6RtI9RiIRVBrM0BW/8v/vC16xOz/jgMlIsCnKHmrt5RJBQUO/RCYOSGsGxDYf7E
         p3UlrEL05/eOTj0zZYlqtgW5Syn9sycONbkKSTdnF+d29lnfkMwuStObsgXPpQGn9NC4
         xbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781119127; x=1781723927;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=EEBmDx98caEzFpRXeIqJTAyOlpfmMPXYTcbS9AlAlm8=;
        b=qOz9iDwNuR3bgrVV3eQjbe061bd1X2eGCp2m77G31cT6sxXyRHv8lJ5llwTgQCBikN
         Ut/393jNDCQ2xmvC4syoVU4/s2ngeGJDUPx4c5DBQaW+dxWG/OWGZEUWCmRlHkOXq3Gu
         DovtaKNRnZ11EhcOFwJzkhMsW1hWHsgXA40T1PBGQpcTg22MaTHjajUSo6BaYInkbs/Y
         XV/74Kb2UvLPa7MkZmZY2Y3hz/7hQwK+TS3LC2qQAOIMsmBxLc21FDg4LRBswph9rVu5
         Pea1TfW9DhLjkoFyyDJFsUA4zMEB1jP6bBCvyNDmVZs640PNnksaBgvP4s+emzN1bt+g
         ALnw==
X-Gm-Message-State: AOJu0Yxrd3eUtLx/nrgopq7nWvOLt1dp1EzvE5dLq125E5mKp5mMq9bL
	vvhkOiNZvacjuXxHg8FML/VcuzOJKMKH1P++Aigk3QD11niCWEZx1tUokmOdY9o3h01qkJiwnUW
	BPkQS80O9Hy7KUUNullq3/72jCYihTWHCDFtytL90VWRTYSgbTaJ0SehEoEIFfigpMVHKOWF5lQ
	XJDkzvqFJp96Vb28kHLE6QuaZCHSAk40fIAsdBsbi3e6jPK1+9
X-Received: from pjji9.prod.google.com ([2002:a17:90a:6509:b0:36b:cf62:6827])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2741:b0:366:10f1:3d86
 with SMTP id 98e67ed59e1d1-370f0b55ebbmr28954281a91.22.1781119126862; Wed, 10
 Jun 2026 12:18:46 -0700 (PDT)
Date: Wed, 10 Jun 2026 12:18:46 -0700
In-Reply-To: <20260610010314.DB8861F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260610005338.2967132-2-seanjc@google.com> <20260610010314.DB8861F00893@smtp.kernel.org>
Message-ID: <aim4lld49oqLrthg@google.com>
Subject: Re: [PATCH v6 01/18] KVM: selftests: Build and link
 selftests/vfio/lib into KVM selftests
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, David Matlack <dmatlack@google.com>, 
	Josh Hilke <jrhilke@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 10, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/s=
elftests/kvm/Makefile.kvm
> > index e0ddd3ff9472d..14316358fd9fb 100644
> > --- a/tools/testing/selftests/kvm/Makefile.kvm
> > +++ b/tools/testing/selftests/kvm/Makefile.kvm
> > @@ -257,6 +257,7 @@ OVERRIDE_TARGETS =3D 1
> >  # which causes the environment variable to override the makefile).
> >  include ../lib.mk
> >  include ../cgroup/lib/libcgroup.mk
> > +include ../vfio/lib/libvfio.mk
>=20
> [Severity: Low]
> Does including libvfio.mk here break the "make clean all" sequence for KV=
M=20
> selftests?

David and/or Josh, can you verify whether Sashiko is hallucinating or has a
legitimate concern?

> In tools/testing/selftests/vfio/lib/libvfio.mk, the output directory is
> eagerly created at parse time:
>=20
> LIBVFIO_O_DIRS :=3D $(shell dirname $(LIBVFIO_O) | uniq)
> $(shell mkdir -p $(LIBVFIO_O_DIRS))
>=20
> The directory is also added to EXTRA_CLEAN.=20
>=20
> If a developer runs "make clean all", Make will parse the included libvfi=
o.mk=20
> and run the shell mkdir command at parse time. Then it executes the clean=
=20
> target, which deletes the newly created libvfio directory. Finally, it=20
> executes the all target, but the compilation fails with a "No such file o=
r=20
> directory" error because the output directory was deleted and isn't recre=
ated
> in the build recipe.
>=20
> > =20
> >  INSTALL_HDR_PATH =3D $(top_srcdir)/usr
>=20
> [ ... ]
>=20
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610005338.29=
67132-1-seanjc@google.com?part=3D1
