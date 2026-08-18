Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F6B3921D5;
	Tue, 18 Aug 2026 07:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787039512; cv=none; b=tGWXiz8bX7iR+8HjFPV1gcLGzQZEcFqoIiu/LZW6gVL2J30/YJMYcqViPKEwjpNJqYTkvXhdUQOjcAx/dbdbiUMxNpYr3xP6CuoFZ/Hpr0cDtCm+MtlydSgkGcDCOM7c5pFmYOeJWLOpFc8m9JtXDLi1NPjy2x2qj/KeCTqiBDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787039512; c=relaxed/simple;
	bh=yeKkrztbvrGY/ysWLleAsjv1uBYyHOwytLbMC9Yz08k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ieD1L3wa6lIhdSCefeVkfhe7okEUrtM/L9W/5UJq15lNTBasV39tEoYgTrvK3MydM9/s+z5pSXg+PCY5QvHHZ0k8kyOoTlwHo93jT08TMrgzwPcjaf2ZmiVwhFpOH2pTwulOqZ6RSeryanl9Ks+jthobW4CbeOxFUKSlS9gQEb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6634E1F000E9;
	Tue, 18 Aug 2026 07:51:49 +0000 (UTC)
Date: Tue, 18 Aug 2026 09:51:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Kanak Shilledar <kanak.shilledar@axis.com>, conor+dt@kernel.org, 
	robh@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: Add InvenSense ICM-42370-p
 accelerometer
Message-ID: <20260818-rustling-grebe-of-expression-fd9a1e@quoll>
References: <20260813-b4-inv_icm42370p-v2-0-11aedfdf76d3@axis.com>
 <20260813-b4-inv_icm42370p-v2-1-11aedfdf76d3@axis.com>
 <20260813123421.3AC681F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813123421.3AC681F000E9@smtp.kernel.org>

On Thu, Aug 13, 2026 at 12:34:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] Incomplete device tree binding schema rejects valid hardware configurations for SPI, I3C, and reset lines.
> - [Low] Missing IIO subsystem mailing list in MAINTAINERS entry.

What? This is just ridicilous and wrong advice.

Best regards,
Krzysztof

