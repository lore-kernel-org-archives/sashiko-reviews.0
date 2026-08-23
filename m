Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E2E1B808
	for <sashiko-reviews@lists.linux.dev>; Sun, 23 Aug 2026 02:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787451369; cv=pass; b=G1VbZut820v9irUU82SnECeKDSOcYNvIC6czhi8jJXak9LRwYjs4zOJtvH+7mvDD5vX+JNxg2XmutFcIOG671SfBSJYJmzsmI+ebG4zQrNPdDkeLxaN5bA14Z8W93BcWRhReV3IRRNphW3EI3JRObaw952+tqyRAZ5aHWnvZXnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787451369; c=relaxed/simple;
	bh=C8Hi7dx4Dz9qbEIsmQHMoCO9ghAgOYPYVPNCRQu1bd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwMxK+VJ9+XNHwK6lTUv4i5on7XUzMf9CEB2rxFBg6an6JuTV/53SyQ9p6S6j6DXHA9EA2mZPlOdVi/4JBsmmtMP7ZFAG79JQEnQeZmBeJlVTYbjqxEgrBHXQ8wnT/am+UFD9pYsav6OoKRmJlBvdi/2KAGGNSbOGo0Ivct3Z2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5zMdF+q; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5zMdF+q"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c214321dc32so450086766b.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 22 Aug 2026 19:16:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787451366; cv=none;
        d=google.com; s=arc-20260327;
        b=g1T84d0cm5wqR6T/jb8PdoDEfVh4dM0yQPfySGJi6Llnuxy7C3lbHewKvna52sXvTi
         HC+uinSeCvfys/JvW7Y+kpP2t24HRNxromdrKSWd/SX8azJQE19egIJo+pvwuEbMdQ3m
         rf7o3DB252xbXJWx23gDPXsr8s8R29V1NxlVDe6U95ibj6u/IbvDGKgTNKVd5oQap2Zj
         n8V30Y1+EVtc6TxfUp3IsTgdr1Evm1W8DtWrvkbwK1eVH/7lRB8RdKGvG9ZsguY2YK/J
         q8/T/p499Cw5nYRj8eNBybNvqX5evGQNHp7DqHJZQkbfSfzmb/b+JbrvislY30KGavP+
         gSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SZkGg/kOEabPgE6XFQkogcC3pK/J2kIC827u/rRa1r8=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=Us09/gQF6ahyllBIsVEPqdqZk7wEzDdiEKXkEKQ8uUDEi1AHLaIH/fPDEcsc21+2Ga
         3oOLD4wrC4+E7FjYkNTFh0TH+x4++ncr1HTJvLXyreNJz8k2O4w35E2BA6vOcMl5nG2r
         bVrGhCjhBYs2F7diIJnHSljZAUVm1nL2ftUzu1dZuHG3aRnY54FHF37yeEVk4zKj5k9y
         /DZAO/qSPmlzSTGy8aG75WzGJzfK8z4+UNTcRon9abHjKViMmkj2Dh8Huf6dSuL7Jkk1
         +YCpAwW3HxsOs9updnkCQpgOdyDduQ+5jmtE7Ft1c0yJLwQ0jShGBi6wLglGDz8/azoT
         TtIw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787451366; x=1788056166; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SZkGg/kOEabPgE6XFQkogcC3pK/J2kIC827u/rRa1r8=;
        b=V5zMdF+qYTr4jmSvkZeaHmPRM0jsm/s4eLS9D1WNbt097t047sO9oaoZTPuWgFeeij
         i4pP/2nL5XRf2z3EAFszWvyes8qsoT6Zd30uB4xl0diS9kDG+bkYdfZ9a4hpzG8O5C8A
         d9urDKuj2URrYIxMbhYU6fpHvIL8Ycs7rXvdFJ0bKN7uxPaFWGyh0RNJzfqK9RIPBqDJ
         Crft08zUPAjLt8YDHpf/k2u9nlbcctjSG8RueAj/CwPxnDz8d281vz+o+boc/IeDoF8e
         pBECCiA869DUISD9d0OzvZ4l+itqVZIt8xaln5RmdJOa+Xq23Q9XGgOD6Es0zE9zvUCa
         7RVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787451366; x=1788056166;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SZkGg/kOEabPgE6XFQkogcC3pK/J2kIC827u/rRa1r8=;
        b=as+NrIrwn87Drt46Nt/YuOdSPZZrPGhYv8K/XxH1oXi+tdZwPMtyQEzM28D3Etws1Z
         vmxxnv7Xpowzb9zNrK0QV6AWUFN6GE9cLSXxik+5KCV3Yb+J8gfchcm7CH75/aKR3HCt
         zHLPAhFZ5D1nWEY2Ki2kD9LGRo7CCe8XTr8USh1ixFMyZGKitTmyuHYmlJjnrM/v5rlw
         x4tWR4S4h5XpgG0k9PxcnDe2CURvtj/dP0RHAOn/ZXlcwB9k+vA/7gOF2cD+FKGxjnU3
         e2a1CB+gVXPRc/GUfuy6vhhIUWdBpPSDH3Ual5PlbAnnCoPP87ACUE8rlgyc8Hu/WdCH
         UNvQ==
X-Gm-Message-State: AFuF++keYMaT0i/jBvzzz+FZ5bc4+Xn+j6vx3BsR2gFNTMotSoVNn6eK
	dLlY+cJ61MYZHkiMR+H86hIchmKhNrwAje8moVIq0BctFnLIVr3tlDExS6t9VhA7FWVVEe8Gl2k
	CI2HQTsgIRychFS/PrFGRKlkQeNkIM2szw+J+F4M=
