Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795470995;
	b=2cZ7z2oREyacAjWixIlGNEhc3bnawXYXx+1ftzwXKH7na7RkfLUQxrdM6cXHMAiqv0ak
	 jRLSYkMeaM8mIn1OUmPgHcKInGBCOjqJebPBYOp+PBUka+Bns/daUbIP+Dckad0WUa6lm
	 4ZikBwCs6aNgFSXL2+omUEG0YKyrZLGheeTSUQCdpoHWNTUbxeoDeaEajsSpSYTateMok
	 puBbW7g4LhPQcO463yvHo1s9Q9B0hqVukDv57SIXnfiIeFtH8QNxzONfy9Sj5KvZw/zZS
	 +dBM4aSK7SNvQBs4g0tbiBsUER0agRZqeCXNhrUKk/0nkIRhYDlXw+0szL4hNx7+y4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=IsBnDjv6eKAj53VbUsxqB2MSO2RsWLKcSPlS6sf3OGg=;
	b=LFVWgJdbcpPlojZLfUpxAs8aQ72Y/VZUO2IjvqkkuzylMUEu8En8zlZWWcsm0vqm/kTL
	 6Vj/ZchK9zZ8jb33ynkAeLW3rRx9QRuuQAJCk8o05j68YWgdwdgSGVfzKld3UDVGoxqp5
	 RDyNd2YLaKRMhSWpFDGuPrgx8s/5mtVQ9yRMLLeMD7D82n2+6bwITw9xl9ypS+Wk74KLz
	 t73hqn0qSgagakkNDBE6kzrPB+1oiRsMwqS7Ne9zwVwwk2ZfL+JUTRevNxyALbmPMfkbn
	 HoLa+w2cWHMFx2zFP9hR7k+C2h7JGy0KOCj3zOWVgTOh2d3NJ5m2ZoUvPcj1ckpa2xg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryucv+DA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ECC606A333
	for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 21:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0ECC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ryucv+DA
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adfc004920so35656741fa.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 23 Nov 2026 13:56:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795470993; cv=none;
        d=google.com; s=arc-20260327;
        b=PL9jPDy69Lp4CG2KouH6jdf+PN8XuY+lNQsaCMWyfvmxlWjd9BN20wrwuTHPS92mCj
         rU6P5s7p8BPhD38R3HIQj7Kx39M8NBD/lgev9DbpuEaDCawvCUmn/cbkHr5iZ1+NE1Uh
         NdbeRBIRzjs2284I7G5uyJ8RH8RBcCEmVjiDRuFKDKpvxh2DskuoINHXnbZgps+WPJvn
         eYx7AR3RErwoZYjFTzJbTBI6a/Z8c/yngHJEyH83hiUWVsAFTbBk+4hlzmcKAZO+A+5E
         NsPA0eTG6LTz7sQhMZgWY2Zn3yzunO1a6cCaT8jgHOj9lgQYeVWUENojJOmPJOH176cV
         SjAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IsBnDjv6eKAj53VbUsxqB2MSO2RsWLKcSPlS6sf3OGg=;
        fh=INjNmmHA7ztbj5+a+SXdF/cS9e7eP5VrVRtcqQVr4pU=;
        b=cqZW2iRq0SguFeOTEXsFezUaT08aq/ruo2xGz2UNCDqq6TS9s0D2Vb2tyUsKb5i4BQ
         Jc6OhxSci0y3stS8q3aD8lJK6c6XBcdQgJXkDeJ0Z5vC5f4+DNgeUGiJbD1niNXFSP8m
         a8YTaap0dhEzsoshZYi+FKUFFF5HfZw2ixdOX6varyUrzP2dENCCHWPh/iZQqYEH3WUH
         DZ+hkgr9C6IfyeKsrOhyhWixZOpZjKS8og7SFUsoeSTucy+CEn/tX7lZPHu5IFG1Un01
         g9V28UMr0Qc8QT3dCyK4FoEFKHHesA0HcZoFnK7KcTTJqiwxSB/beG/FAFgW8LzhQhRm
         P9HQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795470993; x=1796075793; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IsBnDjv6eKAj53VbUsxqB2MSO2RsWLKcSPlS6sf3OGg=;
        b=ryucv+DAnidSQ41WNmMe1lypH7f1EVPza5WT9NoB3kxfUmwglCfReQivAiZQ8/Zvvo
         688DLUmjV8XDdorsreKKPuFIx1TQsdOVmJHYCVF/XA6f6hGtccmIB0QJgiy2XRC9HEWo
         WOEgl6veFk7Gi1GbFNlJfY/Gfs9TsxLiF31fe/Eu/inqcjsKPxJJ9G/Jo2QCd53uA8Dv
         0VLKpPignlB70nRhG/m2sXHZo8hCUltEV0h90oPMmN60YSRVoGi6AKcWnmV1JsrSceC0
         ycKRy29kS/UdscktkkO0/x8yUG74OuHd7UsFiqIGqJbMHgjwGf2+xe1p52VrijrheJk/
         fFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795470993; x=1796075793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsBnDjv6eKAj53VbUsxqB2MSO2RsWLKcSPlS6sf3OGg=;
        b=AC0820bSpbrAsNy6+9muX2V0iLCiedDEBJ9VC0DvFXj4M/zWLuucvl9Yn7JOMPNVTp
         yg50ESmCfO3QT7cYl7wnmStSudoBcEOdKNjH8s8NxXtXfY9aR6jINWClZvv6w8WB1FG5
         1TVw4UyGz8vDIUuzgePlEaRILc3aC/tzKIOOJUtBKyz2Kcc0ykOMFsOJ9Ly3KI1W6yYq
         /7NS6UK0JFDA61O+NnixHcHQnQv5/vVOuesyx1k/3/1NIWATmyXMxy/T9HVZVCrmbb3/
         PMwas84OY9S8lpE+NZiPU9dGQTs0Ugb4SOzU586YJPRVwAYQB0EAiLhl4o8fmwurq7/m
         Rzfw==
