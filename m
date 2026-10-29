Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793250590;
	b=VKYKftd/UAtLv3OUxBQW7VVC+wLJW/+g01w0RaEh7VTShGWShRHPWRUNRJrdV8wG5Kpx
	 bcbCA4SJxpUcN9Fa5DD90zSZfMHzV31XUatq9pu70szb6y2/GS/tNJsLwS+pW2LkOr/sR
	 5N9NJI+fAZvx6F4lQAUKOTEX+PNRYYh6jLlWgAQTKdi7nYGeuyzAwiSox27BL0WPwZ7ga
	 9RilMQ57e0Vh4/SU9EGFD8IvOaM4dTukrpOQq7b1j5GF6E+WdIQjMBOIsP/AL1WoHsV2l
	 dth8vQaEe0b6yaYzCkW4ob69Jkb+oBCQISei+d2NOiW/5RTYZkAPELSLz56XidRriZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=kpw8TTYWKB5hnWuUygH4ZRFIeIPvKSlqcY3nCnns/2g=;
	b=0bTWsKwYkvzVJ3X9LGWrv8Yx3voO3UrOIDs24mrYbHg1YAzfWwR1ZkUcJ2r+qqR8lxZh
	 lEijJGrhXc3ldqj7FGwrKMvTT0qvB7IreeI076xACuOf25fPU/ViRROwcrMSUriTSnCD0
	 nA9d0t5Lhy2Nn58grxp/1JA6IhaVcnbrdhHHqyaxfS1pRpluxfZegoFpmkn/w8TZWINfy
	 E/VVFYiAvsDc4Mr9p71/A2REKrNQqHHYBVU7J7wHePMtHGJ0jWTmVxQ5NzvQZzum0VMB2
	 VFYt0CDL2/c+0ZJpnXZSoLJNxtNgj6zL1vGcMfN0ErvRv1CxGgYPg0C0ZSooFK7TZmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMiPpfgO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9618A606A31C
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 05:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9618A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hMiPpfgO
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso2138243e87.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 22:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793250588; cv=none;
        d=google.com; s=arc-20260327;
        b=EiemG0zWruSv/1IL5y+1Czn3dry8jJoz4LLNtajSW8JI7wIgLUudIH+TpTR2bBGk0c
         nPTO6TNQRkxguzA4VdrAZlpQodf9H0A72yd8ax8okrGdsQLlcsG23J6m3qU4MhrtD1lG
         oEreninEe4kUa8ZpGiyaiFAMU0s0o9TxEJYIcPpuvSRKGtD1fG4EzOdQPmSZ0XhcU2oX
         +l4WQ0zbvmq7m5C8RhUqVNlUAckUbUAVufLaRvw7AQXVdjnzKTPc5nPMbPONyaA+wFf3
         t/eEp/1Y6iLFR437oov6ILRmG+bBEEAOYW+gSWz26vj9eUO9MLUXPVKhJ8NwFl5ystS1
         b3ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpw8TTYWKB5hnWuUygH4ZRFIeIPvKSlqcY3nCnns/2g=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=r27eXdsXO+2YLP8pReVh+vEUSMcXfD6Gy6nCIDS6GAOdntIXmJ45w8qUdb1sBT7pPj
         FfSpKTW5LnEOSrAp4MwwvR5Y37H/CRU2B3aRe5ysKWoJpfeS5lzQAaS0oCJRFGeTvugR
         fiu1O0iCMawFDUmAPS5U8ouxSKmDH/9dJnwol8ysI1RCxWPe07VCyGO719Li6evl2cum
         FL/vuvr0mJIKlSKeNN9O+7UFGz8ZGCesEnus6AOeP01kpAjwitFr0HXFu11kwjHjkMP0
         F2Q2EWy+dN1fhD/+CLPgApug+7Yq6+meqRlHWGUqueowuQ2TZxka6c/JVjETf1xI6CXT
         t3fQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250588; x=1793855388; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpw8TTYWKB5hnWuUygH4ZRFIeIPvKSlqcY3nCnns/2g=;
        b=hMiPpfgOUYCcVUki9nMenELkeskdukbzs3nKA1G6MMwEuBg4iLvG+GvH3t4SerZBzJ
         3NLD/wOvoi1Bm6jw/XAKp3A4yRH3puTfhzTT1lZci2Q1JUObvnrYVrTYiNvxpRtuGb5S
         B2KA/pAOo1TDDFJkXwrw9utkzwiNuh4MT9kvUWh/ufoO7wfmWfqofolpJHidzrbFWus6
         f7viQaUyTbhsj9iSLWl7sHJaO37CW+nLJTEqz1QVHGEHb65dA7Me+JsQP1T4147nF8wn
         URhb2ziz/vsAsnrYRbPA3wif6ryH2RKSO54fCoPDGP5/9bVVhhG8McmK/7M7UVP5M747
         iSpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250588; x=1793855388;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpw8TTYWKB5hnWuUygH4ZRFIeIPvKSlqcY3nCnns/2g=;
        b=fjOakbmq/F1v0h2jXkx5PtQm+VdB2hr03ibPee4UOBzjx0WyNmXGTNrIogkDfd8Ujt
         9sLMAeNuGT53HTaUrV2vOvGcdad61f/h+zMF42s9wffvkI2WE7s3VPwJpQW45TVmD/sM
         ifxcNUODZgpwOV7Br8atkoz8LvKYyr2Clx6esAw5RWr8dlpphg6s6tk8RIehxKTJDxku
         68h7hRxAg0p43pDfblP7qV+LaDYHWy4HOvvc0xIEuviL3Esxrm3onuVwfuvcg6fnRu7L
         8PNw80QY2OGOrZynYNufRSjjlaxat3UbTfuacIt5vP74NbcCv9zIzp8GOLB57fadjzze
         /6Vg==
