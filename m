Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9F639446B
	for <sashiko-reviews@lists.linux.dev>; Tue,  1 Sep 2026 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258996; cv=pass; b=O3ydoJmKnHPbJaal1Mbx87IvkO+xnkRqQqiMFUB3g3qnDTZEwVnT6W9pepbEjzQnPD1CE7GSzD02UnwklgSi/FGibNa9Aog2bSdQRqvK56o3UV/JEbjS2N8SmDOzqHresQzXhSFaH6x9E8sNNKwC6G2FWWmfJ3xkH3eczdBSbjg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258996; c=relaxed/simple;
	bh=huDFI3i7GBQgjkYgjMwu1/Xa29Lblmd5q/CySzSHnmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYL2zpVLsOSeUQ48l4LDw4qaLenQ2K+AKEsLMPlQs+dnIYbFx9MLkfz21fk8fwFL0QG1cFKJOY1Q/vmcUig7Q7Ljp/M73hfL3wutBXb/azQaZxiGGcoMvU6ra8z4E6Wc4Xv5+xQPw3xszVsOp7ZMcRXJDSHyZDjl8r+XnCVhYIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=dKzMcA4A; arc=pass smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="dKzMcA4A"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8485b358552so4609429b3a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 01 Sep 2026 03:36:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788258995; cv=none;
        d=google.com; s=arc-20260327;
        b=nuu0qXJ9+0LtI6eF9oEJ/TqHr87FG6Gvb/JpEIDl3I0SxkIKfUDaarDC3VbAiJ1AnR
         yar9SEGvmjxeTut5KDLREY7b9ksjR89/0xXQYapvEosZ3TiaUlQlevaMFGLwkljLUXY2
         qi6wneAaplVRv5RYLfSDVIt8UFcgS+eKYELj39uLMOur5qZjjABOxYbIe/L9HrfaA6Ph
         TQQthb+V+RAtXjK+4EaJdS+9AVFNwSFBIUgQFFa6M+zstdiHhgfZNa5UlIKBaw/7rMrr
         P+Yj9t1WlGw/E4diP+D/sRsmpHLtFAOMGXX1wE0C7JvqJhXRvBtm5ILFJBvKdds4qZ82
         lYNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=itLKIw/z2KIwA3siFoML79DXoaShSoPMj4z5/O6mtnQ=;
        fh=IJubMqKgkMlrVhGkyRA5eTvlI6qJvLeMBau/d8YvBv4=;
        b=MWcdvRvC8vcCpG4LT6LY5I/daB2hsABF7cn6ZpD9F07X27dD8oAKSFzmKu1VPJMRil
         hMJsdzhaQJGnl9GBjwX4pSFi5vII64o00NN3sjxbg+Q1PqpZwo6wCMWV1kjeg/ISZVP6
         sDKxY8u5y62P9UpjA5Bj11diJ5kgeJmKClh2r6Xl+tViJLPYCcWNUuQnqbC5pxrgK+/v
         nsku9pzViar7sTkGkQBZNX5RsGZK2Of9dD1ILmTXI0ftIL+DFbyqP8oqJch/iubUMnLI
         Zvsd32uKKlzBpCm/5yErjoKbuymkza9Gu1/lSN8AusBsHGWDeTaKNCg8zKEr0fnsv/Fp
         mAag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788258995; x=1788863795; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=itLKIw/z2KIwA3siFoML79DXoaShSoPMj4z5/O6mtnQ=;
        b=dKzMcA4ALbsjb70gccQ/L5fp138K+ObwNZnDwDSE5BNwaAuERMzxNrEHw6vXLR/sXq
         SaFbNW6c2UJEJuKkhQhQZI41W9bqmUcQBRFt7+Jw9V95zPwj0zi8XfiExXuyF5h2bH2p
         r+hQLL7kS+cO6fT4SyQ+DhnhRTWNbFS47tkoIpXNdKXahA2qkCI8jtJc29FxugKFaHrQ
         NRMLDprgP4xZ0qeVzpHwp+dlpaTBu4uI3K2xscXZF5yTSahHzq9QlAZ7a6O3JWeO3bLb
         h+Yd0DIJOSVMX7agMbFO9RM3EWl/zZ0lNTS6No2P6Mz2QagHdmXAgTFLez7J8Dm3P2/L
         YjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258995; x=1788863795;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=itLKIw/z2KIwA3siFoML79DXoaShSoPMj4z5/O6mtnQ=;
        b=dDkNWW2KR67puRIAahDiWcojay73zrXOpW33y9AUv6TghEdL9C2oc3NbyOehBfSfvT
         N+3Jk9SpMWsMNHLy42FS804p3WD247q0yz2uzDFDWRHFmSzCF6Wsd6ryvf3SCUM1juhN
         NIJyvtk/iV0+rH4+7oSXpV7EqvN000cdURGJxyXrl577sHJHRA79Sjcpy/w1wJSkJqHc
         UaMrSwv3As4IBwOFnZ6MBGSbAnY8gBU7Pl4TYJ/Kn4vC05XfAi77Ldl31gT594R3mfyt
         y+zD5mvvCJRhAzZY8p/Oqg3WftlVA8CsMNr8h3n07g9hhdg8VMK2S/oi674X1Ez3gMDv
         BmCA==
