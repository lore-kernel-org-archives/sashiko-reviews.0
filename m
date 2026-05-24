Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A3A26D4C3
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 09:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779615502; cv=pass; b=fnXLiq1dnZMs/CK5fDW0GNsnFN7fXpZPiOIJDcVybbFecbtmgK1bNl3iSVSGTccCajvwghcK5lqbeI/qUMSDcj48oLO5Ht1gxuHPOCBeYzB8/RpORNxNt5aAih2PRPoFjdfw8TDMYoQbZ2NRSbkZ5ZPrXTox5asdVggGSPyRRcs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779615502; c=relaxed/simple;
	bh=TmPcun4FqmDKsTHgJokOi7PfAIsbFqtxtyvbfYMC3TY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjTToO9+gvAzfOIdP0oyscoj6raZS4xPMQTijhBc3wBuw4MrM3M97HMkjcRXyp0wvOwFwVjCZ4RkRZ+/iTF0Fvf02ODyQd2RYHTosxStND97xXGxj0+zrQLZIHIujdleO8Cw92rRf4u8GXhcW9ODmy6GSJaVMV3YZuFMAm4EhP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZCQjMQe; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZCQjMQe"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49040362e4aso29521255e9.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 02:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779615499; cv=none;
        d=google.com; s=arc-20240605;
        b=jcjMWn5PKAtH+nnIN71ifQgAI8Y6IEdGlogBdgPpuJLU0VwRETZ4jqV4OV5NCd+Trp
         AZGFv1PNRwDtTLySs/oOcXmyL0RdZ1yju83l6lWhcWtS4HvnuizYvYS9hkvYn32Qxtsm
         hv1BJJZZxJ8csPfRfY8hyCaF1A5goMt7o4fFoWp3JpL6NXKNScKqAijwpmeKFBdGPfFR
         oCyTclFD7cuymsXC7cRRCQ453gvbGb9iHP9PlcS8nvokYQ1nkFYcOu4nd1VS7N/WAaAF
         0qyVUUuzwcW0gbcAQEPOs3FcxYoOxCOiitfz1oyMk60FkaFmeZiEbD4POgzB25sPglT7
         ARgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OJbsaeR/rgcSGFXakVpHnIFOTszW2zZ6It8h8bScqQg=;
        fh=2F4/Emvu9WqzCz+julLpXdBv2My73vkGMwqdHFkhjA8=;
        b=Yo+Ju9R+PKETaEBy+AGkKYt/CHfmhtOjSuwHkPdxQL+ZM/QL6quYIocMTNUga6ZSMj
         /axNPk0JCuOGeMTFrVXrVZMqVYUnUHJ4yHNsU2Yv4vP1WCXTbqtieGiB+WrMKp3D6VJv
         RXQYA0HIBCzXGzaE4dzZq7YCRl8mcSPet+8iMPZC0hni+EhbX+MJytSdND9EgYwXv4Kf
         vbOVbLOMV7i9x6IpdapD7gJJy2JCm/icUFMPe/Q5ThNhKskZvW7KofvMReNUDMxchYeR
         dPAPuCzipURsyv19INOAKScJPkRkX5DHuHxkuttgxwAnH4uqejqrWLav9D6CVPljOeaL
         bBsQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779615499; x=1780220299; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJbsaeR/rgcSGFXakVpHnIFOTszW2zZ6It8h8bScqQg=;
        b=KZCQjMQeCW41zAKnSw153DUSdNQXj5UCKLpHRAERFujYQcoNT4pHCn6egMiDcoEkru
         /L9viUVSBowEKI1b97Qeh9pvat3oyAb4/Glk9FKy14/UnD/gOD6snyXKglL3kB1yR807
         V3ZAAcstCgJMukbCGIju0LfinPMzesJ4HPGjqkhtMEFUwNIgfTF4jvW2yaw072AnAwym
         8yQyylr6Z0c39QhuRhufr+PWg7DFv2SFc97ioFS2vlAwgX1DWTvvudoIlSv+vG+quN/l
         pRF4Y4lsugwdJS2Pcgz8SYriTwOqzb/ueTU26QPzI5ru+1984Jvb4xh6HLhanIr6wQn0
         3y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779615499; x=1780220299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OJbsaeR/rgcSGFXakVpHnIFOTszW2zZ6It8h8bScqQg=;
        b=S9H7AAgyVbic5SyfSkwQbg7/nSF/TMz0nnKy/ov8dm2q/BEoUubsDfKpb8+eqe8Zbu
         nGcczmz2JsjsDsYV+CeY/T4EXLHX1NeleAh3VpxkzkYYNZeKnwwDuXyXQgpVL9LvADyw
         lqfz8KEZciqaHqUlZKSgFhG1TodxALh1fgfYUn1KqFcp8RbGZrV0RO+XzEZLqhFt6E56
         RHIpNmhiSqtSjtHj2GhFB/afgvHrT5JM+q6nDtzH1aLALpzcGHTBUgn3+uqP9WwHip6h
         dLPSTnd4yWtqaZ7h5l66IVTpwlJz0O7/Ik0DsW2mwydXwlJpbxPVioLUk7OUeZX31fP1
         XUaQ==
