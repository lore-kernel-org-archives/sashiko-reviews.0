Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738950;
	b=MmNXn3alUWl94PmSedMLAvSJ1NY75KDXckZot3GOzkVgN1XFQdF+1ePR9c6QE3jXRB9q
	 UZuzdsoWmecH/x2H88571R5ftTdlDvYY8iYAEcK6+6h/9mA869vDUTzAGI+4SKah0dcJM
	 s3Pmzdlhe/KGWSXz8hpyore7nYdegv70LH+z4pe6+6g5RDMj7kcDcQBsxlbqabnR0KCmj
	 gxdy5u3uq8X+swJWR8VMIevmAzYFAoUO95C/9PgJUsFMACCSZRtRaH6KX2V/cgQimHRUA
	 SGCTAtfLET0M4AKm5DJ2FSU29MXuxyBmK6sBNG+9KYPWI4T5MXizsUL7RyO2kOz62Gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738950;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5pEXNHxm+1LvvbAJkBUjAraBQ2f8Pvm2T7kYMLzvOTo=;
	b=HXm8UXAc/jElk8NIyV76lZtVPZPFSE9gIbS5IS3hlij5ZmJp46pWSmAGOV/Zdq8FPg4J
	 oMD+xV94Fcfaj344JHYmcY+ws35dQrzeFzHyOBw4kq1qYcQw3nk+7vIHXdJ1AsGT3uKQH
	 zgWD/+/xoWLBIqCENllpNPp9sRpmHhuE9NvcWue4uy6eX3qBQY5pD8iQ1HUu57KfBjJTH
	 7GPiLcARIdimuyiAgjUXZups8/DPnzSh0miq+lStChJ76G5MkgsuAWbQ0d9kZzEUI+d7T
	 PKK9aMfNLw5ltb357G66CDxTbTEN4XcUq3d+3fKf6gmKOcuQCwYMmN/GO4jXTw3iNkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yn5XgSPj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25FB606A31B;
	Tue,  3 Nov 2026 20:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Yn5XgSPj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50F641F000C1;
	Tue,  3 Nov 2026 20:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793738949;
	bh=5pEXNHxm+1LvvbAJkBUjAraBQ2f8Pvm2T7kYMLzvOTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yn5XgSPjb6TxnRFledsKv2fyS1EesjugD6FLhpc9yLDZH9hb/3AuGBSwwkx9erixE
	 XxcZwxRJVF+4BSsT/LBQP1na6TeoHkRY2WD1CuRphbsK+35EAmFjQHwyVJNJNCzxre
	 35vq0icSl8vbWm2ViJkIKTGhEpO3zBDxH/fbfJRAEJI4L9ebznM6zoCZ8wDgZYJbbE
	 iT7UoAsr4Zv5906V17SZankD6S61NauJxzm0fsiv3HXeyeUgtuC5Nyzk4SaSwgelSR
	 cy3jGqaUfucpDy8j//WLhlUSRmw6c3OW62FUbvTk1TEFeemgLrjJ46E2GEEAa32rZs
	 s7Y7Oxyprnztw==
Date: Tue, 3 Nov 2026 14:49:07 -0600
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH net-next] dt-bindings: net: Convert snps,dwc-qos-ethernet
 to DT schema
Message-ID: <20261103204907.GA3951195-robh@kernel.org>
References: <20261102203353.1384705-1-robh@kernel.org>
 <sashiko-outbox-195992@kernel.org>
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
In-Reply-To: <sashiko-outbox-195992@kernel.org>

On Tue, Nov 03, 2026 at 08:34:17PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: net: snps,dwc-qos-ethernet-4.10: redundant maxItems on clocks
> --
> 
> commit ccf9541bde2e61e4e9ad2f4d7325ff792d7181d2
> Author: Rob Herring (Arm) <robh@kernel.org>
> 
> dt-bindings: net: Convert snps,dwc-qos-ethernet to DT schema
> 
> This commit converts the snps,dwc-qos-ethernet-4.10 binding to DT schema
> format and moves shared properties to snps,dwmac-common.yaml. It also drops
> unused compatibles and updates the example to use Tegra186.
> 
> [Severity: Low]
> In Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet-4.10.yaml at
> line 39 under properties:clocks, maxItems: 5 is specified alongside a
> 5-element items list without additionalItems: true.
> 
> In the devicetree meta-schema (meta-schemas/items.yaml), when items is a
> fixed-order list, maxItems is implicitly set to the length of the items list
> and explicitly specifying maxItems is disallowed.
> 
> Does this cause dt_binding_check / dt-doc-validate to fail on
> properties:clocks:maxItems, and should maxItems: 5 be removed here?

Yes, I left this fix in my tree uncommitted before sending this...

pw-bot: cr
