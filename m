Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D934B436367
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 11:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906920; cv=pass; b=t7DclCNLLHrJZMWaXTNgK+o29XrQ2ZgsbgzpXFzdISxnVnczdROeN5Urcrmsln54F+ZaLJWfaBDO9WHNPf5Qr8nOLE9zoyAmD+tLSY728GiMtN2eoJCoOTwUhmxHzJo2MHhiqdYumZU1XHjlVfYtPo7pCFcSiMlRuPqibevQfLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906920; c=relaxed/simple;
	bh=dYoJPC7hXSm9fVbKu4PhTwv3WPvl9gDbfz5qduX7Q4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eu6BXEkqQnIK/8SEo5yK4UM12kvzdxo2CTw8F8O3ttc3Zkgzw2DSrt1lhoTOY3huRnm41CD9+4Fo8Iy3SsUk2sk1gLowEt3OQOUxC1DjfWn2BDAVHj0Gn3YK+8Lk2c0DXo8kr9pXjNOiDs2BT0jGjAQWwdIbQ31wxXfsR+tj0rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ZlTezL61; arc=pass smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ZlTezL61"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4955cd5da3dso220029b6e.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 04:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782906917; cv=none;
        d=google.com; s=arc-20260327;
        b=gtFwFMEpMElfhr3m4qTrtv5M9+15X0fkiXB3kADfxPJc4HekooBrjrsSzH5DUwqucB
         FmyvXrDznXHvHMfW2UmlmvTJA5ugUqt48stweLrLuMbh2SGwf+LJGKipOA43RaPZd0GD
         lRfnfSIbX2NuJQHMvSEyT2ZfUnHTtCnaFXPiLLtS+HjK06iDzJkczmo8STyu6x65IyLy
         AWVFKJ/YU2fsSDYTBFsYZT3lilMlwyVrEDG1QNtD+pzjGcECJqlDj+8j6rhzm86oF2hD
         khGBnOgEIiYvFKp2FuEaAPQG2llP46rvEKchiNcWRZqiifh5CB+yy5CWNbv1mg8oCwcQ
         cwVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MAYeDwymAC7X4x23ohH+NiWECqUXh62wg52gYJBSoYo=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=az/3ZN1IwQ0et+pHQIJP7s1P6y1Ry7h3ZqMJLPpZyDc5dUOXLOG2x32XDtUAZXWuuU
         68diFO9LpaxMXZW94rCDYqlyWeq+r8xRGOCJoXOaFkwVX9QttQ9EWnn7MJIMBQp3zSLM
         cT50mPoPjQGYUaJr9O1zoLkRtP44KeDHnW6Oba9RAnzPMeydu+aZxptzQ9ZY7299IJVv
         ob1rn7cQ+3+92Biv2kSVSfdnx4pIj6AiYHvKZ1QKIbOaAML7oUMjCtWiTLV68J5U6VXU
         4Io5mduZvrzZO9vWchQk7LfhCtTHOgDcTK1SlfcFpBuYKkDUz9nCIsdrbhkAVgqqOfH7
         j5Cg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782906917; x=1783511717; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAYeDwymAC7X4x23ohH+NiWECqUXh62wg52gYJBSoYo=;
        b=ZlTezL61hG9gCwPKnbqy7KhLm+vRh26uzrWn6/4Pn3ynGerFaAJjRd1SRYTvfXselt
         uHcwsqwe7c551uo8zOXvsVn9LmyF2CaySf7SVn9emHEYMz5UJb2C0NA3z0soVVA3XUWv
         aJoHc14K95pdiIJDI6BCV6H7Oqn9D5L3D6RPDyUu3t9e5exHxjjE9LKfHM7qMVu0K3d9
         KyxwBNpZrV8T5yKr87PQqCfqp57ySboKhYwdFrLB1PKT0CbhxYolbdZE4QS0wzo9DqGd
         T4DeGUTh+ybHp+Cs3EdoaavHcXHkTukApMsQ/+xRu85Vs3sSIC+u7OVshFHBjqFC2zaW
         IiOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782906917; x=1783511717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MAYeDwymAC7X4x23ohH+NiWECqUXh62wg52gYJBSoYo=;
        b=sOLielEP2gqDLfV8P01BreIFmW2CrIgVkSeLj7ugkLFfzNpKlpSJ8iXm0hTLTsvsFL
         IOXZ7oRZ02ZgQIUXBqk55V5bOQ1fYNDsAiRBehRX7qdvrIJzoW/r2W91TJyZfQQnju79
         gpxmBzYU2QjdxzHNzra1qtonXUDHAxlxqY39pstRtGTOoukQliKa3zsD42lepk+7dLVW
         GeoF6v++SkYyYXz05//RCxnXb686BDzNCPG5lA32NiAkRg5GktyaJQ6Ne1ZHbdJP3D4S
         LiMAm27/EkapSAaWXw02An26wgTR4ZIBO2EELf9pDnadlq8j5BmdYIL7lEaJXD/ThqLK
         iG4A==
