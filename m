Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19B82FE56A
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 18:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781029164; cv=none; b=j7cIAcZLALcEMbGU0Tdp9gxZZCQBC24GArQ5bEX8buUhwzgpJrgnYv62LwrtYFn6wWaMuVE3cxF2MU8DxpYVj4FcZpN+FI9QpvVRfgVXSVaeVtHeHlQJHls6tE3wbS1awzTlsu68WnYXHWS4fsYtYS9NDnF3sqcT+w0B/qSLzYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781029164; c=relaxed/simple;
	bh=gDu4MwBmfRX/E++3VuTP0EJgWXcI+dGfLnWE00TFqa8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sc6nGjbPh9ZVqfM3lg168AzhujAs0XDwh904Z4BqyKFXjB9IXYgOR276EsiN9+hpI77mqDbQ1qU+xgjpM3x0FI/VCZmU/mJA1LuhVbUqCwFMQieneDm+2gH96FKATBG45zvk0eSdrLyfd/i4j47KaiZUGdYFGozlwwI59Dpty2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OTWY5MXR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OTWY5MXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781029161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gDu4MwBmfRX/E++3VuTP0EJgWXcI+dGfLnWE00TFqa8=;
	b=OTWY5MXRAvCKChMxmAQ/horvqnvlHqdn7rFuXXVK7zjaCo+iKK4F+arqfNhD41vORNmR/7
	Jdj9BrPX6cXLwkbxZpPzM+C4je4emVW0SGZy/GlA61LBjdMy+qgwi1Sm1hiPzzgNBe1Eyt
	ftfnDuKt71b90tpkZGxMedQXX/ywiHU=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-626-SpDqNYeYP2iKXhL2kwK2dA-1; Tue, 09 Jun 2026 14:19:19 -0400
X-MC-Unique: SpDqNYeYP2iKXhL2kwK2dA-1
X-Mimecast-MFC-AGG-ID: SpDqNYeYP2iKXhL2kwK2dA_1781029159
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfb3463931so7088876137.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 09 Jun 2026 11:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781029159; x=1781633959;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDu4MwBmfRX/E++3VuTP0EJgWXcI+dGfLnWE00TFqa8=;
        b=I2aWzchpT3lOooB3WIQgTcUvjcBkibOK3LCKo1sg2edwuwkztocGf0qhID1QMLEhvS
         mf0hyv8+j1zitIJ81L6Ye6Zqe2S63bgfsXqceLAefskJqAf+Ik4Z9exo0v/Zih1l/lLk
         xUMytC5oJktDAQ/W5IyZ9v3Vt3vJL6O/HyzWq/fHErH91zuQ9TC3UEcWfm9k+mymoOJD
         a8Cji062mprYI0pOjV+a0pKwA4Vpv1Ux1eU439C+lYTkawYy6859YNCYJEzwzvOD8YXS
         rh69n7UAMyR37exxdRPKT2Z8CtHZtj//z1hv23QgZmz4oef2fl5+WxMabwIyByhIfHxR
         AU+A==
X-Gm-Message-State: AOJu0YyJMx75raJg3O+PNAkZeFffKGLq/kWj9hTr9EPxV2CITC0ZKWCT
	r2deAyf2uoTuDQV7uybKU439MPZdT3zcuRLtBNlQqc580Y9UeotUSvKcen3QIl+mvnooCns33RT
	fEjKeOF3snwaQlYKQQ+MOqBUVmJ6LnJI6AOCE4SUd+puP4L8b1XU4C8OVFb+gfz69W3jp8amgAs
	0IAph05/b4Zg/c0um3RVZ+PTeUDAbCvNpyy4s3F06QP/xftwxgYg==
X-Gm-Gg: Acq92OGjke0igSF6rXlqkHccxLt+u4bFNWkBd5nXTkchyhsX2Agq8/zrWWEDUwJpsQt
	nY78zslqVPZHTp8QAwITh3krFKUc+ecF2ST+vKPWeoIXbRaRulHjchhHONI9Bmmpcmo6HBCD5Zu
	6Oj4TREV7Rm8+OWOOS7jFOYp4G44edRHR1e9TU3QtvBdxFLRbRrd99Zg8K1j9AMUvYyBzEBA0ks
	j4oaQZl77EB1Str5qQNg03HZtp1dTt8F3CZFWpXWTb+c2VI9GKz5NUWfvahcOJmDW5TOOHQwKrl
	G/w2TvQVlgjBbLh3IbAycaZUuqHULJiijozKH4mePR/0v+Y8FTk3tSjZDJ7w8reKb1bG1ScMNeC
	A8Ymg6FIzNdbBbF7+w5CCUxDxyKTj
X-Received: by 2002:a05:6102:945:b0:6f0:3999:b378 with SMTP id ada2fe7eead31-6fefe3c4824mr13164688137.13.1781029159021;
        Tue, 09 Jun 2026 11:19:19 -0700 (PDT)
