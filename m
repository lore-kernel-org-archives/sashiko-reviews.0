Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B701A27B353
	for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 22:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781388118; cv=pass; b=MsaBIdtyZe3DKMkQkwBcAWV7zaNelBO6+JJ7T6BCAg3FQbxb2/JhIXmlp5xuXYZccSBbVJO//FhwwbtmPKqLb2oAM8iEO+sSmf/aUsHbeC67aZShJ1BxxLgmMAdIGw3bt6O5xBwX4aRTCsay7jaG6yO1U6v2rZ3lmkNOKhlNtTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781388118; c=relaxed/simple;
	bh=f0dboT9HbEPgztSvCb5V2Mo86m1g8/W+EO+6oIonMYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H3o2OFmt4rv1W+H5YzZT3e1R+kLGZ6MUvyX2bmtKzaBH5ZbKEte2kitV2FYCBWorf03QaluNJXVIhCvVuACOY3jP7ZPmkEQhGacAOziAZyGw+VQFDhZ7xU4mavHm5FM3yqZJ6RF+9Uy/+8EE8/K/8wRKfmnUL0ndDan+pPBDtlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vOAByUw0; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vOAByUw0"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-68d233bf083so2902269a12.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 13 Jun 2026 15:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781388115; cv=none;
        d=google.com; s=arc-20240605;
        b=DRl1y1hstWr2tgSG7J4z6q0CDpjD61rqU2gGylhHeVpuvpcBqn93oCf8Z/UOxxNPjL
         J8ZhwGMbJc1J+bUZcb2j9Wnne4WAf8SG8bLOHv3gabn9r/RqoJ4oCQmEQlj4QihWVV9w
         OHpH0FyD089K9W4VIbyDjxxpYcU9KSzpThsnlGGaipk/Gey2I53o/7iToXJqc0lakyF2
         9V1DFBAVsvSQBrooyY2j7C1GeABjUYfAs4V5thDp4yuXe3b5ii6O4NUJphLnXsV8jDbb
         R78ijkfnm575AI6pGY11QI0hHP8bMNiGZeVuAhDzpTxGyPqYYW6a82xVxUGrWxefwupG
         1Bgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pOyPLd+VCfIBQPcIBHqp74G9VvIByXO6xAOgWcyyZtk=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=G9L05tXnjh8xGj+5c0JhOBg0vCiK/XVDAHISo17p7ToUTv4J0SXjhta288OaTOa8Om
         QOjtmtzS6l9gEpBwIhmjN/uSycOssDdV1XkfbYCBjBMMG2nvz8lmZ0Eb9Yyf2fJnxgtf
         jcsAOlO9R8dGOPtLuOLNXYtfKTf2ovqULnYZruQz5sNd+RQHWnigyQ8RmPTbTXufvnvh
         2qNfuIPz6YHNre6vFjmKWZvStZJcK0Wc3QX03afiF+hytnYNDu36/6Go1q78zh3G2sjx
         6Hp/WxhdEteUYrDYBEYjECAq53XkkLAly5iTmRAIHz4stme/PEcGRfCf6T4RCDmi6VfC
         dd5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781388115; x=1781992915; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pOyPLd+VCfIBQPcIBHqp74G9VvIByXO6xAOgWcyyZtk=;
        b=vOAByUw0GG99Et6hJ9MBLPv2OPSzp3P/INHoMVJqvrY/QQQJyYsQjJobBDEC97HsiI
         bOkH/JQJpqv2f7NV85IdiPd2j36eD0/HixNjp5srFLhC1J+dBrMX8gIY54OXJCPZDKBI
         4wSLO9nFazJpnSasQb1FQPvNEacFQhheUnSWp+TU3w8MIlXA9NG3+JMZHsE+GwOYjYWA
         gqBf2vADbN1/1X75x1guiB7DfQvdJYPyXFTBwlL9ciMmy2NTwJ5CQ1FxpigW81FVyU8P
         wo6gE8GsFaIkaQLhIY5jaEGNvJxo5IWkaTX6YkrEinwZ52EEytlyWja7kQ1GxCr25NR2
         ZnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781388115; x=1781992915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pOyPLd+VCfIBQPcIBHqp74G9VvIByXO6xAOgWcyyZtk=;
        b=sLf91/mXX3zadMHOyE/RlcMzGewfyeQ5RUqSqJXOyli+LGV6rURkH0jGzhdmE1Exn0
         O2U4eup0hDSV5oYER14cLLP9M+SqYNUkvlzoAEjODlIHi1/DdtQiFazim6V4p9/mc23Y
         wXKzMTyKEItvwBICb3WIS61hNsdmhp82MWKuqE96omyiA6j1OLZO3Yfuusct6UB/E+Pu
         bPCQqlGId8OTwEOXfa/iAQbZ4K/N5HbiW3QqQW0w490a/WF2xxCjyew8/K+XBIgwQ6Ew
         bPCLO5A2p9s7P6S0zoRkc0ekp1PrrzQUkSLV/vWJnlByUUlY6MvYiEtW4K5OKZq154S1
         sroA==
