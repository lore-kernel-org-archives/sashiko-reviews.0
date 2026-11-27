Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821484;
	b=3wT54XzpWWwhIzKQ4Zc0sA+OGcbOcRHnzrX4I6DHx8+DwGH5CunmoVfoI1NjjB0Olzbj
	 C1+uBPE240wxSgzpw+VeLWYV/P1bZMNx2UAZf/Vbcy8S4c75TLtMp84JgNaDt2Mh5d8cM
	 bQ4pU4UW2qIz9FtK4LEaoBMv6cOdPRDhSXUVI6NLVUTXbYWGfQdZPMTd3RMmC40H77UKy
	 BVGjz0RKlZBD+PrMkYwxdyv07wgzFqrTtBzCNfmTUAdVnm2z8EZ9STlsxyTsbJMjVv+TB
	 CTsy/7XkfsvLoLkC7XOtSwzLQjmJqziBibXM/akAq9BA4j52vjY4tuaTpm0FKZmTqpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821484;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=eabEoBGJDSwhGvIgsim2UeI86MybMnUjWj14/d7+JVc=;
	b=rc3mbhcCq57kFrKlehA7re980Db258qeCnpS/GVVJXCCInx6ivjWx8SdKashA1ahpQdK
	 yqtwrnFd2lLuo9/6NxXDbhFevEBsQRJBohNkeBpiIC8S8wli9l6fjdv5vphhg6Kz24glx
	 YtBAB28ilVrgTWgAp2Hb8zhgZt6v5y9txe/1NBYjCHp5a2auK57jAsiIbjaPjeD4EBUKq
	 vbzvj7TYpJdprEqv/v/jL0Y90XLshxbW4kcvLxRKgnla9JurcVlViJu/9s7H0qwthGJ49
	 dpvaZUtm8Hc/5lJIvYZAXOPQ/3iScgJU1AwDqLuOgSXHiMnSBmXfBIzY85Etq80KRIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KRyTNDgn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5D7606A31E
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 23:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KRyTNDgn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FD11F00897
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 23:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795821483;
	bh=eabEoBGJDSwhGvIgsim2UeI86MybMnUjWj14/d7+JVc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KRyTNDgnnLzoYCVib0tpSi9JRaV0vG+WZITWhACgUucw1ANVkdlZ6p5pGzKOuKVcQ
	 +iZspdNuJMymcXD/RKhuFDKw3lr5LNLNM1ew0Nzd4nWD8b7koH99/PLsTL6NsiQ6di
	 764DSXjmit3SuoamdH/yZMgV0DkiLYVB88blou2zrZ0fOZAQOI9ARf89LnlXNnFcpN
	 +is1gWUSWdGDVSZzUBmJuEFDb2PnqRLRCMG/nM2bQHxAv6FHaucR49sonVbXTfoR1d
	 VWZw1okafRQtAnncHhxeudtVScaXmYEhmPKFRRenndZaHCu8TUFM2TOPAMvUyJfnGH
	 xdy//LkGDx/Yw==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c148d4dbfbso7246550e87.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 15:18:03 -0800 (PST)
X-Gm-Message-State: APuU4Z/EdhCs5VYVUxsIly3J3W6jl237/QgfpbJ/LmuvbaY647rx96LD
	lwPAkbfC7QOjKWS2LUnRVol2OvU9DVZykMCK/TzVzUI/4oJhkA3YacwFeE95s5anfJaD6GPvZ8Y
	V0HLSBa3Q12hH6cADXxaqr2TVEKOyOtw=
X-Received: by 2002:a05:6512:224a:b0:5bf:a287:dabd with SMTP id
 2adb3069b0e04-5c1bc801218mr8138929e87.36.1795821482508; Fri, 27 Nov 2026
 15:18:02 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261127-ux500-epod-regulator-removal-v2-1-0ccab0f430fd@kernel.org>
 <sashiko-outbox-238182@kernel.org>
In-Reply-To: <sashiko-outbox-238182@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 28 Nov 2026 00:17:50 +0100
X-Gmail-Original-Message-ID: <CAD++jLn81eSQh4gY8uBAjNb444kkDAryX+x93N-d1wPwUTF==A@mail.gmail.com>
X-Gm-Features: Aa3M54phLSeyUjOaYYvA7cw1C0sDgusnQ4QWWjrnwPyY15KVPZUSYJpMyXZbE60
Message-ID: <CAD++jLn81eSQh4gY8uBAjNb444kkDAryX+x93N-d1wPwUTF==A@mail.gmail.com>
Subject: Re: [PATCH v2] mfd/regulator: db8500-prcmu: Remove EPOD regulators
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 8:49=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> [Severity: Low]
> Does removing REGULATOR_DB8500_PRCMU leave a dangling select in
> arch/arm/mach-ux500/Kconfig?  ARCH_U8500 still has
> "select REGULATOR_DB8500_PRCMU".

I will fix it up separately.

Yours,
Linus Walleij
