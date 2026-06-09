Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5993367B83
	for <sashiko-reviews@lists.linux.dev>; Tue,  9 Jun 2026 09:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996374; cv=none; b=otU3abv67o7mTntvzmecxV96B4q3zhc00FwDyIWgUbHCsFeyQB/vM7mPjxdpdB89lPhZzHN71evXsR03pzqUZv7+Wsd+hDV+QUexXu/sQuEfBePFDCUgeHXwNa+8GYIGz5vBUGre6GTbr4IFteXYW79yG0i8Yoq0ngtVrhn67bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996374; c=relaxed/simple;
	bh=MqHmEcP/aOlKd2rlc0/u7+31Vh1FhGR7+cp0shBi0cs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Yz4gvc4KlMopCIt5WvNQU4fmCOaOFpyXCI4FdkgWlWnOU0kq5YfYN+RDmgJWwTR+BSKr3120LVM+NSixUEZ44bsUpuIOpH7aGLnEK1zoqN/w2HGzDQYuuAhQJ2ca8z8jQw+IBkONfO6IMLPH+8tUYNcfwPu9vKCGFubZnLijzpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=v8dQepzS; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="v8dQepzS"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 258D74E405EB;
	Tue,  9 Jun 2026 09:12:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E90685FFC1;
	Tue,  9 Jun 2026 09:12:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A1D56106A12B4;
	Tue,  9 Jun 2026 11:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780996370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MqHmEcP/aOlKd2rlc0/u7+31Vh1FhGR7+cp0shBi0cs=;
	b=v8dQepzSYmBM85SOb2Fc+Lz12uW+m/kO/HvSNTk6AkNVe0MwT7pGbmrjaKyaCo4uy/6c2L
	atE5TO+xbanYFBnEmUyZZeuaWHniLiSU8tnFlnPeBMehbNMyPpKlkt3sMS/Ol6SyYBa/M7
	L71NmGXJ/ggiUSuqBtBqCUU00YB6EdAaGnEVnX7q9ilNbZ8XDjkiyHdiQLnE/loHOTfxmH
	pkML7aW7Tasf68zomwgl72qHPxqFrQ9A7/1Xx+xfF4QqCoWuC6VX++GQ5uVd9vHVSTWIDK
	uZ+DOMyXzDjHIi4V7QjiOA5qMZyjoCNopNusEX2jNBMpMnjhq940nhMDZ0Tlrg==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject:
 Re: [PATCH v8 5/9] clk: eyeq: Prefix the PLL registers with the PLL type
Date: Tue, 09 Jun 2026 11:12:48 +0200
Message-ID: <8-0jFbatSUKRA5pG2l_1wA@bootlin.com>
In-Reply-To: <20260604133615.56C5D1F00893@smtp.kernel.org>
References:
 <20260604-clk-eyeq7-v8-5-53f618174cf6@bootlin.com>
 <20260604133615.56C5D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Thursday, 4 June 2026 at 15:36:13 CEST, sashiko-bot@kernel.org wrote:
> This is a pre-existing issue, but will this readq() trigger a hardware
> alignment fault on ARM64?
>=20
> The PLL registers passed as the base address (such as 0x02C, 0x034, 0x03C,
> and 0x044) are 4-byte aligned, but not 8-byte aligned. On ARM64 platforms
> like EyeQ6, performing a 64-bit load instruction via readq() on unaligned
> device memory violates architectural rules and typically causes a
> synchronous external abort.
>=20
> Would it be safer to replace this with two readl() calls to avoid
> alignment issues?

The clk-eyeq driver is specific to Mobileye EyeQ SoCs which are _not_ ARM64;
readq() works without error.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



