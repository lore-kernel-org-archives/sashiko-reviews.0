Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793337331;
	b=gR13MJUVBIdqdJZbRIqDUkaeZPPyqXYrj9uEfc2C8iMk2YrOxcHrRPRlrVqnoJBADxid
	 cgLZwH3dHMww+tKeuAm4skv9/ppwluiDpbgzY0NHqTlF54p5k8hZZi1WMcZOSB8FS14uO
	 GN9Ry74cUWMkciO1XFbqaAnvCMk5QzUpQxCJc9lPmbOMsRAvSayBgz1sHCImPPxUjiOBR
	 JcVBMPqVuhxfPnspk1T9P91/Dd5qUuSR6LLHPCaWp0QpzpzTGxZYeGnRlQ/yhLBgNaZoU
	 nZX6bJFPwI6OGxMU8St3UCMEX02eAEryYepSKYIYnZsFfxiuiIBTltHEU5BQfzpKVpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793337331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=QLAGb+5fV+Rq1OYzQXAZqcvS3JWFeskumWJFRjZQ3oI=;
	b=I4X02qbBjVHLboPhuiXE4hhzaCKqTxYudIV/CKZhwnX/yMPA1G7DMRGdoK97UJaPbeX3
	 /fCgfCsDqokupb2ieuTaUsXGT4ioKUxf04NTYOa6/JKfJN1CLMlYQXw9CUCg0vwCCawGy
	 OFIXHzLtQlRQ3hfb1mhuMrkHSqqyWDo83cxtqPXoFQmHsaNtke9RQvOMZZbShdUkp+0GC
	 53D52q9Mi4rOBBqPnP9HqGxJHJNmNYZfRKzxLeLYUAzgYqdFoT7+YbEpInrTP7BLy/Unq
	 /m9CYcXXQl40M+LMs38jjqRJm2ZD7te7piMaOHEVvi1bnStGxPW+k52Hopx/9qzgnhA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=meZ3hhNF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D036606A31A
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 05:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D036606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=meZ3hhNF
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so325766e87.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 22:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793337329; cv=none;
        d=google.com; s=arc-20260327;
        b=Kr+pLrlH9ylDNImdLiz0B3/HEzzixjYTE91SzCPXGsUXby6f6gIMIwZHEpxGVgjkPI
         umULi1AitWMj3IZisFLIay4N3nOkWUbGrlqh1FaA4DrhprEU7oEb1ywrO01WzmA8oY8N
         NZIHTghze+HKtHCJjxYvraynCsoBvuxqZbR96QWbLJHGADjT2i7jOuXoBQS5NuiEadug
         HYNTPYcj/qwKQnS7jzYc4ecyZNbPZu3ADivxI0y91KkNiSTzrgzMX4e3s99PLgAsk94l
         qEqeRTPf7IULNzZMmwOiUc9FRQG6zUhd8EGNXirsglN2HPJQM+0dmP+XAsBOcbzr5voP
         vgzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QLAGb+5fV+Rq1OYzQXAZqcvS3JWFeskumWJFRjZQ3oI=;
        fh=INjNmmHA7ztbj5+a+SXdF/cS9e7eP5VrVRtcqQVr4pU=;
        b=Wv9abmZR82d6qCY6pvrfna8hXZztMJiGWuJWmWB7/PfuzGckG3Gwd3sKqSHa0rlpm9
         dYuYfY1O6zyEFlJClKbny8QwIlDCBbBC5UyoIR6Oem1L1UHkDsUy/SC2mptjq41Ww90V
         rs9cJz+cmkAzHd4OZERumJaO0Y5fiacKOkPaO+GV5HOeQ7XcCvi0lhx+shBtbH0nFMK2
         aip/2XI68oXL8X3yPLcJG3rBdeMUaswTpld3LFCRZ76FevaJsUotS7SLDmuEE2x5L2lr
         ja2y9zfT9p7nYsGFLyD6RtDFQVbEWwDsHXkck32qXWFdSZVpz87UUWW+zqY/emX/2fwt
         RL9w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793337329; x=1793942129; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QLAGb+5fV+Rq1OYzQXAZqcvS3JWFeskumWJFRjZQ3oI=;
        b=meZ3hhNFL+h4fTAAyxQSiP2eFj6GzHNpmY8C7RB7OYg05pohv0BhDZKrEmA3SFT9QG
         MwSIldO+d4ITMeeP7389yE+TAqzztgWZjvqedAu8JYM87jsOgXJKJeQU3sgTxl+o0egM
         nGTZOITYnUHJ6Afc0HcjcRyyoslEcV5IgQ7yHuOBPAeWCORw61ts1soUPcilUhmwdZ3j
         ElMDjgEvVW5KGK3ui04Wj7LcAq5SSgnILkzoMemftooXYHo9y+d+kZvWx3y7tvPgPBx9
         Uvyb5LioYh6nNp4nuG/cz5MDkieqL8j++dmIlcdXT+GdBg97pZ4FMb4Fc3C1UsPL9nFj
         f7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793337329; x=1793942129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QLAGb+5fV+Rq1OYzQXAZqcvS3JWFeskumWJFRjZQ3oI=;
        b=C/dVQ2v9Y7wWJwWhceyzmFYFdRB3eIeaDCtgrqkNyf/jhT+1BAny7iF+P948ecyn9f
         FOAOBSFYUeIhCh3n/yphnPLcy6kmdhk8Nf/wj1mpouxhp5O834OO/uHn4p/crY/lzVRT
         r31ASlZZhbYuCjEdy7iaSA6HYdYp3L5TtQA/R/vYm2G6CL1WshOdFbODwCr4xjot3Wsz
         kH3P20ojH89U1iEtzn1Fki3KUOWO9uuictWbTqhbDMlZjbmAboWkNrgf9niCYr6yEI1/
         ar1ygKydJhhJSIDbqVQ8blWkaGH3Kc87wuj8FPlrdBwQ12/Z5ZR65ilruZddGaI5p/5+
         qm5w==
