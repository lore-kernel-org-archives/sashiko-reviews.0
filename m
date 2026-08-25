Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D06735C181
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 20:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787689064; cv=pass; b=vFZKupI0ekjQNuF/egYuK7eyw8jsjxF7AR3hrwV8PfM4RD7uLuUb18xXYHpacXaunjOBNe9byAzWsGY9PK/jklOYzfzpxlDUz6CFAx0RQUdXF3LF17NPI7sdqZ4ly5LrGmGFqPnwlNFkQm++a5Daek76ukoPBkz3rDdpRIOFEXg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787689064; c=relaxed/simple;
	bh=gsK9EquHUCTCUctLlW+W6DQK6qMNpIH9wwEQLrIuhKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cy2R/YXJRiEI6FeEV4zaIbZJDP4WDBp3ouLL2PVjlOAv3ovYTC0vvUyz8iyPDpL5shrMxi+VKtbdjJqDwXJvZZ1LOCedWRoluJFKKxPLr7XiDMno4g2Fmyzbu55yiRqmkfb+4QfNz+Fk1xGGM5RQD6wzV3ZHkQYboMaa2t7Vlfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VsSCjjg2; arc=pass smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsSCjjg2"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8535a9be75eso264253b3a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 13:17:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787689062; cv=none;
        d=google.com; s=arc-20260327;
        b=Agpw9jeAvzKecQaHY6/fPUCW2O18LIqPkQpfmufEDxHG1awD+BknGixteXVgy/6HUX
         Ni9y/EN0LZ5FwrxcLASNPvGnRUGG9okZdsF48Fcaog2iXCoC/e1X8XEutqAGaTDxPBJe
         372lf8ZpT7obPSzIOFDhKwsOmaRW+M0nEPB1T2QZVeBXfP3t1AvIAh6mxYopjuEEq3rl
         DOiu5r24+DZyF6aHyUCiFBruXDEwge3OlzITSZQ7NzW3/njaX6r+wMEzpYROMf5ucXyl
         Vsl0aOqwTPdnW997wjhZISCJf9cFFysYoJuJJ6CpfX6hh/t5k+QTb1YS8tilqPaMeaVd
         y+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dLj5tFbsVzyfDXo+huHpotVXFR8uK9xfqZioaQh04Iw=;
        fh=iPT5XVdUoz3CNjDEnuB73F2O8+dppHsusRuuKe88wAc=;
        b=F5n5f3b4LvsBlp5vF/7epGHDEFFTM/kbiLWL4zR9E5d5AGMZC1eqY6aiZp18FjCg4j
         mdd/IrL+p4Lxe+VRw8HpyqfhOQTis+HwAA6Fl5bxRG5nJFh+5eB5GuRXWB5HngKx2Ftx
         9riz4M2SUmYXC88TgqdzUldgsHO1EddRq574udbx9Ck5aPL16eH9p6MdbPZdVVJUaQ5w
         0M6AD99pgYc3+wUMQtWx+y8AIZcWqCaAaheob6CXV/UtLFQG3wEzSVYNYO8JcasRZO7r
         gxMU8tsc41pKUNCyT5x6nIzDlwXxwaMcEQ29QBcpvHxURHvRwzbF0+jY3/SgtFYlwyw4
         cG2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787689062; x=1788293862; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dLj5tFbsVzyfDXo+huHpotVXFR8uK9xfqZioaQh04Iw=;
        b=VsSCjjg2PQSaM6FSUFdnWajzHSAxzbAuBu56Ja5g+4trdzaLz8mKgF2UESFnu5pBfX
         d7NsIp6HTb2OK8JgnfP3ZuZUJq8z8/tPAy9+cml2YW7M4+cYeMy/sOmxbmeVGyJWoCTY
         3o1wWL4p0SfYuAfSBicfOaFJY3g4D9H9KAmsqoRZ8hD1v0UYU/d06Ef9yEdXKW4gudlS
         GLjkKu5nBMmf4aWKqcv2tOSMYQaadJyfG3gvWrqdUqNRfnlnAqCCBUML49/tIp06xaSe
         5bRsFt6Jwu8q0tA/2R+4tm6gpmLl9XExmYGo1Vrc7UC/27PSfKIwgPfJUyB6sVv4kq1j
         O3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787689062; x=1788293862;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dLj5tFbsVzyfDXo+huHpotVXFR8uK9xfqZioaQh04Iw=;
        b=Ve07aQaSsAdbudwOxVaBmui5DYxk1r2DF/9ELlRMEUwNIhr1cSQbDxTEw5LwyG6bzn
         MqUPyUufoSMmUFnBLeiD2+AbrujPVCJKPQOrQdhJma6on0QkEiOumrlm3gSPKDoqAm+t
         a9wZ7/NLqNPFlxj2RkoFGmfPSJYXgJmwx3DWa5LWiTV50TU4SgDvNWc2njpFJXW9zbQ4
         KqxTzsMsNUEde2CkJ/tVnma9tl8DSodyc8und94Xw8C3P+IzldZHjHLEY9SXbcyn+Mlc
         dRuvftsmUIJ4tL/F6m0fe6fQP4KcnBF2ftxmROGw330KScFAw4+Qjp1xCx2cBdksZ8JC
         cRzQ==
X-Gm-Message-State: AFuF++lW4cBxDbNT5dxEBgRvoVK7PPmCpRDqmYwd+rDLWtuvqRzzKI3G
	hBPyAyW0Km/M2kCD+aQ7E6xviTnc0FyRIjslrAvUK3XNVNsqJ/A/8bNKW1aSmtjsum5YVPf+VUc
	UNweqn9xyDdwxa8rbzFRdPGyOHVB3Iz0VO6DX
