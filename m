Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAEE46D2DB
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 16:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651248; cv=none; b=VbItvELibeKWgeoBquypRuO7MRhteWQ94xe2uZYkqlv0SHUaxiwWKVDuTjitwodXTeg3GnV3dL9bdzewLIao8c2GCy8fT2vCoV/gmjAFMIwbZYjPJbrUKm8prpoIbgq3GZEpmDLmtlUwEzqZPgQadRdIcWVx+ZueFDSSUByC13c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651248; c=relaxed/simple;
	bh=OriPdBhOp4I8NSaUQ1ilqiW02cNYD+mMRedsfTxi01Q=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EMpHBIHGNGgnXEbhClZo57HZRUSqbBau7brsXxWXmVC1qzVAg34wIJC9f1KxZbTmC5/eYmnBzd6sWsF2WLGLetk4S1C2l1SPj0BhP/jRGFJ7L5ZnSQzfz5cVW0xGyeGQotGoZWaMNyXVFU/Ap5yqXHPwqGrxdIsFlfWGWR/OrMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Iow0JJya; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Iow0JJya"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2caf4173b1cso165614715ad.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 09:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784651246; x=1785256046; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOtJSmkWSx9WAA3VgSUe2HFHil8cbgDYatSRRMP5Rgw=;
        b=Iow0JJyagWa54LalfheD74NpTdGuVNj65Sa5Ub3mJ6sXKQ0/6sA4xz9N35R/HiUnuk
         m8VuW0+zhnBqyOCuy8Im+iFdeYRAkP4g4mSQqGDbnKoYRqJSIOGbbcoioKiD6NsOItEr
         hgBJCaNdXzWC4qEY7KGPTf0x5gvH256bgA4vO4zFZSNAQkl2tfJT6Jzv8ZC/YNfVnYAF
         j4aII+LUYd08eq7AsfCUwfoJFayR7xzZ4p0L9vjaIBwFfGgWwDK7D3KZnqjWNeIlCjwM
         8A7kgTmbhfQ9J05ZeuTFtKStSj2bULA+aN56MApjq9DLX5+vJ3MZx/S3WtIAl/Mo4nOp
         iErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651246; x=1785256046;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rOtJSmkWSx9WAA3VgSUe2HFHil8cbgDYatSRRMP5Rgw=;
        b=SPysxEqKdcUt6Vc+bDJLhGpYWI2Dw7gbAaEiGqPZfNFGfuqKzMDi/73XVWeY5EeS0r
         wblVTYzY/8pSGxal8JYOVaHGd5b/3IOLJQz8dnrCNQL/UxXPMDUMkGGRLkD+XnOEfS7I
         qHG8N7HcQEi5Cw41Gb9Z1iz05zP3hdb8uAMDgJkrIqYzjru796fn29cSbO1HS3GCurqQ
         WrNUsiPTANMHuZd8YmxXWRbR1L/AtMeUqI5JXA1orOTfiWQlX9KUF9olEIrAtkXM23ME
         fPQj2Xedm84yNiic9QSF06p7QJrdMMgZwZ+q9Fz5l5zgY63akwecxTX/eqw3O1QvxMID
         HcuA==
X-Gm-Message-State: AOJu0Yy104MugIRhEenjIbXZ6qegCYFwXaKHhLa96mRyPGlaMRRo7pDT
	ZFz+ocMikmRy8FyfptDCAKQmRN3JFqvNVpoe+S8OHKpVvRfpvXyQHRzPMI4s89DKuUZKM1Bzs3C
	/QxcUEg==
X-Received: from pgmu30.prod.google.com ([2002:a63:235e:0:b0:c99:a30a:7619])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:391:b0:3c3:890f:6d7e
 with SMTP id adf61e73a8af0-3c3ad8ecd35mr23113643637.47.1784651246131; Tue, 21
 Jul 2026 09:27:26 -0700 (PDT)
Date: Tue, 21 Jul 2026 09:27:25 -0700
In-Reply-To: <CABgObfbL3t21yVeSwiLSjjOUER+rTYDPHYAH9YU4TWGRjx6XHg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260721102827.313208-1-pbonzini@redhat.com> <20260721104819.B5A101F00A3E@smtp.kernel.org>
 <al-PSX0sOPdYdvIg@google.com> <CABgObfbL3t21yVeSwiLSjjOUER+rTYDPHYAH9YU4TWGRjx6XHg@mail.gmail.com>
Message-ID: <al-d7WPocYgEtgFU@google.com>
Subject: Re: [PATCH] KVM: nVMX: Hide shadow VMCS right after VMCLEAR
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026, Paolo Bonzini wrote:
> On Tue, Jul 21, 2026 at 5:25=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > FWIW, I had a pretty strong preference for Paolo's off-list suggestion =
of
> > explicitly disabling preemption, even before seeing Sashiko's response.=
  Every
> > other path the VMCLEARs the shadow VMCS runs with preemption disabled, =
IMO it's
> > more intuitive to follow suit here.  And even with the comment, it took=
 a good
> > 5-10 minutes of staring to understand what exactly is going wrong, thou=
gh that's
> > probably a me problem.
>=20
> Well, it would be at least an us problem---but I thought I was in the
> minority... The only (IMO bad) reason to leave preemption enabled is
> to obscure the change, but that's a lost battle anyway these days so
> why bother.
>=20
> That said, I am surprised that VMCLEAR/VMREAD/VMWRITE/VMPTRLD do not
> have a memory clobber, since they access internal processor registers
> and the compiler may reorder them without the clobber. Fixing that
> would also work around Sashiko's complaint, so I guess we should do it
> anyway?=20

Ya, good point.  We should probably hardcode that into vmx_asm1() and vmx_a=
sm2()?
INVVPID and INVEPT also need the "memory" clobber, no?

> And disabling preemption can be done separately on top of this change, wh=
ich
> is already on its way to Linus.

+1
