Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793840592;
	b=mjObTX8CxnSJA36ZV+aMxlUsY+Giak7TUe1QW3gGTQy4aifFVDqcPbnLijn52t5wWb7A
	 qmbYMSl6nsWMk3CRrp6bp8TJBe7oIYF/MohOf6yPihrAXpBz2d5D8rTD9ixkAS4QEMnkF
	 a31qlXlEXLVyS0/hUuUIVPOmuG5YGtk/vyysywiWYWFeRL3VWo/0+COKMQUROGQiBH6Bt
	 Ra9ITjoTSr9eWfYGqXdJ8n98T7EuLuxR5a9kV2ZfwPbGX0w9KQpd26NF0awUkowWfcJXo
	 Cxbkyt1eJNargp8VFu70WolplmMEC6CZfDcx5kIANMc2w3XTfbxnYRaR6dtPwqJU9rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840592;
	h=DMARC-Filter:Received:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:User-Agent:MIME-Version:Content-Type;
	bh=OuNd+pKBbVN1S0Cs6wrgHCzUKej80GAQlnUey2/zlUk=;
	b=Gh4K/luKXyumEyvbL3J4uIm5Aa26z27yR5SjmhzirlLpPUAqjjomwpa34CUXubWqJZyg
	 LPKG89funDN19b+2Nudd0JrGBb1Ot8FT77opTUgIEac9giWj3MtQUsDeDeEQuGUNWj6jt
	 +JK1PSYkq+O62aXiEznlSaW0QJoaisUPDEgbwNGgiQyTDopVhRg1OWLWDHYFz4jJfeIu+
	 Jr5JDQ7i8KkXEQj+xKu8/DXCESZSpYttgzEzPnS3zG1WoTmA2YyLCRN6O2nmgHWnYYgHs
	 AV4AUtdYtJeVquWDxeLBN8TwjB7Rnqrd037nGNQ2m53v4k7TGYO7x/MwLeVOLaT5g6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=orcam.me.uk;
	spf=none smtp.mailfrom=orcam.me.uk;
	arc=none smtp.remote-ip=78.133.224.34
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7FC606A32C
	for <sashiko-reviews@lists.linux.dev>; Thu,  5 Nov 2026 01:03:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E7FC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 038B292009E; Thu,  5 Nov 2026 02:03:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id F061792009C;
	Thu,  5 Nov 2026 01:03:08 +0000 (GMT)
Date: Thu, 5 Nov 2026 01:03:08 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>, sashiko-reviews@lists.linux.dev
cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Crescent Hsieh <crescentcy.hsieh@moxa.com>, 
    Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
    Johan Hovold <johan@kernel.org>, John Ogness <john.ogness@linutronix.de>, 
    Karl Mehltretter <kmehltretter@gmail.com>, linux-kernel@vger.kernel.org, 
    linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 2/2] serial: core: Don't clobber the baud rate on
 hangup via B0
In-Reply-To: <sashiko-outbox-196102@kernel.org>
Message-ID: <alpine.DEB.2.21.2611050052250.6502@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2611030057510.15685@angie.orcam.me.uk> <alpine.DEB.2.21.2611032050590.15685@angie.orcam.me.uk> <sashiko-outbox-196102@kernel.org>
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

On Tue, 3 Nov 2026, sashiko-bot@kernel.org wrote:

> [Severity: Low]
> Does Documentation/driver-api/serial/driver.rst also need to be updated for
> this rename? It still lists uart_get_baud_rate under the kernel-doc
> identifiers for drivers/tty/serial/serial_core.c:

 I missed that, will update in v4.

> [Severity: High]
> What happens in uart_get_baud_rate_save() when B0 is requested and
> port->hup_speed is outside the [min, max] range passed by the caller?

 Failure return discussed along with 1/2.  For B0 we'd preferably not poke 
at the BRG setting programmed in hardware in the first place, but I find 
that infeasible maintenance-wise for the huge set of UART drivers we have.

 Any thoughts otherwise, anyone?

> [Severity: Medium]
> Can saving port->hup_speed inside uart_get_baud_rate_save() also break B0
> hangup in drivers/tty/serial/dz.c when an unsupported baud rate within
> [50, 9600] is requested?

 That needs to be handled in the driver.  I'll have a look, especially as 
I own it anyway and have the hardware too.

  Maciej
