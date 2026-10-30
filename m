Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793340964;
	b=T5H4Jm1ihHQPQRzRB+4Jgq/RSyGnfabN2SELx9E0oFbgn8E24CKPbS0X1qUtEvvEf8cX
	 aWpNpW3c44QP548Xb97JU8rW+5XFoge+fxRi6QuNZXpcgq3PSkzg/9L8c+W2IQ8w0jidZ
	 OmQlGVHL2dmdKzEsWOuYoy+lC0M1UuLKltm/WtPLDSNyRp1jnYmqDhAWwiagXEAxCqPTH
	 +8JLsQ/kav6IazW9Xvonjr9zAEqrKlsdzAT3phCBcJQvjkt1URsJB+AzypuzXxMdRdj6c
	 PkeDMYeiaCE+zpRpzhhdNTTNa3WMwe5Tm+er1Crnc22mQ3J1/8DQA5cHjUF9MoIbgPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793340964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=IVt6n+ttdzDHkN2oBzonKaL5TpJmrmsrnCuBXlPWHDw=;
	b=yvlqvaBPqy2/EjXWIUw7fRDSlffVxyRa3iCWvdIS210iSO0q7ivOsqKxyONU9DR2pImS
	 RVQK74FUCQglLm8THLirEq/KnrY5gpOeSM7EW3KPfCY8CfM/NPTwk2ni4lldNh4NWKmJ/
	 LiqI0qe8v4uNYCChjPYV8Vyz1NQ1sHz0BLdAPY3b9bBsDw1469aXoj+gDEcx7BouuGbCO
	 QgIzCGoDJMKY6rVUpy1HqTUZGLjrsFKTFGE73ZQ1M4qbIOZWYi6fSm+DjIJ/rdcwGjQyJ
	 BYd26pVHH0MCA6LjK749awId4M2+PXqIWpxfbjGP0tJ1c+A0QPjABK1GtsvT7rRAEYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EP5N73n6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.181
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D237C606A31D
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 06:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D237C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EP5N73n6
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3ab3dd9667dso3190411fa.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 23:16:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793340962; cv=none;
        d=google.com; s=arc-20260327;
        b=o7lJkm2NteHH2brMxsmBwg1hJjSWkMWlCp6PVWaZsFzeReKvW5Bzf/RqST8WfU89+9
         VcoWb5lJQ+dsLML8t5pjAS4ch7sS905RWe0BGfeAt2X7y8f+ro1pB8Z+cPejZnSCMsxW
         Tds6mSM6toDn5NtBk6I47UAMmz7OS+zdHVgMQpuJ1u9FVZhp+/sETCD4Fw6HGmhbLmo1
         irLP4108WVvos+9RWrXQCec8C6LGP0RTrZtj/Trx5ln9e0wM/M5CQiOVf+EkJEt8j2k5
         /iLMvvtO1qlEJC1QUh3lM+DuDVTXQI/NTPVCD5zqMm91UMTPel3wtKci6KmbN5+6aOms
         HbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IVt6n+ttdzDHkN2oBzonKaL5TpJmrmsrnCuBXlPWHDw=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=Um6fQNWtJ8Dmet9b2AAXMLte7D4NQ66JFUDOoYfY+ah/TNCHr70MDoGQeTHAINJJ5s
         ik8yDqB1UC3lS3pm85/CGBkJbn5x+qrCWHb5PRl8WUbhtrspPRPgtDmhRRltNrIxy5ET
         XOa8R8vPCvXogGHki/8Ua775M6zQ9i//Em95jBwr4WeBv2c19S+rXXoEye6y4Zs9M332
         cpPMcB73v9952AqCvaaVCTM/VCECo9z0cx/2ZU8M6f0pQLvq0K+VQuHdncotedR8/6mn
         ABArHn/PTMAUo2oEhTtz0zIZkQAUBJFMDFHBZhJqoxX4LTFKzHq8ZndxkN7kmRwq+XPd
         q3vw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793340962; x=1793945762; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IVt6n+ttdzDHkN2oBzonKaL5TpJmrmsrnCuBXlPWHDw=;
        b=EP5N73n6Wrz5VNypMYNkoCFSUCpaT2q5Ze1lRJAW1WK973K5TH0xx7ZF1g/Kavb/je
         QW2/NJ168O+rI22MVUeRCQ0ILLwOfJZHx7EfGz8aDhU6xVgxQfRDW6WEo8O1ZKhHp6t9
         vYTZV5a6MzN7naLpvsHu7+4LMUtKyCBwX+uW4XwPJSnp7+lOHo1dR7Rk58KCSoiD3jTn
         FfkXBSpjVt97IDJCaPplQUikl7Vg5ykC2UdsELeSOfJZ6/PiwfgV30NeEGOCg6WYYTBz
         zgp3sm424dAiy77qGY9+XRWCKJLBY0Pmhch3T6Xnjg3vpvPE932qx54HHjlrRz8niCDH
         00Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793340962; x=1793945762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVt6n+ttdzDHkN2oBzonKaL5TpJmrmsrnCuBXlPWHDw=;
        b=Dorh3RMJjI0mo0riRVWn1t/h/bHk+yMVFscQaVANRCuCjukg4RlBYK0/JRGBCwlltj
         zCH+qYYJ+zLVzKXOXPYyU9qC06Dp5r7Zje3AhHgO2ssJILA394bm+OfAWai4wMFH+rtD
         wLGw91OElda8wkw3r4CbPIoAuskuzcgS3vf7QODPeX7dlXYVj123qIe0TmlactfpRcbA
         nFJtSkMbnon8ZOiBOPB6krC3Xvx4xnwtes4a9ZegPo7HdUoGC6NLrvzO6NuTKd8+ujue
         uRSMS5uy8K2ZZqbFtc1BK6KyzAQg9ukIerpUlII+RI4N6wWI42EoYGe2oRGZpG9EUkqT
         xJ9g==
