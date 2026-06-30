Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673883E44E0;
	Tue, 30 Jun 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782813879; cv=none; b=iTHVM1Ba+/DyXVd1dXa0RLogrCMOsDc8xRz45gBGZUQcMRiPuwZk3g/5EO094haDAHl7Xga6v7SC2waAlzr4pYdhwlPeRJd+Hrh+X7Tb2mS/SrPZOzM3Os5zJCus/USXO7lFNQh7ispo2by10GYnDLKegVqZkO8C01NTLJgRWZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782813879; c=relaxed/simple;
	bh=09WOWTCw5tDbPOdV7wp/vCgW9f6Fp4w0o02Bo7vUZAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwBrnXTKbAwObVMCzqQ6fwPhaW2ikY1mE29TnjV6l1ZaSWSDLUiQjL6oWFhsJjKZj91waa9WUzM+4xEkR6qlcuuEyKb7GHPtAYY22EQlA26qh/3XCdDuSt2LhitcDVyRnOWvGwxhaiFOVtgdhTcX+Yef/DCNo2R92kUBmNWLJ2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpPmHs3E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpPmHs3E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529761F000E9;
	Tue, 30 Jun 2026 10:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782813878;
	bh=Z4UJjEnZI2IYJ5pUOsVosDLT9elMsKBFDjcbHBD7kKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EpPmHs3E3KdDFMh4Bnn2wtm6nJ9lTEv/lIgf/9sQeG/nw/VENYLifFndX4rAiCjvV
	 qDzUUQ97ZuQe6Bx5wZUYrQTx9yCfQhurmN/BO3lUylkIqdTT4cWIyejsFxih+TURxT
	 vG+dpFcG00Xv32kVFzXtHMhVzGaJ5xGHm/Cpno/BsSEl5Nz0O2ihINyjipustybPaa
	 Fb9Ei5IhzkKcaAFvgYvKKFLU8Dd5E6SO+sRqlAUMvy28EBWLdXm8nVxB2cSuxVfhBE
	 bTgwNqf/5tCAn0LqzOQSK4TTKWSvnc18hlOjm2AGNoWcC63M/B/N3Ak7LpWNPXzf90
	 5oXrAURnDlq5g==
Date: Tue, 30 Jun 2026 12:04:29 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Sebastian Reichel <sre@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v22 04/13] firmware: psci: Introduce command-based resets
Message-ID: <akOUrV5BwU9/PuLJ@lpieralisi>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-4-28a5bde07483@oss.qualcomm.com>
 <20260514212353.881AFC2BCB8@smtp.kernel.org>
 <c2bb7a24-e1d0-4308-ab53-208901108a5a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2bb7a24-e1d0-4308-ab53-208901108a5a@oss.qualcomm.com>

On Wed, Jun 24, 2026 at 02:04:54PM +0530, Shivendra Pratap wrote:
> 
> 
> On 15-05-2026 02:53, sashiko-bot@kernel.org wrote:
> > - [High] The API illegally truncates the 64-bit PSCI SYSTEM_RESET2 cookie parameter to 32 bits, violating the ARM PSCI specification.
> 
> Hi Lorenzo,
> 
> Was going through this comment. The patch currently uses a 32 bit cookie.
> The spec also talks about "SMC64 - uint64 - cookie". Can you please suggest
> if we should add support for 64 bit cookie here?

I am afraid the bot is right, it is not correct to assume that the
cookie upper 32-bits are always 0 :(

Thanks,
Lorenzo

> 
> This will require a re-design for supporting about up-to three 32-bit
> numbers in reboot-mode framework.
> 
> thanks,
> Shivendra
