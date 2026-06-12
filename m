Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B373A6F06
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 09:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255559; cv=none; b=r4KyNaTzaC8GdkHs0faRK8drXtrCy/zecPPx4b2tMIBeS+Ie299otyPtsPdKEzBON9TvhTQkBteIkMoe6QWBP5Ba6F8O/YMKBKJbdNranVuFZQrm2r0L+bno8C/2kG8cfmDfG2IVQv2IJcdgOj1bmEtSGHYxTuPb9iXg3Vcsmbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255559; c=relaxed/simple;
	bh=KouzSC835H3UftJKpqLYTTea68/fujc5sqF/usq77mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lfnTJhuGIY2AOudh+1NDiyWt6XViqItXORjk5KnRgIJ5JYkiuAFX/zUEPNWUpMe6kkWQB7NnTdW3jEZr/3vn7VL+AeghjFWbMR/wo2s7B3nPnWRxew/0EDQgEooJbjZcPh6mk5bbEGF0zOTY0QDakrWDGeqbKzLP21Z38NqCHps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IWWW1m4/; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IWWW1m4/"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0F64A4E42E58
	for <sashiko-reviews@lists.linux.dev>; Fri, 12 Jun 2026 09:12:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D781D60012;
	Fri, 12 Jun 2026 09:12:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 99D41106C8346;
	Fri, 12 Jun 2026 11:12:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781255552; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KouzSC835H3UftJKpqLYTTea68/fujc5sqF/usq77mM=;
	b=IWWW1m4/6z3eZyoajuik2bJfF2MaTMc8WF0IlUZjCBMOsJKILRo6S0yE0n29nU+D7eLfjF
	+m7TZQUq0jqO6Fh2ltYun3VZmvH+GaS+ABD4CMEqiYu6yaFgsiLEODy7iFcleEbibbZ2Cg
	gvfYywcsGuiEHxXDKDXqNTKv/7fOw+bi902qKBVDRvNoEVtUX7TMICn15Q6+Q7h78LOceM
	r7RtTTEe0HzYflSoGir9vEhCphl/y5xIziWdCQv9Gm0IHoCZex1gJC0bshETpOWvmRsNmu
	PGqs8FmyHKdo9v75AZjji8y3j9XJZCfe2ahGG1yY2neexZ1l6z4QCAwoX4SycQ==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 6/9] clk: eyeq: Introduce a generic clock type
Date: Fri, 12 Jun 2026 11:12:30 +0200
Message-ID: <ySSlygKLR5G6SmDpPN91fw@bootlin.com>
In-Reply-To: <20260604135106.867711F00893@smtp.kernel.org>
References:
 <20260604-clk-eyeq7-v8-6-53f618174cf6@bootlin.com>
 <20260604135106.867711F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3

On Thursday, 4 June 2026 at 15:51:06 CEST, sashiko-bot@kernel.org wrote:
=2E..
> [Severity: High]
> This isn't a bug introduced by this patch, but since multiple writable
> clock dividers share the same physical register (for example, div-ospi-ref
> and div-ospi-sys share the register at 0x090), can concurrent clk_set_rat=
e()
> calls cause read-modify-write races here?
>=20
> Because NULL is passed as the lock parameter, the clock divider core will
> perform a lockless read-modify-write sequence. Would it be safer to provi=
de
> a shared spinlock to protect the register state?
>=20
This is a fairly theoretical point. For now, the clocks are unused and not
tied to any device in the device tree on the EyeQ6H SoC. Even so, both
clocks are related to the octo-spi controller which uses the
spi-cadence-quadspi driver. In this driver, the clocks are handled by the
clk-bulk API which serialize clock accesses in lk_bulk_prepare_enable() and
clk_bulk_disable_unprepare(). And there are no calls to clk_set_rate() in
this driver.

Best regards,
=2D-=20
Beno=C3=AEt Monin, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



