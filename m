Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.194.8.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027065;
	b=F3qfEENzLnBEflvuBtRof8s+Dwb4nak5PDO6b2K/8GD1eQQ3PGF0TDZDa+bdvgzM/eFP
	 RynKaL2FX/Bje+hKJFQPF/PY7/Pv0MYfqqwV8nGqSaT+lImgnI/b1JNDPDPC8Yx25yoaX
	 SGrPlF7DZ4AauFamgRcpkbOR9YMvSqeOUp01I3rsEYujmqJUJFICocRblqTX6pBspiDLH
	 R4Z1I0ya1zS5MXu5o3xM7RcOIqSiOTd14OQPpzq7pzy6o4DVKdIBOUW/DurhTkMaV/9Hi
	 02gxExTwOoSgrG65tYjBKr4XR1oZOoHq6abcdKSiJZXDvIRak0Cf6sLwLnVY/tEUlZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027065;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=HYS4Hhk1XtX2QGmPf086xmrpzOVBpca45TP8GMHf5yk=;
	b=EdH4OMfogmTuYLV50qAw9MvwByptWwtCC+cZYU0SuR7SyUILiMhojx4YDivLzYo1BzJL
	 2NNCjYaCiraGruWdsYce8J+2DHRkliQy3IWZDzN1rC8kEwkV/jeJNgiyjc/R8zJsYr3MK
	 n48ddOa5hNjAuRnqywP/IrgTjMjJHOAXDbr74GOGsl7krj9vpB4/XE3xr5lfBz360XaJK
	 J9FdxlGb/7kXimuNdZXXe8kSnVaO+gyFrBIQPHKnSwwTPfWwdmsU52vUlY+VzNEifnDIA
	 4/LULqBIGvyVLbOJewJj/DgJxuUmTlSYGlGlWJMO/iLrm+0egSU0jNryEn0TxsUxGww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dolcini.it;
	spf=pass smtp.mailfrom=dolcini.it;
	dkim=pass header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b="M/wWPWC3";
	arc=none smtp.remote-ip=217.194.8.81
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F38C606A32F;
	Wed, 18 Nov 2026 18:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F38C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dolcini.it header.i=@dolcini.it header.a=rsa-sha256 header.s=default header.b=M/wWPWC3
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5EA1D22219;
	Wed, 18 Nov 2026 19:37:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1795027062;
	bh=HYS4Hhk1XtX2QGmPf086xmrpzOVBpca45TP8GMHf5yk=; h=From:To:Subject;
	b=M/wWPWC3Wfdp9xIUcX2cFdGqPkTBcZ90qqpPnEeiCicwE8eJJuXW+LW1dpPY0fbDE
	 Rkw0L0NfQVNwG1E9imGv4ZR9zkQPuKpDh3yMDZHalSjBgJMyWyaabalCTOiCFcJrKw
	 XlqNnyOI2ssPlxtbYdrwUCKcQpz563uLFTbWqrqmEmS9WcZnlPViC5994Be3NCMWTr
	 Tg/PlUwHYGX0kDkoX7Hemi/KX7p2K1ly/rwccXnqPCf7j3jF3MS5oZIvQ7AKzfknzW
	 2bhd94dWN4uV2j5SyACBIRdkSsDRIgUU51INBqUpefRtvvvYvzod+piDyb27MMzPPE
	 Nn57f9kLaIggw==
Date: Wed, 18 Nov 2026 19:37:41 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Frank.Li@kernel.org
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: freescale: imx8q: Remove undocumented,
 unapproved aliases
Message-ID: <20261118183741.GB530200@francesco-nb>
References: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261117133842.245262-4-krzysztof.kozlowski@oss.qualcomm.com>
 <sashiko-outbox-218903@kernel.org>
 <c3082671-9d0d-4a29-9e05-17ae9d4ca997@oss.qualcomm.com>
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
In-Reply-To: <c3082671-9d0d-4a29-9e05-17ae9d4ca997@oss.qualcomm.com>

Hello Krzysztof, Frank

On Wed, Nov 18, 2026 at 01:10:30PM +0100, Krzysztof Kozlowski wrote:
> On 17/11/2026 14:47, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [High] arm64: dts: imx8q: removing vpu-core aliases breaks
> >   vpu_core_probe()
> 
> That's intentional. Users should not add undocumented ABI and rely on that.


If I understand correctly this is breaking working software (correct me
if I am wrong!)
 
I see the need of a clean-up, but I do not think that just introducing a
regression for the users is the right way to go.

We should fix the code that rely on this, and after that remove the
aliases.

Francesco


