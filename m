Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795202894;
	b=NtdEdfaBsStCjbwZDK+ls1Fvj63ZmiZ9T/I0X4Fk4USgHpUZmrTrFvuMb58zTMSZ+Lcc
	 5Vy+hIHFkol+d6Men8NoExfHk7PGZaAHVU3bgf9syWavyjXjJBHLUNTjTIHYoNqt9bM04
	 IcrZcGllYxSU9PgrbQhrL96qFWNVAK3QBNOr8U/gfB5dKLI7iHXdApy/EF3xCO4FISK/F
	 lc9GsFC09meVXsSJrxLY9T9P6udnyLKW7Q4YwdklE1Qmg9TsVVT7/3UiA0/djHziu8wIu
	 HFa0cFWjpAigc2q/l9XF7kkHXYJp3lc4Ayy3PSGSJ/C44hPynjIEWco4rozD6srB7OA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=gTSQmZl/zKK0zXMmK+A31LEN+NDNPEQL27tBFK3Clmw=;
	b=O7GtJSMOqOt5J07115lvHugGB1PEb5O3ZMVCq3WnCj6Ulpe1AHVSPZ4vFzqZ6H5o52be
	 QUPn3yafEbhGs1jXf5I3SewI3nNe0KpxML4ysVe+JvFLC/B7aBHKSLl4SF0mq+xmovkgc
	 Q36IiGUgKSvSl7whIV3jolfcoZ7K+nvRhh+7/J3YA4RZhlzR7SGrPWErXwliV4mq+oFPs
	 YnZZAbdMLZwj32MP9d6IQSBhzPp9Y+hyzNfbNbZATOP52KrHG4oW4utQKLDurKTOc4pi1
	 zSNcq9iSZMHs9x1yFZMpFFs3cHIKX8fdtHwQuBosh92NCRbIrKHkbylz5bFuckP9F2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wYcy3TTO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD0B606A6E0
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 19:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD0B606A6E0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wYcy3TTO
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so1016610e87.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:28:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795202892; cv=none;
        d=google.com; s=arc-20260327;
        b=WzbhBNsM6GVFmIK7VioOzL3RbMU0bhwnwT1mHgUrh+6MDWZBBWiZkywCIoNoR+Phzr
         KhERTtt6joyj++u+5TtvsiF6gdv182GMQbW64lM8ASqY+XLz3b7KH2H9TZJw+LGN7f6B
         y2wVe1t4XiMqlkN/HTNXxzu8FQKGAFwK9IMiT/XyRxg6D36xJAEXnHb6putR5nMo/Tkd
         ZZTXufH31THVUi8rfwxQZQ2u6Wrz98rGoJ5L0tBk70rPJmQqHHN6q10OHP83tGH6X56F
         q8zIWJje2b7//6H4jBio0fOVTauqHsTZD7F5MODaB4pvtqL1woYu1aRR3wZ9RsabCrcG
         YpAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gTSQmZl/zKK0zXMmK+A31LEN+NDNPEQL27tBFK3Clmw=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=U3laGQbHXFNpNqgNyhuEGg9TBl9GlubGzckVzKKET2mQztcYzOpygfgx2iQqz4vKJS
         Gp6Q0LPM92m40rPR37CJxP2bnd4er93QTfb+480P6YpOVoEnpsEbUoRKUteqLUhno4s9
         3kTcgXfn2z3X2OsylZG/T6LWRY7iWkhGLou/CpjSEZcTXzhj7f5JmBVkZ8OszHO9Y6+r
         SpNE6/vIhdvA/adj2dLEGdvrQIB9TSY+SE0un+kw7zEH14eEKA1ulq9f3te4GeexJ8hz
         3gjvZuDbV55ZJjTOuIuQkMma5GJhQkQfCvKdXWcN8GEhLEL0ltGdyHPZCSP8pJHR8q8o
         Pxsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202892; x=1795807692; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gTSQmZl/zKK0zXMmK+A31LEN+NDNPEQL27tBFK3Clmw=;
        b=wYcy3TTO2tmhHWAjkVjy+KBnk9vbKFDKa8eOJz/Ndz8N8BRrwABQZcO2bXN1pWp9iN
         3j/HICZA/EaOapUB4U8xDNER4p3QWHWhBI0cZN4yGTZTDJHYZt2ZhZ8Yj7l0wEBxMudY
         MlUj23sMVS+fpEa71mtkf70MTTDsdPOlqWwZOFKNWe7QZQNH3JWRlsIiakz6GJ/MXDsC
         r1CrAPt82Os0Nosq0Ggoq6Nj1qDsvRzhEosWIjzUmdGYpvYoZ3SQ8mBrJAUT1Nm/3nWK
         CVMGDtJaHIVEZLV+XokJDXn0wTIryP035v1m7YQjhkTll11CqwrhAEPEiFsNsjViXhUj
         pUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202892; x=1795807692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gTSQmZl/zKK0zXMmK+A31LEN+NDNPEQL27tBFK3Clmw=;
        b=eWEYEocPU8xM+oqOTFVWkl41cX/GNlCUcYJi4eQPLSZwAdTqZ7R8+R0ZqmOjNU+6VL
         g+sKl/eEpdZ2UX/Z7tX58kf97Z0l3KySZdTxk7aunhnvExyCfAPPDWOhnDvXsbkcZtR3
         Qil1uc5F4qH51Gs6g3y23RKlxACyY9KFSiP4fKkmjOuOm1LsAhjmUtZr0GNbT1KJyBHJ
         E4WZQEGsbZjRy3B0VV4lMDxl3Lb6MGEW9UHuh0rML8q8R5l0mHviOjHmTOYI5FqRe5Dm
         eegs7x2Aw8hE1yXhrZs81BwgycmB5ejF5TDMbNJJOx0CeARoOCHJo2/jNb7ZGY/RwFXr
         cqkQ==
