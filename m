Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9B23002CF
	for <sashiko-reviews@lists.linux.dev>; Sat,  1 Aug 2026 04:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785558291; cv=none; b=MJzQ734wirxBG7oKo5+6YHrgz+D11dUR9w6jYGVk7Ak8KmFha0wJ9paLPxM/btRhY+jts00MEXK4xOq1yhAy4Ojc7c7HKWaQqNQC0/Kfq0RuqZ5pQAouGCX5HjcM5g/gsfMbIwy55gGeiHxg4+HCm10OFQmdp076xz3PmHZm0Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785558291; c=relaxed/simple;
	bh=lDYUDxP/lDGSCE6hDpFV3ABq3pHahiX/aPaGe7ihCyQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yd8Sss/3FR+qsPlUfPxVdANy9NSqCbEOBIy5UdzRyHz1vObfNIgSuScpbqNl/Rcj5+6gV9JW6DSUUk6XH9edFYH0SGcOBmtGnXXvPGALcZ+WB/dBfrfiv478KleW1AEMEOKvfw3KtTxDrUubkx9pa/zuzO2zT/EFlNWMBEwwE6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NKZIqkor; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NKZIqkor"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso16898655ad.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 21:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785558289; x=1786163089; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HtMpVhwDnG7mvnwmH5nBVScIT+ojmGeFtLmrnd9auNI=;
        b=NKZIqkorUZppLWGabx/7MpsE+UaIbtHUPb9dlYyorddiGvOJEAXqu3uF1j65J2GWIf
         VjunoKsvDZ4zG2dFpPY7EHYIODvi+0LmHW4m/WsbYaQke7IMexyBkQ8cLdy19VcBFmPF
         w7h5B+VTfD7Z5e0cUmUWwPZS7+MEQDVHrNcTEw3t3TbYJSmOLJk/fBKrJgJRKQj0RRx2
         lKKckD2ZhAEmrHVs72W2y/Z2TvWTltmHEtqHeIq+V+E7d6R+Vi0gUqBXmiTsbohZIR9Y
         Spot6OhU3BUMYXIjhqACQCw/aHQRW/fbHnF7feMUg2b3zDymvgdr0+0j3p+amMU5K3yP
         Datw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785558289; x=1786163089;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HtMpVhwDnG7mvnwmH5nBVScIT+ojmGeFtLmrnd9auNI=;
        b=DOGcLLNnQASviob3qRpQEqG2w9+xr78zLFdQ0y21kwGw+bDsEgG0X5ONDrEKvj2cmh
         N+OmdWvctnN7tzoYh6ZYo/gVLT4sMuaf9WZ29KyktrxU9F1fU7+PZ30QbbvcOWZL4FBN
         cBaWoOjFO/Q3B9U6ePXtEDpaUkk7CeHpdRoNowlAh+cXeMZRbqFyMXLd03bDOBibxSLj
         eHtzWKsRW5iSqpw9mAnLVaNinHpTDlmh1LrSDHB9JaMBMLYO4tY4txPC44q2gBD4PCXq
         ZF8/oZMJ9RwiBQ7WxgDn3jKDtbEzXeWoNtMHz/nceKxt8bBLsIO7gN1+ul72xZSdF0xb
         Htlg==
X-Gm-Message-State: AOJu0Yy8PJgeAjg8RapAPkXMU/sKPW2IH+Iauo2fuifEds2RUB60se5n
	cKA16/stjDWQaMhOK1Y2YtBVutJI2Lvg+Ah+PKc4XX5SxEj9eqVElvJf0PePNzVc
