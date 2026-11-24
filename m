Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795531463;
	b=y5z4MeXkRTQqoGIGIsZx8GYEYUZkKo6SrKoEIYwJ7JWC6PY85DPDOmV5SsYVF5CD/Zuf
	 O3iSPv1+XmwRY03cLlW4DkNDEIYQ3VtBs2tfmKiVlD5MTXp/pyUQuNCH3PQuc6qo99fnI
	 S41Cjy7xeOegJ5PWb/BW02OsyZ6n07wByKjnou3eqKVnHORmiBPakQsIvU1Kmqy7eBxad
	 GwDB2y7FHsb22fkXGgTrPG1Hi90ufyQ435u7vIy6n/Y29lm4jEFdGzPTLZOm/LptLmpcp
	 PtQf1nC7V0aAn3fz/2IKKDMix+aQiSXdQ9rORvXFoeGZWViPnCZ85MKLPij0d/AXVqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=T1IuR6AMGVikpecUaYqpWjoZc/RUPudxFkhEFjjMgz0=;
	b=nqyGDgUWmPnIykpY8OQ/8zl/UzmIN3KbWRbAPf2ZHg+gjezKXNqj3isK54BqRqzFGA6s
	 mYsu8FECVR0TYT0McvOzW30yO2jYp9nBPS8PQ++cNrY33Fm+0vLTzTGOR71zkDkQw5WTV
	 YDeqoHU2WfogTJ8jL9PY5umx/yoWw/R9XihHPDk5j67ExXm3Uc1HxJg1WlUioVEhJ9R/G
	 +pYyq15WBI5PYk4IXDNztBzeYxWLEbq+hI3waViSajy08ggKFqRpINrWy9oKZozI3eIF3
	 u9euCQTMyruEmcroKqY9vRy/DnJzLXDq6ZOOyXj/dbWhYYGQ9Dq1HBH/C/qGK2K0lCw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=KrIk6SpD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BF3606A321
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 14:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9BF3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=KrIk6SpD
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6bab10842f8so3992833a12.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 06:44:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795531461; cv=none;
        d=google.com; s=arc-20260327;
        b=qba4DYnKLXThgO8pHWSErfJZmmt43nMcPhXGPJLM6DiMVPXzcqnaVTtYvl+aXpNTMi
         B7ILobSJPwyyIZoeHAZjB7jSE/uTljcRPHm6MUehGMDu5C5hITCjaGDKi0zvusEM1xyC
         ioJCG2pSjyW+CAMWD4XKFjiRZQGW/8du6Y0y2eZE8kzPoT3oNaYrqvz1MzAIhukQ2oCo
         do/Xu+Shc08hPE+fSZxGrWnUNLqxf7sPzqFrEfThowl0SKgEFCRAsy20HqiDRYCKagwd
         92AT4eUobEXq5rapBNRKnoNxTlRGsEKTvs1n7/LhSNXmQ31JQPA1Gon79VQ062IB0N4V
         Ufxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T1IuR6AMGVikpecUaYqpWjoZc/RUPudxFkhEFjjMgz0=;
        fh=PVRZ7bnWe/UogpGgKhCcEPnnlh4h1FYaRMLpw1VyyFw=;
        b=tDGlbxt4WDDO75pbRuMroF6lyPr28/aGvn/6wUm+DO18hhJTY/X8lE86tbMatd7NjU
         rpR+eVmzUgm+V/2oF4R5y35nRPQfYlQB6LG/D7ks/znZV+LRYYRBkfTvbrIYbbUNncAE
         ZwiGLX0LoZJ0Yp9PaCn8GEhyXxRv6dE090tXKzxiFyRhO5B5P7Ge0Uwm2wf6RDXjhItl
         NZUEYFdQQjL0SpGTD3MvnnqhGcbl1A4QpeovJiv7VnupMy5Q3ST0OLoUN61e07S1jxWx
         498Q/eLQBeFgk+FB/CYBp+CKlNZtd2m/YQb5YiqOld0ewXuCKFRxOm2BZUertUQGL2oQ
         YeJQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1795531461; x=1796136261; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T1IuR6AMGVikpecUaYqpWjoZc/RUPudxFkhEFjjMgz0=;
        b=KrIk6SpDdPcMNR10epBQTcnBmHTUV/GQrSBgyF3voZ5khjoLiYTfG4vbKo6Jf2fdsC
         ecPu3Y/FArBg/eQKrrWHXhMNl219PKv8stxvPywylFRM48QQizRTU7BOZf+dWvLCnPur
         ABwgg8BZTXoHF9zL9qlyETSy971D2wpjk3maKeV1xqzLWhAMsHqdttiU/UtjhaznpfDi
         CfHRVcR3w6rkekc2khl/fZmGgRnVuIiR2uL0l1OZuqz08cm03iMljXTyFCn8eH0wDZTz
         Tc8qmepKUYDsIP0BERPPaPISmZp39VA/39yiUMxvOfm2/kVdpZK7Jj+aAI6x80NBzRUd
         k0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531461; x=1796136261;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1IuR6AMGVikpecUaYqpWjoZc/RUPudxFkhEFjjMgz0=;
        b=gemQ3eUqDqkYl2ydaRZwbsL8i8UY1YC1cqMUeP3e4Dc7H9U2Lg39/2GoOKDuQxD2ac
         teeb0kdlf2dbJWx4uvidXZjhNYvkwO6mcD44snL4Ja6+in0Lj89xbO13m8ems7pFXFaZ
         elwezmQMV+r1MIGXh+TRvuaLqVYSlN2PzNl/5yYhMEnswDb1gtqxTAvVc6Wh+GowrKas
         cA7vpoiwy7qLl6+Tl8SXSrm7/sbaem/grDNGmaaPSov+B/eRcvEpg916cUYd3Q5efJWL
         /ROlap47P4XaxpLtobQKiQ8nouvl/+IUhu743MEJST7n4mnmzpCYBdOe5A3V+DQokhsY
         xcQg==
