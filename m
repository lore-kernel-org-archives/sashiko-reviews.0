Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E302F242D97
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 03:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779594516; cv=pass; b=ZRWR4Wuvl1BWjJPi3+vm646hkPXbwD1QnDQgxH4pFe0kdQVdLaxDZZealpwF5i2j2ishe3d7JMtcxMqxeXW+mxucrxIldsFpWogBMcUy+VmLnBad6DBf4l9+Fty4NH9BcgBp6e3f2ug9x+2cGeSB+YrKKmOhXRPloRpuC6iwP9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779594516; c=relaxed/simple;
	bh=AtZ2MaZHaoO9EKMTNvZUyn4h95EmBDbv5Lrlyy6W5DQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jmjvM0XPhUFVNVUFASatotlJdKOTClspK0E0s74meZXOGScSM+4tkC6tLuSRSuumQUAkpT9aXnvoxy2y92lEJkpKvO3x1BNh8M9Z6B16Akywox9IH+7CgJ8Qg7K029LBfpVoBxIe1SwNTQb4tQDeKBt7DxcXMOJ02e49EEtaO+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LuVH1kJj; arc=pass smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LuVH1kJj"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7e636d1bedbso63594a34.0
        for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 20:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779594514; cv=none;
        d=google.com; s=arc-20240605;
        b=LcxDXSZvYhU7Yq8B9LBHfjqe8cT189jpG1paq85BtTvW4VFZJGLdQbcBId9WwJiDiO
         SCUZ9r2vPgTP65mdIxavcXRpY5XiJfHnsZ18+TV29UVlcqOkFtox59quNJFKMWa8+5cO
         t6JA49IdbyMwCCxDzYESsanUbnR/CzUiQNEIQLK6cOiZvER+YFZm29JYKzJFDefe26rr
         hJoHiCGe1t4KOS5f+638O/Ysp6Xnsm9b/o+TEeQibsK6xdfMDzYRgZrmpY21lzzP/DJx
         CFw6ZzERsiTdHMN/aER83PETAgFfuKW8uu+VIczBnkcxkieMvEqn0hiWfDvW0o2bylEU
         Icnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4po9w5TOulpuknOUfePNahpl/Kq8KqTYSA25XKFO99A=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=ZQaqC4v7SocHdgbctOmqwpCF2oNoxMwkjBdOVvSgEHVWFsm/3V4sjQAeRCBYffGh7q
         GJm2RsfNBNIcjBEXLqzWD1rrthZnjtZKhHpnBI/foUUaH4l+D47JwhJCXwfqxLan0KGq
         YIsEcnmKtPNoN3TUVvWYzEFFUVYaAX/sihKdlMaD+2PQYX0cNkdjpczPmBypduE4mqET
         QRR9o5tKnBR2POlLJWeGDsQnE1kLHCxpyxwnhS/zydjPFKGs1l8vE2am0c5qizSkCjaR
         dwcCu6A4vsqxoHCCmX7lKTy2JrWXTbI9MJ6tWfMUC0KP4jKgo+AsthXzED+YEyqSQMzb
         1FMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779594514; x=1780199314; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4po9w5TOulpuknOUfePNahpl/Kq8KqTYSA25XKFO99A=;
        b=LuVH1kJjtj62rSB1mm/3a7zzhtmCYgkoRIaVcIqmKQMUiJutz8P/KxXC0yD9DVo3fw
         q6Bxlcye7FXPrZ6z28CMQ5YswGgHKfZfP1KxqJzvx7F/iVsGMtA8p9kaCQGYqwf6/j2k
         ORjxAyiLPjhBwjc5UYEb8ISPOQeTbf/CAX7AOKmfes+jLv9c/2HbJQXO6g7Blg1uPOlz
         42LwERKTfMOR1+qZfLOelvorcWeDPj5orq5sPVJxuVRywy5rCKozmsbiORn8t+hfWEqk
         otzITgaa9stYTQM06j21aFcBYrjh2XoaPRt4ek07tpp4XKi7vN9PXvxnpIzAb0JrMKSH
         GAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779594514; x=1780199314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4po9w5TOulpuknOUfePNahpl/Kq8KqTYSA25XKFO99A=;
        b=U19bRm/rZ78wDaDxPG7GjDPggDn8xtlBiJWI82hpUBmVSBmjZnM286wj8K8UCLewH1
         JVqU0X2IGkHAr5ZQ7iGCj+r4A3tfqb5vPaRoPBjM/jPmI5/h9zvR4GOZPRv/GfiUd8fE
         I9y0MI9rWY6242DNYlN/xxA3bDZFdjyQsikqUlwXRHgDZ49+S2mngCWC9MR391AUdyQp
         S5JEU+MTiTU68U7L5XwFabzERwJ3A3OwJ2dvevnn4vc1MHfEsv0O7nNrahMjFzHwkDpt
         91mG1NRE2ztvhY+r/uFShLQhOqqpWgEDjPOw/xsEp9Jl9AQ2kP9UvBAytT6jHLgw6o4L
         3DXA==
