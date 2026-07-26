Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5E2346AC2
	for <sashiko-reviews@lists.linux.dev>; Sun, 26 Jul 2026 03:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785037063; cv=pass; b=LyArohcrR/L3JPCUcSB0UlNqslpbqYcPd2dYY2SePBeHXsODLmGvHfdu/ALbv/Z6/tRvuJ19ypHvZWkyAXe02UJOh2gbU8dHDdYoR81/0wrQwTSjZ8lU93u5MFllt2CRT9YGqS/fz0cox7Dm5YJCPUwhfA0TNsWQYHvIqgvPOic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785037063; c=relaxed/simple;
	bh=fTfaM/m5eth5+/adQosBlmcjroxc67yWQ+mOFZi9wBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OpEkdmN4IonQlGnPJ5/2+pcdLyc1XT3TT/uSt6sH5uTdM0umD5Y4HP6kjnNJhtpICun/02mreujbxqyCeTUToJapasFivN+A0sjR1UGuy4dSo34HWCni2SUbsNQ1dq/WWU/iOOFANyqLNBdHEUHNgr6J2onTsM1PnsBJ4NriFoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNtipMP2; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNtipMP2"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-81062fdeaf5so28161917b3.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 25 Jul 2026 20:37:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785037061; cv=none;
        d=google.com; s=arc-20260327;
        b=d7VcqGS8dZNSCDhfe0eV9doaxo+06iiXCsIw2mP+T2hGFbI9Hv2qfk04pTyHGLm9Qs
         OBMnW6VNk5eerJHNes+y2+D/7kKqSdiHJG3v4h2CXBgWQvQv1GzzhLZLCltXpyDqchaw
         Pobmr5dS9qPgK1vmfthkxku8q4SgbbmtTWJk7U6TsalmsvSD2f4F2rtLggkeSxx06D9r
         1Nu41wyq39QFflt1EuSZld6ZOUw2pLyFkYnlb35YavAayMy/NGgbHwRTJMFP0XZxkRIm
         x7LFHZ/c4zwhbgzbiZVwkivvYERUb/VObTMNR3g7oiVE1iXq+OFGLAckht5KlIXGRbqT
         3cdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CxEX9l/T7AwZAVrm4P1IE7GYezPpkQz92l8M6dbRYJE=;
        fh=d4lZQzJj86GOXE2uBZ63/YnMA/QksEVfIk9QnceyrRg=;
        b=gkbD9svgHlVdIHhO0YtO0xz5fq8tI7j1Pe97UmMFk1AbFhHNyFi6Y7HxndG80JGc96
         epJ9hO0VN5dh4S3XbkrNhKSzg3gnLuRjfSiKyK/W6JNeD9OnHq2Jp9sqyuWo++JUKJ1b
         P4Bhme4zJyFRPP4GNa4nAYGuWLgbyjt2x9393o3fEjmICkolohf/zVSS6c0EOFynKsMU
         ey45an6y+PaDRouM8XM4/6jj/G4Giz0XJvxcWR21zDKniGA0R4RirSz8yNlupTpZ/L7e
         9/q7QOX4KnHQvgppHKQSK0B21rfsCngyMW6xv8aPxzZLdzDEOMgBLFSWJDEujw+rcMx6
         9kIg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785037061; x=1785641861; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CxEX9l/T7AwZAVrm4P1IE7GYezPpkQz92l8M6dbRYJE=;
        b=gNtipMP2j8JAwPIx1Vleha0kSqUCnvHOjWcVz2NRbD9byMCdW82ReJOJ0nf/rzHlcS
         IzrOSnSgg323Vi4sep1kYpVtY8ygxvAMBpPfEs7YuPVh5btEjvXZxVgsSHhz2L3bsNzZ
         98969KkGJ+DXIWYZWENFbGynyXbo6ZK2bNkHKQBfRy9/G3LjiS/U4AY7Z2CmU3OlqLz0
         v0XLC3Griav5zak7AntTk/azqIBEJprH7bWP0VoOvhCtaPw7rKUZ4vqrQL438MIvdacN
         yA314oS2KsbSXzt3B1zaSJDw/8gecB8pj/ocAS9DTMtLii5BAtwvks6aUF3VgqG7CVCS
         wH3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785037061; x=1785641861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CxEX9l/T7AwZAVrm4P1IE7GYezPpkQz92l8M6dbRYJE=;
        b=bVDkzAXFmybCE69PIaZshy8PU67CvQz3xXo6J78hBkd2QV5rOny8J1L45kPYggUbQK
         c9XMZ/QLWq/Bvg2TV6BrsmFWAh+6FecVKBVhXk7ZdFr0/4X4upS1J40Y1KWYCyWYQsdK
         +i4s2o9jy4tCViq9NrTznTVhqaSk5EEOgaERr4GtDxq+EsJHEGgSaUSvFkNXmi7Q/sWT
         nusg3JSgu/2DWKhYbD9B6uCNuKAJ/miJt10WSXBx3B2MmStJeze/UcXxeikpb4TCcw+r
         rx3a9P/EMRji4SxNbVcuFwKqtN9zC1wL3Bjf1iNpQzcoDDETkw/Mly8+v0Ag41ArILe3
         YsfQ==
