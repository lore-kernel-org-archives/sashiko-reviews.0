Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795296157;
	b=xiM+wbPpvakvCOY2ZWjq86RPRcZBp/F3radqI9u6Gsq2+fdsxzlUqIkomUk7H3/ihIsg
	 emb1P/dZG61Z2txIuydfixGUNEUsyCcA3iO+pYgrQJmeRv0fBug4y8SGkpDbn6A59ZbIQ
	 Cozynn5bb5ImpmGS8/eQlsYfZRN3JhqPiE4ip9ErXJZk9dzRU14ibe6FRccVEGhtc+wHd
	 ba6nPum2V2hXvbz6AYN0WIQTG4N6a8/YcKsHTVBpdH2GT0KJmS8gXQxkBjvgK5tdDH/Mo
	 01ujAFNORNANkelgf8SokLZRK6jC7JwRFJ7DnTolRpZqWsmO5fsq23+yB0YHniEt0JQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=QhxZH8BTZF9uyHOWYNwDlYQX01HSpJGN5QAEadM7D00=;
	b=ARI3AgpJXYvlZgclRURlWxzBgdrekBG82gWlCaZ5p9+7jV8neFYYwXGaWS5DpTLfbC7a
	 ++IiK8mz15+lwREgHv4UTfgrGI78198I3Q1XlveaWMlDdgj2wAybR12Ysv/ukq0TouLsX
	 EdVFh7pPPO6mvLGalC3HX8MFnyPkpPW8tJIZX7fPpL8wRfSa8PEst8pXMlo6/zaOcOiW8
	 ut4fToVP7vEcNQglBRPXt+Sz00gTeNiCYw3iYeDH3ANEJcZjBjzxj1cYHzeIbWI22pQtg
	 +GCZ85plu/Fl6wptr8B6dzuKMiLJttfGa89q+Vpx72yYuTZavFIQFCFIwCwgi0tbpJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hX47uBln;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155BC606A320
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 21:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 155BC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hX47uBln
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so18898231fa.1
        for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 13:22:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795296155; cv=none;
        d=google.com; s=arc-20260327;
        b=sNj1RyeAw2wRYtEeIPbz4GcwtR6eZJGKvs+3QJd2CIYqHn327cHa91zKGHhaFm++Q4
         UDLFnnbruOLq9g5t+lJPAIDQKA6/RqY7pOMRJCMKoBFQGwfR/6I3z5QGp4ypaOWbuVMS
         LpPyQysWdCmzcL4kLpZ6n+Dv0kZmF0ntDQF1MlxGsC5xJSqptPVcx4/DeOp+FofcP1FL
         pjjQPNxHDYeKbBN96xi5yRFb1YxY6Xp4j96TDx/gRzpSLCuk4MRo2QB7ycYxInIDOgxa
         uOPn+p7N5/03F3FGOL6nFN4lRbP/Ic2hwvGIyeTZBXLFw0/KQbsOTW7TU20ddzcQsYXf
         osTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QhxZH8BTZF9uyHOWYNwDlYQX01HSpJGN5QAEadM7D00=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=bYcGLXuuDckii8cajy3xAThqTvdpOnuHwMlvgtZRFZ+I+A/1CCzjDVXuJioRuko57D
         QEnBXiRetFuAjGV0HFVH5tEkm55JyflqsP2BbOw2x8B/zxLkLFPCFdDe3lv65CZhFGFO
         bwucIIkEn8BPgtHa9egsW3MsirqIQkOsVYYCwsYxPaLsg+jqXy7q054sbh3u34dCWjva
         66cnezNGc/HEaeVYXzCJtyRir6+aNkL5AP4DY9K4/RVIjZK7rgIl/KV1j8wJ5Ypad9sY
         z1Zz1XlMCN+aYLajaXQ4jMydhhXD2gk3OSwBtxEPDx/xVm127FO5XzYim8QjKu9UDyQl
         52OQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296155; x=1795900955; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QhxZH8BTZF9uyHOWYNwDlYQX01HSpJGN5QAEadM7D00=;
        b=hX47uBlnd5KX6P9CHrPl2MNPt6gdm+Hk6YizakFGdJGuY8XyUesPApSrLXGRZkg1E4
         7giM3vtMk4VFH+DKpsuF8f04BIl42rC2DtiwgeHVErYI5tfoirC8ibFa9pnux+5N0+/I
         2zZbYy/JQJIdKGCXaUXHeZ2+eDErKpEIYu9h0sMZGj3lfpPGVp025fbnucgU2UxlFzs9
         2X8Toa44nUK25rrpYLb6oV6AozxigqyDoNBN7nqoKgJzfFQi9JYC+RbD5IvWnYSyeRTf
         SFawMZID2yeKdGFtqRyM9MJnAjgoYZVR/hhiuPWwhqvKTTU15M73TMbFi74WHP7ZsWEJ
         Drng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296155; x=1795900955;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhxZH8BTZF9uyHOWYNwDlYQX01HSpJGN5QAEadM7D00=;
        b=iBc9mZI56Sk646INPxHTUyS/9BsKZ1kRqQb/Hw27JYZi6c9q4IcFSDCCIqGPAjyxKC
         /XfWIir4n6jTBFTUgX9rmEtOalAcy/JrFI6ZQA7+bJ7VfpWv6x3JNkDQynALzx/civAT
         D+xggK6ifRNpB7xXnQgFqVjbE6XNrnFCSUx7RJiTONlGKU7KsGX8xI9R2wljINM9hCvh
         9Y4TVfEvc28O30FobdNw69WM+bjS77n+/vEfZoHjiziZedN3oAJUXGipiM9hkv9zUUin
         QcmQhQvKV/S6jkokztHL3k2zqw8Edao8bE+Ul9U5RH5a2KQsoOIa+y56vCF94fGkmZei
         MLFw==
