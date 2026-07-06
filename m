Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F3841DEF1
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 18:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361534; cv=pass; b=SNbkqCsFfyZjAehUwe9fNhXGYjG86hdiVMOWP3cz0VFJhy7gOGapD5L5Qlp7i+EZa04SIJHNl3Z6ZYchQMZImv9R+zze29yeCqKC00Ojx7/OaJWtUTvudz4PjY74NV3TxI0ygrMjtT2UZ1hnxQPm1HLB2oHHygNR4qovICXCGk0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361534; c=relaxed/simple;
	bh=yiA+n7/p+x0XswDYuq/psbx3K499HHj0wTZI2TToCVk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzT8ENo/U1mhws9325Tjd+T93HpB5rx519pzqVziqUO/Wu0O30gkmILbiLeyLbgyjxqnmhLNxaS94UYvvYFX2vaDfvkKwOE0ndmef1/Gsxi8+CM33eS/kUHY2rw1DxnaHASaqP178MEpVE/L1S+Tp0YYGyTVcwFvUNL8R1VYb80=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y1sYhsqv; arc=pass smtp.client-ip=74.125.224.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y1sYhsqv"
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-6611669cd16so4611731d50.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 11:12:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783361532; cv=none;
        d=google.com; s=arc-20260327;
        b=CGMiMTYSMBaIvDSeJ9LWbLKm7M1MfAo7EkPyJnqtAeYgNDJSQd59vT3pybw8dpK/+1
         PvxG5b3nE61X4jN8p9NSftp+UF+gTsZocFMzONXRSOqjIn+l4/wRoV7uGYV/u1XT00vS
         5TEvduk0H0LyhGWqkV5v2TvOz10p2oiOatTN3FuFKpohHrZ8NuDJoZNin+8pnxt27xss
         EZ906vSdrHA7fvQuvwHzixRjHgdUZBV4pRPvEDWNhC1HTm1SagAtfULWPC4Nh4yf5ulo
         uRr9xViIb1pDxwFcWs9wrCUm72j0p5k/hDYRg/mc8A8gfdqUjAft83qEJiuTosYgGxKK
         dn6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WOW5B8HB09NWaWZjxdzfciyn9Tp1/iVKci05x54f4+k=;
        fh=HjIFpkYwXuLPZoZi0KCFLeRUH7NnglL0WzVsClLHrZo=;
        b=jdkViXOmjUEzyFyqsXxNVXjfZskeV/0/MeajSYo9aiE+AakNEftr6Qcgay3eQVCjfv
         u5tvWtWGsTWQWJhoagXvdfzC19/yRryhp3hdApqOopXFKmTS6WO8CLqYaM402PHH9c78
         GrZw+sHclbrg91k6xaaNSAYK2KXniHP9VShqQd3v8NdeMazwvXMa14cqcmsrYxsz2BeI
         QO5Io/XMPLTiNG+vUyKi2KuQYQ++q4WdTScA9mZxH7uiq3x1euMgsWNosUj14nGj4f5T
         EYQLCKreoklMxEct2Jc3iANkxGRlC+uaQLXX5L2iklRUS6Nb9Z/QtDXmeWzoZIsUD9S3
         qKrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783361532; x=1783966332; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WOW5B8HB09NWaWZjxdzfciyn9Tp1/iVKci05x54f4+k=;
        b=Y1sYhsqvXCH+5H2eQrKVmZuXpbG1mhGh6bmPJCYXzpQHowzrTdT8m/fMIGyfMJOiPz
         PuZhJU5G5Y1wA9la0sBN0OC7Gg/4khde32FSlJWFHmCqd9aVwdzUNcLvnsSwg8txMhLr
         9GFG1TI8Tk+BYSIsuhTD/cgCbEjrlcP3LiBgQfLDhT3VyQYbchRLSnIlfM1UZ8+FfI4r
         pweu27xy+jBhwEyz/aFNBNgm+y+Ex3m/mbJxX9zqgY5Y6GGohUsZH0YL0LacpsptrNHB
         YA95tk0C+DAgIohI1zH7Xm6lByp5qARQxerU35TBmh353FuWYlyQ3hFYorcirWUb2mGe
         UPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361532; x=1783966332;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WOW5B8HB09NWaWZjxdzfciyn9Tp1/iVKci05x54f4+k=;
        b=sLHt6wNpASYMuaPYfs4WIfBm+iZEfEpeLA+FhiDgtZsGFpIMY8QImJjOK2iJwNcYV0
         3A053ZDAzR3LyoinqvTlWAhq5FX+17axlcoi7ePs0spKGw24zuOWvVnON6v9oOqfk0ml
         2rjutbmLrIkZSXdQhuRFG3Aw9UtIsBxTzoxjB1ZEd5rM7SiqD1TAfTulDEN39UZDpUR3
         93ny5eL7W9X/CZUl+qenZN5Ix5eU4rKQieo2ivh+f8jpR1vszCclTWWOAOJfi/l/H6/P
         K2CU3k4KNKPYmJQSPRvtYHcTFuOYO/Rcfhpmr9borhsuBmytmRrT7D4Vxwgfo7ufbZ9B
         IRPg==
