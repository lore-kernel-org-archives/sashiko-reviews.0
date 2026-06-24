Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A908522538F
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 07:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286934; cv=pass; b=DMhhapPvcMGGhR11QaS5Pr7ZtfqM0TvWeMmiNFnwLcHLFtZIljnR9ZdpW7vAg1dfXHnlsvGgnjjvObyoXv92RoYI+ftv+qMk5pBCmmEplzHm1KLIoKWslINjoS0lY/JILhJ9jMMYndJDTW9mOsmuBYBM/LwohwWy8LEy65FuLpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286934; c=relaxed/simple;
	bh=QR4Wy0tL8cCx/yg2BbocD46eH1jIHB4yYuylS36en84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vn7XM/z3M3DQeumlcs/686EnasFguNQKQ9XKmGLsyBRDsoCBFA/Yu17irrV5afP1UnhSu6tsM+5uOFTk75VlQfZaXUQJqXYq741UkyeKPmP4jpZWs+QfNbbck44x0Wz9hzg7OkeZVBEl0wXAJzczHUdqsoSHhgqfHDBEtcCYfUQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKtrPyTV; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKtrPyTV"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7fd5346b5e2so16694347b3.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 00:42:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782286931; cv=none;
        d=google.com; s=arc-20260327;
        b=l+WJNEWORgrdJNh1ez7mPpQJVA4RfNcE7z78BauEGUY0SUEOhR07ML4yVCEqOPiCFx
         tFJqiQzcjMPjl2MBpqkWiEhO0feWAOIijpGX56PXkDVpUrJfgIIPhqNlqlcC5z9WM0vX
         vYkSK9x7FSAjvn6UnVMQfAyDo68PDmL879hq7kFJGz/IqAb+yQ5MYR4LYdKTlnWG6qXO
         QkL0GySoFv9DeFUNGXdXrRkpsxhUSK7Dvfqku9iAhYS9ajTjrU/ILoerwvshA4XF4IK7
         cqVd/tC5tCnqHRAOHa5KAD1co1CEL3F2scTDrC7Qp9jlQ9c5d7mm4QJo3kx9HMJJqfj/
         0JJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0+yTRolSITyDjcXP+5W2UVcOpjVAsvKMU8I2YD9YKI0=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=beca9yltkA8NmGxdgQzuq1p70jC9EjhC3sLjHDPtoclwYnoyBoYCoPT8GzxsyIo8HT
         5WbTM8b96S8Z5bfzdiWsfyHgUDF54g9M3SQf8TbaiBB8wb+fX6WGMsq1Yg/7dPIfnQiH
         blcMg0BEtRZi/qlnglRzm4o3HTna+8AjzNycbGZnAIi5yREJ6rMo7oLRbc95MTXmBF9b
         SCDaMx10/soKdQXF++WepMWTgFATYQnhXbDTQxB63WXX6XvIr6LD5b0eLKNKc26BSGjw
         JgfwPwbwcmR3rBtj3nQ7LtvoI0NuXXSgPTGlWvWhrRcumh0+yZyz9CytSlSqh4SSpJED
         Co5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782286931; x=1782891731; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+yTRolSITyDjcXP+5W2UVcOpjVAsvKMU8I2YD9YKI0=;
        b=AKtrPyTVHuDfSEq2qE4a9OBLwDrT63v1pB75IIWPh7o9cvfDXTvaCxpej2TVSwZPFW
         LA+zjqLxKOS+2duwFd7nq4FpmqHbzt7pvooEctnGblvlzztFWxwTEtXGN9cjAbOgNVKc
         9andDnun2HuShymr8p0bLv+Q1toUcMlvUr20KwwCsDwhA794rQBWU/qFzT59I9hhOlcG
         R4pzjup1eRGaHpgQRhmElBD7pPCGLKNivFOVi9bznWrXneRP3jj8yd2E2dSlY69+K1KN
         cs96JKdZUVsCj4Rq8Iqc73bko9Ys1A1Gust1+oElqMZQoYy86QDC0CQSRxrVcASNky3P
         EExA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782286931; x=1782891731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0+yTRolSITyDjcXP+5W2UVcOpjVAsvKMU8I2YD9YKI0=;
        b=ojWhMxmKwyHe+nAtoYTs0/jq1wXxkLLzW1lUnjI11xhxUMTI4O+mRsGStR8yn3cVqk
         ixzkpfKAUlicJbFBC7+IR/2RshaKY0216rixgHcgZ6vm/qDO9FbKlgtaYX1dKu60Mwmt
         qjVQCMIfijXUTiawRnYtggFl/b/+mrTIeOm44RVjK6E/e345+4kdOCD1FNQ50woZQrlw
         6jpNNO8k7tuGNIjJ/s07vrkRAsVOHtGYuauDZLnO5khtv0N+l70x3blexmpCzZsq5Gn8
         PiXPjVNn8XxOkcrFNnJYJQ7uktxRXH1oETpGvxuAvsRCcTBYRRxF24pKoCz3wD0q28/I
         RuQg==
X-Gm-Message-State: AOJu0Yx85ivjYdk1Xn8v2UUNtM9hpEizmRJVmpNQnnmR+RCAcVrJp+64
	1cQm71eNG4ZIIeiV2yOSCFGAi6jCiWCU+4hb1yb1jMsgLdc6aXjOYxPnCTyAbOMx+cexGiAZ+p7
	n67T6zhFjO+DQkGvmwTb9Tu4rYH44g7KJ6KWji4wAQx7T
