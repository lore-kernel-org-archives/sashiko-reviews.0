Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A62C3E49F2
	for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 21:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789938566; cv=pass; b=Etxe0CmvCXpLcDA50nSLirUR2iKEz52gYuS/Q9LAg5OD8prXzbElGxMh8R8WUIozF5YkiRjGgVl45r5wd2+dHvr7Aed/PD63N73KVWsMwnaQ1pnpSTvV+vCyDLNhkI4iLh2XyPpZg4L2w1D8IXMfgZ/9xVPMCnVC35BaJXUrVFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789938566; c=relaxed/simple;
	bh=kt+rv5k3eLDWYabDgymlVriZ9r09FN0YWounlJrDsaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IgjyPHIXMjHMDGO3MIOiZXD0r32s9NOzK0jMzHlQubmkD0GDzrxQsZKzGSVwS9kCV+d/SVdbRIpRmUFoPVta4HdVyNRJDraeeE7OxlroEGp1alnJpKQaGG3pAKuILIUJdFnEmOAOB5RLHzsK8C+CvORUqn9fce7AvWLyBj+N/CA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l9I+fTpJ; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l9I+fTpJ"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a985e8fcddso2787241a12.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 20 Sep 2026 14:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789938563; cv=none;
        d=google.com; s=arc-20260327;
        b=qTf/fs1O3+C98wbmgcTcw/h2PbhBQbnwXkG//R7eTxtIA/ToKZnNBOFXzNkcj14IsO
         gZ2Fldp+MhmOCcRFNI+gltxfyKRSbJgGFRtLDjuZYgPwKIlHh7HQ19LmrCXEdM9nmhUm
         5ybA0kCO7lwDurpAn6FvDCd7v79zQtK30ViUJkDQk+llOC4apbSXdWTI3xFw7h5XV4s0
         LjLKjwP2u/lZhMt37ONTLNkV3vGPtZAVd2+sLDZbfdGldZkx7fo0vUamn8OXEfB3LyUA
         kiC5P9zYDFLo8zMdkVhFNeW4LN2iKpbX3TAztESLbUbzLDasmSMRgXxuNxXkuisQX37g
         nR7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aG9IMXzuXxs35bjhn377gOMi4c4fmeb2RQf/8lDCjFs=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=WLpVg3Fn06J680faZTJkfDXwX0MLNO/WlaK0HR96ewXbp3LLewE3ih0Rvq6R1FDdKE
         AIEXmtcAtLudA5+ty/CBg2+JePmYZFTb4O4KuoP5oUMzOZ7oKLw30xQQZt6WOVqz+Nd6
         ocrRwixZHBhKVx3xaDdqnR8kCfrY9/ua4FaMe2P68Flwx77JnhQNu+XDrJxWVn/fpWiC
         pf9LG/ZKl5kmm/c2BfJLqXbiA/5t+qWqhRRXmgrLsTh/7YLTe6guM5XYdW0ewsTFZt3n
         n+v5+uOpyEc2PeYJf85zYopOaCH0Y//hVFjunTejdmsuMrLiECE+fvYNnyx4+g+QGXRL
         8lhw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789938563; x=1790543363; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aG9IMXzuXxs35bjhn377gOMi4c4fmeb2RQf/8lDCjFs=;
        b=l9I+fTpJx2z6BQS+vKlBexHR0PKwKQtk4bkGrtOZkMjHSxbubz8uQx5Ob3WCYzz532
         rpS5OLVEmgzwBfPPnWhgo3xJjkQdyZbuHed9oy9TnnCEGrGtrTqKU+bElAbdD88niuln
         86dkKEBOEKyKzPRO2DWtQFLfaHEAo00h5LXxMKERvflR1jYa3mF88C1wYNj7L7STRszE
         Uv1XB7mU0VyLo0WQh11dXzi3YELbR2UwW3cjX31AZtirEFnS322qe+3gvDVM9etLRzH9
         Vt/WVCZS9xWR6bEom2QwRLeaLvZ6X8y+MJcfQeWfRUaIUdL+b/+Fq8Zd0xSYLaPSqMLE
         U4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789938563; x=1790543363;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aG9IMXzuXxs35bjhn377gOMi4c4fmeb2RQf/8lDCjFs=;
        b=kpIphcVTS9L0bFx+thfsTTT2pqZuU4MT+Upxm9+Ghh4ig4UitJlt80YAcBxGxplh/a
         ANxLQlXft+9avuhOJWJOU3bR85IOCaNG8GXjBDyNJ6Q1sI9DLik2rLWJhXrMR8O4lEKH
         bOALpUl2UlzZrwoOOSiu3rHbXmBx7agHWOh9+OLMRKeV4w4GaVx/ygfJjUnliztJVPnf
         XrhKIDCkOqwv5G7onM3Ae5W58Sg9Odx2k0iYHQ0thMWKUPx6EFj4NJRt9xMyBABAW27d
         b3Zn5E4Bw/0ir5TOQJiMV2TNx8sF3V/X6D8dqKm7Vqp9moZnzQG5k0e0hgvPKSGtABYV
         J70w==