X-Gm-Message-State: AFuF++lq9QMhSTgvylad9bTbHDhj9G67d5FrcEICX5SqmVlM09UCXsFP
	6UDVwp5NavEwm2MZ9xYM/k6gN6i54rDloj287M/ZrDl/Z30DT8iV6Rds9YM5sC+bQ7gqpNnwbo6
	jwN2QjfZ+LKuav/4Tidx63HqEol9MlCS5TzyotuUn3V4=
X-Gm-Gg: AR+sD13Bpiuxb3wV5iLTiwCyl+jap/Qk0WaUCPsQ9GzDU0vfw9evYcoVecUN2bxjv7K
	a1iCWPRhwBracXqvT33NuDjUZdEdvdsxoKsqBUNUGYGgBopl7MBI0Tw3hnTm2kktOtpi8S9mrrQ
	Ui685E/IAOZ+2hJWXIpyTfIyh3gHW1nMxBOib+ELTxUFd3TTfNxa9T2PUsvlLSCD/gEmNj5tuD7
	6YEGASQzi6ZfibW2AAwWUgb0SQbry/1iUQGL4nCKNkjIih7kgFTPT4/G8JgyixJeGqyQb0me1Qe
	PJckpNaOj62iLxZZG/BKlel3rzltOjEtzcShdanQ2pRo
X-Received: by 2002:a05:6a00:3001:b0:84e:9257:d0c2 with SMTP id
 d2e1a72fcca58-85b59c6e775mr11307652b3a.9.1788258994649; Tue, 01 Sep 2026
 03:36:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1786497414.git.yuantan098@gmail.com> <e3aeafa4dc2afb7ea36143eae163635eee23395c.1786497414.git.yuantan098@gmail.com>
 <20260813065630.908AC1F000E9@smtp.kernel.org> <CADfOeh6F-PngQB-F4dYds2CpqBCTfJHpBYLD+0ZhcWNiBtPOeA@mail.gmail.com>
 <21819722-39c1-4a69-abc7-98ec0f06fafd@kernel.org>