X-Gm-Message-State: AOJu0YyJ99ukhspwOiKXrSGTomipZ3hPhLNd0vEEetF+QVLsLmqTRyFK
	RKFNCLCesF28CIq/Up9oNjd2HX2wI3UCzTVdwbyyRXEBDyoJ3rUlGSxa0v2YrVDwXqr4y4LQ4pp
	eul0aVJL/Xu4RlJVpPi5UvXAmR9ugnDGAF1HO3o21p82/eEzHi2mZvw3pEBk=
X-Gm-Gg: Acq92OGTqu7YNY2YNTif/10AN1uYqwwhfsWYZkjuJMzD4tIrSXMz8+gIFPsdhjZjJkM
	0UQpyisBAQkd5pa1FMM56mKF+Dr7Kr4Zzz1rUuvUntxtuq7AC9UqR5R4WAWRUZiaGgoiNrYEQnH
	ZmydoNkJZ0GQJXgBIKC3SQQDBQ4hizSxHP55aQsc5pEbmH5jqTb0ZX0EYKy7DwV+2wl/wC2OLVL
	+ZwbJXFFEZ8m0K7adNYFfxgAbWWFFUGgi4FzViIwNMo3yXnfs4aJN7Eo7Uoa+YXgQvnD5zdISRY
	9oWymw8l0tplpYpYmsggCKDcNkq1A4HRvI0nXPINK9XsVFYQagIB8PT0tKGWT2DGNGxxpGeSzW0
	+kikUAA3goQOy8hwJek7GgbUq77cyFJExxLpFPTasU24FaLVUWulq
X-Received: by 2002:a05:6402:3201:b0:691:55d9:fff5 with SMTP id
 4fb4d7f45d1cf-693787ed9d8mr3849204a12.10.1781388114606; Sat, 13 Jun 2026
 15:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260613010039.1362312-4-kuniyu@google.com> <20260613011253.0CA741F000E9@smtp.kernel.org>
In-Reply-To: <20260613011253.0CA741F000E9@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 13 Jun 2026 15:01:41 -0700
X-Gm-Features: AVVi8CdJkQbKL-C5Y5-uoOtUriwMeFA2JPv7tNM8BMVCLfY0s6pJBg3acXP3_6E
Message-ID: <CAAVpQUBSsAOj68rwwKLGpdu_5GHZZYdL=3n9-CuAksgzh+u93A@mail.gmail.com>
Subject: Re: [PATCH v2 bpf-next/net 3/5] bpf: Add bpf_skb_set_hwtstamp().
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 6:12=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Potential use-after-free read of `attrs->hwtstamp` if the BPF pr=
ogram passes a pointer to the packet payload.
> --
>
> commit 41caec1764c831fb81388c5eab46d122318a01be
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: Add bpf_skb_set_hwtstamp().
>
> This commit adds a new kfunc, bpf_skb_set_hwtstamp(), to allow BPF progra=
ms
> at TC ingress to update the hardware timestamp of an skb. This enables us=
er
> space proxies to encapsulate and pass hardware timestamps to socket
> applications bypassing the kernel networking stack.
>
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index acdc66aa4f27c..bee1e7eee5eae 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> [ ... ]
> > @@ -12372,6 +12372,30 @@ __bpf_kfunc int bpf_sock_ops_enable_tx_tstamp(=
struct bpf_sock_ops_kern *skops,
> >       return 0;
> >  }
> >
> > +__bpf_kfunc int bpf_skb_set_hwtstamp(struct __sk_buff *s,
> > +                                  struct bpf_hwtstamp *attrs, int attr=
s__sz)
> > +{
> > +     int defined_sz =3D offsetofend(struct bpf_hwtstamp, hwtstamp);
> > +     struct sk_buff *skb =3D (struct sk_buff *)s;
> > +
> > +     if (attrs__sz !=3D sizeof(*attrs) ||
> > +         memchr_inv((char *)attrs + defined_sz, 0, sizeof(u64)))
> > +             return -EINVAL;
> > +
> > +     if (!skb_at_tc_ingress(skb))
> > +             return -EINVAL;
> > +
> > +     if (skb_unclone(skb, GFP_ATOMIC))
> > +             return -ENOMEM;
> > +
> > +     skb_clear_tstamp(skb);
> > +     skb_hwtstamps(skb)->hwtstamp =3D attrs->hwtstamp;
>
> [Severity: High]
> Could this result in a use-after-free if the BPF program passes a pointer
> to the packet payload as the attrs argument?

This requires bpf_skb_store_bytes() to build attrs on skb,
which does not make sense.  Passing sane local variable
is bpf prog responsibility.


>
> The BPF verifier allows passing a packet pointer to a kfunc argument that
> has an associated size parameter (attrs__sz). If the attrs pointer points
> into the packet's payload (skb->data) and the skb happens to be cloned,
> skb_unclone() will invoke pskb_expand_head().
>
> This reallocation frees the original packet buffer, meaning the attrs
> pointer becomes dangling. The subsequent read of attrs->hwtstamp would th=
en
> dereference freed memory.
>
> Would it be safer to read the attrs->hwtstamp value into a local variable
> before calling skb_unclone()?
>
> > +
> > +     bpf_compute_data_pointers(skb);
> > +
> > +     return 0;
> > +}
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613010039.13=
62312-1-kuniyu@google.com?part=3D3
