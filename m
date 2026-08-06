Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48B5477995
	for <sashiko-reviews@lists.linux.dev>; Thu,  6 Aug 2026 11:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786017436; cv=none; b=bcbePcFC7x8pMe8hJRpx3FtCJtsjeuvqtzVCWKZP+rkFr0wAGQLl1ODPDCe0u8lbKQbxgSL9yYQ4GC6CfjKobidfbx9+BlJ+t89EIrBz9fpPkk+UkwBuAGvKMIGn9M68mscAN7Vv2KcK8Bl6iRJ2W+RsTKYBOfWFeqr2wKjpDoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786017436; c=relaxed/simple;
	bh=u9DsFEropX/azWpQq0ZKgp0gvOe+LMuO2ny55HM6RWM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NLRzLnspRLlfr3yvs0fxS3rAzEj0EHgipXM7CqCAsAiEfM/vTHFH2xd44iiFale/m/IjYNL2hXU+9jBZkl9f/vrDRrLzlFJPiVnxYkEhoe/a5nPitVqKAt6xHmcm16hPSbgY6ckhtjRDWF50Pjt8ZBZmcl1vGox0L9Elc6mxyQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=HKbK/KKH; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="HKbK/KKH"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wrwie-00000001ic6-3DbK
	for sashiko-reviews@lists.linux.dev;
	Thu, 06 Aug 2026 13:57:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=mzqiDwx/X6pLHYrTCt+QZwp3gtizoxKhbLnGniWuVAw=; t=1786017424; x=1787227024; 
	b=HKbK/KKHibqhZ1ognRFH6H1NbcqBRy8a4o9aqLbXn14tHdhzxl53KcLd/gskBjMGB19/uArW2zf
	hQdecVOONfQNydYsi5fGTz7exxUIeA1v8DhIzm14egQVsgQ4ZBG2G9MEezsTDXAcNmlrjD0XSWujO
	FnfIVQ7btE2Hm+6RcoaGgU0zpGvtoNaXFv197oEG6Xi8VRky5jcyuCpKgNcMU6BlaWoFg9UHvJISA
	NQojMi6bEyt9p7GCW7uWvZbABIPnSuRS4DWwXdcjri8aXuZyZXQwaobM72yr9CldhjlFggb4LvXBv
	lwqhJvit7mXRA6Dfahl4IRloxZbEt3w9cjZg==;
Date: Thu, 6 Aug 2026 13:55:50 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 linux-leds@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3] leds: is31fl319x: modernize registration
Message-ID: <20260806135550.2d57682c@kemnade.info>
In-Reply-To: <20260806104525.GC10716@google.com>
References: <20260804-led-modern-v3-1-297720eec19f@kemnade.info>
	<20260804135515.5DBFC1F000E9@smtp.kernel.org>
	<20260804164101.43753f1b@kemnade.info>
	<20260806104525.GC10716@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 6 Aug 2026 11:45:25 +0100
Lee Jones <lee@kernel.org> wrote:

> On Tue, 04 Aug 2026, Andreas Kemnade wrote:
> 
> > On Tue, 04 Aug 2026 13:55:14 +0000
> > sashiko-bot@kernel.org wrote:
> >   
> > > > leds: is31fl319x: modernize registration    
> > > 
> > > [Severity: Low]
> > > This isn't a bug, but should the description after the subsystem prefix be
> > > capitalized? The LED subsystem guidelines recommend formatting commit messages
> > > as "leds: <Driver>: <Capitalized description>".  
> > 
> > 
> > ~/linux$ grep -R 'leds: <Driver>: <Capitalized description>"' Documentation/
> > ~/linux$ ls Documentation/leds/
> > index.rst                  leds-lp5521.rst      leds-sc27xx.rst
> > leds-blinkm.rst            leds-lp5523.rst      leds-st1202.rst
> > leds-cht-wcove.rst         leds-lp5562.rst      ledtrig-oneshot.rst
> > leds-class-flash.rst       leds-lp55xx.rst      ledtrig-transient.rst
> > leds-class-multicolor.rst  leds-lp5812.rst      ledtrig-usbport.rst
> > leds-class.rst             leds-mlxcpld.rst     uleds.rst
> > leds-el15203000.rst        leds-mt6370-rgb.rst  well-known-leds.txt
> > leds-lm3556.rst            leds-qcom-lpg.rst
> > leds-lp3944.rst            leds-s2m-rgb.rst
> > 
> > nothing look like special guidelines for the system. I do not want to
> > see such comments without a reference.
> > Also MAINTAINERS does not show any additional policy for the LED subsystem.  
> 
> `git log --oneline -- <subsystem>` is your friend.
> 
That is looking at common practice, not guidelines, which is of course
often a good idea.

So Sahiko is hallucinating about non-existant guidelines which
cannot be referenced of course. Well, at least it gives quite an amount of
useful hintse.

Regards,
Andreas
