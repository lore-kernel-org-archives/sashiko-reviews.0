Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67B3A2540
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 22:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376657; cv=none; b=eKdBRjX/XFRSfMdI3S5+PBXfW3qgEA4sNEppCt8Bj+kLkgCgagK5/l+34ihHczwXedWcgITmTikR/FlI+GIof6igNCTd3uwBB5DdNL9feXSljOnaqg7YQGruha2nf5KfM5i8Rvcg2oa1eydeCDDnNOC0CoThiOTt8HLsnLZ9jro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376657; c=relaxed/simple;
	bh=cBzrQn4nFe3HI2uqgmIPywDhDoS2/GQhQAflPWf07o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JeNJCavmWGK63svSmKyPd6cggxKJs0hKo2DxRomkem1+nS42JVAq+nvGV3LP0QtdrIDfuiTdZA1Qz3W+9S1qB5a5LpC81GAV+mWFJhULI+kVv4SFK/BNqxh/is18ksZOpXO2Xj4fk263QLxriJuU4qg35McR6xcXZGOuQn/IQ5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrife.io; spf=none smtp.mailfrom=jrife.io; dkim=pass (2048-bit key) header.d=jrife-io.20251104.gappssmtp.com header.i=@jrife-io.20251104.gappssmtp.com header.b=HiEU3g4p; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrife.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=jrife.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrife-io.20251104.gappssmtp.com header.i=@jrife-io.20251104.gappssmtp.com header.b="HiEU3g4p"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-380a02c71e2so1376212a91.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 15:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20251104.gappssmtp.com; s=20251104; t=1783376652; x=1783981452; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kT7T0HNBRxDmMz12cl1CtlcHuObMCiKxMK/p9Ya4GgM=;
        b=HiEU3g4pC6OCGfu/TZYd7wERb25zhVNaWXgMB0JenbbUPaEpZHHS8KlV7BPCm4EDTm
         S6FXTg+0jswLeCGuviH8dfUDtVYrBo9QsmDGGzw7JsRO6gLBlGyMn0kkd0YBPguEt720
         eDk42gWkTkiZT39kfoP+BarG4AzPU3Bw4hbxWemOE6pVzyUeaJseS548cAJXLtvVzS7b
         Bl1Tr/J9daxSlhA7pomj3acL6hB9dUFQ/KnfYzWEWrRdUkhwLo862u5JlzON+tffzGK2
         /HI4j6F9oOvzFwUEHb26O0Qp7+q683ewPokmAGGjiOrN0aMdyZoZHs1S7012LFnEEeMX
         dYow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783376652; x=1783981452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kT7T0HNBRxDmMz12cl1CtlcHuObMCiKxMK/p9Ya4GgM=;
        b=NiuXkV3S4+pHFS1QPDRpbjcvan9xQGCt4pqC+AchhsObf7zRdEImfNsh+sDDoCQF1+
         z5rR2bEF2yjq055nWA+Rqs6bcc6aM3K0AKhP847lA/aXlEMzxhAhMykE78admG6fkyfn
         ROlBQ+pNvsFSALc4YnPpKqpAVTNyUYDajVamZgQC4K2sRCLIJsrrQwvHIOS23QMNx3Qw
         iLYZm1cWhWxYfRUu+j4nqd7crY6XxSWnaiXbaaCaTwQNpnLRpahyED+Y66h1P4OsnYp/
         IP3WVbBe52De/oQrAJUp7JzVzGDkh5eVjFgOJ3UJcWohrXCwxx40GbhuQ82GpqskHScr
         Oi3g==
X-Forwarded-Encrypted: i=1; AHgh+RoOTer4f5lWnQv/tmtn7/tO2JbWZsOUuetuKv5Rs0g6+1zJ3Mr7LViHkK2tbyvg5ePLJnvHrgj1x90ciFuqpUo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwawNM1feVP56HyqZW7K82Ljyg5HDLYUqqpVq7j82c3+ESh6oyq
	egTB1/ZHe67X0Di93TkOA/H9+ClN3mOEaQRSkFxz5fxqt9zKTxmz1nYGyd0+NLRLtmo=
