Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B5B3D567F;
	Mon, 29 Jun 2026 07:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782717911; cv=none; b=XPdA0SzmoXmFbYqHas4sOtXBfJ5RuLgxAjZ2MU2pSHH4gDriZDx4/NcQN/Lb3DFIoHEsaNyPLvlpXM0peZ/FN5c3q1el+phxqzcuhDBtByIV6j1GGWHx61aPGgeMkCbEiQEIKFoLqRkD2jQgfEg1Kb/ESCAowKrOjVMyw5xNYek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782717911; c=relaxed/simple;
	bh=+RGhN5SPLOpVavzIhrMFcHNdlgf1kDtlqqwO6DjPQ3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sg/gxwDh4t6CruuqGx/uDehWaVtJ88mRXEsV0nwHqpAqteL+CqAlKYP0cjg7vSdXZYg5vm80+5iXT5OKa8MRfEORwKt2MV5vAvbovxWklUJkngM+wkaiLgeB9SQTU/bxF5i+b8X3WeWVTP+t8Q4dE8iJiZ8gKNnon0Nplv8BNV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA291F000E9;
	Mon, 29 Jun 2026 07:25:07 +0000 (UTC)
Date: Mon, 29 Jun 2026 09:25:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, robh@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/3] dt-bindings: i2c: Add Qualcomm I2C slave
 controller
Message-ID: <20260629-expensive-mongrel-of-fame-b39d71@quoll>
References: <20260628-i2c-qcom-slave-v1-0-8b0a5c01f9f6@oss.qualcomm.com>
 <20260628-i2c-qcom-slave-v1-1-8b0a5c01f9f6@oss.qualcomm.com>
 <20260628144739.96CD51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260628144739.96CD51F000E9@smtp.kernel.org>

On Sun, Jun 28, 2026 at 02:47:39PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The binding conflates the I2C controller and the logical I2C slave device, violating the standard Linux I2C slave device tree model.
> - [Low] The compatible string `qcom,i2c-slave` is overly generic and lacks an SoC-specific identifier.

Not "Low", really, because it is a well documented, which when ignored
becomes a blocker. :)

Best regards,
Krzysztof

