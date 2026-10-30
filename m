Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793319099;
	b=290xYKzmtM2a4cGD/oHGKhPyVgtr/CLq74tOTn32ooaIgdpbFJA+1sGDcDoAWa/2GmIK
	 4+tmSo+SGNroKCkyjvq0g2mjx7ooAjRRASrH1M5W2pGfrcbp3FC0HJIKKjBmu9R4+dB3E
	 BM11UWVUgmbDSx4qRKFI2PxBqs9IejLfpXfW/k1T6IT3IyioqCqdq7L8c0RP5+CkW8zyq
	 dqBikiHMoEPpBb8oDzKkuse9Hl62Mt3YoI+sKf8luP9kkaOZb5w8md1x0mCX0vH8DDcI6
	 Wmr+EXqGlSTl5J1ZKKE6K/7rRsFyiHlk3Pbi5uESsbrHPWz28ddFZhYDu8sC5LSW8Uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793319099;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=eMFC2eyPXrFFKJU701P6neL6odKYpxUo97XpYgZl+Gs=;
	b=UH3ra0L1CXiiDeCDoNZs+ACJ6vXBVxmuaHAqrmsl0DKUC9UKy0C01dM0BfHYtbZKKS5h
	 46P9obnT960HG+MuhpESDmnKySNaySrJ20ZCVdpuVjt3CyahaTwBOsrDN5CXw13/77YGd
	 QR42U5mrQDIKHxvFaPc2cfguCd0+mQL8FVvVTz/mskpkk40pf5aNFe33ajq4neCutf+X0
	 cLF7FoUXXuWG75wDgukTgH/ncAx37fpRjVcIGJ9/cDodPpoygsEx/3aem7xXLRAdilnFZ
	 p/22pPcs+c5HsD+ehP9cSQQUrjYLk0a6SiRBGs1pm6fD8bwpP9+ZEYa03q7XR5noAzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=es3RVQhR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35665606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 00:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35665606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=es3RVQhR
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so216725e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 17:11:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793319097; cv=none;
        d=google.com; s=arc-20260327;
        b=ol2RkD7CZHuOm8gcXFZBzCEF1vU3EWsftYXXXpHrOeqhZyannqIdaM1Vnyrifqzlm1
         DTT7Fuz6p8HEuJUMLx14W8g1l7tbAg27guEM29JkxzvhhPLrFpb6qmKw2uw1lhZvAwww
         AtEBOzmoTMTv9ayNg5+yK477hpfBRlCmCB+SY4j7GGUedJ3IWNkla9+DbatW82d18vFu
         xxD10xKVvqbWIm560BTYMUvfeRJl9RvEmw2noVKwfy0uS2cdlWeCetHQhUE3FjQw5tpi
         xoP+vOhQwpH5QhU7jpWwFYhKThH7hr/SEpbNoeZNZGWjhXwtTruHUugbS/F7Ljs4Dmu9
         jnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eMFC2eyPXrFFKJU701P6neL6odKYpxUo97XpYgZl+Gs=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=hpS4M5anYUF92RGZ6M7MNjhmCPL3glOJvyalIUZ1ep6+zA/+4xwNrZHBPjfRk+rWl6
         cup1CPhfuBxu3FS11DgG1e2h2j1mT2qSudkWa4+HcStq19uP+LT0tZNggMTWHl7GGphA
         1Y0EE7+X9FiOgnPHSUWfG+Nnd7HCOB9mHjNa35kGFuIxsbRyF31zwCWduoyLopjKfiFW
         y4VIERC964My9X4jipoeiqrL8lhHrCtTg0CQFillPfkj2lvTpXIgWPkKehUKTDuUiK6d
         7og/MWtDD0zkk8efRQv9mJheBC+InFWab001Y7fHSOeFEgJeGvG0J78Pw1TLDPLG2xIK
         ej6A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793319097; x=1793923897; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMFC2eyPXrFFKJU701P6neL6odKYpxUo97XpYgZl+Gs=;
        b=es3RVQhRWke8GUoOVQJsv9VNtxoByQbPl58Fv2DN5Pdon3Y9e4tgn9gT5zD4SxySzD
         dqOVbr5W33r6VETV/lqBRyh8s1AU51L5d3NY7hilcZ7xQp3qNoAenSMOOKOjFPFc+5/u
         gw8USZBduWH8wiajnh4weQg6XeCevlTnrDJL5icJ3UjL76lJOpbNHr5B09mbd8Ayrrb4
         lBjlgmi5A+4ac2MeQEK5u8bPDtWXqUZz+3gS2DCLFh1cnC3jg004nO/s0+2oTjjonirI
         xacEYLRZqcylFJp7MPs85PeBn/mhCzMJIAt2gVoUTQ/n2nScEr/VS7ZOktfQIWLdavfj
         stDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793319097; x=1793923897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMFC2eyPXrFFKJU701P6neL6odKYpxUo97XpYgZl+Gs=;
        b=EWdIL0Qn1VUQ++nirzbyyzNy5Qgw5y2fu8xCgK1WB5IWtNbTg8tprtXUjbvKxyzpP9
         /Bb1DLCdeLcrrrgqow5QTeBqF36yaV4+CHZoEoNm3ddsxSEIq5zJd7GXbEoI3jrSxRqp
         xlUJYAYYoWIlySsfGdS4d1pdATpr0l8CI4nTS8NVLjk6xLM+P//Va1Yoba4RlLX4DqJq
         bO1KFe0Td/qVxCeElKYWSK4/1h2WSrYV3ny4ihFRMf4PwVV16C8/CPqzK7YTY4IYM/Up
         QB8peM3SJcyafqT29TEjdA7h6r2qho/2ZZy4vivHXH3hMIxNXnuCl+Nhpo+8IBgkP/fV
         64xA==
