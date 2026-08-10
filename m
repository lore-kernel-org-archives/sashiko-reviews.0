Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07742431E73;
	Mon, 10 Aug 2026 17:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786383672; cv=none; b=tzT1ql6hWJTpsxINyW8wbZYVdfxQX98DL5O6ZpP9WsvacgL2edGmwS829RgzjUPGwgVfElRyuX42Ohemc2G+p85GnGxPnFdYXaG3ELoHqUp7MSPoT/GZlYL3xmJhfVmsHlGVfUsl5ZbXS6nfylutyz66qVsNwPKK4mfMcBFJJmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786383672; c=relaxed/simple;
	bh=1gkA43Ob2VAQJ3SJxi9pCRhhs6uKkS+NbpTNIg6eFI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLbhvCa9iduNXsLnzb0pxkpbreD+Qp6yK/z7l0JiDUkpH/OLRaqy7mZ2b/Puy4xHV+DWpZwRCLPxAE3qfjIKPS/pjvfKnP5j6THto5ZNuULY7nekOrnDNLYmsumiAXdHWS2Nc5LXdAIAZ5gc+aMVPLmIuG55lPvSW7XS3OtRysI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ioKkx8wR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ioKkx8wR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98361F000E9;
	Mon, 10 Aug 2026 17:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786383670;
	bh=Rdd4ctn0fuMO17vdXdQMdkkbqEH233xVoESwBwpwX3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ioKkx8wREtXHrBjhHXAWsMUFWQqFX24N/0EWWruvQihBt0wv0yhoKxSGAL03lLrir
	 fyW/9HthMw9Dqi0v+kQh7ku9IcUQKje+es3XSKuGuh23bPo45dmYlaE3og+9+T/x0w
	 x2kDH9z9oHjc1fOWXxncQ+AV4noAY0bzPlhgRedmmRk4eV9G3yf2R5wl4oYd6giFpt
	 S27oF8t1RVKZ7ClaH873Ing64nCkTaV5759OsuLbEDAzLCl+I33nXv+jrHTR6RRwk8
	 YsIU1nZx+Fjwi68RWPvmwas6gIuBJ5r9IGQvTIbZUdhTmduNlOyivfWCtPcntrujAo
	 75qmrbY4GLgEA==
Date: Mon, 10 Aug 2026 12:41:10 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Christian Marangi <ansuelsmth@gmail.com>, lee@kernel.org,
	mfd@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v19 03/10] dt-bindings: mfd: Document support
 for Airoha AN8855 Switch SoC
Message-ID: <20260810174110.GA2332942-robh@kernel.org>
References: <20260728154846.1828945-1-ansuelsmth@gmail.com>
 <20260728154846.1828945-4-ansuelsmth@gmail.com>
 <20260729171635.CC5261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729171635.CC5261F000E9@smtp.kernel.org>

On Wed, Jul 29, 2026 at 05:16:35PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:

If you want to make maintainers happy, reply to sashiko reports on 
with what you think are valid or not valid issues.

> - [Low] The `reset-gpios` property is defined as `true` without a `maxItems` constraint.

Not an issue.

> - [Low] The `mdio` child node property is missing the `type: object` declaration.

Not an issue because we implicitly add one IIRC, but you are 
inconsistent with using 'type: object' on child nodes.

> - [Low] The example includes a DT binding header for GPIO flags but uses a magic number instead of the appropriate macro.

Fix this.

Rob