X-Gm-Message-State: APuU4Z8Hln10XJCFylbF/R6yQ6gg9Hd1Mt7qbjgmF/qfyVWSOByVhE74
	2etY/GZkKiBOMGA9hswsDC0OoFzDHtVw8fc8QIUHLX3N4MpODMwM/IhDxx9efetG42u0wPXSVg2
	yGpd4D/wJ657xCozT4BOirDk2hhvAPd9vTZn6
X-Gm-Gg: AZFdTZf/DY8ISlQqdI9iWmmuZ9/pZGAfvhCxKqWlCoE1Hbfxot6S23Gpl4BSRNVOeOO
	t6uU7DCREOxU9e4v6Ior/ygBQHnCsgTuW3EY2Q0jl5k1ucf/3PckdHsYQikF4jGgFrQ4KZ3UBsV
	xO3ZFYHDtOhe4bYCQtOPLcsFNPYvosL7AtRjCpkDiZjkqz3HdmPwOVjMiW6SKPmFBOCuMHOuxun
	tuTO2bO7OfExdEeWjSVlyhe9e+raNggb10b48PNTJ5wTHPzZE1n2Bgx6pzVaGZ/f6gRp+9lRfbU
	WjWqZFMXRpkHLiAOp1msDzuH762aVW/k29pasviJzXjnmKZ3mjdu7OJrroetle8EEJkF23Pj3+z
	9NXkl1ChmrJkc23hio+WUGKkRF8MeYD6CVj/y/WnwnxtfQoI+Urve8FRFEA==
X-Received: by 2002:a05:651c:a149:b0:3ac:e4fe:49c with SMTP id
 38308e7fff4ca-3ae7fa65ademr21112491fa.21.1795296154982; Sat, 21 Nov 2026
 13:22:34 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261120041906.5785-1-kanchanapsridhar2026@gmail.com>
 <20261120041906.5785-9-kanchanapsridhar2026@gmail.com> <sashiko-outbox-226638@kernel.org>
In-Reply-To: <sashiko-outbox-226638@kernel.org>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Sat, 21 Nov 2026 13:22:21 -0800
X-Gm-Features: Aa3M54pt8cwuxT6_by5lL_6hdW5GlQGTKVDXQNTvmifS0EhM5bwkQ1ptuPBtKJw
Message-ID: <CACpmpocYxp38npkHWhbhOyoRAq2KKyvpo6HQRih1VPPDwMvFUw@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] mm: zswap: Batched zswap_compress() for storing
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

