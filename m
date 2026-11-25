Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795633715;
	b=AekUaoHXy4XRj/XZRvm14Pe6OI0zZz9FBLMX3B2nAdGi3RBQ10E8QcpTsbDzoVb70Rw1
	 idvGAjdswO6qlryPTYpca4MSWFqJVn280Myhlbo3ytKqFgBRPM9xj5qTLx9cOoG4mmM6+
	 lou5sR4XlDXNpUYGRnY5meUg2EA04xOaX3GZ6klut7yROdK9GDarDj2L4YH48M2cb8bB1
	 Z8qNT6ZMe/+wkOdTF/r37Qs2nepisJMz/Ez0rPMKyhPmBFi/RMvpTBpo8/pBa2b0dU7Dh
	 f/rKD0YXLnKudb4hYE6JuMpDoMazqPD8HE5ECZoaNzMZd9yCXeh6BDSV24D/lWL4lQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795633715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=b5Ib3pZkCzaItYZ7rw16OjgJtmjHoVVIe/AJzjYQtM8=;
	b=CT5HZkZLPWfD2muRSX0bDggYUp+DGXvHGCZHE0dYZ75UZzOhiI5epeBDxMSYmqgiomK1
	 YjUUfvlWW3lLWMoH4TnTZJEyhB4mPEZZRKi+RJicm+r97OBqg56ZrDzeSCWc4nkENWbRY
	 8e5+Dch2TBGh4xd///PVls1eKouubKziz13sUZ967B1mkN2xDwUPcmLiEzkg/9siotYlL
	 1vSHDv8I2nJRobdopuy98Rp43lridBNqE+zCLgON3FxA6Ff+0dVTFcxsMl7rshKwmYVPR
	 QzsQgHbuZr/mnKR6EqTSv8hAyBNhNqUovl5YCXTe/O+QKQ5dgwA8Zjf+KVZ+Nc39ESA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=obYN5Gyu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3581606A31E
	for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 19:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3581606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=obYN5Gyu
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c14a204305so4204862e87.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 25 Nov 2026 11:08:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795633713; cv=none;
        d=google.com; s=arc-20260327;
        b=KYS5hEGamtLwwlnxYKoPag2fBd6DLIm+a1fXvfkL3eURRMP5Zff7LdujfAKQ8PTFV2
         4V5hjjqbszHhlZTFwbtnnFxOwGLI00t7y/Push3wR8jBeyn0NNPMgrQSe19sEVAYZJx2
         RMQveeGRdbjDamV1mZr02N7grNVp6X29PF8UE0u/lUeL5E9UTbzZD5FpqPtM6SZk4Sbq
         9UQlY244r/FffocswZ8Lwf1jHmiLxlVDX0c//4PyPZdfVuElUGxeN1l6F/u6kFkKwt2C
         2J8/yCRRV9N27I2s4a3BgPxIhJkeEF2jkB2xHC51uriY2qPKRKfMyFwGkp72+8xveo8H
         YSOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b5Ib3pZkCzaItYZ7rw16OjgJtmjHoVVIe/AJzjYQtM8=;
        fh=INjNmmHA7ztbj5+a+SXdF/cS9e7eP5VrVRtcqQVr4pU=;
        b=n5EBqyGVBEHBzRnOqiR4WGPuuwZg/O5dPorVc7p9Mqo2K6tFCPQEYG0F6wUVFtW/Qm
         Rst0onvBTmZKVWww1bBlfXYNh+bXI7EMqaCp17IyQruU3T8m9rNJkroDBRQkYq8iRpoi
         2pgEkfDfo5wj4DrWP4OAQc5jCrz7FNiVrG7SlxrfJfqO2uQw/kRhlz01UcZBlCQdnhKS
         DBaYP2ZoxhBCpIkpXBbtFpmremzQi/02GDsZxvHCVz/UoDf+Crd8oI3tnAG2JgRf7eG5
         aLxBMq+U9/GILeFvjU4u8bxlcXTHX88U6idddeHh937uoFlmxjkjty62k2UEvMgW7VeJ
         5OOw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795633713; x=1796238513; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b5Ib3pZkCzaItYZ7rw16OjgJtmjHoVVIe/AJzjYQtM8=;
        b=obYN5GyuoA4FmbUxqwEl9bHxbf2PaQPTmR/87W4ioSs0Eb+GBJO+hdbx64AkEDViHf
         9Gnb3/HDfuymb/YsFcCyZ8sdVL9ruN0Fg8Eq0QJ8cBvKuOGi+1w9qjtV7DExUQsVv5v+
         ZohOg/B/8LoZ9UyVjgGapHlHORWV+lQrsuCRi1Az/XxuIiKs3VwxWevVrvPZ8adhYEmZ
         IHGIoQx7ms4YiKAwZH1VhTKQxQHaJSWFJekd7oi5gXHKe6VYUsSr8tDrJm55aWXPwjfh
         UTlX10t4fbf6u6vfMewXhH2emWVRSr4/pIt4RaTAGbdZDzp00etyp4TwoRvgzjhhHLjm
         8GKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795633713; x=1796238513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5Ib3pZkCzaItYZ7rw16OjgJtmjHoVVIe/AJzjYQtM8=;
        b=VxfnM9tZLdf09nH9uJKw4lzV6JZJEYg82noTt8hXj3ViG1WVlPIhfA88FUsoakeY8S
         /Mzz6l234LIInKTEpho9RgH6OBUSzoTlmeIKiUhw1TDAlWUFCqWVDC58AnbMUxvwCDAc
         1OdwjCjJGqRmxhrQ5Hl4NDwBL0dhnNu6KJaLdksu6M/LfSQtgVNsGfZYBDnGgidTQdlH
         FiVpi9uXb8kD9F9GsmInQzWdkmKfj1cbzo8xBg/Jy/76xZ1dI7udkfSTEXqMItEiTtKE
         whh74uwuiD/f0Ep9FNpCVAL7J9T5BBsyGnnE4yWEtT2P36D0GlXc+kGTk++Lb4GWusTN
         DZuA==
