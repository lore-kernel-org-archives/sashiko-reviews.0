Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A9B33BBBA
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782320517; cv=pass; b=nlD3xjoK2+XAiZr2AXLKaH011v9bg5EP4jzR5Qrm69Qd1l8SqCNHBFLPyriVYPE7ITp2vCYC6eHP9NlCCgBncUGQR1cKEs+Jnnoovjc8hxN5puqB5Mi/8q3y7r5eBVG2ugh9HQBQFsipvKC9J/l8Dd3Iv7H8XYZjTgfATdBxLN0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782320517; c=relaxed/simple;
	bh=IEnlcR40Ofp2M9bOp50jNBFJL7CwLeUtAjIhQ6M+58I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gHheKO4GYMbFRpEaYwml3xaYuEDBdz/8FJxr9q8BcPgSqn/6SoLDNgm9ZstEQsIoVzL9e+pjdt3Q9lwIzm6xY9OZxRgekUV3fDVBNRmaHzPwBNDY1EbXk2Kuv5BUR9vcQnfg2i13aHJOmfhLUP9Su/okmNoBo1EjEU8M2YQZc5M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mptxPDSU; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mptxPDSU"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c7f385883cso1804385ad.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 10:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782320515; cv=none;
        d=google.com; s=arc-20240605;
        b=DLlAZna5px/fEt1bF6d65tJYSHlb1chPkZrjfRFby6UbF0hDd/cirtDAkU08sJZWpm
         XOmzr5Zbp54Et/OunS22l0gQWtEwq3YF+Cju3kiUnFpqjiTL+gAjKGKKqdswgDWI4Koj
         ar/MOKJXOQWgtJiDzF0K4zomRjmWF182+jdlrDVIQ0FrrKGLzslEsxj0bm5lv2rmtSvM
         z9K3ZZed6L8j5QYSVMOzOTtEcLpkurvbNsSl6geL2+OtmrlzyR7p+VHlJXRAdIYAN7lZ
         TDBk4cm/n03AMWQCfCmt2FkKxdQhQZWO9J6a1wGDiLkD786PO3r1dkX4mZVFzwWhruO1
         dKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kaOi2FI8KJXRo8Ej4CH3FqXJaSTUFin19ugye02gcZc=;
        fh=R7ITYP0dP+GTNq1raVt0oZn7mapsqsrv19YFdFDXlX0=;
        b=LVwELfpBv3/clUtFPMx4O3hBcoTnx6ABrdvumNazoZbdERdoVDGlrbqwTpXj/rQHAH
         ZW2iRfuhqzj+PZ5Z3gXVhjJloawFuNBoHaIkLn9EOaB/Iivcj6wDFuBe83PbZDpyWcgv
         9Ou/ELiOpAAD5wKku8tS96KvG37NzdWKx+IMlMWNteoTdIglpOVEsPDwyAui5RLaPxqL
         TzNlIKjmNuVnHOrOt21wMBGM7LOuc14Y8uFkiTIWSWHNs2JpWxGKQ2/dYusOOdcdqOxV
         9HLBQqsKw3SA/zY8jjsH4kRRVVQhVkKHPeXVArJHzI9sD+jPaLGAhk/1SSr1Xjrjips1
         l5GA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782320515; x=1782925315; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaOi2FI8KJXRo8Ej4CH3FqXJaSTUFin19ugye02gcZc=;
        b=mptxPDSUsdBYOdBAkJkAKYgbnggQ5y5xcY8+Br/e5ODLJ6TYg9AmoIBg/m1n8apLpk
         umhFaPUH5XucglLzpxfCixvofwU5dS1u3pf3gcjpWr50ft0yhJFDB5up5MxztrlIethQ
         W46eWcK7JX9V8fzCzuRESc1WnqCXeqF+RHlf3vmhuXczyaB3yzMtlCfqj3SLnFF9pPny
         pv1a74K3qyXxpQba3/UhBkRf+sNf/p7rloKzUrdYszunvs+DflbRgLMa56a6D78EMv8T
         lRvP7XhKGx3vrNDzuFguiACFvz96YGfv58QFtLlf4ZDhPRvvrWobiDqZuBxDTS3suC9j
         aFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782320515; x=1782925315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kaOi2FI8KJXRo8Ej4CH3FqXJaSTUFin19ugye02gcZc=;
        b=ffC9A/6aB48G9XaE1tEkv3xpCoLff2rWouaY9kBjaijBfaGZ3sc8k6XiE9c1odJoow
         IWPXLsQOUXjN4U/YAhip2c0XXPsXFGkwyAjRdOPcpmJLueIe7smruj5OmDLb6VhtQ6u5
         Pvzwp0QNdwU2arJAFjP0IsTlhLUFmQ63Gy0XvYwj+wQhYCo4jVYiylaxIi3luYH8tLDr
         xPwGifs0+k8GwKRtRBnomhtoVpW4jmPKkGUMkp3vEAD01W0WJgx96o9KYu7QnxqOKgrZ
         Z7WP/5HqmgE5HdVmADrFcie902sQMkfk+EaXTP7TS1g7b1q8wMWKShkN6MWbMz9utsdG
         z8ag==
