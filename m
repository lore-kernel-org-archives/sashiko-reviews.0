Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793252955;
	b=0eZ9lNQdtVuc6KSJldgCbyRn6jxXFAKZNXJkQWXOQ+SPmHJCkBpVGtf3LP4wYXm8jp/P
	 ATc0U0+QzSjkd1RkTGtiFR6Q+HcPE5gyT+5EXHmj+77d0vmgt9MrQEZPpa4fmWN08tFiM
	 e0Jy2q2Rp+yUmwByFf1+3iT24xEAi/1eMDihiYC80NsnOn+wVusiXcIlWWXQHM4+680mu
	 CCo79bI5q9cpg15zfEfdVdT96g9dSEXR2xisACJvk8iZO7oViFW0Rh3PC78eNixsqbCI6
	 ljIBfGw9aTa3R1HnY3LnfPLpig4DWtth3WXhvpwjlPhZfSpu6aJRBuvBezCvEjVMtKw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252955;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=qO35EV0mnWV9G43hoQX9fpVz/YShAelE6s2Ci5t7qJQ=;
	b=eUEDq68sgONRorE795pGwJZObto0YwM1fe3LeTZ6YzQsYp9S6vkMiufQZr7pqbeIhtXy
	 zI0fL+kMUzX/EqYnH2FRPJ5RqKNAWQcviQ1e1jj1gYlRSkHtG70u6kpj8zDwlEqPvJChc
	 qDfYdkp/gwTw56ZPKrxc7Mo9K39TEJiDN3k0xpUCPB4YHGd42ATGFSGiPgjeQlC0nDCCZ
	 rEpOT+P0kJo528a6vE4WXbqdFXXTvW12ybYq7d5QSWLZ2jB4KJxVuHn+wMvhd+QEWd1GR
	 L4cm3fnuDROA3kswYcyNua/oxaOcpCLfZen53LBcwZz/rn86ZO+KVTtAfvrZBngZLeA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IHGW24AJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23647606A31D
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 05:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23647606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IHGW24AJ
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so1829341e87.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 22:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793252953; cv=none;
        d=google.com; s=arc-20260327;
        b=CdHT1dI4bUAZHNOz3qU9VLdpLRWIhesEIQkCOi5M9nQ2X4Z7P9aAy4rJUVpeO/hUxk
         pu7OGcThkuvDAMlhnQHX25uiff5O7kOG+hqmrhlrkuLU8NJNGHQ06CYm3qwkgi5M5/G2
         eeTbMwELD2nh0PYEFDaKXKiq1R5owy9pQmRi2ek+YL3G1oUvYVudolUGczJQvNwWBJKl
         3EecJL0VOy2DqyT5gLhd2diJOuR207nIUY/UwvQ6p1O9bvgJR7vXq1Cg2+36pnx3Ob+J
         QBLwz7sDFV6DeKHdLS8aStElhXxuUm37SYY19mcVp1YtZvZHJ7aSLRkGlWdz1Tot5FtJ
         wK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qO35EV0mnWV9G43hoQX9fpVz/YShAelE6s2Ci5t7qJQ=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=HZ4LApc/uOv4sPxta0nthVLdAdQ+3I53556NArs6Z3VnuXHVtIvqf/fK2sJgMbpn7T
         B1L8wHqfw/C0d5SqZHiWWKanPS7fZjnbBocj+WlnvmxOPPbX4fGhPLDGg33SxTCW+L0X
         EhMRb7FwXjAByv+7WTc2gdxNFxUjkF5qWAFpTT4j/dXmkiKYg1ks3iSkGvSMDa2jLeZJ
         ZZiQeecD1Pt55MUNcAtweX6FeYaWszrc4dcpd8HSplSrjXLwqavPeGCFkvh2/cezEFlS
         3cdFFBEV5cfzKayrLz6YYjlUa02WK4+iVBhOhKqsqX+TxyLYmKIx+fiLF0Qb6pbHUVpo
         12EQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793252953; x=1793857753; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qO35EV0mnWV9G43hoQX9fpVz/YShAelE6s2Ci5t7qJQ=;
        b=IHGW24AJv1BTpC0Tz76bUlZjOyym10t8IXZHkMc/m9Fj4feCn7nNjUzbbEBAkgo1tX
         ktIBj9vSqdQWEVgEsh4kRikCymAI7K+cC6aISiWdD+Bt3Y2Ox7npRNmmfcWw/GgR5Wbk
         G/R8+cZcoCx06GTPEDwIVA3/5UnrOZFn51vMd/x0/SwPKyRtvTEZBp0z78lPsHBR2476
         /rcxijeKjtGdJW84+VVMWnuIAZ4KImr+Ol3Lxs29LwsAgbTYgnlm8ZoB3bhD3RQf8j4y
         51CmvV/AroxFCUaaEJLYDCE+Db92XOKz529Wpthdeu7xjVCGyhSZDEYKTUGdRo+54fhX
         D7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793252953; x=1793857753;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qO35EV0mnWV9G43hoQX9fpVz/YShAelE6s2Ci5t7qJQ=;
        b=inXAh3v6cOfJHPF5jt2Vc9J1uSRyFuBi0mYeuBwDMegoNnqGoU2gcV7XfIQjwp/aF9
         9nYCsHSie+mcND4lCRzaVdEY7ZjJJv/n40xxACp1iPlBVWtiuE3VSeMQwocNvparxFly
         b4WF5jAjy50wdcCWK9MQOteFdPuu9mHkqGzCbDywwVE/64lnpAxPE8RyrtXGJYt9QMy4
         Ej9XDqpYoQP5131bZsDq1pGKvuWA0QaPtW5kwLyV2zS+QI9s33Nbap7fah22XC2GHGEl
         qAMmGaaFIloZVrmxsMX141g2Iy0m6iSMMCrEyf2x1NGX/RHXCrJboeSZpkqxA7qyRoTq
         /ZJg==
