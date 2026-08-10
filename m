Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34B22594BD;
	Mon, 10 Aug 2026 15:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786376287; cv=none; b=mc3NLO+V3TRxalQFWbwUXuZf3TXcFQ9YJj4uprHy5VqMIeHLweJEOuR2zr0orBfHPa71m8saD+fw1t0Ty26hpjNA6qSJuuiXobc7Ilc+VkwpScyIYzdytvLENS4/mYEGNAg3aOS8oWTjf2V0Fk+WW6tNEXFYooTIVZa9LE+sVZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786376287; c=relaxed/simple;
	bh=Pdm0dCEgtDoA3/9bfQ9RuIh2kmBSeSobz6nqZNyNJm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gb5Oi1uWZ2BvByF1Kkc52Z4w+Oh8/ZsYlkNKUibJPvbWnAHHXKdvsiw/RDx7rCEigGApMTnbZuFixFA2/whVuk0GD4pOmwPw+FGXQl3sbp6Q7ke1+OFQDzI6qPnV4qWR88N2g1fPlZnvBzYIPkfft/FIcwBWfapKKJZwp9fP1+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JI4t97hr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JI4t97hr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607481F00A3A;
	Mon, 10 Aug 2026 15:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786376286;
	bh=Pdm0dCEgtDoA3/9bfQ9RuIh2kmBSeSobz6nqZNyNJm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JI4t97hrUKWAadZ6KRaJuBXKClGftZ63lpcMJl3UOLDl0f49QOe5LYzAqtmWz9Pr1
	 Z9mEOZz4NhMGD1BEd9LumrWGlyuclTZ25dHShz6A5ePJRW53HcvFr9ttgJtcn1y7Xs
	 BmNk5ciyBIVB0HBgxadEhFMQf4zx4GRyPcITkkhdOXUOZEzC1uYuB9OWHRv+j2YHNA
	 nir1rsvEEfrYgWhjIOdKgtTikOz8d6PvC1ZGKNca+wE7jloihXdyfcdhCS6tPjqs/i
	 PC7F4BMEiDh/OaSODzPxXVMDTN2SA9qEraZDzVUWZ0SobFbeLjI3/dSrERi1n/qp6v
	 sNcTcypGV72oA==
Date: Mon, 10 Aug 2026 10:38:05 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,
	vkoul@kernel.org, devicetree@vger.kernel.org, lee@kernel.org,
	neil.armstrong@linaro.org, linux-phy@lists.infradead.org,
	olteanv@gmail.com, conor+dt@kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 01/12] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset controller
Message-ID: <20260810153805.GA1793660-robh@kernel.org>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-1-63846490712c@gmail.com>
 <20260810071224.5AA301F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810071224.5AA301F00A3A@smtp.kernel.org>

On Mon, Aug 10, 2026 at 07:12:23AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Medium] Missing `resets` property definition in the YAML schema.
> - [Medium] Missing `simple-mfd` in compatible string list for syscon with children.

Neither of these look valid to me.

Rob