X-Gm-Message-State: APuU4Z+3wUDPWaUOJYCI2hWqHLnv4ivtz4AAm5N90LOrRg+BrM1lEtTh
	mOtCgESFhj0DXzdYpL0nLbzDTh3F/vtEpylFZbLOPuAW+yPXKSMAFLko9/ItUWSZno/qmVdmHk1
	aAx0rzMLaD+g7xKi/nBwBtuWSjO+PIRHIGCXk
X-Gm-Gg: AZFdTZd1rMupLNK4WBN4xqhYEWtl3SfCEyeMD0XRitdVU998FdljvJiKVpT2mdIo3G7
	2ztcldnM/4rXvOcL2UgVNCjjqWHa2//+quPrkq7PfEUW6ESBBbwUHXlqw6NRR5r3BElxx2g8qEG
	Gtdyaiue83I4C6KetvgRgobaHioYUk68fwjteb8GNFONQYBPbJMzhCjD1zNb/HxKZxmd0NGD1gD
	0Rp8nHt4MDp7keJ86t+sJUNyDSxZfGTBoDY+/OuC3/P7iRpWZt05RQulhuS0Vk8rAj/XB2HOs4U
	+/NqAg7J13XvnQ+5SZENME+wGrgKA6Av/7cPYO4Msx1IoZLgvGRVcT4oJgsv6m2GXAMgfTztgCR
	QsJ2qZKJW4O6knaPVBz0DBoVAKsIAu5ARxK4W
X-Received: by 2002:a05:6512:32c8:b0:5c1:46f8:913c with SMTP id
 2adb3069b0e04-5c1b7c00f96mr1590361e87.20.1795202892209; Fri, 20 Nov 2026
 11:28:12 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261106072412.7909-1-kanchanapsridhar2026@gmail.com>
 <20261106072412.7909-9-kanchanapsridhar2026@gmail.com> <sashiko-outbox-202714@kernel.org>
 <CACpmpofRbbRuRQfx0wd_xnitwz-TfWZ4_XfgR-y0HYPsN3ZFpA@mail.gmail.com>
