Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5D839AD3B
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 14:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.189.121.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087823; cv=none; b=AnSKvgjQ4UkF8hY02xJSPHbDgQ1uCL5h6foBkhK0lmQ0F4GVmNgxXNPuKfhIPlWvCaQ3IUqKt9l6UlzLMAnLTWyenHLbLZ9EOPGqdGXGQ6mK4a69hnhnvDjjjsD/o2tVqar2bxGAu+cYCeWuYJjCioRuwxHIs1VOsegQeBNso+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087823; c=relaxed/simple;
	bh=gKE+IC+RlKzgX1ZxfQsURndg+yzO2TivVRk7zoVur54=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PGNgxqTjT7f3vlenATfdrLBjCw7dOU+KEdeh4r+wdsodBbYeMNHM/m6B76e5hvxd2QC1pn3F7xDMxrK/1RP6n3rc4RGVxFd/ENG8wHfFI+b0zI3vxjcgqkD9SjSdDZBZAsMiE72Jad83qhvweD8CKYauBPt1zMIe6rd895OGz9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no; spf=pass smtp.mailfrom=itx.no; dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b=K6zOZB3a; arc=none smtp.client-ip=91.189.121.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b="K6zOZB3a"
Message-ID: <df43e814d5681df85bf522afae345aca0b9be5cf.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1790087819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gKE+IC+RlKzgX1ZxfQsURndg+yzO2TivVRk7zoVur54=;
	b=K6zOZB3a0RdDFWLIaNhNfYyk8ISYcPACJY6DpQakDlAEEWkEVT9Cb1u2WvlM54ETVHzh1H
	6/010ac/Kjpom87v48zwV1LpyUoPWNbWnQgiJcsjn3wVeVNDYoDZrA/VGZED6655CMc865
	AnVrGD0hosnugEXukuGFsm6+frumeHE=
Subject: Re: [RFC PATCH 2/2] sparc64: Support PERF_SAMPLE_REGS_USER and
 PERF_SAMPLE_STACK_USER
From: Stian Halseth <stian@itx.no>
To: sashiko-reviews@lists.linux.dev
Cc: linux-perf-users@vger.kernel.org
Date: Tue, 22 Sep 2026 16:36:58 +0200
In-Reply-To: <20260922141826.CC3081F00898@smtp.kernel.org>
References: <20260922135653.1622301-1-stian@itx.no>
	 <20260922135653.1622301-3-stian@itx.no>
	 <20260922141826.CC3081F00898@smtp.kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fhpVbAZQ2zd0TP6YUJvB"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-fhpVbAZQ2zd0TP6YUJvB
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable


On Tue, 2026-09-22 at 14:18 +0000, sashiko-bot@kernel.org wrote:
>=20
> [Severity: Medium]
> Since HAVE_PERF_USER_STACK_DUMP is selected in Kconfig, shouldn't
> there also
> be an override for perf_user_stack_pointer() here to account for
> STACK_BIAS
> on 64-bit tasks?

Nothing to override. perf_user_stack_pointer() is a plain macro in
kernel/events/internal.h.=A0Also, I don't think we should, as long as
every consumer takes the sampled stack pointer register as the base.

sparc-aware consumers add the 2047 when they interpret the stack. Like
for example ptrace data. It would make sparc the only arch where dump
doesn't begin at the SP register.

>=20
> [Severity: Medium]
> Will this unconditionally truncate 64-bit kernel registers for 32-bit
> compat
> tasks?
Yes,=A0will correct that.
Next version truncates only when user_mode(regs), the same test arm64
makes with compat_user_mode().



--=-fhpVbAZQ2zd0TP6YUJvB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCarKSigAKCRDoeAEuJe36
Vr+uAQCzOluZSNxYL1lKvGiqZeI3y4wgOg09GOI+pLNXZPSRsQEAzsomT6KoGTuC
ne0/7IhSQ11VtyXWEmkiovuhTLmFXA4=
=OpX4
-----END PGP SIGNATURE-----

--=-fhpVbAZQ2zd0TP6YUJvB--
