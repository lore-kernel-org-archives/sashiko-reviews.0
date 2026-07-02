Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C056544E021;
	Thu,  2 Jul 2026 13:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998560; cv=none; b=THBPeI0CKHsWUhwLcFh8D7ALcFyD4XC0AIrBHdX01/eTYEIqutiR5OFJHSibbBVVZysvIZoT+jW/CDl2C1ei2E2U4GhbDpwF9Jg1k4/cHMWV2HGNIF6mamkZco14WaLEa6+DnvgHE1azPVAXIrb7dFzRDjpvvp6XvtL3hwTM3Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998560; c=relaxed/simple;
	bh=zR2ssBTJ0hc8qe+ldHpvUptRAIZg+VWONUgR5PKlGfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9aQWTkEY/k68AcAeoHI9J4CvYeevr1y4qox5KVjr/AtjoZ4AQTQMSFhlIyhZAToOuhxeOxtD2awr/0PdCdAfpa6WHtydmzMjRAk0/F5sLKJ6Ux4+iWRGm1KwDSn7SX7VHes9luQSTqUYupeaNC8flHYnTr4SzstuG8q0CIdpso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zbKFCrLI; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zbKFCrLI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=tWlnBBIqu+jwhvkKN/N5JYkj1UlSldgA+HsxEGOrqnM=; b=zbKFCrLI1i8pQY9ZY7jVNYvcYe
	RDv8omyGh7Ow2IczFdscKKXjBPx2kY8e/hioXEUYEofi0EzIBJOZD0pI2iMXWY3guOv1Gb80lOzNS
	Vyjh7E16J3p2Qu0syeu8I4sXQscmfKYfcdETJhkJMErFiQi54pNekZnWDWbbGcprOqQ0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wfHNC-00ANLw-SO; Thu, 02 Jul 2026 15:22:34 +0200
Date: Thu, 2 Jul 2026 15:22:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5p2O5b+X?= <lizhi2@eswincomputing.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
	devicetree@vger.kernel.org, Min Lin <linmin@eswincomputing.com>
Subject: Re: Re: [PATCH net-next v9 6/6] riscv: dts: eswin:
 eic7700-hifive-premier-p550: enable Ethernet controller
Message-ID: <58532b95-bb74-4d87-acae-e67b41dd7d57@lunn.ch>
References: <20260630063123.1118-1-lizhi2@eswincomputing.com>
 <20260630063445.1226-1-lizhi2@eswincomputing.com>
 <20260701063512.9ED051F000E9@smtp.kernel.org>
 <5de09a24.a11e.19f2207d7d2.Coremail.lizhi2@eswincomputing.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5de09a24.a11e.19f2207d7d2.Coremail.lizhi2@eswincomputing.com>

> Hi Andrew,
> 
> One question before I prepare the next revision.
> 
> As discussed previously, the DTS patch was included only to provide the overall
> Ethernet design context during the review of the binding and driver patches:
> 
> https://lore.kernel.org/lkml/64bf6b40-b947-4ffa-8d48-4d6341931327@lunn.ch/
> 
> For the next revision, would it be acceptable to drop the DTS patch from this
> series and post only the binding and driver patches? The complete DTS
> enablement is planned to be submitted later as a separate series after the
> binding and driver have been merged.

What normally happens is that I give an Acked-by: or a Reviewed-by:
for the DT patch, and you submit it for merging via the DT Maintainer.
Everything then meets up in linux-next.

Why do you need to do this later? Why not now?

	Andrew