X-Gm-Message-State: AFq9FYIyX/r0KtVngPwnZs3rrD9/mE2IahfusqTDdo9ZEG7eQV09YZRk
	PVnFOY5VrwyfBj1XrqW2CHbDRWJTEPzM7l0xaI/Ig6vpxbygGtiZwGVfh+C8IO/VKkBDg+T3RI/
	s3zr+T4s0jlwlXc1/4vLdTEVu9eAJG8X+aj1V
X-Gm-Gg: AYBFou2FeHGSdH7FKoBsbaVsIrRol345ogTpvgbCogdvPT/brmg1VSFiCSX/lp60sp+
	4MQAYlYLqd+NYEUkOtzo9Ta8fkuyiVIt5v+XwS6CqgVqwVDZ5K1Iv0jqqCh0lPCi5jAPyNWzsDB
	XN1uJDQMRDTefqg+mSBNpRiwwlNohQir4akR7IMjTa/V8AGd56M0ohEpuNNdJcRg1d0iHPKMqYc
	v5+CL54S75lbALxO16+CEKAs/8JB5/aBD2GAjqhBhUbIQlI/LhqMeaxbmf3amg+CAfkSqHMgIai
	5pqKkYSyWB56hLyOu+vvtY7x7ADnUSBD0nkWvQitjz45wvXHsHcCEs6l/CRUO50ekRfGGAgILZ5
	mth8ODZZGfKM07oGTkEJCNl4C/TlUKXPv+x0pAA==
X-Received: by 2002:a05:6512:6d3:b0:5bf:cea4:4156 with SMTP id
 2adb3069b0e04-5bfd956510cmr376884e87.17.1793340961808; Thu, 29 Oct 2026
 23:16:01 -0700 (PDT)
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
 <20261028030503.17923-8-kanchanapsridhar2026@gmail.com> <sashiko-outbox-188659@kernel.org>
