Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55305386C08
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 23:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783640699; cv=pass; b=gTqZKMptDwbu4MevStFYMLvj+lsTOqIojyrL0OzVBkt7O551oSoYA+SeiGOj2UTwprCBmi5b/9nJc5F8/6qShw8YSlyjZquvrqJG3+fQmC675dGWF0GnIpN7jj330L8khWZlYhssxG3EXATS7TR3PPSOdhT72YB/TWd0GZorpKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783640699; c=relaxed/simple;
	bh=mycG0WIjcqFxC1i9zKchmdz6yos5TZRSwXdFbFARR5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OVB7cwIigbugF34FpdkCRtGJdPqA8W4er+e0g8aNfHkxFG8eIBiZnrrU84gB7/b1QxzSN4Vfoy5xyE7UqgEOEumUbmfdfmbz4Kh/AQZmz3PzLmgxMZMqtd0j77uXgPm6uuDk/WZnob4HcCpE7VebiOKR9EZn1zVLW59EmNOzG8s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ie8TvQBp; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ie8TvQBp"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6649ffb1d01so521300d50.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 16:44:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783640697; cv=none;
        d=google.com; s=arc-20260327;
        b=SMldxc4q1gfM0kZqKwwgw/DlUGVMbu/I5b5E29oIwRb4xElKCxlO6/a9qyaMbdGJNo
         Jha9yVID6gXv97o9jaT9lBrQ1Ck+8Miv4bMXCup++lYdTtu/nbie/tx0lLov5PX8ztl7
         IjAw+G/r+IxQ0OiikkjkmblHOI3twiFbgce3ct3YFVsE0w5eDZmFX9wHtY7sIb7VRA1z
         NSfQSSV7pGOgoZe/nnHKxLEdwF0yc2ew5Bf9u9sTxG05NGlKwOWCHv+x+mbRYN7juD9m
         4wBYalV70in1N545jtj5cTnviPwxOJa2RVk5nV3D4ztTqhcdaGwSugWjbyn8/mFPAkoN
         ycyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OWohNBeQfOn/m+hJlzsn4NULDmDrEFw0IGuA43Bi8hc=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=jOpcXByt8WxTNzYDXEUQ/HObldS1sgUeFOCLYhp69F96wWSGXqknT+Uf41dwoBSY8r
         vXPjN/UVvxEgbJCvHJkqcES9EXO4XX/kVESA//u3MetcAiGoSGWeCQJ2R6UIB/XxT6FJ
         AN0wA3336yWHLriqdbjxiGJ3YqqppSj/KEUmLHUNkJT2/ELduGT+aDjWyzxPlKRVSDXz
         HxgaWEKrL9LG9A7xXSb4ZUHcdAiP7Ely9HTEzMKW5+chcYryw5FhHfVRm6Ost/4Prth6
         jZakBc9YzPSlJLiWmzfwqA0aX19jPEFN98460ajtqL6FbPdjEQ/rTwmmEeP9bO6QGBXt
         rlng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783640697; x=1784245497; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OWohNBeQfOn/m+hJlzsn4NULDmDrEFw0IGuA43Bi8hc=;
        b=Ie8TvQBp3zSdZFcsMs3lxkOY4xN6eoDhYTDwdL5MVrhlibQlsQz9WgBZ7c8ssqZck1
         mfoeKVHEb5GWcXO/dDjZZwf8Dyo5KaD1W8fxR+XoWPf13xCiBJcKOPd6XJFmd1ZqOYzF
         2k2zB29dcI1sUWXr4nUf6ePsKQe8Hx6t0Nt1CcVY2X2ViurN93eUHUBTJoXGmXgAX2Lg
         bc498X2XcTXNGvOzo6lED1syStEQ9ID3IrS4lLThQs9T9xeB5DzkqBBA6EwBhWO0Iq+J
         2Or0hOZQ2zFHoWMXlFLC9jCAr8Cc1WSoE8hSUqnPWcNuVFzX9agbaPQw987H5uZL2/E2
         eHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783640697; x=1784245497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OWohNBeQfOn/m+hJlzsn4NULDmDrEFw0IGuA43Bi8hc=;
        b=Oq1/MjrExWWVYMrSA/gx84eGwyNOgA/LgIPD29L4E32OMW/3iiqOspqUR+XIQL9kmL
         1Wl881/ieev+pDtv1foEemekFIjAF8deNclXMwEWPBsTuuH4xTP01xvpnEV5YyZ+dny7
         zvH+pkEvEexCKLGUut0Ikf/2UXYIjJ2dsymaSiYgPZ+oWei1+RZiT0Q7QsGejlbRmd9o
         CL4F3TYLi/2p+kH8EUtS434FNtEZMWjtTgOvBKVOfM79m+8cpv91vF7nVHzwJhpmC4ii
         kEoMwB2hC9gtFM+DODjoBcjb8gO7kJHTuA9ZSZziLvG/rkSSdlAPPHASanw1S1ssRAB8
         eH+w==
