Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7603C52ED59
	for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 17:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792172831; cv=pass; b=W5yapCc1ufKgdwHWe+II5nDPhyXi1DvEo3+SkZ/SFmQ9/f7eEIqVuheBgvjiDMQ4h8LdFAsHddXRhWZ+15FFSHxHDgnHoKIuwcBavzNPMBySAK8R6MQr4imI+jL/KRGytW1dJf68g7vsCMhTmx+zz7sPRzs+yhbzqqMy9isuwjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792172831; c=relaxed/simple;
	bh=uSlajszt+v1CRapk8IvXExaGgd62+VPOnKY9eJlACNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7KX2XBkcs5JEceUdckktLIV4F8Fp7Nm3c0VsoEYrPIheZPOHqfN+Ijie2BLSbio9HDhVr0lRTFLnyT3tpMJ+/tTbLDjfL7Dy+NgT9GKclSSVvIVGrUOEqE57ZvYfVouWu38oa3maib0L/wAxPnW+8mbUUKjzCEaJZZ07S8Krcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PolLy4In; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PolLy4In"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c40f29667e6so29294166b.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 16 Oct 2026 10:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792172827; cv=none;
        d=google.com; s=arc-20260327;
        b=PC2c/K6Q/AVWd8mQZSCbYZXjEopezmxWVQapqacNexqNCdCe+Co7CuxiulDB1n/VTf
         QLGpNGfYwk+ITM1Yzy5i8PKtaokBH6gpHMKJuw1j+porilkxlb0ziv9kuxJ+L6fMFOS9
         ZLaNII1O3P1Szgh7I4dgwKSX5BlERIdySP0KaSfSHrXFoRQQu4vTdA1w75YDE5YY49/q
         HJ4MREZ16cMXVPnQnPMijXCk4sFyw6SKYgTW6xEgyKc/v2QclWsCr1m7Wc9T2i+iLMyL
         TKl9VzOKW2Fb7QrZt6PR0oC2bB14CBOA2z/MaP1u7Y/ZnfPGvOx2hko2U1iRh7fQdL/K
         RHBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gHgUB10P5VN5xvPA6XcNoyN3ZPY0VdZiK74UugihdkE=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=ZpIi0YqdB7NH32FQtidmwdqwEkp/I87/qzXIblzcBKYY91TQxR2OPmDak8feZNrCHv
         CR2Yy2tdEujNGVvUnmtGHhfnHh+07h4YCR/e2uoz7z0pNY4zoMeWWXaQBMYHgo5cEEpJ
         oOO5qcy4Dk53Tay2lzFB+0e+iEEEb6ckWLavEGkXCQgXCgEVxpVin2nnvzZpvh6MYD0O
         dLBOi3IaZNlc8R3kXYrXo8LaIxBYX+OGcIxF7vucQpD7qsEdgtCgxbXUPPJd8sOAL3Dd
         SBEjlAYHVKE0EPhsa6mcSABtoQIkMpxtBTnoQdXOkRjHAdxbI9ULWftj5WyqeHtXaPdo
         NhEQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792172827; x=1792777627; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gHgUB10P5VN5xvPA6XcNoyN3ZPY0VdZiK74UugihdkE=;
        b=PolLy4InnTmsZZmsaLMbRsGt80f38IPEVOCfPPMjfltVAE3Ln7kM0aJzxuc2hR4wh6
         jKvseq8g6BUWqufswyIpQCu0lCahga+MzMuq3aFsAnl9V2NAMbvkdFmHZXNFKr0vkI+s
         WSOhYrTopyLYiaMQjPQQiR1XUhp1qSwQ+VR2WRFPfBY8cKuHwbvq9mT5+A7X7loHV0FB
         wEqljmDW26Tvyu4d8Zhqycc9w9gfMo4p/KrY6ztez+CJLrWtXnJyhcH55qM9im4nzIQ9
         kcGa+zEqM1lK+VuN4Lk12LRJnEn7UF9HEUUFTWMnIFISWsqCniPpWXsRjTrEzLUlgfrN
         5PHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792172827; x=1792777627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gHgUB10P5VN5xvPA6XcNoyN3ZPY0VdZiK74UugihdkE=;
        b=ONMlJ7krnBQnWdLHBZsCPQ7BMpe3fyLWGDxVE8E0teljqHCh2znUZG9e3Xw3GI7jAc
         PgohrliPB5bT1FxhLFSnQlxVd4pNwquknjKBDGcQqEoLMQOaKdk/4l2o9VYV3lUlDD0f
         pMD7nDtqFCt7KXTRfYPZiOsCYTpNUuTDu/BhmzWj1RQAG3uwAB/yEhKPFxPzeBzKysHH
         LROPn/PL4fvc+Zm3IZISsa59nGldbkcKZ6hCH8WL7XNlMRW5VNHVO2e4Gbvm3sBX3zJh
         4noSRSYKLFXxtyHVfsQNFF2BCkbPbx3QYzSa8JW8FnVRZdNY0Lv2B6ZMltgQz/XqdpLJ
         cZjA==
