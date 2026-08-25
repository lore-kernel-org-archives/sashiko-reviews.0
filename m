Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78112486639
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 15:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787671709; cv=none; b=VzluOi+QOyM8cUCQR87fdTg2o0B62Wjs/SS2lDAk5XZnt0UpyMrk7xbI0D5Flr0UuRLFyZlwZ5H1Q0NRhlCv0YIekmXY/H8JBrJCJpxnA8MBXCulBXnmsO9tHZBn8Fj/ZnnM/0fiXbxL4WTrSYuoA0uVvGrmv2PTUooRhL5QBVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787671709; c=relaxed/simple;
	bh=loYqtnWXMGjjT8NDFhyil776wzBbOGoJ8kBMmOt6a6E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n8GMrZTDstqmPD0giMzSx+g9qAFV0gEr64iit/oWJSjF5eC2P9D6wdRDE0LWKuxdy63TozO2YVtnYLEsjD9VHKATGEdOmq16JSo6nJOy6TYiQBz08yu5dYkV4CbkEeCckYMguxmHZfbx81wmFtKpWTcrfZkc7j0f3PY8gbqmwY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=obzBFt8o; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="obzBFt8o"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e048a801dso6782326b3a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 08:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787671708; x=1788276508; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z2PSz/zBXLlU1jZmPieSmrOStF8SdBY8YCSvnTzrOXM=;
        b=obzBFt8oPdd0DO7gC3ibDVRAI2o+Ouae1aEiNCJgaZqcoLcUO1j5bYRTp+ueZdxqIZ
         MebjcQTVLxNcdQu1cf2Zp9mA6M2Q5jvMLSPh/beKt3GzbFS0AoJEWmc9SLzBvUahfJmT
         php/XxLJEaL/y20iE9x1SNnx9aSRi8hAzbnsmQAE9KSWm6ternEu7gwiJvu6/89jt/S2
         XVbtLqGXIsvqNMIiY4S2MlaDT2StCyM6rJ5qauJIXsF73UAMSmPa31wkUUIbaZzx7CAb
         8UvqQ4OeNwqZSDrtDicCFsjyX8cukxVhP93OPqG5PG3bGnjQQdJEgmiaDYVE0tTVYBg/
         R2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787671708; x=1788276508;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z2PSz/zBXLlU1jZmPieSmrOStF8SdBY8YCSvnTzrOXM=;
        b=rR0n9l5ERVvw3A0E6Gg+NNTlN4lZYMonOSbOAH29Q7eaoBp7kHPVurOWohJwgwz9Og
         ZvzMQ82kk/vG4NF0gXGDeOa2eN0VBp/KYwUyh6fz6m0Uv0ArcqUH5Au7KsXf+6v1EOpU
         Xc+rEgyXt6BdNRHLuzsIhlF5euusR2ZFg8w1ipft5Dh8n2zYdsOpIqLxQ+28RtZSx5tV
         vUXXG0nsJiHU4kjVms/wuTTFI2O9c0/uQYealXs7rPs3a6m3OGeRD5Ye1EUwhPXX9mec
         zT+DAj+ulV6zar+D9L83+4Q1G6AnLg7R1McAgVCz21IFkbtTtzTw/PGNZygIXUpQTaZQ
         gbtA==
X-Gm-Message-State: AFuF++nmyo7Q7JAUiDRQAEmnJ+UIlv11g+gHEwmkzSnRm1fd+NajrsZ1
	PB4CEdnx6iv7fN6ktSBRX7TNbOkV6vViFbmwuNbyhEJtC579SPxScEe2eIw7GVB3+ZDb4m7N25p
	ntA0r3w==
X-Received: from pgbd17-n1.prod.google.com ([2002:a05:6a02:64d1:10b0:cc1:8a49:bf91])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:7d02:b0:3cd:a1e2:f238
 with SMTP id adf61e73a8af0-3cda1e303bbmr4127115637.16.1787671707506; Tue, 25
 Aug 2026 08:28:27 -0700 (PDT)
Date: Tue, 25 Aug 2026 08:28:26 -0700
In-Reply-To: <327c7769-8ef6-40c3-869a-93c29ec9fa9f@amd.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260706063035.1139-1-sarunkod@amd.com> <20260706063035.1139-2-sarunkod@amd.com>
 <20260706065212.CCD741F000E9@smtp.kernel.org> <84113ba5-ddb8-47aa-abe0-c6968feb3fea@amd.com>
 <anpsjpCQHjJCH7TU@google.com> <327c7769-8ef6-40c3-869a-93c29ec9fa9f@amd.com>
