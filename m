Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793341139;
	b=MuTe+Xsont38ZHu+SP/ZGMS3hGrX3qFjprZZPr1NoNvMIRBXlVnlJmgXaafexWgWg8Zp
	 9NAqfi+nHz4KVo9fA2j5kv3tBexS3p1W9wH0U/5oQegLDXCWJrOalBe7pkJij0CFP/j4e
	 SUi7M5U/fSywpswugHLj3gZ1l0XYrRwbtFzAq882320XZ5ZpchTkT65dn+eoWOLcL+AHw
	 +M1cq2DRrZXE7aStpsKjjvCZt45Zo9T2L9z9AIIO3LfquDKgnCROobQD+mOQWPwQfVkrS
	 V4tBzOtPZKivEJ69QTmtONcEqqnrfqf3Khx82PcZ2heFRLwyyfj/PXW4XuxdYF+QJ2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341139;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=qXCUTOuwagzXEtAyZOHJD9pG1akrpFTwm8J5Srg/dsw=;
	b=n7d2otOyM0jmG8RJ+1ebsuN8cOUZ7gIWlGg4UxChbzyFYYwhyo0e8sBcaHpBc0saIrer
	 9/QSFWwYH4ClhFWlketJ55mKQ7Km+nWcQBL3O+vLzsGr8KmVRb9vUYl0nQzjEAPfC/sq1
	 5W+/fcIKW5Xw7FHZt8SNb98NgI9A3y8oZEGL6svQ9Bi9yxW05lo4LGUxJnSzswMPA1FB4
	 BfONar/HEFvEHyyGRyXVSTutWA4BtlGsz4f8Rm/WEoVvtGbuKYIeXkMk9k1anmh6BQn0v
	 iN2Iun4FQPyBC61He2GBLFBE373FZwLJDkv6KWAQy7PXNWQNSrJvFbEGiWLtVmnvxuA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R593tn5B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB03606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 06:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R593tn5B
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba36cc21cdso642027e87.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 23:18:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793341137; cv=none;
        d=google.com; s=arc-20260327;
        b=mTHYxUs/+0NYQ07kOMSlLCUwmXpHmWl+LU0XBSOjOQ+JxQoxfEmPxLzwb4fwrjbpDi
         1hanIF4rOGJC51M/e5gYieQScxH26MRO7MrmkGc66in3yvv12r0XTiz2xLl9mLxwavBB
         hlzghOPWWHHzAOE/A9ntrxQGOl7hfZDvKKAvup3C0XaprZa9EPDgRYgoHMuUHGuwv8Gs
         JYYQ/uS/g80O7kk3rro8hDIUmVu14CBOeNj0tPr+oRYvqFenrfqov9n3QeMjhCkGdJDs
         HwgGh80LxeXV3szfUBeke5ghgxskpptYVCPqgrezvIuFl7Uao0qfblTzwKdJaQCPPMFj
         t6hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qXCUTOuwagzXEtAyZOHJD9pG1akrpFTwm8J5Srg/dsw=;
        fh=INjNmmHA7ztbj5+a+SXdF/cS9e7eP5VrVRtcqQVr4pU=;
        b=ENVAj7JV8ePnFtuZKY0O7gQ7kWzk3OOVTt8m2ACvbzpLx1Sj9sH2y+dP1G3H5TX82k
         VvMeViFCk5GRISZk5QTtrwTzJxFoXoW6tjD53XvxmjKsS9ZCgZMOO0xK6XuEYkfJ17nw
         v2wyALIoS9PwGD4oBZooyHRaNxLNSQZWCwOjlLEgdKn+9dvwGULMsXMN4jnDWU2MARjY
         2u+0XdC/7QNuZbKspKE8HDlgLcoMroRJQhS6hGxQVMGVatFZB0CvNB3qHJ1Ruk2hrYmR
         Wv5dvapKR90KlsjaI2oQ/sNktKIfW4Wi0uZu6LCvUlutvdfwetmZRs28sa/ZF2sEJUKI
         +4+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793341137; x=1793945937; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qXCUTOuwagzXEtAyZOHJD9pG1akrpFTwm8J5Srg/dsw=;
        b=R593tn5BtUWcnB7N+AeZFOYxxguvdwbCJcB5L87t9y6/2C6HsCVd21h+xC4lQPOQ6I
         stbag96yWQdgmWxEJU4UdAkMyJ6o7GA6zlqvI/d85wc0N6aHkWRX/hGpzSh+ThP/sncY
         mRf+tpurv4SkecGeFcm3YEqTaFYvC+tXPjVTJFrUGJ+2FABWXfeqZnKdpYZ6BFHkg+aa
         B05V0gSajtETADjnuqH+kR8FB+xiLAjK1qN2tVRMtWsPMQNvIb3l5uFo29ks/zmMxKoG
         ciB+WJMM9Kkw1KxIaQ4O9qL9jmDuV0flxCzpPoLBJ0VOG3rBPfLW1Dq2DKvwTx2mPzEy
         5BZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341137; x=1793945937;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qXCUTOuwagzXEtAyZOHJD9pG1akrpFTwm8J5Srg/dsw=;
        b=GY35Q6sv92DuOh7IJ4g+4ujKTZ6pumGRlMFnJCF+qDXGnzn58cr4F6qm1YW5xXdC5d
         eww+IkocUrTs9T0DmpbMXDQ09rroE5+74xQzATxVz6vA7uibXSQ3z5G7c0NM8CJc4pQl
         OQNVNSaXs8zUF7uNIBuA6E+5C/6bSfcgHWqb6bCvJjJ3eCKCC6W2oJ6XPuP/PWFmj6BA
         DgKWEqPZmrvlchOTDtqi4mFGItyjwkJjbK9qS/5xq4LOid3zL+SH1ONJQDNwxlOx++qp
         GMiVGYR/tB91X3hihOymYPrOUk/JpvLwY/J/5TPZD3gO8nMrv3DFqAHZhFD2grzDd2pq
         Z43A==