X-Gm-Gg: AR+sD13IxXbByjvuFbB8sSwPJ2syvjQNz2CVK5bDFoV9GxydmaB8R3e0mTeYZ/+1bzY
	3mOXJm4lViptYkwL4yCrTusACGoxuewJ3n+9Jsfhn+uYT7nWC8ZU6ZNE0JqO4D68gdQt8ZTkb9e
	zW0QnUl1bNXudO2aAz6hhfl6urvZSF6jVfvL0KHt+jBRbH4XZVQw2LNAI1V1KseupZcof7TBbm1
	uX/1IBpBgHS7rUZ6vV2YZVYPhonZFpqUFQ/GZthtmdPpZGlGu2xIIT/oqLp8SqkU5DZ5+zNDEAm
	t26P2gPGiSQiO63j4GMcyyZGVxNwcZ0vd9QGNumKnHEiKeX79JxWLEEZF6y7XpsHv8DU9STSJyE
	oOcy6JOC+LFe7hzzf66xHbcM9BVQMoei6QWnCC1ePWVAkW4yogksm9DDD7P30aHASD2LEO6pq/U
	hPpwncUGu2C2kucEhFDk87Y1KCXp0TtpfvBPHY4q+5oVrdQ1pqfUfzkAHVH2aqjYOM4RERqctwr
	i2qtJ+a87H67Yzy
X-Received: by 2002:a17:903:3843:b0:2c6:a012:6241 with SMTP id d9443c01a7336-2d05219f33fmr24041995ad.6.1785558289372;
        Fri, 31 Jul 2026 21:24:49 -0700 (PDT)
Received: from [192.168.0.13] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04b0eb486sm13303955ad.53.2026.07.31.21.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 21:24:49 -0700 (PDT)
Message-ID: <2f158b4b9df959e604edc14603a23782ffed9bed.camel@gmail.com>
Subject: Re: [PATCH bpf-next v2 5/5] selftests/bpf: verify zext_dst
 annotations for various instructions
From: Eduard Zingerman <eddyz87@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Date: Fri, 31 Jul 2026 21:24:44 -0700
In-Reply-To: <20260801013321.6ABC51F00AC4@smtp.kernel.org>
References: <20260731-static-zext-v2-0-da4aa161e8c5@gmail.com>
	 <20260731-static-zext-v2-5-da4aa161e8c5@gmail.com>
	 <20260801013321.6ABC51F00AC4@smtp.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Sat, 2026-08-01 at 01:33 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] Missing bpf_testmod dependency check in test_verifier_zext, ca=
using spurious test failures when the module is not loaded.
> --
>=20
> --- Patch [5]: [PATCH bpf-next v2 5/5] selftests/bpf: verify zext_dst ann=
otations for various instructions ---
> commit 9e656f5e6b04a69526327df6f70d8c362d02d3d4
> Author: Eduard Zingerman <eddyz87@gmail.com>
>=20
> selftests/bpf: verify zext_dst annotations for various instructions
>=20
> This commit adds a suite of selftests to verify the verifier's zero exten=
sion
> behavior across various instructions and state pruning scenarios. It cove=
rs
> cases like 32-bit and 64-bit operations, atomic instructions, kfunc param=
eters,
> and CFG edge cases.
>=20
> > diff --git a/tools/testing/selftests/bpf/prog_tests/verifier.c b/tools/=
testing/selftests/bpf/prog_tests/verifier.c
> > index be97f6887f0e7..fba562c819691 100644
> > --- a/tools/testing/selftests/bpf/prog_tests/verifier.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/verifier.c
> [ ... ]
> > @@ -277,6 +278,7 @@ void test_irq(void)			=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 { RUN(irq); }
> > =C2=A0void test_verifier_mtu(void)		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { RU=
N(verifier_mtu); }
> > =C2=A0void test_verifier_jit_inline(void)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { RUN(verifier_jit_i=
nline); }
> > =C2=A0void test_verifier_ctx_ptr_param(void)=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 { RUN(verifier_ctx_ptr_param); }
> > +void test_verifier_zext(void)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { RUN_TESTS(verif=
ier_zext); }
>=20
> [Severity: Medium]
> Since verifier_zext.c calls bpf_kfunc_call_test4 (an extern kfunc from
> bpf_testmod), will this test fail spuriously if bpf_testmod is not loaded=
?
>=20
> Should this check env.has_testmod and call test__skip() before RUN_TESTS
> to gracefully skip the test when the module is unavailable?

Idk, bpf_kfunc_call_test4() is used by the test progs/kfunc_call_test.c
prog_tests/kfunc_call.c, which itself does not check for env.has_testmod.
I don't think we enforce this rigorously, nor that we should.