X-Gm-Message-State: AFq9FYKBZf1nIczH28KfQRVPyxtpfrj/uIqqTv8TR8WeEtZHkQst/Fii
	lQkg/0L/0pzOEaP6tEmYgAncZ3T2pEULXq004K/m0MY4cNE3ZQcJNkf9c2aIIG8Bn0tzddIR/H1
	96nQRe2qRfQogVJ602eR8L0bbHWwRDA9LpnoRQ1jm+w==
X-Gm-Gg: AYBFou2mudMcZCxT/zNfxBcwr922mnaUubV3QEdsFFtesd3rqXq6l95G9yaX1EFNLii
	gaXdSVQWKYAxV6o6Nh6fkLsRC6VqFHb9nzAjcOmT/I5VTp7cM/J/Br39+jEO/iB2bVc15UX9jfW
	IxVBnArXoVu91QCP0MUMLqxb9SWtNSKQ/8yYnW+RL4a9SB2wCE/FjcFADLhBCGrS1gjxMT4f3Uy
	WWPcTdsMy2u5/bg4YBvBJQgjV2GmAEMr+Rl6r3YuKLKK6y6dKle1/3J/pgjghTh04k0TZaBfVH5
	F7Oyhf671sUPBcAPy4fL5FXZWch6dq1jsjQHxGefDb8vgl/6vINKxyqVWCiL7voXTi3/NpxAD6G
	1oPjgNQ4kDIeV
X-Received: by 2002:a17:907:2d10:b0:c1f:983f:d8a with SMTP id
 a640c23a62f3a-c419e6488bamr43994566b.24.1792172827241; Fri, 16 Oct 2026
 10:47:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261016171319.1623447-1-puranjay@kernel.org> <20261016171319.1623447-3-puranjay@kernel.org>
 <sashiko-outbox-174717@kernel.org>
In-Reply-To: <sashiko-outbox-174717@kernel.org>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Fri, 16 Oct 2026 18:46:52 +0100
X-Gm-Features: AclHuK-9FKtfzxO3GrmHQgPK304wDgBltpq3vhcsxnC8jVAUThtsVhUdr7o1auQ
Message-ID: <CANk7y0h6hXXihv_x3O81uFyifQtQaupAhmJPZxCQF6tpqcLP6g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v5 2/3] selftests/bpf: Test fetching AND/OR/XOR
 atomics in arena
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 6:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] selftests/bpf: uaf test silently passes on ARM64 instead of skipp=
ing
> --
>
> commit a4f52eddc0e670a7a41a5b1939916ca84274f849
> Author: Puranjay Mohan <puranjay@kernel.org>
>
> selftests/bpf: Test fetching AND/OR/XOR atomics in arena
>
> The arena and/or/xor tests never exercised the fetching form of the
> instruction. Commit 2897b1e2a2f4 ("selftests/bpf: Fix arena_atomics
> failure due to llvm change") deliberately switched them to
> __c11_atomic_fetch_*() with memory_order_relaxed, which clang lowers to a
> non-fetching locked instruction when the result is unused, because
> x86-64 could not JIT the fetching one against an arena.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/arena_atomics.c b/t=
ools/testing/selftests/bpf/prog_tests/arena_atomics.c
> > --- a/tools/testing/selftests/bpf/prog_tests/arena_atomics.c
> > +++ b/tools/testing/selftests/bpf/prog_tests/arena_atomics.c
> [ ... ]
> > @@ -160,6 +199,18 @@ static void test_uaf(struct arena_atomics *skel)
> >               return;
> >
> >       ASSERT_EQ(skel->arena->uaf_recovery_fails, 0, "uaf_recovery_fails=
");
> > +
> > +#ifndef __powerpc64__
> > +     /*
> > +      * A fault clears the fetched register and leaves the address alo=
ne. The
> > +      * powerpc64 JIT does not clear the register of a faulting atomic=
 yet.
> > +      */
> > +     ASSERT_EQ(skel->arena->uaf_r1_after_dst_r0, 0, "uaf_r1_after_dst_=
r0");
> > +     ASSERT_EQ(skel->arena->uaf_r0_after_dst_r0, skel->arena->uaf_r0_b=
efore_dst_r0,
> > +               "uaf_r0_after_dst_r0");
> > +     ASSERT_EQ(skel->arena->uaf_r0_after_src_r0, 0, "uaf_r0_after_src_=
r0");
> > +     ASSERT_EQ(skel->arena->uaf_reread, 0, "uaf_reread");
> > +#endif
> >  }
>
> [Severity: Low]
> Does this test silently pass on ARM64?
>
> In the uaf program in arena_atomics.c, the fault testing logic is compile=
d
> out when __TARGET_ARCH_arm64 is defined:
>
> #if defined(ENABLE_ATOMICS_TESTS) && !defined(__TARGET_ARCH_arm64) && \
>         defined(__BPF_FEATURE_ADDR_SPACE_CAST)
>
> Because the BPF program does nothing on ARM64, the global variables
> (uaf_r1_after_dst_r0, uaf_reread, etc.) remain untouched and hold their
> zero-initialized default values. The host runner here unconditionally
> asserts that these variables equal 0, which makes the assertions
> tautologically succeed on ARM64.
>
> Could the BPF program export a flag so the userspace runner can explicitl=
y call
> test__skip() when the test is unsupported, instead of silently passing?

The suggested work is correct but the underlying issue is not
introduced by this patch, so should be done separately.