X-Gm-Message-State: AFq9FYJrEzA4Q4qSChAX8GRX+EVPYPKCYhJ+76JEcojI4t0sX72eqAYl
	ULObq4ATPVUiA1GaVtcxo6dDBsZc8PDiuFq9BOz6SmsfD8gjWzE9pRrigyLpkCOKi5j5iTb5gro
	diIsiB2AC+HtklR7W7rL/XlzmEMigTnc=
X-Gm-Gg: AYBFou13w8UlE6arwB+NZl4EO0fAc5VfNTbL10QVPq4sy5fAieFuYLqBNyRDes+i7Xc
	a04p1YXQsjH7SMcIacEc/4AhX+pQOAyuEUwQA5vELS0TbX7qNO+hY/Qw8iWOb+o4YExkZaKvF3E
	5ihvqc/hkEqD+yTbNmnZyEw3WoBlXfvApx8jRdvxz64S8ARQy1NSm8rlFPzheKmky34NzVNPBzh
	4fITNfJHhwc3Qr4m2sHBgvckZoC5jz5s0fvE39TY1K8iqtkL/9JxuV9xoni6LRdd8csbuQoCAmP
	G9W05lOYqmzfKEPAS19nkNMAoWp0+G7LYJUPxDnDWitZNpUUnLmfaT3eYDcOciQhll2lgQr9g8D
	IdObe367XFPbRKS7+j2rjyKCE0afE7u5z3PeI
X-Received: by 2002:a05:6512:4028:b0:5bf:d7fb:dbf with SMTP id
 2adb3069b0e04-5bfd955f145mr364874e87.11.1793341137385; Thu, 29 Oct 2026
 23:18:57 -0700 (PDT)
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
 <auQhULh1VTh6lWoe@gondor.apana.org.au> <CACpmpodWMtmE0yNVN656K-8fPZgTj_DSZ0J7qxou+5Asoht+4A@mail.gmail.com>
 <auQwWgMbBuo0YEBI@gondor.apana.org.au>
In-Reply-To: <auQwWgMbBuo0YEBI@gondor.apana.org.au>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 29 Oct 2026 23:18:44 -0700
X-Gm-Features: AclHuK9qSwZmk6xcNKVjBmbt8Cu41-hCRLHUBZIBg2QtW_8hakGVd1OzTQBnFWU
Message-ID: <CACpmpodxvQCkQgXUU6pF8d7onxHvHF7sEYCbTkv81WXyyrFiEg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] mm: zswap: Store large folios in batches.
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: sashiko-reviews@lists.linux.dev, hannes@cmpxchg.org, yosry@kernel.org, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, akpm@linux-foundation.org, 
	linux-mm@kvack.org, davem@davemloft.net, linux-crypto@vger.kernel.org, 
	rientjes@google.com, willy@infradead.org, senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 10:51=E2=80=AFPM Herbert Xu <herbert@gondor.apana.o=
rg.au> wrote:
>
> On Thu, Oct 29, 2026 at 10:15:15PM -0700, Kanchana P. Sridhar wrote:
> >
> > This is how it is in the current mainline, and has been for as long as
> > I can remember.. I assumed it was because we need a per-CPU acomp_req
> > to be allocated for the tfm. Can this be done with a single
> > crypto_acomp for a given algorithm?
>
> The request needs to be per-cpu, but the tfm does not.

Great.. we can save a lot of memory this way.

Yosry, should I go ahead and include this fix in this patch series? I
am Ok if you want to take this up.

>
> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
