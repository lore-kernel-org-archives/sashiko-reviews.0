Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B19D7260F
	for <sashiko-reviews@lists.linux.dev>; Sun, 31 May 2026 01:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780191885; cv=pass; b=QOUl2cpEmE1c//mmuUq2vwUCTjqz7aRjNZeGGVGtyzadyF9y7a3g+h4mAwilH2SLOxSd6EuF0qrguVcyoG3a1MXjLGh53smzGQ5+3lJgiyEDhu7bAalIuL1T9FeBDawGSL5H5Z2qYs0z7uDY+/QpRoMTY5hXcFKrjHAx0PPVfeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780191885; c=relaxed/simple;
	bh=JY17uG+peAbC3rGOIzWPUWF2GW6zXnCaUG0CsOCyQgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SH17UnYCXm9ZLXFPqFioFflN4UFXXifxk1dgkm57QRCBdmVD7r6z2GW6m4kxaWflvaTgZiNDUYGDiLxbnRts0CaHTCcNjAXcDJer/iRiUdeGU4ujowfvBSvvKT1Zd63oGdQGCfD/IolTTPvlCvji0uoMF4mYpzPdsF6lCE6eAGQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a4UdNWMV; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a4UdNWMV"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-516d6009380so281cf.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 30 May 2026 18:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780191883; cv=none;
        d=google.com; s=arc-20240605;
        b=aYj5+kLMoZBJp1RQ7IIJOCC6qpGXJZEwIL4HXfaUFRGRkMcnA3Z43e0T/7zGweNKDd
         kMS1uRIOWTtImn698HT0GjyeRLM/rNjiOoifTGOwEVpvNXenVCUfPSGdvtOR3Y7e/9Ub
         jfXCufHyIBNVuX0F2TD/hsi+IcqjYAufukO6V0H3WWBR4vFDgG0Y7xiesfvmZh84RU4w
         2uxvF1WM9wO/sstApoF5yR00qV6z/8JdgVdAWuWnEh/MPb9HdskRKXSofHLxuCKFRFmw
         k+4FdjzpjVNxXElSZxl45BiqbO2VxGsCc9IfOdt/upcuGjgGWpX/kCDV8b9o3flgZOwJ
         DB4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ilFSrviVs31RIfLP4HkhrNfgU+I8AsONLzeZnzt4ues=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=OGbrsBeCH1+ZXp5XVZOZfKwaSQN+T73Ic4/+ZjwdjFmhoj8ZmTFA339zWkQXFNeUq/
         WBK3uUSSQollOgFOtVf5uDBgDGqi8RQOVX3D+xI77OipyAVUnm2e0Tg2koxqOxYeJLxY
         vK7zwdt0vnzmV/ECGHu4G6aMZQpJsPfXkXx5YRly/bNGuXvFQRvk/2OVFvNWXTDCy40V
         pCffvLjFzkUSvnPZ19KXAkezefLmDXXdpRnSv8bD9QCB07QY6L4yWzCABBLMsDqxcV2r
         40+VPecQjgFrSUDNTwLTnMW6EU2xuiWAAmuU2TWUueXhCGHA/zzTjVFDOY05uApIxYp1
         q2+Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780191883; x=1780796683; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilFSrviVs31RIfLP4HkhrNfgU+I8AsONLzeZnzt4ues=;
        b=a4UdNWMVYcbkY0SnN6jCvKoFzNVQo3eVsftQ2BO2C4E8HxkOwkHBCNvCV4/Ai2QtA1
         7Wv3SAaZUy4EmVMElYN05pXSyTGo6KH7wy469TrZvVNWls7KQcXkiTmVhWnifJGUwF87
         GuWg1f1zOnUbBpej7vbVbU0S+HWDBW2r68Vr5Zc49by1BRg+GIPPLU+v1hu7ay+RhWh4
         HL3priTY+jTIIm+7FHBNECzkuhAIAMOA+pNdN5IpEtI85FHhNh5DItgUDl10G2wNS4ge
         0+ynz/dejnq1+OhwEt02XZVRlA5CsdJIJeURufbDdd8picG6TpirZKZWbTZBKe05nFuv
         NaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780191883; x=1780796683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ilFSrviVs31RIfLP4HkhrNfgU+I8AsONLzeZnzt4ues=;
        b=kD9KJYM6XrKaYgnscNcoxI/td55Y2S1Y8CmAiY3qIp52BLDB5JLWJAiIQqLbWAAeTN
         MC+PTzjhBevuyTegqVv3WxwpovIlKFKNxw0bfOTMVwGOTpKO0YwBsFuDbOx2iHMdEiwD
         pkBT9TuVHpz6wXgtaqKVVPtzjPPqTgobtPq8iAWbHHbftoSikp3xi++gEILw25gp2o9V
         w/xF3dq/DJeWxLMjuhU78KjMAfK/9/1SlfSbtcXuYTCEts/SESgPd1UAKkMNdlVewV7A
         uE22iVCnV/UDwRHKsncWdp7zgBiRtGYuf9ZjqmkcyNEJVJCpzpU4CArp5ECUIR+tuXTA
         57Kw==
