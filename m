Received: from mx.itxnorge.no (itx-kvm-14.itxnorge.no [91.189.121.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205193AFB18
	for <sashiko-reviews@lists.linux.dev>; Sun, 18 Oct 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.189.121.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326351; cv=none; b=bbykSHXBqR5GumNZ6+35eMRIftrKXmMm9ynNDmjtwp4N2XbBSpwNaeg1OL9vePIiHkZxbrUyBJr4GehQZJwDP6jFWYjSg+gO8qsVFBZ2bccZwOQaeRu3NJDg+tkGXugltlbXsvnDQ4jNySVCXwAuwYYUzOkGhOwe2x6z29z07sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326351; c=relaxed/simple;
	bh=4BlqkGfZ2/HXZLwDXoPKmXK3T/sLYv/XhbWLmIDCV+k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=agHhPPLqW2cbZgbq4tsnppMXdVZeQR/6oWRI8i7dyKr9sVb+k0kdvRm1RSatlAtUWutDuxphDTkIIE3uz8iGuO6Hb/TmlwKquZtokCBeSkRLafEbuOVI2H66OPZdajEerROjgu7/MHePHeKldpqjpT7GD1EexIFPTXkGBEN7Q60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no; spf=pass smtp.mailfrom=itx.no; dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b=AopFY58F; arc=none smtp.client-ip=91.189.121.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=itx.no
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itx.no
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itx.no header.i=@itx.no header.b="AopFY58F"
Message-ID: <13e574b8ae33eb113aa5c2b944960f9001cbe7ac.camel@itx.no>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itx.no; s=mx.itx.no;
	t=1792326341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4BlqkGfZ2/HXZLwDXoPKmXK3T/sLYv/XhbWLmIDCV+k=;
	b=AopFY58FFAqOmgICzJzYRWChXUqz6vrfXr3fwCA1oTAKl2WuagM6cEODhiLMUzuWdSlloo
	ZGEzNjxvOYSYuSXj2APCBHIwP2PQpIMCukB4M4NLF7jKVwAJdjNeVTovVZ60j1vyBMnNG3
	0colmgoiEIjxmg5Z3ytCXCb9bk9hCLk=
Subject: Re: [PATCH 2/2] sparc64: Randomize the load address of PIE
 executables
From: Stian Halseth <stian@itx.no>
To: sashiko-reviews@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, 
 "David S . Miller"
	 <davem@davemloft.net>
Cc: Kees Cook <kees@kernel.org>, Michel Lespinasse <michel@lespinasse.org>, 
	linux-mm@kvack.org
Date: Sun, 18 Oct 2026 14:25:40 +0200
In-Reply-To: <sashiko-outbox-176036@kernel.org>
References: <20261017100451.2266781-1-stian@itx.no>
	 <20261017100451.2266781-3-stian@itx.no> <sashiko-outbox-176036@kernel.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-Rf6o3YE7c8xlHDeF/lt4"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0


--=-Rf6o3YE7c8xlHDeF/lt4
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable


On Sun, 2026-10-18 at 10:05 +0000, sashiko-bot@kernel.org wrote:
>=20
> Should COMPAT_ELF_ET_DYN_BASE be separated from 32-bit
> TASK_UNMAPPED_BASE (similar to powerpc, x86, and arm64, which place
> 32-bit COMPAT_ELF_ET_DYN_BASE at 0x000400000UL or offset from
> TASK_UNMAPPED_BASE) so that 32-bit PIE and brk do not collide with
> the bottom-up mmap base?
>=20

Confirmed for 32-bit tasks in the legacy bottom-up layout.

The dynamic PIE case was actually broken already, brk could not grow at
all in that layout.

The explicitly executed loader case is a real regression from this
series though.

v2 will add a patch that moves COMPAT_ELF_ET_DYN_BASE below the legacy
mmap base.

I can't use the 4MB that x86, arm64 and powerpc use, though. binfmt_elf
rounds the load address down to the PIE's p_align, and from 4MB a 32-
bit PIE with 8MB or larger alignment ends up at 0 and fails to exec.
1GB keeps every alignment the old base allowed.

/Stian

--=-Rf6o3YE7c8xlHDeF/lt4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTK1ph9OaYoND1R57zoeAEuJe36VgUCatS6xAAKCRDoeAEuJe36
Vl5tAQDQggcjL5ML/FWoUiTbxxgW/UqRAeDJyGaCMgFt7Mo0lQEA5F88Gv4mTwLp
uugn7+gKYcyRz9XrRYEly4NzUPpTPQw=
=4Drl
-----END PGP SIGNATURE-----

--=-Rf6o3YE7c8xlHDeF/lt4--
