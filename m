Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862E22045AD;
	Tue,  2 Jun 2026 10:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394601; cv=none; b=oEaNHLR4Mo0oKiT4qu3jGJ3ALaIL02DC3pDboSzcIhYSo8gDFg1xCWqbnRDirg8H0/MUQLZkBZlJUOinxlQkjI2HDRVyD4t1ZyDk65UDkqMJQ///3YPDmQlnT2BYDQqiCMIc7JE/hgF5F+XhJk4VD5bFDjrC0cGH2hIMpsNZMS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394601; c=relaxed/simple;
	bh=C49gOaDLx8qL1fc75KeCn2RosHYtM/2f0MAI4wSvy+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AU3jCN3I7v1BteWtU1/rPFI6zZe432zoH4uXmCAu4PD2u+PiISc1hDHKookO3FtVsRFaMWGqy6F8ET8asJWbKBFr6Kxgr1kt4UawONfwzIOdfu6eSBk6IZp132Tr/3Gujo3y+HVx0GL/Kblkb9FkGDNdCvNZRybe8oNhU9CWZVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CeykM05P; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hSRbNGA7; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CeykM05P";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hSRbNGA7"
Date: Tue, 2 Jun 2026 12:03:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1780394598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C49gOaDLx8qL1fc75KeCn2RosHYtM/2f0MAI4wSvy+o=;
	b=CeykM05PWq5PZLfRqlN07J4jqK2kVix2r9mY4l8Kg1H8VnHXY7xerUw+7fuERmsGY7Jn3U
	pW5kKfp54ZOXVPELvyoyzeLPFv2h8P8BsEB6TKhiYoXF0wariKlilHSrNydaiY3Hp8mxLd
	IQbBEirxf3eCq2Q1zReru3I1f/33rR4RjbxYBQiCscioqvlxeNYyJwZICP5h7MosxrnVGL
	dwi1Y20BQbKcl79hl8zF+UG+bpxF2FOuc9+kFMmdr/QejvBDsbUDT8CgzCpDNHgvLnoupD
	F6n1N9hIo4kpfqn3kftkGUc4oBy94Q+CGI9WmuI4Xneb+yhFyaQczEGvKMTP7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1780394598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C49gOaDLx8qL1fc75KeCn2RosHYtM/2f0MAI4wSvy+o=;
	b=hSRbNGA7ec1bXnYmZJtOzjNlPLh1JXNpD5wmt0GftbSiMXz4E1tDi+wna9QS4GRuIxSKTU
	ZI2yR2sCTNhmhrAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 4/5] mailbox: imx: Don't force-thread the primary handler
Message-ID: <20260602100317.vdPNIK8s@linutronix.de>
References: <20260529-imx_mbox_rproc-v1-4-b8ffc36e11e5@linutronix.de>
 <20260529181329.274501F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260529181329.274501F00893@smtp.kernel.org>

On 2026-05-29 18:13:28 [+0000], sashiko-bot@kernel.org wrote:
> [Severity: High]
> This is a pre-existing issue, but could the ordering in imx_mu_probe() le=
ad
> to a race condition on probe error paths?
>=20
> Looking at the initialization sequence, devm_mbox_controller_register() is
> called shortly after this lock initialization, but before pm_runtime_enab=
le()
> and before the probe function is guaranteed to succeed.=20
>=20
> If a consumer requests a channel immediately after registration and calls
> startup(), it gains access to the hardware. If probe() subsequently fails
> (for example, if pm_runtime_resume_and_get() fails), the error path calls
> clk_disable_unprepare() to manually turn off the hardware clock.
>=20
> The driver core will then trigger devres cleanup, which unregisters the
> mailbox controller and calls imx_mu_shutdown() for the active channel.
>=20
> Since imx_mu_shutdown() attempts to write to hardware registers to mask
> interrupts, and the clock has already been disabled by the probe error pa=
th,
> will this register access result in a fatal bus error or system hang?
>=20
> Should the devm_mbox_controller_register() call be moved to the very end =
of
> probe() to ensure consumers cannot interact with the hardware during an e=
arly
> teardown?

Puh. devm_mbox_controller_register() itself is harmless, there needs to
be a probe in parallel that grabs that channel before device
registration is complete. of_platform_populate() could lead to probes
and channel grabs which is okay since it happens before that
pm_runtime*().
If this fails then, then we would invoke shutdown with disabled runtime
PM. Usually one would unfold it manually in the right order.

Looking at it, not sure where there is an enable followed by resume and
put. It should be enough to just enable. But maybe a test for resume
isn't that bad=E2=80=A6

Anyway. Switching to devm_pm_runtime_enable() should simplify things a
bit. And delaying of_platform_populate() should do the other bit. And
while at it, using devm_of_platform_populate() should fix rmmod +
modprobe.

Sebastian