X-Gm-Message-State: AFq9FYIactI5Jpu7JbBr07Ncdd2gHvXu+/8S2RFDaavvSyNYKPsaDlO7
	z1pZKX1E0q4EDbVTcSZFuB602wcQ0Sl8CnCu96/tteuKoK4AUsQpur9X080uVfVA5cNPkdO6nzL
	o9Yrx6cmq5inVwmnnhOmB1SxV8E2d0cTTVw==
X-Gm-Gg: AYBFou0m8nEzdHEzpACUucPZGM8IzP0DfzfEr6dCGKHs7q6QEcyoIyqv1Qy4DINen/F
	yRMzPOCxNwytFCXiMJumPgzpqcedTCO/WfksBrp5rTR5A6jG6/uDKTV6RGVhJNPwXRWY2wu5ySj
	2774sYJn8p0DZoYqVr2vlNXOLInPHN3JPcdDaobII5M1/iyZq7/3sStVDHgUK+EFOHxYO736sh7
	ixEIvEbXhloqESghglQa8V0RgZMQstVzUgp1HXARJueIkkQuNE0GF2NrRHrGLWJscHzxW1SVVll
	y7pOrMcNnOahWT/Z7m7X1CUV/Lrz5z1WjgqP0xiQSyPf5FBwj6N3inp4sHnPh4yQBTbiWX3GVRy
	ZzjkfWGHNoxEqQhPkMTLxReuED2Dn9uehY6M4
X-Received: by 2002:a05:6512:3e22:b0:5bf:ce85:4d55 with SMTP id
 2adb3069b0e04-5bfce854e61mr1159757e87.33.1793252953140; Wed, 28 Oct 2026
 22:49:13 -0700 (PDT)
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
 <20261028030503.17923-5-kanchanapsridhar2026@gmail.com> <sashiko-outbox-188656@kernel.org>
In-Reply-To: <sashiko-outbox-188656@kernel.org>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Wed, 28 Oct 2026 22:49:00 -0700
X-Gm-Features: AclHuK86TsSiLkFwQ-i4UWDD9J3s6NPe_Yms66pEsTQGm5NwMn9Bd4NlQj7Tw6c
Message-ID: <CACpmpocJNk=WEE0_MiRUoWNJGS9wy7inKQ2pM6kNrdxaxgt0qA@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] crypto: acomp - Add API to get a compression
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

