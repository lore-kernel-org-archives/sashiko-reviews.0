Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976D742A16B;
	Tue, 28 Jul 2026 23:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785281900; cv=none; b=lGrPizdM0L1vpotj211qbTtqaBBWZr+SFRT/1TJfNtUWtd+En0vlnCz8k3a3GOBSC8vCW6bYMNNDTnGZxHDNMZ7Gdx8QtpGo8ti0zh5i1Mr6NqVPMv6O5VPB8mcIWP5iiTUKT9ljaqqUWPkqkXbbZlWRAGeEMDvdzlj4YPlRR7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785281900; c=relaxed/simple;
	bh=KQL3R0v/z7DlwkYj5CnUs3KZBJ9mnTAxikV16teHYy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cheCjLpVeDtzzESJtjcahv/l/xy1K/2U+WpwORcOhYsqeA7GNnuqSJkikySxYFH+dLmWtXZMRgWl1B4zdJ8r0FfjUCaSq5cvmqqqGx0fNNtc2KSqwcf2baIcGzepGqpzgl1LqdrNt/wfp+he+Tlsb0MUJF1AhHFrgFRd8EOYU0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haCCh3RY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haCCh3RY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E0C1F000E9;
	Tue, 28 Jul 2026 23:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785281890;
	bh=lEFXPTpHisQaEXsrIG6LaLdD1i4QU2aGZ2O16KHXXs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=haCCh3RYAe4mGWCwNTcRLr+bB1qRfbF10cEHMsgUFEar5cehGK3SPTIqKrJYJ/GPR
	 PmebK1BzFO3ZHYP1u94fTySeJnGOkCxdzk2OHNNNfXuwxM0noklp4OiXZRxNqMHX4i
	 WvBQtUvigyUxrzRwt1Bw/LUiy5cqodR76t6iyd3JJCiuR+8q/YU1LbSzrl6WRWcgmv
	 g1MQgMB9ghGRT6QI+2XUZKUMONv+M8EzcgB8TZeWtNdxYVOVU9wXq+vDKGnvCqtkOh
	 ErM+nAdQWuXqfzZhXRWPdSfT9M8qcFku/ieWZidSfKHJgLYymCxcKQdddVy5ScLt7j
	 BcKgH1errWklQ==
Date: Tue, 28 Jul 2026 16:38:09 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: sashiko-reviews@lists.linux.dev, vkoul@kernel.org, conor+dt@kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	robh@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org
Subject: Re: [PATCH v2 1/2] dt-bindings: phy: add binding for T-Head TH1520
 USB PHY
Message-ID: <amk9YYzI+LqCHhcy@x1>
References: <20260723084316.3573714-1-zhengxingda@iscas.ac.cn>
 <20260723084316.3573714-2-zhengxingda@iscas.ac.cn>
 <20260723084759.3BBF81F000E9@smtp.kernel.org>
 <8ccf1a36179881b1f9662e70d728322c62c88f78.camel@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ccf1a36179881b1f9662e70d728322c62c88f78.camel@iscas.ac.cn>

On Thu, Jul 23, 2026 at 10:05:24PM +0800, Icenowy Zheng wrote: > 在 2026-07-23四的 08:47 +0000，sashiko-bot@kernel.org写道：
> > Thank you for your contribution! Sashiko AI review found 2 potential
> > issue(s) to consider:
> > - [Medium] The 'reg' property is omitted from the 'required' list for
> > a memory-mapped PHY.
> > - [Medium] The 'avdd33-usb3-supply' is omitted from the 'required'
> > list based on software limitations rather than hardware description.
> 
> Well this is also to workaround the problem raised by Sashiko yourself
> at [1].
> 
> I didn't mention it in the log because I am not sure whether this is a
> real problem.
> 
> [1]
> https://sashiko.dev/#/patchset/20260507081710.4090814-1-zhengxingda%40iscas.ac.cn?part=6

I think Sashiko's comment on v1 was incorrect, and avdd33-usb3-supply
should be required.

Sashiko claimed that making avdd33-usb3-supply required would break
dtbs_check for boards that include th1520.dtsi but do not provide the
regulator. However, dtschema does not warn about missing properties if
the node is disabled [1]. Therefore, only boards that enable the usb phy
node would need to provide avdd33-usb3-supply.

Thanks,
Drew

[1] https://github.com/devicetree-org/dt-schema/blob/eb0e53d1c5b071865abbf7d251721431e8e6bd71/dtschema/dtb_validate.py#L256
