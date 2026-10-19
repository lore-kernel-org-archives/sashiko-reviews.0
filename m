Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F784E0B91
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 11:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407829; cv=none; b=WTKgFiNJICO/71Xbt7SUhQ2VX4gfRpfa0CPzmAvH6/xbb22fLnwPRGOzcv6cGYI6xaUDy9C5RcFlY8GRid3+N4iBfxsBAaLnIwOZ6zdSsxKn2KlKQXXbjeYMfhcBY01O/+00W5De5i8xNd3FI4xOUa51mO5/K8QhCgAutYitGdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407829; c=relaxed/simple;
	bh=n2v5m2RJ/3GMXXY82qMbGp5lAvN4A7I+spPVP19GxLw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ViBKB6WFblh3D+VnukKmhMRPcr6+CndBWT7SEfKY70vJnAX9S7AaxeXNAmYW0NpMkK1lCxvgl8hTvjfKvTbsxbDyPIIxaMXsCaZQw3IMItQglyzRih01Ak1MIF+B8yoz4gS2DdyGRczs0I4bVsKDMqWpTXyTJf8O2l1GGxgfotc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=snGkQoUL; arc=none smtp.client-ip=109.224.244.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="snGkQoUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792407818; x=1792667018;
	bh=n2v5m2RJ/3GMXXY82qMbGp5lAvN4A7I+spPVP19GxLw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=snGkQoULbkFdP30Bru6tu7wnTaUZpbfBqtACG720R7wMvizJpButHgWmjhokuTMOC
	 Yrena+ocHbdruxkLiVU9XRdAFwUJoXEMy5cxGJJ4k6q99xTTvQECx0JTVHQCYu+ADq
	 OGXVKMDPipZ2HVHFpl1hnNjThuYgB9c+I8QFRovW9tlXQ+tHOvucnTdTNKGFPj56DV
	 o3j8EIFm2Bdq5Eeirgm80HTJs4BUxrLMxHtsUvz8+pIHNw7Bttl7gIEPp0WUjYQEGh
	 bxcUfX3282dK/xD558vpLX75cN0ZeA0VzPTk+1Ld9q2sy/Y0aWyKGNBDexcj2atmnI
	 Xcp0+2BGL7+SA==
Date: Mon, 19 Oct 2026 11:03:34 +0000
To: sashiko-reviews@lists.linux.dev
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: exynos: Add initial support for Samsung Galaxy Watch FE
Message-ID: <eXjLAL5M11DLS6Pk5qqnzjzy6O4-LP-AxC2FJUopThVrzp7u9aZD6I7lid4swozkkVsR4sm-Jmv2RxZikDpOob3CNKyZrkgol1N5Rn0o3eA=@protonmail.com>
In-Reply-To: <sashiko-outbox-176992@kernel.org>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org> <20261019-for-next-lucky7-v2-5-c4ecab4b1c4c@member.fsf.org> <sashiko-outbox-176992@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: d438f9b641ea623b97a5448155ff041b57f724a0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Without an entry in arch/arm64/boot/dts/exynos/Makefile,
> exynos5515-lucky7.dts will not be compiled into exynos5515-lucky7.dtb dur=
ing
> make dtbs, and both exynos5515-lucky7.dts and exynos5515.dtsi will be
> skipped during make dtbs_check schema validation.

Will fix this probably tomorrow, after I've tidied and sent
all of my other patches for this merge window.
Can't believe I missed this. I checked so thoroughly :(

> Should the binding and driver support (or an appropriate fallback compati=
ble
> and samsung,cluster-index property) be in place before enabling &watchdog=
?

The dependency listed in the cover letter is for this.

