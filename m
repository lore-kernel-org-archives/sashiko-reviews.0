Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795296147;
	b=l1fe2MXtW+AB73XPyvn0eWOu039PhZHt8y+hTCGNTNKWHqXuNUa1BeBiD7ox3xCZPV6T
	 sMPYmcsX97tU3hDtTl1V5WyUzWYTI1gn43Io9/2ILBcFPvDdQZ4W/LhMckDpyWr29MKsf
	 hNTAkRvmQDXg7GYX2o8NJcuIhJQo3pfnRn+Mon6exWOp/SX94tPlz9Qm+MI3Oe4EZVNLV
	 acydUbc4t5zege4tXowA3MyG6Q816jeZszsIfTZFE4EYqf0ueR4Sp4ntJW7jdRaxb8uNi
	 LbbAA1ISkASH8lvqyieaTZSp5yDGeQo66svyxsJ1WBwJj4M4f9C23kf2yUkfv5HAV/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=LhcHhD/8aRKBI15ASV7ocqmrU70ZzMpPTnqr+rqSRik=;
	b=rTWgaCcRg3a3uAGO1VLgzIyMwbTWLxjsHREKXl4qraYLsvxnWq9YusiZv6Hfo3fI4YnQ
	 FepNnCySBhde+s7EL7rDXaPn7RkmkmBHmkULwQ8tdmphC9vtSNSz6ExD6V5NrCyJM6Kgl
	 iq9gJMQA5cZcZVUmTV0vY0CnjsLzKuUwz9TDK1Hm917+y9kHewU+uPD6wzVlnAhDwvhtg
	 YWNwkuolVNNpwPg/3BqHoFhdOPI2tuU91ID65CfXh4QQ16O9tEIhYby1wGW3DSfPZrGfb
	 qe151B2Yf94JmXDUkS7z+PSgNyaWpMiWPkL1fQpeQnhWWoPvubkQqfNHjc2MQoxDSWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="M/8gjfRk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76723606A32A
	for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 21:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76723606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M/8gjfRk
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c1b8120565so1184871e87.3
        for <sashiko-reviews@lists.linux.dev>; Sat, 21 Nov 2026 13:22:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795296145; cv=none;
        d=google.com; s=arc-20260327;
        b=bl5AfPY669G0ZNrsZjyUjYFVOWlqHz5ANlNhzMfPaK8xl0HFaTFbHaMmx5r6U6kbqZ
         Dw86rlbCudSmI/E5UNRu+5jqu7+4aTBODxHh48T7iPvPkPUeVd0HaqaQc41J4QN0qc0K
         vHGEFNutoKBy5o9iAewU1qaLuv+DopBr3ANVZwk9uPd4KMJLp0MaMd1xf22geEqXGcIJ
         OubQUpwHnbIG99zI+2CnspD8Jd+ai7pDRP2tq+2L2auwv1tKMn3YYdt6BTlHUc7KlFfy
         N9muzkYwiPzwO7ENkNLBOZxe57X2HjRtxI2XZehiOPbparkijhS29VBnVQxA7cDywR2J
         mRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LhcHhD/8aRKBI15ASV7ocqmrU70ZzMpPTnqr+rqSRik=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=AsIRKvXbaD5CXM1aDYi9Lk+qdUW4hg+DpDwaZom9M41cRDQfK7XX/PgFaVDdR0HGK9
         4hHUgeS8j4nvqP1v7me84Y5Nhy6UbqTXWYfjn+9S2865DwedR0qF1WpFqorx3cD4KfWu
         iNNGJzJXZUtaPUgx7c/S3pOZPnynuvq3t0XtyaHuDsAVXczCVBc9Hibda7AGbR7rgo7I
         a0jLl+GbZ+D6yiaQYFsDQq64/seON2Kp4LB+MwWHQhecNbM/EAmm5PErvl6AK4GPBOYd
         rTZ5czCrfxlthZuiO25UTEsiplqrsmxbF8sBk93FYQYOUVUI81/aTc+tYB/rjWcE5KKB
         SLtA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795296145; x=1795900945; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LhcHhD/8aRKBI15ASV7ocqmrU70ZzMpPTnqr+rqSRik=;
        b=M/8gjfRkLZOxGtn2atpF1A0jrtES+vsSDEBV6qNEZp6s8QGgpbJJcLeDQFUUCmV1a4
         fXYTiyzVH9H6YihNaYtTlcNtjjMbdmkQarr7WTAFSFQmn35HtCBscnPwTh0j9znVdjXZ
         uzlFML4PMiPk6q+XY4+1QIUC/tLfo+RUFIJTMYQMSLbLHvjpe4WZ4TjKWfEzr2/lIe/X
         xPaQS6PSFKgVRhM/sWEqXhmrPUz2+WKb06EMyoxzeiHVVZ2wGIiH7eajB8CREFiiZThc
         g4xHdxBdhJvILy/krBqPrc4zMVEBqkCk7w9fgx6fNxkaK7CSvipnrDpW/LbDdaMZPB4Y
         TtAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795296145; x=1795900945;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LhcHhD/8aRKBI15ASV7ocqmrU70ZzMpPTnqr+rqSRik=;
        b=YTQNW/y0M4A5NO8+vIRl97ms/fT1mEwnJMm2za7v9RmWgBgQebCLjeLWyEPn30usnN
         NdNHbm8QmKQ3iacrUaA4Va3cmfzmobv1RwpeN+4DldRxS+3kdx6YpbPAnTIUUv5THVHk
         jO2PabRsxq0WT1ov7Fd2C85VNNaDHXjOUio4dWax710CIe/YwtC5CeUMzcVUNJHruxyh
         fqfq24wmWb1e8L33FxEy9NlggWsokSTC5VHZzvegfX/TZrTrDBa54g/9iV6BHMMle4Ch
         /xp5L8H8MyfEHzPpVjqBpn33sgsii+5TT99rBTNWHyAoxC73YMlSS5FbW7zKS195PJ5G
         cW8A==