X-Gm-Message-State: AFq9FYIV9XCi7+VGp+NL129laJRW9DnItYLqlsfLtDwxgF5bNnT5xd0t
	87db73V3wd2ySJ1meV9UgfeVo2oR5/s9mSBejqrE+jUYRQJbSJ4qLZkuFTOOIXR7xQcrMLtTSm+
	X7kHOuLZx80u6A35fLcVXLuCtjYpXixkGHg==
X-Gm-Gg: AYBFou12TnCJxEIMSuOP87rwNfg6cy/9h/2CUrsEG44mmVAByhLJHatzQEelA3Tt/Ym
	E3EvkOG0R93Jhal5rFIM3kgu++HTY31974A/XScYxS/5iIqAN/+UtVnF9VQBmGRp33vWA36HGu3
	irGoLSFSESkqG/QKKbA1gNDCTrBP5w7cVVSxoWfALb+rtNT81HmLKtIjv9zkWqSufQQa3o7bsWw
	DmXtXXBceIE5gAauTwuD55CoUuE14Z58fSg1Dhh2TIRE3VuSMuBb0tlB1AW2DSXEl/Cty2wwH+y
	iQ7G9eb4HbBQUbzWGhgUuWiD6LX6YE1Y7RltgX971wwDjdnZBQrrrmUPCH+KDn+Re5vP1IT/OH7
	X3m6V6GfOqlbn6ivRoZWiYAcF1h0i55CjqDhl
X-Received: by 2002:a05:6512:2250:b0:5bf:a467:32a6 with SMTP id
 2adb3069b0e04-5bfd957cd4cmr126035e87.39.1793319097124; Thu, 29 Oct 2026
 17:11:37 -0700 (PDT)
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
 <20261028030503.17923-7-kanchanapsridhar2026@gmail.com> <sashiko-outbox-188658@kernel.org>