X-Gm-Message-State: AOJu0YxEceidJcXHVO7+6tTqQUrmeYtxAY5dJgh8JzZzbsoK7ASU5Zty
	wdmIqTItBLPjXHekTWxJfs6Q4aJAZvCAPsUKq5J6kL1Enz36+jXNSFKxMwibxhmlg0wQyVcqLDY
	1YqvPLpP/Kn7VS4puIkZqC3jeCPNDlY3zoBzG
X-Gm-Gg: Acq92OFWwxiGE9uWX3gprWvRmQGbMLldUaw0kVMeLGDtKuSIxWkQN5OysfJ3GhcU37r
	xn/mg1zfxjVwNWYgPFHznzHTSs29EDyCgcL8mPoemkcONx2Q+yI09Mwsi5mJSsR3Hd6wo+pl0n1
	dVKGnyVApNhEXouZQbzo7rEa7jE4S2roKRYz+6g4XOSiS6QKGeDVyjZqhESxEkGkg0XexMXPrHe
	vGkN23CM8URSoC8nlylmYf+1xBJCMkCmuvm2fVb4n2Ans5g2C/pU8qCYL+q0x3CVNdmbrOM32AP
	epcN6FzZ
X-Received: by 2002:a05:6820:c95:b0:695:a638:c6ba with SMTP id
 006d021491bc7-69d7eafdf79mr5207259eaf.7.1779594513698; Sat, 23 May 2026
 20:48:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260524025853.13786-1-suchitkarunakaran@gmail.com> <20260524033039.963AE1F000E9@smtp.kernel.org>
In-Reply-To: <20260524033039.963AE1F000E9@smtp.kernel.org>
From: Suchit Karunakaran <suchitkarunakaran@gmail.com>
Date: Sun, 24 May 2026 09:18:22 +0530
X-Gm-Features: AVHnY4IjCNkEPTXrJZAeO7hZb87dCg501XN800sFjeXZaLpJSsD8-beFNxmuwjk
Message-ID: <CAO9wTFhix-Qgpm4EW7Eh9GxPgHnqoQ0bN5_v+GCmHbF0VSXK3g@mail.gmail.com>
Subject: Re: [PATCH v2] bpf: replace pop/push emptiness check with bpf_list_empty()
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 24 May 2026 at 09:00, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch introduces a call to `bpf_list_empty()`, which is an un=
declared function, resulting in a build failure.
> --
>
> commit 9fb6024323da084c2713bff3f8a0e6018dc6bd72
> Author: Suchit Karunakaran <suchitkarunakaran@gmail.com>
>
> bpf: replace pop/push emptiness check with bpf_list_empty()
>
> This commit simplifies fq_flows_is_empty() by replacing a pop/push check =
with
> a direct call to bpf_list_empty(). The intention is to avoid unnecessary =
list
> mutation and simplify the code.
>
> > diff --git a/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c b/tools/t=
esting/selftests/bpf/progs/bpf_qdisc_fq.c
> > index 1a3233a275c7e..8107f5934d2d7 100644
> > --- a/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c
> > +++ b/tools/testing/selftests/bpf/progs/bpf_qdisc_fq.c
> > @@ -196,18 +196,13 @@ fq_flows_remove_front(struct bpf_list_head *head,=
 struct bpf_spin_lock *lock,
> >  static bool
> >  fq_flows_is_empty(struct bpf_list_head *head, struct bpf_spin_lock *lo=
ck)
> >  {
> > -     struct bpf_list_node *node;
> > +     bool empty;
> >
> >       bpf_spin_lock(lock);
> > -     node =3D bpf_list_pop_front(head);
> > -     if (node) {
> > -             bpf_list_push_front(head, node);
> > -             bpf_spin_unlock(lock);
> > -             return false;
> > -     }
> > +     empty =3D bpf_list_empty(head);
>
> [Severity: Low]
> Does bpf_list_empty() exist? A search of the codebase doesn't show this
> function being defined as a BPF helper, kfunc, or macro anywhere in the k=
ernel
> source or BPF headers.
>
> Since BPF list structures are opaque, their access must be mediated by
> verifier-recognized kfuncs. Will this cause a build failure due to an imp=
licit
> declaration?
>
> Could the existing bpf_list_front() kfunc be used instead to check list
> emptiness without mutation?
>
> >       bpf_spin_unlock(lock);
> >
> > -     return true;
> > +     return empty;
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524025853.13=
786-1-suchitkarunakaran@gmail.com?part=3D1


bpf_list_empty() is available in the current bpf-next and linux-next
trees, which is what this patch was based on. It has not yet been
merged into mainline or the current rc tree.
