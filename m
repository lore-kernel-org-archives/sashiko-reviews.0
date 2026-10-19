Received: from mail-106101.protonmail.ch (mail-106101.protonmail.ch [79.135.106.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2CD483823
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 11:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408213; cv=none; b=T8Gy00AtwUSoK/NjUybt/xnQeapMTlGYEfWGWXokNyhlMwtdJ/EHObakLr9l7TLsxsRW5oO1ADJsI4WyWZd3C7yELryQRtmcqaseX/v8EtGUxPZzoPZsttmaLuaqD1jwX5DScPgr5EsyWuqEg+asCC5zeAo1m8Rckp7Hzy41wn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408213; c=relaxed/simple;
	bh=ggT6DKBvB6ZXBO4EpmtKngogNHlQ4H/jF9PBBJazOP4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KtCore+PIkE66byHa76f3t2aZGepM0w2qSoxxVgfgUEJhJWKeoFwzhJ64sla0HLIiwGYbi3HSHXuZXl5lbMml2Yf/CElBkkTGS46eNgA83SfiBPG7m/2XBgEU98kOAL+/Qahds9IP8TyFh0h6trjXkeREwHKbKJy6cbPX4apfpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Ztp5MIOx; arc=none smtp.client-ip=79.135.106.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Ztp5MIOx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792408203; x=1792667403;
	bh=ggT6DKBvB6ZXBO4EpmtKngogNHlQ4H/jF9PBBJazOP4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Ztp5MIOxLMPzBwbNVDGPp5eCTOV4Gjp+A4rxiLAyH2kGC9hYaQfVn4zKwGFCvAZl2
	 wH6oM2S+MvVbOJaH0ARIfm9RVApaEUPK3klaGspM+3VlBbPCoXE1PpTcKzuNNmgElO
	 LaPRAKkUgidtTR3YcJ/yFGsn4uDMEc6S23gx3+S7xtkXeFdcUKBFpSPZPC20IAMF11
	 T+C0oMQjx7GJyRr2HLNWAP8Qqw4LdmJaTdGz1mU6WXWg5X+EGB+dhX2Z7wg7nmJfGW
	 5w7LziB4nhEnlk8xOmtwV67veooavjH2nnbECjVORkrd5quaIUpvvINvDGgtkyh8Ly
	 MJc4AAHHUgktg==
Date: Mon, 19 Oct 2026 11:09:56 +0000
To: sashiko-reviews@lists.linux.dev
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: samsung: exynos-sysreg: Add compatibles for Exynos5515
Message-ID: <nL0WlJ_XLtzH-Iu1kjRTepU1_entqO79GamA4gtmx5AS8wEAJ1QEBMTHlrGSKpn80LEpjZ4B-1XeRzbMDCKA_LFAjRKt1OgFw9U8AyQrYRQ=@protonmail.com>
In-Reply-To: <sashiko-outbox-176998@kernel.org>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org> <20261019-for-next-lucky7-v2-1-c4ecab4b1c4c@member.fsf.org> <sashiko-outbox-176998@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: fb429f6460f0dcc74395a45c7f5f5a2535106dca
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> Without listing samsung,exynos5515-fsys-sysreg and
> samsung,exynos5515-peri-sysreg in that enum, won't schema validation reje=
ct
> Device Tree nodes that specify CLK_GOUT_FSYS_SYSREG_PCLK or
> CLK_GOUT_PERI_SYSREG_PCLK, while allowing unclocked nodes where
> of_syscon_register() cannot attach the PCLK via regmap_mmio_attach_clk()?

It *does* work as-is, although that may be because the bootloader enables t=
hose
clocks before starting the kernel. I will investigate this.