X-Gm-Message-State: AFq9FYIJe73ZAS5Ip9DLTtWflfFWAihNndYc8e9QI0D3ZgWnooKYmd2x
	DSJArSy30riGVh/Qt5+yFNdL7QUN720XnFb4KLWy31hgDhvsJJ7+0BIopr5i1UwOofNiHfCVvFD
	hqWmMj6Qwg0ncGn21mPJrpkRr32zf78SReA==
X-Gm-Gg: AYBFou20lSw2XzalLpLN/fzF8rUnZM/4SdfNwDShKYpU82ln9H8TQr5DwRBk+sfKVWS
	JiecGkc2OMlHewGv6I+OumtoHQGVnKyz9CD7Lxqp5gsYsBr/77HW81K56orEmAhym7/imnEQAkx
	wxa11Jw0G44ob3P9rJbnEgyJTh3qNsaJFqvcoFKoswQxNyYiumAymLhrqNVuKr59mycGTdkUeY8
	SZcyd8kQuQa+G7Wsu4p06NsOeBLXLUjvehfbmNXWOFuVhiP1g5Nx7SS1S84RO8MOe+AletTwAG7
	jY3PLfVl2SnCBvce7d6jU8k4c1gJxg048ll+vfeyaOurIIAyQtT3WFu3wS5Kk/yplb/oFjC2OSa
	LUb06V+7smh8YunnwQnPhqHU4rfkIfdXEWOEG
X-Received: by 2002:a05:6512:2254:b0:5bf:bbcb:5090 with SMTP id
 2adb3069b0e04-5bfcad1735cmr1673625e87.11.1793250587589; Wed, 28 Oct 2026
 22:09:47 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028030503.17923-1-kanchanapsridhar2026@gmail.com>
 <20261028030503.17923-4-kanchanapsridhar2026@gmail.com> <sashiko-outbox-188655@kernel.org>
In-Reply-To: <sashiko-outbox-188655@kernel.org>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Wed, 28 Oct 2026 22:09:35 -0700
X-Gm-Features: AclHuK8nR-G5FLP-nKgfLbRVgykWEd41gXMbkberCRHNZZZBPGk3kNc3GrhEkxw
Message-ID: <CACpmpodu3C=uYH6dmFM-xkvdJxiRDjamRKs1Q4jU6_KKjFWNqA@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] crypto: acomp - Add trivial segmentation wrapper.
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, yosry@kernel.org, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 8:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Critical] crypto: acomp - missing async check in crypto_acomp_compress=
() fast path
> - [High] crypto: acomp: uninitialized state->src/dst restore in acomp_req=
chain_virt()
> --

Thanks for the detailed code review!

>
> commit 7144b07b2cc5b6704699fb53fac44c4270d31f7b
> Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> crypto: acomp - Add trivial segmentation wrapper.
>
> This commit adds a single-segment compression wrapper in crypto/acompress=
.c
> that stores the compressed length or error code into req->dst->length whe=
n
> req->unit_size is set on transforms that do not support segmentation. It =
also
> adds an inline fast path in crypto_acomp_compress() for single-segment
> scatterlist requests.
>
> > diff --git a/crypto/acompress.c b/crypto/acompress.c
> > index c8b4b8589769e..c55b0e8eff3d8 100644
> > --- a/crypto/acompress.c
> > +++ b/crypto/acompress.c
> > @@ -166,14 +166,20 @@ static void acomp_save_req(struct acomp_req *req,=
 crypto_completion_t cplt)