X-Gm-Message-State: APuU4Z8+GMtLATmD7qHxp48T4z1QzlY9eR5Gu+ie2wwp2kPNNHKXZvOV
	if76Mpkz5e9KGz3pL2NpNQxJP6SNkqar5Gu/pxaZXCfcgb14m6M+lHAFiL1dgHH2EqIAa6c/7Xz
	v9quRMk7yiOzVLgGozEDFsUJ/gQMUvQSulex35DJyCPC0R0fkxHsPzFk=
X-Gm-Gg: AZFdTZeZRccOHAROkQG6ddHtBOqo38sQDs6zDRD0F095k2pdM3FWSrubdzU5DS4U/8m
	YifONUr/secuyDrlXlGJ2Lt3SrtV0nA4K0wkJ/unK6m1JcaiXubMFRYgN0Gpv81xUJm8qulpg0f
	soekxdxZv9SGvUUAD3WKDShTkf35zkw1l1uuaYT9om3dZR5gdOtcjAC+6Lih6P3nqpMeqTni+uh
	menmKtMGJInovy+uUA9CrHRWT+AuQAn1z7FtnP+cgLHS+0l5CvtRpD2UeCCaXSDb5CJ1Cz9JMq3
	rpu9m6jABAqRedNEsJE/6d3VGhF1picm+rooHuNCpYwUGLbJ9V+OcNoZ5pL55FoXEht5vKdfDeI
	HOSq0d3Bw+46ET/ngs9DgZFN2APpPeH7W+96F3BdlkroCeybxTB1p2GVxd9BMizFfm7YwHy1dIW
	h+lLTGMzncGT7WSk0KvRtUa/5TPa/xdD65bxyBlVAajGePqUmM1T+w+9dom82VwDBWIdqsPSDpv
	7TKlfWuwbwyRC6DoMntvSRA
X-Received: by 2002:aa7:c25a:0:b0:6ba:13ce:6165 with SMTP id
 4fb4d7f45d1cf-6ba1fc1c63fmr9362514a12.15.1795531461258; Tue, 24 Nov 2026
 06:44:21 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123143719.938876-1-haris.iqbal@ionos.com>
 <20261123143719.938876-4-haris.iqbal@ionos.com> <sashiko-outbox-229468@kernel.org>