X-Gm-Message-State: APuU4Z9tSeTeoHct1OTWMb7P/r+wg02JYYXxcDO9XI8HYkgWr2w2SSpC
	5ym75o/b8fpv+0UKTbWpPNt/e7eMq45+KFNSVTJg4GLolFnSJcCXY+zdVvBjzMgcEdyCAo3hbZc
	1ttJMBMXm1C0D5PIlqnCy7FOog1o11BY=
X-Gm-Gg: AZFdTZfjbYkilmhiLxeqvsb/QU4kWPZipFmyphikFZ0HhlbKp4vZ+3jAxqSDeQG/qnR
	pHdlYR6DhBhNsYlBWGaIZmt9BTdztIMvlmtBRxXSS43O+FLGgfDzQwSBrV53bl8sENaavhE0msg
	ofowpG42m/ZFD0l8VaJEsoOQxo1b+6/UFLIyQ5UWHV7NLR7sVbiSzYBTpkcBI+xzHvObDDgEieQ
	ho2Lcg57Uk+QhxAKUGsTO4zsRJK+et5N55ScSC7cxp/NqdKoMFvTUgcEhurowc+5F2TN5f6YGcK
	NgtdFlAxw+ROFRVxeQuYieah/szS4lwppeuy/eIdRE63u7jbEXRZkQ3qWI8t+/eNROyrx/8+Znn
	hT/4yD03NQ8n0P72/MjN3vNRHDBd7biDHwgEB
X-Received: by 2002:a05:6512:2255:b0:5c1:4f2b:a2ba with SMTP id
 2adb3069b0e04-5c1bc7da45bmr6431675e87.34.1795633712661; Wed, 25 Nov 2026
 11:08:32 -0800 (PST)
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
 <20261106072412.7909-4-kanchanapsridhar2026@gmail.com> <sashiko-outbox-202709@kernel.org>
 <CACpmpodxjJ3ZQt4xOsWfWQNjgMtPzKx0oGMy+mJTU1wxVWdMUw@mail.gmail.com>
 <awQCFZSSng2LLGnX@gondor.apana.org.au> <CACpmpocCqenTNv62dGoeSLP2zs-AXJYhXM-tj2cytm4zQTj1cA@mail.gmail.com>
 <awafBxDtUoIQW9iR@gondor.apana.org.au>
In-Reply-To: <awafBxDtUoIQW9iR@gondor.apana.org.au>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Wed, 25 Nov 2026 11:08:20 -0800
X-Gm-Features: Aa3M54rDO2n4sQnCYgEeJJ0BwJAh3cqFRPzK3u4L4boBFDbFL3ETCr5fTYtU7WA
Message-ID: <CACpmpocWW7pWGYiF==DupmZDB0-jETu32C3-9NYY8nssKcDm-g@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] crypto: acomp - Add trivial segmentation wrapper.
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: sashiko-reviews@lists.linux.dev, hannes@cmpxchg.org, yosry@kernel.org, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, akpm@linux-foundation.org, 
	linux-mm@kvack.org, davem@davemloft.net, linux-crypto@vger.kernel.org, 
	rientjes@google.com, willy@infradead.org, senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:41=E2=80=AFAM Herbert Xu <herbert@gondor.apana.o=
rg.au> wrote:
>
> On Mon, Nov 23, 2026 at 01:56:19PM -0800, Kanchana P. Sridhar wrote:
> >
> > diff --git a/crypto/acompress.c b/crypto/acompress.c
> > index df9e42f519c3..f0ff821b3560 100644
> > --- a/crypto/acompress.c
> > +++ b/crypto/acompress.c
> > @@ -247,7 +247,7 @@ static int acomp_reqchain_finish(struct acomp_req
> > *req, int err)
> >         acomp_reqchain_virt(req);
> >         acomp_restore_req(req);
> >
> > -       if (req->unit_size)
> > +       if (req->unit_size && !acomp_request_dst_isvirt(req))
> >                 req->dst->length =3D unlikely(err) ? err : req->dlen;
>
> I think this should return -EINVAL in the sense that using a
> virtual address with unit_size cannot be supported as it makes
> no sense at the API level.

Sounds good. Does this look Ok to you?

diff --git a/crypto/acompress.c b/crypto/acompress.c
index df9e42f519c3..88f912103e8f 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -274,7 +274,12 @@ static int acomp_do_req_chain(struct acomp_req
*req, bool comp)
 {
        int err;

-       if (unlikely(req->unit_size && req->slen > req->unit_size))
+       if (unlikely(req->unit_size && acomp_request_dst_isvirt(req)))
+               return -EINVAL;
+
+       if (unlikely(req->unit_size &&
+                       ((comp && req->slen > req->unit_size) ||
+                        (!comp && req->dlen > req->unit_size))))
                return -ENOSYS;

        acomp_save_req(req, acomp_reqchain_done);

Thanks,
Kanchana

>
> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
