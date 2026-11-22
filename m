Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795386469;
	b=MGkCuTLeh7ikkltX0XJvylMyVPyoOOi9jTTq5k1D1L27ZtLQWf7d6rQe2L8puRT0sCyC
	 YHw6wadCavLmrBN+zZWB4K3CvBS4KQ2TYgHhyRGpFSQXJXO9xyFk8QPiNpaow8n5Jhlc+
	 eIy98sx0vul6eUppP1+wcuE+wxf5E2GLl/8z+mqa1vuzETwkU8hgw4sUB6GrMA9ua0HXD
	 8qROVJsAlpGJIAj+g4sUTRCyfKlO7xbAT3aLbfkjY0YWrhCNrCvUo2P2O/OM0x+cn16zr
	 VV5BAOkWG7uM2VKfSa6j9wCP/siZWBSWjR6F1n+dKwM7frtfdO6ec6ijjvMlFFy0tEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795386469;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=w5lzEcxKiqL3BlJi55P+ZDsd5CgUkyW/04MW4YNJirg=;
	b=pjCIMc1izvuuLnjEbpGZG08O+j1iQy5J2CGIipijlTPUlrl0VqxcvXZu1u0jJMcYMNaO
	 9H5yNTvuSqINLws/jmMYDrAccu3H+q3omaTo3C/IP8Hz4tThEw2xptCL4LNbPqhPoVvNJ
	 iPy05zJzs07x1loPMuS9X9GkhYc2Ek76kaTtgVGeNjpzgcoWeHpL6SwjW9BDYT47n1zHF
	 /hHAAvOYrld7mQ5q5DokuDv4slvzrKkFXh189E4tHd0KTcrAB1VNF3R1sbT96Qy8kISKH
	 sTG2AI4gPctqk62SaHC8XzIbA3GduIVv6sVN5GakTphjEAZmfrjnulwcOScVOoz4kDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPvl8hLv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B89606A31E
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 22:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OPvl8hLv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0A41F000CA
	for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 22:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795386469;
	bh=w5lzEcxKiqL3BlJi55P+ZDsd5CgUkyW/04MW4YNJirg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OPvl8hLvtrJ9LTOBEzIfEHa7NVs6FlgdJ+UxySXJn2+owzPa+Vt+9mCch0yAryTlK
	 LiKkgt60uDzMuqGl1g+KQ2E7Kef2Z95xFZhXCWSyepJwA5mw5jkHgWBgaL+/ouNCPi
	 5Me0XAMpJtZOkyXWRKDg50hVESo6gA3s14fPpvaML3vODe8cqYANeTW9By5ZqlvQbZ
	 DW+O4gYiXt5DMKWYBwjgNlyOQxL5nEdqGbETlusikGuwdWedfspjl0dhUgXu2GpTS3
	 xA9Te218tcwx8GuRMHtb97FMKihXyRGlEDeWaIPIFF6LvLCr1FLoOJjV/zkYoce/4u
	 RKUCUZuB26tZg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso1529416e87.1
        for <sashiko-reviews@lists.linux.dev>; Sun, 22 Nov 2026 14:27:49 -0800 (PST)
X-Gm-Message-State: APuU4Z/+Jq+Ya4Bh3XlLsKaJKUc1jZqNmiNhbrod53FGH7ch5y5bYAlw
	PQlTenYO6DXGGChBZ/vp8DBnXxt531wn/myopB/KOHO5Qsf4hAm1cQA4h4xaOp/x08c1LfXmCQK
	qqbZ4yrnKB1vX9w/mcrOHhbumswCg5bM=
X-Received: by 2002:a05:6512:3da4:b0:5c1:a828:499d with SMTP id
 2adb3069b0e04-5c1bc8a0f66mr2723779e87.45.1795386467998; Sun, 22 Nov 2026
 14:27:47 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261122-xg6846b-bcmbca-xrdp-reset-v6-0-bf2104a25095@kernel.org>
 <20261122-xg6846b-bcmbca-xrdp-reset-v6-1-bf2104a25095@kernel.org> <sashiko-outbox-228331@kernel.org>
In-Reply-To: <sashiko-outbox-228331@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 22 Nov 2026 23:27:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkLv3BvUY36m+2F+48m8ZQ-uedK1wbGh=AUHNNfB_Vw=Q@mail.gmail.com>
X-Gm-Features: Aa3M54ok4call33uc2w-wg1Lc8Py5tmJgq7aasSbEWB6j45V_SSTm-IdEboSNII
Message-ID: <CAD++jLkLv3BvUY36m+2F+48m8ZQ-uedK1wbGh=AUHNNfB_Vw=Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] dt-bindings: mfd: Describe the BCM6846 PMC complex
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 22, 2026 at 9:39=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] dt-bindings: mfd: bcm6846-pmc: child nodes split PMB by Linux
>   subsystem

Parroting, Sashiko. This has been addressed in earlier iterations.

Yours,
Linus Walleij
