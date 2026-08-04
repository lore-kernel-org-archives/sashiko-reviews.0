Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC043C4562
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785856549; cv=none; b=uop1ueOb1D/W4uj6YkaQRRVKMe4lfBxFdLdyMjnf6elIhuBTpv6rLldILT1ZMPKehROUPrGEG273cquLtjduByxLSsqlJgZhf4QMXb/+ENkev55Zqts9xaEs3FE+fMmWTDhW6cjFnZW4w8rF9l2rTAKkVcS85wWQr5ZwWU9T9kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785856549; c=relaxed/simple;
	bh=cq0nHALLi0tMHAVAK/aPY3SV7ESZLUW+ZjXlOpXq2LU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VVu056z31ss8wNwVqLQELaP8fcGV1oEwFIwsStA78j40kh222Z9z0UNRVcm3vdmdyXs9sVo+QYj2WcO4Zekc8o4YnxBIST5ortTOdhMQyDVLqCXiJr7X9LtHxGZF8PPjGw+etn0olV+djECftbvUjQqhugnTYV1Ri4Ke38mdYYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=qAC3W+n1; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="qAC3W+n1"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wrGKT-00000001dDg-46dq
	for sashiko-reviews@lists.linux.dev;
	Tue, 04 Aug 2026 16:41:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=umx+0Xbf1pGIjPYZoWYg8y6Brc8GBYfdVPjn8jMxYQI=; t=1785854477; x=1787064077; 
	b=qAC3W+n11tlrd1g+Lg7x+pXQ3CBPNwNqV1vUFzgmYkTnc9i0HTWERVyf9LwbHrcg10gUCZz+CEV
	UuQ9RMT2FMpd/d/qcBnnPLNQouf6hJ/+XaY4PxB4f/9xOwzfera4bDFuBACErW/HQy38T0sS/llrc
	MpQ3dtNSue9N/mURbKRTmqded9B1XhlQ/AfUuZD0MfdZMHjeVfhnCr1WZEFWFwbVmeYVYZuam8tHn
	BY8BTLgv0Lx4xTon2mseAqrFQTPjh5Rv0tm+uUx6gs7Np85JliIgwsTaQ38EenHtveA+dVH2GtBh1
	GtZXCjSxuVLVnSNPClZi4LdDX8SN7FYYg/fw==;
Date: Tue, 4 Aug 2026 16:41:01 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, lee@kernel.org,
 linux-leds@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3] leds: is31fl319x: modernize registration
Message-ID: <20260804164101.43753f1b@kemnade.info>
In-Reply-To: <20260804135515.5DBFC1F000E9@smtp.kernel.org>
References: <20260804-led-modern-v3-1-297720eec19f@kemnade.info>
	<20260804135515.5DBFC1F000E9@smtp.kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 04 Aug 2026 13:55:14 +0000
sashiko-bot@kernel.org wrote:

> > leds: is31fl319x: modernize registration  
> 
> [Severity: Low]
> This isn't a bug, but should the description after the subsystem prefix be
> capitalized? The LED subsystem guidelines recommend formatting commit messages
> as "leds: <Driver>: <Capitalized description>".


~/linux$ grep -R 'leds: <Driver>: <Capitalized description>"' Documentation/
~/linux$ ls Documentation/leds/
index.rst                  leds-lp5521.rst      leds-sc27xx.rst
leds-blinkm.rst            leds-lp5523.rst      leds-st1202.rst
leds-cht-wcove.rst         leds-lp5562.rst      ledtrig-oneshot.rst
leds-class-flash.rst       leds-lp55xx.rst      ledtrig-transient.rst
leds-class-multicolor.rst  leds-lp5812.rst      ledtrig-usbport.rst
leds-class.rst             leds-mlxcpld.rst     uleds.rst
leds-el15203000.rst        leds-mt6370-rgb.rst  well-known-leds.txt
leds-lm3556.rst            leds-qcom-lpg.rst
leds-lp3944.rst            leds-s2m-rgb.rst

nothing look like special guidelines for the system. I do not want to
see such comments without a reference.
Also MAINTAINERS does not show any additional policy for the LED subsystem.

Regards,
Andreas
