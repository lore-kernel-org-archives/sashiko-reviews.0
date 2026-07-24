Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46CA4399EF
	for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 21:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784927473; cv=pass; b=mXPgUw3yw339/FE3XhK7soBv4LcF6yd0BrPrO8qBHWwkXpXs9aWpEYgdBvLDyIj1EBPdgEmo1zbDDbX1LyVxScxzMeVB4PRUVA3THBgiSpQU+pKj+2XYmHbkN9KQw/AkTARQoDooTcj92WcqdL3Pux+CWISVmKZK7NSw517oQA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784927473; c=relaxed/simple;
	bh=401H7/3zainmi+ZS8WgSGXF+YfZu57AK9VZDf3Al6M0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0qlDM1ifzoBOsJYH4qSxCrqFKybcS97FWjZdnrWDd4S7M5UZFzYBAn5wBEEXVHk+C87o8ERk404jJmzFe8pbTQJJIkwMWDsVw6ITgmKIm704cWvXIQ5uj1s/Eiiyt1dYJIoWqSu3B5ggCsi5CA7CV7AUr6pPG5B1krVQFwBkeE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/X1Zf7S; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/X1Zf7S"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8143daf89c7so8331297b3.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 24 Jul 2026 14:11:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784927469; cv=none;
        d=google.com; s=arc-20260327;
        b=HjdC8c2JVdS+Bydin4S8/n+v4csgFdGJJ9a+u66Q/kGzGjVc3XSqWnOExGs0EmvRam
         A4m4FIf2vPbGu9hSJYxiarSy0/CByoeAQdwZOEoBm5sbK5SOXxo42WHqi1IolURBAut1
         R2SLFnhaNT8w4rXRheEKZcwj2183VR+Scyfgppc5dqBz3z8/ITmst7i1ptaBLBOVwojO
         dlSF3gsl/irruNB78jP2LcL8Ze/4JkfBn7VMTt8QnwaW+OppsY4C4b5U5q6yQZtNLvnx
         3/RukgP2G8kgpgtKyzwLSMCmqk8noIFiG5da84N7Zq7csb6CYtXMlLJBB6cII+soNYC2
         /XtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hWOgufAJLgySWXsH9Y29OSjWhJiYTY778NK68l79LHw=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=PAZntPeJiW0f1PxDr/ZXVRjcFrNAygQW4eTw0jhxlWP3p3QtNrWTPknz4+deNooQhy
         1O/vYzwHiqL8P4a/1rxbw7WPxtbKH9zu3vpyeM/FpEOk7e6+86xuTf0Li6ek08SzSojM
         6ASWH4FO9v/EFtuNfpbzS2hcHPCYf8DuMv75xVLF3OhBbzXz8M3LBTiKv5wW1Bzv6pa6
         yStUF+xYYmb9S2786AW9aAKsNhl5vrwZcqjin4ocpDes36fATi/B1813tL9LoA9f3BY1
         Lw+0jLQVh+mvbFSolMu5aoh/v3zQ5C/MqQTPabwIpo8Pq8Od/vfkLBI1yNt9rfxDYza5
         97/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784927469; x=1785532269; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hWOgufAJLgySWXsH9Y29OSjWhJiYTY778NK68l79LHw=;
        b=S/X1Zf7SmYJDFkMXTacpW+w9HTvH334uMziAjqE0nUKG6SeAgiJLEI8AyXibQC3ilw
         gLJdFl5B/KsldDepHT5E+Ltkz1AMDlFE9N69UoLWxhp8G62yTifDzssN/2v/Lg8S6Fpe
         i8Ic57w3n2IQ/FI36kRQCsoD3tI6l9rc9eLXPrxA3PqJ3Rzk2y1EyqVZI3qXrhPsIobR
         Unya5FOSiBTSyBReB01RyV7d4JarGYal0km2fP7sAPs5q0YMSq4mVKM+lD8BuR+/bk+A
         B8omkdpaPm7ZfyByxSeP8+dDS8gT9a1CTHoh1ocWBX0j6L95iToJ++dnJr9ra0r/TZwr
         ccDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784927469; x=1785532269;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hWOgufAJLgySWXsH9Y29OSjWhJiYTY778NK68l79LHw=;
        b=ENT3Uz2Q+b41b4xJeSleouQPxuZ3nhCSNL8TT9w30g/vImwCjG23L5HqIE8lw02mqI
         fns8fT3xM+UX7TYHHwJC0pzWfTM/xHYctCrSdR7cgider4pcqdt6uM6dqauBEMf+qt42
         MbtFCf9tcqP6s+u0nEjwm6OorZ6+/C63nMkvWV14kjZ1+jujUaw0fPaO4TMqb/9tmVoc
         9nlM/wCpxeNR82zGkJzy8cmJNrOFrwWHS18Q21wRIK9om7WlmiPTEROBbfO7e+Ah0RiC
         l7KdQhNyGKd96Mp5PB2ziuR171lDOdzXGLufqnZjEyWidRYbG0U2nZMuxmrWgI3xqIgh
         IuQA==