X-Received: by 2002:a05:6102:945:b0:6f0:3999:b378 with SMTP id ada2fe7eead31-6fefe3c4824mr13164599137.13.1781029158360;
        Tue, 09 Jun 2026 11:19:18 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd053210sm206713066d6.26.2026.06.09.11.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:19:17 -0700 (PDT)
Message-ID: <8898fc261aded12d8adf4c5a74cc6bd830072f27.camel@redhat.com>
Subject: Re: [PATCH v19 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
From: lyude@redhat.com
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, ojeda@kernel.org
Date: Tue, 09 Jun 2026 14:19:17 -0400
In-Reply-To: <20260608184329.0BF6C1F00893@smtp.kernel.org>
References: <20260608183057.2001376-2-lyude@redhat.com>
	 <20260608184329.0BF6C1F00893@smtp.kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BVouORBhvJMm0cfEB8cp7QwM45XsRsrTYHeJxDc76no_1781029159
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-06-08 at 18:43 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [Low] Incorrect use of `#[inline(always)]` instead of `#[inline]`
> for abstraction methods.
> --
>=20
> commit 35068fc880d5bd0d2870750a321a6b8155d32ae4
> Author: Lyude Paul <lyude@redhat.com>
>=20
> rust: drm: gem: shmem: Add DmaResvGuard helper
>=20
> This commit adds a temporary DmaResvGuard helper type for managing
> the
> dma_resv lock on GEM shmem objects. It implements a drop handler to
> automatically release the lock.
>=20
> > diff --git a/rust/kernel/drm/gem/shmem.rs
> > b/rust/kernel/drm/gem/shmem.rs
> > index 34af402899a0e..79ebd746e9611 100644
> > --- a/rust/kernel/drm/gem/shmem.rs
> > +++ b/rust/kernel/drm/gem/shmem.rs
>=20
> [ ... ]
>=20
> > @@ -235,3 +241,32 @@ impl<T: DriverObject, C: DeviceContext>
> > driver::AllocImpl for Object<T, C> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_map_offset: None,
> > =C2=A0=C2=A0=C2=A0=C2=A0 };
> > =C2=A0}
> > +
> > +/// Private helper-type for holding the `dma_resv` object for a
> > GEM shmem object.
> > +///
> > +/// When this is dropped, the `dma_resv` lock is dropped as well.
> > +///
> > +// TODO: This should be replace with a WwMutex equivalent once we
> > have such bindings in the kernel.
> > +struct DmaResvGuard<'a, T: DriverObject, C: DeviceContext =3D
> > Registered>(
> > +=C2=A0=C2=A0=C2=A0 &'a Object<T, C>,
> > +=C2=A0=C2=A0=C2=A0 NotThreadSafe,
> > +);
> > +
> > +impl<'a, T: DriverObject, C: DeviceContext> DmaResvGuard<'a, T, C>
> > {
> > +=C2=A0=C2=A0=C2=A0 #[inline(always)]
>=20
> [Severity: Low]
> This isn't a bug, but should this use #[inline] instead of
> #[inline(always)]?
>=20
> According to the Rust subsystem guidelines, #[inline(always)] should
> be
> reserved for functions using build_assert!() that depend on function
> parameters. For small abstraction functions that simply forward to
> binding
> calls like this one, #[inline] is the correct annotation.

Looks like the magic 8 ball is either hallucinating or this needs to be
added to the documentation, because there's clearly nothing about this
in the documentation. Ugh.

If anyone can correct me here let me know, otherwise I just assume
hallucination from the hallucination machine

>=20
> > +=C2=A0=C2=A0=C2=A0 #[expect(unused)]
> > +=C2=A0=C2=A0=C2=A0 fn new(obj: &'a Object<T, C>) -> Self {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: This lock is ini=
tialized throughout the
> > lifetime of `object`.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::dma_resv=
_lock(obj.raw_dma_resv(),
> > ptr::null_mut()) };
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self(obj, NotThreadSafe)
> > +=C2=A0=C2=A0=C2=A0 }
> > +}
> > +
> > +impl<'a, T: DriverObject, C: DeviceContext> Drop for
> > DmaResvGuard<'a, T, C> {
> > +=C2=A0=C2=A0=C2=A0 #[inline(always)]
>=20
> [Severity: Low]
> This isn't a bug, but could this drop method also use #[inline]
> instead of
> #[inline(always)] for the same reason mentioned above?
>=20
> > +=C2=A0=C2=A0=C2=A0 fn drop(&mut self) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: We are releasing=
 the lock grabbed during the
> > creation of this object.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::dma_resv=
_unlock(self.0.raw_dma_resv())
> > };
> > +=C2=A0=C2=A0=C2=A0 }
> > +}

