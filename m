Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18C636BCFB;
	Mon,  8 Jun 2026 20:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780949844; cv=none; b=VV22LgrAmiujJaoDZ/Fvd5MuRX4A4+p6fLChbKZFG36eqACSQ31u4xHsTQGM4XyENsSDfyxEehbsln69jLLlr3P2beuedFclwIBU9ytsMRxR826AZjBV9/O1cUTC7BI6pmuiJoTq1EJ/Aw5IJVYSqI5Vqqmve5Vd3a5FpqVqGJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780949844; c=relaxed/simple;
	bh=7WCbsP7oNgYRZKNLcDmBqkiT/LXHZ4cU4nSTEWa+I0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MipmBfL8fNdAecaVLPD3H+n6LxtW2US7ITr4ayML3JkJbKn9u1j3so8uV+k0WgMoI8gROLZ06AyvF1xsZs0VUGHrVboMavhHWpvLqCHQOp/6pSKPIHwzMENeYvcHspJpYAjhpMz97I6urt1piFvW4i0rwZhBFZbMFaXU8R4aPNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LR2IjAQh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LR2IjAQh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728511F00898;
	Mon,  8 Jun 2026 20:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780949843;
	bh=7WCbsP7oNgYRZKNLcDmBqkiT/LXHZ4cU4nSTEWa+I0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LR2IjAQh2yGaOUUu+HJ1GeRB1tlkVUgChZ/FpQrhNbMZFaRswfO/+hBbtd+LShT+a
	 mI/dvOAwmZalf1HdL5OKQcWabUj6+NV37caAITv5Vt90g+c22dPDv8+khzMl9zAgie
	 wNDF9upCdS8UANWijhVreLADPR1fEta9Zf1HGGJO8S6lKYlQmm1nRIIP0eT9ODegGF
	 kTpX4n4naCQcMLzvPjJYfFq342e3FZ3dYkXxD0lQayv/IOalZPSnaHH7rCtG63G916
	 4/XD/YqaLWfPgx4WISdDX/FXfkFLJ0bBQ9hgsuUHEH2bRtbvR39nuCTZk3OMGpBGVi
	 R5qe0U4woB4gg==
Date: Mon, 8 Jun 2026 22:17:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, 
	conor+dt@kernel.org
Subject: Re: [PATCH v2 4/4] ARM: dts: ti: Add specific compatibles for SCM
 conf nodes
Message-ID: <20260608-alluring-holistic-chamois-babd95@quoll>
References: <20260608-n-dt-bindings-simple-bus-syscon-v2-4-0203e6c249dc@oss.qualcomm.com>
 <20260608141135.BB3121F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260608141135.BB3121F00893@smtp.kernel.org>

On Mon, Jun 08, 2026 at 02:11:34PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] The compatible `ti,omap5-scm-conf` is incorrectly and generically assigned to the `omap5_padconf_global` node instead of a dedicated padconf compatible.
> --

Correct, this should be ti,omap5-sysc-padconf-global.

Best regards,
Krzysztof

