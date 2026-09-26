Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF5A3BE179;
	Sat, 26 Sep 2026 14:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790434069; cv=none; b=Loi9kYnZr9jXAcl/cWC+eX+e8xdhJwNkSxQ51wfXqQcZYB3Tujs+b2BnJBq0ZCkuWMrbIQDPi+xvG1yifhxPcBuOmUc8flINeKXZa12q7YwFhQ5DCJJ3Lm5k5LlqU6rnviDOMCaDjl1VAUI+4nqNBlaI70o0LLY/w/bH77Qpk5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790434069; c=relaxed/simple;
	bh=SoIzXhEvbmeAD+ywcurIKAt/n3H8uZhGifNEixSUVaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqcf5JO/cuHlCsYoL8EGZLpdLwhyeodS67OFv2VJbA+okisc01ObeSdY7KTghJ9Y0rW6ElGH6huooOOVOoo7ISv7KjuIqkoG6m8bVIM4ZkfMqqpkcs3Jcbotpa2+SdBig0TD1jzPUlirsuVQiuUrm8OSt3+cXoJk5GTL0NqituY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWfrJrju; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWfrJrju"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E7C1F000FF;
	Sat, 26 Sep 2026 14:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790434067;
	bh=YlivOBdPljKSWxtj70JMDp/3hwUgvEIJgivJLHAjQZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XWfrJrjuLQI3IPqEWMR+N6/6eFxlzs+LCCJVTOs3GhKN4zA/LJlkqkmsi4+BkT2YC
	 Llq7XMsepZ02+FOyWeAKoHvXJ7NGPZ3b2J1iHGG4W+ZFvtFnclh4VYAbzbP5vvH125
	 ula6zpGB74d0NHfdcRr85gLdIQevicggqvHyE2pR5GdFzgyaxrH7RP/Vjg4p0LKzet
	 UnMiFfrITgh4PZzppReuok/+VL2URbQY8ZYcW0DJzh86iijQXVTMf8PBtuhCxXk7Gy
	 Gi6D6Vmi4r+UMT+X6sIpckYXldueylbfMqzmVfMXQhtsvo5t2KrGf8MFej4tumaEF8
	 Dc0fAY+ieHBVg==
Date: Sat, 26 Sep 2026 16:47:35 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: sashiko-reviews@lists.linux.dev
Cc: Christian Marangi <ansuelsmth@gmail.com>, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, vkoul@kernel.org, robh@kernel.org, olteanv@gmail.com, 
	neil.armstrong@linaro.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v11 3/3] phy: airoha: Add support for Airoha AN7581 USB
 PHY
Message-ID: <owibbez4nfq5gh4b2ensbhy7d5trmcwupe4rqox5ig3wy33ngp@6z4gbmqry2cy>
References: <20260724184523.193661-1-ansuelsmth@gmail.com>
 <20260724184523.193661-4-ansuelsmth@gmail.com>
 <20260724190135.B22051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260724190135.B22051F000E9@smtp.kernel.org>

On Fri, Jul 24, 2026 at 07:01:35PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] Missing PHY Initialization for SerDes PHY (API Violation)
> - [High] Incorrect Register Update using regmap_set_bits with a multi-bit mask
> - [Medium] Semantic Mismatch: Hardcoding SerDes PHY to DEVICE mode ignores HOST controller capability
> - [Low] Missing Header Files for Core Kernel APIs

Please respond to these issues.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
