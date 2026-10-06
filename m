Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B60B455172;
	Tue,  6 Oct 2026 15:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791298904; cv=none; b=H8ImFrDpJYb82ONdBlqijdwnvRFOvlgf6natGsVxeHj4d10rJZWZ5OSMkyiulrAUTzVpj45/TARXJ7ptcwSQTA+SzYb9iJU7rhHZyNAfLRzzVqAjukdSyBjR1uizgt40o1jbNtlAQW6kr35aGTuIBTqZ+D3yehicQiNhlfGSyHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791298904; c=relaxed/simple;
	bh=WCReoSrP+WxFLri6IhjP00i7qONfVXljIS8JO0K/5xc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N1ejQnYDzsGuwG7lGWlSTDd5R7jzXWsnIgDriC+fayFODeEdQwXP4yTu/df7G3VMYR3wdUtailmVvfnlA+i9JL0xw2AOTBYMnorSbHmGwauhS92cLhFVebhuCwr9oH4J2L0teTYfc+l1Hpy+szIKWBb33S+Sadj12QIxrV0ezHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=JkpbdRIl; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="JkpbdRIl"
Received: from francesco-nb (unknown [81.0.251.149])
	by mail11.truemail.it (Postfix) with ESMTPA id 8823F201A2;
	Tue,  6 Oct 2026 17:01:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791298892;
	bh=WCReoSrP+WxFLri6IhjP00i7qONfVXljIS8JO0K/5xc=; h=From:To:Subject;
	b=JkpbdRIl5EUmQEMPX+yhyJh5beUWJ8DNkXlZjBcFwxQ65VzrYfaXxO0yOc6RswYWD
	 8cew4LR9ZOPNIF7TObQXGbeu97P+EcywAp2W3D1P2vDlXOXF+9mFzPXnJ5vW1fmD0g
	 QEfdo3530YccdzdsPONS/pyP8lSzR8Y/7yg8O+vFGypSjXAUN28g8gCs+Aj1gEBmY/
	 xPxgE6KyEC4vOThjB5El4DNQt8vt84Q9rKc9ZJy2vxxXasS4qmJH0bafn6aXRlKkkU
	 aZYmxfe6bB2n/fHId+WbzUy01qYG+LZv8eg4TMb9FDCizRPmNTlH2yumBFL10I9OjP
	 qj9aNKGyMBlLA==
Date: Tue, 6 Oct 2026 17:01:28 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: sashiko-reviews@lists.linux.dev
Cc: Francesco Dolcini <francesco@dolcini.it>, robh@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v2 2/4] drm/bridge: Add THine THC63LVD827 LVDS encoder
Message-ID: <20261006150128.GA30406@francesco-nb>
References: <20261005095006.20290-1-francesco@dolcini.it>
 <20261005095006.20290-3-francesco@dolcini.it>
 <20261005100943.1A2711F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005100943.1A2711F000FF@smtp.kernel.org>

On Mon, Oct 05, 2026 at 10:09:42AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] drm/bridge: back-powering via GPIOs on unpowered chip

Not planning to address this feedback unless/till someone comment on it.

For what matter, the HW I have available and I tested with has always-on
power supply.

Francesco

