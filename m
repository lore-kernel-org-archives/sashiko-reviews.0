Received: from mail-10697.protonmail.ch (mail-10697.protonmail.ch [79.135.106.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB3D3D9DC4
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408628; cv=none; b=XgS5DRqXcQnsRTo6h5Xhl0zMXStYMirJCPUEtQdP22EQah2eo/If+frRo714imbN1ungut8L2H3fEfdIQf9iVjwuhENSnLx216RuYSoPfudgh+4MaKiMkcOOtC/5V3zf0ifjmZ7/FU5r2rTRii4a3THL0CpvEaAm+u7ilq+sd10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408628; c=relaxed/simple;
	bh=D4/TrKkFA1ZKrGzrwtrzZI2hz0p1rOmZGbEWuMNR+qg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DIS+74fV0v/5MQuwbgL1qkCvyKEnrZBOYDHDjldrN1jCdCrP7E35ySXe+IZxTkbpmrxoM+qezrtCbq6uw1L6kvDFlX/w9/QZK2HXiBfHsazfVcwzOvz45Qh17Gws4ldJX61X4bNziqy9oTjJzH+oNAv42kifQdBJq4BFzRLP33g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=FGrK+3gC; arc=none smtp.client-ip=79.135.106.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="FGrK+3gC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1792408617; x=1792667817;
	bh=D4/TrKkFA1ZKrGzrwtrzZI2hz0p1rOmZGbEWuMNR+qg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=FGrK+3gCDmdpPu63W8OLD/42449J99WehM+OHFvPSv/gnl8uxNjj/UUdsg7mfPs4v
	 xfumsa5+6dbXeHtcS731GuFWN+qlpW/yShsZX9rGvAer0a/vAGDhhWCEGao8DYiFO5
	 cfXm5XiH2o7gO6HJj1VASchmQBstjVUse6UEik8zZ+044zkdaZzMgd6X+W1s0nsyZd
	 ru4K2eGBKwL6qIFIp6lg4rgNC8XHjGkug5GGRl19rGYdfJih9Z/BKPXFKalFbh7PV/
	 KnMVADSkxmh5UNSnPhrSsBN78PVlw9Kj6/2IA3hiBacgSZavD+w1M5/X7lMYZH9GP9
	 dBvP9UXACSn4Q==
Date: Mon, 19 Oct 2026 11:16:52 +0000
To: sashiko-reviews@lists.linux.dev
From: Aiden Isik <aidenisik@protonmail.com>
Cc: Aiden Isik <aidenisik@member.fsf.org>, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos: Add initial support for Exynos5515 SoC
Message-ID: <TNrRalMg_NIZSIREkbKJy0O2TcDljShx9R5_su6q9GOAIf1Y0QHnRg6u6l7a0e_I_FDVVnQ7k-Nz5Z0tEYV6qkOJwtsIZ7m2psmRGAd2AMY=@protonmail.com>
In-Reply-To: <sashiko-outbox-177006@kernel.org>
References: <20261019-for-next-lucky7-v2-0-c4ecab4b1c4c@member.fsf.org> <20261019-for-next-lucky7-v2-4-c4ecab4b1c4c@member.fsf.org> <sashiko-outbox-177006@kernel.org>
Feedback-ID: 46524699:user:proton
X-Pm-Message-ID: 174d21043a398cf97e754477290656dfa2bccc00
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

> When drivers/perf/arm_pmuv3.c matches "arm,armv8-pmuv3", it registers the
> PMU with the generic name "armv8_pmuv3" instead of "armv8_cortex_a55",
> preventing userspace perf tooling from identifying the Cortex-A55
> microarchitectural events.

Will look into this.

> Do sysreg_peri and sysreg_fsys need their clocks properties wired up to
> CLK_GOUT_PERI_SYSREG_PCLK and CLK_GOUT_FSYS_SYSREG_PCLK?

Will also look into this, as I mentioned in another one of these patches.

> The compatible string "samsung,exynos5515-wdt" has no fallback compatible
> and is not present in Documentation/devicetree/bindings/watchdog/samsung-=
wdt.yaml
> or in s3c2410_wdt_match[] in drivers/watchdog/s3c2410_wdt.c:

This is what the dependency listed in the cover letter is for.