In-Reply-To: <sashiko-outbox-229468@kernel.org>
From: Haris Iqbal <haris.iqbal@cloud.ionos.com>
Date: Tue, 24 Nov 2026 15:44:10 +0100
X-Gm-Features: Aa3M54q-ObbKvJOkH9qfhofxOtj3zvxYdYeoMBGSRe8sDWnU17Uevjpj2XqjTXY
Message-ID: <CAJpMwyjdn82+n+b7_M8VaFrDUNoCSF=FV91kxyMMmQCHdH0k_Q@mail.gmail.com>
Subject: Re: [PATCH 3/9] RDMA/rtrs-clt: Trigger error recovery when posting
 LOCAL_INV fails
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org, Jinpu Wang <jinpu.wang@ionos.com>, 
	Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 4:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] RDMA/rtrs-clt: early return in complete_rdma_req() leaks DMA
>   mappings
> --
>
> commit 61b2b66e033c3217c1bebe6348e99899004f5550
> Author: Jack Wang <jinpu.wang@ionos.com>
>
> RDMA/rtrs-clt: Trigger error recovery when posting LOCAL_INV fails
>
> This commit clears req->mr->need_inval and triggers RDMA error recovery
> when rtrs_inv_rkey() fails synchronously in complete_rdma_req().
>
> > diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniban=
d/ulp/rtrs/rtrs-clt.c
> > index de226e6ba1246..5ef912a472cda 100644
> > --- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> > +++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
> > @@ -436,6 +436,19 @@ static void complete_rdma_req(struct rtrs_clt_io_r=
eq *req, int errno,
> >                       if (err) {
> >                               rtrs_err_rl(con->c.path, "Send INV WR key=
=3D%#x: %pe\n",
> >                                           req->mr->rkey, ERR_PTR(err));
> > +                             /*
> > +                              * No LOCAL_INV completion will fire, so =
the
> > +                              * rkey is still live on the HCA but we c=
annot
> > +                              * invalidate it from this context.  Clea=
r
> > +                              * need_inval so subsequent reapers don't
> > +                              * wait on an invalidate that will never
> > +                              * happen, and kick off error recovery so=
 the
> > +                              * QP (and MR) is torn down cleanly via
> > +                              * fail_all_outstanding_reqs() ->
> > +                              * complete_rdma_req(can_wait=3Dtrue).
> > +                              */
> > +                             req->mr->need_inval =3D false;
> > +                             rtrs_rdma_error_recovery(con);
> >                       } else if (can_wait) {
> >                               wait_for_completion(&req->inv_comp);
> >                       }
>
> [Severity: High]
> Does complete_rdma_req() leak the DMA mapping on req->sglist when called
> from fail_all_outstanding_reqs() on an in-flight request that still has
> req->mr->need_inval set?
>
> During recovery, rtrs_clt_stop_and_destroy_conns() drains QPs via
> stop_cm() and then runs fail_all_outstanding_reqs(), which calls
> complete_rdma_req() with can_wait =3D true and req->ref =3D=3D 1.
> complete_rdma_req() increments req->ref to 2 before rtrs_inv_rkey(), and
> neither the if (err) branch (when posting to the stopped QP fails) nor th=
e
> else if (can_wait) branch (where rtrs_clt_inv_rkey_done() only signals
> req->inv_comp without dropping a reference) decrements req->ref:
>
> drivers/infiniband/ulp/rtrs/rtrs-clt.c:complete_rdma_req() {
>         ...
>                         refcount_inc(&req->ref);
>                         err =3D rtrs_inv_rkey(req);
>                         if (err) {
>                                 ...
>                                 req->mr->need_inval =3D false;
>                                 rtrs_rdma_error_recovery(con);
>                         } else if (can_wait) {
>                                 wait_for_completion(&req->inv_comp);
>                         }
>                         if (!refcount_dec_and_test(&req->ref))
>                                 return;
>                 }
>                 ib_dma_unmap_sg(clt_path->s.dev->ib_dev, req->sglist,
>                                 req->sg_cnt, req->dir);
>         ...
> }
>
> refcount_dec_and_test(&req->ref) drops req->ref from 2 to 1 and returns
> early, skipping ib_dma_unmap_sg() and the clt_path->stats->inflight
> decrement right before fail_all_outstanding_reqs() fails over or complete=
s
> the request.

This is a real bug. We verified it internally.
And as mentioned, it is unrelated to the patch above.

We will send a separate patch for this bug.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123143719.93=
8876-1-haris.iqbal@ionos.com?part=3D3



--=20

Regards
-Haris