X-Gm-Message-State: APuU4Z8He9Rdn8vewcQTrtWeGTkrAsXC+hfL+EwLTzO0PqxDlnnDOpMV
	cIbfqdQtF9LRydwIYX5u6VgOYrgbZkDMMMTIuF+vlyx2XxxGV4d29m3q1a/v+za6MQWqvx0D64G
	/tzychW+vgtq/6or4SEJOZFGLiglyoJIwCDcf
X-Gm-Gg: AZFdTZfOwvEhR/gteItLlHMWtSXPfRU+XxBO7N2mmQ9iHKk435dTbATt+8yTtcimT1J
	AdS++6jpBUFeDE3fbxuf4OUJAamatl7Cul2bBIWN51iqs4FeYg15UU1pU55LrFSzJEztigPTM2O
	/vs0tYaIO4sHOVZ4PkmQTNnBWJkIlpz7nVtBdTlMAFvIsV+E9bGILjXlt5A/DPZzMfy37JFW9gZ
	nTA0rFNhjiJEMvXmv2Jt3UnjcA7kAIQNo2nQQzLl56rzqf+XqsPV+87ZA4cQ9+BLR4vMfZXvZtB
	1wwPKApl5K5CJA/Kx83Qv2448iGqWGK1rYjEZae9Eu8kjRCseHC8Hs6oc2NIeCxNhwdhagyGdv1
	FVI1n+ypUtHQBVQma3qDbrwqrExNaZPSoUXqm
X-Received: by 2002:a05:6512:3a86:b0:5be:590e:ea76 with SMTP id
 2adb3069b0e04-5c1bc680e86mr2302113e87.6.1795296145205; Sat, 21 Nov 2026
 13:22:25 -0800 (PST)
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
 <20261120041906.5785-5-kanchanapsridhar2026@gmail.com> <sashiko-outbox-226634@kernel.org>