> >
> >       state->compl =3D req->base.complete;
> >       state->data =3D req->base.data;
> > +     state->unit_size =3D req->unit_size;
> > +     state->flags =3D req->base.flags & (CRYPTO_ACOMP_REQ_SRC_VIRT |
> > +                                       CRYPTO_ACOMP_REQ_DST_VIRT);
>
> [Severity: High]
> Can moving the state->flags assignment from acomp_virt_to_sg() into
> acomp_save_req() corrupt req->svirt and req->dvirt when a request is
> configured with acomp_request_set_src_nondma() or
> acomp_request_set_dst_nondma()?
>
> When a caller sets up a non-dma virtual request via
> acomp_request_set_src_nondma() or acomp_request_set_dst_nondma(), both th=
e
> non-dma and virtual request flags are set in req->base.flags. When
> crypto_acomp_compress() or crypto_acomp_decompress() calls
> acomp_do_req_chain(), the call chain is:
>
> crypto_acomp_compress()
>   acomp_do_req_chain()
>     acomp_save_req()
>       state->flags =3D req->base.flags & (CRYPTO_ACOMP_REQ_SRC_VIRT |
>                                         CRYPTO_ACOMP_REQ_DST_VIRT);
>     acomp_do_one_req()
>       if (acomp_request_isnondma(req))
>           return acomp_do_nondma(req, comp);
>
> Because acomp_do_one_req() returns early through acomp_do_nondma() withou=
t
> calling acomp_virt_to_sg(), state->src and state->dst are never initializ=
ed
> from req->svirt and req->dvirt.
>
> When acomp_reqchain_finish() then calls acomp_reqchain_virt() in
> crypto/acompress.c:
>
> static void acomp_reqchain_virt(struct acomp_req *req)
> {
>         struct acomp_req_chain *state =3D &req->chain;
>         unsigned int slen =3D req->slen;
>         unsigned int dlen =3D req->dlen;
>
>         if (state->flags & CRYPTO_ACOMP_REQ_SRC_VIRT)
>                 acomp_request_set_src_dma(req, state->src, slen);
>         if (state->flags & CRYPTO_ACOMP_REQ_DST_VIRT)
>                 acomp_request_set_dst_dma(req, state->dst, dlen);
> }
>
> won't acomp_reqchain_virt() see the virtual flags set in state->flags and
> overwrite req->svirt and req->dvirt with the uninitialized state->src and
> state->dst pointers (while also clearing the non-dma flags), causing a nu=
ll
> or wild pointer dereference if acomp_reqchain_finish() then writes to
> req->dst->length when req->unit_size is non-zero?
>

Herbert, can you please take a look at this and suggest what changes
need to be made here, since you are the original developer of this
portion of the patch. Thanks.

> [ ... ]
>
> > @@ -279,10 +289,27 @@ int crypto_acomp_compress(struct acomp_req *req)
> >  {
> >       struct crypto_acomp *tfm =3D crypto_acomp_reqtfm(req);
> >
> > +     if (likely((req->unit_size =3D=3D req->slen) && acomp_request_iss=
g(req) &&
> > +                 !crypto_acomp_req_seg(tfm) && !acomp_req_on_stack(req=
))) {
> > +             int err =3D tfm->compress(req);
> > +
> > +             req->dst->length =3D unlikely(err) ? err : req->dlen;
> > +             return err;
> > +     }
>
> [Severity: Critical]
> Should this fast path in crypto_acomp_compress() in crypto/acompress.c ch=
eck
> !acomp_is_async(tfm) instead of !acomp_req_on_stack(req)?

Thanks for the catch! Yes, I will add (!acomp_is_async(tfm) &&
!acomp_req_on_stack(req)) here.
Since zswap is the only current user who, with this patch series,
submits the req as SG lists, I was assuming that async algorithms
would set the segmentation bit, and avoid this short-circuit. But
until that happens, the above check will take care of this.

>
> Callers using asynchronous hardware compression transforms (where
> acomp_is_async(tfm) is true, such as qat, hisi_zip, or iaa in async mode)
> allocate requests on the heap with acomp_request_alloc(), so
> !acomp_req_on_stack(req) is true for asynchronous requests.
>
> When zswap_compress() submits a single-segment scatterlist request with
> req->unit_size =3D=3D req->slen to an asynchronous transform that does no=
t
> support segmentation, this fast path will be taken instead of
> acomp_do_req_chain(req, true):
>
> crypto/acompress.c:crypto_acomp_compress() {
>         if (likely((req->unit_size =3D=3D req->slen) && acomp_request_iss=
g(req) &&
>                     !crypto_acomp_req_seg(tfm) && !acomp_req_on_stack(req=
))) {
>                 int err =3D tfm->compress(req);
>
>                 req->dst->length =3D unlikely(err) ? err : req->dlen;
>                 return err;
>         }
> }
>
> When tfm->compress(req) submits the descriptor to hardware and returns an
> in-progress or busy status, won't this immediately overwrite req->dst->le=
ngth
> with the negative error value while hardware dma is still in flight on
> req->dst, and skip registering acomp_reqchain_done() via acomp_save_req()=
 so
> that req->dst->length is never updated to req->dlen upon async completion=
?
>

The augmented check for async algs should take care of this.

Thanks,
Kanchana

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028030503.17=
923-1-kanchanapsridhar2026@gmail.com?part=3D3