In-Reply-To: <sashiko-outbox-188659@kernel.org>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 29 Oct 2026 23:15:49 -0700
X-Gm-Features: AclHuK8qeUEao5lE4vYKNlUTpi7FFlA0-3bCltLoe5if13IPMWkhagm4XDB1Yjk
Message-ID: <CACpmpofOE797D7f4YGZEJ2jtHn08d9Jo8Ya3cdV8h9UL5hUd9A@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] mm: zswap: Batched zswap_compress() for storing
 large folios in batches.
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
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
> - [Critical] mm: zswap: unclamped nr_batch_pages in zswap_compress() caus=
es OOB and crash
> - [High] mm: zswap: zsmalloc handle leak on partial batch failure in zswa=
p_compress()
> - [High] mm: zswap: invalid and unreset dst scatterlist lengths in zswap_=
compress()
> - [High] mm: zswap: zswap_cpu_comp_prepare() returns 0 on buffer or sg_ta=
ble alloc fail
> - [High] mm: zswap: zswap_compress() reads -EINPROGRESS sg->length for as=
ync acomp
> - [Medium] mm: zswap: zswap_compress() stores PAGE_SIZE outputs when writ=
eback disabled
> --
>
> commit 61c906de6e16dcc53db7f835142f9c05558dca5f
> Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> mm: zswap: Batched zswap_compress() for storing large folios in batches.
>
> This commit introduces a batched zswap_compress() implementation using
> per-CPU scatterlists and refactors zsmalloc allocation into
> zswap_update_entries().
>
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index c8890e8a9b836..4476fb4aeb5fd 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
>
> [ ... ]
>
> > @@ -944,6 +956,21 @@ static int zswap_cpu_comp_prepare(unsigned int cpu=
, struct hlist_node *node)
> >                       goto req_fail;
> >       }
> >
> > +     acomp_ctx->comp.sg_table =3D kmalloc(sizeof(*acomp_ctx->comp.sg_t=
able), GFP_KERNEL);
> > +     if (!acomp_ctx->comp.sg_table)
> > +             goto req_fail;
> > +
> > +     if (sg_alloc_table(acomp_ctx->comp.sg_table, pool->compr_batch_si=
ze,
> > +                        GFP_KERNEL))
> > +             goto req_fail;
> > +
> > +     /*
> > +      * Statically map the per-CPU destination buffers to the per-CPU
> > +      * SG lists; crucial for performance.
> > +      */
> > +     for_each_sg(acomp_ctx->comp.sg_table->sgl, sg, pool->compr_batch_=
size, i)
> > +             sg_set_buf(sg, acomp_ctx->comp.buffers[i], PAGE_SIZE);
> > +
> >       /* Skip the per-CPU request when decompression can use the stack.=
 */
> >       if (acomp_is_async(acomp_ctx->acomp)) {
> >               ret =3D zswap_acomp_req_init(&acomp_ctx->decomp, acomp_ct=
x->acomp);
> > @@ -960,92 +987,161 @@ static int zswap_cpu_comp_prepare(unsigned int c=
pu, struct hlist_node *node)
> >       return ret;
> >  }
>
> [Severity: High]
> Does zswap_cpu_comp_prepare() return 0 on failure if allocating
> acomp_ctx->comp.buffers, acomp_ctx->comp.sg_table, or sg_alloc_table()
> fails?
>
> Earlier in zswap_cpu_comp_prepare(), ret is overwritten by
> zswap_acomp_req_init():
>
>         ret =3D zswap_acomp_req_init(&acomp_ctx->comp.areq, acomp_ctx->ac=
omp);
>         if (ret)
>                 goto req_fail;

This is resolved as part of the error return issue flagged in patch 6.
I am making sure that acomp_ctx->comp.buffers, sg_table, etc. related
failures set ret =3D -ENOMEM before "goto req_fail". Thanks for the due
diligence.

[ .. ]