X-Gm-Gg: AfdE7clKxmhjbrpL1Nz/fuazOcze4I6yGDZkseECSiML6ECOzcXJM4TUm/JQuUS4rDg
	NwhL3V3LMTu4TmBKkzVmqpXREpLFRLm0e6eBM0gcvLtrrNMKm2BrJunwh7rYv0mds8kNXlHrjVK
	kZRtR3ixUyz2IPbErkUl8fW/d3jq2b5azTvjTmSqGvdufdMgQbcBi769j7mBw7/PScqGqt/rbub
	OhP6SE2dyvBn/8lKZ4p4s6HtHtEGaEzd11hcFw8sqMUzh8tBUzawcyGyXuOrmlCZi/j9ULcvcN1
	tio1N6cdFtT9NYF0DqX9KysX9/+E/12f5KetummdQ6yMlWtDEbd7qUoK7CG1ptI5OvHf44BhYD1
	psIFeKLJoYrG6X2yMfAAYqFyYJzavN689uqXRQxsun5aUp8PM8L3iHUShIuR3MPK9p7bLGPSswQ
	==
X-Received: by 2002:a17:90b:3888:b0:37e:2053:3489 with SMTP id 98e67ed59e1d1-387e2f3f6c9mr18141a91.3.1783376652369;
        Mon, 06 Jul 2026 15:24:12 -0700 (PDT)