In-Reply-To: <sashiko-outbox-226634@kernel.org>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Sat, 21 Nov 2026 13:22:12 -0800
X-Gm-Features: Aa3M54rocg5lImMNhqmcaG3bXPnzsrtWItRkXY1bhretNH8NzvJavMtXKNpuBjY
Message-ID: <CACpmpoc-OJoQ4hcKpF6muY+tf7NcP9ok+fGXQLog3dc1q__njA@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] crypto: acomp - Add API to get a compression
 algorithm's batch-size.
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
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] crypto: acomp: crypto_acomp_batch_size() checks async instead
>   of req_seg
> --
>
> commit 4f8164105102abaa98a8641d32dd35c9cb223ee0
> Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> crypto: acomp - Add API to get a compression algorithm's batch-size.
>
> This commit adds a batch_size field to struct acomp_alg and introduces
> crypto_acomp_batch_size() so callers can query the maximum batch size sup=
ported
> by an acomp algorithm.
>
> > diff --git a/crypto/acompress.c b/crypto/acompress.c
> > index ac4dc52668b89..df9e42f519c35 100644
> > --- a/crypto/acompress.c
> > +++ b/crypto/acompress.c
> > @@ -327,6 +327,20 @@ int crypto_acomp_decompress(struct acomp_req *req)
> >  }
> >  EXPORT_SYMBOL_GPL(crypto_acomp_decompress);
> >
> > +unsigned int crypto_acomp_batch_size(struct crypto_acomp *tfm)
> > +{
> > +     if (acomp_is_async(tfm) &&
> > +         (crypto_comp_alg_common(tfm)->base.cra_type =3D=3D &crypto_ac=
omp_type)) {
> > +             struct acomp_alg *alg =3D crypto_acomp_alg(tfm);
> > +
> > +             if (alg && alg->batch_size > 1)
> > +                     return alg->batch_size;
> > +     }
> > +
> > +     return 1;
> > +}
> > +EXPORT_SYMBOL_GPL(crypto_acomp_batch_size);
>
> [Severity: Medium]
> Should crypto_acomp_batch_size() check crypto_acomp_req_seg(tfm) instead =
of
> acomp_is_async(tfm)?
>
> crypto_acomp_compress() only dispatches segmented requests (where
> req->unit_size is set) to tfm->compress(req) when crypto_acomp_req_seg(tf=
m) is
> true, and otherwise sends them to acomp_do_req_chain(), which rejects
> multi-segment requests (req->slen > req->unit_size) with -ENOSYS:

v3 response:
As described in response to Sashiko's v2 comments, this is kept simple
for now and for the only known use-case which is acomp_is_async(tfm).

v2 response:
This is a good question. When the patch was initially planned, the
intended algorithm for batch_size > 1 was async, that too for zswap to
know how much memory to allocate for batching resources. Plus, we did
not want to impose strong semantics between batch_size and
segmentation for synchronous algorithms. The only known usage model
for batch_size > 1 was for async, hence the gate to prevent unintended
side effects until we know more about how to evolve this.

>
> crypto/acompress.c:crypto_acomp_compress() {
>     ...
>         if (req->unit_size && acomp_request_issg(req)) {
>                 if (!crypto_acomp_req_seg(tfm))
>                         return acomp_do_req_chain(req, true);
>
>                 return tfm->compress(req);
>         }
>     ...
> }
>
> If an asynchronous acomp_alg sets batch_size > 1 without CRYPTO_ALG_REQ_S=
EG,
> crypto_acomp_batch_size() returns alg->batch_size and callers such as zsw=
ap
> will submit multi-unit requests that fail with -ENOSYS.  Conversely, beca=
use
> base.cra_type =3D=3D &crypto_acomp_type already distinguishes struct acom=
p_alg from
> struct scomp_alg, requiring acomp_is_async(tfm) forces
> crypto_acomp_batch_size() to return 1 for a synchronous acomp_alg even wh=
en it
> sets CRYPTO_ALG_REQ_SEG and batch_size > 1.

In addition to the clarifications reiterated above, this is an
additional v2 7/8 response:

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
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120041906.57=
85-1-kanchanapsridhar2026@gmail.com?part=3D4
