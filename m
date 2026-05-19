Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9F14BCABE
	for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 12:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779193654; cv=pass; b=W+fy+H3fJy8qDnWeC875ry7HffASjjIHUPJaM7ZvMtvQyguJFhvrHZ5D5rQGSPYcVdBufsuf0yT5yXFUvIzO6oxdBFB50gHlU1kwjIfULlJZOtlr8pnj1h+CpaNcdhQ8VgJet5tvifNGVcH57fbpCV2It0C+Gcvi/awnpBrmIig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779193654; c=relaxed/simple;
	bh=y1j7Eq9lmZxwVs6xShWbSL5Xng4sr3FjXZzg1MsHkss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APPpSLAxxXE6V8UXd5773eQGtrmJcsEaU2vdDGJBZEyem/22CaFnUD5q4YH321GEw5JEGAUtrhqI8oopHi3YBwCcHaBLUjqSBrJBr4NQRvhwuORXeb9HYEiU3qRyOc7oqAokX7MZ4DgCwg2oz8nI72LTf4zY9CYJWVjQOrtyvN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9XDX9gM; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9XDX9gM"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a877510541so4200546e87.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 19 May 2026 05:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779193650; cv=none;
        d=google.com; s=arc-20240605;
        b=hXAZjiX6RcEmcUqinEpWO4ES1810YN4NcTzWsJVdJSoNUVl4azO8Hfz874/3bwfvvC
         IXZvlHAeWKZoA9+9IcbrePD1L0HlOXlflRyWPMyYCZMbKU9OV53imPU4kJkZNKJIWj82
         DgwAuq1kjXHheVQtu0eRBhf43q5kHcclsCpKkm0JFQ7bHm3v3uxJhr9gFEdBxUKOt3Rc
         zvOMO7Uj/HJtQGrVI6cUl/Cu0HPvlzHwJClwjVIPjn4w5JXJ3HYGFBxvHKs/rMQLaD2f
         l6zDA1WopdKSKN+Y4lv3FTeDSHCc+pkgHarPTQhIfD1Dv6Py/pEzj9N78s/IUKu8ILuA
         VZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LCs1qpXwTXyCOYCDlieFw6GpLdqpYpgZgXSKHKgLEss=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=VLBx/nJLT5oftQNe5NQ4ECMVxE9mTfqQpm4YiIr1NH9K8EShj2UgTkThIz3j/62uik
         qCR+kNKgzTwRBhawiSK3i2Nu/cAIOyVzYoKW9CYV53YMNyJ+7MjJxfY5/ib7+kTj4RhP
         2aP0ndM//cbHsCLLiWuLzvwPkXkHAwAL3/han+Ks/f4gWrR6IqUxH7vhdfoQ8oP1763k
         XbF2Mcx8fW7HhD35SymvpOkgmiO9hqYTgQHwfPhUHBuuz4CcTgujRMI/tDDYDXlTSk8W
         USdXYuUTODLb24FfC/8Jtc6uuIf9NciN2rKk6qb5kRtDGy+tHg402hL1b8psVj8b9jTL
         iOZw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779193650; x=1779798450; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCs1qpXwTXyCOYCDlieFw6GpLdqpYpgZgXSKHKgLEss=;
        b=K9XDX9gM5cwhxTBNPT2YsHGsVatug9eMrTh20dlZoyMP7IL4JefffMoEuMHvbyH693
         9cy36wNVFQXHkzf2/6/QpTQb0Fpx0mK3MFervEB4oLyaEFQIaIk0/W19s8z/M7ZXoBgq
         Lq8tlvEfLgfIWa4XO8gstyskaPAbsnvASg+2zmXRjGumnrl0gRDq/rWC6BiamPFPEYOP
         hp6tTyIZWTEuY2h6fUiSFVPQeplBg7DppyD2shB1OWgxjZIeyKL3+Ll+zf9iWRx75vqV
         NrjZDinjGhHYgjHv+80bX70X1Qhk+Jdrq/aWgSbaH2tWrVRbjcoiTez+yaHxY8rYq/60
         +Nag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779193650; x=1779798450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LCs1qpXwTXyCOYCDlieFw6GpLdqpYpgZgXSKHKgLEss=;
        b=NLzyvGc5GRkttssJV0A/H5PUhEf+RyqVGswKMiTNl/939xEnyvrLrkYUcNB6bHcDYW
         5D6e/mhGtCgRG1JPoCSjNUMECf3oDx1Olq1N03SJZ8hGimISx7YCoLdEugGmxzD/+mFk
         ePMBRhFo8OJ2CKEgfWKI2pJ+AVT0YthncGZr42MWM1W8et+g4HNdgJotwxz4yOrGfBxd
         DY6WU81xsrt/faWkKYrBuwsKxyneZnMS+Y7QtV6awIXB6LFP/OC9Z1GzQlUz+St2vWVq
         F5I/jw2L30rPd8KcHZ5B6Bz6kr4O8uzgd/W2ZKKooCROpZ+tQnaz3CEI1o4GdsfB/CNC
         mSvw==
X-Gm-Message-State: AOJu0YzGaIzi9RBtriI4nikEU6Es1uOskAMnHk5Kw0AJa+SeuD9UyS9r
	wt9xtbBKFd83ZANoy1oVR45yTZNar8AwG55Hon3UWJOMP2nsANLYMNyZoxZZME/b1LE93yb2+Ky
	ODN8ceMPYgPvhQM3ctctGLLhPwOvczaTjV/VY4xqFBw==