X-Gm-Message-State: AOJu0YwIV45UrnMGcdmyLMkLDoBAu4/7WX+mko7TymKt0d//ntIwauIH
	llTLdJpiItMJJ+0lnN4XQGivaJcZ0RXWNZtomjgCflwySyMbi+M0m4/DvEp/Y/As7Xp7kHwGnls
	jJQYRJR4IcID2Oe2tcL0JUsyIsUhqMxZ1LeoSB3slWS3V4iwgE+bfaQB6qCLwmw==
X-Gm-Gg: Acq92OFGodgG6yNif1VIzhreM9ERp/JdlxfzMpA6xT5vMJc3G76QBnTIeqVBmehrT8X
	2+khgyX8c4zq7i8qg9UlTZdW58jzYBaZGo2UI/NMSKGaGgCO5NtX3OS4VjafYkmCVAGKkm2AD6p
	DM6lUZFr25PC3DxyJHjLqqKQZsRXg7enr2u6c2INJ7wmM4cSgM42peuSkOTEgeLP0FjeSutTHYU
	sVyCnK33G0+bVy1Jvwc5p33tHmYwAok8dexX24qDYRG1SeWmMSgOzqlxO+UfIHuvxBE5TPFznfO
	VGjkZTzKLDFPWQYoiIxYv6WthxSYRYYBDdQYh5ysugUGy45RRSQwVZWHnnLbxgvB
X-Received: by 2002:ac8:7f0c:0:b0:514:b17e:86f3 with SMTP id
 d75a77b69052e-5173b68d02cmr4528551cf.12.1780191882675; Sat, 30 May 2026
 18:44:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260531004748.3567875-3-yuyanghuang@google.com> <20260531011110.F22BA1F00893@smtp.kernel.org>
In-Reply-To: <20260531011110.F22BA1F00893@smtp.kernel.org>
From: Yuyang Huang <yuyanghuang@google.com>
Date: Sun, 31 May 2026 09:44:06 +0800
X-Gm-Features: AVHnY4IzCADml3zKoYSyRSrNWNuSsrTy9RPkMx5SVD7WrajH2eDmneCa7VMWDJQ
Message-ID: <CADXeF1HQCjVXqaqFEGLOicNOC6Nc-ki59Eyu2iaMhf+A6QFiMg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 2/2] selftests/bpf: add verification for
 BPF_PROG_QUERY attr size boundaries
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 31, 2026 at 9:11=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] The selftest validates and enshrines an ABI-breaking kernel =
behavior where BPF_PROG_QUERY rejects valid queries from older user-space b=
inaries with -EFAULT.
> --
>
> commit a51bd156081fb623564c01426a789df272b5e924
> Author: Yuyang Huang <yuyanghuang@google.com>
>
> selftests/bpf: add verification for BPF_PROG_QUERY attr size boundaries
>
> This commit adds a selftest to verify that BPF_PROG_QUERY rejects queries
> with a user-declared size below the size covering query.revision with
> -EFAULT. It also ensures the query succeeds when given the full size.
>
> > diff --git a/tools/testing/selftests/bpf/prog_tests/bpf_attr_size.c b/t=
ools/testing/selftests/bpf/prog_tests/bpf_attr_size.c
> > new file mode 100644
> > index 0000000000000..4fbe56cb29d4a
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/prog_tests/bpf_attr_size.c
> > @@ -0,0 +1,65 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/* Copyright (c) 2026 Google LLC */
> > +#include <linux/bpf.h>
>
> [ ... ]
>
> > +#define OLD_QUERY_SIZE               offsetofend(union bpf_attr, query=
.prog_cnt)
> > +#define FULL_QUERY_SIZE              offsetofend(union bpf_attr, query=
.revision)
> > +
> > +static void test_query_size_boundaries(void)
> > +{
>
> [ ... ]
>
> > +     memset(&attr, 0, sizeof(attr));
> > +     attr.query.target_fd =3D cg_fd;
> > +     attr.query.attach_type =3D BPF_CGROUP_INET_INGRESS;
> > +
> > +     err =3D syscall(__NR_bpf, BPF_PROG_QUERY, &attr, OLD_QUERY_SIZE);
> > +     ASSERT_EQ(err, -1, "query_old_size_fails");
> > +     ASSERT_EQ(errno, EFAULT, "query_old_size_efault");
>
> [Severity: Critical]
> Does this selftest validate an ABI-breaking kernel behavior where
> BPF_PROG_QUERY rejects valid queries from older user-space binaries with
> -EFAULT?
>
> Older user-space applications (like an older bpftool) compiled with older
> headers will supply a smaller bpf_attr size up to query.prog_cnt.
> Previously, the kernel would accept this size, but this test now enforces
> that the kernel rejects these historically valid queries unconditionally.
>
> Should the kernel conditionally copy to query.revision only if the
> user-provided size is large enough, rather than breaking backwards
> compatibility for existing binaries?
>

The proposal in the patch is implemented based on the suggestion from
the previous review thread:
https://lore.kernel.org/bpf/DIUR88219HWQ.26T4D7ZX8CNTC@gmail.com/
