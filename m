Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793297523;
	b=FwKSRMdljtKCJRLATaWqfEbY1+bW7VSOCQFxzfodMeiHeSxY10yJDd/8pqUH2s/4twE3
	 gc95clV3sr1/5RoNWpkUwgJ1sv0GjXljEJNvMO+THuOIFkeS95FFlBXi3Otm0TJXoy2gH
	 YdM0VgRrjESCPGbupok5SreZOfZAVP0a4pihQiQNCLIevSt07GOFm54ItvFMQa4qeiUEA
	 dgppH8mavHFYble4osILO6yMkgcFALyMs9bx7usXeO+CCi/FxHDmDWSX//ErOsPFrDgyv
	 05t+MPvgCYUrbAuHMWupMIgXpoTT4MoEh1KQdZZ9DGmBNcnjtdn4gXZmCbJ/KUJ741Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793297523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=PLUjYNTvLoS6IRSrAP5hbUmJYyA56qlS0xnG+YeH+uo=;
	b=vRGHVfY0p6JgqOYXvOhwnI/6Fr5CiUquqGjbErSDzkSfDeF96mur6lambpRckZBl5pYF
	 FrfZSBZRMPA6R8RsmRXA8EsSJR4uqJlf6UM4/4A2d06Pbv2gpeojKT4YxctSO4FbyaTeE
	 JVwu+r5+1q2IMXyHyJ4eT34gm1qiypgUitcdupL+8g+2TWMD2KLybPZn8wPc0c4LlJznf
	 e3XVVpnKGvVFT6ku/HC4DCq4G4ta/XW8lU72SjmmF3+ay1EbYKCZbN5sFk4Pk/YPn+hUL
	 2MJa408e68ETS2AkzBa9EQ/t+0t8QFWWq6/7N9739EAxRhSBaWZnQTRp87gCAKbuxTQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0YY+ST/+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D1A606A31A
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 18:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D1A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0YY+ST/+
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso1970482e87.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 11:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793297520; cv=none;
        d=google.com; s=arc-20260327;
        b=mlMJcLFs6gIfse2VXiGafyaW2TGcQ08/HHnILCIJrQsLVuiRMsbt8Dgd1b/OADBI15
         WpNoeVpi+7r2SffVhgaTxxw4efdSKwGKSG49oylQ1TIGilj8pBUWoDxK1GQDxLueV1Jm
         i4K4hCJ+NTagFQrSchdNJrg3OFYposKYFGid31M5rEKi27BXEMYZV6fmeydfhMkqk0rh
         hiKBG3es6b4hKn/YW5vOOTZOsMODw8Xic01t6igXkCDqFZh3wIt7qTPj9StKLTUjLEEj
         1grDFt/BHSl1JqvkQQNofNIisY54GRV5OihmWxzWdW1XSR42ZWQa1OtHPp3dkJMKrII6
         Djgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PLUjYNTvLoS6IRSrAP5hbUmJYyA56qlS0xnG+YeH+uo=;
        fh=INjNmmHA7ztbj5+a+SXdF/cS9e7eP5VrVRtcqQVr4pU=;
        b=X6HlmVvCdMpSsAmYYFLyitJyc5uilSs5MIcmY3E2kovUhFXABdWeZPKtXzOF7ajk1+
         GHmeKqIXR37ZTgd8pFKq5GdofoUpg28yY4WA2gVwlDWPY5VZC9XKf7UKbl5R4UEn2TEn
         /Q/YjNrs9vBPTYGTcGyRofiICcyPz1IdEoqpM0/ppEauXa8i7nkH6fURuNtDVCGnG7Mj
         OB71fu5QTLztOIgFgQ0cgvd1iIkhrLQQXGwOIgSlYl4ChwBrw/ABAT9YIgNbIepnsz7Z
         lz+RxOX0lBSkdIjG+FmtaaTRiEOjAzmurO8d5/ajfHgchcamChoZiNFax5oUhZh1PJ69
         2nxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793297520; x=1793902320; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PLUjYNTvLoS6IRSrAP5hbUmJYyA56qlS0xnG+YeH+uo=;
        b=0YY+ST/+cpyakGhCBprTq30K8zvx7IwrxS8mDhfh+XEu9d6y2f6FjhTUP7bGc2SPgA
         xfUSJxb2MujQGhNPIln0cDFguPs3cf6EjPkXBSZsKlxZCRpko5jtN2zgbO5GUV6dh5WJ
         7AVCJe4WNxTzw99TTDvIGrRnqwxz1P8ODbSAJ31l/Ibd4siAoU/ciAJqQlV0DylmTi15
         EWSlSHoNCsbj0gEasQ5WLLrSUQvoDM2tGKb3gjQ6a3yFQDz5zAkIaae9MRyjr9DKwtz0
         mntbwEwvq0QjClBGwLAc7F+4JsM5Zk8f+93actNLFqsT5sAIg0hNhjOuZSslP92RSf8H
         IuqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793297520; x=1793902320;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PLUjYNTvLoS6IRSrAP5hbUmJYyA56qlS0xnG+YeH+uo=;
        b=Ueu7fIqW7tSeGOCR2RWJpjO+2JxHQ7u3H/KetHiDY96+8gC1Uwn8qseRZDXMhUadto
         A6x7iHUQg/r4+16M+PflqY+AlN4K7aOCsiYliG0dUfbZOhdRKQTaBvdBLpNMcjTfGrtf
         IytQ5eEEOVkXoecnelLr16smkQTewft1WgvJIH0JbtYUPADbg9iJKjS9Jzztwrevi+ce
         095mXYWhBNmzLINz/FYXuVxf6txnh6KJvhngWiUg8/FDrvibLsporb0YJ3yzzNKf1XEc
         hsAEBaQOz4dHtbv7ZWfqEtyANzAjxArFvy5TuJKn9N/V0j5IXeetoQY6XKCFb4yhBHwX
         cCGA==