X-Gm-Message-State: APuU4Z8m0fJs+3E99QFEgxZW45G5Zy0IiwVlDimDkDVQzAKcjKIIO+ax
	pzFuAAGPFwJG6AUtA5EiwHjL9bNmtf7c0NbTB2BpQm50b7cXtP5kIB65VbSeggTGl04mHpx3qut
	H+4fWatz9hBr8LVF1BbPuc26T3gCHhxw=
X-Gm-Gg: AZFdTZd1o4ChCpJxmZRjxCwiaPSgbOYcmmJ9wroNxbysniAlMw+1U+MwffDlI6xRKNr
	LGUqIVyLZ6F0fqOTcH4eF7JmSVSSKdUN+Tt40CSAz60heNz9P6f/a4q4X3icFKs5+/ol9Hy+bsm
	+IWnQpMljVZlzjrgUHOIGcGy3U84v4E4x+mUHO1he/ZuQKC1QvSd7eH5LvUjCKeRIYdzWbLC/Fr
	WXy8KUg8bG6TijR5CvaTEjdlSmVDWRMRUGBwaaDAJtXndoa5/JkFLXEgxlCTc3O21MuF7QME8tX
	2h1M2JDhHeS3565Z4JXaqzZfnuRdy9UXJIA7lDzar2N2fDBOZ7VofAOTSCcDZMjiwNxyRg0BnjG
	9MXaM4A7gvuc6NBF//EAx1khnkGcJ6nsOUqoE
X-Received: by 2002:a05:6512:1288:b0:5c3:182f:babb with SMTP id
 2adb3069b0e04-5c3182fbbc3mr874548e87.4.1795470992660; Mon, 23 Nov 2026
 13:56:32 -0800 (PST)
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
 <CACpmpodxjJ3ZQt4xOsWfWQNjgMtPzKx0oGMy+mJTU1wxVWdMUw@mail.gmail.com> <awQCFZSSng2LLGnX@gondor.apana.org.au>
In-Reply-To: <awQCFZSSng2LLGnX@gondor.apana.org.au>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Mon, 23 Nov 2026 13:56:19 -0800
X-Gm-Features: Aa3M54p_TqduI_blaS975gQ75G_K0GBpeL9JMLLoILwNrNsOHcRCidEuPO6_fQk
Message-ID: <CACpmpocCqenTNv62dGoeSLP2zs-AXJYhXM-tj2cytm4zQTj1cA@mail.gmail.com>
Subject: Re: [PATCH v3 3/8] crypto: acomp - Add trivial segmentation wrapper.
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: sashiko-reviews@lists.linux.dev, hannes@cmpxchg.org, yosry@kernel.org, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, akpm@linux-foundation.org, 
	linux-mm@kvack.org, davem@davemloft.net, linux-crypto@vger.kernel.org, 
	rientjes@google.com, willy@infradead.org, senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:06=E2=80=AFAM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> On Fri, Nov 20, 2026 at 11:24:19AM -0800, Kanchana P. Sridhar wrote:
> >
> > > [Severity: Medium]
> > > Can acomp_reqchain_finish() corrupt the destination buffer when a req=
uest
> > > with a non-zero req->unit_size uses virtual addresses?
> > >
> > > In struct acomp_req, dst and dvirt share an anonymous union.  When
> > > acomp_do_req_chain() handles a virtual-address request
> > > (CRYPTO_ACOMP_REQ_DST_VIRT), acomp_reqchain_virt() restores the raw u=
8 *
> > > buffer pointer into req->dvirt before acomp_restore_req() restores
> > > req->unit_size.  Writing to req->dst->length then treats req->dvirt a=
s a
> > > struct scatterlist * and overwrites 4 bytes inside the caller's outpu=
t
> > > buffer.
> > >
> > > In addition, acomp_do_req_chain() is called for decompression (comp =
=3D=3D false),
> > > so a decompression request with req->unit_size set will also hit the
> > > compression-only req->slen > req->unit_size check and write to
> > > req->dst->length.
> >
> > Herbert, is it Ok if this can be addressed as a follow-on to this patch=
-series?
>
> I think this case needs to be outlawed since our API doesn't support
> virtual addresses being used for dst.
>
> IOW the code needs to abort on entry if unit_size is set and virtual
> addresses are used.

Hi Herbert,

Do you think the following will suffice, because from what I can tell,
it should, but I could be missing something:

diff --git a/crypto/acompress.c b/crypto/acompress.c
index df9e42f519c3..f0ff821b3560 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -247,7 +247,7 @@ static int acomp_reqchain_finish(struct acomp_req
*req, int err)
        acomp_reqchain_virt(req);
        acomp_restore_req(req);

-       if (req->unit_size)
+       if (req->unit_size && !acomp_request_dst_isvirt(req))
                req->dst->length =3D unlikely(err) ? err : req->dlen;

        return err;

Also, I think we need the following check in acomp_do_req_chain(), can
you please review:

diff --git a/crypto/acompress.c b/crypto/acompress.c
index df9e42f519c3..e04cd3124fdf 100644
--- a/crypto/acompress.c
+++ b/crypto/acompress.c
@@ -274,7 +274,9 @@ static int acomp_do_req_chain(struct acomp_req
*req, bool comp)
 {
        int err;

-       if (unlikely(req->unit_size && req->slen > req->unit_size))
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
