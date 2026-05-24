Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25B8242D97
	for <sashiko-reviews@lists.linux.dev>; Sun, 24 May 2026 03:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779594480; cv=pass; b=pzCtGPVy7CHiGwkRtZixwcqn05jNiHZiBd0y4cCs6h8rOdS9+NC5Dzzzdlel56jFppYIchPoTgRRp0tKpo02mFJ2XDOfVxheRfqGOaiFqoE10nF0COw8rKDBIfoc4qsENmKPbGR7ogFTmTPzh+H5ShCsVv8Xis0/j+W5Iu6xA1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779594480; c=relaxed/simple;
	bh=5OE7VDk7Xk8tK0kdONIg6DMt2T69ox9oBKpsyuCN5qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dTiGBWsLDjHRdIijCAoJZ1NpTYcipN3opmJ8KBs7XR0fKv3/gAYmSii57zhgPZGFCjC8yvP+8Fhc5rvzr/apFKorc6p51aGTYpL93jUCK0aOaRsx82yuKA+iowdtKOtb/L8euQqnDyHXqSfzeDYIOpAy5I/9B0cIfavfI80RsYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iZYhdFIG; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iZYhdFIG"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-136a89595c3so612497c88.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 23 May 2026 20:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779594478; cv=none;
        d=google.com; s=arc-20240605;
        b=W/u8xs9yR7xThrrbkbkEmOZfqLwdDTH3qO8govhIARqULkKjY//azcBAxPhLI0ofOP
         Jrsk4B8zis/re2VnYsrr1GFsKFHAJZFz2C6L69GGXcDSosImm/q2HTQ4hUadhNSpPen2
         kCPQZqck+RpO2bFEMEwKFGBjOp/2TnwIQ5kXPWLFG4fXg5yLoO+0htwnPtSfIte3yeCD
         YgIgZUNH+IMdhujax7FKRbHxOCdi1paFUFfLg57xCvCeqKlOrrF83qVmf6EaGfislCtK
         InqObUwxMi2pt2ArbIvphoTFeoVXFevueV4QZZnHKZDe+FpGDkaiY3bLb5CkrsHICZmK
         aF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nIK0xfX2Hyamn7E86WRboAaD6BU+mm8VtXXVXqn33C0=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=F3IESBfzpN6WM6IalSAEHKQIVbp4h2Tl1OiYTkr2hy7Sjltv2vY6kP8imadgsPjRJf
         tBdaqwWFk8VjiZjH+NflBj+08kPoWwctbpuIzcUBXmLkUDNCW6GJb7+lsPV4r6G3sTCF
         HAV4h1M1CQ52KMLW9Vsggh016DU+PyEbOUm1W0RIiq5AuPEAN5txQw3ftsgMiRv7mUtF
         GvMkrgEKHtWFjny8kqdPMNAPlZW1cDYDDj/PllE84rdVe/AlZDBcYcrBGIN6Y4M1ClsM
         rpni2N+hKdlhcU3XupsAjZDO3t2iQHGB++ChCPfAPt9fCvQ6utFY7iVTfUGAWLNQrnrI
         6Qlw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779594478; x=1780199278; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIK0xfX2Hyamn7E86WRboAaD6BU+mm8VtXXVXqn33C0=;
        b=iZYhdFIG/8o/x+FRfGFbbCMi8whvk15G53XoyK0+7MxjaMinQjKyGV1dZ3xcwkYxqD
         GXjgwk8xGd0gwtfFU/BCnCnbOgA1HmsBOzGA6kX7dZ4QYxB6sAqZ5vBMryDJa3A+M92T
         uJCxx65H4F20r1j9tpUjCGEljaWpHWiEZqULkmH0nCQUfyFSlD8j+mJSbu0W1nB4skV7
         OJrAMLj7uA4V1KuD/nSd1gaU/tzCi3cGZOHB/HUF9gr0WNwJi0tSz+W/pY1K6ndTx2Xk
         SOJi9ngUBx/UHmb9/XaMiMFzMFZo20KPATy7PzygNKX3yIGhSzCuqUv4bvP2PHvaijfc
         5UPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779594478; x=1780199278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nIK0xfX2Hyamn7E86WRboAaD6BU+mm8VtXXVXqn33C0=;
        b=bTJq22piOrvsgzg3WXht7MZKkPdigqRcuatgOV4O8UrXESTLxGl+IVG++awRyYsov7
         xcDxZN7AWtjFb/ESBDhAJrUIi6/NuwHK3UZnCDu1YPqSFWSMbgLzKAzn9rEaeW9ZpOon
         MIWxNspL5DE79PEzOSsJgD603SbnmlhJ453NicJnxyOv4Uo/2y94l/Vz2HYriRh9Yx7F
         XYpCPZEtBwQ1YC3obSC3ZN4ZQovVbYmlg2/g02PPKKP3R5BVFvcuErTBm5UrMWY7LvgY
         KgjzIeTXho7fcyo14LqJxVb3eR4cjOUfzID2CtoiWwLk9MoKqOdWROp+Li7D0hSIJnne
         si0Q==