On Wed, Oct 28, 2026 at 8:06=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] crypto: acomp: broken type check and async gate in crypto_acom=
p_batch_size()
> --
>
> commit a38b95e87019ff2c11b51ebf159a082ec340456f
> Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> crypto: acomp - Add API to get a compression algorithm's batch-size.
>
> This commit adds a batch_size member to struct acomp_alg and introduces
> crypto_acomp_batch_size() so callers such as zswap can query the maximum
> number of requests an acomp algorithm can process in a batch.
>
> > diff --git a/crypto/acompress.c b/crypto/acompress.c
> > index c55b0e8eff3d8..8e285cb7477e9 100644
> > --- a/crypto/acompress.c
> > +++ b/crypto/acompress.c
> > @@ -326,6 +326,20 @@ int crypto_acomp_decompress(struct acomp_req *req)
> >  }
> >  EXPORT_SYMBOL_GPL(crypto_acomp_decompress);
> >
> > +unsigned int crypto_acomp_batch_size(struct crypto_acomp *tfm)
> > +{
> > +     if (acomp_is_async(tfm) &&
> > +             (crypto_comp_alg_common(tfm)->base.cra_flags & CRYPTO_ALG=
_TYPE_ACOMPRESS)) {
> > +             struct acomp_alg *alg =3D crypto_acomp_alg(tfm);
> > +
> > +             if (alg && alg->batch_size > 1)
> > +                     return alg->batch_size;
> > +     }
>
> [Severity: Medium]
> Does the cra_flags check in crypto_acomp_batch_size() distinguish
> struct acomp_alg from struct scomp_alg as intended?
>
> In include/linux/crypto.h, algorithm types are 4-bit values under
> CRYPTO_ALG_TYPE_MASK rather than single-bit flags:
>
>     #define CRYPTO_ALG_TYPE_MASK                0x0000000f
>     ...
>     #define CRYPTO_ALG_TYPE_ACOMPRESS   0x0000000a
>     #define CRYPTO_ALG_TYPE_SCOMPRESS   0x0000000b
>
> Because (0x0b & 0x0a) =3D=3D 0x0a, testing cra_flags & CRYPTO_ALG_TYPE_AC=
OMPRESS
> without masking by CRYPTO_ALG_TYPE_MASK evaluates to true for both
> CRYPTO_ALG_TYPE_ACOMPRESS and CRYPTO_ALG_TYPE_SCOMPRESS.
>
> A struct crypto_acomp *tfm allocated via crypto_alloc_acomp() can wrap ei=
ther
> a struct acomp_alg or a struct scomp_alg. If an scomp_alg has CRYPTO_ALG_=
ASYNC
> set in cra_flags (or if the acomp_is_async(tfm) check is removed), callin=
g
> crypto_acomp_alg(tfm) performs container_of() to struct acomp_alg on a
> struct scomp_alg and reads alg->batch_size from unrelated memory inside
> struct scomp_alg::streams.
>
> Elsewhere in crypto/acompress.c, such as in crypto_acomp_init_tfm():
>
>     if (tfm->__crt_alg->cra_type !=3D &crypto_acomp_type)
>         return crypto_init_scomp_ops_async(tfm);
>
> the code checks cra_type =3D=3D &crypto_acomp_type (or masks cra_flags wi=
th
> CRYPTO_ALG_TYPE_MASK before comparing against CRYPTO_ALG_TYPE_ACOMPRESS) =
to
> verify that the tfm is backed by a struct acomp_alg.

Thanks for suggesting this. I will mask cra_flags with
CRYPTO_ALG_TYPE_MASK before the comparison.

>
> Also, should crypto_acomp_batch_size() gate on acomp_is_async(tfm)? A
> synchronous struct acomp_alg registered via crypto_register_acomp() does =
not
> set CRYPTO_ALG_ASYNC, which causes crypto_acomp_batch_size() to always re=
turn 1
> even when batch_size > 1, whereas segmented request handling in
> crypto_acomp_compress() and acomp_do_req_chain() checks
> crypto_acomp_req_seg(tfm) (CRYPTO_ALG_REQ_SEG) instead.

This is a good question. When the patch was initially planned, the
intended algorithm for batch_size > 1 was async, that too for zswap to
know how much memory to allocate for batching resources. Plus, we did
not want to impose strong semantics between batch_size and
segmentation for synchronous algorithms. The only known usage model
for batch_size > 1 was for async, hence the gate to prevent unintended
side effects until we know more about how to evolve this.

>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028030503.17=
923-1-kanchanapsridhar2026@gmail.com?part=3D4
