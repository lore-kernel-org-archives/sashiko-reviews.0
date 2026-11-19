Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084946;
	b=5XLE9c1G3JWxSV3OYBa7X+SBe+kDzCyMs/UPVk3g6bOB+ZP2ihNHsJMYTCjep7jqJe9q
	 sOJ3wrl/eo5dEj0md0cNITJktKyjhDRGKZce862+1WMp5NkoKbQiyp1iul4yxD9+m+fZH
	 xiekPEwnMZbqtH9lAEGfAgF+YVgOHMlgbGvdDLfklcwf6vc8Ko1Paq/WDkKt3OimU9z7f
	 zu2WKbz7XuDrwfZ0PAoorvSCoX7PemLybbD2OMhfY53sbOgqoF5Bgvc924C3m9r0vur9+
	 pRDXGX+j4I+gK0befP6jWwm8pKw+voATA8BPQATAkoTpK9S/uCy3+nuMT+4njh7CIPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084946;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=m3BRLG4pswPomjtgFpj5F2ZQh9CiTK8l3dn7ZhnWJlk=;
	b=2npXW+C886dTBoQJHGbrmTjqaco7hCe88l31DmcyQh7s3PBHa6RPw24oMERmtPYwziRR
	 Wr1fr3DvtBBef4pVeXG5/MNEV52gB83wW+zXECpJrLIfKmCjih6g3Zgt61Of4XuA7aLpH
	 4cq1emfN5jFd1Sxfm6LyG/SGysZ9/kGob5HIGHyux2CIoByVNSog/4hUZmaV+FXnDv+3A
	 bnAGRBecnNipxmiFIlhXKsFdXc9Np0Ix4ui+zJISaCdT2TKANQS8I9OEuavdlw20cf9VF
	 QbOz7yE6L+mEhIgvaU8kdHNBvWFJyuNCmMkXm4n1CMofqce6H0n6GWbIlIiEW+WrFAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ur17vZhb;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26EF606A33E
	for <sashiko-reviews@lists.linux.dev>; Thu, 19 Nov 2026 10:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D26EF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Ur17vZhb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4D1114E41662;
	Thu, 19 Nov 2026 10:42:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AD5160237;
	Thu, 19 Nov 2026 10:42:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8243011BC0D95;
	Thu, 19 Nov 2026 11:42:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795084942; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m3BRLG4pswPomjtgFpj5F2ZQh9CiTK8l3dn7ZhnWJlk=;
	b=Ur17vZhbjIDLKoNHyghc2iKvn4KUB2Q9sx/KRxek6oeo3q3a/Wj8TR90z4P67iy7leRj4r
	D+57mK7XeBszRAMIs0qVzaq+R0Yhikk1Y0kJ0vA6ql27lobcnj160Ncui1BadaKgoNs5wS
	BMNx22szMIrbcl/rfSb6YoElLMnDX7bwy3J7wBwvzdzoG/J7t9LvoxrgOPPo3lNnXOJdvJ
	WhcYKnDYO9fuvo1+KjLn/X0Wv3R+VOHk1qFUY40FBp2VH4E+uDkG74BdGE0QmY7jt0OWl+
	tQtmZw/glFdrygoQzNO1MRTCiexRaiUbeJltUEVy4G3doNmf6AmDaJAwdH34SA==
Date: Thu, 19 Nov 2026 11:42:18 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
 robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v9 4/4] bus: simple-pm-bus: Populate child nodes at
 probe
Message-ID: <20261119114218.0a044688@bootlin.com>
In-Reply-To: <20261119091245.2c6c6528@bootlin.com>
References: <20261109140916.90625-1-herve.codina@bootlin.com>
	<20261109140916.90625-5-herve.codina@bootlin.com>
	<sashiko-outbox-205130@kernel.org>
	<20261119091245.2c6c6528@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On Thu, 19 Nov 2026 09:12:45 +0100
Herve Codina <herve.codina@bootlin.com> wrote:

> Hi,
> 
> On Mon, 09 Nov 2026 14:50:21 +0000
> sashiko-bot@kernel.org wrote:
> 
...

> > commit 7ba99d9ea04b1e1a29eebc1e1525489b300fe107
> > Author: Herve Codina <herve.codina@bootlin.com>
> > 
> > bus: simple-pm-bus: Populate child nodes at probe
> > 
> > This commit updates simple_pm_bus_probe() to populate child devices for
> > transparent bus matches (such as simple-bus, simple-mfd, isa, and
> > arm,amba-bus) during probe, and skips runtime PM calls in
> > simple_pm_bus_depopulate() when runtime PM is not enabled.
> > 
> > [Severity: Low]
> > In the commit message, this patch fixes the probe behavior for bus-only
> > devices where returning 0 without populating children caused
> > device_links_driver_bound() to create wrong fw_devlinks. Should the commit
> > message include a Fixes tag for 98e96cf80045 ("drivers: bus: simple-pm-bus:
> > Add support for probing simple bus only devices")?  
> 
> The commit 98e96cf80045 didn't introduce the issue nor change the behavior.
> The problem is there from the beginning. For fw_devlink child devices should
> be populated by at parent (bus) probe(). bus-only devices such as simple-bus
> can populate devices recursively skipping the parent bus probe() step.
> I don't see an obvious commit to point for a Fixes tag and so I don't plan
> to add a Fixes tag on the next iteration.

Actually found a commit for Fixes tag:
  628b8ca3e915 ("bus: simple-pm-bus: Remove child devices when the bus is unbound")

Will add the Fixes tag with this one in the next iteration.

Best regards,
Hervé