X-Gm-Message-State: AFuF++mGAREFUSer8eFVX73vumCtFwhQQGmbBsfAomEb6EHedVGVrD0M
	rSpK2GFxlVA5i0ytr+roo6ddZyrHgju7wY8gT+l1k3dYh7CeN71iqzuqJxxqnTgunUA/uCu2ILB
	lTJ8lDCDv0c3A42hU+CS8DG/a2txNveOOCd8Y30LjkQ7/bWEz7qTUXzE68oc=
X-Gm-Gg: AYBFou1LSXD3w4dhFiP85fl57GihOsMvM+heVOk1AGIvHiCMMkTgnG16pUOb9ii+RCb
	2h+jCOS1aog0DwOHWG3uinXiyxW6xH03ApPZiAx0VYBAtBCS/orJZgmA+n+rtKe/NloUktOvcrY
	hDBL850xcfoytmuJz1t6hP1jvzbypxda+HTk35MxKMR7rqG7MkqWYIwEnDzn/DlULw+Qtajs8xP
	yGiERg9mMEjPbWSZ6EX+r6nN+M4plfJ39PAuzwQd3C7FgttuMqLA3PoFrFocd11osfr29Yu2fu8
	9uKNXnq6hYu3q6HEgGTjZKTqesr1QbE/Vct1f+1MDy29ejckBi6T1Zo6sZszn6pNWNhVZZGNqw9
	4RIMe/er9GcCyOvWaWw+SVsewueTNahgJegHK0zpye3oO1wH4ta9IWmwnGtLLfePur28=
X-Received: by 2002:a05:6402:52d7:b0:6a9:8dad:f351 with SMTP id
 4fb4d7f45d1cf-6aa564cf5a3mr5500843a12.39.1789938562315; Sun, 20 Sep 2026
 14:09:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260920195633.3033620-1-kuniyu@google.com> <20260920195633.3033620-6-kuniyu@google.com>
 <20260920200548.E18441F000FF@smtp.kernel.org>