X-Gm-Message-State: AOJu0YwIHl1l8EKDIe7t1Y6WpSnsH/GIVP1hZVzwIr2krGUQgdp2jOdG
	xrhWHRbS9DzTrETau+xHnfmxBQ6XJMuZvqTgEfbwMHBIvpmPwQOKdQcGmo+roBYINXQw5JX+CV6
	+xd/sX9TOlDY7kSZjMNkaE+NwkRN+nnQ2beoLGb4dikFtU8XUuPnSWo9YOQ==
X-Gm-Gg: AfdE7cnk81kzJuruOy8FktEvFxyAxTmp7xL6ywBXhgfT2tJChkn59In5ZYIwOb24PCQ
	7lSLfwmTTOZ0jVR3aap98+3Phz7QLkuanPee3Fdrs1ayxAuVAs+Q1NrsmwVE8EMZ1uWKm+NGLMd
	UxXlG5PRBMgijO4b1QIgfZ4pRKmiaV9NjqD53fg+7o0srpS36mEY3tmpMSC/y4ijJN5v+czgTyx
	0Pxl0RmyohF3UBj8RZpYNVdyZYLKXey4rmBpN9u2iqQiQvBsKLmNHyYPSJ+q73nfRAxuB5Tjs0+
	8dvDF8ONfg==
X-Received: by 2002:a05:6808:1390:b0:489:6c24:9d26 with SMTP id
 5614622812f47-4960efea9c7mr617068b6e.27.1782906916701; Wed, 01 Jul 2026
 04:55:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1782877663.git.cuiyunhui@bytedance.com> <d6afed2c271de42efe2a3580ea30c7601cae9c0c.1782877663.git.cuiyunhui@bytedance.com>
 <20260701043814.0FEB81F000E9@smtp.kernel.org>
In-Reply-To: <20260701043814.0FEB81F000E9@smtp.kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 1 Jul 2026 19:55:04 +0800
X-Gm-Features: AVVi8CfLLTuKZzTE6HiqHPSHlVJOiUgvKHk-2H8WqqXcAJ8qtR4JfhzgBPojFdw
Message-ID: <CAEEQ3wkwP+y6eFTO+KL3SbZq=S6e0AZZB5GuAFO+4AmyoCfJRQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 2/3] riscv: introduce percpu.h into include/asm
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi sashiko,

