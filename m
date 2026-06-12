Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0017F38C401;
	Fri, 12 Jun 2026 14:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781275846; cv=none; b=GpmV6VtkQblKwkJotjSkdk4KCN0ABcrx74hLbVfwmr7Rij83A0HDRKL5C05rZYEwbUN3euTGzNkglkajJDgeVz1IFDw9NRhZz3rcuJ+3P+7ftHWc4PXTqIpJB51DEK+rgb2YwAifAhLdtURQwsTFMiUNXBlDPs/iDuXk1kofiio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781275846; c=relaxed/simple;
	bh=l4/A17afXihUCOU3eRs3+0nRzzEWs9RR7tndt5X12lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHW6/LV79Hh1lgsJJIIgjO7v0KYBh/XJ+s3DnofBOLMBgaCzWZXh7cPHKaf4Y9kSTTNqY2nWxIoVVxwcUkkLI3wQNtMp4zthAUHrJELtBdsA2iQ1ABgt7FE7wghkUXpEonwLqXJ9cWLsgyeyYGaZdDPHchaSppCH0eXTRQziT5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I5y5nnmA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5y5nnmA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305641F000E9;
	Fri, 12 Jun 2026 14:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781275844;
	bh=ykCZXAreTqJE6ajkCVGnBJqbVDb9t2b1eA3GBUCO/wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I5y5nnmAbDbCK/7Pxin+1BGcrp/KN2JUgY7GEigZ/5q7NdVsTXZDZGvCA1JuH9yzT
	 5kHERDBfcdbzhVs2ffSLCVjaLP7w49dkglK7tDyrdcmWtKG14wC1h5f2tP85AfU6lH
	 hJ9qGwUjgx7C1xOM6xUidTOlEWbuAmbco+nwsZl1PvBLWYxIv633o19bz3zfAxhnf0
	 zKZoLNQxmDtLsn4jnyuQ/kDPVTvmLxiVS+TZxYFi4lHi7sxEmZe5BBk5xj77oZsE+X
	 X/E0Ia8xH/j+h2NG9NuCnIY316WG3ihy6+LSaFSdZN9zSTrsgncpimCCicXLPplePT
	 rv037AxHzPNwg==
Date: Fri, 12 Jun 2026 09:50:43 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Tapio Reijonen <tapio.reijonen@vaisala.com>, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: serial: maxim,max310x: describe
 per-channel rs485 subnodes
Message-ID: <20260612145043.GA995059-robh@kernel.org>
References: <20260601-b4-max310x-rs485-dt-v2-2-a105105f8e70@vaisala.com>
 <20260601113815.8A9821F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601113815.8A9821F00893@smtp.kernel.org>

On Mon, Jun 01, 2026 at 11:38:15AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] Kernel panic in error path due to uninitialized port structures in `max310x_probe()`

Why does sashiko reply to binding patches with driver issues? Please 
stop.

Rob