X-Gm-Message-State: AOJu0Yy97ZzdS86mjJweHya7j/PBjTvcHQxGL6w04fYtj2vEU4m0rxD1
	RfIzK0Zf3R3V24mCmxSM0GNJPIxxYRnozawmmF9RbaM6Wt17m9CEmzqNVjoYhw/JzEjR78Z0hkK
	+2lE/G7HKgU+HSX1MgbPb/7C+Y1skm1E5/yRTE8IOEDSqOnPK0EBk6ul2
X-Gm-Gg: Acq92OFxGZJrLG9KeEWcbeTxZeggbBqk0veUb7E1NdVUXmJ0b9QD9yReqX8PZ46Eywv
	wfOWeYfVSNjalrtSztQ1CJg0/oDMcj2KUM9Pc+QeYjfThFU0DO6FCj4rOh/G15T58gC2VQzn27s
	9G8YACdbUTWqi+bXe3L/664G2zISuvz0khrNlLOh+kdG8rkEZgzxqrDwDcOnohylVHz2qn8ET/G
	N55HC9WD/6CurOC3UrIzzTG1uaWSYf9lC1A9i7nZHokXJR0NJcUMpy55YcKhOlKS/+q4aQNNLQb
	B5t4CBl5cQEsGOR4usqTTe4aaqwIasiJdHxOWecneVriMR31rbFAzDVYEDGg2nEVZ/9zCX5IYRr
	jG3cPHAdmuJ9DZqSKOhrEYp8sjbNU95UkEvoBrFF3kD4hRqOodssfK2U7SBWKIrA=
X-Received: by 2002:a05:7022:ea5b:b0:136:8bdd:3f66 with SMTP id
 a92af1059eb24-1368bdd40d4mr1248528c88.5.1779594477020; Sat, 23 May 2026
 20:47:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260523083001.2911931-7-kuniyu@google.com> <20260523092933.DE3551F000E9@smtp.kernel.org>
In-Reply-To: <20260523092933.DE3551F000E9@smtp.kernel.org>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 23 May 2026 20:47:45 -0700
X-Gm-Features: AVHnY4JlVRld-DseQgriiR1Pv_34W0zaElGZi5_HUpKyHBFKYF7flx8n3RbMLio
Message-ID: <CAAVpQUBvP0NLoc66ur=MGiHTbvdsEpHQJwQokTvkW1O9f8ehCg@mail.gmail.com>
Subject: Re: [PATCH v3 bpf-next 06/11] bpf: tcp: Make BPF_SOCK_OPS_RCVQ_CB and
 SOCKMAP mutually exclusive.
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 2:29=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] The mutual exclusion between BPF_SOCK_OPS_RCVQ_CB and SOCKMAP is=
 completely bypassed due to a Time-of-Check to Time-of-Use (TOCTOU) race co=
ndition.
> - [High] tcp_in_sockmap() fails to detect a sockmap if an Upper Layer Pro=
tocol (ULP) like TLS is attached, allowing the mutual exclusion to be bypas=
sed.
> - [Low] Calling tcp_in_sockmap() in net/core/filter.c breaks the build wh=
en CONFIG_BPF_SYSCALL is disabled.
> - [Low] Using relational operators on pointers from different array objec=
ts is undefined behavior in C.
> --
>
> commit ebabac3763475d472254639d69b23d839f36111b
> Author: Kuniyuki Iwashima <kuniyu@google.com>
>
> bpf: tcp: Make BPF_SOCK_OPS_RCVQ_CB and SOCKMAP mutually exclusive.
>
> This patch aims to make BPF_SOCK_OPS_RCVQ_CB and SOCKMAP mutually exclusi=
ve,
> as both can intercept and handle socket receive queues. It introduces che=
cks
> in tcp_bpf_update_proto() and __bpf_sock_ops_cb_flags_set() to prevent
> both from being enabled on the same socket simultaneously.
>
> > diff --git a/include/net/tcp.h b/include/net/tcp.h
> > index c6a6853909c4b..bc95d8e7b62e8 100644
> > --- a/include/net/tcp.h
> > +++ b/include/net/tcp.h
> > @@ -2853,6 +2853,7 @@ struct sk_msg;
> >  struct sk_psock;
> >
> >  #ifdef CONFIG_BPF_SYSCALL
> > +bool tcp_in_sockmap(const struct sock *sk);
> >  int tcp_bpf_update_proto(struct sock *sk, struct sk_psock *psock, bool=
 restore);