In-Reply-To: <21819722-39c1-4a69-abc7-98ec0f06fafd@kernel.org>
From: Wei Ren <weir@nebusec.ai>
Date: Tue, 1 Sep 2026 18:36:21 +0800
X-Gm-Features: AcwNN1XTVerNik6-oIKN8lJuQfiAZcYITe1d0mhpjEGzMQRAqdnBf6L243wHu88
Message-ID: <CADfOeh5bGwKmc+Ev-ZXCaSZ2Z3r+TsieBNp9qGgHmG-4Y3OQfg@mail.gmail.com>
Subject: Re: [PATCH net v4 1/2] mptcp: hold MP_JOIN msk ref when cloning reqsk
To: Matthieu Baerts <matttbe@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, mptcp@lists.linux.dev, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Matthieu Baerts <matttbe@kernel.org> =E4=BA=8E2026=E5=B9=B48=E6=9C=8820=E6=
=97=A5=E5=91=A8=E5=9B=9B 19:18=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Ruide,
>
> (+cc netdev ML)
>
> Thank you for having replied to Sashiko's review.
>
> On 20/08/2026 12:58, Wei Ren wrote:
> > On Thu, Aug 13, 2026 at 06:56:30AM +0000, sashiko-bot@kernel.org wrote:
> >> This is a pre-existing issue, but does this clone helper also need to
> >> handle the migration of token_node for MP_CAPABLE requests?
> >
> > That is what patch 2/2 of this series does:
> Indeed, Sashiko Gemini didn't look at the next patch. Maybe adding a
> note in the commit message to say that a similar issue is visible with
> MP_CAPABLE and addressed in the next patch? Still, that doesn't feel
> natural to add that...
>
> Do you mind also looking at Clashiko's review, please? The suggestion of
> replacing sock_hold() by refcount_inc_not_zero() might be valid (to be
> double checked):
>
> https://netdev-ai.bots.linux.dev/sashiko/#/patchset/cover.1786497414.git.=
yuantan098%40gmail.com
>
> ------------------------------ 8< ---------------------------------
> > diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection=
_sock.c
> > index 6257459bcee2..896f472dcba2 100644
> > --- a/net/ipv4/inet_connection_sock.c
> > +++ b/net/ipv4/inet_connection_sock.c
>
> [ ... ]
>
> > @@ -961,6 +962,9 @@ static struct request_sock *inet_reqsk_clone(struct=
 request_sock *req,
> >               rcu_assign_pointer(tcp_sk(nreq->sk)->fastopen_rsk, nreq);
> >       }
> >
> > +     if (rsk_is_mptcp(req))
> > +             mptcp_subflow_reqsk_clone(req, nreq);
> > +
> >       return nreq;
> >  }
> >
> > diff --git a/net/mptcp/subflow.c b/net/mptcp/subflow.c
> > index e1f20ff8fdb4..8f8e1229766d 100644
> > --- a/net/mptcp/subflow.c
> > +++ b/net/mptcp/subflow.c
> > @@ -47,6 +47,17 @@ static void subflow_req_destructor(struct request_so=
ck *req)
> >       mptcp_token_destroy_request(req);
> >  }
> >
> > +void mptcp_subflow_reqsk_clone(struct request_sock *req,
> > +                            struct request_sock *new_req)
> > +{
> > +     struct mptcp_subflow_request_sock *subflow_req;
> > +
> > +     subflow_req =3D mptcp_subflow_rsk(new_req);
> > +
> > +     if (subflow_req->msk)
> > +             sock_hold((struct sock *)subflow_req->msk);
> > +}
>
> Discovered by: gpt-5-6-sol, opus-5 =C2=B7 Missed by: opus-4-7, sashiko-ge=
mini
>
> Can the sock_hold() here run on an msk whose last reference has already
> been dropped?
>
> The pointer being held was snapshotted by the plain (unsafe_)memcpy() in
> inet_reqsk_clone(), and the cloning CPU owns no reference to that msk at
> this point.  The clone happens optimistically in reqsk_timer_handler()
> before any ownership arbitration:
>
> net/ipv4/inet_connection_sock.c:reqsk_timer_handler() {
>         ...
>         nreq =3D inet_reqsk_clone(req, nsk);
>         if (!nreq)
>                 goto drop;
>         ...
>         /* Even if we can clone the req, we may need not retransmit any m=
ore
>          * SYN+ACKs (nreq->num_timeout > max_syn_ack_retries, etc), or an=
other
>          * CPU may win the "own_req" race so that inet_ehash_insert() fai=
ls.
>          */
> }
>
> So the third-ACK path can be running on the same request concurrently.
> There, the request's msk reference is handed to the child and can then be
> released synchronously:
>
> net/mptcp/subflow.c:subflow_syn_recv_sock() {
>         ...
>                 /* move the msk reference ownership to the subflow */
>                 subflow_req->msk =3D NULL;
>                 ctx->conn =3D (struct sock *)owner;
>
>                 if (subflow_use_different_sport(owner, sk)) {
>                         ...
>                         if (!mptcp_pm_announced_has_ssk(owner, sk)) {
>                                 ...
>                                 goto dispose_child;
>                         }
>                 }
>
>                 if (!mptcp_finish_join(child)) {
>                         ...
>                         goto dispose_child;
>                 }
> }
>
> and dispose_child reaches mptcp_subflow_drop_ctx():
>
>         if (ctx->conn)
>                 sock_put(ctx->conn);
>
> If that put (or a later teardown of the joined subflow) is the last
> reference, for example because userspace closed the MPTCP connection
> concurrently, then the refcount_inc() in sock_hold() lands on freed memor=
y
> and on a zero refcount, which is the refcount_warn_saturate() "addition o=
n
> 0; use-after-free" case.
>
> The window between the memcpy() snapshot and this sock_hold() is not
> bounded either: in the TFO branch of inet_reqsk_clone() it even contains
> spin_lock_bh(&fastopenq->lock).
>
> Would refcount_inc_not_zero() be more appropriate here, with
> new_req->msk cleared when it fails so subflow_req_destructor() does not p=
ut
> a reference that was never taken?  Alternatively, could the hold be taken
> under the same exclusion that performs the ownership transfer in
> subflow_syn_recv_sock()?
>
> Also, the helper takes req but never uses it, so the original request is
> not re-validated at all.  Is the req argument intended to be used?
>
>
> Discovered by: opus-5 =C2=B7 Missed by: opus-4-7, gpt-5-6-sol, sashiko-ge=
mini =C2=B7 Confirmed by: gpt-5-6-sol
>
> This is a pre-existing issue and is not introduced by this patch, but as
> long as this hook is the designated fixup point for cloned subflow
> requests: inet_reqsk_clone() also byte-copies subflow_req->token_node, th=
e
> hlist_nulls node that mptcp_token_new_request() linked into the MPTCP tok=
en
> bucket for MP_CAPABLE requests, and this version of the helper repairs on=
ly
> ->msk.
>
> The generic detach helper does not cover it either:
>
> net/ipv4/inet_connection_sock.c:reqsk_migrate_reset() {
>         req->saved_syn =3D NULL;
>         ...
> }
>
> With only this patch applied, the clone's token_node looks hashed while i=
t
> is not reachable from the bucket chain, so after a successful migration t=
he
> surviving clone trips the pedantic check in mptcp_token_accept():
>
> net/mptcp/token.c:mptcp_token_accept() {
>         ...
>         /* pedantic lookup check for the moved token */
>         pos =3D __token_lookup_req(bucket, req->token);
>         if (!WARN_ON_ONCE(pos !=3D req))
>                 hlist_nulls_del_init_rcu(&req->token_node);
> }
>
> and the token ends up no longer reserved.
>
> This is resolved later in the same series: the following patch, "mptcp: f=
ix
> MP_CAPABLE token migration when cloning reqsk", adds
> mptcp_token_move_request() and calls it from mptcp_subflow_reqsk_clone(),
> so the state does not exist at the end of the series.  Would it be worth
> noting the ordering dependency between the two patches in the changelog,
> given the Cc: stable tag on this one?
> ------------------------------ 8< ------------------------------
>
> Cheers,
> Matt
> --
> Sponsored by the NGI0 Core fund.
>

Thank you for catching this. The suggestion is valid. We've fixed it in our=
 v5.
