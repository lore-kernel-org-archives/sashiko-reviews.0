Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795202680;
	b=HCMiT0sOrFxvlJJAWAM52+03sNg1p+baGJ01HtKK9JHW3A+tgMFgq4gFNlKVZmVEKfD8
	 gbjDL42j8zHrENBJSs1wMG4XR6Husx94tEgNJrHSSoNUGJaojSHNTZMfXkwkUtnmZ4rOY
	 c1uZYL6CqD1QL1cbmqkfXhoJlaMh2XBXYElp/e4MH58pKSuRYOOehsrmVqzClfOLKtbHW
	 XMvRCYvkO9EXEC0RMoND4nktBH39SFWpCcG6u15xR3rWZJprpuxayAYExBWb2b+ldPFx1
	 44dxMndSqoz/DP0RGJ4SF7LnmF7rqotr1j/UGDh/AeHz1AJrIDjFwOgUZFoBbB2rqqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=xcib+K/+9ejSnUqHeRUGsbo8GBDthvLScqBZBkgzZaU=;
	b=R0h3u/nm6blJohOuaD5UYc6wMlTcobBulQOOY01lz9u9pyIvbl+97BP0NfoIU88PGHJk
	 d7JZsO/8XXBK22l5lDRS1Oq0xBcC6Fz1jGAfLEe0xe8jopOZwj64RtnxzDhLerxgRdxeE
	 1v+FIpZgwMTqfFCM9+wD8Zbln6q0Ai8VxVQ6UbjR1KXpDMVi+3NIbWjVz/o4JLoH8hUrD
	 zRbmiTQrCBzcEo/nwoTCYrbf5HUSvG3Dj6oIgKaUSdvsIa/ZeAoH0ZDF/jLPTNsdRuMqF
	 IJQXDIszf6smWliut0VGWXvXm4Odht17bkmxRNRAtxXMTiLR9dpawrUK0dnFTfgd4BQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aw9p6ncU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88179606A6F8
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 19:24:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88179606A6F8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Aw9p6ncU
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso1217938e87.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:24:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795202679; cv=none;
        d=google.com; s=arc-20260327;
        b=Kjv4zwvy9oOTHbWTo8xgNtzfeAA1oVZmbBUwZf6YUmf5XPgOHJvJZLJdM3CVh+OVuZ
         9xenbeyaEhQzIWuXFj+Whaks4xG/oeGrmpt8pcx0Hmm9Pl7ZE9lKHJv8zMyEgJujqrxr
         GkUScH2GQam9J6FTMYNXAf8KWFbc4UllyzfUUOUgwUDBWmpAijCKVW7o9SKa/1KsZis1
         3WLAiaGS6QSjIF6bI6mbazTntlSYV/qxNOnPpNNw1rXredxf7+5eZlGI1Lj73uXk1z3g
         aORBBJynYXddKGOUJj4UHXeFvBMLcp0sxMimZIhGi54iW+yR9qaCXX9vDI6JuyKYqQq/
         62zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xcib+K/+9ejSnUqHeRUGsbo8GBDthvLScqBZBkgzZaU=;
        fh=/pNdPGSL7ubAyatZ82+wlnjupiDTvrpwsizegktnd3M=;
        b=qo9k2uNbOVNY+7D8tGySikRc5nyMSPPrI3Zxfx8SRlvuSe7XNATX047D9Xs8aDV5qN
         T5qQ4wqwPJ4BLuGfmVM0rXJetzcrkyKIrr9MJF9gl3Y+flipgdsb6fMUxrgrIrNCpPo/
         a0BIrD1tbtR7pRQg3jFMO5B9faURQW81kaHWypSpKPWcrqqHei/k1kmCLmj5q3dDxQpZ
         FqnlycSmxx213IurQKZkOYMA8Dg4vwt7EDVokJJB9lV+7UQ08xn56WFgm/dAhkpF5ivi
         4EvGMSNEb222RG3DEDkYGJEEcYdozxuKqwd2Tspsth5xu/+1gchYtX3vS9ipcfdMX84W
         oxZQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795202679; x=1795807479; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xcib+K/+9ejSnUqHeRUGsbo8GBDthvLScqBZBkgzZaU=;
        b=Aw9p6ncUa8AR95uZ4fBDiuvVE6ueQYq7BWd6UokwGIaLGAqWXGf0WPTDwMh7C4eN6X
         ptYlYk0TLJaLzuOtQKr6RRsYORldBmE8vXaPgIb+1A2spxh2RGpPpgd48sN4GjSmVD0m
         knI3gatlVimePP0sabWgSzYilrQVVWVJLLDS1z4iFg+TnLniEPNNuMO1m9b1J70D+MIU
         xY0iD12VKfxGdwfhIZ+inbIupf0HMFpF4H7XggCxB5bHeacAotUwCQ7BdfdtoMKgLB0C
         qObbj2/dUShPMtAy4cPLc2WSAa3vNEjnk4saKFlc53tsxChZ1yVH8hd7aRKFo1OXVfJt
         dfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202679; x=1795807479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xcib+K/+9ejSnUqHeRUGsbo8GBDthvLScqBZBkgzZaU=;
        b=C0y6hsoYRKMI4L/ioJL+OlIitMUlhToT/VIJrTc6dCQxYZHvwH9+TXPZFTA8LftHUh
         3yqHxUmPp3H6rI5fI2XJBWJw/RFzhID+5Hy7AcqYhR0H7SbndJEDTsAIVmVvl1qixjsP
         se5lYmhopKDSyvWYC3Lb95ARhwMK503U0A1tYx3wnuUmvGNcnxZipDyy5FhM6D2hgTXf
         rHQL0Q7hw0J1HLWxlfiD7vk+7aeqkmM49Ogb5cD1BmvLuy/QLklU611OXMj5VDlrDqt1
         2m2BKG7nQhsO2Qg6BCjNteeF8dE+fS3xn9HXQ0Eo2ambJx/PvlvKWVyzqg6G/iGBIYPZ
         oSow==
