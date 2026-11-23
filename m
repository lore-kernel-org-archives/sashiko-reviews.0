Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795445569;
	b=LzmuLbEFUvwcVyZ/LKVmkFkSr/nsmXfo9N4NiNRF5ZT57ZuYozNyOEw+8nb1XEkrCkwy
	 Et96w7TfcDVrvYJQUPIfSQFfoAxdnjm8oD4FdnYzmZX1VKKWrrH5ifpQRL4Z915+KErhg
	 J6CSi+yaZf6orXjSGmBx53lP99CsKfeKstF7A6LAhPyKg7XrC16wn5m8laWX+C081QYYb
	 T5YhMge8DnxToW29c0r1DKmiVIbG2vSQ80SJUdXhgS80P0P+g35DhtN3CIEOzyjtprYI9
	 yFlVEuC8g7w63UDG3SDb1GImCrBe84M9CZo3ab/ZkIJcGb/lbY8oDCdq7sUYhPuPeZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=YR35Dp1NLw39mTcwi+476hcYYIrY3mzPrCnM7jI11Vw=;
	b=V1995dp/eRxQP43Ruk8OW2oTS2Gt4BYeBcygUcp0BMhomBhS41JawSLftFqdDHEk72zL
	 tYFgYMt89tzeTHb6MBXmy9Mxlaqcn/pGCxR/WT7Rk/Pr3zU/gr6HUa+2NhmVSIPBIWXME
	 CSZiwFllJ+OxZqE4Ykdvhmp/22OtXZWhupgIVywFWNPdQttHggkkfmhVNcEcD/BoFnp5K
	 qRjh0KuaPnyzXfnVFpf/ltxhsEGfv76u013AdJf0i/WzwgFhxcT4B5cAz2IQKPcD/D4Ze
	 wzEyfwYfMiPNTinhvHy+caq7J3WHT2nfOVRd1Uvc/p7lVqRwBF9GtPWkwA1ir9iZhVw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="gU/lVzXp";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 446A9606A321
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 14:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 446A9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gU/lVzXp
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-921375f52b8so36939516d6.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 06:52:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795445568; cv=none;
        d=google.com; s=arc-20260327;
        b=KBE92vxxGftevdJg+6te+z4416VjOSOzV3msO3TwcC3XaEzlBfCU6VQKa+GrRC7oop
         yvcUCYWHF2WIRBdeIUV6BOyuwEAA27r0VZ6Ay/hYrlKBwBuAe+/ZHtis0uyvGebVkI58
         Ftobsf6RWI2beRwWd8zwrEYUKr0o9yZmY3oaLsHSxbnIbjxQRR6i2ejpiIoHYR/ueVBy
         1awPBj9xT4dip95IpNmqcWde5NWUc2rfQaQ4kKH6jbfILxBD2QwcWIH0DKuNWZLHfJMi
         u5mfbbuoRGe+Z2EvrPm4UAS5S0nGd/QOrFO1Z6UOfVCGTdi9H6qIY+cZBFgmd+uQtsTU
         yHjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YR35Dp1NLw39mTcwi+476hcYYIrY3mzPrCnM7jI11Vw=;
        fh=Je+XfjZZELYMeUFG782y9M4oZFPTVtwBgMoamcbwTg0=;
        b=GcTsg+o3ZjnLpjNL18DA4RQSpRX//uSEvzOqq3mcVH7M6olHEKGHznQMPZ3Q0nOfmA
         fPuBSGmoQLL6hEkRx4iEhITBZ/wFjvmpIqxmoD38xVvbdFjwy2m24lDcACswWJIWiJfv
         G8L4Ytt4AMeuZ/UQqtfZLnIgkApbl24gCncpJjtuymkqQPFh3Ix7BbT0JhalA7w0TxJg
         J3+IWOrD9I6dizxc24cDNVS4rSZ+ENcNVRUSf2ZGw8UuekOMJ+ZpP7RjKbT0MjCI1198
         ag6pGvV2xcHCci027Z0wgECQZ9P2M/4fAawMpG21Ufj6qm1X7L3kkEXb9G+84bM/82Dh
         ZWSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20260707.gappssmtp.com; s=20260707; t=1795445568; x=1796050368; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YR35Dp1NLw39mTcwi+476hcYYIrY3mzPrCnM7jI11Vw=;
        b=gU/lVzXph8RQA2/42bWjChc3t2LKBPG4BVc3vqo1HzdarWRTtk8ceGrrpM1LK1GbCR
         +zhsbZ420xMyj2pL2vTpyyQ8NJHD6qoh+ou4V59Jx4z3Eo4S5A+HzzB1weQUYgEIiuUT
         qK+nGEcFYB93jAi1TAdkp9EOhAv5Zx9CcUPkWVgeSeZYvn4gyZypuoPY3IGtYr+CEQbn
         xTCshWcQ/8i1a46JvcaC0H6jdbnFcUr/cr6weBf+SlkD3w5dKgZEDMy8VR60uX7HDZsO
         aD0toPuF5F9lNlwbXHGA8Ntkf2pmEmXhWIm2rOR/xENeb+I8Zphzg/rWRC3j+0koCfxw
         YxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445568; x=1796050368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YR35Dp1NLw39mTcwi+476hcYYIrY3mzPrCnM7jI11Vw=;
        b=mU9HqA0qDgSSDkUab2dIReLUCUSsxiYHiW8OEE4EsENe7hu+4EKZdZ6qKvryHcVfdc
         AqLeb5DgTxzVqKXlwpjWSdi00MYUwGz2Qb9U7kPKR9xbQJNUnoaFoTa+NTGPaP+XnPGs
         k8BDrsdYCUqJ4EhecqaLlzLY5uRQZp2+vZBBDzSmg/gGITXqA3WOuXpNXFojbB86m2XJ
         ozr9EHgCwUXFr+lCqYCcbAcfw/y8ElY0JSHc+dvTOIW98Hz3ec7QGHQC27/Hqu5BkuKZ
         HM1DRw/aSZ5V5KUcNPVjgc0IR2k7iDktzRY8oj0jZX5hLHmK5kO+EIrxlzL3vzc+tkdx
         BJIw==