In-Reply-To: <sashiko-outbox-188658@kernel.org>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 29 Oct 2026 17:11:24 -0700
X-Gm-Features: AclHuK-yXK_SCfxPeXOlV3-w-vp4HmLVTPHL5E8x5sdAfQnRtJ3WTsp8ODMhep4
Message-ID: <CACpmpodSK7txDECSiwqbZjuqs74YgL9TSAbfDNkg0cLrOwT6=w@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] mm: zswap: Store large folios in batches.
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
> - [High] mm: zswap: fix error return on buffer alloc failure in zswap_cpu=
_comp_prepare()
> - [Medium] mm: zswap: unsynchronized write to pool->compr_batch_size on C=
PU hotplug
> --
>
> commit 13a7e2ffeb93e24e6a8f400496ff51f01ce0c408
> Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> mm: zswap: Store large folios in batches.
>
> This commit introduces batching when storing large folios in zswap, alloc=
ating
> multiple per-CPU compression destination buffers when supported by the
> compressor and batch-allocating zswap entries from the slab cache. It als=
o
> caches the memcg writeback setting and folio NUMA node ID in a store cont=
ext
> and reorganizes struct zswap_pool for cacheline locality.
>
> > diff --git a/mm/zswap.c b/mm/zswap.c
> > index 19b7d60bc7d2a..c8890e8a9b836 100644
> > --- a/mm/zswap.c
> > +++ b/mm/zswap.c
>
> [ ... ]
>
> > @@ -866,10 +922,28 @@ static int zswap_cpu_comp_prepare(unsigned int cp=
u, struct hlist_node *node)
> >               goto fail;
> >       }
> >
> > +     /*
> > +      * Allocate up to ZSWAP_MAX_BATCH_SIZE dst buffers if the
> > +      * compressor supports batching.
> > +      */
> > +     pool->compr_batch_size =3D min(ZSWAP_MAX_BATCH_SIZE,
> > +                                  crypto_acomp_batch_size(acomp_ctx->a=
comp));
>
> [Severity: Medium]
> Can updating pool->compr_batch_size inside the per-CPU hotplug callback r=
ace
> with concurrent readers or cause a buffer count mismatch across CPUs?
>
> In zswap_pool_create(), cpuhp_state_add_instance() runs zswap_cpu_comp_pr=
epare()
> only on currently online CPUs. If an offline CPU is brought online later =
while
> the pool is active, zswap_cpu_comp_prepare() writes to pool->compr_batch_=
size
> without synchronization while zswap_store() concurrently reads it:
>
>     store_batch_size =3D (pool->compr_batch_size > 1) ?
>                         pool->compr_batch_size : ZSWAP_MAX_BATCH_SIZE;
>
> Additionally, because each CPU independently calls crypto_alloc_acomp_nod=
e()
> when brought online, if a higher-priority acomp implementation for
> pool->tfm_name with a different batch_size is registered before a CPU com=
es
> online, pool->compr_batch_size will be overwritten with the new value. Wh=
en
> zswap_pool_destroy() later frees each CPU's buffers using the single
> pool->compr_batch_size:
>
>     for_each_possible_cpu(cpu)
>         acomp_ctx_free(per_cpu_ptr(pool->acomp_ctx, cpu),
>                        pool->compr_batch_size);
>
> acomp_ctx_free() would iterate past the end of acomp_ctx->comp.buffers (o=
r
> leak buffers) for CPUs that were initialized with the earlier batch size.

Thanks Sashiko, for the excellent observations. Based on this, I am
moving the "u8 compr_batch_size" to struct zswap_comp_ctx, which is
per-CPU. In addition to addressing the issues you've highlighted, this
will also simplify the store batching architecture quite a bit.

>
> > +
> >       ret =3D zswap_acomp_req_init(&acomp_ctx->comp.areq, acomp_ctx->ac=
omp);
> >       if (ret)
> >               goto req_fail;
> >
> > +     acomp_ctx->comp.buffers =3D kcalloc_node(pool->compr_batch_size, =
sizeof(u8 *),
> > +                                            GFP_KERNEL, nid);
> > +     if (!acomp_ctx->comp.buffers)
> > +             goto req_fail;
> > +
> > +     for (i =3D 0; i < pool->compr_batch_size; ++i) {
> > +             acomp_ctx->comp.buffers[i] =3D kmalloc_node(PAGE_SIZE, GF=
P_KERNEL, nid);
> > +             if (!acomp_ctx->comp.buffers[i])
> > +                     goto req_fail;
> > +     }
> > +
> >       /* Skip the per-CPU request when decompression can use the stack.=
 */
> >       if (acomp_is_async(acomp_ctx->acomp)) {
> >               ret =3D zswap_acomp_req_init(&acomp_ctx->decomp, acomp_ct=
x->acomp);
> > @@ -882,12 +956,13 @@ static int zswap_cpu_comp_prepare(unsigned int cp=
u, struct hlist_node *node)
> >  req_fail:
> >       pr_err("could not alloc crypto acomp_request %s\n", pool->tfm_nam=
e);
> >  fail:
> > -     acomp_ctx_free(acomp_ctx);
> > +     acomp_ctx_free(acomp_ctx, pool->compr_batch_size);
> >       return ret;
> >  }
>
> [Severity: High]
> Does zswap_cpu_comp_prepare() return 0 (success) if kcalloc_node() or
> kmalloc_node() fails when allocating acomp_ctx->comp.buffers?

Thanks, I have fixed this.

[ .. ]

> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028030503.17=
923-1-kanchanapsridhar2026@gmail.com?part=3D6