X-Gm-Gg: Acq92OHZK51UoW/KFNrpyrl227iE6xU3691TbB8C/5zhWJAoxHaXtrPw98JDEGnUyo9
	wHiSagP6osA4GQU+GL4o/3iR8wNqi32EGl+kqmxF2ULEtVMvmoQj40ZdaD5OQzaTREVJ85YQOgD
	iLx5sXSDZh+FpsARD7tTdKciP/dJA/gf+lv7rRi/UZafEYFo31HY4ytLq4mnWBeJmU6R+8AlqXB
	bW5lqeRo3a/mDgirBhItJ2f1QXzJmipSC4ki1u5jRcwIXBvvFqmQArhLX6TyCEf4RDq8osydpFC
	v7tnyBdB3/PCuhuXfM1Ti+AyyAf/ioccIXQ2enFH
X-Received: by 2002:a05:6512:1285:b0:5a4:d44:99f0 with SMTP id
 2adb3069b0e04-5aa0e733f63mr7062600e87.6.1779193649825; Tue, 19 May 2026
 05:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518082344.96647-6-kerneljasonxing@gmail.com> <20260519082514.AD96BC2BCC6@smtp.kernel.org>
In-Reply-To: <20260519082514.AD96BC2BCC6@smtp.kernel.org>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 19 May 2026 20:26:52 +0800
X-Gm-Features: AVHnY4LztSDKvv4FGhna3JZkUb_Rg2ODnWdgpjv0ylTPj4N756C-Z86N40V1q78
Message-ID: <CAL+tcoCBQzn5k8PQ53s0kMuBkry2FYvekvJfiNjwM_SoN2rF7A@mail.gmail.com>
Subject: Re: [PATCH net-next 5/6] bpf: enable bpf timestamping rx in TCP layer
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 4:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] BPF sock_ops hook is called without holding the socket lock, vio=
lating core locking rules and risking data corruption.
> - [Medium] Missing BPF RX timestamping for zero-copy receive (tcp_zerocop=
y_receive).
> - [Medium] MSG_PEEK causes event duplication, corrupting BPF statistics.
> - [Medium] Data race due to lockless read of sk->sk_bpf_cb_flags.
> --
>
> commit bdfc9a5e79a8f2a8060029cde75cfb38b923754a
> Author: Jason Xing <kerneljasonxing@gmail.com>
>
> bpf: enable bpf timestamping rx in TCP layer
>
> This commit introduces BPF RX timestamping for TCP by adding a BPF hook
> to tcp_recvmsg(). It evaluates timestamping flags and conditionally
> calls bpf_skops_rx_timestamping().
>
> > diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> > index 21ece4c716121..64c69bb3578af 100644
> > --- a/net/ipv4/tcp.c
> > +++ b/net/ipv4/tcp.c
> > @@ -2949,8 +2949,18 @@ int tcp_recvmsg(struct sock *sk, struct msghdr *=
msg, size_t len, int flags)
> >       release_sock(sk);
> >
> >       if ((cmsg_flags | msg->msg_get_inq) && ret >=3D 0) {
> > -             if (cmsg_flags & TCP_CMSG_TS)
> > -                     tcp_recv_timestamp(msg, sk, &tss);
> > +             if (cmsg_flags & TCP_CMSG_TS) {
> > +                     u32 tsflags =3D READ_ONCE(sk->sk_tsflags);
> > +
> > +                     if (cgroup_bpf_enabled(CGROUP_SOCK_OPS) &&
> > +                         SK_BPF_CB_FLAG_TEST(sk, SK_BPF_CB_RX_TIMESTAM=
PING))
>
> Since the socket lock was released above, is it safe to read
> sk->sk_bpf_cb_flags here without READ_ONCE()? It appears
> bpf_sock_ops_cb_flags_set() could modify this concurrently, potentially
> causing a data race.

Good catch. I'll add the pair then.

>
> > +                             bpf_skops_rx_timestamping(sk, &tss,
> > +                                                       BPF_SOCK_OPS_TS=
TAMP_RCV_CB);
>
> Does executing the BPF_PROG_TYPE_SOCK_OPS program here without holding th=
e
> socket lock risk data races? Since the program receives a full socket
> context and can call helpers like bpf_setsockopt(), this might trigger
> assertions in sock_owned_by_me(sk) or corrupt socket state.

IIUC, we have such protections which are reflected in
bpf_test_access_bpf_calls().

>
> If MSG_PEEK is passed in the flags, will this cause the BPF program to be
> invoked multiple times for the same skb? The callback doesn't seem to
> receive arguments indicating a peek, which might artificially inflate pac=
ket
> counts and skew latency metrics.

This is the pre-existing behavior. Yes, it can happen, but I don't
regard it as a problem.

>
> > +                     if (sock_flag(sk, SOCK_RCVTSTAMP) ||
> > +                         tsflags & SOF_TIMESTAMPING_SOFTWARE ||
> > +                         tsflags & SOF_TIMESTAMPING_RAW_HARDWARE)
> > +                             tcp_recv_timestamp(msg, sk, &tss);
>
> Will packets processed via the zero-copy receive path miss these RX
> timestamp events? High-performance applications using tcp_zerocopy_receiv=
e()
> go through tcp_zc_finalize_rx_tstamp(), which directly calls
> tcp_recv_timestamp() but seems to omit this new BPF callback.

Agreed. I'll support zc mode as Stan pointed out earlier.

Thanks,
Jason

>
> > +             }
> >               if ((cmsg_flags & TCP_CMSG_INQ) | msg->msg_get_inq) {
> >                       msg->msg_inq =3D tcp_inq_hint(sk);
> >                       if (cmsg_flags & TCP_CMSG_INQ)
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518082344.96=
647-1-kerneljasonxing@gmail.com?part=3D5