In-Reply-To: <CACpmpofRbbRuRQfx0wd_xnitwz-TfWZ4_XfgR-y0HYPsN3ZFpA@mail.gmail.com>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 20 Nov 2026 11:27:59 -0800
X-Gm-Features: Aa3M54qHyMHAs4REx3hc_QYhZyScUZM2KH4BsGOU3VT9vIU15C1WE7ikT83enGg
Message-ID: <CACpmpof-tnHWn=mqGEm=xAGi039Ewh8Zv5=n+5QOrvLjefv3TA@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] mm: zswap: Batched zswap_compress() for storing
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

On Fri, Nov 20, 2026 at 11:24=E2=80=AFAM Kanchana P. Sridhar
<kanchanapsridhar2026@gmail.com> wrote:
>
> On Fri, Nov 6, 2026 at 11:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 3 potential
> > issues to consider:
> > - [High] mm: zswap: corrupted and unterminated dst scatterlist in
> >   zswap_compress()
> > - [Medium] mm: zswap: unclamped nr_batch_pages on remainder batch in
> >   zswap_compress()
> > - [Medium] mm: zswap: unsigned sg->length check mishandles negative
> >   errors in zswap_compress()
> > --
> >
> > commit 212f5740068394b4c82b7b1e5452b1ac6625322f
> > Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
> >
> > mm: zswap: Batched zswap_compress() for storing large folios in batches=
.
> >
> > This commit replaces per-page zswap_compress() calls with a batched
> > implementation that compresses up to ZSWAP_MAX_BATCH_SIZE pages using a
> > per-CPU scatterlist table and updates the batch entries in
> > zswap_update_entries().
> >
> > > diff --git a/mm/zswap.c b/mm/zswap.c
> > > index 5ef1ae67e67a9..45fd8dfaf916d 100644
> > > --- a/mm/zswap.c
> > > +++ b/mm/zswap.c
> >
> > [ ... ]
> >
> > > @@ -898,6 +914,7 @@ static int zswap_cpu_comp_prepare(unsigned int cp=
u, struct hlist_node *node)
> >
> > [ ... ]
> >
> > > +     acomp_ctx->comp.sg_table =3D kmalloc(sizeof(*acomp_ctx->comp.sg=
_table),
> > > +                                        GFP_KERNEL);
> > > +     if (!acomp_ctx->comp.sg_table) {
> > > +             ret =3D -ENOMEM;
> > > +             goto req_fail;
> > > +     }
> > > +
> > > +     if (sg_alloc_table(acomp_ctx->comp.sg_table, ZSWAP_MAX_BATCH_SI=
ZE,
> > > +                        GFP_KERNEL)) {
> > > +             ret =3D -ENOMEM;
> > > +             goto req_fail;
> > > +     }
> > > +
> > > +     /*
> > > +      * Statically map the per-CPU destination buffers to the per-CP=
U
> > > +      * SG lists; crucial for performance.
> > > +      */
> > > +     for_each_sg(acomp_ctx->comp.sg_table->sgl, sg, ZSWAP_MAX_BATCH_=
SIZE, i)
> > > +             sg_set_buf(sg, acomp_ctx->comp.buffers[i], PAGE_SIZE);
> >
> > [ ... ]
> >
> > > +static bool zswap_compress(struct zswap_store_context *zc)
> > > +{
> > > +     u8 batch_start, comp_batch_iter;
> > > +     struct scatterlist *sg, *dst_sg;
> > > +     int err;
> > >
> > >       /*
> > > -      * it maybe looks a little bit silly that we send an asynchrono=
us request,
> > > -      * then wait for its completion synchronously. This makes the p=
rocess look
> > > -      * synchronous in fact.
> > > -      * Theoretically, acomp supports users send multiple acomp requ=
ests in one
> > > -      * acomp instance, then get those requests done simultaneously.=
 but in this
> > > -      * case, zswap actually does store and load page by page, there=
 is no
> > > -      * existing method to send the second page before the first pag=
e is done
> > > -      * in one thread doing zswap.
> > > -      * but in different threads running on different cpu, we have d=
ifferent
> > > -      * acomp instance, and compression and decompression use separa=
te
> > > -      * requests, so multiple threads can do (de)compression in para=
llel.
> > > +      * @nr_batch_pages is constrained by the per-CPU comp_ctx's com=
pressor
> > > +      * batch size and the @zc->nr_pages in this store batch. @slen =
indicates
> > > +      * the total source length bytes for @nr_batch_pages.
> > >        */
> > > +     zc->nr_batch_pages =3D min(zc->comp_ctx->compr_batch_size, zc->=
nr_pages);
> > > +     zc->slen =3D zc->nr_batch_pages * PAGE_SIZE;
> > >
> > >       /*
> > > +      * Compress the @nr_pages in @folio starting at index @folio_st=
art
> > > +      * in batches of @nr_batch_pages.
> > >        */
> > > +     for (batch_start =3D 0; batch_start < zc->nr_pages;
> > > +          batch_start +=3D zc->nr_batch_pages) {
> >
> > [Severity: Medium]
> > Can zc->nr_batch_pages exceed the remaining pages in the store batch on=
 the
> > final loop iteration?
> >
> > zc->nr_batch_pages and zc->slen are computed once before the loop inste=
ad
> > of being clamped to zc->nr_pages - batch_start on each iteration.  If a
> > compressor has a compr_batch_size that does not evenly divide zc->nr_pa=
ges
> > (for example, compr_batch_size =3D=3D 3 with zc->nr_pages =3D=3D 4), th=
e final
> > iteration reads past the end of the folio batch and walks past the SG_E=
ND
> > terminator of zc->comp_ctx->sg_table->sgl in for_each_sg(), causing a N=
ULL
> > pointer dereference when sg_next() returns NULL.
>
> Thanks for catching this. I have resolved this and will include it
> when I submit the next revision.

This has been resolved in v4 submitted yesterday.

>
> >
> > > +             /*
> > > +              * Send @nr_batch_pages to crypto_acomp for compression=
:
> > > +              *
> > > +              * These pages are in @folio's range of indices in the =
interval
> > > +              *     [@folio_start + @batch_start,
> > > +              *      @folio_start + @batch_start + @nr_batch_pages).
> > > +              *
> > > +              * The source folio pages in the batch are directly sub=
mitted to
> > > +              * crypto_acomp via acomp_request_set_src_folio().
> > > +              */
> > > +             acomp_request_set_src_folio(zc->comp_ctx->areq.req, zc-=
>folio,
> > > +                             (zc->folio_start + batch_start) * PAGE_=
SIZE,
> > > +                             zc->slen);
> > > +
> > > +             dst_sg =3D zc->comp_ctx->sg_table->sgl + batch_start;
> > > +             dst_sg->length =3D zc->slen;
> > > +
> > > +             /*
> > > +              * The per-CPU @zc->comp_ctx->sg_table scatterlists are=
 statically
> > > +              * mapped to the per-CPU dst @buffers at pool creation =
time.
> > > +              * There are ZSWAP_MAX_BATCH_SIZE per-CPU SG lists and =
dst
> > > +              * buffers allocated for all compressors.
> > > +              */
> > > +             acomp_request_set_dst_sg(zc->comp_ctx->areq.req,
> > > +                                      dst_sg, zc->slen);
> >
> > [Severity: High]
> > Does setting dst_sg->length =3D zc->slen corrupt the per-CPU scatterlis=
t table
> > in zc->comp_ctx->sg_table?
> >
> > In zswap_cpu_comp_prepare(), each entry in sg_table->sgl is mapped to a
> > separate PAGE_SIZE buffer and only sgl[ZSWAP_MAX_BATCH_SIZE - 1] has SG=
_END
> > set.  During compression, each entry's sg->length is overwritten with t=
he
> > compressed size or a negative error code.
> >
> > When zc->nr_batch_pages > 1, setting dst_sg->length =3D zc->slen tells =
the
> > compressor that dst_sg[0]'s single PAGE_SIZE buffer is nr_batch_pages *
> > PAGE_SIZE bytes long, while dst_sg[1 .. nr_batch_pages - 1].length are =
never
> > reset to PAGE_SIZE and retain stale lengths or negative error codes fro=
m the
> > previous batch.  If crypto_acomp_compress() fails while zc->wb_enabled =
is
> > true without updating every entry's sg->length, any entry still holding=
 a
> > stale length in (0, PAGE_SIZE) bypasses the sg->length >=3D PAGE_SIZE c=
heck
> > and causes zswap_update_entries() to store stale data from the previous
> > folio.
> >
> > In addition, because SG_END is only set on sgl[3], passing dst_sg =3D s=
gl +
> > batch_start leaves 4 - batch_start entries linked in req->dst.  Hardwar=
e
> > acomp drivers that check sg_nents(req->dst) or DMA-map every entry in t=
he
> > scatterlist walk past the current batch into trailing entries whose
> > sg->length may still hold PAGE_SIZE or (unsigned int)-ENOSPC (0xffffffe=
4)
> > from an earlier failed compression.
>
> Sashiko raised this in v2 code review. Please see my follow up comments i=
n:
>
> https://lore.kernel.org/all/CACpmpofOE797D7f4YGZEJ2jtHn08d9Jo8Ya3cdV8h9UL=
5hUd9A@mail.gmail.com/
>
> and let me know if this explains things better. Thanks.
>
> >
> > > +
> > > +             err =3D crypto_wait_req(crypto_acomp_compress(zc->comp_=
ctx->areq.req),
> > > +                                   &zc->comp_ctx->areq.wait);
> > > +
> > > +             /*
> > > +              * If a page cannot be compressed into a size smaller t=
han
> > > +              * PAGE_SIZE, save the content as is without a compress=
ion, to
> > > +              * keep the LRU order of writebacks.  If writeback is d=
isabled,
> > > +              * reject the page since it only adds metadata overhead=
.
> > > +              * swap_writeout() will put the page back to the active=
 LRU list
> > > +              * in the case.
> > > +              */
> > > +             if (err && !zc->wb_enabled)
> > > +                     goto compress_error;
> > >
> > > +             /*
> > > +              * For each output SG list in @acomp_ctx->req->sg_table=
->sgl,
> > > +              * the @sg->length should be set to either the page's c=
ompressed
> > > +              * length (success), or it's negative value compression=
 error.
> > > +              */
> > > +             for_each_sg(dst_sg, sg, zc->nr_batch_pages, comp_batch_=
iter) {
> > > +
> > > +                     if (sg->length <=3D 0 || sg->length >=3D PAGE_S=
IZE) {
> > > +                             if (!zc->wb_enabled) {
> > > +                                     if (sg->length =3D=3D PAGE_SIZE=
)
> > > +                                             sg->length =3D -ENOSPC;
> > > +                                     else if (WARN_ON_ONCE(!sg->leng=
th || sg->length > PAGE_SIZE))
> > > +                                             sg->length =3D -EINVAL;
> > > +                                     goto compress_error;
> > > +                             }
> > > +
> > > +                             sg->length =3D PAGE_SIZE;
> > > +                     }
> > > +             }
> > >       }
> > >
> > > +     return zswap_update_entries(zc);
> > >
> > > +compress_error:
> > > +     for_each_sg(dst_sg, sg, zc->nr_batch_pages, comp_batch_iter) {
> > > +             if ((int)sg->length < 0) {
> > > +                     if ((int)sg->length =3D=3D -ENOSPC)
> > > +                             zswap_reject_compress_poor++;
> > > +                     else
> > > +                             zswap_reject_compress_fail++;
> > > +             }
> > > +     }
> > > +
> > > +     return false;
> > >  }
> >
> > [Severity: Medium]
> > Does checking sg->length without casting to int mishandle negative
> > compression error codes when !zc->wb_enabled?
> >
> > scatterlist.length is an unsigned int, so a negative error code stored =
in
> > sg->length (such as -ENOSPC) is never <=3D 0 and instead triggers
> > WARN_ON_ONCE(!sg->length || sg->length > PAGE_SIZE) and overwrites
> > sg->length with -EINVAL before compress_error: checks for -ENOSPC.
> > Conversely, if crypto_acomp_compress() returns an error before setting
> > negative values in sg->length, jumping directly to compress_error: find=
s no
> > entries with (int)sg->length < 0 and increments neither rejection count=
er.
>
> Thanks. I have resolved this.
>
>
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106072412.=
7909-1-kanchanapsridhar2026@gmail.com?part=3D8