X-Gm-Message-State: AFq9FYIuP5Vurc4AS8onLnqIL9wnQ9G6P1a8fOgW580Xu5Zl152X8ev0
	4AL/pmlct1vguiVuDYcYuamT7qukc1t1ZH6ylY4AhMXMvrEAqEguHjuMijoHbzghtMd/sEWUWss
	fPR/8F04abyc88nqlk4913VzIEppSHIg=
X-Gm-Gg: AYBFou3qxZ64uS+H+eUw0HvWUR41Ms3jSyIXNJNDyGB7lXqxUYz+Dc/jv6UiQshEOmP
	M+50H7i/c9PJGEiJSwCSNNA2aINx9sg1IkxooFL/98lv6xAnR2fymLfBjTcXfnlb/uBkGgMTWyO
	kuRtrv61oZjXt0kMK2kVacp9ZncGsOmEK548BzXYMLvFYpCmZ4HLti4S6N+g2RzmiUoq6vBFFYk
	vUeeo5UFVaxpT/T8MVtdao1vyfjrSRtNY3enut9Q6EzvwWwvGGicW5BOpNoP1VpzM1/lmXY/KvT
	vJwRwq+Q2i+q/frcI1t1zmtNIyTRSLPAUUlpA+mPsfUQAYYlgtNaFoseJ5ChotcEtCQilos5Q8v
	KLx12sua+KEPV5rNu25vlGgSCsqHiAfZsnBjC
X-Received: by 2002:a05:6512:6c4:b0:5bf:6c4c:62ce with SMTP id
 2adb3069b0e04-5bfd957e727mr296888e87.55.1793337329304; Thu, 29 Oct 2026
 22:15:29 -0700 (PDT)
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
 <auQhULh1VTh6lWoe@gondor.apana.org.au>
In-Reply-To: <auQhULh1VTh6lWoe@gondor.apana.org.au>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 29 Oct 2026 22:15:15 -0700
X-Gm-Features: AclHuK_aVAvKy7VDR9aeCsm3QjdEtQQMz0IwVOpBUfBcF46N-aien0GXVvgDMaA
Message-ID: <CACpmpodWMtmE0yNVN656K-8fPZgTj_DSZ0J7qxou+5Asoht+4A@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] mm: zswap: Store large folios in batches.
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: sashiko-reviews@lists.linux.dev, hannes@cmpxchg.org, yosry@kernel.org, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, akpm@linux-foundation.org, 
	linux-mm@kvack.org, davem@davemloft.net, linux-crypto@vger.kernel.org, 
	rientjes@google.com, willy@infradead.org, senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 9:47=E2=80=AFPM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> On Thu, Oct 29, 2026 at 03:06:03AM +0000, sashiko-bot@kernel.org wrote:
> >
> > Additionally, because each CPU independently calls crypto_alloc_acomp_n=
ode()
>
> Why do we allocate a tfm for each CPU? The tfm object is meant to be
> reusable and you only need one for a given algorithm.

This is how it is in the current mainline, and has been for as long as
I can remember.. I assumed it was because we need a per-CPU acomp_req
to be allocated for the tfm. Can this be done with a single
crypto_acomp for a given algorithm?

Thanks,
Kanchana

>
> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
