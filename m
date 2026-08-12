Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BAF39447C
	for <sashiko-reviews@lists.linux.dev>; Wed, 12 Aug 2026 06:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786517026; cv=none; b=p0ZxWaz6jnfywa1YeK2ER/afvRW5lgLi9m3vkRIxkZ/IRm4PfiiZ7A+PZ3CJ1McFcckCNsrCrl+58pEqDT4B12ZxLrc/nivGO3DFUmeQt64X7+24dcTAb7nGdbj44VEqlEzQKqNx1yqu/er9g9EYAa57yKjkAh4RGlLHom8sm64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786517026; c=relaxed/simple;
	bh=HO3kgb3Rzg6mpaKRnBriWOvYD+DVM7tffSSfpsRtkHY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VAuHprPRdnTJG45brsUjjfUtS7O0SY+3YStmwGi8xRLixnGQJmHFtSPa8gWCARCcQ1Qfzhz4xVu05+9zt0Skc+WE4RiH6pWty+mSkBJW2YXdPXy5CR3wVn3Bj1Tt++7gZhdwxfBLgv5wey+uVe+/2pwg/W01QxWU72JD8WNN6a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=LrudRtpF; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="LrudRtpF"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wu2gb-0000000CWme-0tKF
	for sashiko-reviews@lists.linux.dev;
	Wed, 12 Aug 2026 08:43:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=AfXOw53sapozXifXpKm30CeEsqFjzfBau8Gt2HT8J98=; t=1786517017; x=1787726617; 
	b=LrudRtpFlk3LwNGuFwus73QLZh8ADxvrLtnKKXet1VeIb8qaHfa4gVlDNybaN5vu9tZoH3NW2Oc
	hhf/aXvIJAnT70ynsdWUq+sCCtIVfxbunMeTldzuqWivwRWM3w1Y6lf/Uxr3CQIofrW9ULDEU7oIX
	Id+jmhITcCCxV/3NcdIHe/wqfP2SwKLT17io8S9ThXuu0cyxR/HBsJCAzMu+/qfFOhPWzHjn6js98
	k4dpcRw+aZXG7F576UDsFJp+hanItjmR8fd2dJoADVB5kfqoLNJp2J/a2CAD/Hpd4pli250aJsiJt
	Ed0wDoFLGSVIxx64a8W2OdwCUzn2mqms19bw==;
Date: Wed, 12 Aug 2026 08:43:20 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev,
 linux-leds@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH v3] leds: is31fl319x: modernize registration
Message-ID: <20260812084320.21a7341a@kemnade.info>
In-Reply-To: <20260811185127.GW2869284@google.com>
References: <20260804-led-modern-v3-1-297720eec19f@kemnade.info>
	<20260804135515.5DBFC1F000E9@smtp.kernel.org>
	<20260804164101.43753f1b@kemnade.info>
	<20260806104525.GC10716@google.com>
	<20260806135550.2d57682c@kemnade.info>
	<20260811185127.GW2869284@google.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 11 Aug 2026 19:51:27 +0100
Lee Jones <lee@kernel.org> wrote:

> On Thu, 06 Aug 2026, Andreas Kemnade wrote:
> 
> > On Thu, 6 Aug 2026 11:45:25 +0100
> > Lee Jones <lee@kernel.org> wrote:
> >   
> > > On Tue, 04 Aug 2026, Andreas Kemnade wrote:
> > >   
> > > > On Tue, 04 Aug 2026 13:55:14 +0000
> > > > sashiko-bot@kernel.org wrote:
> > > >     
> > > > > > leds: is31fl319x: modernize registration      
> > > > > 
> > > > > [Severity: Low]
> > > > > This isn't a bug, but should the description after the subsystem prefix be
> > > > > capitalized? The LED subsystem guidelines recommend formatting commit messages
> > > > > as "leds: <Driver>: <Capitalized description>".    
> > > > 
> > > > 
> > > > ~/linux$ grep -R 'leds: <Driver>: <Capitalized description>"' Documentation/
> > > > ~/linux$ ls Documentation/leds/
> > > > index.rst                  leds-lp5521.rst      leds-sc27xx.rst
> > > > leds-blinkm.rst            leds-lp5523.rst      leds-st1202.rst
> > > > leds-cht-wcove.rst         leds-lp5562.rst      ledtrig-oneshot.rst
> > > > leds-class-flash.rst       leds-lp55xx.rst      ledtrig-transient.rst
> > > > leds-class-multicolor.rst  leds-lp5812.rst      ledtrig-usbport.rst
> > > > leds-class.rst             leds-mlxcpld.rst     uleds.rst
> > > > leds-el15203000.rst        leds-mt6370-rgb.rst  well-known-leds.txt
> > > > leds-lm3556.rst            leds-qcom-lpg.rst
> > > > leds-lp3944.rst            leds-s2m-rgb.rst
> > > > 
> > > > nothing look like special guidelines for the system. I do not want to
> > > > see such comments without a reference.
> > > > Also MAINTAINERS does not show any additional policy for the LED subsystem.    
> > > 
> > > `git log --oneline -- <subsystem>` is your friend.
> > >   
> > That is looking at common practice, not guidelines, which is of course
> > often a good idea.
> > 
> > So Sahiko is hallucinating about non-existant guidelines which
> > cannot be referenced of course. Well, at least it gives quite an amount of
> > useful hintse.  
> 
> It's not hallucinating, I put it there. =:-)
> 
> https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/leds.md
> 
> Specifically:
> 
> https://github.com/sashiko-dev/sashiko/blob/main/third_party/prompts/kernel/subsystem/leds.md?plain=1#L8
> 
So, that is another repository of another project. That is not an
intuitive place to look at. So I would expect to see at least some pointer
in that direction in the first place.

Regards,
Andreas
PS: you have seen the corrected v4?