X-Gm-Message-State: AOJu0YxqsojfOwt2dM5x2B/o0XmLRagmY+OYxh/9HtxBRag9P6a+34DP
	YsqDCnf96ehIssFvePulv1Ls/mU6P654nwITLkNluqUMEwVH9SQereAIY9e418qo2kPwAVMmn+H
	MoH/cQ5iNliBGQyKroLYW+DlXdkKSqR5z41Ixr5E40g==
X-Gm-Gg: AfdE7cmCaOKztNPEKAwXwQgjOidObMlMtdR1T6hIvhHnt5BkHOQu3u6lpXjo6rGlHlG
	xZiq5/ZvD024wLqFPsN+H4AHJzC3fdsnLGWr2qLCRQiQpMHzanGYivG9aD0Muk8OPZwLORUX7D0
	A5KUvRCY6CkDaz385Nn7GmLR+03WCP2zkLsg5o4Lmt6VBjrVkzh3sIdrEtsHi+9SaxJBI14OSgL
	pcr5il+uJ+Hzjj3ypvjChSDPk2B2cQ/PwZhboLV2JsjpBMgWs2RtDUqCVcw9i+aUEvjLY9B2r/G
	q7ic+N8notJC5riwVg18UIDgZIEmKtn1JMbrMNslZZjgUou1xnYhq2417NemrcIVKWXNmBh6100
	BRL1nVRDyjGaRG6ancMucX0Y=
X-Received: by 2002:a17:902:ea08:b0:2ae:450c:951e with SMTP id
 d9443c01a7336-2c7e1538ea4mr43720445ad.17.1782320514821; Wed, 24 Jun 2026
 10:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260624155452.211646-1-nishidafmly@gmail.com>
 <20260624155452.211646-8-nishidafmly@gmail.com> <20260624160917.1508E1F000E9@smtp.kernel.org>
In-Reply-To: <20260624160917.1508E1F000E9@smtp.kernel.org>
From: Hiroshi Nishida <nishidafmly@gmail.com>
Date: Wed, 24 Jun 2026 10:01:43 -0700
X-Gm-Features: AVVi8CfIVKsbV7HRoSR2KmegZf5pZmJbYFAFDKc55a2x-PNcx3YNYozfm1ixLuw
Message-ID: <CAE1ksKQnBogsm5nW7z0t9iZsb12xwVfTzzRGgpoBS8VxckS-1Q@mail.gmail.com>
Subject: Re: [PATCH 7/8] md/raid5: raise MAX_STRIPE_BATCH from 8 to 32
To: sashiko-reviews@lists.linux.dev
Cc: yukuai@fygo.io, linux-raid@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 > [High] Raising MAX_STRIPE_BATCH to 32 while keeping the spawn threshold =
at 8
 > lets the first worker grab all 32 stripes and starves the others.

You're right.  In stock, MAX_STRIPE_BATCH does double duty -- it caps
the greedy dequeue
in handle_active_stripes() AND is the spawn divisor in
raid5_wakeup_stripe_thread() --
and keeping those equal is what balances the workers woken against the
work each one takes.
My patch grew the dequeue cap to 32 but left the spawn divisor at 8,
so for ~32 pending stripes it wakes 4 workerswhile the first greedily
takes all 32 and
the rest find empty lists -- serializing the batch and adding
pointless lock contention, exactly as you describe.