> >  void tcp_bpf_clone(const struct sock *sk, struct sock *newsk);
> >  #ifdef CONFIG_BPF_STREAM_PARSER
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index 3608036632a81..1fb63b264b181 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> [ ... ]
> > @@ -5382,12 +5382,34 @@ static int bpf_sol_tcp_getsockopt(struct sock *=
sk, int optname,
> >       return 0;
> >  }
> >
> > +static int __bpf_sock_ops_cb_flags_set(struct sock *sk, int val)
> > +{
> > +     if (!(val & BPF_SOCK_OPS_RCVQ_CB_FLAG) ||
> > +         tcp_sk(sk)->bpf_sock_ops_cb_flags & BPF_SOCK_OPS_RCVQ_CB_FLAG=
) {
> > +             tcp_sk(sk)->bpf_sock_ops_cb_flags =3D val;
> > +             return 0;
> > +     }
> > +
> > +     write_lock_bh(&sk->sk_callback_lock);
> > +
> > +     if (unlikely(tcp_in_sockmap(sk))) {
>
> [Severity: Low]
> Does calling tcp_in_sockmap() unconditionally here break the build when
> CONFIG_BPF_SYSCALL is disabled? The declaration in include/net/tcp.h is
> guarded by #ifdef CONFIG_BPF_SYSCALL, but there does not appear to be a
> dummy fallback for when it is disabled.

Will fix.


>
> > +             write_unlock_bh(&sk->sk_callback_lock);
> > +             return -EBUSY;
> > +     }
> > +
> > +     tcp_sk(sk)->bpf_sock_ops_cb_flags =3D val;
> > +
> > +     write_unlock_bh(&sk->sk_callback_lock);
> > +
> > +     return 0;
> > +}
> [ ... ]
> > diff --git a/net/ipv4/tcp_bpf.c b/net/ipv4/tcp_bpf.c
> > index cc0bd73f36b6d..7e7966b095f9a 100644
> > --- a/net/ipv4/tcp_bpf.c
> > +++ b/net/ipv4/tcp_bpf.c
> > @@ -705,6 +705,16 @@ int tcp_bpf_strp_read_sock(struct strparser *strp,=
 read_descriptor_t *desc,
> >  }
> >  #endif /* CONFIG_BPF_STREAM_PARSER */
> >
> > +bool tcp_in_sockmap(const struct sock *sk)
> > +{
> > +     const struct proto *prot =3D sk->sk_prot;
> > +
> > +     lockdep_assert_held(&sk->sk_callback_lock);
> > +
> > +     return &tcp_bpf_prots[0][0] <=3D prot &&
> > +             prot <=3D &tcp_bpf_prots[TCP_BPF_NUM_PROTS - 1][TCP_BPF_N=
UM_CFGS - 1];
>
> [Severity: Low]
> Is this pointer comparison safe? In C, relational comparisons (<=3D, >=3D=
)
> between pointers that do not point to the same array object result in
> undefined behavior.
>
> [Severity: High]
> Does this logic fail to detect a sockmap if an Upper Layer Protocol (ULP)
> like TLS is attached?
>
> If a socket is already in a sockmap and a ULP is attached, the ULP
> initialization replaces sk->sk_prot with its own protocol structure
> (e.g., tls_prots).
>
> This would cause tcp_in_sockmap() to return false, allowing
> __bpf_sock_ops_cb_flags_set() to enable BPF_SOCK_OPS_RCVQ_CB_FLAG
> and bypass the mutual exclusion.

I'll check sk->sk_prot->destroy() instead since it's not
overwritten by kTLS.


>
> > +}
> > +
> >  int tcp_bpf_update_proto(struct sock *sk, struct sk_psock *psock, bool=
 restore)
> >  {
> >       int family =3D sk->sk_family =3D=3D AF_INET6 ? TCP_BPF_IPV6 : TCP=
_BPF_IPV4;
> > @@ -729,6 +739,8 @@ int tcp_bpf_update_proto(struct sock *sk, struct sk=
_psock *psock, bool restore)
> >                       sock_replace_proto(sk, psock->sk_proto);
> >               }
> >               return 0;
> > +     } else if (BPF_SOCK_OPS_TEST_FLAG(tcp_sk(sk), BPF_SOCK_OPS_RCVQ_C=
B_FLAG)) {
> > +             return -EBUSY;
>
> [Severity: High]
> Can sock_map_update_elem() and bpf_sol_tcp_setsockopt() race here, allowi=
ng
> both features to be enabled?
>
> sock_map_update_elem() does not call sock_owned_by_user() and only takes
> bh_lock_sock(sk). This means it can execute concurrently with
> bpf_sol_tcp_setsockopt() from another thread which holds lock_sock(sk)
> (because lock_sock() releases the slock spinlock).
>
> If Thread A in sock_map_update_elem() calls tcp_bpf_update_proto(), it
> checks BPF_SOCK_OPS_TEST_FLAG() before sk->sk_callback_lock is ever
> acquired.
>
> Concurrently, Thread B in bpf_sol_tcp_setsockopt() takes
> sk->sk_callback_lock, finds tcp_in_sockmap() is false because Thread A
> hasn't replaced sk->sk_prot yet, sets the BPF_SOCK_OPS_RCVQ_CB_FLAG,
> and unlocks.
>
> Thread A then continues and replaces sk->sk_prot to the sockmap protocol,
> resulting in both features being active on the same socket.
>
> >       }
> >
> >       if (sk->sk_family =3D=3D AF_INET6) {
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260523083001.29=
11931-1-kuniyu@google.com?part=3D6
