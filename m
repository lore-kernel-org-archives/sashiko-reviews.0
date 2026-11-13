Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559310;
	b=pWiyXaj6OlijQHarXNVvz7SsPUATadDVi292eexwQ8CGVL1dG72bwJoiRFruogkh+e0X
	 2rPDM+Yc5ZAWpiBRKEW6u/DmeOTYVdiM5iZ50Ugdey8FPE+IKID9ruhD6P1WpyvfHeJqe
	 9Lmp1+/suXvXsoHifvmeiaEDiM737aqEWblyqdJ+b6OgbpM4h0UK5JbTYkR8lAtP7p6Sd
	 eDKRfgz+T9LCXzmZxn7q7/khcSNEOrNGd0/B5ymvYrquEvpes5I9/l8AMdt8R9HWn621Z
	 d1iTH4ugDjPfN2F3G49w6pzCANb8dwOdPiJtxkvfqvQGiyZdkHsjfTkNLz/0iXukxdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559310;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=LwTB4Po1Iiga1rVbkoh2Jk5GPy02LPtdQZHEI2HXwa0=;
	b=UhaowvlW6BnAvxxPupj2hmUayiJDSGaS80iStG2pGA/DEDvziucF+NZQ5+WrQ7h7wQBB
	 oycR8eJ0f0PwS53qkKB3QrONN7L4KbilLEPl7gmjiizHfSC99inNvTC8i5s21BMNeDY1J
	 wRs39GzPqSYmlpNoNxXUMstuJFqEWmn2rjSAYtvEK3z+DrJGAJaenozK//6CDj+8w1wUY
	 VL2RoTxbJtwjg7Uh+W3uQVw+qye+VY/VL/1RUsphh9DJwUO+G7vhni9WYCz1qBlY/51mK
	 m7t6ndK2uFHH8Rg7YYROlJWGZb8XrIYo+g61n2i3nRMIO6CtuZShFqt+qNxqlMW5BMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gtJDGtCq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACD3606A327;
	Fri, 13 Nov 2026 08:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gtJDGtCq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093A11F000C4;
	Fri, 13 Nov 2026 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559310;
	bh=LwTB4Po1Iiga1rVbkoh2Jk5GPy02LPtdQZHEI2HXwa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gtJDGtCqxMPFfFesQAZfE5Xdh5QRm9Ze56OSmfLY1KVbzIZIfzZMgACHzBjNCG6V9
	 P5BtZHGQgbSnFH2gwHvX/Fn/jkXNg4pEIQmnE4v3ye7Z+wyv1UfXsFWSPjgrNR3GAz
	 8leKU7aqSxuAebMAue6iPt9wvYIEjMcJO7yzzSxJuXSTkP+vDljnXbaxWwYb6eyKs8
	 eoY97V2Afb1YSvpOPY7/9t6mLWT96w4KzaNTyZF4xuOsYWw9QHWeA5RoR9/OmsAhvp
	 3y5+wL2nN8o9V7Qa/MYsT+9Eoz2LyxzaH5LPK63OKEbURezYWg0bbr751oaBnB7KV5
	 F7jjvNk0tdYSA==
Date: Fri, 13 Nov 2026 09:41:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v2] dt-bindings: display: panel: Make DSI panels port
 optional
Message-ID: <20261113-unbeatable-acoustic-scallop-251311@quoll>
References: <20261112150650.137216-2-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-211417@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-211417@kernel.org>

On Thu, Nov 12, 2026 at 03:15:35PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] dt-bindings: display: panel: ilitek,ili9806e: port made optional
>   for SPI panel

Ack

Best regards,
Krzysztof