X-Gm-Gg: AR+sD13xqGfi00O/ojs5gUuqjXNO0xO5ALsmgcqJx3+dXK8pmf0j2YsLk0+USzCv1B6
	FhlUkmE/s0fL7C7PB0/zO+DPB3QKiBSLGsWX+VT980SL1MRRkT7OqLC4uoOpgS3HMQ5JgydPTUs
	uJktXzThFHPipg2CKXyh6PU/LxjCwZr23/J0zrEMwbtErhthvDqOkINAKkKizeW1HgH9IfR+Xie
	yddiJHoQEvlrP3tDiKKV3l43Rf9XdTk+ZUDDfPhEQt9AwD3oKRXCe53NBiJiQ8V13pjCAaM44RC
	JlYUzVcaiNg1PuIwucXjTrF4da2Lp0ganoBbIZ/T/NP3TiWI3FHefSpMCDTpga2Eu/GGZO6Ii3w
	w
X-Received: by 2002:a17:907:9346:b0:c1a:5d49:f99d with SMTP id
 a640c23a62f3a-c246a3ab4c2mr2034017966b.7.1787451365510; Sat, 22 Aug 2026
 19:16:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260823010900.1730708-1-nickolay.lysenko@gmail.com>
 <20260823010900.1730708-4-nickolay.lysenko@gmail.com> <20260823011851.0213D1F000E9@smtp.kernel.org>
In-Reply-To: <20260823011851.0213D1F000E9@smtp.kernel.org>
From: Mykola Lysenko <nickolay.lysenko@gmail.com>
Date: Sat, 22 Aug 2026 19:15:53 -0700
X-Gm-Features: AcwNN1V8XOzF03yXekhbA-aQZ_JhNkIvdx3R7Ce_2bgQP3RqOFMq2LFBYypxT_g
Message-ID: <CAMtxOX3MwTE7C4nMdEpR1T16BX8L4TYRFc2uuk=RROXWJB7LBQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v6 3/9] selftests/bpf: factor the permissive-mode
 skip suffix into a helper
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Same finding as on v5 3/8, refuted there with a minimal Makefile:
https://lore.kernel.org/bpf/CAMtxOX3f-u0cnDiXuHyxUuiMWwosC9sj3xmTDy-ATaFAKu=
X4RA@mail.gmail.com/

On Sat, Aug 22, 2026 at 6:18=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Missing space in the SKIP message for the LINK step causes merged=
 text output.
> --
>
> --- Patch [3]: [PATCH bpf-next v6 3/9] selftests/bpf: factor the permissi=
ve-mode skip suffix into a helper ---
> commit 0c0b26d03c8f590d99a07e3db037b9c093922751
> Author: Mykola Lysenko <nickolay.lysenko@gmail.com>
>
> selftests/bpf: factor the permissive-mode skip suffix into a helper
>
> With BPF_STRICT_BUILD=3D0, eleven recipes append the same tail. This patc=
h
> factors the tail into skip_on_fail, parameterized by the SKIP tag, option=
al
> extra files to remove, and an optional note. Every call site is intended =
to
> keep its exact message and behavior.
>
> > diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selft=
ests/bpf/Makefile
> > index 8d71345c2e86c..04eea6ebc75cd 100644
> > --- a/tools/testing/selftests/bpf/Makefile
> > +++ b/tools/testing/selftests/bpf/Makefile
> > @@ -48,6 +48,14 @@ SKIP_CRYPTO        ?=3D
> >  BPF_STRICT_BUILD ?=3D 1
> >  PERMISSIVE :=3D $(filter 0,$(BPF_STRICT_BUILD))
> >
> > +# Permissive-mode recipe suffix: on failure, remove the target, emit a
> > +# SKIP marker and report success so the rest of the build continues.
> > +# $(1) - SKIP tag (BPF, TEST, BENCH, SKEL, LINK, ...)
> > +# $(2) - optional extra files to remove alongside the target
> > +# $(3) - optional note appended to the SKIP message
> > +skip_on_fail =3D $(if $(PERMISSIVE),|| { $(RM) $@ $(2); \
> > +     printf '  %-12s %s\n' 'SKIP-$(1)' '$(notdir $@)$(if $(3), $(3))' =
1>&2; })
>
> [Severity: Low]
> Does this formatting behave exactly as intended when the note is appended=
?
>
> Because GNU Make strips the leading space after the comma in the then-par=
t
> of the $(if) function, it appears that $(if $(3), $(3)) will strip the
> leading space.
>
> Would this result in appending the note directly to the target name witho=
ut
> any whitespace separation?
>
> [ ... ]
>
> > @@ -1018,8 +1008,7 @@ $(OUTPUT)/bench: $(OUTPUT)/bench.o \
> >                $(OUTPUT)/usdt_2.o \
> >                #
> >       $(call msg,BINARY,,$@)
> > -     $(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o =
$@ $(if $(PERMISSIVE),|| \
> > -             ($(RM) $@; printf '  %-12s %s\n' 'SKIP-LINK' '$(notdir $@=
) (some benchmarks may have been skipped)' 1>&2))
> > +     $(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(filter %.a %.o,$^) $(LDLIBS) -o =
$@ $(call skip_on_fail,LINK,,(some benchmarks may have been skipped))
>
> [Severity: Low]
> When this build fails in permissive mode on the bench target, the
> skip_on_fail macro is called with the note as the third argument.
>
> With the space-stripping behavior above, won't this result in the SKIP
> message being formatted incorrectly as:
>
> bench(some benchmarks may have been skipped)
>
> instead of the previous behavior:
>
> bench (some benchmarks may have been skipped)
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823010900.17=
30708-1-nickolay.lysenko@gmail.com?part=3D3