Message-ID: <ao20mmzg6dMLukMo@google.com>
Subject: Re: [PATCH v2 1/2] x86/uaccess: Extend CMPXCHG user helpers to
 128-bit operands
From: Sean Christopherson <seanjc@google.com>
To: Sairaj Kodilkar <sarunkod@amd.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org, 
	Vasant Hegde <vasant.hegde@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026, Sairaj Kodilkar wrote:
> On 8/11/2026 5:57 AM, Sean Christopherson wrote:
> > On Mon, Jul 06, 2026, Sairaj Kodilkar wrote:
> >> On 7/6/2026 12:22 PM, sashiko-bot@kernel.org wrote:
> >>>> diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/u=
access.h
> >>>> index 367297b188c39..123755d471099 100644
> >>>> --- a/arch/x86/include/asm/uaccess.h
> >>>> +++ b/arch/x86/include/asm/uaccess.h
> >>> [ ... ]
> >>>
> >>>> @@ -551,11 +594,18 @@ do {                                          =
                                  \
> >>>>
> >>>>   extern void __try_cmpxchg_user_wrong_size(void);
> >>>>
> >>>> -#ifndef CONFIG_X86_32
> >>>> +#ifdef CONFIG_X86_32
> >>>> +/* Always fail on 32 bit arch as it do not support 128 cmpxchg (i.e=
. cmpxchg16b
> >>>> + * instruction).
> >>>> + */
> >>>> +#define __try_cmpxchg128_user_asm(_ptr, _pold, _new, label) (1)
> >>> [Severity: Medium]
> >>> Does this 32-bit stub correctly signal failure?
> >>>
> >>> Since this macro evaluates to 1, won't the surrounding unsafe_try_cmp=
xchg_user
> >>> macro treat this as success (true) rather than failure (false)?
> >>>
> >>> This could cause the wrapper to negate the value and return 0 (succes=
s) to the
> >>> caller, falsely signaling a successful memory exchange without actual=
ly
> >>> updating memory or the old value. Even though there are no current 32=
-bit
> >>> callers using a 16-byte operand, should this evaluate to 0 instead of=
 1 to
> >>> ensure theoretical future callers don't encounter a silent atomicity =
break?
> >>>
> >>> --
> >>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2026070606303=
5.1139-1-sarunkod@amd.com?part=3D1
> >> Hi,
> >>
> >> Right, It should return 0 instead of 1, will rectify this in the next =
patch.
> >=20
> > Is it possible to fail the build instead?  Attempting to generate CMPXC=
HG16B on
> > 32-bit should straigt up fail.
>=20
> Hi Sean,
>=20
> A compile-time failure in __try_cmpxchg128_user_asm would unfortunately
> break i386 builds even for callers that never use a 16-byte operand.
>=20
> unsafe_try_cmpxchg_user dispatches on sizeof(*(_ptr)) via a switch, and
> the 128-bit path is one of those cases. As noted in the comment above
> the macro, Clang/LLVM tends to compile all switch arms when expanding
> this macro, and only discards unused paths afterward.

If that's actually happening, then this code is already broken, because u12=
8
exists only on (some) 64-bit kernels.

A straight static_assert() will fail, but BUILD_BUG_ON() (or more precisely=
,
__compiletime_assert())  and all of the associated magic exists for these e=
xact
scenarios.  Unlike static_assert(), __compiletime_assert() relies on dead-c=
ode
elimination, i.e. does exactly what we want.

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.=
h
index a58d50d7a219..710a0b42eeef 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -595,10 +595,7 @@ do {										\
 extern void __try_cmpxchg_user_wrong_size(void);
=20
 #ifdef CONFIG_X86_32
-/* Always fail on 32 bit arch as it do not support 128 cmpxchg (i.e. cmpxc=
hg16b
- * instruction).
- */
-#define __try_cmpxchg128_user_asm(_ptr, _pold, _new, label) (1)
+#define __try_cmpxchg128_user_asm(_ptr, _pold, _new, label) ({ BUILD_BUG_O=
N(1); 1; })
 #else
 #define __try_cmpxchg64_user_asm(_ptr, _oldp, _nval, _label)		\
 	__try_cmpxchg_user_asm("q", "r", (_ptr), (_oldp), (_nval), _label)

