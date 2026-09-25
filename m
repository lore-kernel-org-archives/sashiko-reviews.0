Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373BA29DB64
	for <sashiko-reviews@lists.linux.dev>; Fri, 25 Sep 2026 12:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338710; cv=none; b=MAmB6YJ/wiIpchIRh4ifM/sz/X4rJzEcC9Np/P0I1G3491Pvet9+i1Xs2JZg8TblM3cceWb+5K0jvRtPmoOJObXMPbv3B1GVeYj7tnaDnNWlETgmpqr6aHaclaljQ/D2PUOwJQqQzaW95+1yJwQxCnW9xveOp/4o6+VdZnPbvWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338710; c=relaxed/simple;
	bh=rceWb307RNgAdQEJHYj3vhWlcx1kqS1V7axfYwYcJoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NenM1AdPmPNEoPZAlS5h//Zn8vqzxrWkP1XlEaFqIgxU4ufHq5VqGIyTfO8MJd+PFF3PUym5IVaZpqtEvs9XRYX+0elyO2lORnhOO9vkuFRvj9F+ZZUxrAdK56oqTrHhqosxYE5c1iZNcwuImfsT11Wn4OXZOALaXDOhQt7E9KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Xo9ml2M+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Xo9ml2M+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=rceW
	b307RNgAdQEJHYj3vhWlcx1kqS1V7axfYwYcJoA=; b=Xo9ml2M+0XJ/t14LUwMk
	CYf8SEQwSrNpJmOqrCxTZb56aj7G87zdnpmkoDWMFwI38017wTUezkYh+mrAfRd5
	+Fxsj688oW85lPcFauiT8xjMtgb27OAT2VDAsSFw0xdG6UX9MG2zUJ9J5ncM9Btt
	UjF39ORKDa0c77NLUXtGW5xm+pVs9i11IQaS4pd8W7HI1Tz/KF0gZ0tG07TMpICf
	GJ8xsBS9ZoHnZC+a1l9zcWQhyw3TqzZ1EZrgz1uCdWYB6O/G2VY2SDpLN9kqefTd
	U2MmxfU1eslrjskGm++MN1BxWZo4GwMnAbRk4CNHI3n9y21g4fd7Lgcr+4JxlloR
	4Q==
Received: (qmail 1554075 invoked from network); 25 Sep 2026 14:18:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2026 14:18:26 +0200
X-UD-Smtp-Session: l3s3148p1@/uGitk1cjLwujnvn
Date: Fri, 25 Sep 2026 14:18:26 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: sashiko-reviews@lists.linux.dev
Cc: Paul Louvel <paul.louvel@bootlin.com>, devicetree@vger.kernel.org,
	robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v3 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
Message-ID: <arZmkv1mbjkHrdFl@shikoro>
References: <20260924-paul-v7-3-rc1-edac-v3-0-bd8054a5b180@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v3-2-bd8054a5b180@bootlin.com>
 <20260924142525.6FC771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924142525.6FC771F000FF@smtp.kernel.org>


> FIELD_MODIFY() relies on __BF_FIELD_CHECK(), which requires the passed mask
> to be a compile-time constant via a static assertion. Because cdns_rmw()
> takes the mask as a parameter and is not explicitly marked inline, if the
> compiler decides to outline this function, the mask loses its compile-time
> constant property and will trigger a guaranteed build failure.

Maybe just use the binary operators?

