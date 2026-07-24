Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CE3EEC3
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 04:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784867291; cv=pass; b=V9R7xFI/dvQDLxecp5s1CBBXYoX9r8lvxfFIE5j4n4x4z4BHdOhXufJ0IlNDw48/6ecusS5JLYdknb06urnfyr6KnW932CYIO8J+6I1hL5uWVJrniC8qdshPpxrzIJeIpWgU7O3uYe4JjX/b8acAr8TKTkeH0xMI890vl2KYgbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784867291; c=relaxed/simple;
	bh=hjlFGHq2VYPYfj3lPmOr/26/QmhORDjiRk0e1q6TIzk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G3a2l8rQxEl1Fo03FHKFsvJYV9MF2+/MR+5THv/Q9qQ1bL9psb3t6UWflCMFrF+AfBoc6oCF+fnYVrKO2SyEDDCJSnA2oDX0jl/utPMqtYD05Le/5XL4oe0YDrWaOpVrlc1fEv2Zy9zxthlOLaYlVuBOUYUVH+DAO0RFyGWI7F0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSn1j0cg; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSn1j0cg"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1740c36c5cso2309466b.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 21:28:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784867288; cv=none;
        d=google.com; s=arc-20260327;
        b=EMAv9QNEPhZ2nQDngSJbZqEXhkMe4iFgOp4krc0f1vvFtm6eRWxeSjO0a47Gq6YKhF
         wYktmzxMVix6cqRlq8rDY/9Dq5u7XOB48O/0fgAwK7AF/KMSe37/lRQo4BEXPr8QSWQ3
         iP1BZlil8b5ZX2rGrCEM9GOcJNfPE1On+paVfux75zOL4zgIrVhrsPOZStk3W8bq+R1A
         Uhda7MRVW5VQ1LCRQQgZaIUNKZ53HCh2iLDx6VYRRyQgP8dLSbEoEfRlv5oAnvKyNHKO
         JMtfSDlBzc7r78g6huV6GVXONWm/pmOm6JJLJzxUFtspV2TqQZ6kRmPDwZu9tij84S9+
         +G1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9+3Kex2RPCKiUUu1M2ayq7cE1n3GCcPXXxPBF2HtgE=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=tCyxlN4fRBQmVQLWEjcuuqPJqBaioDlYJBuJRDqPD4K1nf/hxuF3OIZCaHLe8T8ngA
         PVmEF/JFGABqFDWGWQfM5POehgAAnCWPxIZKRN2bWSYvVZSpsaWdlT170BlPvoAqn3oo
         ksMlHiqFH2HjUPAu2do1geNiVuc0lZzJ3TD/p2n/RxlCNiNcmkVrVlip/sUFb11+beHS
         yP/sN2gP+/RRb6zeneUCGeGcdzeiPdIz4rbrlkrkiCfFasmuKhSSzX3XeICkbo2lUJ9u
         nbKOIKhtUAQ9KBEM21OooAg8BqDiiILvEtfTZ8hoYxjnpMpsvaRSVaZXzNsZ7eU/iiJl
         +5uw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784867288; x=1785472088; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c9+3Kex2RPCKiUUu1M2ayq7cE1n3GCcPXXxPBF2HtgE=;
        b=pSn1j0cgDMh0XzyYQCz+Yj0MDCyb6GhIXPV4kOEniES0mcRmZXdvAuykNl4JN8OX41
         1ru/RsjjeAjvdzejhf1ZmluKdcaT/Y8F9L6RKtgXdSNEB4cmfNPAigmc1eo9HmME4Dl5
         d/kPOqFoYhTbbXbhg3BAJTzBqeYqhaWWZmaYLyeahCiAQQXy5c4bY13jc0I9fzj8bQ7b
         A/H/d4nT3M0+MZcLwwf6dEc1h4Vbi7tWudqq90VNvx3J7cMJuezL1SgVtBIutnY7ksTK
         HMzSsVnlcsPP7rxhlTX0Z4LSzQBs2m04jgD3EO+wGxt/SNIt5+rxADcawvVfcQzwaw1G
         7/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784867288; x=1785472088;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c9+3Kex2RPCKiUUu1M2ayq7cE1n3GCcPXXxPBF2HtgE=;
        b=gK7RlEmN/7q0n6VUJp2lZQIbhPCjfigW0nruFOYS7gUuC3IaSavo3vwbkxMkiXoj0H
         1CfyRwVi1yNurxrGsI4DIyliNIuTzeR0qxVkWfZV7ku1VVOA6bW7+UQqXqMEy+V6hU6I
         vozoYehSznhWTWzm1oVd0ngNau39hk0smj+WpAHDgkFu8gKixJ1MeK/DbEr9nR9Thf94
         ZjWbkincv2DraDgOgCYs0gOA8yvOFozIZcod7TJh1R1yhYZphfiFE8XJZ+vBOXg3whPJ
         8XzOGtBdXHTgSrB/Yu9z97PasSu+dqsctMxjNZ1rek6DdmKot+/87vfR99pix2ZQbwKA
         t9eg==
X-Gm-Message-State: AOJu0Yz30yCsbtpQq4YNVcg3dvx62jEnozULJ88NrqQnc+3rV33tXzvw
	uVOc4CIHvWizkkFHqrtGhSuP9NzutFTU70TgNqCkL7piCUtuczbUPjDJakWgyYQ9hWiz2LP0Na0
	4TN91DsUjcqf0pVSByo0eEwGBHkAhEj+wRVMTgA0=