Received: from t14 ([2001:5a8:47ec:d700:d75e:d3a7:98ad:d3a2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm916548eec.2.2026.07.06.15.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 15:24:12 -0700 (PDT)
Date: Mon, 6 Jul 2026 15:24:09 -0700
From: Jordan Rife <jordan@jrife.io>
To: Amery Hung <ameryhung@gmail.com>
Cc: Jiayuan Chen <jiayuan.chen@linux.dev>, sashiko-reviews@lists.linux.dev, 
	bpf@vger.kernel.org
Subject: Re: [PATCH bpf] bpf: reject mini-sockets in bpf_sock_destroy()
Message-ID: <cbg32g2k5xvg6xnf3pkqn6gd6mgvb7pbgibiyrrgtlue3o35ys@bdgwlx7mz5q5>
References: <20260702224519.800135-1-xmei5@asu.edu>
 <20260702230504.0E65E1F000E9@smtp.kernel.org>
 <e6ec128e-1acf-4dc7-8884-e4d7ed14d25b@linux.dev>
 <po6jpmx5q72uvblx23atsbwvxhoszpmrlkjd6txljljufnjeqj@v3yov32574sm>
 <CAMB2axN8r-B1gc4f-BSh5d=VFttxGLu+ubB_53nzpAqvYd0HVA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMB2axN8r-B1gc4f-BSh5d=VFttxGLu+ubB_53nzpAqvYd0HVA@mail.gmail.com>

On Mon, Jul 06, 2026 at 11:11:59AM -0700, Amery Hung wrote:
> On Sun, Jul 5, 2026 at 10:45 PM Jordan Rife <jordan@jrife.io> wrote:
> >
> > On Fri, Jul 03, 2026 at 10:15:27AM +0800, Jiayuan Chen wrote:
> > >
> > > On 7/3/26 7:05 AM, sashiko-bot@kernel.org wrote:
> > > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > >
> > > > New issues:
> > > > - [High] The patch causes a functional regression by completely disabling bpf_sock_destroy() for TCP mini-sockets (TIME_WAIT and NEW_SYN_RECV).
> > > >
> > > > Pre-existing issues:
> > > > - [High] The helpers bpf_tcp_check_syncookie and bpf_tcp_gen_syncookie suffer from the same type confusion and out-of-bounds read as bpf_sock_destroy, but remain unfixed.
> > > > --
> > > >
> > > > commit cf46da8728e7f1fca4584ccdb089c82b7fd3061f
> > > > Author: Xiang Mei (Microsoft) <xmei5@asu.edu>
> > > >
> > > > bpf: reject mini-sockets in bpf_sock_destroy()
> > > >
> > > > The patch tries to fix a KASAN slab-out-of-bounds read in
> > > > bpf_sock_destroy() by checking sk_fullsock(sk) before accessing
> > > > sk->sk_protocol. It casts sock_common to sock and early exits if it is
> > > > a mini-socket.
> > > >
> > > > Fixes: 4ddbcb886268 ("bpf: Add bpf_sock_destroy kfunc")
> > > > Reported-by: AutonomousCodeSecurity@microsoft.com
> > > > Signed-off-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
> > > >
> > > > > diff --git a/net/core/filter.c b/net/core/filter.c
> > > > > index b446aa8be5c37..3e70c8ab5aab1 100644
> > > > > --- a/net/core/filter.c
> > > > > +++ b/net/core/filter.c
> > > > > @@ -12665,6 +12665,9 @@ __bpf_kfunc int bpf_sock_destroy(struct sock_common *sock)
> > > > >   {
> > > > >           struct sock *sk = (struct sock *)sock;
> > > > > + if (!sk_fullsock(sk))
> > > > > +         return -EOPNOTSUPP;
> > > >          ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > [Severity: High]
> > > > Does this unconditionally reject mini-sockets?
> > > >
> > > > The commit message states that mini-sockets have no diag_destroy() handler,
> > > > but as documented in the original commit 4ddbcb886268, request sockets are
> > > > explicitly supported because their protocol diag_destroy handler
> > > > (tcp_abort) correctly handles TCP_TIME_WAIT and TCP_NEW_SYN_RECV states.
> > > >
> > > > If we unconditionally reject non-full sockets, wouldn't this break BPF
> > > > programs that rely on bpf_sock_destroy() to forcefully terminate pending
> > > > connections or TIME_WAIT sockets?
> > >
> > > It's true. Please also include a selftest to reproduce the issue and,
> > > another one to cover the non-full socket.
> >
> > +1 to the selftests.
> >
> > I'd just extend tools/testing/selftests/bpf/prog_tests/sock_destroy.c
> >
> > Considering the original intent was to support request sockets and time
> > wait sockets and tcp_abort already supports both, perhaps something like
> > this would be better.
> >
> > __bpf_kfunc int bpf_sock_destroy(struct sock_common *sock)
> >  {
> > +       int (*diag_destroy)(struct sock *sk, int err);
> >         struct sock *sk = (struct sock *)sock;
> >
> >         /* The locking semantics that allow for synchronous execution of the
> > @@ -12672,11 +12674,16 @@ __bpf_kfunc int bpf_sock_destroy(struct sock_common *sock)
> >          * Supporting protocols will need to acquire sock lock in the BPF context
> >          * prior to invoking this kfunc.
> >          */
> > -       if (!sk->sk_prot->diag_destroy || (sk->sk_protocol != IPPROTO_TCP &&
> > -                                          sk->sk_protocol != IPPROTO_UDP))
> > +       if (!sk_fullsock(sk))
> > +               diag_destroy = tcp_abort;
> > +       else if(sk->sk_prot->diag_destroy &&
> > +               (sk->sk_protocol == IPPROTO_TCP ||
> > +                sk->sk_protocol == IPPROTO_UDP))
> > +               diag_destroy = sk->sk_prot->diag_destroy;
> > +       else
> >                 return -EOPNOTSUPP;
> >
> > -       return sk->sk_prot->diag_destroy(sk, ECONNABORTED);
> > +       return diag_destroy(sk, ECONNABORTED);
> >  }
> >
> > (Note: I haven't tested this)
> >
> 
> Looks correct to me but I think it would be cleaner if we just guard
> sk->sk_protocol with sk_fullsock().
> 
> -       if (!sk->sk_prot->diag_destroy || (sk->sk_protocol != IPPROTO_TCP &&
> -                                          sk->sk_protocol != IPPROTO_UDP))
> +       if (!sk->sk_prot->diag_destroy)
> +               return -EOPNOTSUPP;
> +
> +       if (sk_fullsock(sk) && sk->sk_protocol != IPPROTO_TCP &&
> +           sk->sk_protocol != IPPROTO_UDP)
>                 return -EOPNOTSUPP;
> 

Yep, this is better. For some reason I thought sk->sk_prot->diag_destroy
wasn't set for request sockets.

> > >
> > > >
> > > > [Severity: High]
> > > > This is a pre-existing issue, but does this same type confusion exist
> > > > in bpf_tcp_check_syncookie() and bpf_tcp_gen_syncookie()?
> > > >
> > > > Both of those helpers take ARG_PTR_TO_BTF_ID_SOCK_COMMON and cast it to
> > > > a full struct sock *. They then immediately dereference sk->sk_protocol
> > > > without an sk_fullsock() check:
> > > >
> > > > net/core/filter.c:bpf_tcp_check_syncookie() {
> > > >      ...
> > > >     if (sk->sk_protocol != IPPROTO_TCP || sk->sk_state != TCP_LISTEN)
> > > >             return -EINVAL;
> > > >      ...
> > > > }
> > > >
> > > > If an XDP or TC BPF program passes a tw_sock or req_sock from
> > > > bpf_skc_lookup_tcp(), won't this result in the same KASAN
> > > > slab-out-of-bounds read since sk_protocol resides outside the bounds
> > > > of struct sock_common?
> > > >
> > > > > +
> > > > >           /* The locking semantics that allow for synchronous execution of the
> > > > >            * destroy handlers are only supported for TCP and UDP.
> > > > >            * Supporting protocols will need to acquire sock lock in the BPF context
> >
> > Jordan
> >