X-Gm-Message-State: AOJu0YxwuwUoHgcZbyfgIc1ST3weBQiHZPRXf9UXe+65yONGSDVKl7NH
	D+hTMzpQWtIv2CDjBqV6xe2EN2yY54WF6pMu7aYNOCX/6as8/uMcyQ0fg6lHs8HeNlMKLyyA/L/
	BxniD1dcSvWntxOlpuvvj+59ocQYqUPleH2/w
X-Gm-Gg: AR+sD12Fl2CqH2l8/qeOMR1bPY8NW8TF66VzLwRmAGoYRtkNFfpHeYMyj0qJR+3rqCe
	MtawJ7yYydUHtzU/d4jHKvTv64/o1FgsoiDuhfLU5yC4jQ423R65gdmIkmenvyEtVJkgUqGD8ss
	ZkWHbXwMpS32Om8GDmVvSljL2NedavbYISJ2s+XKiYTc1FNgc7SbJtnQcsz3LKyi2G6boHtDLpW
	ZHQFKoLvNwQM9/SD12m+ytakGqMmUCZXXRurluLJo+fAeCch+iYkmsbT1u9Tw==
X-Received: by 2002:a05:690c:9c09:b0:81e:2b86:d75a with SMTP id
 00721157ae682-81f69e69fdcmr336957b3.55.1784927469575; Fri, 24 Jul 2026
 14:11:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724190813.1458271-1-ameryhung@gmail.com> <20260724190813.1458271-15-ameryhung@gmail.com>
 <20260724194706.0F79D1F000E9@smtp.kernel.org>
In-Reply-To: <20260724194706.0F79D1F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Fri, 24 Jul 2026 14:10:58 -0700
X-Gm-Features: AUfX_myzcCIwPNHoteUh9JcCBK-hOI9tnWJaFUCV6LfHXBrDjbT2vBuwQy2nK-0
Message-ID: <CAMB2axO+hMUNyk5WeOc78K3Xchf-5jOGSMJjAFUMBWXhX7YAhg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 14/18] bpf: Check helper mem+size in
 ARG_PTR_TO_MEM case
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 12:47=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Calling check_mem_size_reg() on the size register before validat=
ing its type allows an unprivileged user to trigger a kernel warning (WARN_=
ONCE) and potential panic, leading to a local Denial of Service.
> --
>
> --- Patch [14]: [PATCH bpf-next v2 14/18] bpf: Check helper mem+size in A=
RG_PTR_TO_MEM case ---
> commit 49ede5ce4d16f1df74560df7eef17176d13cb3e1
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Check helper mem+size in ARG_PTR_TO_MEM case
>
> This commit modifies the BPF verifier to check variable-size memory argum=
ents
> and their associated size registers simultaneously during the ARG_PTR_TO_=
MEM
> case, rather than waiting for the ARG_MEM_SIZE argument. It looks ahead t=
o
> regno + 1 to process the size register.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 144c2d8aa4922..2326b12a15313 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
> > @@ -8515,14 +8512,15 @@ static int check_func_arg(struct bpf_verifier_e=
nv *env, u32 arg,
> >                               return err;
> >                       if (arg_type & MEM_ALIGNED)
> >                               err =3D check_ptr_alignment(env, reg, 0, =
fn->arg_size[arg], true);
> > +             } else {
> > +                     struct bpf_reg_state *size_reg =3D reg_state(env,=
 regno + 1);
> > +
> > +                     err =3D check_mem_size_reg(env, reg, size_reg, ar=
gno,
> > +                                              argno_from_reg(regno + 1=
),
> > +                                              arg_type & MEM_WRITE ? B=
PF_WRITE : BPF_READ,
> > +                                              fn->arg_type[arg + 1] & =
SCALAR_MAYBE_ZERO, meta);
>
> [Severity: High]
> Could this call to check_mem_size_reg() process a non-scalar register?
>
> By looking ahead and processing size_reg at regno + 1 here, it seems this=
 is
> happening before the size register's type is validated in the next loop
> iteration of check_func_arg().
>

This is a real issue.

I will drop patch 15, not moving helper check_mem_size_reg(). Then for
kfunc, defer check_mem_size_reg() in KF_ARG_MEM_SIZE and
KF_ARG_CONST_MEM_SIZE similar to helper.

> If a BPF program passes a pointer (like PTR_TO_MAP_VALUE with var_off=3D0=
)
> instead of a scalar for the size argument, it appears it would bypass the
> scalar bounds checks. When check_mem_size_reg() subsequently calls
> mark_chain_precision() on that non-scalar register, could this trigger a
> verifier_bug() and BPF_WARN_ONCE()?
>
> On systems with panic_on_warn enabled, this might lead to a local denial
> of service.
>
> >               }
> >               break;
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724190813.14=
58271-1-ameryhung@gmail.com?part=3D14
