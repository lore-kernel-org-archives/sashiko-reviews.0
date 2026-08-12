Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0CC37E5CA;
	Wed, 12 Aug 2026 19:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563861; cv=none; b=gHhpEwdaAurr6FKXPwIN1t0ozx0McGARYsyOt5fjlB7QpUPWeyOp9JdO3Hssq+nvummmeK3M9GJebO3U5U9ZzyaNSIrVT5lI9Ld2o5vUYlQ57m9htcn0TG9dQm1XnRCTtnqUzdoZJbTHBODbiW2ofcRtEDTWFu7FeVVapGTqi0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563861; c=relaxed/simple;
	bh=bQWLPAxpNZTOvy3Y+tcPydVvEwDj5MG8HRGA4E3mhPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eBjlvOrpEvNjytZCcf1o65FHYYXz31W4ukOz8fEG/v5vKh5uIXXajq3YOFQW+yLw8dbzuij+ehx3QSPLekOQtOaXWmxOLEQHDpr/WG9XHAKSHu8sQBoJ3tM+sT+T5IFseBkRhpIfDa49RXxr9kvbkt3KD5UqVVdSyiHHxdwubMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=m6a1LpNV; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="m6a1LpNV"
Received: from L30177.local (unknown [IPv6:2a01:e0a:ac2:22b0:f846:40e6:d9d0:ef5a])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6748F78035E;
	Wed, 12 Aug 2026 21:44:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1786563856;
	bh=bQWLPAxpNZTOvy3Y+tcPydVvEwDj5MG8HRGA4E3mhPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6a1LpNVczu6+eKchNswANMGeO5vS9mE26nKA1Gvz/KQrpJdqm6vLaM0yJsBJMfuw
	 YsivR8uWf/O6MlL3KldMheQTEwW9lx/1jtiwqiqJwCzxqqGers5kuSar8BdEKIC9Xg
	 2i8fxLDxnDBrO7yEF2aPVYepMXXC2dglguFV5M1kzWOXSWj2xp5oDdY2nzPvzPVTyi
	 j9CN917NGrcy5dMLbp2+FWHsAyREyBi6gHSreXT2U+5DKvYLbYd6oakXBuyCM61XJZ
	 r6nVpme9zdR04I1vig/1VmbOWAqdhvJDFrtQtCjqoerV8//MQzymhFi6kXCfqS+4PL
	 OFzYRJgDyYtzw==
Date: Wed, 12 Aug 2026 21:44:13 +0200
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2] i2c: imx: add I2C_M_REV_DIR_ADDR and I2C_M_NOSTART
Message-ID: <anzNDV8BmdbHArWO@L30177.local>
References: <20260812-for-upstream-i2c-imx-lx2160-reverse-v2-1-f1343714c5a9@free.fr>
 <20260812193031.CD8AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812193031.CD8AC1F000E9@smtp.kernel.org>

Hi M. Bot,

> [Severity: Critical]
> This is a pre-existing issue, but does a 0-length standard I2C read cause an
> integer underflow here?
  ...
> [Severity: High]
> This isn't a bug introduced by this patch, but do the error paths after this
> timeout leak DMA mappings?

Yes, both are preexisting, you are right but they are not the purpose of this serie/thread.

Best regards,
  Vincent