X-Gm-Message-State: APuU4Z876qEyt2JpkUzT2/qnEJRSXXcD/rmIimhV+64HJheUyu8QPKiQ
	0ad1I2QKiP0FXmpsC1J/PUWZOcePzMDrhUK9DiMWkOHfYPF6yX8kq2NF72FSBMTIyToqJdRoTCT
	zHR1jw2kt5Y1l8F1ygnvlCUQIiW7kFyzz0qXv
X-Gm-Gg: AZFdTZekbGMk33a5kcMlaR+Sn4QpnuyNOvYLiD+Zq7RyUE7rbMuL7LGC5kuEf8oyKwL
	ht/a4TKxBo+4hVaFI6l7kcS/jgczzok/peGEDQIW/rPKHDiHOYQDrcM3Cemr23l7/eiKcOp+Cvk
	9zZ1oe6d4g7uTpEwt2ONKfIhR7adgP1Y/Im8VywZ8LmVj0R7WcsF9KVaWJkY9hJagXknD2LPpxG
	70kkS4bthf4Jv5t/EJDFFtACThPaBlivHU05AjGjN+yI3ee5sox5po9CvmaXHIJYL6VKSBgVVD/
	03Nh5/EfWeckxFvO+/wbHnalibGElCzh0lY/CKF5T2Cwcz4BtsnQquQb4TeMW9tgG07b+/qtb0M
	K8+5Tiig050ekM4j+cW1secailiJF3K96AlZr
X-Received: by 2002:a05:6512:a819:20b0:5bf:d551:8c71 with SMTP id
 2adb3069b0e04-5c1bc7d15a5mr838569e87.18.1795202678517; Fri, 20 Nov 2026
 11:24:38 -0800 (PST)
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
 <20261106072412.7909-5-kanchanapsridhar2026@gmail.com> <sashiko-outbox-202710@kernel.org>
In-Reply-To: <sashiko-outbox-202710@kernel.org>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Fri, 20 Nov 2026 11:24:26 -0800
X-Gm-Features: Aa3M54rU46Ty9WvfOdS1wdoE0OXKdFP_zbBLl2cCiKFxY9ohzryN1SoHktkXPJs
Message-ID: <CACpmpoffJbo-8ba9kxjRn0mrBwzH3u=Cc3Y0kj_rDAnGrjWnRw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] crypto: acomp - Add API to get a compression
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

On Fri, Nov 6, 2026 at 11:25=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] crypto: acomp: batch_size gated on acomp_is_async() instead
>   of REQ_SEG
> --
>
> commit 2fa95d403dcc5d6c7b702698b0e306a5d643d3b3
> Author: Kanchana P. Sridhar <kanchanapsridhar2026@gmail.com>
>
> crypto: acomp - Add API to get a compression algorithm's batch-size.
>
> This commit adds a batch_size field to struct acomp_alg and introduces
> crypto_acomp_batch_size() to query the maximum batch size supported by an
> acomp transform.
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
> Should crypto_acomp_batch_size() check crypto_acomp_req_seg(tfm) (or
> have crypto_register_acomp() enforce CRYPTO_ALG_REQ_SEG when batch_size
> > 1) instead of gating on acomp_is_async(tfm)?

As described in response to Sashiko's v2 comments, this is kept simple
for now and for the only known use-case which is acomp_is_async(tfm).


>
> crypto_acomp_compress() dispatches segmented requests based on
> crypto_acomp_req_seg(tfm):
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
> If an asynchronous acomp_alg sets batch_size > 1 without setting
> CRYPTO_ALG_REQ_SEG in cra_flags, crypto_acomp_batch_size() returns
> alg->batch_size, but crypto_acomp_compress() routes batched requests
> (req->slen > req->unit_size) to acomp_do_req_chain(), which fails with
> -ENOSYS.  Conversely, requiring acomp_is_async(tfm) forces
> crypto_acomp_batch_size() to return 1 for synchronous acomp_alg
> transforms even when they set batch_size > 1 and CRYPTO_ALG_REQ_SEG.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106072412.79=
09-1-kanchanapsridhar2026@gmail.com?part=3D4
