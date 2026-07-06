Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FE43812D0
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 05:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783316414; cv=none; b=sdkrXqkVJvUiTbir0MR8+xmAG6dxOL0O7AHshZLDtyKbe88jIO1aeEbKqI1A7sRQS140Mi6cCiIb2eTMXtxnxuhpFy2CixiWq4rVBm/RrARWAb54rZ2xCabyYbGPYmmthFQjzcl3LVUsobjYZ6vrv7LdRRBy1dgEmsH9rLTyjsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783316414; c=relaxed/simple;
	bh=AUEvGkaIUq/4Q9g6Qi5pGcg8Pc4FJ9GriKF3JrG5gPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=il6cS7fhBo7jFKPEuo1ov8Kk+N13l62UfTcALexR6k1b7FCVFyydij8XI+haajCCY9VQM5B7lYaqupLJdu4ELJDegH3kgLk6NX2xzE475S/eEOQZY49lVTGJgjIA1iundWiLWlffkYspCbfUMqtL1mCMci13vBZGIPzT25L1er8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrife.io; spf=none smtp.mailfrom=jrife.io; dkim=pass (2048-bit key) header.d=jrife-io.20251104.gappssmtp.com header.i=@jrife-io.20251104.gappssmtp.com header.b=aTC+QQtW; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jrife.io
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=jrife.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jrife-io.20251104.gappssmtp.com header.i=@jrife-io.20251104.gappssmtp.com header.b="aTC+QQtW"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-845e5504f54so90611b3a.3
        for <sashiko-reviews@lists.linux.dev>; Sun, 05 Jul 2026 22:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20251104.gappssmtp.com; s=20251104; t=1783316413; x=1783921213; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uUThmnqdVfyKqyuDois6AcDzN8X+2YoeRVYUtD3WE8A=;
        b=aTC+QQtW4tVgbx+LYp99YoJqn835AlG+ENIijY+tfL+3jJ5PVM09LBbcE73uTMP8Cs
         wTAD0wxTumlQ4kLpDy0hf++DOMtdBSESIQuAhc7ZWhTPmZrqMcjGzmw9raXCa1bP9GBA
         JYEGazHth2Z3TMjpRDQFvh/llvccHHa8SbSLYy1K0fa6VgEKe5YH0vt6UQaYgpIKoyT6
         CFy2a1cYegqfTq9Cc075NPbgVAjLKjtoal26SgeEO66etvwaRRCRFPXN1PySXIk0vGN9
         JIJ0IGoM6yW+WAPzUNEAjyy7ZjQNvWyj/GdHmGpEUhySEUT5h+T07GEZ28CrT2i+5Lxh
         X+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783316413; x=1783921213;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uUThmnqdVfyKqyuDois6AcDzN8X+2YoeRVYUtD3WE8A=;
        b=ooLm33rqqRvqzbYd0YC0IMPkU1Fya5mpDxrHljBdWBkQXZ+Wn9y83yMna49h7wtHvm
         MTJfzxxPxSQDVVw5x36HJLmXUocXsfZxEevBN13m2qTSEqsKKAquDQWXmO9F9PRnd2yw
         iOJBPrzgFFt/lNRHcBCst8IcHknPBUnrGAIHVdvX5kO1VlDcTRI0uzVozcDQMBCCR2EX
         DM38mNecAr6R0gwDlgYFIk6njrDXRtz2QR8wds1qRzyFflmDpGgbES0utyfQqNI5Re01
         JzCjdIF3X96V/lJI2qo0mPYri6WKQORS5YLt0fO+3Hzgootc1yF8oCQf/tKyOrHCrEC+
         ClFA==
X-Gm-Message-State: AOJu0Yz7ePvrMEbNQ6QMDBF84XxjGOc8J6YuQm0F22hXGdB6s23/Aq4/
	IzgaDvQmoJMFeAy9+VlKmhUI01QqqpZQbI8h5hsMeBtfy6AqkudbXoEnjfoNHPULs4Q=