X-Gm-Message-State: AOJu0Yz2efG6d3MavJKU9GOT/3NOILmkVOBUNtCrWZSTQ9ZoXw0h37Ar
	ZsLlOqPYIehHbeGyQIHlJ5KTjvXQg95Dfg/fJl+Ip7yIDBzFlkpJBJYxiyBHpJBqR0pc0jbzRM3
	dtkIQIHqP8CA5rFXPQQu2UqF0kVo9r17Gl6CDmyc=
X-Gm-Gg: AR+sD10ZQE4m8kWDMAziXjEpLgaBTVSTw4QPVvvqLyeaMGMSDhZUjqk4fCO62LPA+L9
	Lx5xUCrKhl2DdLOMEVqV94MJsLhpurm9hXh1VH4WCHSAdn4dvmRUXTjpcVTv0dMQQRW08k4k9/i
	71wBHPAJp1wt1ftBA0DjIYwoUFNzsCmCMI9M7mRte81eXgJwwFMjlLT5uMQ0etxm984SN81sWsZ
	0ehVJah6xwxvd/y49RUHe5ukzaeMpDtDXr8dHkefxvWSifnptslcAcqHgaKYE7et6P7+DpLv30o
	A40W1NCcB+D/CkYCpyg=
X-Received: by 2002:a05:690c:348a:b0:81e:a373:47ad with SMTP id
 00721157ae682-81f63a35b07mr18584747b3.2.1785037060800; Sat, 25 Jul 2026
 20:37:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260726025242.42245-1-laoar.shao@gmail.com> <20260726030312.DF6191F000E9@smtp.kernel.org>
In-Reply-To: <20260726030312.DF6191F000E9@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Sun, 26 Jul 2026 11:37:04 +0800
X-Gm-Features: AUfX_mwt8E90lNcOVfM9z4AERgcnP9BvBrSTgl0T4KAQiDtTFQf9Yy2WrE4eLIA
Message-ID: <CALOAHbB0w+eK6Bxd+Lsb51Z5QVtnNv=4Srbb7KWcm6zAxgkTwA@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: rpm-pkg: Preserve .BTF section in kernel
 modules during debuginfo stripping
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2026 at 11:03=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The patch preserves the `.BTF` section during debuginfo strippin=
g but fails to also preserve the `.BTF.base` section, causing module BTF va=
lidation to fail.
> --
>
> --- Patch [1]: [PATCH v3] kbuild: rpm-pkg: Preserve .BTF section in kerne=
l modules during debuginfo stripping ---
> commit cd09ed46074d0224c00066939452278fca769e51
> Author: Yafang Shao <laoar.shao@gmail.com>
> kbuild: rpm-pkg: Preserve .BTF section in kernel modules during debuginfo=
 stripping
>
> This commit updates the RPM build scripts to pass --keep-section .BTF to
> find-debuginfo.sh. This prevents eu-strip from dropping the .BTF section
> from kernel modules during debuginfo extraction.
>
> > diff --git a/scripts/package/kernel.spec b/scripts/package/kernel.spec
> > index c732415662ef2..1032f337a71cd 100644
> > --- a/scripts/package/kernel.spec
> > +++ b/scripts/package/kernel.spec
>
> [ ... ]
>
> > @@ -67,7 +67,17 @@ This package provides debug information for the kern=
el image and modules from th
> >  %undefine _unique_debug_srcs
> >  %undefine _debugsource_packages
> >  %undefine _debuginfo_subpackages
> > +
> > +# Preserve .BTF section in kernel modules during debuginfo stripping
> > +# find-debuginfo.sh (from debugedit) uses eu-strip which removes
> > +# non-allocated ELF sections like .BTF by default.
> > +%global with_keep_section %(%{__find_debuginfo} --help 2>&1 | grep -c =
keep-section)
> > +%if %{with_keep_section}
> > +%global _find_debuginfo_opts -r --keep-section .BTF
>
> [Severity: High]
> Does this also need to preserve the .BTF.base section?
>
> When modules are built with BTF distillation (which is standard on recent
> kernels), both .BTF and .BTF.base sections are generated. If .BTF.base is
> stripped, btf_parse_module() in kernel/bpf/btf.c falls back to using the
> vmlinux_btf.
>
> This fallback causes type ID mismatches during btf_check_all_metas() beca=
use
> the module's .BTF was built with distilled IDs, ultimately resulting in t=
he
> module's BTF being rejected entirely.
>
> Could we add --keep-section .BTF.base here as well to ensure distilled BT=
F
> validation succeeds?

You're right. .BTF.base should also be preserved. I'll update it.

--=20
Regards
Yafang