X-Gm-Message-State: AFq9FYL5G4oJQtbkSOlUGJcCWv1Yrt+pHxWyHYejbIzYKOdNWVW2n2om
	8pqzq+4iLt9/q5gCHKqgHjB3a4l0cTf47qlgJ1UWJjj2qPNToAJBWEQBYcL80lbjDSYBvKwEAJF
	ZfRxoHZDgkt4mncIVL5q9UKINYVrQijY=
X-Gm-Gg: AYBFou0h3buEFnfBtUEb8MXC5u/l5gNobCX1dut+zNof7bJxrSkgRnhDCCmQuSEVZB9
	+ah8zp+qD0W9iSK6biH/IuRW69IEZQ1HhJYTXWzcrHLTSA6JdAyFXR5S/axJMucBge6buE/58H4
	lpayznC7ZqGvC/80USKvpwegJabjZusALDKhtbdFWWnfmU+Pv21pp8Vmy5AAhkpBxgYn3962BMT
	zzd2kc0k0ILWPvYxs/kxgwMpCEU2IxNKgkNv11gbVwgFS6V9bS5SOdqmpjdyQjOnTvn6DyQlE+c
	K9quXdZqFED4ZFdXewyqdR0KjgoeVFODxH/a5svkdoSOKklKqPyZovtBNa3jcQE3S5KVTZDZQo2
	HicC7n5i4lez+WzoLDPrmRs7/d8Matxf1D1/q
X-Received: by 2002:a05:6512:23a5:b0:5be:414b:9032 with SMTP id
 2adb3069b0e04-5bfcad46342mr2523158e87.31.1793297520237; Thu, 29 Oct 2026
 11:12:00 -0700 (PDT)
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
 <20261028030503.17923-4-kanchanapsridhar2026@gmail.com> <sashiko-outbox-188655@kernel.org>
 <CACpmpodu3C=uYH6dmFM-xkvdJxiRDjamRKs1Q4jU6_KKjFWNqA@mail.gmail.com>
 <auLbyon-KaV5Sw5_@gondor.apana.org.au> <CACpmpofcd=ZPKhAoHJfvJU_JZshKs1GGJZf5JhjAW1PZzDq-Lw@mail.gmail.com>
 <auMCV1AFlEFuJnk7@gondor.apana.org.au>
In-Reply-To: <auMCV1AFlEFuJnk7@gondor.apana.org.au>
From: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Date: Thu, 29 Oct 2026 11:11:47 -0700
X-Gm-Features: AclHuK8R6xznrwfhDJPyC02DpxmXLxT-47zHrOdZ1Ogvg0ySBRqlzEwjpCqqoJ0
Message-ID: <CACpmpofnUbi7gf=eBdCH1k6ZpeiNQUdt_tRRZhvipmhwkhwRqg@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] crypto: acomp - Add trivial segmentation wrapper.
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: sashiko-reviews@lists.linux.dev, hannes@cmpxchg.org, yosry@kernel.org, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, akpm@linux-foundation.org, 
	linux-mm@kvack.org, davem@davemloft.net, linux-crypto@vger.kernel.org, 
	rientjes@google.com, willy@infradead.org, senozhatsky@chromium.org, 
	"Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 1:23=E2=80=AFAM Herbert Xu <herbert@gondor.apana.or=
g.au> wrote:
>
> On Wed, Oct 28, 2026 at 11:03:55PM -0700, Kanchana P. Sridhar wrote:
> >
> > I was under the impression that if acomp_req_on_stack and synchronous
> > tfm, it would go through acomp_do_req_chain(). Please correct me if I
> > am wrong, and I can modify the conditional accordingly.
>
> It's perfectly fine for a stack request to go to a sync tfm.  What
> isn't legal is for a stack request to go through an async tfm.

Ok, thanks for the explanation. I will change this as you suggested.

>
> Cheers,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