X-Gm-Message-State: AOJu0YzgWA+NdETRlk628mYZSjPafiGa0h2/mW1vfPHI2nI0UClSs1ZG
	zfcoqxGknaz6rAlzlqBrfkVLV4dNQ152oAk/0z86AzoWDvdEbYCETEuvB6RDE+uQ0OeH8A9Ixia
	U+XtV9kXsK7U7YuKnUKNyWlSBjdGC/sRfwQ==
X-Gm-Gg: AfdE7ckboO/lvwHSboioUqDJyXw27Msu4AVu4/gQBNkXuuSBpqh/LmIuKG1jjqlNmjH
	izQ8cnWqO5+oAE9J21xnWRoCmlwNhcFAuNLKTvAF1bDPfJQZIqx4sjP5bmm9bc+znr4YFCiJtWY
	vb3NkJZap7OHsr+iO4TmYVvEOdVRSoOKdzi89vUXJLM1tWEnATVbOJYnv625MzRo8B6v3gwBPdh
	/l2HBWOBzhUynzYk+dWb1MNAGkxyMysXbMuEDeu9jZO6N/Slg9f/WG5IONxvj9QHSwrXVzGzIFO
	wLiAN9w=
X-Received: by 2002:a05:690e:190e:b0:667:ba34:51a2 with SMTP id
 956f58d0204a3-667ba345c2cmr2765001d50.101.1783640697335; Thu, 09 Jul 2026
 16:44:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709230242.2003459-1-ameryhung@gmail.com> <20260709230242.2003459-5-ameryhung@gmail.com>
 <20260709231615.0519D1F000E9@smtp.kernel.org>
In-Reply-To: <20260709231615.0519D1F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 9 Jul 2026 16:44:46 -0700
X-Gm-Features: AUfX_mzYJXMOtOOJaJMklifYptVOVdovtn8Z00cd9H3jAzrszap3HC_txOOMSuk
Message-ID: <CAMB2axO42=jbaOzy72DzNH_wRBE9Oxm_FJcnYG8tSFArOUaYLw@mail.gmail.com>
Subject: Re: [PATCH bpf-next v1 4/4] bpf: Unify helper and kfunc call argument meta
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 4:16=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] Uninitialized stack memory read in `check_kfunc_call` when handl=
ing kfunc calls in signed BPF programs.
> --
>
> --- Patch [4]: [PATCH bpf-next v1 4/4] bpf: Unify helper and kfunc call a=
rgument meta ---
> commit b1105689a4b2bf6e2532e6d414d410ef55c0694b
> Author: Amery Hung <ameryhung@gmail.com>
>
> bpf: Unify helper and kfunc call argument meta
>
> Helper and kfunc argument checking carried two separate meta structs: the
> verifier-local struct bpf_call_arg_meta and bpf_kfunc_call_arg_meta.
> Merge them into a single struct bpf_call_arg_meta. This is groundwork for
> sharing argument checking between helpers and kfuncs.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index fcd9715eff017..5ccb00a8c84ce 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
>
> [ ... ]
>
> > @@ -12972,7 +12953,7 @@ static int check_kfunc_call(struct bpf_verifier=
_env *env, struct bpf_insn *insn,
> >       struct bpf_reg_state *regs =3D cur_regs(env);
> >       const char *func_name, *ptr_type_name;
> >       const struct btf_type *t, *ptr_type;
> > -     struct bpf_kfunc_call_arg_meta meta;
> > +     struct bpf_call_arg_meta meta;
> >       struct bpf_insn_aux_data *insn_aux;
> >       int err, insn_idx =3D *insn_idx_p;
> >       const struct btf_param *args;
>
> [Severity: High]
> This is a pre-existing issue, but does this lead to reading an uninitiali=
zed
> pointer if bpf_fetch_kfunc_arg_meta() returns early?
>
> In check_kfunc_call() in kernel/bpf/verifier.c, the local variable meta i=
s
> declared without initialization and passed to bpf_fetch_kfunc_arg_meta().
> If the call to fetch_kfunc_meta() inside it returns an error like -EACCES=
,
> it returns early before initializing meta:
>
> kernel/bpf/verifier.c:bpf_fetch_kfunc_arg_meta() {
>         struct bpf_kfunc_meta kfunc;
>         int err;
>
>         err =3D fetch_kfunc_meta(env, func_id, offset, &kfunc);
>         if (err)
>                 return err;
>     ...
> }
>
> Back in check_kfunc_call(), the error path evaluates meta.func_name:
>
>         err =3D bpf_fetch_kfunc_arg_meta(env, insn->imm, insn->off, &meta=
);
>         if (err =3D=3D -EACCES && meta.func_name)
>                 verbose(env, "calling kernel function %s is not allowed\n=
", meta.func_name);
>
> If the stack memory is uninitialized, could meta.func_name contain a garb=
age
> pointer that leads to a crash or an info leak when dereferenced by vsnpri=
ntf
> during the verbose() call?

Confirmed the bug is reachable. I will include the fix in the next respin.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709230242.20=
03459-1-ameryhung@gmail.com?part=3D4