X-Forwarded-Encrypted: i=1; AHgh+RoIStgqnf7I36As7Afb9Xa+1esyUv8baRznasqfa5D9PKIxUd5nO/Kk1sfDBV7RGko1ZqXgKIHptFg+cIc25Cc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwL57VX0azt3nkqQAXL5cs1E+ET3MrHUinlbbacp0TiEBYCmar
	b0ayAV5hK5dl3WzZRUYeC4qmoiUMlFz7HNbK6KQUfmtJfNlp3ZHLhdmkLCvyGeR6kx+j2XSmRiS
	7sCndx06glgGkDwkosUoLLdUK59oKqpA=
X-Gm-Gg: AfdE7cmT+tJt+7QtaWw8xFz63zyVyB5YULqwfbiz4jcxfv0g/xelu+mrtSUpWUAgfQg
	7WCLY8ATnZF0Oc+AVd/1t1frAqOc7I6AVQBb7QlZDb/slCHJ+hIj8MX5jMICvpqTbod6GkmFhzM
	GpvS8rlE/d0vvKt4cc/ELqYYl1bYLu+pYDVXbr5eIp+JkTggGEg10Xxsg1qSZi7wNyCv+cUKzlI
	VPdIzyzBiKRJQZbQ4khOP7z23W2UZLSgGNYSL9SdGoiYi4GFe6tXiUAMWhNsQ7am2ZT3DN1zXDb
	AjXvwV0=
X-Received: by 2002:a05:690e:4842:b0:664:cf93:40d5 with SMTP id
 956f58d0204a3-6677fb7ce06mr1083778d50.31.1783361531427; Mon, 06 Jul 2026
 11:12:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260702224519.800135-1-xmei5@asu.edu> <20260702230504.0E65E1F000E9@smtp.kernel.org>
 <e6ec128e-1acf-4dc7-8884-e4d7ed14d25b@linux.dev> <po6jpmx5q72uvblx23atsbwvxhoszpmrlkjd6txljljufnjeqj@v3yov32574sm>