X-Gm-Gg: AfdE7clrezKzd+bJLkAyFFThh7W5uJAynxtxNztZ9nLO/DTRgdjKl9hM1bBmNYGrS+m
	TnZQ3sPgTMcGILcBPjOe8XRpyAr3eKuRaLfaIzmqoN39EaORrLzKiJgWVIR4nY8wcUpvwvFR280
	5FL9Ya0aJ2+s9jKaMDJyD+2fIK+p7ZteFtO4UOVjXj/ImQVMeHyDvS62evsOb5kai7ePveZ1h5l
	WDVkhsxXEd4HliGVQohz7jZRwnUhFDP/3UQKQQAZ8vax2eFhbECCM0Yppcyks5mXzgu36Tu2jFK
	Aw1fvkg3LyULEVcPpZh3qK95DZ6Ffyckkz5tHCC0qelJZIkIohi8ocwFgSjF/2NINVX8cSY7p12
	AKgDQoGpdFaQjM7OmmjfvBcDrk/QZgKUnaSQd3mIbzVP8moOGHYYqrMcp9rHf6zhTqT0/7aIzgd
	YR1sZRgAH6
X-Received: by 2002:a05:6a21:7703:b0:3bf:6ac8:8d20 with SMTP id adf61e73a8af0-3c03c3c42f7mr5222535637.1.1783316412798;
        Sun, 05 Jul 2026 22:40:12 -0700 (PDT)
Received: from t14 ([2001:5a8:47ec:d700:27b5:472c:6298:1925])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f6bd050sm5500447a12.14.2026.07.05.22.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 22:40:12 -0700 (PDT)
Date: Sun, 5 Jul 2026 22:40:10 -0700
From: Jordan Rife <jordan@jrife.io>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Subject: Re: [PATCH bpf] bpf: reject mini-sockets in bpf_sock_destroy()
Message-ID: <po6jpmx5q72uvblx23atsbwvxhoszpmrlkjd6txljljufnjeqj@v3yov32574sm>
References: <20260702224519.800135-1-xmei5@asu.edu>
 <20260702230504.0E65E1F000E9@smtp.kernel.org>
 <e6ec128e-1acf-4dc7-8884-e4d7ed14d25b@linux.dev>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6ec128e-1acf-4dc7-8884-e4d7ed14d25b@linux.dev>

