Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A511DB95E
	for <sashiko-reviews@lists.linux.dev>; Tue, 11 Aug 2026 00:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786408080; cv=none; b=VdymQnPmiJFQf9ei7YJdL/AaCvJ/m+eTAdeQKt77kGt9PR8Rpzg2AB7TntRn3IMQbelgM8PtmjL8/t7GZL9IdAdf2ctZ5wYQcEaaBUD5OmLAgIXn0cQl2z5uP4O1YIz6ErOW2XLZpjfqW3RAhS3CKVFdu5iQddV2IwLBR1lWMv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786408080; c=relaxed/simple;
	bh=Z3/m4TkqL/dv/HUc2AANkOLODQvUR2RTnqXEuVw/xLs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QxbOPq+CDCAMh8GWPDsvmn+0dxXRzwtK+AT2hoKTESqLzUv0AYe4JZUCmWgkzZS77WaUNnxkZH0XBW9Q9JK2ggAkj0psE7Z3fPEQfivCGbhYIDlQFsZpXYwT3hChaA1WOv3E5318UooDQDGasf4bxzecYKm6lMySRYMg99YTlZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XQcWK31c; arc=none smtp.client-ip=209.85.214.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XQcWK31c"
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf1c86963bso4005875ad.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 10 Aug 2026 17:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786408079; x=1787012879; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LEmG05/qyAp4ekJGUu3plZzNKZ0Z1vbporsI46eg3PM=;
        b=XQcWK31cDw6r+/3KHi2jrmm4jYoG8I+xmtzuaXX9wyC/wpV0AOTjrq8LACXhwmwdyK
         UvfXhEZjPlcljUesLnGRZ13Kje1O55CFwB2LBThqtyswiQjG8vkCCwbZLNSOzcUmYLQF
         sBopBg9UJYHIkgAHI7w4NzKHroIjyAzyqqz74GFwpPaVhYKbJycAt1cZfDA5eymrxf6J
         oFSgts11koWvZhl4+4gKgbY6EADQz/ALgUClXdXkQWjiG9n4u/vp1L5AELiEJBLQvkFb
         YdkdiA2zNZRrmRKd85otvE3a4d2uT9JiJXgyZX9EUA278t4ehqPXBe+VN3MyTzx3/Sf3
         KgdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786408079; x=1787012879;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LEmG05/qyAp4ekJGUu3plZzNKZ0Z1vbporsI46eg3PM=;
        b=XGY4kTjgagcnRja/5qE8pJCBLxVoVMdfFz10LiU17nxDE77khkzT0a4WF07/PPxdx+
         JLzQxfAhGcdPOF0j9Q+O1drb08PITN7iKPi9ZaIVlwn8RtZAaq5X7Y8mivssP5x8fv3n
         E3QkkL08o+tLxPdjc3bKT+/9QKA0nvLpUGt8io/2SfhYxrKNrZMwET04b/YTiLH7Lwl8
         mEm15W2rSbtWhwlBzz+nFKvT7MdlsmuKhDd2wDhFFPgwRK2qXYQtVH97L8gjoMtff7+I
         4gaRxLxJTxmnBJbr6Cw/idM2mNy6nkcrsfZ9OhvWf3fEiEnDS/Ow7YZCkeNf0KeJtU0f
         SsUQ==
X-Gm-Message-State: AOJu0YxJP/du2u9bhboUO7HBKXrlBV3Cah/c1ApDOQGSYYRWA9OtOwl5
	ViFEMT/j3Hck1Ci+poIPk8g08GiCWP+QfRL0eeW6Ga+M/2dahykU1XU+HO+tsLml5EsTGPyvLRz
	X+MDnVw==
X-Received: from pjbnm24.prod.google.com ([2002:a17:90b:19d8:b0:37d:95c5:815d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d0e:b0:390:b3c5:e2c9
 with SMTP id 98e67ed59e1d1-392d61cf225mr980360a91.17.1786408078835; Mon, 10
 Aug 2026 17:27:58 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:27:58 -0700
In-Reply-To: <84113ba5-ddb8-47aa-abe0-c6968feb3fea@amd.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260706063035.1139-1-sarunkod@amd.com> <20260706063035.1139-2-sarunkod@amd.com>
 <20260706065212.CCD741F000E9@smtp.kernel.org> <84113ba5-ddb8-47aa-abe0-c6968feb3fea@amd.com>
Message-ID: <anpsjpCQHjJCH7TU@google.com>
Subject: Re: [PATCH v2 1/2] x86/uaccess: Extend CMPXCHG user helpers to
 128-bit operands
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 06, 2026, Sairaj Kodilkar wrote:
> On 7/6/2026 12:22 PM, sashiko-bot@kernel.org wrote:
> > > diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/ua=
ccess.h
> > > index 367297b188c39..123755d471099 100644
> > > --- a/arch/x86/include/asm/uaccess.h
> > > +++ b/arch/x86/include/asm/uaccess.h
> > [ ... ]
> >=20
> > > @@ -551,11 +594,18 @@ do {                                           =
                                 \
> > >=20
> > >   extern void __try_cmpxchg_user_wrong_size(void);
> > >=20
> > > -#ifndef CONFIG_X86_32
> > > +#ifdef CONFIG_X86_32
> > > +/* Always fail on 32 bit arch as it do not support 128 cmpxchg (i.e.=
 cmpxchg16b
> > > + * instruction).
> > > + */
> > > +#define __try_cmpxchg128_user_asm(_ptr, _pold, _new, label) (1)
> > [Severity: Medium]
> > Does this 32-bit stub correctly signal failure?
> >=20
> > Since this macro evaluates to 1, won't the surrounding unsafe_try_cmpxc=
hg_user
> > macro treat this as success (true) rather than failure (false)?
> >=20
> > This could cause the wrapper to negate the value and return 0 (success)=
 to the
> > caller, falsely signaling a successful memory exchange without actually
> > updating memory or the old value. Even though there are no current 32-b=
it
> > callers using a 16-byte operand, should this evaluate to 0 instead of 1=
 to
> > ensure theoretical future callers don't encounter a silent atomicity br=
eak?
> >=20
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706063035.=
1139-1-sarunkod@amd.com?part=3D1
> Hi,
>=20
> Right, It should return 0 instead of 1, will rectify this in the next pat=
ch.

Is it possible to fail the build instead?  Attempting to generate CMPXCHG16=
B on
32-bit should straigt up fail.
