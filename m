Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5B4339853;
	Mon, 18 May 2026 23:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147327; cv=none; b=oPoSpeMWNcXaEg7a4XmQiKHH9ErCVS6YxQZ83plW7POJCRIVtnZRVzEkjHpPydRRKE/Eqy6Ip1eEg4c7t18Uh/xe6Dqqpv+a7mGFYx4ypB7cmTJz0pYEXA1NhB2aHSGBvolC8VWPiX/y7YGiMCy9NRPL4oJ9Qi2EpGfIKOu3Kw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147327; c=relaxed/simple;
	bh=+yCUjbf1lgIgY7tmqGE2ZbYE1MkVWwr03vrMEygO9BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cARmbCfs6KT9DNulRfD3ELtPz09Q3PXVQ4iBNhL1Coe6zpOLmsGXpIIBjvzolfKbrtIaFU48h7cZiWn9bzicoSzJxm99u5jA3VcJR855KYwBEIHAylzbg3Oie82vyAhrQ7+l2LK2niPTs6dqi9nk/rvOuL2l6WSewa//u9Ki3cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4HhlMkq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4HhlMkq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49841C2BCB8;
	Mon, 18 May 2026 23:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779147326;
	bh=+yCUjbf1lgIgY7tmqGE2ZbYE1MkVWwr03vrMEygO9BQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y4HhlMkqUr13LlxLZZNWcmNB4HmUPI/9CAleSJtg1ULq+YCV60JBkRPiObpogdJ7p
	 APcQXCTZ3iQ46lWSrXAOh+fYywQJ4LUtHBNiKzFzJNIZoItmNHBzc9XUipVcsnZsuV
	 tQ3k1xMczsOeu4s1mkAwSz+LQkIaIqhnKD1cg8VmRSzyvg7vOI2EKprumf7wuKVH7a
	 dbh4IplfnY8AQjNuNArFkVOQ9lCR/hBpuuUO8b5gh9siQtuPr4JWl1liDOHgypZl1R
	 /WzuJPbVOpctjfFmzrZ8/jJK+ryIzErGr2gbqSWfKbmfAFunsY+J6Po7t82+qQmPCi
	 XDMe4IXpr7rVA==
Date: Mon, 18 May 2026 23:35:24 +0000
From: Yixun Lan <dlan@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: spacemit: k3: Add pwm support
Message-ID: <20260518233524-GKD3679294@kernel.org>
References: <20260518-04-k3-pwm-dts-v2-1-c0ccba430abf@kernel.org>
 <20260518120631.67D96C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518120631.67D96C2BCB7@smtp.kernel.org>

Hi

On 12:06 Mon 18 May     , sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The driver ignores the `bus` clock, which will lead to a system hang when accessing registers.
> - [Medium] DT binding violation due to undocumented compatible string and property constraints.
> - [Low] Copy-paste errors in pinctrl sub-node names.
> --
> 
> commit 4d46fb2ab333b7a733df38e29f0f7c7d23523cee
> Author: Yixun Lan <dlan@kernel.org>
> 
> riscv: dts: spacemit: k3: Add pwm support
>     
> This patch populates all PWM device tree nodes for the SpacemiT K3 SoC. It
> also adds the corresponding pinctrl configurations to easily enable them.
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> > index 23899d3f308a0..06abca6d08832 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> [ ... ]
> > +	/omit-if-no-ref/
> > +	pwm1_1_cfg: pwm1-1-cfg {
..
> > +		pwm0-0-pins {

sorry, I overlooked this.. will fix it in next version

> > +			pinmux = <K3_PADCONF(43, 6)>;	/* pwm1 */
> > +
> > +			bias-pull-up = <0>;
> > +			drive-strength = <25>;
> > +		};
> > +	};
> 
> This isn't a bug, but it looks like there might be a copy-paste error here.
> Should this sub-node be named pwm1-1-pins instead of pwm0-0-pins? This
> pattern also appears in other blocks like pwm1_2_cfg and pwm6_1_cfg.
> 

-- 
Yixun Lan (dlan)
