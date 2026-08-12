Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEBE279DB6;
	Wed, 12 Aug 2026 02:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786500987; cv=none; b=DfYl1CvpiRPbw0jmJiiV7kmbJeQq9nX5IoXvkIkJ+gZYFsoYaxbKbT5LzfB6e1IRzks2iczD0YOz5AQQXDdnYCx679PskNfSUmgk3HzlfgXv1xSE4GlHCaMmaB3lhOC6DT5+wpV84Kz2/1sgUltb4W07uzmnHxzYwzu492GQexE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786500987; c=relaxed/simple;
	bh=nagjS0OTDvZg/dhNBZC0xd7vnETGyMzLw9Vjz5lcQc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DResu2Wm7awk/G8aXQrqftloFmkoE0QEr1e6CheOvzR1j/KtKUwX2DUx8kiN4LRN/Z3b1CftIC961ZGtKQhjGQgRZ2oM1U4KGQefOx0/hULqeo+N1BN8yn/+hLCF8MA8l3XdnW94rvLzyYQSYZXQPFFQlEOIBWcPrUtQkrd3Ytk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hkbGERlI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hkbGERlI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD6F41F000E9;
	Wed, 12 Aug 2026 02:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786500986;
	bh=nagjS0OTDvZg/dhNBZC0xd7vnETGyMzLw9Vjz5lcQc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hkbGERlIRyWfZC/p7BmiElPQNkFRhW3Z5S+AkmcZAjNPjWfW5oXQpqhlCsFaIcN6V
	 0FwB30qBH+jjHaXfmPxmFZRvTyQd1vHfsbM6WgDFfQnvxZHlIL3Hn75/mnmfePF9r7
	 dt909hFzuq4g9FcUv7g0jR119/a7NarFNv6slGoUlrZIz6Kc2cd/QcOYAHgBFyJtCL
	 jjZ7YC3wDlF3Zsnr+YpHqYyZJBqbvOf1929gvyPPlIZP8I+vYd60TKC+dcqilQf8h/
	 9L4u1qbb6eb+zCt/ObTaOTdVdI1KjvlmjowcYlSL2KpFQRnn0PXwpm+dObo88WpFMx
	 OF1VuQxLAir8w==
Date: Tue, 11 Aug 2026 21:16:23 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Lachlan Michael <lachlan.michael@sony.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org, media-ci@linuxtv.org
Subject: Re: [PATCH v2 1/2] media: dt-bindings: imx908: Add Sony IMX908 sensor
Message-ID: <20260812021623.GA548637-robh@kernel.org>
References: <20260806070934.21764-1-lachlan.michael@sony.com>
 <20260806070934.21764-2-lachlan.michael@sony.com>
 <20260806072055.3A28E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806072055.3A28E1F000E9@smtp.kernel.org>

On Thu, Aug 06, 2026 at 07:20:54AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] Missing reference to standard video interface devices schema forbids common camera properties.

Yes.

> - [Low] The `port` node does not explicitly require an `endpoint` child node.

No.

> - [Low] The fixed I2C address is not properly constrained to 0x1A.

Yes.

