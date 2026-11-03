Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793743738;
	b=bHgTCxbcAYQ4/iit9nVYTExvf9IARw6VmIO3OgT4Ba9ipHdFiXV7+uDM5W5XmytzPbtm
	 FdDvaG1n0yND44PHu+gXgQMdI6N+FPVuyrdt3dn2FNNqrxYfr2XsjH6BJfdiydI8MqtcX
	 kr4oVU3RC34XQWDbmx6ZQ+IPajs/e3Dyo+uWTsryJF0vFJdTAWKBs8asg7QU0WR/LqDSy
	 DYheEAtSra/gGykofoQLqQ0ya0AbYgXvimPtFgBjugCBIWdXWrj1vstz87EHHa9UN+Zfy
	 sTsYwXzTKQZwBFiO6M9qU7X61esgAQRqbCBtmmS/3cJ+GFG2tv/4BzrDx0PKuFfOQjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793743738;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=CIGQM0n1sPM7KpMmaIGQBURZiqcgzm+MlQvRxbkBPq8=;
	b=l/VMOaOibPTvMeNS/sXA4npPcPH4lSywIIU7YmKkBz1hcoFCYa7T+saKXhsLWseDanzn
	 bS0fqL6Ds0Hqp7RIK8xLvmlZeG3nBavGNrO+t+8tmL3pgm7E9hGKLJAwnSHL/xxRq/TUw
	 h3QrFnBtCGWwHR03pK9iSGOr97oQI4pstWdHEX3oXpLj0hm0Bb9+HFVGAiXZwh1mWgD2t
	 BZ+6E0QggeATqinGJ9qVlcjeTHjvPFYURmwXUijvtJa+/1/3ktECIPJpM3YqpPsAFo6k1
	 D7JQLMZoXDtZSZvUiotVF/HvZBx/BjSstxZcyhiWhslzKkNznRA8/t6ojjQsFf4OOlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847DF606A324
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 22:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 847DF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id DA36C92009E; Tue,  3 Nov 2026 23:08:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id D407C92009C;
	Tue,  3 Nov 2026 22:08:55 +0000 (GMT)
Date: Tue, 3 Nov 2026 22:08:55 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: sashiko-reviews@lists.linux.dev, Jiri Slaby <jirislaby@kernel.org>, 
    Hugo Villeneuve <hvilleneuve@dimonoff.com>, Kees Cook <kees@kernel.org>, 
    Lukas Wunner <lukas@wunner.de>, John Ogness <john.ogness@linutronix.de>, 
    Jiayuan Chen <jiayuan.chen@shopee.com>, Gerhard Engleder <eg@keba.com>, 
    linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] serial: core: Don't clobber the baud rate on
 hangup via B0
In-Reply-To: <2026101335-broadside-register-8a53@gregkh>
Message-ID: <alpine.DEB.2.21.2611030039070.15685@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2610120150230.55767@angie.orcam.me.uk> <alpine.DEB.2.21.2610120231550.55767@angie.orcam.me.uk> <sashiko-outbox-167551@kernel.org> <alpine.DEB.2.21.2610121325280.55767@angie.orcam.me.uk>
 <2026101335-broadside-register-8a53@gregkh>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 13 Oct 2026, Greg Kroah-Hartman wrote:

> > > This calls into uart_get_baud_rate() without holding port->mutex. A
> > > concurrent tcsetattr() and atomic console write can trigger an unprotected
> > > data race on port->hup_speed. A torn read or write on this variable could
> > > yield a garbage baud rate and lead to hardware misconfiguration.
> > 
> >  This seems like the only exception across all the serial drivers in the 
> > use of uart_get_baud_rate().  Since this is always called to restore the 
> > most recent baud rate setting only, perhaps the path of least resistance 
> > would be just to refrain from updating port->hup_speed if called with the 
> > port lock held?
> > 
> >  Otherwise it would require rewriting all the 60+ call sites to use the 
> > port lock to guard the whole sequence from a call to uart_get_baud_rate() 
> > through to the write of the settings obtained to the port registers, which 
> > seems an overkill to me and asking for trouble with some odd hardware.
> > 
> >  I'll experiment with the idea outlined or will be happy with any hints 
> > otherwise.
> 
> That idea seems sane, thanks for working on this.

 Thanks for the words of appreciation, so scarce these days.

 Relying on the lock state has turned out infeasible, since there is no 
locking actually done on UP-nondebug, cf. spin_is_locked(), and we need to 
guarantee UP atomicity WRT NMI contexts.

 So I have made it an explicit extra parameter to uart_get_baud_rate(), 
renamed the function and added a static inline wrapper to keep existing 
driver code short and compatible.

 I've posted v3 now, at 
<https://lore.kernel.org/r/alpine.DEB.2.21.2611030057510.15685@angie.orcam.me.uk/>.

  Maciej