On Fri, Nov 20, 2026 at 8:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] mm: zswap: invalid and unreset dst scatterlist lengths in
>   zswap_compress()
> - [High] mm: zswap: unterminated dst scatterlist slice passed in
>   zswap_compress()
> - [Medium] mm: zswap: unsigned sg->length check and error accounting in
>   zswap_compress()
> --
>
> commit a77cc3e636d5134b6371aa977bb1025c031583c2
> Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> mm: zswap: Batched zswap_compress() for storing large folios in batches.
>
> This commit replaces the per-page zswap_compress() call in
> zswap_store_pages() with a batched zswap_compress() and
> zswap_update_entries() that compress up to ZSWAP_MAX_BATCH_SIZE pages per
> batch using a per-CPU scatterlist table mapped to destination buffers.
>
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index 5e1fb5624ffb8..56354a568bad0 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
> [ ... ]
> > @@ -949,6 +971,26 @@ static int zswap_cpu_comp_prepare(unsigned int cpu=
, struct hlist_node *node)
> >               }
> >       }
> >
> > +     acomp_ctx->comp.sg_table =3D kmalloc(sizeof(*acomp_ctx->comp.sg_t=
able),
> > +                                        GFP_KERNEL);
> > +     if (!acomp_ctx->comp.sg_table) {
> > +             ret =3D -ENOMEM;
> > +             goto req_fail;
> > +     }
> > +
> > +     if (sg_alloc_table(acomp_ctx->comp.sg_table, ZSWAP_MAX_BATCH_SIZE=
,
> > +                        GFP_KERNEL)) {
> > +             ret =3D -ENOMEM;
> > +             goto req_fail;
> > +     }
> > +
> > +     /*
> > +      * Statically map the per-CPU destination buffers to the per-CPU
> > +      * SG lists; crucial for performance.
> > +      */
> > +     for_each_sg(acomp_ctx->comp.sg_table->sgl, sg, ZSWAP_MAX_BATCH_SI=
ZE, i)
> > +             sg_set_buf(sg, acomp_ctx->comp.buffers[i], PAGE_SIZE);
> > +
> [ ... ]
> > @@ -965,88 +1007,179 @@ static int zswap_cpu_comp_prepare(unsigned int =
cpu, struct hlist_node *node)
> [ ... ]
> > +static bool zswap_compress(struct zswap_store_context *zc)
> > +{
> > +     u8 nr_batch_pages, batch_start, comp_batch_iter;
> > +     struct scatterlist *sg, *dst_sg;
> > +     unsigned int slen;
> > +     int err;
> >
> >       /*
> > +      * @nr_batch_pages is constrained by the per-CPU comp_ctx's compr=
essor
> > +      * batch size and the @zc->nr_pages in this store batch. @slen in=
dicates
> > +      * the total source length bytes for @nr_batch_pages.
> >        */
> > +     nr_batch_pages =3D min(zc->comp_ctx->compr_batch_size, zc->nr_pag=
es);
> >
> >       /*
> > +      * Compress the @nr_pages in @folio starting at index @folio_star=
t
> > +      * in batches of @nr_batch_pages.
> >        */
> > +     for (batch_start =3D 0; batch_start < zc->nr_pages;
> > +          batch_start +=3D nr_batch_pages) {
> > +             /*
> > +              * Clamp the last iteration's batch size if the compresso=
r's
> > +              * batch_size does not evenly divide @zc->nr_pages.
> > +              */
> > +             nr_batch_pages =3D min(nr_batch_pages, zc->nr_pages - bat=
ch_start);
> > +             slen =3D nr_batch_pages * PAGE_SIZE;
> > +
> > +             /*
> > +              * Send @nr_batch_pages to crypto_acomp for compression:
> > +              *
> > +              * These pages are in @zc->folio's range of indices in th=
e
> > +              * interval:
> > +              *     [@zc->folio_start + @batch_start,
> > +              *      @zc->folio_start + @batch_start + @nr_batch_pages=
).
> > +              *
> > +              * The source folio pages in the batch are directly submi=
tted to
> > +              * crypto_acomp via acomp_request_set_src_folio().
> > +              */
> > +             acomp_request_set_src_folio(zc->comp_ctx->areq.req, zc->f=
olio,
> > +                             (zc->folio_start + batch_start) * PAGE_SI=
ZE,
> > +                             slen);
> > +
> > +             dst_sg =3D zc->comp_ctx->sg_table->sgl + batch_start;
> > +             dst_sg->length =3D slen;
>
> [Severity: High]
> Does setting only dst_sg->length =3D slen overrun acomp_ctx->comp.buffers=
[]
> and leave dst_sg[1 .. nr_batch_pages - 1].length uninitialized when
> nr_batch_pages > 1?
>
> Each entry in acomp_ctx->comp.sg_table->sgl is mapped to a single
> PAGE_SIZE buffer in acomp_ctx->comp.buffers[i], and earlier runs overwrit=
e
> each entry's sg->length with compressed lengths or negative error codes.
> When a batching compressor runs with nr_batch_pages > 1, dst_sg[0].length
> is set to nr_batch_pages * PAGE_SIZE (exceeding its PAGE_SIZE buffer),
> while dst_sg[1 .. nr_batch_pages - 1].length are not reset to PAGE_SIZE.
> If the compressor fails when zc->wb_enabled is true without updating
> dst_sg[1 .. nr_batch_pages - 1].length, any entry still holding a stale
> compressed length (0 < sg->length < PAGE_SIZE) from a previous call will
> skip the PAGE_SIZE fallback and cause zswap_update_entries() to store
> stale data from the previous folio.
>
> Each of the nr_batch_pages scatterlist entries in dst_sg needs its length
> reset to PAGE_SIZE before crypto_acomp_compress().

Summary:
=3D=3D=3D=3D=3D=3D=3D=3D
Batching compressors that result in this code seeing
zc->nr_batch_pages > 1, need to set the individual SG->lengths in the
list starting at dst_sg, to contain the result of the respective
page's compression status in the batch. crypto_acomp_compress() for
the batch will return a negative error in "err", however, each *page
in the batch* could have compressed successfully or compressed with an
error.

The code in patch 8 is handling this contract correctly, for both
non-batching compressors like ZSTD and for batching compressors.

For a reference implementation of how a batching compressor should
handle this contract, please see patch 16/26 in [3]:

[3]: https://patchwork.kernel.org/project/linux-mm/cover/20260125033537.334=
628-1-kanchana.p.sridhar@intel.com/

This is the reference implementation for iaa that correctly handles
this for batch compression, for instance:

+static __always_inline int iaa_comp_submit_acompress_batch(
+ struct iaa_compression_ctx *ctx,
+ struct iaa_req *parent_req,
+ struct iaa_req **reqs,
+ int nr_reqs,
+ unsigned int unit_size)
+{
+ struct sg_page_iter sgiter;
+ struct scatterlist *sg;
+ int i, err, ret =3D 0;
+
+ __sg_page_iter_start(&sgiter, parent_req->src, nr_reqs,
+     parent_req->src->offset/unit_size);
+
+ for (i =3D 0; i < nr_reqs; ++i, ++sgiter.sg_pgoffset) {
+ sg_set_page(reqs[i]->src, sg_page_iter_page(&sgiter), PAGE_SIZE, 0);
+ reqs[i]->slen =3D PAGE_SIZE;
+ }
+
+ /*
+ * Prepare and submit the batch of iaa_reqs to IAA. IAA will process
+ * these compress jobs in parallel.
+ */
+ for_each_sg(parent_req->dst, sg, nr_reqs, i) {
+ sg->length =3D PAGE_SIZE;
+ reqs[i]->dst =3D sg;
+ reqs[i]->dlen =3D PAGE_SIZE;
+
+ err =3D iaa_comp_acompress(ctx, reqs[i]);
+
+ if (likely(err =3D=3D -EINPROGRESS)) {
+ reqs[i]->dst->length =3D -EAGAIN;
+ } else if (unlikely(err)) {
+ reqs[i]->dst->length =3D err;
+ ret =3D -EINVAL;
+ } else {
+ reqs[i]->dst->length =3D reqs[i]->dlen;
+ }
+ }
+
+ return ret;
+}
+

Details:
=3D=3D=3D=3D=3D=3D=3D=3D
For additional context, reiterating some of my earlier responses to
Sashiko's comments.

v2 7/8 response:

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
> > +             /*
> > +              * The per-CPU @zc->comp_ctx->sg_table scatterlists are s=
tatically
> > +              * mapped to the per-CPU dst @buffers at pool creation ti=
me.
> > +              * There are ZSWAP_MAX_BATCH_SIZE per-CPU SG lists and ds=
t
> > +              * buffers allocated for all compressors.
> > +              */
> > +             acomp_request_set_dst_sg(zc->comp_ctx->areq.req, dst_sg, =
slen);
>
> [Severity: High]
> Isn't dst_sg an unterminated scatterlist slice whenever
> batch_start + nr_batch_pages < ZSWAP_MAX_BATCH_SIZE?
>
> sg_alloc_table() only sets SG_END on sgl[ZSWAP_MAX_BATCH_SIZE - 1], so
> passing dst_sg as req->dst leaves sg_nents(req->dst) equal to
> ZSWAP_MAX_BATCH_SIZE - batch_start (4, 3, or 2 instead of nr_batch_pages)=
.
> In-tree hardware acomp drivers rely on sg_nents(req->dst):
> iaa_comp_acompress() falls back to software deflate whenever
> sg_nents(req->dst) > 1 (affecting all order-0 folios and 3 of every 4
> pages in a batch), while __qat_bl_sgl_to_bufl() and
> hisi_acc_sg_buf_map_to_hw_sgl() walk and DMA-map all sg_nents(req->dst)
> entries up to sgl[3] using their sg->length fields, which can still hold =
a
> negative errno such as (unsigned int)-ENOSPC (~4 GiB) left behind by a
> prior failed batch.

Great analysis, Sashiko. Patch 11/26 in [3] sets up the iaa compressor
to handle exactly this scenario [4]. Then, you can understand how [4]
sets up the batching architecture in zswap to work with iaa's
batching, in [5]:

[4]: https://patchwork.kernel.org/project/linux-mm/patch/20260125033537.334=
628-12-kanchana.p.sridhar@intel.com/
[5]: https://patchwork.kernel.org/project/linux-mm/patch/20260125033537.334=
628-17-kanchana.p.sridhar@intel.com/

Any batching compressor must adapt to work with the new architecture.

zswap with ZSTD already works and demonstrates good performance
improvements with this architecture.

>
> > +
> > +             err =3D crypto_wait_req(crypto_acomp_compress(zc->comp_ct=
x->areq.req),
> > +                                   &zc->comp_ctx->areq.wait);
> > +
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
> > +              */
> > +             if (err && !zc->wb_enabled)
> > +                     goto compress_error;
> > +
> > +             /*
> > +              * For each output SG list in @acomp_ctx->req->sg_table->=
sgl,
> > +              * the @sg->length should be set to either the page's com=
pressed
> > +              * length (success), or it's negative value compression e=
rror.
> > +              */
> > +             for_each_sg(dst_sg, sg, nr_batch_pages, comp_batch_iter) =
{
> > +                     if (((int)sg->length <=3D 0) || (sg->length >=3D =
PAGE_SIZE)) {
> > +                             if (!zc->wb_enabled) {
> > +                                     if (sg->length =3D=3D PAGE_SIZE)
> > +                                             sg->length =3D -ENOSPC;
> > +                                     else if (WARN_ON_ONCE(!sg->length=
 || sg->length > PAGE_SIZE))
> > +                                             sg->length =3D -EINVAL;
> > +                                     goto compress_error;
> > +                             }
> > +
> > +                             sg->length =3D PAGE_SIZE;
> > +                     }
> > +             }
> >       }
> >
> > +     return zswap_update_entries(zc);
> >
> > +compress_error:
> > +     for_each_sg(dst_sg, sg, nr_batch_pages, comp_batch_iter) {
> > +             if ((int)sg->length < 0) {
> > +                     if ((int)sg->length =3D=3D -ENOSPC)
> > +                             zswap_reject_compress_poor++;
> > +                     else
> > +                             zswap_reject_compress_fail++;
> > +             }
> > +     }
> >
> > +     return false;
> >  }
>
> [Severity: Medium]
> Won't evaluating sg->length > PAGE_SIZE on an unsigned int trigger
> WARN_ON_ONCE() whenever sg->length holds a negative error code?
>
> Because sg->length is unsigned, a negative error code in sg->length (such
> as -ENOSPC from a failed page in a batch) satisfies sg->length > PAGE_SIZ=
E
> when !zc->wb_enabled, firing a spurious WARN_ON_ONCE() and overwriting th=
e
> error code with -EINVAL so compress_error increments
> zswap_reject_compress_fail instead of zswap_reject_compress_poor.

Yes, I will disambiguate the (sg->length > PAGE_SIZE) check for error
code vs. a real case of an invalid length in the next rev. Thanks for
the catch.

> Conversely, if crypto_acomp_compress() returns an early request-level
> error in err before writing negative error codes into dst_sg->length,
> jumping to compress_error leaves all sg->length values positive and
> returns false without incrementing either rejection counter.

This is not expected to happen today for non-batching compressors, as
explained above. Batching compressors need to follow the architecture
described in "Summary" above, to correctly handle this. A reference
implementation for how the iaa batching compressor could handle this
is also provided in "Summary".


>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120041906.57=
85-1-kanchanapsridhar2026@gmail.com?part=3D8
