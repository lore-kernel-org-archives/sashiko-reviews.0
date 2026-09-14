Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3332A4252C9
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 10:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380612; cv=none; b=oE+Hz3yDd/OaBvo/oa/plwPqvq3fs+hOn6TN/6HVso2CqrIS/LSDSmgyH9sgRz+ljoeSqYKy1CHjWPVkF0UNxG53DdO8jLySPKPv6uXoi+YndkjLrjxTurfnvsYavPdKU2mcWud7gG8HevIvlw2u6fJC2vc5+T/VT5hqhTcV1Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380612; c=relaxed/simple;
	bh=E8xW+tUodOajGp7idrinqcCpQ2T+Mjybso6K+IxuRM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzXrmUTnSK8B1Jw86R61Y7lhVnRsRc3h8/odpoYOczmOB1GGR/aJHgus9GrqmM/xsCbwzRAk7R8zYSfpSuVEmXelAL9nf7ZSYahHIzAQb/S9NxlVAKCeYk+tYepVlk8/m3BdP2jqmSrXUwoWbFmRCd2TN3QaLg0/5UMlBkuYWHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net; spf=pass smtp.mailfrom=marmottus.net; dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b=FllqzqXC; arc=none smtp.client-ip=217.70.178.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marmottus.net header.i=@marmottus.net header.b="FllqzqXC"
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by mslow3.mail.gandi.net (Postfix) with ESMTP id 8642B58105B
	for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 09:51:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D76AC1F654;
	Mon, 14 Sep 2026 09:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1789379480; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=E8xW+tUodOajGp7idrinqcCpQ2T+Mjybso6K+IxuRM4=;
	b=FllqzqXC1ja7JQ7/ZynxNwm2LrCk/P5JVPmaAIAh0wY+MkJ61v/RShkmCJVanSZ7RodY/Z
	fLxJq6eGLihaGxJsVEdCmOQrb/16AEwmUMqhHf5NNAleluqKg4VyBuECnmlM+bAzzCkryd
	kx2pxm/eMVPuazcrxSxDDYpv9Y+nmxX8kGxopMXUucwb97q7XTUbDFTUw6Jix5Phd/LFDI
	YoaZN06xq7pEJ/IvSPCfTZy3PrGtvo8xXrPUpfjAqeCr1JN4uL9GvHqgxzW+fk5QtuD9dE
	GWfbM7nDoO5uq4K4Zxm3OPoz235ZD5Wjk7Q8IZli4xxjH55sLBPuADw4QtyRqQ==
Date: Mon, 14 Sep 2026 11:51:17 +0200
From: Arthur Crepin Leblond <arthur@marmottus.net>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v7 1/3] dt-bindings: net: wiznet,w5100: convert
 to DT schema
Message-ID: <20260914095117.GA719298@marmottus.net>
Reply-To: arthur@marmottus.net
References: <20260904-wiznet-link-gpio-v7-0-69f01b70c96f@marmottus.net>
 <20260904-wiznet-link-gpio-v7-1-69f01b70c96f@marmottus.net>
 <20260905123628.AF03E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260905123628.AF03E1F00A3D@smtp.kernel.org>
X-GND-Sasl: arthur@marmottus.net
X-GND-Score: 0
X-GND-Cause: dmFkZTGp4xOWI0AdXGoLPHSO91iYdSLtEdQ6Om+eFyJHMqFRF2lr7ogGyK+00aksqXTQkqs8DuUwAJjE15ilokOwbHLb9f6xe1HlKl3QYfOOwAwHDhdmHk2rXZQEEXkWjen8LpLjfjlgYFqOSFQvjvedKbltH8XqIee4f0CmDCwxQeZFe1NAVfpvU+2Lo4huf9/nXBTQSWaS8z4q4+h0u1eWCqHzc3+ITfR+irI9NF1i6pXaZ2YmDazzLcK6hKwyrYvKuECDMMGw96z3raqcMxMACJSa2pFmDjm2nQTRbmKCyoV7oHtn6Slc7URvAXY3YzK55AS+znc/AvtqNo98Kmm5vtqIGwexyScKAF4AuK2fVib8ydJihHmIMeUxfXp8VGo0dPkLRg6FtegaeBGdXZuN0m/Az9nKzPEkxhITUX1KrCbz/sNSoifNOMbDTKuEYlDQGV5oXxTjaoTphC2FOafV49nOBeHiSe3ZIQP7nrGEV2B5nEl+riPgiaRd0rt9We2NEO7/DdSACwDkff47IztBthSUg6E5mNuphPTJAWrXZuOdIEufKCn4xH9mHFRF3jM+JIlhQIc7VHu6dYvEd0+msByedEhbbj+tQwPOxMRJ8sj8wm67ZrAlOJXl9AvKme79wwUJnoaws7RFfda3BFhAvHSQnRypCZUh13wV9u4sIL1khw
X-GND-State: clean

On Sat, Sep 05, 2026 at 12:36:28PM +0000, sashiko-bot@kernel.org wrote:
>Is the changelog description out of date, or was the dynamic property logic
>unintentionally dropped from the schema during a rebase?
>

That's a changelog mistake from my side, it was meant for the second
patch.

Arthur