>
> > -static bool zswap_compress(struct folio *folio, long index,
> > -                        struct zswap_entry *entry, struct zswap_pool *=
pool,
> > -                        bool wb_enabled)
> > +static bool zswap_update_entries(struct zswap_store_context *zc,
> > +                              u8 batch_start)
> >  {
> > -     struct zswap_comp_ctx *comp_ctx;
> > -     struct scatterlist input, output;
> > -     int comp_ret =3D 0, alloc_ret =3D 0;
> > -     unsigned int dlen =3D PAGE_SIZE;
> > +     gfp_t gfp =3D GFP_NOWAIT | __GFP_NORETRY | __GFP_HIGHMEM | __GFP_=
MOVABLE;
> > +     u8 i, batch_iter, comp_batch_iter;
> >       unsigned long handle;
> > -     gfp_t gfp;
> > +     unsigned int dlen;
> >       u8 *dst;
> > -     bool mapped =3D false;
> > -
> > -     comp_ctx =3D &raw_cpu_ptr(pool->acomp_ctx)->comp;
> > -     mutex_lock(&comp_ctx->areq.mutex);
> > -
> > -     dst =3D comp_ctx->buffers[0];
> > -     sg_init_table(&input, 1);
> > -     sg_set_folio(&input, folio, PAGE_SIZE, index * PAGE_SIZE);
> > -
> > -     sg_init_one(&output, dst, PAGE_SIZE);
> > -     acomp_request_set_params(comp_ctx->areq.req, &input, &output,
> > -                              PAGE_SIZE, dlen);
> >
> >       /*
> > -      * it maybe looks a little bit silly that we send an asynchronous=
 request,
> > -      * then wait for its completion synchronously. This makes the pro=
cess look
> > -      * synchronous in fact.
> > -      * Theoretically, acomp supports users send multiple acomp reques=
ts in one
> > -      * acomp instance, then get those requests done simultaneously. b=
ut in this
> > -      * case, zswap actually does store and load page by page, there i=
s no
> > -      * existing method to send the second page before the first page =
is done
> > -      * in one thread doing zswap.
> > -      * but in different threads running on different cpu, we have dif=
ferent
> > -      * acomp instance, and compression and decompression use separate
> > -      * requests, so multiple threads can do (de)compression in parall=
el.
> > +      * For each output SG list in @acomp_ctx->req->sg_table->sgl,
> > +      * the @sg->length should be set to either the page's compressed
> > +      * length (success), or it's negative value compression error.
> >        */
> > -     comp_ret =3D crypto_wait_req(crypto_acomp_compress(comp_ctx->areq=
.req),
> > -                                &comp_ctx->areq.wait);
> > -     dlen =3D comp_ctx->areq.req->dlen;
> > -     if (!comp_ret) {
> > -             if (dlen =3D=3D PAGE_SIZE)
> > -                     comp_ret =3D -ENOSPC;
> > -             else if (WARN_ON_ONCE(!dlen || dlen > PAGE_SIZE))
> > -                     comp_ret =3D -EINVAL;
> > +     for (comp_batch_iter =3D 0; comp_batch_iter < zc->nr_batch_pages;
> > +          ++comp_batch_iter) {
> > +             batch_iter =3D batch_start + comp_batch_iter;
> > +             dlen =3D zc->entries[batch_iter]->length;
> > +             handle =3D zs_malloc(zc->zs_pool, dlen, gfp, zc->nid);
> > +
> > +             if (unlikely(IS_ERR_VALUE(handle))) {
> > +                     if (PTR_ERR((void *)handle) =3D=3D -ENOSPC)
> > +                             zswap_reject_compress_poor++;
> > +                     else
> > +                             zswap_reject_alloc_fail++;
> > +
> > +                     for (i =3D 0; i < comp_batch_iter; ++i)
> > +                             zs_free(zc->zs_pool, zc->entries[batch_st=
art + i]->handle);
> > +
> > +                     return false;
> > +             }
> > +
> > +             zc->entries[batch_iter]->handle =3D handle;
> > +
> > +             if (likely(dlen < PAGE_SIZE)) {
> > +                     dst =3D zc->comp_ctx->buffers[comp_batch_iter];
> > +                     zs_obj_write(zc->zs_pool, handle, dst, dlen);
> > +             } else {
> > +                     dst =3D kmap_local_folio(zc->folio,
> > +                                     (zc->folio_start + batch_iter) * =
PAGE_SIZE);
> > +                     zs_obj_write(zc->zs_pool, handle, dst, dlen);
> > +                     kunmap_local(dst);
> > +             }
> >       }
> >
> > +     return true;
> > +}
> > +
> > +/*
> > + * zswap_compress() batching implementation for sequential and batchin=
g
> > + * compressors.
> > + *
> > + * Description:
> > + * =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > + * Compress multiple @nr_pages in @folio starting from the @folio_star=
t index
> > + * in batches of @nr_batch_pages; the latter representing the lesser o=
f the
> > + * @nr_pages to be batch compressed and the compressor's batch size.
> > + *
> > + * @nr_pages can be in (1, ZSWAP_MAX_BATCH_SIZE] even if the compresso=
r does not
> > + * support batching.
> > + *
> > + * If @nr_batch_pages is 1, each page is processed sequentially.
> > + *
> > + * If @nr_batch_pages is > 1, the compressor may use batching to optim=
ize
> > + * compression.
> > + */
> > +static bool zswap_compress(struct zswap_store_context *zc)
> > +{
> > +     u8 batch_start, comp_batch_iter, batch_iter;
> > +     struct scatterlist *sg;
> > +     bool ret;
> > +     int err;
> > +
> >       /*
> > -      * If a page cannot be compressed into a size smaller than PAGE_S=
IZE,
> > -      * save the content as is without a compression, to keep the LRU =
order
> > -      * of writebacks.  If writeback is disabled, reject the page sinc=
e it
> > -      * only adds metadata overhead.  swap_writeout() will put the pag=
e back
> > -      * to the active LRU list in the case.
> > +      * Compress the @nr_pages in @folio starting at index @folio_star=
t
> > +      * in batches of @nr_batch_pages.
> >        */
> > -     if (comp_ret) {
> > -             if (!wb_enabled)
> > -                     goto unlock;
> > -             comp_ret =3D 0;
> > -             dlen =3D PAGE_SIZE;
> > -             dst =3D kmap_local_folio(folio, index * PAGE_SIZE);
> > -             mapped =3D true;
> > -     }
> > +     for (batch_start =3D 0; batch_start < zc->nr_pages;
> > +          batch_start +=3D zc->nr_batch_pages) {
> > +             /*
> > +              * Send @nr_batch_pages to crypto_acomp for compression:
> > +              *
> > +              * These pages are in @folio's range of indices in the in=
terval
> > +              *     [@folio_start + @batch_start,
> > +              *      @folio_start + @batch_start + @nr_batch_pages).
> > +              *
> > +              * @slen indicates the total source length bytes for
> > +              * @nr_batch_pages.
> > +              *
> > +              * The source folio pages in the batch are directly submi=
tted to
> > +              * crypto_acomp via acomp_request_set_src_folio().
> > +              *
> > +              * The pool's compressor batch size is at least @nr_batch=
_pages,
> > +              * hence the acomp_ctx has at least @nr_batch_pages dst @=
buffers.
> > +              */
> > +             acomp_request_set_src_folio(zc->comp_ctx->areq.req, zc->f=
olio,
> > +                             (zc->folio_start + batch_start) * PAGE_SI=
ZE,
> > +                             zc->slen);
> > +
> > +             zc->comp_ctx->sg_table->sgl->length =3D zc->slen;
> > +
> > +             /*
> > +              * The per-CPU @zc->comp_ctx->sg_table scatterlists are s=
tatically
> > +              * mapped to the per-CPU dst @buffers at pool creation ti=
me.
> > +              */
> > +             acomp_request_set_dst_sg(zc->comp_ctx->areq.req,
> > +                                      zc->comp_ctx->sg_table->sgl, zc-=
>slen);
>
> [Severity: High]
> How are the destination scatterlist entry lengths in
> zc->comp_ctx->sg_table->sgl maintained across batches when
> zc->nr_batch_pages > 1?
>
> In zswap_cpu_comp_prepare(), each acomp_ctx->comp.buffers[i] is allocated
> with size PAGE_SIZE and mapped to sgl[i] via sg_set_buf(..., PAGE_SIZE).
>
> Here in zswap_compress(), setting zc->comp_ctx->sg_table->sgl->length =3D
> zc->slen sets sgl[0].length to zc->nr_batch_pages * PAGE_SIZE, which
> exceeds the single PAGE_SIZE allocation backing buffers[0] when
> zc->nr_batch_pages > 1.
>
> At the same time, sgl[1 .. zc->nr_batch_pages - 1].length are never reset
> to PAGE_SIZE before calling crypto_acomp_compress(). After the first batc=
h
> completes (or after a batch fails and jumps to compress_error), those SG
> entries retain their previous compressed lengths or negative error codes =
on
> subsequent requests.

Excellent questions. For compressors for which compr_batch_size > 1,
i.e., zc->nr_batch_pages > 1, that batching algorithm's driver is
expected to test for req->slen > req->unit_size and use
req->slen/req->unit_size to ascertain the # of SG lists to process (in
the case of compression). Please refer to a reference implementation
in [1] and [2].

[1]: https://patchwork.kernel.org/project/linux-mm/patch/20260125033537.334=
628-17-kanchana.p.sridhar@intel.com/
[2]: https://patchwork.kernel.org/project/linux-mm/patch/20260125033537.334=
628-19-kanchana.p.sridhar@intel.com/

The crypto_acomp algorithms don't use
zc->comp_ctx->sg_table->sgl->length as inputs, these values are always
over-written as the output of compression (patch 3 in this series).

>
> > +
> > +             err =3D crypto_wait_req(crypto_acomp_compress(zc->comp_ct=
x->areq.req),
> > +                                   &zc->comp_ctx->areq.wait);
> >
> > -     gfp =3D GFP_NOWAIT | __GFP_NORETRY | __GFP_HIGHMEM | __GFP_MOVABL=
E;
> > -     handle =3D zs_malloc(pool->zs_pool, dlen, gfp, folio_nid(folio));
> > -     if (IS_ERR_VALUE(handle)) {
> > -             alloc_ret =3D PTR_ERR((void *)handle);
> > -             goto unlock;
> > +             /*
> > +              * If a page cannot be compressed into a size smaller tha=
n
> > +              * PAGE_SIZE, save the content as is without a compressio=
n, to
> > +              * keep the LRU order of writebacks.  If writeback is dis=
abled,
> > +              * reject the page since it only adds metadata overhead.
> > +              * swap_writeout() will put the page back to the active L=
RU list
> > +              * in the case.
> > +              *
> > +              * It is assumed that any compressor that sets the output=
 length
> > +              * to 0 or a value >=3D PAGE_SIZE will also return a nega=
tive
> > +              * error status in @err; i.e, will not return a successfu=
l
> > +              * compression status in @err in this case.
> > +              */
> > +             if (unlikely(err && !zc->wb_enabled))
> > +                     goto compress_error;
> > +
> > +             for_each_sg(zc->comp_ctx->sg_table->sgl, sg,
> > +                         zc->nr_batch_pages, comp_batch_iter) {
> > +                     batch_iter =3D batch_start + comp_batch_iter;
> > +                     if (unlikely(sg->length <=3D 0 || sg->length >=3D=
 PAGE_SIZE))
> > +                             sg->length =3D PAGE_SIZE;
> > +
> > +                     zc->entries[batch_iter]->length =3D sg->length;
> > +             }
>
> [Severity: High]
> What happens in zswap_compress() when using an asynchronous non-segmented
> acomp driver?
>
> In crypto/acompress.c:crypto_acomp_compress(), when req->unit_size =3D=3D
> req->slen and !crypto_acomp_req_seg(tfm), the fast path runs:
>
>         if (likely((req->unit_size =3D=3D req->slen) && acomp_request_iss=
g(req) &&
>                     !crypto_acomp_req_seg(tfm) && !acomp_req_on_stack(req=
))) {
>                 int err =3D tfm->compress(req);
>
>                 req->dst->length =3D unlikely(err) ? err : req->dlen;
>                 return err;
>         }
>
> When tfm->compress(req) is asynchronous and returns -EINPROGRESS or -EBUS=
Y,
> req->dst->length (sg->length) is set to -EINPROGRESS before
> crypto_wait_req() waits for completion, and nothing updates sg->length to
> req->dlen when the request finishes.
>
> Wouldn't zswap_compress() then see sg->length =3D=3D (unsigned int)-EINPR=
OGRESS
> after crypto_wait_req() returns 0, clamp sg->length to PAGE_SIZE, and sto=
re
> every page uncompressed instead of using req->dlen?

This shouldn't happen now, with Sashiko's and Herbert's earlier
suggestion incorporated, that tests for !acomp_is_async(tfm) instead
of !acomp_req_on_stack(req) in the fast path.

>
> [Severity: Medium]
> Also, is the assumption that compressors never return 0 when the output
> length is PAGE_SIZE true for software compressors?
>
> Software compressors such as lz4 and zstd return 0 with dlen =3D=3D PAGE_=
SIZE
> when a page compresses to exactly PAGE_SIZE bytes. Previously,
> zswap_compress() checked:
>
>         if (!comp_ret) {
>                 if (dlen =3D=3D PAGE_SIZE)
>                         comp_ret =3D -ENOSPC;
>                 else if (WARN_ON_ONCE(!dlen || dlen > PAGE_SIZE))
>                         comp_ret =3D -EINVAL;
>         }
>
> Without that check, when err =3D=3D 0 and sg->length =3D=3D PAGE_SIZE wit=
h
> !zc->wb_enabled, won't zswap_compress() and zswap_update_entries() alloca=
te
> a PAGE_SIZE object in zsmalloc and store the uncompressed page even thoug=
h
> writeback is disabled?

Yes, I missed this, and will fix it in the next version. The special
casing for comp_ret=3D0 with dlen =3D=3D PAGE_SIZE (among other end-cases)
when writeback is disabled, needs to happen with the batched version
of zswap_compress() as well.

>
> > +
> > +             ret =3D zswap_update_entries(zc, batch_start);
> > +             if (unlikely(!ret))
> > +                     return false;
> >       }
>
> [ ... ]
>
> > @@ -1681,11 +1785,10 @@ static bool zswap_store_pages(struct zswap_stor=
e_context *zc,
> >       return true;
> >
> >  store_pages_failed:
> > -     for (i =3D store_fail_idx; i < zc->nr_pages; ++i) {
> > -             if (!IS_ERR_VALUE(zc->entries[i]->handle))
> > -                     zs_free(pool->zs_pool, zc->entries[i]->handle);
> > -     }
> > +     for (i =3D store_fail_idx; i < zc->nr_pages; ++i)
> > +             zs_free(pool->zs_pool, zc->entries[i]->handle);
> >
> > +compress_failed:
> >       zswap_entries_cache_free_batch(&zc->entries[store_fail_idx],
> >                                      zc->nr_pages - store_fail_idx);
> >
>
> [Severity: High]
> Does this leak zsmalloc handles in zc->entries[0 .. batch_start - 1] when=
 a
> later sub-batch (batch_start > 0) fails in zswap_compress()?

I will reinstate the v1 solution I had for this exact same issue that
I dropped in v2. As it stands in v2, yes, this can leak zsmalloc
handles. The v1 solution will address this.

[ .. ]

>
> > @@ -1757,6 +1860,10 @@ bool zswap_store(struct folio *folio)
> >       store_batch_size =3D (pool->compr_batch_size > 1) ?
> >                           pool->compr_batch_size : ZSWAP_MAX_BATCH_SIZE=
;
> >
> > +     zc.nr_batch_pages =3D pool->compr_batch_size;
> > +     zc.slen =3D zc.nr_batch_pages * PAGE_SIZE;
> > +     zc.zs_pool =3D pool->zs_pool;
> > +
> >       for (start =3D 0; start < nr_pages; start +=3D store_batch_size) =
{
> >               end =3D min(start + store_batch_size, nr_pages);
> >
>
> [Severity: Critical]
> What happens in zswap_store() -> zswap_store_pages() -> zswap_compress()
> when pool->compr_batch_size > 1 and the folio (or trailing batch end -
> start) has fewer pages than pool->compr_batch_size, such as an order-0
> folio where nr_pages =3D=3D 1?

Yes, thanks for flagging this. Also something I had in v1, but dropped
while optimizing v2. I will reinstate this.

>
> In zswap_store(), zc.nr_batch_pages is set to pool->compr_batch_size and
> zc.slen is set to zc.nr_batch_pages * PAGE_SIZE, while zswap_store_pages(=
)
> sets zc->nr_pages =3D end - start and only allocates zc->nr_pages entries=
 in
> zc->entries[0 .. zc->nr_pages - 1].
>
> Because zc->nr_batch_pages and zc->slen are never clamped to zc->nr_pages=
,
> when zc->nr_pages < zc->nr_batch_pages:

You're right. zc->nr_batch_pages and zc->slen need to be clamped to
zc->nr_pages. I will fix this.

>
> 1. acomp_request_set_src_folio() in zswap_compress() maps zc->slen bytes,
>    reading past the end of zc->folio.
>
> 2. Both the for_each_sg() loop in zswap_compress() and the loop in
>    zswap_update_entries() iterate comp_batch_iter up to zc->nr_batch_page=
s,
>    dereferencing zc->entries[batch_iter] for batch_iter >=3D zc->nr_pages=
. On
>    the first batch, zc->entries[zc->nr_pages] is NULL (causing a NULL
>    pointer dereference); on a trailing partial batch after a full batch, =
it
>    contains stale zswap_entry pointers from the previous batch (corruptin=
g
>    live entries and leaking the newly allocated zsmalloc handles).
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028030503.17=
923-1-kanchanapsridhar2026@gmail.com?part=3D7
