Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0DA439008;
	Fri, 24 Jul 2026 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784901344; cv=none; b=dkej5EQt5bQDjuWE9go8aiH1e0XRwtzZlot86IYDwpjUgbZSuCQGI7j9K651OH6lfmPubV9IPW9qoYKUvbBDte59tKzyDNqTKY0R83+i1PjKl4MHd0G+fRtkfE5zRtwn7BCURn8fmVqi7HjiiBhQuEIJgZUgopFH4X82w0m1yaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784901344; c=relaxed/simple;
	bh=l+ydtMp0e392LgYXRuUa8crPo1DGqzCOLt1vxeiiKnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LUhuDiZufLJdHROOQ0egGxe9msheSR1kLpLuWCMAyavRRnxd5xFhIrfKngQOF96xuGbA1hFy8hv3KXv/qsB7/z7VquqB2HZiaiOngsGGhbOPhjwLkHfi53LCDoYolnxTluwXkBE1JmdpxoQXn+j8p89j8ddvq93bBndwlq73/tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEM0GKPo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEM0GKPo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFC31F000E9;
	Fri, 24 Jul 2026 13:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784901338;
	bh=zvSzMRM3ElT54YMPxxSa0YZTYNSOODJLP3+SrVDmgJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KEM0GKPoAht4fx4fZPG8Lp8r5B9Cio/TEUHffCDD7GoNGwt1IStpy3RWxmexbMDwz
	 nIODo341hW2emccqM6a+J2v3EUMH/2XMi60HLAugao4b89MZ2+TnJwAu0Y9xHmIZB3
	 1vVc5UhV58ZUCg1zxFH9/543hQ0G4Hexus7XtVS7V4JHVDMs7YO4OGRetOm17r5Xxu
	 pyawAGUus6Fx8fZQ2oSJJc34QMg+TGdjkB1N10YNIJrqpRnms4QmJUsqiaA5KysGnV
	 gU2lTyRucwk+Mw/QdF5fLkalvQVosIaiGw+L/gf9ZUfxGDYatE6EYI6nUVpky5v95a
	 eTL2b/HMV7VRw==
Date: Fri, 24 Jul 2026 08:55:37 -0500
From: Rob Herring <robh@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: dongxuyang@eswincomputing.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v13 4/5] dt-bindings: timer: dwc: Update resets property
 items
Message-ID: <20260724135537.GA3009481-robh@kernel.org>
References: <20260724084153.1473-1-dongxuyang@eswincomputing.com>
 <20260724084419.1795-1-dongxuyang@eswincomputing.com>
 <20260724085553.BD3971F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724085553.BD3971F000E9@smtp.kernel.org>

On Fri, Jul 24, 2026 at 08:55:53AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> New issues:
> - [High] The timer driver is not updated to deassert the newly allowed second reset line, which can lead to system hangs.
> - [Medium] Missing `reset-names` property prevents accurate hardware representation for partial reset implementations.

Neither of these are issues.

Rob