In-Reply-To: <po6jpmx5q72uvblx23atsbwvxhoszpmrlkjd6txljljufnjeqj@v3yov32574sm>
From: Amery Hung <ameryhung@gmail.com>
Date: Mon, 6 Jul 2026 11:11:59 -0700
X-Gm-Features: AVVi8CcfvnGrpK11jF1WTN0KSLfHGDORby9ZO5VYKuT9fxtIDga1jzrdHDerLjg
Message-ID: <CAMB2axN8r-B1gc4f-BSh5d=VFttxGLu+ubB_53nzpAqvYd0HVA@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf: reject mini-sockets in bpf_sock_destroy()
To: Jordan Rife <jordan@jrife.io>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, sashiko-reviews@lists.linux.dev, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 5, 2026 at 10:45=E2=80=AFPM Jordan Rife <jordan@jrife.io> wrote=
:
>
> On Fri, Jul 03, 2026 at 10:15:27AM +0800, Jiayuan Chen wrote:
> >
> > On 7/3/26 7:05 AM, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
> > >
> > > New issues:
> > > - [High] The patch causes a functional regression by completely disab=
ling bpf_sock_destroy() for TCP mini-sockets (TIME_WAIT and NEW_SYN_RECV).
> > >
> > > Pre-existing issues:
> > > - [High] The helpers bpf_tcp_check_syncookie and bpf_tcp_gen_syncooki=
e suffer from the same type confusion and out-of-bounds read as bpf_sock_de=
stroy, but remain unfixed.
> > > --
> > >
> > > commit cf46da8728e7f1fca4584ccdb089c82b7fd3061f
> > > Author: Xiang Mei (Microsoft) <xmei5@asu.edu>
> > >
> > > bpf: reject mini-sockets in bpf_sock_destroy()
> > >
> > > The patch tries to fix a KASAN slab-out-of-bounds read in
> > > bpf_sock_destroy() by checking sk_fullsock(sk) before accessing
> > > sk->sk_protocol. It casts sock_common to sock and early exits if it i=
s
> > > a mini-socket.
> > >
> > > Fixes: 4ddbcb886268 ("bpf: Add bpf_sock_destroy kfunc")
> > > Reported-by: AutonomousCodeSecurity@microsoft.com
> > > Signed-off-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
> > >
> > > > diff --git a/net/core/filter.c b/net/core/filter.c
> > > > index b446aa8be5c37..3e70c8ab5aab1 100644
> > > > --- a/net/core/filter.c
> > > > +++ b/net/core/filter.c
> > > > @@ -12665,6 +12665,9 @@ __bpf_kfunc int bpf_sock_destroy(struct soc=
k_common *sock)
> > > >   {
> > > >           struct sock *sk =3D (struct sock *)sock;
> > > > + if (!sk_fullsock(sk))
> > > > +         return -EOPNOTSUPP;
> > >          ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > [Severity: High]
> > > Does this unconditionally reject mini-sockets?
> > >
> > > The commit message states that mini-sockets have no diag_destroy() ha=
ndler,
> > > but as documented in the original commit 4ddbcb886268, request socket=
s are
> > > explicitly supported because their protocol diag_destroy handler
> > > (tcp_abort) correctly handles TCP_TIME_WAIT and TCP_NEW_SYN_RECV stat=
es.
> > >
> > > If we unconditionally reject non-full sockets, wouldn't this break BP=
F
> > > programs that rely on bpf_sock_destroy() to forcefully terminate pend=
ing
> > > connections or TIME_WAIT sockets?
> >
> > It's true. Please also include a selftest to reproduce the issue and,
> > another one to cover the non-full socket.
>
> +1 to the selftests.
>
> I'd just extend tools/testing/selftests/bpf/prog_tests/sock_destroy.c
>
> Considering the original intent was to support request sockets and time
> wait sockets and tcp_abort already supports both, perhaps something like
> this would be better.
>
> __bpf_kfunc int bpf_sock_destroy(struct sock_common *sock)
>  {
> +       int (*diag_destroy)(struct sock *sk, int err);
>         struct sock *sk =3D (struct sock *)sock;
>
>         /* The locking semantics that allow for synchronous execution of =
the
> @@ -12672,11 +12674,16 @@ __bpf_kfunc int bpf_sock_destroy(struct sock_co=
mmon *sock)
>          * Supporting protocols will need to acquire sock lock in the BPF=
 context
>          * prior to invoking this kfunc.
>          */
> -       if (!sk->sk_prot->diag_destroy || (sk->sk_protocol !=3D IPPROTO_T=
CP &&
> -                                          sk->sk_protocol !=3D IPPROTO_U=
DP))
> +       if (!sk_fullsock(sk))
> +               diag_destroy =3D tcp_abort;
> +       else if(sk->sk_prot->diag_destroy &&
> +               (sk->sk_protocol =3D=3D IPPROTO_TCP ||
> +                sk->sk_protocol =3D=3D IPPROTO_UDP))
> +               diag_destroy =3D sk->sk_prot->diag_destroy;
> +       else
>                 return -EOPNOTSUPP;
>
> -       return sk->sk_prot->diag_destroy(sk, ECONNABORTED);
> +       return diag_destroy(sk, ECONNABORTED);
>  }
>
> (Note: I haven't tested this)
>

Looks correct to me but I think it would be cleaner if we just guard
sk->sk_protocol with sk_fullsock().

-       if (!sk->sk_prot->diag_destroy || (sk->sk_protocol !=3D IPPROTO_TCP=
 &&
-                                          sk->sk_protocol !=3D IPPROTO_UDP=
))
+       if (!sk->sk_prot->diag_destroy)
+               return -EOPNOTSUPP;
+
+       if (sk_fullsock(sk) && sk->sk_protocol !=3D IPPROTO_TCP &&
+           sk->sk_protocol !=3D IPPROTO_UDP)
                return -EOPNOTSUPP;

> >
> > >
> > > [Severity: High]
> > > This is a pre-existing issue, but does this same type confusion exist
> > > in bpf_tcp_check_syncookie() and bpf_tcp_gen_syncookie()?
> > >
> > > Both of those helpers take ARG_PTR_TO_BTF_ID_SOCK_COMMON and cast it =
to
> > > a full struct sock *. They then immediately dereference sk->sk_protoc=
ol
> > > without an sk_fullsock() check:
> > >
> > > net/core/filter.c:bpf_tcp_check_syncookie() {
> > >      ...
> > >     if (sk->sk_protocol !=3D IPPROTO_TCP || sk->sk_state !=3D TCP_LIS=
TEN)
> > >             return -EINVAL;
> > >      ...
> > > }
> > >
> > > If an XDP or TC BPF program passes a tw_sock or req_sock from
> > > bpf_skc_lookup_tcp(), won't this result in the same KASAN
> > > slab-out-of-bounds read since sk_protocol resides outside the bounds
> > > of struct sock_common?
> > >
> > > > +
> > > >           /* The locking semantics that allow for synchronous execu=
tion of the
> > > >            * destroy handlers are only supported for TCP and UDP.
> > > >            * Supporting protocols will need to acquire sock lock in=
 the BPF context
>
> Jordan
>