X-Gm-Gg: AR+sD129BVZ1COItx210XOgBrKzFgNlt8+51IHkB//UHyKT8V9Hy6sy6qHmV5bRN1Q0
	KCLXb17BleHgG/IKcFJbGZoB4nTZN5NJlLgEJ3X/KTM6i0lQZOjv9SSGFI1fTXmAovskCwr4cv7
	06vcZVVqmQuzRDDcCsYldfN7bDv05lTEKyg1dQjYiV5DjMg7bECIZcVNNUFJrt/y6qw4dukTSuz
	nt5/6osm2JomlWX+aIPu6PCvcQT04qp2fjnzc7f5nBwUlb9rlDM4j7l5ol7PzsBlrWGLiB/hHI9
	MC8kcpL5KEhFFgqOO9OXPTuuzLohPA==
X-Received: by 2002:a17:907:971f:b0:c16:589d:c965 with SMTP id
 a640c23a62f3a-c1c5096678dmr277726866b.46.1784867287874; Thu, 23 Jul 2026
 21:28:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721194111.334795-1-nickolay.lysenko@gmail.com>
 <20260721194111.334795-3-nickolay.lysenko@gmail.com> <20260721195216.712FC1F00A3A@smtp.kernel.org>
In-Reply-To: <20260721195216.712FC1F00A3A@smtp.kernel.org>
From: Mykola Lysenko <nickolay.lysenko@gmail.com>
Date: Thu, 23 Jul 2026 21:27:55 -0700
X-Gm-Features: AUfX_mzXoE2FJPFlVSc0CQI2QYirmr_NCdU04ciEYdOBL58QDaLwTEjGBLAhwxk
Message-ID: <CAMtxOX3VgWQPzi9FPZxarbOjsMvHAXM6vVYnyfpg1BN6dg2Srg@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next v2 2/3] selftests/bpf: move shared build
 definitions into Makefile.buildvars
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

addressed in https://lore.kernel.org/bpf/20260724042600.175440-1-nickolay.l=
ysenko@gmail.com/

On Tue, Jul 21, 2026 at 12:52=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The variables TEST_KMODS and BPF_GCC are duplicated in both Ma=
kefile and Makefile.buildvars, creating a brittle maintenance hazard.
> --
>
> --- Patch [2]: [RFC PATCH bpf-next v2 2/3] selftests/bpf: move shared bui=
ld definitions into Makefile.buildvars ---
> commit 609eb873658507425701a592c055f112cedbb6b8
> Author: Mykola Lysenko <nickolay.lysenko@gmail.com>
>
> selftests/bpf: move shared build definitions into Makefile.buildvars
>
> This commit moves toolchain, path, flag, and probe definitions from the m=
ain
> Makefile into a new Makefile.buildvars file. This allows these definition=
s
> to be included by multiple makefiles for running test instances in sub-ma=
kes.
>
> > diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selft=
ests/bpf/Makefile
> > index 09e5be201afb5..2ddcb812dc85c 100644
> > --- a/tools/testing/selftests/bpf/Makefile
> > +++ b/tools/testing/selftests/bpf/Makefile
> [ ... ]
> > +# These probes gate the flavor list, which must be final before lib.mk=
 is
> > +# included; keep values consistent with Makefile.buildvars.
> > +ifeq ($(origin BPF_GCC),undefined)
> > +BPF_GCC :=3D $(shell command -v bpf-gcc;)
> >  endif
> [ ... ]
> > -TEST_KMODS :=3D bpf_testmod.ko bpf_test_no_cfi.ko bpf_test_modorder_x.=
ko \
> > +TEST_KMODS ?=3D bpf_testmod.ko bpf_test_no_cfi.ko bpf_test_modorder_x.=
ko \
> >       bpf_test_modorder_y.ko bpf_test_rqspinlock.ko
> [ ... ]
> > diff --git a/tools/testing/selftests/bpf/Makefile.buildvars b/tools/tes=
ting/selftests/bpf/Makefile.buildvars
> > new file mode 100644
> > index 0000000000000..2a7efe6d1c795
> > --- /dev/null
> > +++ b/tools/testing/selftests/bpf/Makefile.buildvars
> [ ... ]
> > +# Immediate (with an override-preserving guard): a plain ?=3D stays
> > +# recursively expanded and would re-run 'command -v' on every expansio=
n.
> > +ifeq ($(origin BPF_GCC),undefined)
> > +BPF_GCC              :=3D $(shell command -v bpf-gcc;)
> > +endif
> [ ... ]
> > +# Kernel test modules; TEST_KMODS=3D on the command line disables them=
.
> > +TEST_KMODS ?=3D bpf_testmod.ko bpf_test_no_cfi.ko bpf_test_modorder_x.=
ko \
> > +     bpf_test_modorder_y.ko bpf_test_rqspinlock.ko
>
> [Severity: Medium]
> Does keeping duplicate definitions of TEST_KMODS and BPF_GCC in both Make=
file
> and Makefile.buildvars create a maintenance hazard?
>
> Since Makefile defines TEST_KMODS with "?=3D" before including
> Makefile.buildvars, if a developer adds a new test module to
> Makefile.buildvars but forgets to update Makefile, the new module won't
> be built because the Makefile definition takes precedence and ignores the
> update.
>
> Could these definitions be consolidated into a single location to prevent
> silent build failures from desynchronized lists?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721194111.33=
4795-1-nickolay.lysenko@gmail.com?part=3D2