The lock-amortization benefit was never isolated, and re-coupling the two (=
spawn
divisor =3D batch) just trades it for coarser worker granularity, so
I'll drop this
patch from v2 rather than guess at the tuning.

Thanks,

2026=E5=B9=B46=E6=9C=8824=E6=97=A5(=E6=B0=B4) 9:09 <sashiko-bot@kernel.org>=
:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] Increasing MAX_STRIPE_BATCH to 32 without proportionally increas=
ing STRIPE_BATCH_WORKERS serializes stripe processing and causes worker sta=
rvation.
> --
>
> commit b1a0a169dabd8b46b6b9ca40375034cf879934c6
> Author: Hiroshi Nishida <nishidafmly@gmail.com>
>
> md/raid5: raise MAX_STRIPE_BATCH from 8 to 32
>
> This commit increases the maximum stripe batch size from 8 to 32 to
> amortize device_lock acquisition over more stripes. It also introduces
> STRIPE_BATCH_WORKERS to decouple the worker spawning threshold from the
> batch size.
>
> > diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
> > index c8787ab7b309c..ad6230415af33 100644
> > --- a/drivers/md/raid5.c
> > +++ b/drivers/md/raid5.c
> [ ... ]
> > @@ -210,7 +210,7 @@ static void raid5_wakeup_stripe_thread(struct strip=
e_head *sh)
> >       /* at least one worker should run to avoid race */
> >       queue_work_on(sh->cpu, raid5_wq, &group->workers[0].work);
> >
> > -     thread_cnt =3D group->stripes_cnt / MAX_STRIPE_BATCH - 1;
> > +     thread_cnt =3D group->stripes_cnt / STRIPE_BATCH_WORKERS - 1;
> >       /* wakeup more workers */
> >       for (i =3D 1; i < conf->worker_cnt_per_group && thread_cnt > 0; i=
++) {
>
> [Severity: High]
> Will increasing the stripe batch size while keeping the worker spawn thre=
shold
> small serialize stripe processing and starve the worker threads?
>
> With this change, raid5_wakeup_stripe_thread() still wakes up an addition=
al
> worker for every 8 pending stripes (e.g., waking 4 threads for 32 stripes=
).
>
> However, the first awakened worker executing handle_active_stripes() will
> greedily dequeue up to MAX_STRIPE_BATCH (32) stripes under the lock:
>
> drivers/md/raid5.c:handle_active_stripes() {
>     ...
>     while (batch_size < MAX_STRIPE_BATCH &&
>            (sh =3D __get_priority_stripe(conf, group)) !=3D NULL)
>         batch[batch_size++] =3D sh;
>     ...
> }
>
> It appears the first thread will steal all 32 pending stripes and process
> them sequentially, while the other awakened threads acquire the lock,
> find the lists empty, and exit without doing any work.
>
> Could this cause a performance regression by serializing CPU-intensive pa=
rity
> operations onto a single thread, while also creating unnecessary lock
> contention from the starved threads?
>
> > diff --git a/drivers/md/raid5.h b/drivers/md/raid5.h
> > index 7aeba1fc7f09e..1f37dabd727be 100644
> > --- a/drivers/md/raid5.h
> > +++ b/drivers/md/raid5.h
> [ ... ]
> > @@ -496,7 +496,8 @@ struct disk_info {
> >  #define BYPASS_THRESHOLD     1
> >  #define NR_HASH                      (PAGE_SIZE / sizeof(struct hlist_=
head))
> >  #define HASH_MASK            (NR_HASH - 1)
> > -#define MAX_STRIPE_BATCH     8
> > +#define MAX_STRIPE_BATCH     32      /* stripes per handle_active_stri=
pes pass */
> > +#define STRIPE_BATCH_WORKERS 8       /* stripes-per-worker threshold f=
or spawning */
> >  #define RAID5_SYNC_WINDOW    32      /* stripes to pre-submit per sync=
_request call */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624155452.21=
1646-1-nishidafmly@gmail.com?part=3D7



--=20
Hiroshi Nishida
nishidafmly@gmail.com