X-Gm-Message-State: APuU4Z9uagfhEwQGmaFlg/idLskOp55T6Kl/0TD4yUivJIO28q0eAgJX
	c5wQ4naDVNt3hxyz1eWKoUuzHgKY0HZExPyWmwW2wGQa619e7ZIr9w0gm1sNyMIGQhHjcGq6ACu
	HrieJUiVUben5M1IfgIoCHCY4eRTRscFfqZA15XPIWA==
X-Gm-Gg: AZFdTZcyuIVQexAmfN99zPROAXufJk9B8K91V6EHh5oV+3gwXbfteIPHpJ6/a9emBFx
	K/suAme/97sfaZW14+UG+GMPw8c0o7FywCHn/Z/nUc0HZwXJmvTcc+0E3i2Y9eucH5V69huB/JO
	LGEj3ml6NWU0ASI90z2LPdrDAzKujYlQED2A1lUuZJIF6pcIMIK785tD/IeQBNe8SC0B4YIhB/r
	sX6get1iPrJ52phBS2PBTOAy+32jiknvNR4AxatnMMdsg/xG1nbB2wBhQTIVtAf3ojRxysZdGPa
	ANPqToKiBR2pbIzJSo7k8R8BVl7huqtIDevHJ6NH4w447jm5KGRlmiNkNQ6ZmK78P0vcTyIv84m
	7yWSMltxxVAXIDQ/9KwUYEqsNn/lUsIyBZxtZc3mq0NfcaxbAvGDESzl9daRoqV3IgtKSSyqhaQ
	VbgNT084w4iZeSSHf5S4q1nyCbZuu8gJns4+c1LR8dIL9IQOUP4M8FSER8gekThuNq4RMAsG9ji
	xxnj00owxsAIIiR
X-Received: by 2002:a05:6214:ac3:b0:921:3a0b:673f with SMTP id
 6a1803df08f44-9213a0b67admr182677736d6.7.1795445567858; Mon, 23 Nov 2026
 06:52:47 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123140625.64448-1-astellman@stellman-greene.com> <sashiko-outbox-229387@kernel.org>
