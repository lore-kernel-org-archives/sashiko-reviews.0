Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CF91A9FA0
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 13:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780322056; cv=none; b=oeg9vedEQLnLaR1/at1LkEzABnGv+8Cf5cR3TvrEk0BlnSAzvUp8+eX0CK14eS0o4fDkNwOB6+QFgJPMX2iukFYQwQMHBhTmvN/pePe+209E2YNNTCWvO7MF+7EiTSD43HzTgYu5uneixY1l5Vw+J0Urvi/okmMVw253o6QxcL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780322056; c=relaxed/simple;
	bh=SozuT6WFOw5kMRzZFhlGsX7AVdsSgsOAWvEj6qKmblo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SPeTJMhRqUYhO+aAZxIE8WyCs/VQdYaACmYi8zKL+H38ToTGTN2uHJ9/6JN3TfKJo1Oq2ES/pDHWVSFCsVVxr+QR5DXw34pwa+DM33esKOz7aSjl+namJS1Q6posJ9p32kCIkWAx98q9zUG6DBleenXl8DfsdZfTozb52sqageM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H2DOTgu6; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H2DOTgu6"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-490a786f987so14003565e9.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780322053; x=1780926853; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SozuT6WFOw5kMRzZFhlGsX7AVdsSgsOAWvEj6qKmblo=;
        b=H2DOTgu6LVDrjqJ7SakBAN9pnoKGmvhdE3thPsDG3WCBgzLkSRRIxNgMd4vi+lvTpW
         ciBEB5xkHGLXMvVL0+8JcBHDUjw3Ig0hdjgxRosS6TkszdpXQYMw/+hJS3VSDsEDapkF
         M7Qw44NpItje6olP92kze2sBTy/Qbs6qqg7dko70g/1u+3xckRBEfGJ43HF/Sb06/GaO
         O2WzgcUhI/MVH6TMuCiF6MolrDa+DkPEC5j3j1oh24m4cWN58gQt/qaJPOAJKh/C7zIF
         RNgkX7osi6sqRDsPJz7KhLGzpMUHVNxd95dM87TAc/vxMHG+sNAtuYAUX5WziyJsC4oV
         tv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780322053; x=1780926853;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SozuT6WFOw5kMRzZFhlGsX7AVdsSgsOAWvEj6qKmblo=;
        b=WuQdxQNoHqLIXMRK5JqG5d0uOAyyjYUyyiG6eN+SXhR9VpPjayuiJdgWhwXcXZNBvh
         hGCitV7NbJtadDQaLxcPbkHwnaMvNnNY/6rmP4n5u//edI4MKoYCLN+c3nrunpIBdRIQ
         szYxR6pnBpuicZHHFXNXW2JqSz6f8vpIilQapyAhP4wOSHksLznUGp+HXtqzshTvm4GC
         PLcqETcAPilxfcwAGJ+EqIR+2PHxodP5pZ9zDsnNWfMvIFFWAa+CQXMMLsZk31t5u5ao
         0y0QYr09xkcq1TZOhlQQxdZjqFOh+ILTMDxx1ue8xo7iNrYqsW66u5I31rF1yctRcbiq
         ZJww==
X-Gm-Message-State: AOJu0Yz33wW63wDBB52GOd3iWr45hUOuUPmDqzmE2o3ultpxq2KyNxUr
	bn6/sTd0+5//nlr56RZ5qzecgILi3qj2RdZxA+yO1lrkj5uMOQq6YQKdAN1QGMXm1rtfFWQedTd
	MeHJ86zIG/+IO83JTIw==
X-Received: from wmqa18.prod.google.com ([2002:a05:600c:3492:b0:490:538a:ee3a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:64c8:b0:490:a298:acf7 with SMTP id 5b1f17b1804b1-490a298ad48mr192916685e9.17.1780322053165;
 Mon, 01 Jun 2026 06:54:13 -0700 (PDT)
Date: Mon, 1 Jun 2026 13:54:11 +0000
In-Reply-To: <88fa86984dbc8a11bb9f4d1af76a1ba0d942136f.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260530143541.229628-5-phasta@kernel.org> <20260530150622.393FC1F00893@smtp.kernel.org>
 <ah1c3NSU-4UkdUhb@google.com> <a3d09b270e6effb6f2bfb5d7ba8de48e3c2c4081.camel@mailbox.org>
 <CAH5fLggvxGwJkAp+VqG7pA-e2zM-T8_DR0DeCiZiJyM+o51DuQ@mail.gmail.com>
 <24ef07ed85d9e7aa7f9d3a96301c4c15bc0f2315.camel@mailbox.org> <88fa86984dbc8a11bb9f4d1af76a1ba0d942136f.camel@mailbox.org>
Message-ID: <ah2PAwrIp9kw4p0V@google.com>
Subject: Re: [PATCH 3/4] rust: Add dma_fence abstractions
From: Alice Ryhl <aliceryhl@google.com>
To: phasta@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-media@vger.kernel.org, 
	ojeda@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2026 at 03:30:38PM +0200, Philipp Stanner wrote:
> On Mon, 2026-06-01 at 15:14 +0200, Philipp Stanner wrote:
> > +Cc Boris
> >=20
> > On Mon, 2026-06-01 at 14:55 +0200, Alice Ryhl wrote:
> > > On Mon, Jun 1, 2026 at 2:34=E2=80=AFPM Philipp Stanner <phasta@mailbo=
x.org> wrote:
> > > >=20
> > > > On Mon, 2026-06-01 at 10:20 +0000, Alice Ryhl wrote:
> > > > > For example, let's say I'm using RcuBox<_> here. Yes, the data yo=
u get
> > > > > from dereferencing the RcuBox will stay alive for a grace period,=
 but
> > > > > IMO once you run the destructor of the box itself, the *pointer* =
becomes
> > > > > immediately unusable.
> > > >=20
> > > > I don't know why you're stressing the pointer?
> > > >=20
> > > > The trick above is simply that drop / dealloc *and* code unloading =
is
> > > > delayed by a grace period.
> > >=20
> > > Sorry let me try to rephrase. I'm not worried about the stuff behind
> > > the pointer. After all, you're using RcuBox to protect that stuff.
> > > What I'm worried about is the pointer itself. You invoked
> > > drop_in_place() on the pointer to the fence context,
> > >=20
> >=20
> > on the pointer to DriverFenceData, which contains a refcount to the
> > FenceCtx, which might then want to drop.
> >=20
> > > =C2=A0so even though
> > > the fence context may be valid for another grace period, the *pointer=
*
> > > to the fence context is not. The pointer could have been zeroed by th=
e
> > > destructor.
> >=20
> > That particular pointer to the DriverFenceData could have been zeroed.
> > But potential other accessors have already crafted themselves a new
> > pointer to the, by the power of RCU, still valid data.
> >=20
>=20
> correction:
> it is refcounting that ensures the memory is still valid.
>=20
> dma_fence_put() in DriverFence::drop() could earliest free the memory.

Hrm, actually I realized that this is not quite Boqun's RcuFreeSafe.
That trait would require the fence allocation itself to remain valid for
one grace period, but you don't require that.

Alice