X-Gm-Gg: AR+sD13qDEbjkWRww9kYnWNm3QKjNPU/CDR6svJ2ZRpRXGyWZqhNbMjY13ta7gnwXbf
	WbxVxe291lAuNeYixP45rlENPkuCI+APvssfGaqNJ0PXL5gOE8/Egufx0IUPkH0BHNftprqAGIn
	yjeYVBaBaGybK6oLMjSue8XLtvm5cxeETRuX0Pmgwv6algoaAQXHaOJYwdtYQlO1Iqo9pheKLdF
	ngifd1lXxJ+55CaWfKeMQ+mEaIWJVpz+P+J2xA9ERGbVkZbcNT+6R7I0vJ/PhWqwsh15dYi5+SA
	ez4fbMbkNS13AlkczfrNNqKIPVN7QYXaNVH+e4NDj9ymEjgSDvg2DiX77/1ht59QGErO+yhtM/Y
	0kYzQ6u9HKvMsCn53EIPoEK/lPTrbEOCbRm5PyOJj4a2RQw4=
X-Received: by 2002:a05:6a00:bb8b:b0:84a:29a7:f650 with SMTP id
 d2e1a72fcca58-8536eb1c497mr2831738b3a.0.1787689062518; Tue, 25 Aug 2026
 13:17:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824141532.604269-1-tw19881113@gmail.com> <20260824142447.035571F00A3A@smtp.kernel.org>
In-Reply-To: <20260824142447.035571F00A3A@smtp.kernel.org>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 25 Aug 2026 13:17:26 -0700
X-Gm-Features: AcwNN1VCQHSw3nU6QhSo-1ZByqeidn6E6Wdw3NzuiX-CFo6mIVp4fAwsj6X4kbY
Message-ID: <CAEf4BzYRftm_bbr8wsc2JKkxegYuMEuOPyRp79knU0ZnjH7TDQ@mail.gmail.com>
Subject: Re: [PATCH] libpf: Fix for the compiler sanity checking
To: sashiko-reviews@lists.linux.dev
Cc: Tw <tw19881113@gmail.com>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 7:30=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Medium] Latent undefined behavior due to signed left-shift overflow in=
 the `BTF_INFO_ENC()` macro.
> - [Medium] Latent undefined behavior due to signed left-shift when settin=
g retprobe bit in `attr.config`.
> --
>

let's fix these as well while at it, otherwise this will come up again
(however silly this undefined behavior really is)


and please make patch subject more specific, "compiler sanity
checking" is a bit to generic

pw-bot: cr

> --- Patch [1]: [PATCH] libpf: Fix for the compiler sanity checking ---
> commit 6bb550337600fb1ee129a0b5ed1c50e66620bbc5
> Author: Tw <tw19881113@gmail.com>
>
> libpf: Fix for the compiler sanity checking
>
> This patch fixes an undefined behavior issue during libbpf compilation.
> It resolves a ubsan warning about left shifting 1 by 31 places in an int
> by casting the integer to a u32 before performing the shift.
>
> > diff --git a/tools/lib/bpf/libbpf_internal.h b/tools/lib/bpf/libbpf_int=
ernal.h
> > index 4c46d34fc055d..222d2f1c0ed3a 100644
> > --- a/tools/lib/bpf/libbpf_internal.h
> > +++ b/tools/lib/bpf/libbpf_internal.h
> > @@ -259,7 +259,7 @@ static inline enum btf_func_linkage btf_func_linkag=
e(const struct btf_type *t)
> >
> >  static inline __u32 btf_type_info(int kind, int vlen, int kflag)
> >  {
> > -     return (kflag << 31) | (kind << 24) | vlen;
> > +     return ((__u32)kflag << 31) | (kind << 24) | vlen;
> >  }
>
> [Severity: Medium]
> This isn't a bug introduced by this patch, but since you are fixing the
> shift in btf_type_info(), should we also apply this fix to the BTF_INFO_E=
NC
> macro in this same file?
>
> tools/lib/bpf/libbpf_internal.h:
> #define BTF_INFO_ENC(kind, kind_flag, vlen) \
>         ((!!(kind_flag) << 31) | ((kind) << 24) | ((vlen) & BTF_MAX_VLEN)=
)
>
> The !! operator results in a signed int. If a caller provides a non-zero
> kind_flag, shifting it left by 31 places into the sign bit will also resu=
lt
> in undefined behavior. Would it make sense to cast to __u32 here as well?
>
> [Severity: Medium]
> This is another pre-existing issue, but I noticed a similar left-shift
> that could cause undefined behavior when setting the retprobe bit:
>
> tools/lib/bpf/libbpf.c:perf_event_open_probe()
>         if (retprobe) {
>                 int bit =3D uprobe ? determine_uprobe_retprobe_bit()
>                                  : determine_kprobe_retprobe_bit();
>
>                 if (bit < 0) {
> [ ... ]
>                         return bit;
>                 }
>                 attr.config |=3D 1 << bit;
>         }
>
> Since bit is read from sysfs, if a future kernel update returns a bit ind=
ex
> of 31 or higher, would 1 << bit overflow and incorrectly configure
> attr.config? Should this use 1ULL << bit to safely set the 64-bit config
> field?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824141532.60=
4269-1-tw19881113@gmail.com?part=3D1
>
