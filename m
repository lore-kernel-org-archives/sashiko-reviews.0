Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371765;
	b=bKf27ZtwbnCQKq6Z4iip2OFLxe/mRD3mRZYNh8iKuYI8l+QKSswrfXG3kFCo2v3G2C7z
	 z5r+2UeyjTJqk8GHPFy57oPAsE3Hbd8+lvc7lv1w+xnhFEFror3L1RYx7dfsoOZdkt4Br
	 Cphcnbis7JcNoMqSdG7TSA9Evd79ec0xonUITe8e20A34gniOjYH8FZnphdRjUTuRRKRz
	 sKqIxhcSqYMvh+YVpd+w06m7Znh5cZYz0jRgT82vC5ZhH/Ruba0hnggGpxHFSnQipYx1e
	 7U02BIzAaauGuXgi3pAjL/hTg0K2fsCTu6Lr8k34EuM5hO9/OE1lBcmsIwL1cBAYVJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371765;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0TQjte6CqBgM+wFSxhT/bgRaDtwXwwSO4uSgCgPB3OY=;
	b=sx9QUWw0Fn8wT1lg8H6bkNv47XrEIf1i1JUe81nx+bPdTPnMj1LLVD0a8Do8ywwi5OxL
	 g3gyLsDfGCC8U/VlmqGNfaxbNjVQIAxodbRFm1r9/DBx4D/fCjU7LmmGUhBe+q84MFCAt
	 wZvG3+GX+g5mJJ2s+MOsfDDANoEC72Y4HtT4wr0StVIRsKAfIcaVEB/pLJQTaPMgwNIXs
	 nDoLJAOAVwISy0k/eXCPILd/Rtd8+ifI55w/eQRWzt7YynM1sHDCNASXGKyvGFbqQ9XlX
	 VUti1fTd+1Pk4d4pGn23UpMZOPn1bIIU2PJ05YGdAJ1x+Y+F0LxtMuW49qxgwJiC3Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NA1m8gVY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D84606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 14:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NA1m8gVY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF6601F00A15
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793371764;
	bh=0TQjte6CqBgM+wFSxhT/bgRaDtwXwwSO4uSgCgPB3OY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NA1m8gVYHOCdqHGrZ4A/CsTsWNYOnrQL/kvNqYRh855w0eE48qkiEbOD/mUSAQJs8
	 THi9A92uzFqXpL7REevNWMot+i0pxkE0Xz+q3vi9EvINUn3EcRXGZ67OxqbH52OCGj
	 YEqxEc1/aQg9ETlfCD/kkezGO4FD1hN3Al4UcskSYIHPj9LFrLy7b99XqYU4NRSEHD
	 lFunqd0Ki4rXYamLX95N8zKRGOHlg365oDaDLMoe35BHu3j9X+tvaNmY3o6zBj5ImX
	 hTN8QnEdpiUj9nDiIhkAMojiIysBntHAy98ofps5LHCuIWmkrsK3dZP/jqUhOWqi32
	 ofF2caZU1LBfg==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so120881966b.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 07:49:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQmpGo/koVSLBDL+3+WpU+1wlNhvCoLxEWWytuOlfZ0kbeBNDDUkshxDW0hCJbUdpzgu8kKW2VRbLVT6rH3bM=@lists.linux.dev
X-Gm-Message-State: AFq9FYLWKv1eypfs94SeZqBNxj0bKGuvmC4wfDxsYbVXLzJjI+N7LZrR
	TEHEyZmd1kGzU1OUSsggpj4UFz9V0KmYdVGNKDpED39H3HqMzzADCrinB7gexb2KDR/yvvLA5dE
	jAveAR+sL2nuaTsESWarnpRDTUInACic=
X-Received: by 2002:a17:906:9f92:b0:c29:4915:83cb with SMTP id
 a640c23a62f3a-c4ca7ab09dbmr235759666b.39.1793371763605; Fri, 30 Oct 2026
 07:49:23 -0700 (PDT)
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
 <auQwWgMbBuo0YEBI@gondor.apana.org.au> <CACpmpodxvQCkQgXUU6pF8d7onxHvHF7sEYCbTkv81WXyyrFiEg@mail.gmail.com>
In-Reply-To: <CACpmpodxvQCkQgXUU6pF8d7onxHvHF7sEYCbTkv81WXyyrFiEg@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Fri, 30 Oct 2026 07:49:11 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNvy7ftXsmLnj4qbQYJ5nyQo=hrio4UQvNrpMbwj9YbMg@mail.gmail.com>
X-Gm-Features: AclHuK_VMB6EZ1UVhDMh9oCJ1ZyT4EAf7VOhmffq_u4OhZNJTl7iN40sgLIywfU
Message-ID: <CAO9r8zNvy7ftXsmLnj4qbQYJ5nyQo=hrio4UQvNrpMbwj9YbMg@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] mm: zswap: Store large folios in batches.
To: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, sashiko-reviews@lists.linux.dev, 
	hannes@cmpxchg.org, nphamcs@gmail.com, chengming.zhou@linux.dev, 
	akpm@linux-foundation.org, linux-mm@kvack.org, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:19=E2=80=AFPM Kanchana P. Sridhar
<kanchanapsridhar2026@gmail.com> wrote:
>
> On Thu, Oct 29, 2026 at 10:51=E2=80=AFPM Herbert Xu <herbert@gondor.apana=
.org.au> wrote:
> >
> > On Thu, Oct 29, 2026 at 10:15:15PM -0700, Kanchana P. Sridhar wrote:
> > >
> > > This is how it is in the current mainline, and has been for as long a=
s
> > > I can remember.. I assumed it was because we need a per-CPU acomp_req
> > > to be allocated for the tfm. Can this be done with a single
> > > crypto_acomp for a given algorithm?
> >
> > The request needs to be per-cpu, but the tfm does not.
>
> Great.. we can save a lot of memory this way.
>
> Yosry, should I go ahead and include this fix in this patch series? I
> am Ok if you want to take this up.

Feel free to send a patch, but I think it doesn't have to be part of the se=
ries.