On Fri, Jul 03, 2026 at 10:15:27AM +0800, Jiayuan Chen wrote:
> 
> On 7/3/26 7:05 AM, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > 
> > New issues:
> > - [High] The patch causes a functional regression by completely disabling bpf_sock_destroy() for TCP mini-sockets (TIME_WAIT and NEW_SYN_RECV).
> > 
> > Pre-existing issues:
> > - [High] The helpers bpf_tcp_check_syncookie and bpf_tcp_gen_syncookie suffer from the same type confusion and out-of-bounds read as bpf_sock_destroy, but remain unfixed.
> > --
> > 
> > commit cf46da8728e7f1fca4584ccdb089c82b7fd3061f
> > Author: Xiang Mei (Microsoft) <xmei5@asu.edu>
> > 
> > bpf: reject mini-sockets in bpf_sock_destroy()
> > 
> > The patch tries to fix a KASAN slab-out-of-bounds read in
> > bpf_sock_destroy() by checking sk_fullsock(sk) before accessing
> > sk->sk_protocol. It casts sock_common to sock and early exits if it is
> > a mini-socket.
> > 
> > Fixes: 4ddbcb886268 ("bpf: Add bpf_sock_destroy kfunc")
> > Reported-by: AutonomousCodeSecurity@microsoft.com
> > Signed-off-by: Xiang Mei (Microsoft) <xmei5@asu.edu>
> > 
> > > diff --git a/net/core/filter.c b/net/core/filter.c
> > > index b446aa8be5c37..3e70c8ab5aab1 100644
> > > --- a/net/core/filter.c
> > > +++ b/net/core/filter.c
> > > @@ -12665,6 +12665,9 @@ __bpf_kfunc int bpf_sock_destroy(struct sock_common *sock)
> > >   {
> > >   	struct sock *sk = (struct sock *)sock;
> > > +	if (!sk_fullsock(sk))
> > > +		return -EOPNOTSUPP;
> >          ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > [Severity: High]
> > Does this unconditionally reject mini-sockets?
> > 
> > The commit message states that mini-sockets have no diag_destroy() handler,
> > but as documented in the original commit 4ddbcb886268, request sockets are
> > explicitly supported because their protocol diag_destroy handler
> > (tcp_abort) correctly handles TCP_TIME_WAIT and TCP_NEW_SYN_RECV states.
> > 
> > If we unconditionally reject non-full sockets, wouldn't this break BPF
> > programs that rely on bpf_sock_destroy() to forcefully terminate pending
> > connections or TIME_WAIT sockets?
> 
> It's true. Please also include a selftest to reproduce the issue and,
> another one to cover the non-full socket.

+1 to the selftests.

I'd just extend tools/testing/selftests/bpf/prog_tests/sock_destroy.c

Considering the original intent was to support request sockets and time
wait sockets and tcp_abort already supports both, perhaps something like
this would be better.

__bpf_kfunc int bpf_sock_destroy(struct sock_common *sock)
 {
+       int (*diag_destroy)(struct sock *sk, int err);
        struct sock *sk = (struct sock *)sock;
 
        /* The locking semantics that allow for synchronous execution of the
@@ -12672,11 +12674,16 @@ __bpf_kfunc int bpf_sock_destroy(struct sock_common *sock)
         * Supporting protocols will need to acquire sock lock in the BPF context
         * prior to invoking this kfunc.
         */
-       if (!sk->sk_prot->diag_destroy || (sk->sk_protocol != IPPROTO_TCP &&
-                                          sk->sk_protocol != IPPROTO_UDP))
+       if (!sk_fullsock(sk))
+               diag_destroy = tcp_abort;
+       else if(sk->sk_prot->diag_destroy &&
+               (sk->sk_protocol == IPPROTO_TCP ||
+                sk->sk_protocol == IPPROTO_UDP))
+               diag_destroy = sk->sk_prot->diag_destroy;
+       else
                return -EOPNOTSUPP;
 
-       return sk->sk_prot->diag_destroy(sk, ECONNABORTED);
+       return diag_destroy(sk, ECONNABORTED);
 }

(Note: I haven't tested this)

> 
> > 
> > [Severity: High]
> > This is a pre-existing issue, but does this same type confusion exist
> > in bpf_tcp_check_syncookie() and bpf_tcp_gen_syncookie()?
> > 
> > Both of those helpers take ARG_PTR_TO_BTF_ID_SOCK_COMMON and cast it to
> > a full struct sock *. They then immediately dereference sk->sk_protocol
> > without an sk_fullsock() check:
> > 
> > net/core/filter.c:bpf_tcp_check_syncookie() {
> >      ...
> > 	if (sk->sk_protocol != IPPROTO_TCP || sk->sk_state != TCP_LISTEN)
> > 		return -EINVAL;
> >      ...
> > }
> > 
> > If an XDP or TC BPF program passes a tw_sock or req_sock from
> > bpf_skc_lookup_tcp(), won't this result in the same KASAN
> > slab-out-of-bounds read since sk_protocol resides outside the bounds
> > of struct sock_common?
> > 
> > > +
> > >   	/* The locking semantics that allow for synchronous execution of the
> > >   	 * destroy handlers are only supported for TCP and UDP.
> > >   	 * Supporting protocols will need to acquire sock lock in the BPF context

Jordan