X-Gm-Gg: AfdE7cnXyjMJIpdFegw72u0MbDHGWnlHDfkm+5mPTr2Oah2zoq0by+LiOKmlW7u1L4r
	wU1zmj0nvWxp4vMtqxMHhznUGEPznsWhOBLdx4UZkge/kfkeE0zvxvblrbBGvF1U/Pw35GYXhK2
	E2hy/g0pCvL5V2E3nHtnMthScxbYRpQZJR3x2pyons283wEHx6kCwimEUR251D0Kih6qdtjr7yb
	MaWuVnw5m6j2lw3EqXQO6HPTFSj6S/+GijUhfar/xRrBPwySIcGKYylZVwiBWQYRFmR76qymPkC
	wiYw4VwVFoU7vM97Bp23wJfkxKdIG8HzcC1wlFsu
X-Received: by 2002:a05:690c:660b:b0:7b1:9036:a23a with SMTP id
 00721157ae682-80672115b07mr70122167b3.14.1782286931474; Wed, 24 Jun 2026
 00:42:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624072031.735846-1-sun.jian.kdev@gmail.com> <20260624073738.86F361F000E9@smtp.kernel.org>
In-Reply-To: <20260624073738.86F361F000E9@smtp.kernel.org>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Wed, 24 Jun 2026 15:41:58 +0800
X-Gm-Features: AVVi8CeAGESJLiZKG7OzP6_ac3ToJrHzDDedwPDcUfl7iYoO0CEiUoore4N-_u4
Message-ID: <CABFUUZFSwaQoq6_uRA0qwsuSO7hxfvyn9jmD-i-iUer7QZ_eSQ@mail.gmail.com>
Subject: Re: [PATCH bpf 1/2] bpf: Avoid eliding lookup NULLness for inner map templates
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 3:37=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] The patch relies on the `BPF_F_INNER_MAP` flag to prevent un=
safe NULL-check elision for inner map templates. However, this fix is funda=
mentally incomplete because `BPF_MAP_TYPE_PERCPU_ARRAY` explicitly rejects =
the `BPF_F_INNER_MAP` flag during creation. This leaves per-CPU arrays vuln=
erable to out-of-bounds memory accesses and NULL pointer dereferences.
> --
>
> commit 3ab30507af620d9da556d3b2d80a1f172474785b
> Author: Sun Jian <sun.jian.kdev@gmail.com>
>
> bpf: Avoid eliding lookup NULLness for inner map templates
>
> This commit prevents the verifier from eliding NULLness checks for array =
maps
> used as inner map templates. It achieves this by requiring that the
> BPF_F_INNER_MAP flag is not set on the map before clearing the PTR_MAYBE_=
NULL
> flag from the register.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 69d75515ed3f7..a32704bb5e058 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -10577,6 +10577,7 @@ static int check_helper_call(struct bpf_verifie=
r_env *env, struct bpf_insn *insn
> >
> >               if (func_id =3D=3D BPF_FUNC_map_lookup_elem &&
> >                   can_elide_value_nullness(meta.map.ptr->map_type) &&
> > +                 !(meta.map.ptr->map_flags & BPF_F_INNER_MAP) &&
>
> [Severity: Critical]
> This isn't a bug introduced by this patch, but does this check completely
> prevent NULL-check elision for all inner map templates?
>
> Looking at can_elide_value_nullness(), it allows both BPF_MAP_TYPE_ARRAY
> and BPF_MAP_TYPE_PERCPU_ARRAY.
>
> However, in array_map_alloc_check(), the BPF_F_INNER_MAP flag is
> explicitly rejected for per-CPU arrays:
>
> kernel/bpf/arraymap.c:array_map_alloc_check() {
>     if (attr->map_type !=3D BPF_MAP_TYPE_ARRAY &&
>         attr->map_flags & (BPF_F_MMAPABLE | BPF_F_INNER_MAP))
>         return -EINVAL;
>     ...
> }
>
> Since BPF_MAP_TYPE_PERCPU_ARRAY can never have the BPF_F_INNER_MAP flag
> set, won't this allow the verifier to still incorrectly elide NULLness
> checks for per-CPU arrays used as inner map templates?
>
> If a per-CPU array with a large max_entries is used as an inner map
> template, and a concrete map with a smaller max_entries is inserted at
> runtime (which is possible because percpu_array_map_ops.map_meta_equal us=
es
> bpf_map_meta_equal() which ignores max_entries checks), couldn't this
> lead to an out-of-bounds access or NULL pointer dereference?
>
> Additionally, since percpu_array_map_gen_lookup() also relies on
> BPF_F_INNER_MAP to skip JIT inlining, will it inline the lookup with the
> template's excessively large bounds hardcoded, resulting in out-of-bounds
> heap reads on the concrete inner map?
>
> >                   meta.const_map_key >=3D 0 &&
> >                   meta.const_map_key < meta.map.ptr->max_entries)
> >                       ret_flag &=3D ~PTR_MAYBE_NULL;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624072031.73=
5846-1-sun.jian.kdev@gmail.com?part=3D1

Please ignore this series.

I just noticed that Nuoqi Gui's "[PATCH bpf v2 0/2] Keep dynamic inner
array lookups nullable" already covers the same verifier issue and
selftest.

Sorry for the noise.
