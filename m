Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042141F09A8;
	Mon, 22 Jun 2026 07:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113424; cv=none; b=G93LXqdRM2TgMnVMAH7ZNpbX8hTqSyIUUdIrxNZ41tM75lSlJt+EsQ6m7ASSltIR+758cq3MCACVz4fav8/PuFJ5f7u4X6jERmzGj68Z1Wj9U8MHhE27X2AekgjgDu75cIZzC/2AMUAXsMLJbMxGY+0hgI6xI3Af9+UxJSj5TzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113424; c=relaxed/simple;
	bh=amMs8unfnbMWuuTRxncZgfRPSG/qOQiUdizy/qLk184=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfsMYPfPjeJryWIFtrXYZx3V5AsDRekuXn5RQToppYYDzZGtpKatn9YKRsTv90MMnfjzhOVbYEgCrtLNhWmn+Vec66MBxr/ODpSNYL+M/kKl53IYMT6VZIAu1XKtdD1gcmr8nudnlK3oXPioUoit2lqxBVXDsdgOw2Ebk3fdD5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icffYBxR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icffYBxR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 871B61F000E9;
	Mon, 22 Jun 2026 07:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782113423;
	bh=amMs8unfnbMWuuTRxncZgfRPSG/qOQiUdizy/qLk184=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=icffYBxRe4/iiss3wLiMGpi4iA8rhyqI4untuc7qIP/h1Wz8SiV56qNhqE57Wl6wE
	 fWyxR4NjmnEf4t/b/XnT/Ks5X0uFlZ5PKK3VequJEzsxxtglZMpFG3PdJMTOeSQ+NX
	 BjQ73ouH2aSiSq2b3GT6WYP2kxAd2cLPUcQuNA6yQASi82UnEH1ni8W9UWXFpWzGzr
	 SvjUuSbaBHyuAzaHN76zoZVHQiROwZHtGtXqNyaRe5UaXNugvdwLbadq2+i4Yb9OVu
	 6Cmjpg54pcuDTxZtb+kVonpF0B91Fy58Ti41rLUI9LpFLYjaSUJxMzvJ+mo4aS/SFM
	 xKCiU/7VmX7SA==
Date: Mon, 22 Jun 2026 09:30:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, robh@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/8] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Message-ID: <20260622-polite-tireless-orangutan-29a8d4@quoll>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-1-c939c22ded0c@oss.qualcomm.com>
 <20260622051811.D8B041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260622051811.D8B041F000E9@smtp.kernel.org>

On Mon, Jun 22, 2026 at 05:18:11AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit message claims to 'Mark the relevant supplies as required per compatible using allOf/if/then conditionals', but the implementation uses an unconditional global `required` list. The conditionals are actually introduced in the subsequent patch 'dt-bindings: clock: qcom,glymur-tcsr: Add mahua support', making the commit message for this patch inaccurate.

This is a valid comment.

Best regards,
Krzysztof