On Wed, Jul 1, 2026 at 12:38=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Missing `<asm/cmpxchg.h>` silently drops NMI-safe ZACAS optimiza=
tion and causes arbitrary compile errors.
> --
>
> commit 81a0db6d3f915424f8959abac9007e01a81b105c
> Author: Yunhui Cui <cuiyunhui@bytedance.com>
>
> riscv: introduce percpu.h into include/asm
>
> This commit adds RISC-V specific this_cpu helpers for percpu operations.
> It uses AMOs for native-width operations, and Zabha or local 32-bit LR/SC
> fallbacks for 8/16-bit operations.
>
> > diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/p=
ercpu.h
> > new file mode 100644
> > index 0000000000000..46f1901d3bb88
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/percpu.h
>
> [ ... ]
>
> > +#define this_cpu_xchg_1(pcp, val)    _pcp_protect_return(xchg_relaxed,=
 pcp, val)
> > +#define this_cpu_xchg_2(pcp, val)    _pcp_protect_return(xchg_relaxed,=
 pcp, val)
> > +#define this_cpu_xchg_4(pcp, val)    _pcp_protect_return(xchg_relaxed,=
 pcp, val)
> > +
> > +#ifdef CONFIG_64BIT
> > +#define this_cpu_xchg_8(pcp, val)    _pcp_protect_return(xchg_relaxed,=
 pcp, val)
> > +#endif
> > +
> > +#define this_cpu_cmpxchg_1(pcp, o, n)        _pcp_protect_return(cmpxc=
hg_relaxed, pcp, o, n)
> > +#define this_cpu_cmpxchg_2(pcp, o, n)        _pcp_protect_return(cmpxc=
hg_relaxed, pcp, o, n)
> > +#define this_cpu_cmpxchg_4(pcp, o, n)        _pcp_protect_return(cmpxc=
hg_relaxed, pcp, o, n)
>
> [Severity: High]
> Does this missing <asm/cmpxchg.h> include lead to build failures?
>
> Since these macros rely on cmpxchg_relaxed, if callers expand them withou=
t
> manually including the atomic headers, it looks like cmpxchg_relaxed will
> be undefined.
>
> > +
> > +#ifdef CONFIG_64BIT
> > +#define this_cpu_cmpxchg_8(pcp, o, n)        _pcp_protect_return(cmpxc=
hg_relaxed, pcp, o, n)
> > +
> > +#define this_cpu_cmpxchg64(pcp, o, n)        this_cpu_cmpxchg_8(pcp, o=
, n)
> > +#endif
> > +
> > +#ifdef system_has_cmpxchg128
>
> [Severity: High]
> Will this macro evaluate to false and silently drop the NMI-safe ZACAS
> optimization?
>
> Because <asm/cmpxchg.h> is not included, if a file includes <asm/percpu.h=
>
> first (for example via <linux/spinlock.h> and <linux/irqflags.h>),
> system_has_cmpxchg128 is not defined here.
>
> Does this cause the kernel to silently fall back to
> this_cpu_generic_cmpxchg?
>
> Since the generic fallback only disables interrupts and does not block NM=
Is,
> could this introduce a data corruption race condition if a percpu variabl=
e
> is updated concurrently from both NMI and normal contexts?

I will add <asm/cmpxchg.h> to asm/percpu.h to make cmpxchg helpers and
system_has_cmpxchg128 available directly within this header.

>
> > +#define this_cpu_cmpxchg128(pcp, o, n)                                =
       \
> > +({                                                                   \
> > +     u128 ret__;                                                     \
> > +     typeof(pcp) *ptr__;                                             \
> > +                                                                     \
> > +     preempt_disable_notrace();                                      \
> > +     ptr__ =3D raw_cpu_ptr(&(pcp));                                   =
 \
> > +     if (system_has_cmpxchg128())                                    \
> > +             ret__ =3D cmpxchg128_local(ptr__, (o), (n));             =
 \
> > +     else                                                            \
> > +             ret__ =3D this_cpu_generic_cmpxchg(pcp, (o), (n));       =
 \
> > +     preempt_enable_notrace();                                       \
> > +     ret__;                                                          \
> > +})
> > +#endif
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1782877663.=
git.cuiyunhui@bytedance.com?part=3D2

Thanks,
Yunhui
