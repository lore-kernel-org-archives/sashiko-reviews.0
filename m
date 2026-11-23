Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477484;
	b=T9yj2ZYOMS6dgFgMTu8OhFDpIab/+gF7NehXIn3FC42ccWxBBhSeeb3jZWUOgTXpR8Sc
	 OFHux10otTiDqguIGmQJMlSs9nh8E3Tvu6TLP8MuuiGTp1ho+eXHWmZGx9tZ2a571Pqri
	 mcsNIuKwIk8NmqrUY2Syw6qY6j7tLxDC4ZVTdLP/ob5FBdOy7NAayWbcvXGVt7KSemC0T
	 SsKdjflZQovSfPhMPhQuDiX3lh+Ljty1SRZA14zaQWVWoehWghCLXRBObJjKm7ZoH+M9c
	 TY59qqYCJLCPKjffHH/LJiorXiTrZ25XWezGUs5iLNWydS81ILHWJIzdXdUA6NExIFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477484;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=6QMJhc3YnOaaCHlbZVI2rQXf076rP8gNRmqzzhzAVL4=;
	b=kvX4IArSFVxpu76MSsRDEGk4Fffoe2rGGmNDG8ueJuPKJs5rvnDT7d4GdWXEJkjyDy/v
	 33vfNiN2C9h05ZCNr8TyBz192QNwOz2MNaXCftl7P2jSW5NQBW4eTn/yiLr9hIjNmFCo8
	 GKueK2hHj6Th2ceh5tJzOM58dXTbv9hTXSXYhy9I9e9G0X6+kqWEYwlC5uwaUAjK/v9YH
	 pkZqnemyC3z6hDqrmF5RwkXnfElV0sxHxLxb54BMN0cod2z9/usb7kSqmNRqbh2gV4uUe
	 K3/lDS15RB8zZsIcv928O/ZgCIK49iVBh5hBlhhiqf+ykQBtf5zTyTHqFeD39uLp9nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="iks/YEcj";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552AB606A332;
	Mon, 23 Nov 2026 23:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iks/YEcj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B341F000CF;
	Mon, 23 Nov 2026 23:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795477484;
	bh=6QMJhc3YnOaaCHlbZVI2rQXf076rP8gNRmqzzhzAVL4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iks/YEcjr37+Ieju79RapI8Fp7WEoRjAohDC+AiDZXPV5Ib2/fXmqRCEF2LsB86yQ
	 MH0292PVYOu4Y5ZVg67Sz/DCi5U09RFgZG8BslNdWJiYYRWRxNdqoq32gLBJRdgCgP
	 tpa/X4C11KApRMs/+W5eD5v1/scU4imkYNrs/mdxnxPg9NrR4LRKNBHCDrOL8LBj70
	 kXhZneSnTCPbeXbrjTdwG3jqH3TohJpSV9A8G/GrhmwoDo+9BZzOg3EPlkXfDlLHkm
	 pKR66ecn7R1/Q8LveI8/ncOvhaOams7AlQfHucrUWE3Hp1h4NPrBl069BwCD6tn9lg
	 RJJ/P80mzFSkw==
Date: Mon, 23 Nov 2026 17:44:42 -0600
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org,
	lee@kernel.org
Subject: Re: [PATCH 9/9] arm64: dts: marvell: armada-3720-gl-mv1000: Add
 switch fixed-link
Message-ID: <20261123234442.GA3404231-robh@kernel.org>
References: <20261111-dtbs-marvell-v1-0-938788aff3ae@kernel.org>
 <20261111-dtbs-marvell-v1-9-938788aff3ae@kernel.org>
 <sashiko-outbox-209895@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-209895@kernel.org>

On Thu, Nov 12, 2026 at 12:17:18AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: dts: marvell: missing Fixes trailer for gl-mv1000
>   fixed-link fix
> --
> 
> commit a68eb6dc3b861d90e5a107b8b38a297faa592448
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> > arm64: dts: marvell: armada-3720-gl-mv1000: Add switch fixed-link
> >
> > As the switch port 0 has an 'ethernet' phandle, 'phy-mode' and one of
> > 'fixed-link', 'phy-handle' or 'managed' are required by the DSA schema.
> > The expressobin has appears to have a similar configuration, so copy it
> > and use 'fixed-link'.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> [Severity: Low]
> Without phy-mode and fixed-link on CPU port 0, dsa_shared_port_validate_of()
> fails validation and skips phylink registration for the switch CPU port.
> Should this include a Fixes tag for the commit that added the board DTS:
> 
>   Fixes: 6d5a6740f6df ("arm64: dts: marvell: add DTS for GL.iNet GL-MV1000")

I defer to the Marvell folks if they think this should be added.

Rob