In-Reply-To: <sashiko-outbox-229387@kernel.org>
From: Andrew Stellman <astellman@stellman-greene.com>
Date: Mon, 23 Nov 2026 09:52:36 -0500
X-Gm-Features: Aa3M54rc4F-5TClUKcb827X9bXMXUA4uNEqDeOxn3kfSSV6VCDKaILTKwoAOCSU
Message-ID: <CAChPuV_NicbAdP74Zej1ko656Uqh2tuTrTP8P8-48DJE74nmzA@mail.gmail.com>
Subject: Re: [PATCH rdma-rc] RDMA/rxe: Fail ATOMIC_WRITE WQEs whose length is
 not 8 bytes
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks. This is already handled by a668a8564748 ("RDMA/rxe: copy send
WQE to kernel buffer before processing") in the rdma tree, which
clamps the ATOMIC_WRITE resid to 8 bytes in req_next_wqe(), so please
drop this patch.

On Mon, Nov 23, 2026 at 9:19=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] RDMA/rxe: unreachable atomic write length check in
>   rxe_requester()
> --
>
> commit 53a7ca51888beabddbfd557ad8447b0102b0d59e
> Author: Andrew Stellman <astellman@stellman-greene.com>
>
> RDMA/rxe: Fail ATOMIC_WRITE WQEs whose length is not 8 bytes
>
> This commit adds a check in rxe_requester() to fail IB_WR_ATOMIC_WRITE
> WQEs with IB_WC_LOC_QP_OP_ERR when the payload length is not sizeof(u64).
>
> > diff --git a/drivers/infiniband/sw/rxe/rxe_req.c b/drivers/infiniband/s=
w/rxe/rxe_req.c
> > index 6e01fb18893bf..962aef824ccc2 100644
> > --- a/drivers/infiniband/sw/rxe/rxe_req.c
> > +++ b/drivers/infiniband/sw/rxe/rxe_req.c
> > @@ -824,6 +824,11 @@ int rxe_requester(struct rxe_qp *qp)
> >       mtu =3D get_mtu(qp);
> >       payload =3D (mask & (RXE_WRITE_OR_SEND_MASK | RXE_ATOMIC_WRITE_MA=
SK)) ?
> >                       wqe->dma.resid : 0;
> > +     /* use the local copies: a user QP's WQE can change under us */
> > +     if ((mask & RXE_ATOMIC_WRITE_MASK) && payload !=3D sizeof(u64)) {
> > +             wqe->status =3D IB_WC_LOC_QP_OP_ERR;
> > +             goto err;
> > +     }
>
> [Severity: Medium]
> Can payload ever differ from sizeof(u64) here when RXE_ATOMIC_WRITE_MASK
> is set?
>
> Earlier in rxe_requester(), req_next_wqe() copies the WQE into the
> kernel-private buffer qp->req.send_wqe.wqe and forces wqe->dma.resid to
> sizeof(u64) for atomic writes (added in a668a8564748 ("RDMA/rxe: copy
> send WQE to kernel buffer before processing")):
>
> drivers/infiniband/sw/rxe/rxe_req.c:req_next_wqe() {
>     ...
>         if (unlikely((wqe->mask & WR_ATOMIC_WRITE_MASK) &&
>                      wqe->dma.resid !=3D sizeof(u64)))
>                 wqe->dma.resid =3D sizeof(u64);
>         return wqe;
> }
>
> As a result, this new check is unreachable, and an IB_WR_ATOMIC_WRITE WQE
> with wqe->dma.resid !=3D sizeof(u64) will still be clamped and sent as an
> 8-byte atomic write instead of failing with IB_WC_LOC_QP_OP_ERR.
>
> Also, because this check runs after check_init_depth(), if the clamping i=
n
> req_next_wqe() is removed, a malformed atomic write WQE would consume or
> stall on rd_atomic credits before failing.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123140625.64=
448-1-astellman@stellman-greene.com?part=3D1
