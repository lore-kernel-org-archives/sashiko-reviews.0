Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394230;
	b=die7+vswA+z11go6+wZvPBdjS7bk+j5rW5PgF0dONkUXqnFeqrRSC8H74+y2WvDoqOzJ
	 OD+A4tZ7Ap1JOW4nKU7o2v+Yq4gyv+eY1eGAku8rUompa285t4i54hBUwfYzU5VI0UjNm
	 BbmQyCZo/eH3K7PboSZyJRFynNcMxr9RPk0zYAq2YLcsv1cKvvCOvoxPEK0AIB4b5CQwl
	 rr8X44I9lz4SX7KZALV4hTPwZaxOwPQcr3mop/6esSbeQxbOiiIh0K1h2xkZ3xwdMq9fj
	 kkWR/KwXoeInlBAwDEyq0IcEqtoNqTrxVJLb19hx2j9KGXZJfXVQuwRQgc9fHnDrXVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394230;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=S1995ZLQFE4RdcXYiHKakHsk6W47b9S6zZE1CF9trLU=;
	b=nDd0ImX3yaT8U7M6+FT/GjmZeUU5rTvrYxK9/pRttNpOFV8ajNqtEseS3PejTiGcv9e3
	 YDHjYTAibJYsqVjI6ej3GtagvUehBadhhdcnuomqCaI0XerXmXjfVc7V5R9OM10KH66tF
	 jk2ijqZuHaxOQUxxXum17jRqt6qaMu7rtGWJpbZBMop1ouK6JPDfGhfQ8cRxA1T06JA6j
	 fhOP3FHFAYVz2zxGCyw3o30Xb1Tc57WMhtLGuRKPb8tnAbF2UNx6bax9lJDDrlN2hmMQ/
	 6cXlKFS/szCjZ153Fd/qKxhlNOlxlWsRpmthtkrwRr4OQWZzr800+Vf79T2WBhWarVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ZjxLCscv;
	arc=none smtp.remote-ip=109.224.244.27
Received: from mail-24427.protonmail.ch (mail-24427.protonmail.ch [109.224.244.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD2C606B6C6
	for <sashiko-reviews@lists.linux.dev>; Fri, 30 Oct 2026 21:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD2C606B6C6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=ZjxLCscv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793394227; x=1793653427;
	bh=S1995ZLQFE4RdcXYiHKakHsk6W47b9S6zZE1CF9trLU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZjxLCscvZeZSW75knHS44BRlBxUv70KLKJt3w0MSyt7Z8XISZMZSyUZKx8Ou1UkaE
	 ukc4Pr/ISDMRe98c5wXXhq3N0SrgaeayrAopiayRaVdfmAgP5bXWRGSXKXVjWaN500
	 msexGbJtSjHsoDRPBLm9Fa99V1lP0DGPyHy4yN8b8IHB5BxYeoEJEcmGJ2C9wgmHiO
	 H8Dqe/6dR2HuaVXsrqcajb3u5EyP6OaGG0Z3k79q+FiIYHU1+HQ7VimcWmRWHvU7yC
	 qgT5x8tIOHhGhoEkBR49Xf45dKjufdc75T01bn6daVKQ8ZJE9FzNBdZLmx9HMfnyoY
	 j2uCHK/EOgg7g==
Date: Fri, 30 Oct 2026 21:03:41 +0000
To: sashiko-reviews@lists.linux.dev
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 4/5] arm64: dts: exynos: Add initial support for Exynos5515 SoC
Message-ID: <Mmgr4BBkTyH619iTPbmVEEjEAI18ry8Yzpd0c3CCp5ZgSRsHx92Ref70av8rjJGpnjiljM5HjvdsZNS_PJ-dn3_GMJK0JnB7QmSOoWeS0BU=@protonmail.com>
In-Reply-To: <sashiko-outbox-191496@kernel.org>
References: <20261030-for-next-lucky7-v3-0-81e02272ce69@member.fsf.org> <20261030-for-next-lucky7-v3-4-81e02272ce69@member.fsf.org> <sashiko-outbox-191496@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 38c7d60319e73c92ae8a77d9b4235398a84414df
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> On Friday, 10/30/26 at 20:49 sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] clk: samsung: exynos5515: CMU_PERI user muxes bypass CMU_TOP d=
out/gout clocks

This is how those clocks are wired. I'm also not sure why the bot is sugges=
ting
clock driver changes on a device tree patchset.