In-Reply-To: <20260920200548.E18441F000FF@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sun, 20 Sep 2026 14:09:06 -0700
X-Gm-Features: AcwNN1W8dHp7vjuLuHw_rdApVjuYf5gpqSkoLbV1SL_ByL7U_KaMKWGKzwIk-RY
Message-ID: <CAAVpQUCyt8XuxET6eYhOKbkHitkb15yYUaRQHdXAx_EBZMr3QQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 5/7] bpf: mptcp: Don't support BPF_SOCK_OPS_RCVQ_CB_FLAG.
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 1:05=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] bpf: tcp_set_sock_ops_cb_flags breaks ALL_CB_FLAGS for MPTCP
> --
>
> commit 578335638acc4a540df534d791edf9c63d563e32
> Author: Kuniyuki Iwashima <kuniyu@google.com>
> Subject: bpf: mptcp: Don't support BPF_SOCK_OPS_RCVQ_CB_FLAG.
>
> This patch prepares for a new kfunc by disabling BPF_SOCK_OPS_RCVQ_CB_FLA=
G
> for MPTCP subflows. It returns -EOPNOTSUPP if this flag is used on an MPT=
CP
> socket.
>
> > diff --git a/include/net/tcp.h b/include/net/tcp.h
> > index 07426e8641b7e..d3cf655da9ecd 100644
> > --- a/include/net/tcp.h
> > +++ b/include/net/tcp.h
> > @@ -2932,6 +2932,16 @@ static inline int tcp_call_bpf_3arg(struct sock =
*sk, int op, u32 arg1, u32 arg2,
> >       return tcp_call_bpf(sk, op, 3, args);
> >  }
> >
> > +static inline int tcp_set_sock_ops_cb_flags(struct sock *sk, int val)
> > +{
> > +     if (sk_is_mptcp(sk) &&
> > +         (val & BPF_SOCK_OPS_RCVQ_CB_FLAG))
> > +             return -EOPNOTSUPP;
> > +
>
> [Severity: Medium]
> Will this check unintentionally break existing BPF programs that use
> BPF_SOCK_OPS_ALL_CB_FLAGS to enable all callbacks?

This is rather a userspace problem.

BPF_SOCK_OPS_ALL_CB_FLAGS should not be used in such a way.
The flag is to be used to opt-in hooks.



>
> If a program passes BPF_SOCK_OPS_ALL_CB_FLAGS (which is expanded in this
> patch series to include the new BPF_SOCK_OPS_RCVQ_CB_FLAG bit), this rigi=
d
> check evaluates to true for MPTCP subflows and rejects the entire multi-f=
lag
> request instead of ignoring the unsupported bit.
>
> > +     tcp_sk(sk)->bpf_sock_ops_cb_flags =3D val;
> > +     return 0;
> > +}
> > +
>
> [ ... ]
>
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index 5feb998846825..f29c061bb0664 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
>
> [ ... ]
>
> > @@ -6178,8 +6177,9 @@ static const struct bpf_func_proto bpf_sock_ops_g=
etsockopt_proto =3D {
> >  BPF_CALL_2(bpf_sock_ops_cb_flags_set, struct bpf_sock_ops_kern *, bpf_=
sock,
> >          int, argval)
> >  {
> > -     struct sock *sk =3D bpf_sock->sk;
> >       int val =3D argval & BPF_SOCK_OPS_ALL_CB_FLAGS;
> > +     struct sock *sk =3D bpf_sock->sk;
> > +     int err;
> >
> >       if (!is_locked_tcp_sock_ops(bpf_sock))
> >               return -EOPNOTSUPP;
> > @@ -6187,7 +6187,9 @@ BPF_CALL_2(bpf_sock_ops_cb_flags_set, struct bpf_=
sock_ops_kern *, bpf_sock,
> >       if (!IS_ENABLED(CONFIG_INET) || !sk_fullsock(sk))
> >               return -EINVAL;
> >
> > -     tcp_sk(sk)->bpf_sock_ops_cb_flags =3D val;
> > +     err =3D tcp_set_sock_ops_cb_flags(sk, val);
> > +     if (err)
> > +             return err;
>
> [Severity: Medium]
> Does returning early here prevent any of the other valid callbacks reques=
ted
> in val from being enabled?

Same, this is intentional.

>
> Because tcp_set_sock_ops_cb_flags() returns -EOPNOTSUPP when the new flag=
 is
> present, the BPF helper propagates the error without applying any of the
> previously supported flags. This effectively turns a wildcard request for
> "all supported flags" into a total failure on MPTCP subflows.
>
> >
> >       return argval & (~BPF_SOCK_OPS_ALL_CB_FLAGS);
> >  }
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920195633.30=
33620-1-kuniyu@google.com?part=3D5