X-Gm-Message-State: AOJu0YywKUreoxXKdMoCzyoLSCUoLr2v3AIWuYu5jSDmt+kCFTCxzJUN
	GWIY29Uy784r3/wV0nmhX3v6OoeEKd+iugjn/PLdBtOkYs5AGLICutFW/3GUnJC3RiMq5wJliKt
	iQz9Xxl3JK/67Je3wph4MaPvn7gSZ7Pzthwc0lhkeqQ==
X-Gm-Gg: Acq92OGROPNiiueTbpR77aFR5FgoZYhP7XDdHq9Jl/LwfstV+/NqmiOsDun0StaOE35
	BLcvyyikB7fjUvOAGw1/zyIT0nSWo6FLO03UYsYgDQcfamKjXQDyOaRJTw4Sc7jLbCNKnk/GyF3
	uH4vnmvGYLpBU8iV9jFOnHN+MRbxaewsjMewTndjbfEnygPHSi6m2HG8pPcYh3JM/L6genvDSrO
	zRRrAYD+rM7jGp3cTq53AZ9aWApyNJhnoRT1L5FZpZL1X2h//faNNC/BgpMTINvOoZHkESdklmz
	C8h9O2W1HcKwqPYmrT5Iof6CCewl9CErzPnevWqgYgB2GmEeTblJiLiIcKN2eeUmCa4fIg==
X-Received: by 2002:a05:600c:3547:b0:48a:7b55:12a6 with SMTP id
 5b1f17b1804b1-4904224b05emr178761545e9.0.1779615498516; Sun, 24 May 2026
 02:38:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260524082944.10625-1-chensong_2000@126.com> <20260524091000.8C1D11F00A3F@smtp.kernel.org>
In-Reply-To: <20260524091000.8C1D11F00A3F@smtp.kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sun, 24 May 2026 11:38:06 +0200
X-Gm-Features: AVHnY4KpkC-a7cfuZ6fFvjGjqPEgUFQ45hdg634lu0Qrzxqw07o4-eoCNmvY8-0
Message-ID: <CAADnVQKKeZYD6yOrLF8AG2kLLG81+LAVU4HTR2XWA1jR5wUkhA@mail.gmail.com>
Subject: Re: [PATCH v3] kernel/bpf/btf.c: reject to register duplicated kfunc
To: sashiko-reviews@lists.linux.dev
Cc: Song Chen <chensong_2000@126.com>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 24, 2026 at 11:10=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] The duplicate kfunc check incorrectly searches raw BTF data for =
any function, rejecting kfunc registration if any unrelated static or globa=
l function shares the name.
> --
>
> commit 3dd29707347d5a7d6755ecd640562865f115a75b
> Author: Song Chen <chensong_2000@126.com>
> kernel/bpf/btf.c: reject to register duplicated kfunc
>
> This commit adds a check during kfunc registration to search for duplicat=
ed
> kfunc names in both vmlinux and loaded modules. It prints an error and
> returns -EINVAL if a duplicate name is found.
>
> > diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> > index a62d785812076..5fc2b4ca23470 100644
> > --- a/kernel/bpf/btf.c
> > +++ b/kernel/bpf/btf.c
>
> [ ... ]
>
> > @@ -8684,6 +8684,47 @@ static int btf_check_iter_kfuncs(struct btf *btf=
, const char *func_name,
> >       return 0;
> >  }
> >
> > +static int btf_check_kfunc_name(struct btf *btf, const char *func_name=
, u32 kind)
> > +{
> > +#ifdef CONFIG_DEBUG_INFO_BTF_MODULES
> > +     struct btf_module *btf_mod, *tmp;
> > +#endif
> > +     s32 id;
> > +     int ret =3D 0;
> > +
> > +     if (!btf_is_module(btf))
> > +             goto out;
> > +
> > +     id =3D btf_find_by_name_kind(bpf_get_btf_vmlinux(),
> > +                                     func_name, kind);
> > +     if (id >=3D 0) {
>
> [Severity: High]
> Does this logic incorrectly reject kfuncs that happen to share a name wit=
h
> unrelated internal functions?
>
> btf_find_by_name_kind() searches the entire raw BTF data for any function
> with the matching name and BTF_KIND_FUNC. It does not check if the found
> function is actually a registered kfunc.
>
> If a module attempts to register a legitimate kfunc, couldn't the registr=
ation
> be unconditionally rejected if its name matches an unrelated static or gl=
obal
> function in vmlinux or another loaded module?
>
> Would it be safer to verify if the matching function ID is actually regis=
tered
> as a kfunc, perhaps by consulting btf->kfunc_set_tab?

It sounds like a valid suggestion, but AI is missing
that kfuncs are global functions and vmlinux + all modules
is one global namespace, so btf_find_by_name_kind()
is not only enough, but it's a good check to do,
since modules shouldn't be able to register a kfunc
with the same name as the existing global function.
It's arguable for static functions.
Technically a kfunc in a module that matches static func
in vmlinux is ok-ish, but it's a sign of poor name choice.
So good to reject as well, so the code is fine as-is.
No need to respin.
