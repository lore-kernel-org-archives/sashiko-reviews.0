Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C272736C598;
	Tue,  2 Jun 2026 04:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780374456; cv=none; b=GA+IrglEPXlxcHR8uI1zLiRAFWX8A40gxxAEQreroTw6xkn6l1QgjkqM2wSSr8BfWh5HAAcvcbmzzX4G/QZvNrzrUOJVqixAgRRGL1MpSQF6duQt86M6sC++QOH8yAEp6F49sK/tbpL2WXMu5tpUlSzfUmMwB4mVvqok/loPN4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780374456; c=relaxed/simple;
	bh=Yj21Fxt8CzIEMrWN5qQCEaT0b3N3UG8RVnUJdd2qUZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQgNT7gkixcYi+7qa8Hn+LAEOd0xhDWNSDFboe3E2zXivkXcYN2mEDh2fgfjvjiPLiQ5eFZJSvskuy14QIdI5WR5ODjI2nwZk/sSLeOD8VUw8b1mPMPsP6msYFgWMn0lgsag4IW5OcMmBB/KJtMi2j6pgRmBZ4Cl0P6ZM+Ro0Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZFGZVl7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZFGZVl7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4E11F00893;
	Tue,  2 Jun 2026 04:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780374455;
	bh=Yj21Fxt8CzIEMrWN5qQCEaT0b3N3UG8RVnUJdd2qUZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QZFGZVl75y1gd0gt0W50RqL4mNc2MDEGXD6o2RU0L5TOr7xVQip7hR1kM1cQISVjP
	 hJ/snFs1T9ZXnE5jPWE9x2ODI7KHmJXiHGiYYgazVryXe/AkNgdttV0Hi+G9TlM0lw
	 TCT6LbBLQvk8P1xbBg/bHME0IM+ZB1P6Lco5KCUXiCrYFurqydP4xpOGHiCeGFSTh3
	 wuj9kJTNOTkUXGz0C0Dds75iuaCv3zQ5+6kcO/gq/UjjgOJangOGTlxKM6ZIGSBz/h
	 tIKTkbcI7wABPE+sfJuWr0S2/TJk+9IBRiSMMCdbcNRQvyvWzjx1kAr2APWWAnS98E
	 kBPCBh5JVNofA==
Date: Mon, 1 Jun 2026 21:27:05 -0700
From: Drew Fustini <fustini@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v6 09/18] riscv_cbqri: Add bandwidth controller probe
 and allocation device ops
Message-ID: <ah5bmc1eKYdKN1aT@gen8>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-9-baf00f50028a@kernel.org>
 <20260601204931.F08EA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601204931.F08EA1F00898@smtp.kernel.org>

On Mon, Jun 01, 2026 at 08:49:31PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Sentinel verification in cbqri_read_rbwb() and cbqri_read_mweight() spuriously fails with -EIO if the hardware's initial boot state matches the inverted software cache default.
> - [High] Software enforcement of the sum(Rbwb) <= MRBWB hardware invariant is bypassed because the software cache ignores the initial hardware state.
> - [High] Modifying a single bandwidth control field on an unconfigured RCID silently overwrites the other field with an artificial software default.
> - [Medium] cbqri_read_rbwb() and cbqri_read_mweight() perform a read-modify-write on the staging register without waiting for the controller to be idle.

These are not real problems. The software caches will not be out of sync
with the hardware by the time the schemata is visible to userspace. No
changes are needed.

Drew
